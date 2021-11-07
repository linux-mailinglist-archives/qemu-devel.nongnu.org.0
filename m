Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 117AE44711D
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Nov 2021 01:41:32 +0100 (CET)
Received: from localhost ([::1]:55618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjWFW-0004Kv-Mr
	for lists+qemu-devel@lfdr.de; Sat, 06 Nov 2021 20:41:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mjWDl-0003Wv-M9
 for qemu-devel@nongnu.org; Sat, 06 Nov 2021 20:39:41 -0400
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c]:34628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mjWDj-0007Iz-8L
 for qemu-devel@nongnu.org; Sat, 06 Nov 2021 20:39:41 -0400
Received: by mail-ua1-x92c.google.com with SMTP id b3so24389282uam.1
 for <qemu-devel@nongnu.org>; Sat, 06 Nov 2021 17:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aNaPm5ckV24HWwpo8ry3EGobH6NO9qqnPHil95a9hXQ=;
 b=j2mEa2W+mOn+jO36vfjhtX1A73h1OXdplpwjcaimAni7DIvgOnMHb8qxE1D2r/gDXu
 WURp0Vm5Y9xcQAyAQjpcp3pI8d08CPeb3N5w2wA72iqkRhD4BQNFfH8QLWYYleqn+TFR
 XISclBpGN9HXOagwRF/7xiEdzh0tziVajiyz5AK7klkf0zSNQJiyoNz9fq+iYTBi71Np
 VLLo+e+VTDlcI987213SC2EGMgqq5WO59ntnGeDxHSWAKpdZQTxJd9J57CnlvqhXPTVA
 QD0oGeV5mAKoXTPPPyM72sclIT75Ra33DEqmrHy+6Evq4+s1Qe5GzErw5iAtOJTBIoQK
 8lmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aNaPm5ckV24HWwpo8ry3EGobH6NO9qqnPHil95a9hXQ=;
 b=1SdPtXg5GQxN/gziXkcrGQ03jayu+LWYtar1O+fupS69tOjv6zoWs7EVCcSK6ji3Z/
 TH7KhSLfcsSZfkqk6w/uOGPoqt7YBxCUWa+uo+KP27zOTM7jO1bAogNM7XB1CR3Ty11W
 GLzyQbl2Arzfk8TDRjNkRPc7gmA1BqlvAmnDSjxP4k55qDiMG/FnHl4Oiw1sh0q8Xnxz
 iqgT7nJ7mvCPKk7i9uV+gIvs77nLf32d304yShPEu7qFXuFMGwIaL4ELHCc3GInCWkID
 14f63LoG8PMoWpVTG5uv8Fa6KxFQoflhnsEvDNA+btI2C5QKoWn1f99p7uFlqiNtWtGy
 oKqw==
X-Gm-Message-State: AOAM530un8D/lfJ9TXvxtxQbLFqoTJfeHtJCSQxELlj2l9vS52Jpgtjg
 J8AFyxvVaughX6u5qnOmfFzC0DdfbEVyyj667nSWLA==
X-Google-Smtp-Source: ABdhPJz8b5L7SJtQxZZyA15Ut/c9UgIyU3a1EaDDZQMDQl3Exr/Gd8SB6q/wa2IA1S1Hh4ZjEK+WjeyG3MLoQ+i+Oj4=
X-Received: by 2002:ab0:3d07:: with SMTP id f7mr59643185uax.11.1636245577337; 
 Sat, 06 Nov 2021 17:39:37 -0700 (PDT)
MIME-Version: 1.0
References: <20211106113916.544587-1-f4bug@amsat.org>
In-Reply-To: <20211106113916.544587-1-f4bug@amsat.org>
From: Warner Losh <imp@bsdimp.com>
Date: Sat, 6 Nov 2021 18:39:25 -0600
Message-ID: <CANCZdfqjcUBMwdkh=RvNUHd57a_Ed6ui6ciq9y8=qsdMtZOntQ@mail.gmail.com>
Subject: Re: [PATCH v2] linux-user: Mark cpu_loop() with noreturn attribute
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="000000000000671d4c05d0281c3e"
Received-SPF: none client-ip=2607:f8b0:4864:20::92c;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x92c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Bin Meng <bmeng.cn@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000671d4c05d0281c3e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 6, 2021, 5:39 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:

> cpu_loop() never exits, so mark it with QEMU_NORETURN.
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-By: Warner Losh <imp@bsdimp.com>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> v2:
> - rebased
> - restricted to linux-user
>
> Supersedes: <20210905000429.1097336-1-f4bug@amsat.org>
>

Reviewed-by: Warner Losh <imp@bsdimp.com>

bsd-user likely needs similar treatment, no?

---
>  linux-user/user-internals.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/linux-user/user-internals.h b/linux-user/user-internals.h
> index 661612a088b..c7ad00268af 100644
> --- a/linux-user/user-internals.h
> +++ b/linux-user/user-internals.h
> @@ -65,7 +65,7 @@ abi_long do_syscall(void *cpu_env, int num, abi_long
> arg1,
>                      abi_long arg5, abi_long arg6, abi_long arg7,
>                      abi_long arg8);
>  extern __thread CPUState *thread_cpu;
> -void cpu_loop(CPUArchState *env);
> +void QEMU_NORETURN cpu_loop(CPUArchState *env);
>  const char *target_strerror(int err);
>  int get_osversion(void);
>  void init_qemu_uname_release(void);
> --
> 2.31.1
>
>

--000000000000671d4c05d0281c3e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Sat, Nov 6, 2021, 5:39 AM Philippe Mathieu-Daud=C3=
=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.org</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">cpu_loop() never exits, so mark it w=
ith QEMU_NORETURN.<br>
<br>
Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank" rel=3D"noreferrer">richard.henderson@linaro.org</=
a>&gt;<br>
Reviewed-By: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" target=3D"_b=
lank" rel=3D"noreferrer">imp@bsdimp.com</a>&gt;<br>
Reviewed-by: Bin Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com" target=3D"_=
blank" rel=3D"noreferrer">bmeng.cn@gmail.com</a>&gt;<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org" target=3D"_blank" rel=3D"noreferrer">f4bug@amsat.org</a>&gt;<br>
---<br>
v2:<br>
- rebased<br>
- restricted to linux-user<br>
<br>
Supersedes: &lt;<a href=3D"mailto:20210905000429.1097336-1-f4bug@amsat.org"=
 target=3D"_blank" rel=3D"noreferrer">20210905000429.1097336-1-f4bug@amsat.=
org</a>&gt;<br></blockquote></div></div><div dir=3D"auto"><br></div><div di=
r=3D"auto">Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com">i=
mp@bsdimp.com</a>&gt;</div><div dir=3D"auto"><br></div><div dir=3D"auto">bs=
d-user likely needs similar treatment, no?</div><div dir=3D"auto"><br></div=
><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">
---<br>
=C2=A0linux-user/user-internals.h | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/linux-user/user-internals.h b/linux-user/user-internals.h<br>
index 661612a088b..c7ad00268af 100644<br>
--- a/linux-user/user-internals.h<br>
+++ b/linux-user/user-internals.h<br>
@@ -65,7 +65,7 @@ abi_long do_syscall(void *cpu_env, int num, abi_long arg1=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0abi_long arg5, abi_long arg6, abi_long arg7,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0abi_long arg8);<br>
=C2=A0extern __thread CPUState *thread_cpu;<br>
-void cpu_loop(CPUArchState *env);<br>
+void QEMU_NORETURN cpu_loop(CPUArchState *env);<br>
=C2=A0const char *target_strerror(int err);<br>
=C2=A0int get_osversion(void);<br>
=C2=A0void init_qemu_uname_release(void);<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div></div>

--000000000000671d4c05d0281c3e--

