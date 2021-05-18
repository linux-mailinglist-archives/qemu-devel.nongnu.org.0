Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B44FF3874F8
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 11:21:51 +0200 (CEST)
Received: from localhost ([::1]:37058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1livvC-00051n-MO
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 05:21:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1livip-0002B7-GY
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:09:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1livim-00067y-AW
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:09:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621328939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CCnywv3iQl60RueTQ8TqA77HuXjtt4FdD34sTu1kCtY=;
 b=bm1mT9ImxTEheN1+Jdg2WgRuAhDBHawhjE6IiYSRPLhiV276B8pkeQbpm+lReegxgLy8VI
 2hTAbhEXavOMToiJvDZJlZe9maOjpt7m8PTBCEQ9Ow7gJt+zJ8h5dv6N6JvsHLflpJt2tv
 2KAjVgll+HDFV4g8NBMZy92KgLybmJ4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-RBfOcR3GP5GgFq7q6OlX2Q-1; Tue, 18 May 2021 05:08:55 -0400
X-MC-Unique: RBfOcR3GP5GgFq7q6OlX2Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 r206-20020a1c44d70000b029017728f9f05bso553777wma.5
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:08:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CCnywv3iQl60RueTQ8TqA77HuXjtt4FdD34sTu1kCtY=;
 b=HNrny4jLG60bXD9Fru7S4PdHaI9D7L96cz2/OXwQD7GktvvkH1BS3VSJyekIiorUK1
 j+RihSTBcNdfVCB8nx1szQ8eJ1bLWn4JdpzkeubQYHyMc4HPL4qQzz6Q/UzNVPVvbPE/
 m+iaPBpWN0lWKRdQhoug/DZfvN4fs+eMDXkJ9Gv/Dhd/uwHKNvhpTUGnquAvIMVbPzCh
 wZ52haY3RAyafdsb/jZlcWo0lIcn7Ikflwpcc5RKHEPt33Hmsl4tHm1jLPoyMp1M7XeB
 3YKwmcPoisp/KCBpoSsBxHpl/hrxAsMW+6z7FNWfnDOCnNJpnfCxIxgXRE34v69eiFcK
 u77A==
X-Gm-Message-State: AOAM530Rz4n7A50rdJ8iJAa6/DN3VdbdiKeZGJIYJEvpzYfSxOCuJ7y0
 F7TOHt3v7OvkSeufqh91HDPD03a9EpxLjY9gt5JwHwhLHlCWCzxlHBu/PjqKN/lGT/yFxGqtc40
 M/dsUpXGjfNlwKz4=
X-Received: by 2002:adf:eb86:: with SMTP id t6mr5573305wrn.253.1621328934491; 
 Tue, 18 May 2021 02:08:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywvrHqPkrUHIqmrGe2mJRaTLMOI8nfJyvXGX09cIcX+McnezpCAjgyKb32BUSD0cWKpByW2g==
X-Received: by 2002:adf:eb86:: with SMTP id t6mr5573265wrn.253.1621328934143; 
 Tue, 18 May 2021 02:08:54 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id q62sm8848693wma.42.2021.05.18.02.08.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 02:08:53 -0700 (PDT)
Subject: Re: [PATCH v2 01/50] target/i386: Split out gen_exception_gpf
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210514151342.384376-1-richard.henderson@linaro.org>
 <20210514151342.384376-2-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <8fe45dcf-ccbf-05cc-4b92-683a2f159abd@redhat.com>
Date: Tue, 18 May 2021 11:08:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210514151342.384376-2-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: cfontana@suse.de, f4bug@amsat.org, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/05/21 17:12, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/i386/tcg/translate.c | 68 ++++++++++++++++++++-----------------
>   1 file changed, 37 insertions(+), 31 deletions(-)
> 
> diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> index db56a48343..2672e08197 100644
> --- a/target/i386/tcg/translate.c
> +++ b/target/i386/tcg/translate.c
> @@ -1276,6 +1276,12 @@ static void gen_illegal_opcode(DisasContext *s)
>       gen_exception(s, EXCP06_ILLOP, s->pc_start - s->cs_base);
>   }
>   
> +/* Generate #GP for the current instruction. */
> +static void gen_exception_gpf(DisasContext *s)
> +{
> +    gen_exception(s, EXCP0D_GPF, s->pc_start - s->cs_base);
> +}
> +
>   /* if d == OR_TMP0, it means memory operand (address in A0) */
>   static void gen_op(DisasContext *s1, int op, MemOp ot, int d)
>   {
> @@ -4502,7 +4508,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>       s->vex_l = 0;
>       s->vex_v = 0;
>       if (sigsetjmp(s->jmpbuf, 0) != 0) {
> -        gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
> +        gen_exception_gpf(s);
>           return s->pc;
>       }
>   
> @@ -6567,7 +6573,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>               set_cc_op(s, CC_OP_EFLAGS);
>           } else if (s->vm86) {
>               if (s->iopl != 3) {
> -                gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
> +                gen_exception_gpf(s);
>               } else {
>                   gen_helper_iret_real(cpu_env, tcg_const_i32(dflag - 1));
>                   set_cc_op(s, CC_OP_EFLAGS);
> @@ -6689,7 +6695,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>       case 0x9c: /* pushf */
>           gen_svm_check_intercept(s, pc_start, SVM_EXIT_PUSHF);
>           if (s->vm86 && s->iopl != 3) {
> -            gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
> +            gen_exception_gpf(s);
>           } else {
>               gen_update_cc_op(s);
>               gen_helper_read_eflags(s->T0, cpu_env);
> @@ -6699,7 +6705,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>       case 0x9d: /* popf */
>           gen_svm_check_intercept(s, pc_start, SVM_EXIT_POPF);
>           if (s->vm86 && s->iopl != 3) {
> -            gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
> +            gen_exception_gpf(s);
>           } else {
>               ot = gen_pop_T0(s);
>               if (s->cpl == 0) {
> @@ -7061,7 +7067,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>       case 0xcd: /* int N */
>           val = x86_ldub_code(env, s);
>           if (s->vm86 && s->iopl != 3) {
> -            gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
> +            gen_exception_gpf(s);
>           } else {
>               gen_interrupt(s, val, pc_start - s->cs_base, s->pc - s->cs_base);
>           }
> @@ -7084,13 +7090,13 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>               if (s->cpl <= s->iopl) {
>                   gen_helper_cli(cpu_env);
>               } else {
> -                gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
> +                gen_exception_gpf(s);
>               }
>           } else {
>               if (s->iopl == 3) {
>                   gen_helper_cli(cpu_env);
>               } else {
> -                gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
> +                gen_exception_gpf(s);
>               }
>           }
>           break;
> @@ -7101,7 +7107,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>               gen_jmp_im(s, s->pc - s->cs_base);
>               gen_eob_inhibit_irq(s, true);
>           } else {
> -            gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
> +            gen_exception_gpf(s);
>           }
>           break;
>       case 0x62: /* bound */
> @@ -7194,7 +7200,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>       case 0x130: /* wrmsr */
>       case 0x132: /* rdmsr */
>           if (s->cpl != 0) {
> -            gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
> +            gen_exception_gpf(s);
>           } else {
>               gen_update_cc_op(s);
>               gen_jmp_im(s, pc_start - s->cs_base);
> @@ -7226,7 +7232,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>           if (CODE64(s) && env->cpuid_vendor1 != CPUID_VENDOR_INTEL_1)
>               goto illegal_op;
>           if (!s->pe) {
> -            gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
> +            gen_exception_gpf(s);
>           } else {
>               gen_helper_sysenter(cpu_env);
>               gen_eob(s);
> @@ -7237,7 +7243,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>           if (CODE64(s) && env->cpuid_vendor1 != CPUID_VENDOR_INTEL_1)
>               goto illegal_op;
>           if (!s->pe) {
> -            gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
> +            gen_exception_gpf(s);
>           } else {
>               gen_helper_sysexit(cpu_env, tcg_const_i32(dflag - 1));
>               gen_eob(s);
> @@ -7256,7 +7262,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>           break;
>       case 0x107: /* sysret */
>           if (!s->pe) {
> -            gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
> +            gen_exception_gpf(s);
>           } else {
>               gen_helper_sysret(cpu_env, tcg_const_i32(dflag - 1));
>               /* condition codes are modified only in long mode */
> @@ -7278,7 +7284,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>           break;
>       case 0xf4: /* hlt */
>           if (s->cpl != 0) {
> -            gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
> +            gen_exception_gpf(s);
>           } else {
>               gen_update_cc_op(s);
>               gen_jmp_im(s, pc_start - s->cs_base);
> @@ -7304,7 +7310,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>               if (!s->pe || s->vm86)
>                   goto illegal_op;
>               if (s->cpl != 0) {
> -                gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
> +                gen_exception_gpf(s);
>               } else {
>                   gen_svm_check_intercept(s, pc_start, SVM_EXIT_LDTR_WRITE);
>                   gen_ldst_modrm(env, s, modrm, MO_16, OR_TMP0, 0);
> @@ -7325,7 +7331,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>               if (!s->pe || s->vm86)
>                   goto illegal_op;
>               if (s->cpl != 0) {
> -                gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
> +                gen_exception_gpf(s);
>               } else {
>                   gen_svm_check_intercept(s, pc_start, SVM_EXIT_TR_WRITE);
>                   gen_ldst_modrm(env, s, modrm, MO_16, OR_TMP0, 0);
> @@ -7441,7 +7447,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>                   goto illegal_op;
>               }
>               if (s->cpl != 0) {
> -                gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
> +                gen_exception_gpf(s);
>                   break;
>               }
>               tcg_gen_concat_tl_i64(s->tmp1_i64, cpu_regs[R_EAX],
> @@ -7458,7 +7464,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>                   goto illegal_op;
>               }
>               if (s->cpl != 0) {
> -                gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
> +                gen_exception_gpf(s);
>                   break;
>               }
>               gen_update_cc_op(s);
> @@ -7483,7 +7489,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>                   goto illegal_op;
>               }
>               if (s->cpl != 0) {
> -                gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
> +                gen_exception_gpf(s);
>                   break;
>               }
>               gen_update_cc_op(s);
> @@ -7496,7 +7502,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>                   goto illegal_op;
>               }
>               if (s->cpl != 0) {
> -                gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
> +                gen_exception_gpf(s);
>                   break;
>               }
>               gen_update_cc_op(s);
> @@ -7511,7 +7517,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>                   goto illegal_op;
>               }
>               if (s->cpl != 0) {
> -                gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
> +                gen_exception_gpf(s);
>                   break;
>               }
>               gen_update_cc_op(s);
> @@ -7525,7 +7531,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>                   goto illegal_op;
>               }
>               if (s->cpl != 0) {
> -                gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
> +                gen_exception_gpf(s);
>                   break;
>               }
>               gen_update_cc_op(s);
> @@ -7549,7 +7555,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>                   goto illegal_op;
>               }
>               if (s->cpl != 0) {
> -                gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
> +                gen_exception_gpf(s);
>                   break;
>               }
>               gen_update_cc_op(s);
> @@ -7559,7 +7565,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>   
>           CASE_MODRM_MEM_OP(2): /* lgdt */
>               if (s->cpl != 0) {
> -                gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
> +                gen_exception_gpf(s);
>                   break;
>               }
>               gen_svm_check_intercept(s, pc_start, SVM_EXIT_GDTR_WRITE);
> @@ -7576,7 +7582,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>   
>           CASE_MODRM_MEM_OP(3): /* lidt */
>               if (s->cpl != 0) {
> -                gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
> +                gen_exception_gpf(s);
>                   break;
>               }
>               gen_svm_check_intercept(s, pc_start, SVM_EXIT_IDTR_WRITE);
> @@ -7622,7 +7628,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>               break;
>           CASE_MODRM_OP(6): /* lmsw */
>               if (s->cpl != 0) {
> -                gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
> +                gen_exception_gpf(s);
>                   break;
>               }
>               gen_svm_check_intercept(s, pc_start, SVM_EXIT_WRITE_CR0);
> @@ -7634,7 +7640,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>   
>           CASE_MODRM_MEM_OP(7): /* invlpg */
>               if (s->cpl != 0) {
> -                gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
> +                gen_exception_gpf(s);
>                   break;
>               }
>               gen_update_cc_op(s);
> @@ -7649,7 +7655,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>   #ifdef TARGET_X86_64
>               if (CODE64(s)) {
>                   if (s->cpl != 0) {
> -                    gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
> +                    gen_exception_gpf(s);
>                   } else {
>                       tcg_gen_mov_tl(s->T0, cpu_seg_base[R_GS]);
>                       tcg_gen_ld_tl(cpu_seg_base[R_GS], cpu_env,
> @@ -7685,7 +7691,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>       case 0x108: /* invd */
>       case 0x109: /* wbinvd */
>           if (s->cpl != 0) {
> -            gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
> +            gen_exception_gpf(s);
>           } else {
>               gen_svm_check_intercept(s, pc_start, (b & 2) ? SVM_EXIT_INVD : SVM_EXIT_WBINVD);
>               /* nothing to do */
> @@ -8009,7 +8015,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>       case 0x120: /* mov reg, crN */
>       case 0x122: /* mov crN, reg */
>           if (s->cpl != 0) {
> -            gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
> +            gen_exception_gpf(s);
>           } else {
>               modrm = x86_ldub_code(env, s);
>               /* Ignore the mod bits (assume (modrm&0xc0)==0xc0).
> @@ -8063,7 +8069,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>       case 0x121: /* mov reg, drN */
>       case 0x123: /* mov drN, reg */
>           if (s->cpl != 0) {
> -            gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
> +            gen_exception_gpf(s);
>           } else {
>   #ifndef CONFIG_USER_ONLY
>               modrm = x86_ldub_code(env, s);
> @@ -8099,7 +8105,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>           break;
>       case 0x106: /* clts */
>           if (s->cpl != 0) {
> -            gen_exception(s, EXCP0D_GPF, pc_start - s->cs_base);
> +            gen_exception_gpf(s);
>           } else {
>               gen_svm_check_intercept(s, pc_start, SVM_EXIT_WRITE_CR0);
>               gen_helper_clts(cpu_env);
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


