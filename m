Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD4F43A830
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 01:30:56 +0200 (CEST)
Received: from localhost ([::1]:47308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf9Qd-0006KN-4g
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 19:30:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mf9NY-0003rA-89
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 19:27:44 -0400
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929]:39637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mf9NV-0007Dh-U5
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 19:27:43 -0400
Received: by mail-ua1-x929.google.com with SMTP id p23so12763704uaa.6
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 16:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qamfXL36w3xBlKxhGnSQeTbbsCl2kR9hVFSU+lEDxUo=;
 b=GSflfoFjhVgtzGbn00vgODeNE/BzgeTEqoU9uT0BRAPk5YFbWYGWRUPhCcvMR+7pHF
 E1JgEaqg051HyScdGLh355oj5X4K1gaaD8xAfo1oV/b+tACCXaOKi+HKaCj4TkEKef7s
 Lpof8a9qFvjfJ87f9LVtPsETpDypp5+gkHkKwr77lvKtzWe7eCdqV76wkbOE3VJ15vv/
 KTG/799KFZK2jYeetKM5Fh2tUQDUhSBcrKzQ+2zlZjNHx42iJyJQjFA4T4e9cFHlO9Ts
 xoH8Mf6gIXKFfsnAbhFfbKwJgKwQ4wfC30K+H0r0FtPMHOcSEiyIXvpIr0vhNaleHTUm
 ZflQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qamfXL36w3xBlKxhGnSQeTbbsCl2kR9hVFSU+lEDxUo=;
 b=GlXCzFWjXVrQEm7/irsyqgmjuZ240aJXlKTQRYRzOrCjdOMxbsV3dN1eiNOQfddYcT
 n3vWs4uL1nK9SOCmOiu7+mpP+EZXxPewqcxzwLnX4Qs25CRsHXl8+l+xv3iuej2m+89u
 JCBT0QHrJ2mNxauMH2kUZTlUieOZV16RZBUyJOh++/Uuo+EqDJhjySbk7a1P4XbsLUSu
 7bzti/QZGPusyXtgOUlZBkeu1RT+9vtuOsOxLP7u0ii22uZwuCOF4/AjJHYA0kukjU5g
 xpx96dtA1a2ZqL7dU2Pih3VHqNppKLb21zuo++XaYokdFtrjYTkkk0/SVYSzXmNBb5cI
 NOKA==
X-Gm-Message-State: AOAM531deaZaQcD8issWk9PCjn4GgaMQ3FXIgEduyDqa55/BRC51FHP+
 nhJJb5fjzSbNY+riJFwGF+7nVc5QOpK3R2ekknx77g==
X-Google-Smtp-Source: ABdhPJxi96VCKtpj93GF2p2+rWrvLAhOiYqVYJiy+RyePNE2BVD7lFS1tuE93fnN2I/NOS0Q/utekolI0qTIpWvTUJ0=
X-Received: by 2002:a67:ab48:: with SMTP id k8mr19595840vsh.30.1635204460060; 
 Mon, 25 Oct 2021 16:27:40 -0700 (PDT)
MIME-Version: 1.0
References: <20211025140716.166971-1-stefanha@redhat.com>
 <2ca9c094-61e6-54b8-89a8-6dad22514c96@linaro.org>
In-Reply-To: <2ca9c094-61e6-54b8-89a8-6dad22514c96@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 25 Oct 2021 17:27:29 -0600
Message-ID: <CANCZdfr5TAUYeZaRrm0TM-iEaV+BNwWw_JTUHbcr5QwPWhO0iQ@mail.gmail.com>
Subject: Re: [RFC 0/2] tls: add macros for coroutine-safe TLS variables
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000fa36f105cf35b444"
Received-SPF: none client-ip=2607:f8b0:4864:20::929;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x929.google.com
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: fweimer@redhat.com, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, sguelton@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000fa36f105cf35b444
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 25, 2021 at 10:18 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 10/25/21 7:07 AM, Stefan Hajnoczi wrote:
> > This is a preview of how we can solve the coroutines TLS problem.
> Coroutines
> > re-entered from another thread sometimes see stale TLS values. This
> happens
> > because compilers may cache values across yield points, so a value from
> the
> > previous thread will be used when the coroutine is re-entered in another
> > thread.
>
> I'm not thrilled by this, but I guess it does work.
>
> It could be worthwhile to add some inline asm instead for specific hosts
> -- one
> instruction instead of an out-of-line call.
>
>
> > Serge Guelton developed this technique, see the first patch for details.
> I'm
> > submitting it for discussion before I go ahead with a full conversion of
> the
> > source tree.
> >
> > Todo:
> > - Convert all uses of __thread
> > - Extend checkpatch.pl to reject code that uses __thread
>
> Absolutely not.  *Perhaps* one or two tls variables which are accessible
> by coroutines,
> but there are plenty that have absolutely no relation.  Especially
> everything related to
> user-only execution.
>

I had the same worry. I'd also worry that the hoops that are jumped through
for
coroutines would somehow conflict with the low-level user-only execution
environment. I mean, it should be fine, but I know I'd be cranky if I traced
obscure regressions to being forced to use this construct...

Warner


> r~
>
>

--000000000000fa36f105cf35b444
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 25, 2021 at 10:18 AM Rich=
ard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.h=
enderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On 10/25/21 7:07 AM, Stefan Hajnoczi wrote:<br>
&gt; This is a preview of how we can solve the coroutines TLS problem. Coro=
utines<br>
&gt; re-entered from another thread sometimes see stale TLS values. This ha=
ppens<br>
&gt; because compilers may cache values across yield points, so a value fro=
m the<br>
&gt; previous thread will be used when the coroutine is re-entered in anoth=
er<br>
&gt; thread.<br>
<br>
I&#39;m not thrilled by this, but I guess it does work.<br>
<br>
It could be worthwhile to add some inline asm instead for specific hosts --=
 one <br>
instruction instead of an out-of-line call.<br>
<br>
<br>
&gt; Serge Guelton developed this technique, see the first patch for detail=
s. I&#39;m<br>
&gt; submitting it for discussion before I go ahead with a full conversion =
of the<br>
&gt; source tree.<br>
&gt; <br>
&gt; Todo:<br>
&gt; - Convert all uses of __thread<br>
&gt; - Extend <a href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D=
"_blank">checkpatch.pl</a> to reject code that uses __thread<br>
<br>
Absolutely not.=C2=A0 *Perhaps* one or two tls variables which are accessib=
le by coroutines, <br>
but there are plenty that have absolutely no relation.=C2=A0 Especially eve=
rything related to <br>
user-only execution.<br></blockquote><div><br></div><div>I had the same wor=
ry. I&#39;d also worry that the hoops that are jumped through for</div><div=
>coroutines would somehow conflict with the low-level user-only execution</=
div><div>environment. I mean, it should be fine, but I know I&#39;d be cran=
ky if I traced</div><div>obscure regressions to being forced to use this co=
nstruct...</div><div><br></div><div>Warner</div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
r~<br>
<br>
</blockquote></div></div>

--000000000000fa36f105cf35b444--

