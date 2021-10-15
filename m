Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBAE42FAE6
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 20:23:27 +0200 (CEST)
Received: from localhost ([::1]:55990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbRrZ-0005Wb-Qv
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 14:23:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mbRpH-0002Z4-FY
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 14:21:03 -0400
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936]:46987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mbRpF-0005Cf-HJ
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 14:21:03 -0400
Received: by mail-ua1-x936.google.com with SMTP id u5so19672205uao.13
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 11:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hO1F1YQaDLWp8HClabUkcUudM7npUsJphWriNjR92E0=;
 b=VBe+OKcHgXEP8Fh7V/CpBTpRySmZLzf4mlJu9B5ig2ZY8B1sXBKRJJUmKi26dQKLLZ
 m/62Bwr4BI/YFr5t91s4va4kFE/R/q9c88h8HN0+GvuBkxIT6pT7cc7Col+yGJqfxKuT
 ux/85+qvKJJ0/G7KYpULeaEHpCgL3Mk2qh9XHKr+4O9EoPt7P1ctwxE//bp1I+N2wQcB
 XMCXtN53U394xVDk/XreWDI6q1+iaOpqQ+xC+90ebmEbpE6YalFlP2MPuYF6jOrNChPS
 cAGfEq6LvpdSFHeKdr3lXMUt1rqf92rG+7gMtl/FNkZ1IFdpASkOd/naW3DRnNRWJCy6
 jL7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hO1F1YQaDLWp8HClabUkcUudM7npUsJphWriNjR92E0=;
 b=hv6uQimkh9iVSRYAYQ6wkFC65WiQBZ/LaJuNgBhzhVDbKuduD0mBq+o560/WjPYRit
 VKMJUX6CyzEtTAl4/N6I2chfgmZxWQSmwiu56c7UrHIMcavn2JHxqnj195j1Grf66Dbp
 CqMD718vI5ljngGe+42nEJiwLCjgxHKFsUciR5uHGzq/zm7eKxzMqygL0VNAdu8TCqlv
 H09rQTNtF48X6CkqBObenbZyRm9b4gfWjpTR6mkOOSEIUv/45yypM3/LQvkSZgDZFWi8
 i3ODKdGtOlTdxE05gdKzQR9M9GuGmQkByqKi7RM9wbZQ+s5hvbuSi/10T4944IL67VEV
 d4dQ==
X-Gm-Message-State: AOAM531ufwGMNut2OvqyB5GFEI0jXc4UMfUROEkQxjaYGwADYAtBlUbh
 oYiPw6QtooYisA03PJA8K3Hgr6jPyycl3a89ZTVoXw==
X-Google-Smtp-Source: ABdhPJxe3JAStm7wpjUMpP2rjlLhlofPepsxkJU3cDNQvtMIOLr8ow0QU+raIWam8eVCaV8/WN7csT45F4mhGSXcB1k=
X-Received: by 2002:a67:ab48:: with SMTP id k8mr16058670vsh.30.1634322060444; 
 Fri, 15 Oct 2021 11:21:00 -0700 (PDT)
MIME-Version: 1.0
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
 <20211015041053.2769193-5-richard.henderson@linaro.org>
In-Reply-To: <20211015041053.2769193-5-richard.henderson@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 15 Oct 2021 12:20:49 -0600
Message-ID: <CANCZdfo6oqBEfh2MX0F6TScoWvHNVGXW5VxruXOgfRWauJjgsQ@mail.gmail.com>
Subject: Re: [PATCH v5 04/67] accel/tcg: Fold cpu_exit_tb_from_sighandler into
 caller
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000dc9e4c05ce684121"
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000dc9e4c05ce684121
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 14, 2021 at 10:10 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> Remove the comment about siglongjmp.  We do use sigsetjmp
> in the main cpu loop, but we do not save the signal mask
> as most exits from the cpu loop do not require them.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/user-exec.c | 14 ++------------
>  1 file changed, 2 insertions(+), 12 deletions(-)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>



> diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
> index cb63e528c5..744af19397 100644
> --- a/accel/tcg/user-exec.c
> +++ b/accel/tcg/user-exec.c
> @@ -46,17 +46,6 @@ __thread uintptr_t helper_retaddr;
>
>  //#define DEBUG_SIGNAL
>
> -/* exit the current TB from a signal handler. The host registers are
> -   restored in a state compatible with the CPU emulator
> - */
> -static void QEMU_NORETURN cpu_exit_tb_from_sighandler(CPUState *cpu,
> -                                                      sigset_t *old_set)
> -{
> -    /* XXX: use siglongjmp ? */
> -    sigprocmask(SIG_SETMASK, old_set, NULL);
> -    cpu_loop_exit_noexc(cpu);
> -}
> -
>  /*
>   * Adjust the pc to pass to cpu_restore_state; return the memop type.
>   */
> @@ -155,7 +144,8 @@ bool handle_sigsegv_accerr_write(CPUState *cpu,
> sigset_t *old_set,
>           * currently executing TB was modified and must be exited
>           * immediately.  Clear helper_retaddr for next execution.
>           */
> -        cpu_exit_tb_from_sighandler(cpu, old_set);
> +        sigprocmask(SIG_SETMASK, old_set, NULL);
> +        cpu_loop_exit_noexc(cpu);
>          /* NORETURN */
>      default:
>          g_assert_not_reached();
> --
> 2.25.1
>
>

--000000000000dc9e4c05ce684121
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 14, 2021 at 10:10 PM Rich=
ard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.h=
enderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">Remove the comment about siglongjmp.=C2=A0 We do use sig=
setjmp<br>
in the main cpu loop, but we do not save the signal mask<br>
as most exits from the cpu loop do not require them.<br>
<br>
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
=C2=A0accel/tcg/user-exec.c | 14 ++------------<br>
=C2=A01 file changed, 2 insertions(+), 12 deletions(-)<br></blockquote><div=
><br></div><div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsd=
imp.com">imp@bsdimp.com</a>&gt;</div><br class=3D"gmail-Apple-interchange-n=
ewline"></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c<br>
index cb63e528c5..744af19397 100644<br>
--- a/accel/tcg/user-exec.c<br>
+++ b/accel/tcg/user-exec.c<br>
@@ -46,17 +46,6 @@ __thread uintptr_t helper_retaddr;<br>
<br>
=C2=A0//#define DEBUG_SIGNAL<br>
<br>
-/* exit the current TB from a signal handler. The host registers are<br>
-=C2=A0 =C2=A0restored in a state compatible with the CPU emulator<br>
- */<br>
-static void QEMU_NORETURN cpu_exit_tb_from_sighandler(CPUState *cpu,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sigset_t *old_set)<br>
-{<br>
-=C2=A0 =C2=A0 /* XXX: use siglongjmp ? */<br>
-=C2=A0 =C2=A0 sigprocmask(SIG_SETMASK, old_set, NULL);<br>
-=C2=A0 =C2=A0 cpu_loop_exit_noexc(cpu);<br>
-}<br>
-<br>
=C2=A0/*<br>
=C2=A0 * Adjust the pc to pass to cpu_restore_state; return the memop type.=
<br>
=C2=A0 */<br>
@@ -155,7 +144,8 @@ bool handle_sigsegv_accerr_write(CPUState *cpu, sigset_=
t *old_set,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * currently executing TB was modified an=
d must be exited<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * immediately.=C2=A0 Clear helper_retadd=
r for next execution.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_exit_tb_from_sighandler(cpu, old_set);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sigprocmask(SIG_SETMASK, old_set, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_loop_exit_noexc(cpu);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* NORETURN */<br>
=C2=A0 =C2=A0 =C2=A0default:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_assert_not_reached();<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--000000000000dc9e4c05ce684121--

