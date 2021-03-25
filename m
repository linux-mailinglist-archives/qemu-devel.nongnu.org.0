Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E66D03499B7
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 19:52:57 +0100 (CET)
Received: from localhost ([::1]:51094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPV6H-0004tn-0H
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 14:52:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lPV4O-0003pC-1N
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 14:51:00 -0400
Received: from mx2.suse.de ([195.135.220.15]:45294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lPV4L-0003rw-Ns
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 14:50:59 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 46132ACFC;
 Thu, 25 Mar 2021 18:50:56 +0000 (UTC)
Subject: Re: [RFC v11 28/55] target/arm: refactor exception and cpu code
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210323151749.21299-1-cfontana@suse.de>
 <20210323154639.23477-21-cfontana@suse.de>
 <47ea27b1-a11f-b10d-a084-0f7698691a6b@linaro.org>
 <519488da-3ce9-3fe9-d4a2-4bc76e2519b6@suse.de>
 <5d76557a-c3b8-ac56-74cf-dc795286e696@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <1dca7189-5a9f-fb08-31e3-72b2e50cbd82@suse.de>
Date: Thu, 25 Mar 2021 19:50:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <5d76557a-c3b8-ac56-74cf-dc795286e696@linaro.org>
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

On 3/25/21 7:43 PM, Richard Henderson wrote:
> On 3/25/21 5:59 AM, Claudio Fontana wrote:
>>> Isn't tcg/tcg-* redundant?
>>
>> I considered that, and at some point I had "cpu.c" for x86 too. After working on it for a while, I noticed how
>> it got really confusing in practice to have files called just "cpu.c" when working on them, just too many files are called "cpu.c". It was confusing.
>>
>> I also like the extra emphasis on the accel for this:
>>
>> kvm/kvm.c
>> kvm/kvm-cpu.c
>> kvm/kvm-stub.c
>>
>> tcg/tcg-cpu.c
>> tcg/tcg-stub.c
> 
> But then you go and invent
> 
> cpu-sve.c
> kvm/cpu-sve.c
> tcg/cpu-sve.c
> 
> etc.  So, please make up your mind.
> 



Inconsistencies are all over already, and the two are very unrelated things.

tcg-cpu comes from accel-cpu, where accel- is replaced by tcg- in this case.

cpu-sve is a specialization of "cpu" where we currently put all the properties and the like.

cpu-sve-props is probably a better name.




