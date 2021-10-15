Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 182D142FAD4
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 20:19:49 +0200 (CEST)
Received: from localhost ([::1]:47728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbRo3-0008Jb-Np
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 14:19:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mbRn9-0007dW-S5
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 14:18:51 -0400
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936]:37626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mbRn7-0003NF-Ai
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 14:18:51 -0400
Received: by mail-ua1-x936.google.com with SMTP id f4so19763390uad.4
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 11:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/Xn/pE87uv34mCpnx0YUWGixbGHG3QY4AKuaPKhQ42M=;
 b=DK9R9y47Nkj8tkgp8nkklOf2O93XQEj4b+oXTgnu19XSResRBNS/708+FiMqJbkkxY
 sdiqBhc7zLs3PIGobxJ34+NMjP4cOjEJHB/Ns0I2zbjf4ZQkJ3hHkXItLPB+FNe3k3nk
 M+3X1AyBUGaJ5dP8XUQGeh/uXMm33BRJsCPZimXCtGAXFzWNXJn2RzcPYLUFN+eEIxfQ
 qEg55tcI/i3R0pX8K3vL3RiXUVpMtkSlqn5ZHI5a9ksMUvLR7HWoaHLMeNvhB0E3x6A/
 jfemmEZXuEoQB0oZ1OlhehAA5xRXb5qpkfl04pG/zCCCyPZXviSOC++iKEM5IHM+rDHV
 3uMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/Xn/pE87uv34mCpnx0YUWGixbGHG3QY4AKuaPKhQ42M=;
 b=dBlUZwObntXYx1f6pNQD8o3skSoJ41hwtofByx0DmudCjSCmSLqgemsqCJHWEufXFL
 HeRrowPJaJYc3Tr4YM7eQhYXxEtE7N00oR7boxOHIOcZjHeaRPsd21eUEu8WHOJLZs4k
 zBWilq7trFntDwkEN1zUNAwolG6TknUnjcecMmcfVdp4nZupN8AOVdH0O8xXg00g0hCU
 1qVv2NGGkUrFkX4EityxckQe5nc6ZFCTlj8l8bAyV5ln8tAPN5cRP5xN3mnaRRr9z+hO
 wvLavjJi80WLIh8QQb1hZA9pQ+c3j9eRGJShKiyjSSBM68zCyMnvLkW3vydK6v5hq8NR
 yInw==
X-Gm-Message-State: AOAM533PVCTj4yeszULGESjP5Cw8mzdMLYcwghCGrlqApQrS1M5oXoAf
 +TF/k1nGdECakb1cocvAhkTi2IWFP6d3POE4hllL2g==
X-Google-Smtp-Source: ABdhPJwEn8XIXaHDYPU0w9Qf5tuXKLXJEfDE31z26ms0WmYSFEpByYz3NekRv5pCpjyhbbpqSaL9WeoOpxD3qQxKma0=
X-Received: by 2002:ab0:7688:: with SMTP id v8mr14318134uaq.77.1634321927112; 
 Fri, 15 Oct 2021 11:18:47 -0700 (PDT)
MIME-Version: 1.0
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
 <20211015041053.2769193-2-richard.henderson@linaro.org>
In-Reply-To: <20211015041053.2769193-2-richard.henderson@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 15 Oct 2021 12:18:36 -0600
Message-ID: <CANCZdfr4E2CFRN-NoST6fmR9AKS6eN4OGdibgUEerMscgiJoeA@mail.gmail.com>
Subject: Re: [PATCH v5 01/67] accel/tcg: Split out adjust_signal_pc
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000ea223305ce683969"
Received-SPF: none client-ip=2607:f8b0:4864:20::936;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x936.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ea223305ce683969
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 14, 2021 at 10:10 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> Split out a function to adjust the raw signal pc into a
> value that could be passed to cpu_restore_state.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Adjust pc in place; return MMUAccessType.
> ---
>  include/exec/exec-all.h | 10 ++++++++++
>  accel/tcg/user-exec.c   | 41 +++++++++++++++++++++++++----------------
>  2 files changed, 35 insertions(+), 16 deletions(-)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>


> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index 9d5987ba04..e54f8e5d65 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -663,6 +663,16 @@ static inline tb_page_addr_t
> get_page_addr_code_hostp(CPUArchState *env,
>      return addr;
>  }
>
> +/**
> + * adjust_signal_pc:
> + * @pc: raw pc from the host signal ucontext_t.
> + * @is_write: host memory operation was write, or read-modify-write.
> + *
> + * Alter @pc as required for unwinding.  Return the type of the
> + * guest memory access -- host reads may be for guest execution.
> + */
> +MMUAccessType adjust_signal_pc(uintptr_t *pc, bool is_write);
> +
>  /**
>   * cpu_signal_handler
>   * @signum: host signal number
> diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
> index e6bb29b42d..c02d509ec6 100644
> --- a/accel/tcg/user-exec.c
> +++ b/accel/tcg/user-exec.c
> @@ -57,18 +57,11 @@ static void QEMU_NORETURN
> cpu_exit_tb_from_sighandler(CPUState *cpu,
>      cpu_loop_exit_noexc(cpu);
>  }
>
> -/* 'pc' is the host PC at which the exception was raised. 'address' is
> -   the effective address of the memory exception. 'is_write' is 1 if a
> -   write caused the exception and otherwise 0'. 'old_set' is the
> -   signal set which should be restored */
> -static inline int handle_cpu_signal(uintptr_t pc, siginfo_t *info,
> -                                    int is_write, sigset_t *old_set)
> +/*
> + * Adjust the pc to pass to cpu_restore_state; return the memop type.
> + */
> +MMUAccessType adjust_signal_pc(uintptr_t *pc, bool is_write)
>  {
> -    CPUState *cpu =3D current_cpu;
> -    CPUClass *cc;
> -    unsigned long address =3D (unsigned long)info->si_addr;
> -    MMUAccessType access_type =3D is_write ? MMU_DATA_STORE : MMU_DATA_L=
OAD;
> -
>      switch (helper_retaddr) {
>      default:
>          /*
> @@ -77,7 +70,7 @@ static inline int handle_cpu_signal(uintptr_t pc,
> siginfo_t *info,
>           * pointer into the generated code that will unwind to the
>           * correct guest pc.
>           */
> -        pc =3D helper_retaddr;
> +        *pc =3D helper_retaddr;
>          break;
>
>      case 0:
> @@ -97,7 +90,7 @@ static inline int handle_cpu_signal(uintptr_t pc,
> siginfo_t *info,
>           * Therefore, adjust to compensate for what will be done later
>           * by cpu_restore_state_from_tb.
>           */
> -        pc +=3D GETPC_ADJ;
> +        *pc +=3D GETPC_ADJ;
>          break;
>
>      case 1:
> @@ -113,12 +106,28 @@ static inline int handle_cpu_signal(uintptr_t pc,
> siginfo_t *info,
>           *
>           * Like tb_gen_code, release the memory lock before cpu_loop_exi=
t.
>           */
> -        pc =3D 0;
> -        access_type =3D MMU_INST_FETCH;
>          mmap_unlock();
> -        break;
> +        *pc =3D 0;
> +        return MMU_INST_FETCH;
>      }
>
> +    return is_write ? MMU_DATA_STORE : MMU_DATA_LOAD;
> +}
> +
> +/*
> + * 'pc' is the host PC at which the exception was raised.
> + * 'address' is the effective address of the memory exception.
> + * 'is_write' is 1 if a write caused the exception and otherwise 0.
> + * 'old_set' is the signal set which should be restored.
> + */
> +static inline int handle_cpu_signal(uintptr_t pc, siginfo_t *info,
> +                                    int is_write, sigset_t *old_set)
> +{
> +    CPUState *cpu =3D current_cpu;
> +    CPUClass *cc;
> +    unsigned long address =3D (unsigned long)info->si_addr;
> +    MMUAccessType access_type =3D adjust_signal_pc(&pc, is_write);
> +
>      /* For synchronous signals we expect to be coming from the vCPU
>       * thread (so current_cpu should be valid) and either from running
>       * code or during translation which can fault as we cross pages.
> --
> 2.25.1
>
>

--000000000000ea223305ce683969
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 14, 2021 at 10:10 PM Rich=
ard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.h=
enderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">Split out a function to adjust the raw signal pc into a<=
br>
value that could be passed to cpu_restore_state.<br>
<br>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.=
org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
v2: Adjust pc in place; return MMUAccessType.<br>
---<br>
=C2=A0include/exec/exec-all.h | 10 ++++++++++<br>
=C2=A0accel/tcg/user-exec.c=C2=A0 =C2=A0| 41 +++++++++++++++++++++++++-----=
-----------<br>
=C2=A02 files changed, 35 insertions(+), 16 deletions(-)<br></blockquote><d=
iv><br></div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp=
.com">imp@bsdimp.com</a>&gt;</div><div>=C2=A0<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h<br>
index 9d5987ba04..e54f8e5d65 100644<br>
--- a/include/exec/exec-all.h<br>
+++ b/include/exec/exec-all.h<br>
@@ -663,6 +663,16 @@ static inline tb_page_addr_t get_page_addr_code_hostp(=
CPUArchState *env,<br>
=C2=A0 =C2=A0 =C2=A0return addr;<br>
=C2=A0}<br>
<br>
+/**<br>
+ * adjust_signal_pc:<br>
+ * @pc: raw pc from the host signal ucontext_t.<br>
+ * @is_write: host memory operation was write, or read-modify-write.<br>
+ *<br>
+ * Alter @pc as required for unwinding.=C2=A0 Return the type of the<br>
+ * guest memory access -- host reads may be for guest execution.<br>
+ */<br>
+MMUAccessType adjust_signal_pc(uintptr_t *pc, bool is_write);<br>
+<br>
=C2=A0/**<br>
=C2=A0 * cpu_signal_handler<br>
=C2=A0 * @signum: host signal number<br>
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c<br>
index e6bb29b42d..c02d509ec6 100644<br>
--- a/accel/tcg/user-exec.c<br>
+++ b/accel/tcg/user-exec.c<br>
@@ -57,18 +57,11 @@ static void QEMU_NORETURN cpu_exit_tb_from_sighandler(C=
PUState *cpu,<br>
=C2=A0 =C2=A0 =C2=A0cpu_loop_exit_noexc(cpu);<br>
=C2=A0}<br>
<br>
-/* &#39;pc&#39; is the host PC at which the exception was raised. &#39;add=
ress&#39; is<br>
-=C2=A0 =C2=A0the effective address of the memory exception. &#39;is_write&=
#39; is 1 if a<br>
-=C2=A0 =C2=A0write caused the exception and otherwise 0&#39;. &#39;old_set=
&#39; is the<br>
-=C2=A0 =C2=A0signal set which should be restored */<br>
-static inline int handle_cpu_signal(uintptr_t pc, siginfo_t *info,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int is_write, sigset_t=
 *old_set)<br>
+/*<br>
+ * Adjust the pc to pass to cpu_restore_state; return the memop type.<br>
+ */<br>
+MMUAccessType adjust_signal_pc(uintptr_t *pc, bool is_write)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 CPUState *cpu =3D current_cpu;<br>
-=C2=A0 =C2=A0 CPUClass *cc;<br>
-=C2=A0 =C2=A0 unsigned long address =3D (unsigned long)info-&gt;si_addr;<b=
r>
-=C2=A0 =C2=A0 MMUAccessType access_type =3D is_write ? MMU_DATA_STORE : MM=
U_DATA_LOAD;<br>
-<br>
=C2=A0 =C2=A0 =C2=A0switch (helper_retaddr) {<br>
=C2=A0 =C2=A0 =C2=A0default:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
@@ -77,7 +70,7 @@ static inline int handle_cpu_signal(uintptr_t pc, siginfo=
_t *info,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * pointer into the generated code that w=
ill unwind to the<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * correct guest pc.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 pc =3D helper_retaddr;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *pc =3D helper_retaddr;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
<br>
=C2=A0 =C2=A0 =C2=A0case 0:<br>
@@ -97,7 +90,7 @@ static inline int handle_cpu_signal(uintptr_t pc, siginfo=
_t *info,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Therefore, adjust to compensate for wh=
at will be done later<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * by cpu_restore_state_from_tb.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 pc +=3D GETPC_ADJ;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *pc +=3D GETPC_ADJ;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
<br>
=C2=A0 =C2=A0 =C2=A0case 1:<br>
@@ -113,12 +106,28 @@ static inline int handle_cpu_signal(uintptr_t pc, sig=
info_t *info,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Like tb_gen_code, release the memory l=
ock before cpu_loop_exit.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 pc =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 access_type =3D MMU_INST_FETCH;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mmap_unlock();<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *pc =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return MMU_INST_FETCH;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 return is_write ? MMU_DATA_STORE : MMU_DATA_LOAD;<br>
+}<br>
+<br>
+/*<br>
+ * &#39;pc&#39; is the host PC at which the exception was raised.<br>
+ * &#39;address&#39; is the effective address of the memory exception.<br>
+ * &#39;is_write&#39; is 1 if a write caused the exception and otherwise 0=
.<br>
+ * &#39;old_set&#39; is the signal set which should be restored.<br>
+ */<br>
+static inline int handle_cpu_signal(uintptr_t pc, siginfo_t *info,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int is_write, sigset_t=
 *old_set)<br>
+{<br>
+=C2=A0 =C2=A0 CPUState *cpu =3D current_cpu;<br>
+=C2=A0 =C2=A0 CPUClass *cc;<br>
+=C2=A0 =C2=A0 unsigned long address =3D (unsigned long)info-&gt;si_addr;<b=
r>
+=C2=A0 =C2=A0 MMUAccessType access_type =3D adjust_signal_pc(&amp;pc, is_w=
rite);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0/* For synchronous signals we expect to be coming from =
the vCPU<br>
=C2=A0 =C2=A0 =C2=A0 * thread (so current_cpu should be valid) and either f=
rom running<br>
=C2=A0 =C2=A0 =C2=A0 * code or during translation which can fault as we cro=
ss pages.<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--000000000000ea223305ce683969--

