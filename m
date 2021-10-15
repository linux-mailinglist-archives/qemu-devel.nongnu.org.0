Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6A742FB6A
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 20:49:27 +0200 (CEST)
Received: from localhost ([::1]:45568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbSGk-0003do-Ou
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 14:49:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mbSEu-0001d5-Qm
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 14:47:32 -0400
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933]:38601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mbSEt-0008TK-7d
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 14:47:32 -0400
Received: by mail-ua1-x933.google.com with SMTP id h19so19894609uax.5
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 11:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HQFQDN2pnrwNMMjq0nAvHKmyVf2vwhxJQGo6FQ9x++I=;
 b=QXLhVUuic70yfAct9piSmELo3qDBt4SjZw7VWOFMuXCN2MIOVGBoRSiJnyuPr9r0nH
 xjfWqmTiH60cWb+X+Db6YVWLs84D9+pVVds9b5bPxU4JEph65xHkdoUjnkE3qX1mEQZL
 PDjSReHzqTdtoV8zIXqb8tJbfUSXqnObdW42ryLfL85SnFbZtwfEYHE29f1qRpJHRKTw
 jMMZ4g7WRNFB4hQ6aAP6/oQcZR2Dw/rkp9FMj0PeysoSvgl89onf5I2XgtLtBNicY0Yx
 WvUzpoASFOy1FQTAnnRyRr5gtyeXm7Br1wnSQ28ZcRJ6MswoyxUJdKzxtakt3u8/qKyK
 /Q7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HQFQDN2pnrwNMMjq0nAvHKmyVf2vwhxJQGo6FQ9x++I=;
 b=2CwBAS6uNJNguiRPeiBYU9Ng2npFyJBgx+K08yjqUJ84RjRN/If4eC26aMEWJkLoq8
 Yk4gim56KuW7Z69sh9dSk+ycAxrb/e8/28e50ZCcnCwGYa1RJUBBx+MZRW8BIiHLoNKt
 gwHn4PtXMhgjh5/NOY1/tGdoJaVUaCjrueYGCufu4NFaoNQx3czexFY41/mJABcKDTkf
 dwpcIQxfovfyNyMG/lPQtbRY8QMjFKAtt55osLTCqmNBIk2640At6H6v8VdKM4HItXwq
 6+8PbtW6DoSWt3nt9a09L55aIh1ofYWcr0e8Htoal3S64xrV4/KH35IZux4Xuy14accD
 rffw==
X-Gm-Message-State: AOAM532At38UEPRSyE4uCZFCCAVcP37uW+IrMd8pFTx23DcS1WwL4L+6
 9Zq6770XMNXsgscR4i53MQgVUchQbDwdveiNKtyvMQ==
X-Google-Smtp-Source: ABdhPJx+2McRtin4OPD2UkY+S1qnTZlzVUb2yHifk1Kl9y+fLwVci3Od8o8SeNjzaUOB9hKldANyywOUHSzXB+DDWX4=
X-Received: by 2002:a67:d28f:: with SMTP id z15mr15481367vsi.44.1634323649999; 
 Fri, 15 Oct 2021 11:47:29 -0700 (PDT)
MIME-Version: 1.0
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
 <20211015041053.2769193-44-richard.henderson@linaro.org>
In-Reply-To: <20211015041053.2769193-44-richard.henderson@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 15 Oct 2021 12:47:19 -0600
Message-ID: <CANCZdfro8idy20bNfa88J3vJ5jw+CoWnr2KxxF=5M0YoFQTJyg@mail.gmail.com>
Subject: Re: [PATCH v5 43/67] hw/core: Add TCGCPUOps.record_sigbus
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000009b4abb05ce68a020"
Received-SPF: none client-ip=2607:f8b0:4864:20::933;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x933.google.com
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

--0000000000009b4abb05ce68a020
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 14, 2021 at 10:14 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> Add a new user-only interface for updating cpu state before
> raising a signal.  This will take the place of do_unaligned_access
> for user-only and should result in less boilerplate for each guest.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/hw/core/tcg-cpu-ops.h | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>



> diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
> index 8eadd404c8..e13898553a 100644
> --- a/include/hw/core/tcg-cpu-ops.h
> +++ b/include/hw/core/tcg-cpu-ops.h
> @@ -135,6 +135,29 @@ struct TCGCPUOps {
>      void (*record_sigsegv)(CPUState *cpu, vaddr addr,
>                             MMUAccessType access_type,
>                             bool maperr, uintptr_t ra);
> +    /**
> +     * record_sigbus:
> +     * @cpu: cpu context
> +     * @addr: misaligned guest address
> +     * @access_type: access was read/write/execute
> +     * @ra: host pc for unwinding
> +     *
> +     * We are about to raise SIGBUS with si_code BUS_ADRALN,
> +     * and si_addr set for @addr.  Record anything further needed
> +     * for the signal ucontext_t.
> +     *
> +     * If the emulated kernel does not provide the signal handler with
> +     * anything besides the user context registers, and the siginfo_t,
> +     * then this hook need do nothing and may be omitted.
> +     * Otherwise, record the data and return; the caller will raise
> +     * the signal, unwind the cpu state, and return to the main loop.
> +     *
> +     * If it is simpler to re-use the sysemu do_unaligned_access code,
> +     * @ra is provided so that a "normal" cpu exception can be raised.
> +     * In this case, the signal must be raised by the architecture
> cpu_loop.
> +     */
> +    void (*record_sigbus)(CPUState *cpu, vaddr addr,
> +                          MMUAccessType access_type, uintptr_t ra);
>  #endif /* CONFIG_SOFTMMU */
>  #endif /* NEED_CPU_H */
>
> --
> 2.25.1
>
>

--0000000000009b4abb05ce68a020
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 14, 2021 at 10:14 PM Rich=
ard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.h=
enderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">Add a new user-only interface for updating cpu state bef=
ore<br>
raising a signal.=C2=A0 This will take the place of do_unaligned_access<br>
for user-only and should result in less boilerplate for each guest.<br>
<br>
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
=C2=A0include/hw/core/tcg-cpu-ops.h | 23 +++++++++++++++++++++++<br>
=C2=A01 file changed, 23 insertions(+)<br></blockquote><div><br></div><div>=
<div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com">imp@bsd=
imp.com</a>&gt;</div><br class=3D"gmail-Apple-interchange-newline"></div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h<=
br>
index 8eadd404c8..e13898553a 100644<br>
--- a/include/hw/core/tcg-cpu-ops.h<br>
+++ b/include/hw/core/tcg-cpu-ops.h<br>
@@ -135,6 +135,29 @@ struct TCGCPUOps {<br>
=C2=A0 =C2=A0 =C2=A0void (*record_sigsegv)(CPUState *cpu, vaddr addr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 MMUAccessType access_type,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 bool maperr, uintptr_t ra);<br>
+=C2=A0 =C2=A0 /**<br>
+=C2=A0 =C2=A0 =C2=A0* record_sigbus:<br>
+=C2=A0 =C2=A0 =C2=A0* @cpu: cpu context<br>
+=C2=A0 =C2=A0 =C2=A0* @addr: misaligned guest address<br>
+=C2=A0 =C2=A0 =C2=A0* @access_type: access was read/write/execute<br>
+=C2=A0 =C2=A0 =C2=A0* @ra: host pc for unwinding<br>
+=C2=A0 =C2=A0 =C2=A0*<br>
+=C2=A0 =C2=A0 =C2=A0* We are about to raise SIGBUS with si_code BUS_ADRALN=
,<br>
+=C2=A0 =C2=A0 =C2=A0* and si_addr set for @addr.=C2=A0 Record anything fur=
ther needed<br>
+=C2=A0 =C2=A0 =C2=A0* for the signal ucontext_t.<br>
+=C2=A0 =C2=A0 =C2=A0*<br>
+=C2=A0 =C2=A0 =C2=A0* If the emulated kernel does not provide the signal h=
andler with<br>
+=C2=A0 =C2=A0 =C2=A0* anything besides the user context registers, and the=
 siginfo_t,<br>
+=C2=A0 =C2=A0 =C2=A0* then this hook need do nothing and may be omitted.<b=
r>
+=C2=A0 =C2=A0 =C2=A0* Otherwise, record the data and return; the caller wi=
ll raise<br>
+=C2=A0 =C2=A0 =C2=A0* the signal, unwind the cpu state, and return to the =
main loop.<br>
+=C2=A0 =C2=A0 =C2=A0*<br>
+=C2=A0 =C2=A0 =C2=A0* If it is simpler to re-use the sysemu do_unaligned_a=
ccess code,<br>
+=C2=A0 =C2=A0 =C2=A0* @ra is provided so that a &quot;normal&quot; cpu exc=
eption can be raised.<br>
+=C2=A0 =C2=A0 =C2=A0* In this case, the signal must be raised by the archi=
tecture cpu_loop.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 void (*record_sigbus)(CPUState *cpu, vaddr addr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 MMUAccessType access_type, uintptr_t ra);<br>
=C2=A0#endif /* CONFIG_SOFTMMU */<br>
=C2=A0#endif /* NEED_CPU_H */<br>
<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--0000000000009b4abb05ce68a020--

