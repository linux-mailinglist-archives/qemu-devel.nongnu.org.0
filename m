Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2C02D7DD4
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 19:15:41 +0100 (CET)
Received: from localhost ([::1]:39148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knmxA-00082L-L7
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 13:15:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1knmGL-0000E1-MQ
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:31:25 -0500
Received: from mx2.suse.de ([195.135.220.15]:33260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1knmGJ-00021K-EJ
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:31:25 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8C334ACF1;
 Fri, 11 Dec 2020 17:31:21 +0000 (UTC)
Subject: Re: [PATCH v11 10/25] i386: move TCG cpu class initialization out of
 helper.c
To: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20201211083143.14350-1-cfontana@suse.de>
 <20201211083143.14350-11-cfontana@suse.de>
 <0599b878-22d0-c26c-8621-4426786ddfe9@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <043cb34d-c2d0-9438-c03b-631535ef93d9@suse.de>
Date: Fri, 11 Dec 2020 18:31:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <0599b878-22d0-c26c-8621-4426786ddfe9@linaro.org>
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Dario Faggioli <dfaggioli@suse.com>, Cameron Esfahani <dirty@apple.com>,
 haxm-team@intel.com, Colin Xu <colin.xu@intel.com>,
 Anthony Perard <anthony.perard@citrix.com>, Bruce Rogers <brogers@suse.com>,
 Olaf Hering <ohering@suse.de>, "Emilio G . Cota" <cota@braap.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/20 5:44 PM, Richard Henderson wrote:
> On 12/11/20 2:31 AM, Claudio Fontana wrote:
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> ---
>>  target/i386/cpu.h             |  97 ++---------------------------
>>  target/i386/tcg/helper-tcg.h  | 112 ++++++++++++++++++++++++++++++++++
>>  target/i386/tcg/tcg-cpu.h     |  15 +++++
>>  target/i386/cpu.c             |  33 ++++------
>>  target/i386/helper.c          |  23 -------
>>  target/i386/tcg/bpt_helper.c  |   1 +
>>  target/i386/tcg/cc_helper.c   |   1 +
>>  target/i386/tcg/excp_helper.c |   1 +
>>  target/i386/tcg/fpu_helper.c  |  33 +++++-----
>>  target/i386/tcg/int_helper.c  |   1 +
>>  target/i386/tcg/mem_helper.c  |   1 +
>>  target/i386/tcg/misc_helper.c |   1 +
>>  target/i386/tcg/mpx_helper.c  |   1 +
>>  target/i386/tcg/seg_helper.c  |   1 +
>>  target/i386/tcg/smm_helper.c  |   2 +
>>  target/i386/tcg/svm_helper.c  |   1 +
>>  target/i386/tcg/tcg-cpu.c     |  71 +++++++++++++++++++++
>>  target/i386/tcg/translate.c   |   1 +
>>  target/i386/tcg/meson.build   |   1 +
>>  19 files changed, 244 insertions(+), 153 deletions(-)
>>  create mode 100644 target/i386/tcg/helper-tcg.h
>>  create mode 100644 target/i386/tcg/tcg-cpu.h
>>  create mode 100644 target/i386/tcg/tcg-cpu.c
> 
> This is doing a lot more than $SUBJECT, which afaict would just be the creation
> of target/i386/tcg/tcg-cpu.c.
> 
>> +#define CC_DST  (env->cc_dst)
>> +#define CC_SRC  (env->cc_src)
>> +#define CC_SRC2 (env->cc_src2)
>> +#define CC_OP   (env->cc_op)
> 
> Why are these moving within cpu.h?  If they move at all, they should be moved
> out of here.  Better if they're simply removed -- this is a silly wrapping of
> "env->foo" from ancient days.
> 
>> +/* float macros */
>> +#define FT0    (env->ft0)
>> +#define ST0    (env->fpregs[env->fpstt].d)
>> +#define ST(n)  (env->fpregs[(env->fpstt + (n)) & 7].d)
>> +#define ST1    ST(1)
> 
> Any chance these can move to fpu_helper.c?  Or, in the case of FT0, be eliminated?
> 
>> +/* cc_helper.c */
>> +extern const uint8_t parity_table[256];
> 
> We should probably remove this and just use ctpop(x) & 1.
> 
>> +/*
>> + * NOTE: the translator must set DisasContext.cc_op to CC_OP_EFLAGS
>> + * after generating a call to a helper that uses this.
>> + */
>> +static inline void cpu_load_eflags(CPUX86State *env, int eflags,
>> +                                   int update_mask)
>> +{
>> +    CC_SRC = eflags & (CC_O | CC_S | CC_Z | CC_A | CC_P | CC_C);
>> +    CC_OP = CC_OP_EFLAGS;
>> +    env->df = 1 - (2 * ((eflags >> 10) & 1));
>> +    env->eflags = (env->eflags & ~update_mask) |
>> +        (eflags & update_mask) | 0x2;
>> +}
> 
> This is complex enough I would be in favor of moving it out-of-line somewhere
> convenient.
> 

About the above, will work on this for the next spin.

>> +++ b/target/i386/tcg/tcg-cpu.h
>> @@ -0,0 +1,15 @@
>> +/*
>> + * i386 TCG CPU class initialization
>> + *
>> + * Copyright 2020 SUSE LLC
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
>> + * See the COPYING file in the top-level directory.
>> + */
>> +
>> +#ifndef TCG_CPU_H
>> +#define TCG_CPU_H
>> +
>> +void tcg_cpu_common_class_init(CPUClass *cc);
>> +
> 
> Why does the new file need it's own header, with one declaration?

will be removed later when we have the actual classes, so this won't be needed anymore.

But until then, the tcg-cpu.c module exports one function to target/i386/cpu.c, where the tcg-specific class initialization is called.

Thanks!

Claudio

> 
> 
> r~
> 


