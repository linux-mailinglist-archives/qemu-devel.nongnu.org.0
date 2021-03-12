Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45674339634
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 19:22:49 +0100 (CET)
Received: from localhost ([::1]:53746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKmQy-0002xB-97
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 13:22:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lKlWP-0007kb-BO
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:24:21 -0500
Received: from mx2.suse.de ([195.135.220.15]:33998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lKlWN-0000eX-EB
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:24:21 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 36C49AF4D;
 Fri, 12 Mar 2021 17:24:08 +0000 (UTC)
Subject: Re: all class init functions for all types in QEMU are called in
 select_machine(). Expected?
To: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <bdc8dbaf-8d63-833a-3e57-7e823a321486@suse.de>
 <a81c0a8d-af3c-4b40-bcb4-9b120b5eee93@redhat.com>
 <ec7f83ae-8529-3a0e-4b00-73c856b28a3e@suse.de>
 <be88d88a-dd9d-547d-9f3d-7444f0f8bbc6@redhat.com>
 <3b7c6a4e-c191-063c-affa-0e179227a633@suse.de>
 <26c2b88b-4c9e-09a0-a1c0-350a01e9a697@redhat.com>
 <d66078f1-9fa0-c3ed-d54c-3d3ada2027e5@suse.de>
 <683d1ccc-503d-3218-2539-a3ed48fee5fb@redhat.com>
 <8ca3a983-05ad-a0de-31e9-65b6c41a2b4c@suse.de>
 <6f2e5a50-c548-28c5-1ce0-e583bf90eaf1@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <e0c5eeaa-55f5-80e6-5cac-9717159f3903@suse.de>
Date: Fri, 12 Mar 2021 18:24:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <6f2e5a50-c548-28c5-1ce0-e583bf90eaf1@redhat.com>
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

On 3/12/21 6:04 PM, Paolo Bonzini wrote:
> On 12/03/21 14:40, Claudio Fontana wrote:
>>      /*
>>       * double dispatch. The first callback allows the accel cpu
>>       * to run initializations for the CPU,
>>       * the second one allows the CPU to customize the accel cpu
>>       * behavior according to the CPU.
>>       *
>>       * The second is currently only used by TCG, to specialize the
>>       * TCGCPUOps depending on the CPU type.
>>       */
>>      cc->accel_cpu = accel_cpu;
>>      if (accel_cpu->cpu_class_init) {
>>          accel_cpu->cpu_class_init(cc);
>>      }
>>      if (cc->init_accel_cpu) {
>>          cc->init_accel_cpu(accel_cpu, cc);
>>      }
>> }
>>
>> .. but maybe this is premature, and should wait for actual users of this beyond TCG on ARM?
> 
> I prefer to single out TCG and have the call in cpu_class_init.  The 
> idea of double dispatch (as opposed to an if/else chain with checks on 
> the class of the argument) is that the first caller uses different 
> "method names" to tell its type name to the target.
> 
> See for example 
> https://en.wikipedia.org/wiki/Double_dispatch#Example_in_Ruby.
> 
> Paolo
> 

Ah, just saw this. I already sent the series, but we can rework and rethink this.

Ciao, thanks,

Claudio

