Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E23353189C6
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 12:49:40 +0100 (CET)
Received: from localhost ([::1]:50164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAATb-0004PN-OD
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 06:49:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lAASa-0003si-7E
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 06:48:36 -0500
Received: from mx2.suse.de ([195.135.220.15]:55332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lAASW-0003av-R9
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 06:48:35 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 263FDAC69;
 Thu, 11 Feb 2021 11:48:31 +0000 (UTC)
Subject: Re: [RFC v17 10/14] i386: split tcg btp_helper into softmmu and user
 parts
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210210152859.25920-1-cfontana@suse.de>
 <20210210152859.25920-11-cfontana@suse.de> <87blcrx4t3.fsf@linaro.org>
 <bffb363e-6141-9969-0c4b-f3ea31d09a28@suse.de>
 <79bbf2f3-1345-8102-eab2-b5e8c2528c68@amsat.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <8df76510-3478-f315-bc84-bee6ddebdaa5@suse.de>
Date: Thu, 11 Feb 2021 12:48:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <79bbf2f3-1345-8102-eab2-b5e8c2528c68@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.211,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/11/21 11:39 AM, Philippe Mathieu-Daudé wrote:
> On 2/11/21 11:07 AM, Claudio Fontana wrote:
>> On 2/10/21 5:28 PM, Alex Bennée wrote:
>>>
>>> Claudio Fontana <cfontana@suse.de> writes:
>>>
>>> s/btp/bpt/ in subject line...
>>>
>>>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>>>> ---
>>>>  target/i386/tcg/helper-tcg.h                 |   3 +
>>>>  target/i386/tcg/bpt_helper.c                 | 275 -----------------
>>>>  target/i386/tcg/softmmu/bpt_helper_softmmu.c | 293 +++++++++++++++++++
>>>>  target/i386/tcg/user/bpt_helper_user.c       |  33 +++
>>>
>>> So I'm not sure about totally mirroring the file names in softmmu/user
>>> subdirs. I can see it makes sense in some cases where there are genuine
>>> functional differences between the two. However for everything that
>>> exists only for one mode we might as well throw the stubs into one file.
>>> Maybe target/tcg/user/stubs.c in this case?
>>
>>
>> Hi Alex, I think you are right, repeating the _softmmu , _user seems too much.
>>
>> On similar things in the past Paolo mentioned that he favours simpler naming.
>>
>> In this case I could do for example:
>>
>> target/i386/tcg/seg_helper.c          - seg helper common parts
>> target/i386/tcg/softmmu/seg_helper.c  - seg helper softmmu-only code
>> target/i386/tcg/user/seg_helper.c     - seg helper user-only code
> 
> What about:
> 
>   target/i386/tcg/seg_helper.c          - seg helper common parts
>   target/i386/tcg/seg_helper_softmmu.c  - seg helper softmmu-only code
>   target/i386/tcg/seg_helper_user.c     - seg helper user-only code

Hi Philippe,

I tried this one in particular, it looked a bit confusing and cluttered to me when looking at the overall result:

$ ls
bpt_helper.c
bpt_helper_softmmu.c
bpt_helper_user.c
cc_helper.c
cc_helper_softmmu.c
cc_helper_template.h
cc_helper_user.c
excp_helper.c
excp_helper_softmmu.c
excp_helper_user.c
fpu_helper.c
fpu_helper_softmmu.c
fpu_helper_user.c
helper-tcg.h
int_helper.c
int_helper_softmmu.c
int_helper_user.c
mem_helper.c
mem_helper_softmmu.c
mem_helper_user.c
meson.build
misc_helper.c
misc_helper_softmmu.c
misc_helper_user.c
mpx_helper.c
mpx_helper_softmmu.c
mpx_helper_user.c
seg_helper.c
seg_helper.h
seg_helper_softmmu.c
seg_helper_user.c
tcg-cpu.c
tcg-cpu.h
tcg-cpu-softmmu.c
tcg-cpu-user.c
tcg-stub.c
translate.c


> 
>> For the parts that are just stubs really (like here bpt for user), I would like to see if I can remove them completely if possible..
> 
> It is probably worth spend time on this first. If the helpers are not
> needed, why do we generate the code in the first place?

Worth a good look.

> 
>>
>> Overall though, I am wondering whether this kind of change (extended more to the rest of the target/ code) is an interesting approach,
>> or does it make harder to work with the *_helper code, as people have to chase down more files?
>>
>>
>> Thank you!
>>
>> Claudio

Thanks,

Claudio

