Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 505DB349157
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 13:01:16 +0100 (CET)
Received: from localhost ([::1]:34114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPOfq-0005aA-RO
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 08:01:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lPOeD-00052N-KU
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 07:59:33 -0400
Received: from mx2.suse.de ([195.135.220.15]:60850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lPOeC-00079E-0s
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 07:59:33 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 12F46AD80;
 Thu, 25 Mar 2021 11:59:30 +0000 (UTC)
Subject: Re: [RFC v11 28/55] target/arm: refactor exception and cpu code
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210323151749.21299-1-cfontana@suse.de>
 <20210323154639.23477-21-cfontana@suse.de>
 <47ea27b1-a11f-b10d-a084-0f7698691a6b@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <519488da-3ce9-3fe9-d4a2-4bc76e2519b6@suse.de>
Date: Thu, 25 Mar 2021 12:59:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <47ea27b1-a11f-b10d-a084-0f7698691a6b@linaro.org>
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/24/21 11:29 PM, Richard Henderson wrote:
> On 3/23/21 9:46 AM, Claudio Fontana wrote:
>> move exception code out of tcg/
>> as we need part of it for KVM too.
>>
>> put the exception code into separate cpu modules as appropriate,
>> including:
>>
>> cpu-sysemu.c
>> tcg/tcg-cpu.c
>> tcg/sysemu/tcg-cpu.c
>>
>> to avoid naming confusion with the existing cpu_tcg.c,
>> containg cpu models definitions for 32bit TCG-only cpus,
>> rename this file as tcg/tcg-cpu-models.c
> 
> Obviously all of this should not be done in one step.


Ok will work on it.


> 
> Isn't tcg/tcg-* redundant?


I considered that, and at some point I had "cpu.c" for x86 too. After working on it for a while, I noticed how
it got really confusing in practice to have files called just "cpu.c" when working on them, just too many files are called "cpu.c". It was confusing.

I also like the extra emphasis on the accel for this:

kvm/kvm.c
kvm/kvm-cpu.c
kvm/kvm-stub.c

tcg/tcg-cpu.c
tcg/tcg-stub.c


Thanks,

Claudio

