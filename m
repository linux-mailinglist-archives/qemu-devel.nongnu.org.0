Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A094A2F0EEA
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 10:17:55 +0100 (CET)
Received: from localhost ([::1]:38030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kytKk-0008Jn-NQ
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 04:17:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kytIX-00078H-OV
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 04:15:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kytIV-0002SV-TD
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 04:15:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610356535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xPIcPN/nav/fGeQ4IDajhMZmI5yUBC4hfhNNWXOaCQ4=;
 b=bdAhEOFFypS5MdHZm+V4jeIhbhc8XTNa7KWe4ANL/JfQfktuo5G2jL4Cufo+hVJBfD0qR2
 8991tSlrdBV+sSgrtHq6KYggzwoHHN6xFK14WlHme6qY5HEgc0y7SudGewYWPztdvtNurK
 vvS/23e6lnRhfGuWIjsnEAkUk0clLxQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-71-ENTS_DvNMDulFXahmMRvHQ-1; Mon, 11 Jan 2021 04:15:33 -0500
X-MC-Unique: ENTS_DvNMDulFXahmMRvHQ-1
Received: by mail-ej1-f69.google.com with SMTP id q11so4827632ejd.0
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 01:15:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xPIcPN/nav/fGeQ4IDajhMZmI5yUBC4hfhNNWXOaCQ4=;
 b=po+s10o35wl/DlWQevtiKomRa3cYRi3tmv0r/q73UhH232M5oOPkns56S+lBu3sJTc
 ojaI1XfGFx+dn/AlmHczV1s2A6mGYEeq+kHirnMeKfo/rf4muyc3AZbMtUp0NSc3aLXS
 3soB4Q7Z7D5KDtxlqbTs47SiNKL3KMGaFFaHMJ4Ns77HW75tOEAju4fCawvZwbKOzbbM
 n2yOKUTqTgOv0QZpzQwLLZMJ06sVeCmtZiyvi06FxMj24rOK2q7R+o33Z4pwWVnXGORN
 XNin3GiW47AT9+8Xga8LJp/FB5oGBce4WF+VBiAgPtcGs0U/o31HiCSnlPzYTtlZl99v
 lHxA==
X-Gm-Message-State: AOAM531DyFAAn/ONyUZyNCvU51DNF0IpUmTLqEsccZRYGbLC6tK3G068
 O8WqdGlmCcU+/HKwnhYm7BLaROKtnrCPG15s8MzJ5wXRd2mBoEUFNfefOwrKzNMYOehAwL6bOt8
 t6oVf8p/UBOWKVVc=
X-Received: by 2002:a17:906:3685:: with SMTP id
 a5mr9780421ejc.544.1610356531967; 
 Mon, 11 Jan 2021 01:15:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxHr6UUijXh2A0h4cOKPaF7P0d3vcOpk+TnmGfJV9qtPZ3+DiD5dAwCV1Kd8Bkt82XtEOAtCg==
X-Received: by 2002:a17:906:3685:: with SMTP id
 a5mr9780414ejc.544.1610356531719; 
 Mon, 11 Jan 2021 01:15:31 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id z13sm7390019edq.48.2021.01.11.01.15.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 01:15:30 -0800 (PST)
Subject: Re: [PATCH] target/i386: Use X86Seg enum for segment registers
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210109233427.749748-1-f4bug@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <2fc58418-09eb-f903-de72-7f7f80aac46c@redhat.com>
Date: Mon, 11 Jan 2021 10:15:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210109233427.749748-1-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.012, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/01/21 00:34, Philippe Mathieu-Daudé wrote:
> Use the dedicated X86Seg enum type for segment registers.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   target/i386/cpu.h            | 4 ++--
>   target/i386/gdbstub.c        | 2 +-
>   target/i386/tcg/seg_helper.c | 8 ++++----
>   target/i386/tcg/translate.c  | 6 +++---
>   4 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index af130512e22..d23a5b340a8 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -1807,7 +1807,7 @@ void cpu_sync_bndcs_hflags(CPUX86State *env);
>   /* this function must always be used to load data in the segment
>      cache: it synchronizes the hflags with the segment cache values */
>   static inline void cpu_x86_load_seg_cache(CPUX86State *env,
> -                                          int seg_reg, unsigned int selector,
> +                                          X86Seg seg_reg, unsigned int selector,
>                                             target_ulong base,
>                                             unsigned int limit,
>                                             unsigned int flags)
> @@ -1896,7 +1896,7 @@ int cpu_x86_get_descr_debug(CPUX86State *env, unsigned int selector,
>   /* cpu-exec.c */
>   /* the following helpers are only usable in user mode simulation as
>      they can trigger unexpected exceptions */
> -void cpu_x86_load_seg(CPUX86State *s, int seg_reg, int selector);
> +void cpu_x86_load_seg(CPUX86State *s, X86Seg seg_reg, int selector);
>   void cpu_x86_fsave(CPUX86State *s, target_ulong ptr, int data32);
>   void cpu_x86_frstor(CPUX86State *s, target_ulong ptr, int data32);
>   void cpu_x86_fxsave(CPUX86State *s, target_ulong ptr);
> diff --git a/target/i386/gdbstub.c b/target/i386/gdbstub.c
> index 4a3de5f69da..41e265fc67a 100644
> --- a/target/i386/gdbstub.c
> +++ b/target/i386/gdbstub.c
> @@ -232,7 +232,7 @@ int x86_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
>       return 0;
>   }
>   
> -static int x86_cpu_gdb_load_seg(X86CPU *cpu, int sreg, uint8_t *mem_buf)
> +static int x86_cpu_gdb_load_seg(X86CPU *cpu, X86Seg sreg, uint8_t *mem_buf)
>   {
>       CPUX86State *env = &cpu->env;
>       uint16_t selector = ldl_p(mem_buf);
> diff --git a/target/i386/tcg/seg_helper.c b/target/i386/tcg/seg_helper.c
> index 5f2ee6aa7ea..180d47f0e9b 100644
> --- a/target/i386/tcg/seg_helper.c
> +++ b/target/i386/tcg/seg_helper.c
> @@ -176,8 +176,8 @@ static inline void get_ss_esp_from_tss(CPUX86State *env, uint32_t *ss_ptr,
>       }
>   }
>   
> -static void tss_load_seg(CPUX86State *env, int seg_reg, int selector, int cpl,
> -                         uintptr_t retaddr)
> +static void tss_load_seg(CPUX86State *env, X86Seg seg_reg, int selector,
> +                         int cpl, uintptr_t retaddr)
>   {
>       uint32_t e1, e2;
>       int rpl, dpl;
> @@ -2098,7 +2098,7 @@ void helper_iret_real(CPUX86State *env, int shift)
>       env->hflags2 &= ~HF2_NMI_MASK;
>   }
>   
> -static inline void validate_seg(CPUX86State *env, int seg_reg, int cpl)
> +static inline void validate_seg(CPUX86State *env, X86Seg seg_reg, int cpl)
>   {
>       int dpl;
>       uint32_t e2;
> @@ -2623,7 +2623,7 @@ void helper_verw(CPUX86State *env, target_ulong selector1)
>   }
>   
>   #if defined(CONFIG_USER_ONLY)
> -void cpu_x86_load_seg(CPUX86State *env, int seg_reg, int selector)
> +void cpu_x86_load_seg(CPUX86State *env, X86Seg seg_reg, int selector)
>   {
>       if (!(env->cr[0] & CR0_PE_MASK) || (env->eflags & VM_MASK)) {
>           int dpl = (env->eflags & VM_MASK) ? 3 : 0;
> diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> index 11db2f3c8d2..6a4c31f933b 100644
> --- a/target/i386/tcg/translate.c
> +++ b/target/i386/tcg/translate.c
> @@ -2287,13 +2287,13 @@ static void gen_cmovcc1(CPUX86State *env, DisasContext *s, MemOp ot, int b,
>       }
>   }
>   
> -static inline void gen_op_movl_T0_seg(DisasContext *s, int seg_reg)
> +static inline void gen_op_movl_T0_seg(DisasContext *s, X86Seg seg_reg)
>   {
>       tcg_gen_ld32u_tl(s->T0, cpu_env,
>                        offsetof(CPUX86State,segs[seg_reg].selector));
>   }
>   
> -static inline void gen_op_movl_seg_T0_vm(DisasContext *s, int seg_reg)
> +static inline void gen_op_movl_seg_T0_vm(DisasContext *s, X86Seg seg_reg)
>   {
>       tcg_gen_ext16u_tl(s->T0, s->T0);
>       tcg_gen_st32_tl(s->T0, cpu_env,
> @@ -2303,7 +2303,7 @@ static inline void gen_op_movl_seg_T0_vm(DisasContext *s, int seg_reg)
>   
>   /* move T0 to seg_reg and compute if the CPU state may change. Never
>      call this function with seg_reg == R_CS */
> -static void gen_movl_seg_T0(DisasContext *s, int seg_reg)
> +static void gen_movl_seg_T0(DisasContext *s, X86Seg seg_reg)
>   {
>       if (s->pe && !s->vm86) {
>           tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
> 

Queued, thanks.

Paolo


