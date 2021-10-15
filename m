Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 533AF42FBD7
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 21:16:18 +0200 (CEST)
Received: from localhost ([::1]:59398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbSgj-0007BE-0L
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 15:16:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mbSXm-00080U-TX
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 15:07:04 -0400
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a]:43780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mbSXl-00067P-4e
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 15:07:02 -0400
Received: by mail-vk1-xa2a.google.com with SMTP id j38so5629122vkd.10
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 12:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uTao2k+ek22KqiTkhbTZs9kISXxPfxdlEm4JRY+i5+c=;
 b=Topx1zFOUFo5EZzHoksr5BvxE62L0fdu1aDKshSc95TP4m8Urxxalw4aGD39Mi9HhG
 EPsvo6V4tdzc2a6HZhBMUtTNKVVHtLf2ML84exNDktcRcD70X/YOVbY0lV+3t/PuSs6i
 UBfeDySjOcfGiIw3JlUxD43LnlhstFq+rgemeOIIVZjIf9BlIo17XjOkdMtuhTLcnP9B
 /ut2FKZ82EepHH1v5/vDWnUV5PcgHXKHvuTW1f6tNrfgUohB7pcA6m3jrOT3M1Ak8Xrn
 gG35UTx/HQngIpSykUztb7XUjQjH2zOHlocTOx46hKFyYQ/iwmfY0aazhpMwFcZN1xMR
 9Z+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uTao2k+ek22KqiTkhbTZs9kISXxPfxdlEm4JRY+i5+c=;
 b=6xySXxZPvQ7Wa+Hf0C8C2UlD4VTtCpMNqc+HTvuwZbEVcJ4lif1/ioK8bpXN+jdvEJ
 Yb7V32O6dwyq2VOIStiGKpszJCHu8MsRZmSYnDiwSiRLvaStMLmqG4FCQDQsrDcqyT8D
 I0ebY7eErx8imyqUFQfve6qWtz8zSFJW+19BytweaH01AkyX5165nUBVBMsHqX7OUxKb
 a18jli2Y93/FsoRuvMc9NmwPhF790GI2V3OKw4/zwm1ac73h8enkd+0oy8LCQyV2aBZG
 GSMwHKqbvg2UVlKANBEt4cobtbIHZG6yDejfpV88S9UXRyw2hm0tRNEOrIUm00ula6pp
 EnBA==
X-Gm-Message-State: AOAM530CI42S1uyqEI5LXV1CaF67zCl2Bweu9HZpQmocRWEhuoH9qPU/
 /tTcAzaQbB6bDHJWr6QsGynpBUlreuIEue/Td1nFFA==
X-Google-Smtp-Source: ABdhPJyU/TJEM6MOGa415P2i2104XG0neVTxA4c29z2YhRQiN7QOvtM6aXRfcs9O2P5IJ1fi1iSk6zyBMOhw8557mCU=
X-Received: by 2002:a1f:2006:: with SMTP id g6mr14253525vkg.22.1634324819694; 
 Fri, 15 Oct 2021 12:06:59 -0700 (PDT)
MIME-Version: 1.0
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
 <20211015041053.2769193-52-richard.henderson@linaro.org>
In-Reply-To: <20211015041053.2769193-52-richard.henderson@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 15 Oct 2021 13:06:48 -0600
Message-ID: <CANCZdfq79oKc8VMg3Y_N-tbp0t=-rgnFg50N7ZmWOW03cZnyBg@mail.gmail.com>
Subject: Re: [PATCH v5 51/67] target/ppc: Restrict ppc_cpu_do_unaligned_access
 to sysemu
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000053704305ce68e605"
Received-SPF: none client-ip=2607:f8b0:4864:20::a2a;
 envelope-from=wlosh@bsdimp.com; helo=mail-vk1-xa2a.google.com
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

--00000000000053704305ce68e605
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 14, 2021 at 10:14 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> This is not used by, nor required by, user-only.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/ppc/internal.h    | 8 +++-----
>  target/ppc/excp_helper.c | 8 +++-----
>  2 files changed, 6 insertions(+), 10 deletions(-)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>



> diff --git a/target/ppc/internal.h b/target/ppc/internal.h
> index 339974b7d8..6aa9484f34 100644
> --- a/target/ppc/internal.h
> +++ b/target/ppc/internal.h
> @@ -211,11 +211,6 @@ void helper_compute_fprf_float16(CPUPPCState *env,
> float16 arg);
>  void helper_compute_fprf_float32(CPUPPCState *env, float32 arg);
>  void helper_compute_fprf_float128(CPUPPCState *env, float128 arg);
>
> -/* Raise a data fault alignment exception for the specified virtual
> address */
> -void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
> -                                 MMUAccessType access_type, int mmu_idx,
> -                                 uintptr_t retaddr) QEMU_NORETURN;
> -
>  /* translate.c */
>
>  int ppc_fixup_cpu(PowerPCCPU *cpu);
> @@ -291,6 +286,9 @@ void ppc_cpu_record_sigsegv(CPUState *cs, vaddr addr,
>  bool ppc_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>                        MMUAccessType access_type, int mmu_idx,
>                        bool probe, uintptr_t retaddr);
> +void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
> +                                 MMUAccessType access_type, int mmu_idx,
> +                                 uintptr_t retaddr) QEMU_NORETURN;
>  #endif
>
>  #endif /* PPC_INTERNAL_H */
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index e568a54536..17607adbe4 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -1454,11 +1454,8 @@ void helper_book3s_msgsndp(CPUPPCState *env,
> target_ulong rb)
>
>      book3s_msgsnd_common(pir, PPC_INTERRUPT_DOORBELL);
>  }
> -#endif
> -#endif /* CONFIG_TCG */
> -#endif
> +#endif /* TARGET_PPC64 */
>
> -#ifdef CONFIG_TCG
>  void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
>                                   MMUAccessType access_type,
>                                   int mmu_idx, uintptr_t retaddr)
> @@ -1483,4 +1480,5 @@ void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr
> vaddr,
>      env->error_code = 0;
>      cpu_loop_exit_restore(cs, retaddr);
>  }
> -#endif
> +#endif /* CONFIG_TCG */
> +#endif /* !CONFIG_USER_ONLY */
> --
> 2.25.1
>
>

--00000000000053704305ce68e605
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 14, 2021 at 10:14 PM Rich=
ard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.h=
enderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">This is not used by, nor required by, user-only.<br>
<br>
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
=C2=A0target/ppc/internal.h=C2=A0 =C2=A0 | 8 +++-----<br>
=C2=A0target/ppc/excp_helper.c | 8 +++-----<br>
=C2=A02 files changed, 6 insertions(+), 10 deletions(-)<br></blockquote><di=
v><br></div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.=
com">imp@bsdimp.com</a>&gt;</div><div><br></div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
diff --git a/target/ppc/internal.h b/target/ppc/internal.h<br>
index 339974b7d8..6aa9484f34 100644<br>
--- a/target/ppc/internal.h<br>
+++ b/target/ppc/internal.h<br>
@@ -211,11 +211,6 @@ void helper_compute_fprf_float16(CPUPPCState *env, flo=
at16 arg);<br>
=C2=A0void helper_compute_fprf_float32(CPUPPCState *env, float32 arg);<br>
=C2=A0void helper_compute_fprf_float128(CPUPPCState *env, float128 arg);<br=
>
<br>
-/* Raise a data fault alignment exception for the specified virtual addres=
s */<br>
-void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MMUAccessType access_type, int=
 mmu_idx,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uintptr_t retaddr) QEMU_NORETU=
RN;<br>
-<br>
=C2=A0/* translate.c */<br>
<br>
=C2=A0int ppc_fixup_cpu(PowerPCCPU *cpu);<br>
@@ -291,6 +286,9 @@ void ppc_cpu_record_sigsegv(CPUState *cs, vaddr addr,<b=
r>
=C2=A0bool ppc_cpu_tlb_fill(CPUState *cs, vaddr address, int size,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0MMUAccessType access_type, int mmu_idx,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0bool probe, uintptr_t retaddr);<br>
+void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MMUAccessType access_type, int=
 mmu_idx,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uintptr_t retaddr) QEMU_NORETU=
RN;<br>
=C2=A0#endif<br>
<br>
=C2=A0#endif /* PPC_INTERNAL_H */<br>
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c<br>
index e568a54536..17607adbe4 100644<br>
--- a/target/ppc/excp_helper.c<br>
+++ b/target/ppc/excp_helper.c<br>
@@ -1454,11 +1454,8 @@ void helper_book3s_msgsndp(CPUPPCState *env, target_=
ulong rb)<br>
<br>
=C2=A0 =C2=A0 =C2=A0book3s_msgsnd_common(pir, PPC_INTERRUPT_DOORBELL);<br>
=C2=A0}<br>
-#endif<br>
-#endif /* CONFIG_TCG */<br>
-#endif<br>
+#endif /* TARGET_PPC64 */<br>
<br>
-#ifdef CONFIG_TCG<br>
=C2=A0void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MMUAccessType access_type,<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int mmu_idx, uintptr_t retadd=
r)<br>
@@ -1483,4 +1480,5 @@ void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr =
vaddr,<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;error_code =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0cpu_loop_exit_restore(cs, retaddr);<br>
=C2=A0}<br>
-#endif<br>
+#endif /* CONFIG_TCG */<br>
+#endif /* !CONFIG_USER_ONLY */<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--00000000000053704305ce68e605--

