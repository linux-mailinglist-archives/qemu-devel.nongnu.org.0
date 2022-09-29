Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED1C5EFBEF
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 19:25:21 +0200 (CEST)
Received: from localhost ([::1]:38494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odxHk-0002UM-1X
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 13:25:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odwwl-0007wn-4s
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 13:03:47 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:38820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odwwj-0000VD-3b
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 13:03:38 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 c192-20020a1c35c9000000b003b51339d350so3600698wma.3
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 10:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=ckXOj0kL1mkE6I/gLKJI97zgm9KjLbkvtK6Y9nHNlp0=;
 b=RMHTsu5rCzrzIfmOavEfZS/hP9UQzAnhI0OvoG2NHVCRSb7c3UFsc3QXxx1jtYzYbY
 5jsTMt2j3bBSRzNO0mzi7YfS+YGibIvzqURxikGnxWJC1Y0J0PcuywxnoeEMZ7/6n0vh
 ukkP6Y/87hCik/pIZnew7YjeOezoAaHPT4AYL7p/CVrnHo3rIxOcHgdVvGjp7oLpqIHD
 EKMg7KgqRmJ0171TTJ5rGhBKOxCjHHGA9lZtLJxGcyXelzoNr3ac803wlX9VXaV5Pkfa
 p65L0VfrspEK8NfkrikGDVEsOLGeyhw5BSIOS2i9iYVR0buy5lDPD6H4kzeHPmjM4LzT
 /wnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=ckXOj0kL1mkE6I/gLKJI97zgm9KjLbkvtK6Y9nHNlp0=;
 b=uSWW9Zo6+LOMCHr9hCCYp/CHXJnhhHNqVf48EwM7Y1Bj3Joy0vFlaxBKe2qFtuqJpG
 KpI6j03A1/m8KJQnIeFf67WiwTfODmX9Om+4doJ0siakNFux8S3vuoByeJb3vBOqZZFD
 uV+/XZz2ej8mkM8Eu/eAcx7CxM+gExvdXthWV4BY2hAxn6LUJjQUDg+dxM/Smzwt2wum
 /G6Oq7z/F5jNADOzfL/2QgHQ4tzcmH3hcXNYwPTY5aEYbPvCmfSnDHyMmiRKmxnvA3xy
 eplKCF94JrQF5cgbJRASdIfJFu8nopCoOlZfmtzQU88Ln1WpTlWfqDchTpAmNc2v3oiD
 +MLQ==
X-Gm-Message-State: ACrzQf0SgNxRoxwQA/ENF5R7S9EUZ0wCr44Ikir9xCSg6WyAhrRLW2u6
 fHwTaIOL/VAuaKG/giz0eXyvuA==
X-Google-Smtp-Source: AMsMyM6M9pqIhWeFyoB7kCFjxeiBjQwsM4QpEd4dqjmTPqAfT6LIgVWUkVO4Ckvr+MJLaRF6HftP3A==
X-Received: by 2002:a05:600c:4f89:b0:3b4:a6fc:89e5 with SMTP id
 n9-20020a05600c4f8900b003b4a6fc89e5mr11109981wmq.149.1664471015413; 
 Thu, 29 Sep 2022 10:03:35 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 r7-20020adfab47000000b0022ccc22ca95sm3313192wrc.13.2022.09.29.10.03.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 10:03:34 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2DC1E1FFB7;
 Thu, 29 Sep 2022 18:03:34 +0100 (BST)
References: <20220925105124.82033-1-richard.henderson@linaro.org>
 <20220925105124.82033-15-richard.henderson@linaro.org>
 <87k05mz3xa.fsf@linaro.org>
 <9db697ee-f8e1-1388-7675-42c46ae98fca@linaro.org>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v5 14/17] include/hw/core: Create struct CPUJumpCache
Date: Thu, 29 Sep 2022 18:01:42 +0100
In-reply-to: <9db697ee-f8e1-1388-7675-42c46ae98fca@linaro.org>
Message-ID: <877d1myuxl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 9/29/22 06:46, Alex Benn=C3=A9e wrote:
>> Richard Henderson <richard.henderson@linaro.org> writes:
>>=20
>>> Wrap the bare TranslationBlock pointer into a structure.
>>>
>>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>   include/hw/core/cpu.h     | 8 ++++++--
>>>   accel/tcg/cpu-exec.c      | 9 ++++++---
>>>   accel/tcg/cputlb.c        | 2 +-
>>>   accel/tcg/translate-all.c | 4 ++--
>>>   4 files changed, 15 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
>>> index 9e47184513..ee5b75dea0 100644
>>> --- a/include/hw/core/cpu.h
>>> +++ b/include/hw/core/cpu.h
>>> @@ -232,6 +232,10 @@ struct hvf_vcpu_state;
>>>   #define TB_JMP_CACHE_BITS 12
>>>   #define TB_JMP_CACHE_SIZE (1 << TB_JMP_CACHE_BITS)
>>>   +typedef struct {
>>> +    TranslationBlock *tb;
>>> +} CPUJumpCache;
>>> +
>> I don't quite follow whats going on here. I see we add vaddr pc in a
>> later patch but I don't quite see why a cache for looking up TBs gets a
>> sidechan value added later.
>> Is this because the vaddr will no longer match the tb->pc? Maybe a
>> comment on the structure is needed?
>
> Correct, there will be no tb->pc, so the cpu has to remember the virtual =
address itself.
>
> This patch only wraps the current pointer into a structure.

Sure - however we don't expand the comment when vaddr is added later.
I'm also concerned that now we have two fields there is scope for skew.
I guess the acquire/release semantics are to ensure we may fail safe but
never get a false positive?

>
>
> r~
>
>>=20
>>>   /* work queue */
>>>     /* The union type allows passing of 64 bit target pointers on
>>> 32 bit
>>> @@ -361,7 +365,7 @@ struct CPUState {
>>>       IcountDecr *icount_decr_ptr;
>>>         /* Accessed in parallel; all accesses must be atomic */
>>> -    TranslationBlock *tb_jmp_cache[TB_JMP_CACHE_SIZE];
>>> +    CPUJumpCache tb_jmp_cache[TB_JMP_CACHE_SIZE];
>>>         struct GDBRegisterState *gdb_regs;
>>>       int gdb_num_regs;
>>> @@ -452,7 +456,7 @@ static inline void cpu_tb_jmp_cache_clear(CPUState =
*cpu)
>>>       unsigned int i;
>>>         for (i =3D 0; i < TB_JMP_CACHE_SIZE; i++) {
>>> -        qatomic_set(&cpu->tb_jmp_cache[i], NULL);
>>> +        qatomic_set(&cpu->tb_jmp_cache[i].tb, NULL);
>>>       }
>>>   }
>>>   diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
>>> index dd58a144a8..c6283d5798 100644
>>> --- a/accel/tcg/cpu-exec.c
>>> +++ b/accel/tcg/cpu-exec.c
>>> @@ -252,7 +252,7 @@ static inline TranslationBlock *tb_lookup(CPUState =
*cpu, target_ulong pc,
>>>       tcg_debug_assert(!(cflags & CF_INVALID));
>>>         hash =3D tb_jmp_cache_hash_func(pc);
>>> -    tb =3D qatomic_rcu_read(&cpu->tb_jmp_cache[hash]);
>>> +    tb =3D qatomic_rcu_read(&cpu->tb_jmp_cache[hash].tb);
>>>         if (likely(tb &&
>>>                  tb->pc =3D=3D pc &&
>>> @@ -266,7 +266,7 @@ static inline TranslationBlock *tb_lookup(CPUState =
*cpu, target_ulong pc,
>>>       if (tb =3D=3D NULL) {
>>>           return NULL;
>>>       }
>>> -    qatomic_set(&cpu->tb_jmp_cache[hash], tb);
>>> +    qatomic_set(&cpu->tb_jmp_cache[hash].tb, tb);
>>>       return tb;
>>>   }
>>>   @@ -987,6 +987,8 @@ int cpu_exec(CPUState *cpu)
>>>                 tb =3D tb_lookup(cpu, pc, cs_base, flags, cflags);
>>>               if (tb =3D=3D NULL) {
>>> +                uint32_t h;
>>> +
>>>                   mmap_lock();
>>>                   tb =3D tb_gen_code(cpu, pc, cs_base, flags, cflags);
>>>                   mmap_unlock();
>>> @@ -994,7 +996,8 @@ int cpu_exec(CPUState *cpu)
>>>                    * We add the TB in the virtual pc hash table
>>>                    * for the fast lookup
>>>                    */
>>> -                qatomic_set(&cpu->tb_jmp_cache[tb_jmp_cache_hash_func(=
pc)], tb);
>>> +                h =3D tb_jmp_cache_hash_func(pc);
>>> +                qatomic_set(&cpu->tb_jmp_cache[h].tb, tb);
>>>               }
>>>     #ifndef CONFIG_USER_ONLY
>>> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
>>> index f5e6ca2da2..fb8f3087f1 100644
>>> --- a/accel/tcg/cputlb.c
>>> +++ b/accel/tcg/cputlb.c
>>> @@ -103,7 +103,7 @@ static void tb_jmp_cache_clear_page(CPUState *cpu, =
target_ulong page_addr)
>>>       unsigned int i, i0 =3D tb_jmp_cache_hash_page(page_addr);
>>>         for (i =3D 0; i < TB_JMP_PAGE_SIZE; i++) {
>>> -        qatomic_set(&cpu->tb_jmp_cache[i0 + i], NULL);
>>> +        qatomic_set(&cpu->tb_jmp_cache[i0 + i].tb, NULL);
>>>       }
>>>   }
>>>   diff --git a/accel/tcg/translate-all.c
>>> b/accel/tcg/translate-all.c
>>> index f429d33981..efa479ccf3 100644
>>> --- a/accel/tcg/translate-all.c
>>> +++ b/accel/tcg/translate-all.c
>>> @@ -1187,8 +1187,8 @@ static void do_tb_phys_invalidate(TranslationBloc=
k *tb, bool rm_from_page_list)
>>>       /* remove the TB from the hash list */
>>>       h =3D tb_jmp_cache_hash_func(tb->pc);
>>>       CPU_FOREACH(cpu) {
>>> -        if (qatomic_read(&cpu->tb_jmp_cache[h]) =3D=3D tb) {
>>> -            qatomic_set(&cpu->tb_jmp_cache[h], NULL);
>>> +        if (qatomic_read(&cpu->tb_jmp_cache[h].tb) =3D=3D tb) {
>>> +            qatomic_set(&cpu->tb_jmp_cache[h].tb, NULL);
>>>           }
>>>       }
>>=20


--=20
Alex Benn=C3=A9e

