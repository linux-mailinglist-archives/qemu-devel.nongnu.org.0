Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1D442FBC9
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 21:13:03 +0200 (CEST)
Received: from localhost ([::1]:50698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbSda-0001Pj-2B
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 15:13:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mbSa9-0004ie-M1
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 15:09:30 -0400
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a]:41902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mbSa7-0007ne-Cd
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 15:09:29 -0400
Received: by mail-ua1-x92a.google.com with SMTP id r17so20000533uaf.8
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 12:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i3KwAmTDl//K0H8dLjR6HXr/8ukTuboE1oEOOLQUC/U=;
 b=ahxFzY7HAugDVGybun57dl3k8vRpq6Z5KMQm4qdtW0qjC0uzrpBM7MREWJIaNFdKkG
 gCMgYayekZ64Ac3shOppy6/BtllSLhpLZ+iSt9HVkiS60S5nx3N/6UWiKjHj/SHT/2NR
 8LxWwua6gLw9blyq08BxXLCLU3DSnNzQPMDU7U3sEsFToJSR3FYjz1QWoXPUj1HjKD1H
 Q2411H5OnovZs7Oxyr+0+Pe9ZXkdbh/IKiXxMu8SNqk1WhMqVGLuV9qc7NHU09uABViw
 WC03aIIQKk572hbO+8DSG22RYzJ/sjXbwLHMgqWlUGMser/k/WaAUso+BIRk0YxWhGmC
 icow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i3KwAmTDl//K0H8dLjR6HXr/8ukTuboE1oEOOLQUC/U=;
 b=VHRwSEM+xKp4HD1r3SKQ0zTgPzJgSJbNMjASjwmeU+ggU5eOO+kicrvEbjBY/SloV8
 qUmOQaxYwx/2Rshvs0jIGGmHnIIt6Ah9EIumfVAnLBSszjfhCwgu6OgWrLXgwV/EP7wJ
 ZSTzkZWDH7auP5wsHJekKbR5AckWgEcaWPRoVAPtrfF3rJfXw8aeVOdMJ5kkw6ES2dEp
 3sa/ftEyPLO5I3oMR+F2SVO2nRRwJHQzRreyOtYRQs3dSemEq0lmvQ1HdDGhhHQ7oC0H
 2a12svhVAzZXFG9Bm+a7QpWODGl9XtKJH/URLYy9mBY+9rr721edYkhn2gLjvhx92flJ
 BeXA==
X-Gm-Message-State: AOAM533AFal9IpglOnZd+ufQ39Fq7JopW/7+SnnNWB6IDzWFGPEA9Pzl
 8yRyXBrrOSSSep8fBrRMH0ReczQP3B5Oxglcu2YOww==
X-Google-Smtp-Source: ABdhPJwMwr8H1Udxe2bcwC9jTvznJYTWDWcLQwOaEjmGavV8Kbj+r+1ge0sDZo5j61qyz2NGWODxtr0Z9xh7d01Znz8=
X-Received: by 2002:ab0:471d:: with SMTP id h29mr14484264uac.11.1634324965982; 
 Fri, 15 Oct 2021 12:09:25 -0700 (PDT)
MIME-Version: 1.0
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
 <20211015041053.2769193-61-richard.henderson@linaro.org>
In-Reply-To: <20211015041053.2769193-61-richard.henderson@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 15 Oct 2021 13:09:15 -0600
Message-ID: <CANCZdfq69CjmWKCODtUKgxhVEuhrPnxCcx21S-ei3CuuNUurJA@mail.gmail.com>
Subject: Re: [PATCH v5 60/67] tcg: Add helper_unaligned_{ld,
 st} for user-only sigbus
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000000b9e8c05ce68ef09"
Received-SPF: none client-ip=2607:f8b0:4864:20::92a;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x92a.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000b9e8c05ce68ef09
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 14, 2021 at 10:14 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> To be called from tcg generated code on hosts that support
> unaligned accesses natively, in response to an access that
> is supposed to be aligned.
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/tcg/tcg-ldst.h |  5 +++++
>  accel/tcg/user-exec.c  | 11 +++++++++++
>  2 files changed, 16 insertions(+)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>



> diff --git a/include/tcg/tcg-ldst.h b/include/tcg/tcg-ldst.h
> index 8c86365611..bf40942de4 100644
> --- a/include/tcg/tcg-ldst.h
> +++ b/include/tcg/tcg-ldst.h
> @@ -70,5 +70,10 @@ void helper_be_stl_mmu(CPUArchState *env, target_ulong
> addr, uint32_t val,
>  void helper_be_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
>                         MemOpIdx oi, uintptr_t retaddr);
>
> +#else
> +
> +void QEMU_NORETURN helper_unaligned_ld(CPUArchState *env, target_ulong
> addr);
> +void QEMU_NORETURN helper_unaligned_st(CPUArchState *env, target_ulong
> addr);
> +
>  #endif /* CONFIG_SOFTMMU */
>  #endif /* TCG_LDST_H */
> diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
> index 7d50dd54f6..0473ead5ab 100644
> --- a/accel/tcg/user-exec.c
> +++ b/accel/tcg/user-exec.c
> @@ -27,6 +27,7 @@
>  #include "exec/helper-proto.h"
>  #include "qemu/atomic128.h"
>  #include "trace/trace-root.h"
> +#include "tcg/tcg-ldst.h"
>  #include "internal.h"
>
>  __thread uintptr_t helper_retaddr;
> @@ -217,6 +218,16 @@ static void validate_memop(MemOpIdx oi, MemOp
> expected)
>  #endif
>  }
>
> +void helper_unaligned_ld(CPUArchState *env, target_ulong addr)
> +{
> +    cpu_loop_exit_sigbus(env_cpu(env), addr, MMU_DATA_LOAD, GETPC());
> +}
> +
> +void helper_unaligned_st(CPUArchState *env, target_ulong addr)
> +{
> +    cpu_loop_exit_sigbus(env_cpu(env), addr, MMU_DATA_STORE, GETPC());
> +}
> +
>  static void *cpu_mmu_lookup(CPUArchState *env, target_ulong addr,
>                              MemOpIdx oi, uintptr_t ra, MMUAccessType type)
>  {
> --
> 2.25.1
>
>

--0000000000000b9e8c05ce68ef09
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 14, 2021 at 10:14 PM Rich=
ard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.h=
enderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">To be called from tcg generated code on hosts that suppo=
rt<br>
unaligned accesses natively, in response to an access that<br>
is supposed to be aligned.<br>
<br>
Reviewed-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" =
target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
=C2=A0include/tcg/tcg-ldst.h |=C2=A0 5 +++++<br>
=C2=A0accel/tcg/user-exec.c=C2=A0 | 11 +++++++++++<br>
=C2=A02 files changed, 16 insertions(+)<br></blockquote><div><br></div><div=
><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com">imp@bs=
dimp.com</a>&gt;</div><div><br></div></div><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
diff --git a/include/tcg/tcg-ldst.h b/include/tcg/tcg-ldst.h<br>
index 8c86365611..bf40942de4 100644<br>
--- a/include/tcg/tcg-ldst.h<br>
+++ b/include/tcg/tcg-ldst.h<br>
@@ -70,5 +70,10 @@ void helper_be_stl_mmu(CPUArchState *env, target_ulong a=
ddr, uint32_t val,<br>
=C2=A0void helper_be_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t=
 val,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 MemOpIdx oi, uintptr_t retaddr);<br>
<br>
+#else<br>
+<br>
+void QEMU_NORETURN helper_unaligned_ld(CPUArchState *env, target_ulong add=
r);<br>
+void QEMU_NORETURN helper_unaligned_st(CPUArchState *env, target_ulong add=
r);<br>
+<br>
=C2=A0#endif /* CONFIG_SOFTMMU */<br>
=C2=A0#endif /* TCG_LDST_H */<br>
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c<br>
index 7d50dd54f6..0473ead5ab 100644<br>
--- a/accel/tcg/user-exec.c<br>
+++ b/accel/tcg/user-exec.c<br>
@@ -27,6 +27,7 @@<br>
=C2=A0#include &quot;exec/helper-proto.h&quot;<br>
=C2=A0#include &quot;qemu/atomic128.h&quot;<br>
=C2=A0#include &quot;trace/trace-root.h&quot;<br>
+#include &quot;tcg/tcg-ldst.h&quot;<br>
=C2=A0#include &quot;internal.h&quot;<br>
<br>
=C2=A0__thread uintptr_t helper_retaddr;<br>
@@ -217,6 +218,16 @@ static void validate_memop(MemOpIdx oi, MemOp expected=
)<br>
=C2=A0#endif<br>
=C2=A0}<br>
<br>
+void helper_unaligned_ld(CPUArchState *env, target_ulong addr)<br>
+{<br>
+=C2=A0 =C2=A0 cpu_loop_exit_sigbus(env_cpu(env), addr, MMU_DATA_LOAD, GETP=
C());<br>
+}<br>
+<br>
+void helper_unaligned_st(CPUArchState *env, target_ulong addr)<br>
+{<br>
+=C2=A0 =C2=A0 cpu_loop_exit_sigbus(env_cpu(env), addr, MMU_DATA_STORE, GET=
PC());<br>
+}<br>
+<br>
=C2=A0static void *cpu_mmu_lookup(CPUArchState *env, target_ulong addr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MemOpIdx oi, uintptr_t ra, MMUAccessType typ=
e)<br>
=C2=A0{<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--0000000000000b9e8c05ce68ef09--

