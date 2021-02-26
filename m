Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAF4325FEE
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 10:24:21 +0100 (CET)
Received: from localhost ([::1]:51736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFZMB-0001x3-KT
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 04:24:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lFZKm-0001BU-Em
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 04:22:52 -0500
Received: from mx2.suse.de ([195.135.220.15]:47050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lFZKk-00064e-Fv
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 04:22:52 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B349DAC6E;
 Fri, 26 Feb 2021 09:22:47 +0000 (UTC)
Subject: Re: [PATCH v22 16/17] i386: gdbstub: only write CR0/CR2/CR3/EFER for
 SOFTMMU
To: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210224133428.14071-1-cfontana@suse.de>
 <20210224133428.14071-17-cfontana@suse.de>
 <c7a4c597-6864-1ce6-b759-d7ec531eea67@linaro.org>
 <efd0679f-5504-dee7-9bcf-8af0c4bed895@suse.de>
 <17092d2c-9f40-5d34-b91e-1324434feb48@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <870d6e44-da99-d962-2ce5-821c06a2b04d@suse.de>
Date: Fri, 26 Feb 2021 10:22:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <17092d2c-9f40-5d34-b91e-1324434feb48@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.435,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/26/21 5:05 AM, Richard Henderson wrote:
> On 2/25/21 12:55 AM, Claudio Fontana wrote:
>> On 2/25/21 5:19 AM, Richard Henderson wrote:
>>> On 2/24/21 5:34 AM, Claudio Fontana wrote:
>>>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>>>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>>>> ---
>>>>  target/i386/gdbstub.c | 16 ++++++++++++++++
>>>>  1 file changed, 16 insertions(+)
>>>>
>>>> diff --git a/target/i386/gdbstub.c b/target/i386/gdbstub.c
>>>> index 41e265fc67..9f505d6ee3 100644
>>>> --- a/target/i386/gdbstub.c
>>>> +++ b/target/i386/gdbstub.c
>>>> @@ -383,26 +383,38 @@ int x86_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
>>>>  
>>>>          case IDX_CTL_CR0_REG:
>>>>              if (env->hflags & HF_CS64_MASK) {
>>>> +#ifdef CONFIG_SOFTMMU
>>>>                  cpu_x86_update_cr0(env, ldq_p(mem_buf));
>>>> +#endif
>>>>                  return 8;
>>>>              }
>>>> +#ifdef CONFIG_SOFTMMU
>>>>              cpu_x86_update_cr0(env, ldl_p(mem_buf));
>>>> +#endif
>>>>              return 4;
>>>
>>> It would be nice to do all these with rather less ifdefs.
>>> And let's correctly use !CONFIG_USER_ONLY.
>>>
>>> Without adding more stubs, may I suggest a new helper:
>>>
>>> static target_ulong read_long_cs64(env, buf, len)
>>> {
>>> #ifdef TARGET_X86_64
>>>     if (env->hflags & HF_CS64_MASK) {
>>>         *len = 8;
>>>         return ldq_p(buf);
>>>     }
>>> #endif
>>>     *len = 4;
>>>     return ldl_p(buf);
>>> }
>>
>> in the current code the
>>
>> #ifdef TARGET_x86_64 is not there. Is it safe to use everywhere?
> 
> It'll never be set unless TARGET_X86_64.  Also, it *is* used in other tests for

Right, there might be a reason for it (some instances are with the #ifdef TARGET_x86_64, some without)..?

> the mask.  I do wonder if we should have CS64_MASK defined to 0 for
> !TARGET_X86_64, so that (X & 0) -> 0.> 
>> should we do a matching:
>>
>> static int gdb_read_reg_cs64(CPUX86State *env, GByteArray *buf, target_ulong val)
>> {
>>     if ((env->hflags & HF_CS64_MASK) || GDB_FORCE_64) {
> 
> I should think so, except...  that FORCE_64 makes the previous test useless.  I
> have no idea what's going on here.

#ifdef TARGET_X86_64
#define GDB_FORCE_64 1
#else
#define GDB_FORCE_64 0
#endif

So for TARGET_X86_64, GDB_FORCE_64 is always 1.

Maybe the flags is there for when a cpu switches between modes? (32vs64 bit)?

I'll make a conservative patch that does not risk changing the behavior (at least in the intention).

> 
> 
> r~
> 


