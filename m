Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA882387523
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 11:30:06 +0200 (CEST)
Received: from localhost ([::1]:60772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liw3B-0003zo-K4
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 05:30:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1livkc-0005fn-5v
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:10:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1livkW-00076F-E7
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:10:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621329047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a5/YQbFcAvRgUMS30SRCd8RNqkKAr/plIyLP6gvnAnQ=;
 b=UEeZhxtE9MCOQU01GoA9rRAvwc0IBTdE/pktdXFjFqYSsMm/M5G9iLnT43/UukKJsEG7wR
 u7mk3tCYJw1JFpRGU74LgBh/7IwOq2gjzcUs8j9uud7LJZMOkILunpxJpevQJZkGO8oOyz
 yWZfhlTsAiJkHIKzSpEw2TGiqYRsSG4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-hICD3T0VMTmBegWfR_4swg-1; Tue, 18 May 2021 05:10:46 -0400
X-MC-Unique: hICD3T0VMTmBegWfR_4swg-1
Received: by mail-wr1-f69.google.com with SMTP id
 67-20020adf81490000b029010756d109e6so5244929wrm.13
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:10:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=a5/YQbFcAvRgUMS30SRCd8RNqkKAr/plIyLP6gvnAnQ=;
 b=bxJM2yMrvZfHBYT6Uz6Nag6nAadgWnudSQiyPF9O/BLsIoXjHLCrHhw4ZDGKkFZAnH
 5OuYUjPcnwSK1lNWBe6vIhMpwHnX3rPdcyB/gz/yyxOJ8pIo5qbXzhswD9SsC81/BRn5
 IhCYMNJnIRmExcCaEPbBgErGr7FosQkhVnfuzcQH9D4knuWwliNeArmkZBAk1kB06Yn0
 Y/WIua891srdb+tkutmMnNyJNeI7ihhglrdxCl33ZtMcUUTjTNC7HUPiOh748kaCNKf9
 VrSXhbg4thiH6yH0kzX07nSCZBAJ4Hj1IRRtA6UMyP8IEWN5R1wXkaIwmh63CDCrNyFm
 IPVA==
X-Gm-Message-State: AOAM532xHHtjxkh/u6SgoorjI/EZ1GwJ1zDjSlLKQOZ7N1/X/tA7u8e+
 hOugmhHrU3CQvDGk1tV6tj31ZCXuvj04VLNn0FzBmbhey6zBhssQGfP+/ITgOQ3A8Gf+BCoLs73
 szPjySvoEhyOq16c=
X-Received: by 2002:adf:ee11:: with SMTP id y17mr5600231wrn.57.1621329045133; 
 Tue, 18 May 2021 02:10:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeYL69aAVOmbRClVbQTBfbwYDYPwC0mEHvoj5AogHh1zh4CXzTBpglq10Nb+qiopMyE6rAqw==
X-Received: by 2002:adf:ee11:: with SMTP id y17mr5600209wrn.57.1621329044944; 
 Tue, 18 May 2021 02:10:44 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id e38sm1831998wmp.21.2021.05.18.02.10.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 02:10:44 -0700 (PDT)
Subject: Re: [PATCH v2 02/50] target/i386: Split out check_cpl0
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210514151342.384376-1-richard.henderson@linaro.org>
 <20210514151342.384376-3-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d3731dbd-a699-4497-6d21-c4bc171fb558@redhat.com>
Date: Tue, 18 May 2021 11:10:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210514151342.384376-3-richard.henderson@linaro.org>
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
> Split out the check for CPL != 0 and the raising of #GP.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

> ---
>   target/i386/tcg/translate.c | 79 ++++++++++++++-----------------------
>   1 file changed, 30 insertions(+), 49 deletions(-)
> 
> diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> index 2672e08197..61b30117a3 100644
> --- a/target/i386/tcg/translate.c
> +++ b/target/i386/tcg/translate.c
> @@ -1282,6 +1282,16 @@ static void gen_exception_gpf(DisasContext *s)
>       gen_exception(s, EXCP0D_GPF, s->pc_start - s->cs_base);
>   }
>   
> +/* Check for cpl == 0; if not, raise #GP and return false. */
> +static bool check_cpl0(DisasContext *s)
> +{
> +    if (s->cpl == 0) {
> +        return true;
> +    }
> +    gen_exception_gpf(s);
> +    return false;
> +}
> +
>   /* if d == OR_TMP0, it means memory operand (address in A0) */
>   static void gen_op(DisasContext *s1, int op, MemOp ot, int d)
>   {
> @@ -7199,9 +7209,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>           break;
>       case 0x130: /* wrmsr */
>       case 0x132: /* rdmsr */
> -        if (s->cpl != 0) {
> -            gen_exception_gpf(s);
> -        } else {
> +        if (check_cpl0(s)) {
>               gen_update_cc_op(s);
>               gen_jmp_im(s, pc_start - s->cs_base);
>               if (b & 2) {
> @@ -7283,9 +7291,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>           gen_helper_cpuid(cpu_env);
>           break;
>       case 0xf4: /* hlt */
> -        if (s->cpl != 0) {
> -            gen_exception_gpf(s);
> -        } else {
> +        if (check_cpl0(s)) {
>               gen_update_cc_op(s);
>               gen_jmp_im(s, pc_start - s->cs_base);
>               gen_helper_hlt(cpu_env, tcg_const_i32(s->pc - pc_start));
> @@ -7309,9 +7315,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>           case 2: /* lldt */
>               if (!s->pe || s->vm86)
>                   goto illegal_op;
> -            if (s->cpl != 0) {
> -                gen_exception_gpf(s);
> -            } else {
> +            if (check_cpl0(s)) {
>                   gen_svm_check_intercept(s, pc_start, SVM_EXIT_LDTR_WRITE);
>                   gen_ldst_modrm(env, s, modrm, MO_16, OR_TMP0, 0);
>                   tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
> @@ -7330,9 +7334,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>           case 3: /* ltr */
>               if (!s->pe || s->vm86)
>                   goto illegal_op;
> -            if (s->cpl != 0) {
> -                gen_exception_gpf(s);
> -            } else {
> +            if (check_cpl0(s)) {
>                   gen_svm_check_intercept(s, pc_start, SVM_EXIT_TR_WRITE);
>                   gen_ldst_modrm(env, s, modrm, MO_16, OR_TMP0, 0);
>                   tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
> @@ -7446,8 +7448,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>                                    | PREFIX_REPZ | PREFIX_REPNZ))) {
>                   goto illegal_op;
>               }
> -            if (s->cpl != 0) {
> -                gen_exception_gpf(s);
> +            if (!check_cpl0(s)) {
>                   break;
>               }
>               tcg_gen_concat_tl_i64(s->tmp1_i64, cpu_regs[R_EAX],
> @@ -7463,8 +7464,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>               if (!(s->flags & HF_SVME_MASK) || !s->pe) {
>                   goto illegal_op;
>               }
> -            if (s->cpl != 0) {
> -                gen_exception_gpf(s);
> +            if (!check_cpl0(s)) {
>                   break;
>               }
>               gen_update_cc_op(s);
> @@ -7488,8 +7488,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>               if (!(s->flags & HF_SVME_MASK) || !s->pe) {
>                   goto illegal_op;
>               }
> -            if (s->cpl != 0) {
> -                gen_exception_gpf(s);
> +            if (!check_cpl0(s)) {
>                   break;
>               }
>               gen_update_cc_op(s);
> @@ -7501,8 +7500,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>               if (!(s->flags & HF_SVME_MASK) || !s->pe) {
>                   goto illegal_op;
>               }
> -            if (s->cpl != 0) {
> -                gen_exception_gpf(s);
> +            if (!check_cpl0(s)) {
>                   break;
>               }
>               gen_update_cc_op(s);
> @@ -7516,8 +7514,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>                   || !s->pe) {
>                   goto illegal_op;
>               }
> -            if (s->cpl != 0) {
> -                gen_exception_gpf(s);
> +            if (!check_cpl0(s)) {
>                   break;
>               }
>               gen_update_cc_op(s);
> @@ -7530,8 +7527,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>               if (!(s->flags & HF_SVME_MASK) || !s->pe) {
>                   goto illegal_op;
>               }
> -            if (s->cpl != 0) {
> -                gen_exception_gpf(s);
> +            if (!check_cpl0(s)) {
>                   break;
>               }
>               gen_update_cc_op(s);
> @@ -7554,8 +7550,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>               if (!(s->flags & HF_SVME_MASK) || !s->pe) {
>                   goto illegal_op;
>               }
> -            if (s->cpl != 0) {
> -                gen_exception_gpf(s);
> +            if (!check_cpl0(s)) {
>                   break;
>               }
>               gen_update_cc_op(s);
> @@ -7564,8 +7559,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>               break;
>   
>           CASE_MODRM_MEM_OP(2): /* lgdt */
> -            if (s->cpl != 0) {
> -                gen_exception_gpf(s);
> +            if (!check_cpl0(s)) {
>                   break;
>               }
>               gen_svm_check_intercept(s, pc_start, SVM_EXIT_GDTR_WRITE);
> @@ -7581,8 +7575,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>               break;
>   
>           CASE_MODRM_MEM_OP(3): /* lidt */
> -            if (s->cpl != 0) {
> -                gen_exception_gpf(s);
> +            if (!check_cpl0(s)) {
>                   break;
>               }
>               gen_svm_check_intercept(s, pc_start, SVM_EXIT_IDTR_WRITE);
> @@ -7627,8 +7620,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>               gen_helper_wrpkru(cpu_env, s->tmp2_i32, s->tmp1_i64);
>               break;
>           CASE_MODRM_OP(6): /* lmsw */
> -            if (s->cpl != 0) {
> -                gen_exception_gpf(s);
> +            if (!check_cpl0(s)) {
>                   break;
>               }
>               gen_svm_check_intercept(s, pc_start, SVM_EXIT_WRITE_CR0);
> @@ -7639,8 +7631,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>               break;
>   
>           CASE_MODRM_MEM_OP(7): /* invlpg */
> -            if (s->cpl != 0) {
> -                gen_exception_gpf(s);
> +            if (!check_cpl0(s)) {
>                   break;
>               }
>               gen_update_cc_op(s);
> @@ -7654,9 +7645,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>           case 0xf8: /* swapgs */
>   #ifdef TARGET_X86_64
>               if (CODE64(s)) {
> -                if (s->cpl != 0) {
> -                    gen_exception_gpf(s);
> -                } else {
> +                if (check_cpl0(s)) {
>                       tcg_gen_mov_tl(s->T0, cpu_seg_base[R_GS]);
>                       tcg_gen_ld_tl(cpu_seg_base[R_GS], cpu_env,
>                                     offsetof(CPUX86State, kernelgsbase));
> @@ -7690,9 +7679,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>   
>       case 0x108: /* invd */
>       case 0x109: /* wbinvd */
> -        if (s->cpl != 0) {
> -            gen_exception_gpf(s);
> -        } else {
> +        if (check_cpl0(s)) {
>               gen_svm_check_intercept(s, pc_start, (b & 2) ? SVM_EXIT_INVD : SVM_EXIT_WBINVD);
>               /* nothing to do */
>           }
> @@ -8014,9 +8001,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>           break;
>       case 0x120: /* mov reg, crN */
>       case 0x122: /* mov crN, reg */
> -        if (s->cpl != 0) {
> -            gen_exception_gpf(s);
> -        } else {
> +        if (check_cpl0(s)) {
>               modrm = x86_ldub_code(env, s);
>               /* Ignore the mod bits (assume (modrm&0xc0)==0xc0).
>                * AMD documentation (24594.pdf) and testing of
> @@ -8068,9 +8053,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>           break;
>       case 0x121: /* mov reg, drN */
>       case 0x123: /* mov drN, reg */
> -        if (s->cpl != 0) {
> -            gen_exception_gpf(s);
> -        } else {
> +        if (check_cpl0(s)) {
>   #ifndef CONFIG_USER_ONLY
>               modrm = x86_ldub_code(env, s);
>               /* Ignore the mod bits (assume (modrm&0xc0)==0xc0).
> @@ -8104,9 +8087,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>           }
>           break;
>       case 0x106: /* clts */
> -        if (s->cpl != 0) {
> -            gen_exception_gpf(s);
> -        } else {
> +        if (check_cpl0(s)) {
>               gen_svm_check_intercept(s, pc_start, SVM_EXIT_WRITE_CR0);
>               gen_helper_clts(cpu_env);
>               /* abort block because static cpu state changed */
> 


