Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC5D42FB1E
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 20:39:11 +0200 (CEST)
Received: from localhost ([::1]:58550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbS6o-0001NU-Li
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 14:39:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mbS3I-0005Lt-6j
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 14:35:32 -0400
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930]:44767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mbS3G-0002XD-3K
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 14:35:31 -0400
Received: by mail-ua1-x930.google.com with SMTP id r22so9020350uat.11
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 11:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bflRescoGNdFJXapDyVnPLhuPQKFEVMiDQNO4fxVpV4=;
 b=Wz3fyJ7wPoUMmtLNY2hq8JCw3busP+G5RjA7uT9dYv2coyIg4uKN4ukBve2ikMDsOk
 jMrnuo2QAuVozIu3NV0w2ouzHY5ucRMyj/O+ZoeTJvfaKNrSO9f1U6j/P2CVnpg4LacE
 8046nuPDoXcfQTilsB8F3X4Pl8P7Yxp/F7BJb6m4dzOZ4JVtmIi0rYHIS0YrmumRg62J
 6sxDYn064OhFyPdHdvL08bDxyekYkO00Ojdn5OfQEOEZ0EozKZYtyhjOJoKtPRfREseN
 Vau4/fbmRSbLbn9tsWceskbiHS2X0JmtWgcAfQRNSUy/dlCpqQIXvobDwc1Y0iIWq2/J
 VjIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bflRescoGNdFJXapDyVnPLhuPQKFEVMiDQNO4fxVpV4=;
 b=6TjVeIpM0NQysVZNdSWHOFyHA53N6PCUqP6R0cPC1Aiaev1SlUZG0YFQ5sdGXGbCXp
 WftLWSmrpIOMiVNv+BC60Apg51gkmMZlMX3s0OF8O5b/lm+UDakdCAfaxzBfAJUcW77x
 aNj/lRfR/Q5hgzCvvSGZuhOwymDlZOXcnvbXAtHRakFf4F/2HLnfMNpasx2dO/iWLH+e
 xwGKl+yXi48iEW0kwMrRn0OLHqt/tMJFcs+O+4D2G6ulf5GEVYvnfVhwJXPYFYY00sPQ
 F7lIfbD6C1NQizDlJFGBFOxI69deBti89ncr2HNv7SDV5lhC6uneZAvusY+1wsAf5cSF
 cYsw==
X-Gm-Message-State: AOAM531bh2NrBLy3i5Q88JcxOPQPYEz09qexDMe4mYhbHj4JZ6XZXHZM
 X/JoXSnctpa7SdCngzs5k7qZtxDnu7oqbjAtUlhRgQ==
X-Google-Smtp-Source: ABdhPJywl8nTFwE9coUjDHYOBP6/19hVf4vmdhEwJcDTqWMAlYGaf5NzRb7c/bPHASX85x1oxeJNbHf+/MWQWeNueXk=
X-Received: by 2002:a67:fc8b:: with SMTP id x11mr15801809vsp.12.1634322928854; 
 Fri, 15 Oct 2021 11:35:28 -0700 (PDT)
MIME-Version: 1.0
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
 <20211015041053.2769193-24-richard.henderson@linaro.org>
In-Reply-To: <20211015041053.2769193-24-richard.henderson@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 15 Oct 2021 12:35:17 -0600
Message-ID: <CANCZdfqGQU52Ruk0JRGaO3HQahX8qfcNhF7c3MzWxM-GgSs1qQ@mail.gmail.com>
Subject: Re: [PATCH v5 23/67] target/arm: Implement arm_cpu_record_sigsegv
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000009f7dfe05ce6875f0"
Received-SPF: none client-ip=2607:f8b0:4864:20::930;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x930.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000009f7dfe05ce6875f0
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 14, 2021 at 10:11 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> Because of the complexity of setting ESR, continue to use
> arm_deliver_fault.  This means we cannot remove the code
> within cpu_loop that decodes EXCP_DATA_ABORT and
> EXCP_PREFETCH_ABORT.
>
> But using the new hook means that we don't have to do the
> page_get_flags check manually, and we'll be able to restrict
> the tlb_fill hook to sysemu later.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/internals.h  |  6 ++++++
>  target/arm/cpu.c        |  6 ++++--
>  target/arm/cpu_tcg.c    |  6 ++++--
>  target/arm/tlb_helper.c | 36 +++++++++++++++++++-----------------
>  4 files changed, 33 insertions(+), 21 deletions(-)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>



> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 3612107ab2..5a7aaf0f51 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -544,9 +544,15 @@ static inline bool arm_extabort_type(MemTxResult
> result)
>      return result != MEMTX_DECODE_ERROR;
>  }
>
> +#ifdef CONFIG_USER_ONLY
> +void arm_cpu_record_sigsegv(CPUState *cpu, vaddr addr,
> +                            MMUAccessType access_type,
> +                            bool maperr, uintptr_t ra);
> +#else
>  bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>                        MMUAccessType access_type, int mmu_idx,
>                        bool probe, uintptr_t retaddr);
> +#endif
>
>  static inline int arm_to_core_mmu_idx(ARMMMUIdx mmu_idx)
>  {
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 641a8c2d3d..7a18a58ca0 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -2031,10 +2031,12 @@ static const struct SysemuCPUOps arm_sysemu_ops = {
>  static const struct TCGCPUOps arm_tcg_ops = {
>      .initialize = arm_translate_init,
>      .synchronize_from_tb = arm_cpu_synchronize_from_tb,
> -    .tlb_fill = arm_cpu_tlb_fill,
>      .debug_excp_handler = arm_debug_excp_handler,
>
> -#if !defined(CONFIG_USER_ONLY)
> +#ifdef CONFIG_USER_ONLY
> +    .record_sigsegv = arm_cpu_record_sigsegv,
> +#else
> +    .tlb_fill = arm_cpu_tlb_fill,
>      .cpu_exec_interrupt = arm_cpu_exec_interrupt,
>      .do_interrupt = arm_cpu_do_interrupt,
>      .do_transaction_failed = arm_cpu_do_transaction_failed,
> diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
> index 0d5adccf1a..7b3bea2fbb 100644
> --- a/target/arm/cpu_tcg.c
> +++ b/target/arm/cpu_tcg.c
> @@ -898,10 +898,12 @@ static void pxa270c5_initfn(Object *obj)
>  static const struct TCGCPUOps arm_v7m_tcg_ops = {
>      .initialize = arm_translate_init,
>      .synchronize_from_tb = arm_cpu_synchronize_from_tb,
> -    .tlb_fill = arm_cpu_tlb_fill,
>      .debug_excp_handler = arm_debug_excp_handler,
>
> -#if !defined(CONFIG_USER_ONLY)
> +#ifdef CONFIG_USER_ONLY
> +    .record_sigsegv = arm_cpu_record_sigsegv,
> +#else
> +    .tlb_fill = arm_cpu_tlb_fill,
>      .cpu_exec_interrupt = arm_v7m_cpu_exec_interrupt,
>      .do_interrupt = arm_v7m_cpu_do_interrupt,
>      .do_transaction_failed = arm_cpu_do_transaction_failed,
> diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
> index 3107f9823e..dc5860180f 100644
> --- a/target/arm/tlb_helper.c
> +++ b/target/arm/tlb_helper.c
> @@ -147,28 +147,12 @@ void arm_cpu_do_transaction_failed(CPUState *cs,
> hwaddr physaddr,
>      arm_deliver_fault(cpu, addr, access_type, mmu_idx, &fi);
>  }
>
> -#endif /* !defined(CONFIG_USER_ONLY) */
> -
>  bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>                        MMUAccessType access_type, int mmu_idx,
>                        bool probe, uintptr_t retaddr)
>  {
>      ARMCPU *cpu = ARM_CPU(cs);
>      ARMMMUFaultInfo fi = {};
> -
> -#ifdef CONFIG_USER_ONLY
> -    int flags = page_get_flags(useronly_clean_ptr(address));
> -    if (flags & PAGE_VALID) {
> -        fi.type = ARMFault_Permission;
> -    } else {
> -        fi.type = ARMFault_Translation;
> -    }
> -    fi.level = 3;
> -
> -    /* now we have a real cpu fault */
> -    cpu_restore_state(cs, retaddr, true);
> -    arm_deliver_fault(cpu, address, access_type, mmu_idx, &fi);
> -#else
>      hwaddr phys_addr;
>      target_ulong page_size;
>      int prot, ret;
> @@ -210,5 +194,23 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address,
> int size,
>          cpu_restore_state(cs, retaddr, true);
>          arm_deliver_fault(cpu, address, access_type, mmu_idx, &fi);
>      }
> -#endif
>  }
> +#else
> +void arm_cpu_record_sigsegv(CPUState *cs, vaddr addr,
> +                            MMUAccessType access_type,
> +                            bool maperr, uintptr_t ra)
> +{
> +    ARMMMUFaultInfo fi = {
> +        .type = maperr ? ARMFault_Translation : ARMFault_Permission,
> +        .level = 3,
> +    };
> +    ARMCPU *cpu = ARM_CPU(cs);
> +
> +    /*
> +     * We report both ESR and FAR to signal handlers.
> +     * For now, it's easiest to deliver the fault normally.
> +     */
> +    cpu_restore_state(cs, ra, true);
> +    arm_deliver_fault(cpu, addr, access_type, MMU_USER_IDX, &fi);
> +}
> +#endif /* !defined(CONFIG_USER_ONLY) */
> --
> 2.25.1
>
>

--0000000000009f7dfe05ce6875f0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 14, 2021 at 10:11 PM Rich=
ard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.h=
enderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">Because of the complexity of setting ESR, continue to us=
e<br>
arm_deliver_fault.=C2=A0 This means we cannot remove the code<br>
within cpu_loop that decodes EXCP_DATA_ABORT and<br>
EXCP_PREFETCH_ABORT.<br>
<br>
But using the new hook means that we don&#39;t have to do the<br>
page_get_flags check manually, and we&#39;ll be able to restrict<br>
the tlb_fill hook to sysemu later.<br>
<br>
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
=C2=A0target/arm/internals.h=C2=A0 |=C2=A0 6 ++++++<br>
=C2=A0target/arm/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 ++++--<br>
=C2=A0target/arm/cpu_tcg.c=C2=A0 =C2=A0 |=C2=A0 6 ++++--<br>
=C2=A0target/arm/tlb_helper.c | 36 +++++++++++++++++++-----------------<br>
=C2=A04 files changed, 33 insertions(+), 21 deletions(-)<br></blockquote><d=
iv><br></div><div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@b=
sdimp.com">imp@bsdimp.com</a>&gt;</div><br class=3D"gmail-Apple-interchange=
-newline"></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
diff --git a/target/arm/internals.h b/target/arm/internals.h<br>
index 3612107ab2..5a7aaf0f51 100644<br>
--- a/target/arm/internals.h<br>
+++ b/target/arm/internals.h<br>
@@ -544,9 +544,15 @@ static inline bool arm_extabort_type(MemTxResult resul=
t)<br>
=C2=A0 =C2=A0 =C2=A0return result !=3D MEMTX_DECODE_ERROR;<br>
=C2=A0}<br>
<br>
+#ifdef CONFIG_USER_ONLY<br>
+void arm_cpu_record_sigsegv(CPUState *cpu, vaddr addr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 MMUAccessType access_type,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 bool maperr, uintptr_t ra);<br>
+#else<br>
=C2=A0bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0MMUAccessType access_type, int mmu_idx,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0bool probe, uintptr_t retaddr);<br>
+#endif<br>
<br>
=C2=A0static inline int arm_to_core_mmu_idx(ARMMMUIdx mmu_idx)<br>
=C2=A0{<br>
diff --git a/target/arm/cpu.c b/target/arm/cpu.c<br>
index 641a8c2d3d..7a18a58ca0 100644<br>
--- a/target/arm/cpu.c<br>
+++ b/target/arm/cpu.c<br>
@@ -2031,10 +2031,12 @@ static const struct SysemuCPUOps arm_sysemu_ops =3D=
 {<br>
=C2=A0static const struct TCGCPUOps arm_tcg_ops =3D {<br>
=C2=A0 =C2=A0 =C2=A0.initialize =3D arm_translate_init,<br>
=C2=A0 =C2=A0 =C2=A0.synchronize_from_tb =3D arm_cpu_synchronize_from_tb,<b=
r>
-=C2=A0 =C2=A0 .tlb_fill =3D arm_cpu_tlb_fill,<br>
=C2=A0 =C2=A0 =C2=A0.debug_excp_handler =3D arm_debug_excp_handler,<br>
<br>
-#if !defined(CONFIG_USER_ONLY)<br>
+#ifdef CONFIG_USER_ONLY<br>
+=C2=A0 =C2=A0 .record_sigsegv =3D arm_cpu_record_sigsegv,<br>
+#else<br>
+=C2=A0 =C2=A0 .tlb_fill =3D arm_cpu_tlb_fill,<br>
=C2=A0 =C2=A0 =C2=A0.cpu_exec_interrupt =3D arm_cpu_exec_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.do_interrupt =3D arm_cpu_do_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.do_transaction_failed =3D arm_cpu_do_transaction_faile=
d,<br>
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c<br>
index 0d5adccf1a..7b3bea2fbb 100644<br>
--- a/target/arm/cpu_tcg.c<br>
+++ b/target/arm/cpu_tcg.c<br>
@@ -898,10 +898,12 @@ static void pxa270c5_initfn(Object *obj)<br>
=C2=A0static const struct TCGCPUOps arm_v7m_tcg_ops =3D {<br>
=C2=A0 =C2=A0 =C2=A0.initialize =3D arm_translate_init,<br>
=C2=A0 =C2=A0 =C2=A0.synchronize_from_tb =3D arm_cpu_synchronize_from_tb,<b=
r>
-=C2=A0 =C2=A0 .tlb_fill =3D arm_cpu_tlb_fill,<br>
=C2=A0 =C2=A0 =C2=A0.debug_excp_handler =3D arm_debug_excp_handler,<br>
<br>
-#if !defined(CONFIG_USER_ONLY)<br>
+#ifdef CONFIG_USER_ONLY<br>
+=C2=A0 =C2=A0 .record_sigsegv =3D arm_cpu_record_sigsegv,<br>
+#else<br>
+=C2=A0 =C2=A0 .tlb_fill =3D arm_cpu_tlb_fill,<br>
=C2=A0 =C2=A0 =C2=A0.cpu_exec_interrupt =3D arm_v7m_cpu_exec_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.do_interrupt =3D arm_v7m_cpu_do_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.do_transaction_failed =3D arm_cpu_do_transaction_faile=
d,<br>
diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c<br>
index 3107f9823e..dc5860180f 100644<br>
--- a/target/arm/tlb_helper.c<br>
+++ b/target/arm/tlb_helper.c<br>
@@ -147,28 +147,12 @@ void arm_cpu_do_transaction_failed(CPUState *cs, hwad=
dr physaddr,<br>
=C2=A0 =C2=A0 =C2=A0arm_deliver_fault(cpu, addr, access_type, mmu_idx, &amp=
;fi);<br>
=C2=A0}<br>
<br>
-#endif /* !defined(CONFIG_USER_ONLY) */<br>
-<br>
=C2=A0bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0MMUAccessType access_type, int mmu_idx,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0bool probe, uintptr_t retaddr)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0ARMCPU *cpu =3D ARM_CPU(cs);<br>
=C2=A0 =C2=A0 =C2=A0ARMMMUFaultInfo fi =3D {};<br>
-<br>
-#ifdef CONFIG_USER_ONLY<br>
-=C2=A0 =C2=A0 int flags =3D page_get_flags(useronly_clean_ptr(address));<b=
r>
-=C2=A0 =C2=A0 if (flags &amp; PAGE_VALID) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi.type =3D ARMFault_Permission;<br>
-=C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi.type =3D ARMFault_Translation;<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 fi.level =3D 3;<br>
-<br>
-=C2=A0 =C2=A0 /* now we have a real cpu fault */<br>
-=C2=A0 =C2=A0 cpu_restore_state(cs, retaddr, true);<br>
-=C2=A0 =C2=A0 arm_deliver_fault(cpu, address, access_type, mmu_idx, &amp;f=
i);<br>
-#else<br>
=C2=A0 =C2=A0 =C2=A0hwaddr phys_addr;<br>
=C2=A0 =C2=A0 =C2=A0target_ulong page_size;<br>
=C2=A0 =C2=A0 =C2=A0int prot, ret;<br>
@@ -210,5 +194,23 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int=
 size,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_restore_state(cs, retaddr, true);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0arm_deliver_fault(cpu, address, access_ty=
pe, mmu_idx, &amp;fi);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-#endif<br>
=C2=A0}<br>
+#else<br>
+void arm_cpu_record_sigsegv(CPUState *cs, vaddr addr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 MMUAccessType access_type,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 bool maperr, uintptr_t ra)<br>
+{<br>
+=C2=A0 =C2=A0 ARMMMUFaultInfo fi =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .type =3D maperr ? ARMFault_Translation : ARMF=
ault_Permission,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .level =3D 3,<br>
+=C2=A0 =C2=A0 };<br>
+=C2=A0 =C2=A0 ARMCPU *cpu =3D ARM_CPU(cs);<br>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* We report both ESR and FAR to signal handlers.<br>
+=C2=A0 =C2=A0 =C2=A0* For now, it&#39;s easiest to deliver the fault norma=
lly.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 cpu_restore_state(cs, ra, true);<br>
+=C2=A0 =C2=A0 arm_deliver_fault(cpu, addr, access_type, MMU_USER_IDX, &amp=
;fi);<br>
+}<br>
+#endif /* !defined(CONFIG_USER_ONLY) */<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--0000000000009f7dfe05ce6875f0--

