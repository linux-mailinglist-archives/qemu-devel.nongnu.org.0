Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A266699FCF
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 23:39:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSmt4-0003ck-Tj; Thu, 16 Feb 2023 17:37:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pSmt3-0003cb-27
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 17:37:57 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pSmt0-0002pw-U0
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 17:37:56 -0500
Received: by mail-ed1-x534.google.com with SMTP id w3so8636271edc.2
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 14:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=G3l08DH28VRHA3HyCu6rcuc0NLfkv8MtUwbSjHZ68Wg=;
 b=HS/XOxznjEjV6MQamCnkbWD8zaWADlN8+ChHFyL3c/n2kCzZ7B4dAhbipQuK9pRfpd
 /MijsT1fJdnYkQC7B3FvF31Z9YXqunrTaZykVCoLvCMp4hdzgvfQnSBKvU92FOXgmF1P
 9Fc/bElPgJePsn5VsrA9ZM4JknWLlnHvHY/eB2D+herlOLs8Fq1jYyDzhhvq2D1geSs8
 GLx+D6UDIHyIvjvOgeMhG/8t5bz02Nd213rz9X1l1SPZO+D5bGCsz0+0hjZ+oANJrfN4
 6tWW//QyH5L171dDZTuqiWb3CjI+iOQG4QKB2I2x0tqeO6wTi8gfEEtCrqZJMkUKv9e1
 q9Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G3l08DH28VRHA3HyCu6rcuc0NLfkv8MtUwbSjHZ68Wg=;
 b=D3bQwbGAAJZmqlPblP7Tet1GGE9/VUD+2FkyD1hqWosa5f23MOaiBWYyvz6DSvhRzw
 I0URigCyDyqKj2/VHUIcaruQ77yLA5tW2fpgRVd1vDbHJSsCmjD6g7mhiXWmjkE5aHnz
 W4f0t88ZwMEXI16cBygOB85AcMZJzg/CUkG39du43LZwTVek13/cmMxzndNvI+R6WJTD
 Zq1cxCcmmpDfP+4ty7L5sl8iBZ/5SARciyuxz+K8IaAiw0eE03jX5zuUwWPPi1Mk1wEr
 RC6jGBqVR+pcRg95P8RtxIc7SMCarrFVEKpK/ouXxITYvSqYnqsrokfjv1LLr/m2txSp
 a2rA==
X-Gm-Message-State: AO0yUKW7HOUwcFMQ1pVSo7T2Gx99ui+h5vnKvtRXvj9ODzD1xitjvj8H
 9YtD4NWC/DfLrCVUoJqZCf7ba41cLPRToK+rKnpZOQ==
X-Google-Smtp-Source: AK7set8STxpcSprUhY2E5ho/HXWpZh8jnZfX4te0PXPZPOmW+dRd+gxGk96EK6qgxNFX0uvt1C32PY9XCb1P6DrO+X8=
X-Received: by 2002:a17:906:4885:b0:8b2:23fb:dfd1 with SMTP id
 v5-20020a170906488500b008b223fbdfd1mr126132ejq.2.1676587072016; Thu, 16 Feb
 2023 14:37:52 -0800 (PST)
MIME-Version: 1.0
References: <20230214002757.99240-1-imp@bsdimp.com>
 <20230214002757.99240-13-imp@bsdimp.com>
 <22306900-591c-2fd6-f573-4e011562a1eb@linaro.org>
In-Reply-To: <22306900-591c-2fd6-f573-4e011562a1eb@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 16 Feb 2023 15:37:40 -0700
Message-ID: <CANCZdfovajxPeqG_Rj6GZXhQ4EA_RTdsKnbLksnO=Okkt2U6cg@mail.gmail.com>
Subject: Re: [PATCH v2 12/12] bsd-user: Add -strict
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, kevans@freebsd.org, f4bug@amsat.org, 
 Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000dceb9b05f4d8d8a1"
Received-SPF: none client-ip=2a00:1450:4864:20::534;
 envelope-from=wlosh@bsdimp.com; helo=mail-ed1-x534.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000dceb9b05f4d8d8a1
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 14, 2023 at 2:49 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 2/13/23 14:27, Warner Losh wrote:
> > Most of the time, it's useful to make our best effort, but sometimes we
> > want to know right away when we don't implement something. First place
> > we use it is for unknown syscalls.
> >
> > Signed-off-by: Warner Losh <imp@bsdimp.com>
> > ---
> >   bsd-user/freebsd/os-syscall.c | 4 ++++
> >   bsd-user/main.c               | 5 ++++-
> >   bsd-user/qemu.h               | 1 +
> >   3 files changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/bsd-user/freebsd/os-syscall.c
> b/bsd-user/freebsd/os-syscall.c
> > index 179a20c304b..e2b26ecb8dd 100644
> > --- a/bsd-user/freebsd/os-syscall.c
> > +++ b/bsd-user/freebsd/os-syscall.c
> > @@ -508,6 +508,10 @@ static abi_long freebsd_syscall(void *cpu_env, int
> num, abi_long arg1,
> >
> >       default:
> >           qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
> > +        if (bsd_user_strict) {
> > +            printf("Unimplemented system call %d\n", num);
> > +            abort();
> > +        }
>
> Still don't like the printf.  I suggested alternatives against v1.
>

Yea, this was unchanged in this version since there were too many other
things to do in the other bits that went into v2.

I'm thinking, though, that this isn't ready, so I'm going to drop it from
v3.

Warner

--000000000000dceb9b05f4d8d8a1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 14, 2023 at 2:49 PM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 2/13/23 14:27, Warner Losh wrote:<br>
&gt; Most of the time, it&#39;s useful to make our best effort, but sometim=
es we<br>
&gt; want to know right away when we don&#39;t implement something. First p=
lace<br>
&gt; we use it is for unknown syscalls.<br>
&gt; <br>
&gt; Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" targe=
t=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0bsd-user/freebsd/os-syscall.c | 4 ++++<br>
&gt;=C2=A0 =C2=A0bsd-user/main.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 5 ++++-<br>
&gt;=C2=A0 =C2=A0bsd-user/qemu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 1 +<br>
&gt;=C2=A0 =C2=A03 files changed, 9 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-sysca=
ll.c<br>
&gt; index 179a20c304b..e2b26ecb8dd 100644<br>
&gt; --- a/bsd-user/freebsd/os-syscall.c<br>
&gt; +++ b/bsd-user/freebsd/os-syscall.c<br>
&gt; @@ -508,6 +508,10 @@ static abi_long freebsd_syscall(void *cpu_env, in=
t num, abi_long arg1,<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_log_mask(LOG_UNIMP, &quot=
;Unsupported syscall: %d\n&quot;, num);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (bsd_user_strict) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;Unimplemented =
system call %d\n&quot;, num);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 abort();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
Still don&#39;t like the printf.=C2=A0 I suggested alternatives against v1.=
<br></blockquote><div><br></div><div>Yea, this was unchanged in this versio=
n since there were too many other things to do in the other bits that went =
into v2.</div><div><br></div><div>I&#39;m thinking, though, that this isn&#=
39;t ready, so I&#39;m going to drop it from v3.</div><div><br></div><div>W=
arner=C2=A0</div></div></div>

--000000000000dceb9b05f4d8d8a1--

