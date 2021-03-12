Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB46338A5E
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 11:39:09 +0100 (CET)
Received: from localhost ([::1]:59002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKfCG-0003Pp-PT
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 05:39:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lKeyw-00085R-3q
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:25:22 -0500
Received: from mx2.suse.de ([195.135.220.15]:50430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lKeyp-00084a-IO
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:25:21 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 56951AFA0;
 Fri, 12 Mar 2021 10:25:13 +0000 (UTC)
Subject: Re: all class init functions for all types in QEMU are called in
 select_machine(). Expected?
To: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <bdc8dbaf-8d63-833a-3e57-7e823a321486@suse.de>
 <a81c0a8d-af3c-4b40-bcb4-9b120b5eee93@redhat.com>
 <ec7f83ae-8529-3a0e-4b00-73c856b28a3e@suse.de>
 <be88d88a-dd9d-547d-9f3d-7444f0f8bbc6@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <3b7c6a4e-c191-063c-affa-0e179227a633@suse.de>
Date: Fri, 12 Mar 2021 11:25:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <be88d88a-dd9d-547d-9f3d-7444f0f8bbc6@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/12/21 11:07 AM, Paolo Bonzini wrote:
> On 12/03/21 10:58, Claudio Fontana wrote:
>> Not really, but I have been using the accel class init function on x86 to register the TCG OPS,
>>
>> and this instead requires a bit more thought for ARM,
>>
>> because we currently register for the ARM M Profile the TCG Ops at arm_v7m_class_init time,
>> which is called already at select_machine() time,
>>
>> so when we select the accelerator, and we call the tcg_cpu_class_init, we run the risk of overriding the existing tcg_ops
>>
>> Ideas? Looks horrible?
> 
> Not horrible, but wrong.  The class_init function must be idempotent: 
> classes have no side effect until they're instantiated (and even then, 
> usually we delay that to later, e.g. realized for devices or complete 
> for user-creatable objects).
> 
> Why can't you register ops in the machine init function for the accelerator?
> 
> Paolo
> 

We can register them from there if needed I think,,
but where ever we do it, we still have to point to the one set of ops or the other, depending on the cpu model that is finally chosen.

So when we attach the tcg cpu accelerator object to the cpu, we currently should check which cpu it is, and behave accordingly.

Maybe this is better? Ie, not set the tcg ops in different places (in the v7m cpu class init and in the tcg cpu accel init),

but rather set them just in a single place, when we attach the accel cpu object,
checking which cpu profile it is somehow (TBD), and then behave accordingly?

THanks,

Claudio






