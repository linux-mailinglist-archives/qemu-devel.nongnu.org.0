Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EF03AE198
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 04:04:07 +0200 (CEST)
Received: from localhost ([::1]:39622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lv9IE-0003ba-LY
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 22:04:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yamamoto@midokura.com>)
 id 1lv9HN-0002SV-Pl
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 22:03:13 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:44559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yamamoto@midokura.com>)
 id 1lv9HL-00061g-Sl
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 22:03:13 -0400
Received: by mail-pl1-x62a.google.com with SMTP id x22so6136677pll.11
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 19:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=midokura.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IuKi8awTIGZS7iDuXPpwGDtI2n88cYQIWehDI+UX/sM=;
 b=w/vd7HBey7veVVBrRNN3Co4tilzEwvgq7EXUXsNrshV4bR9Kk62cN1Iejilo3rdFvo
 MTPldPgVEV0AB2RsrWcZfJ/y9ePRSot3oj1sk4+p+XcdCIBgzA3i0kVOnRXxwKWKI96E
 lueyykNq/1yZGi7ifd91yl+D70wm+Q19ZuEOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IuKi8awTIGZS7iDuXPpwGDtI2n88cYQIWehDI+UX/sM=;
 b=Q9Lf7E2FCygwcEwMF0W+N+sYwlXvLtHBvVqCFs+55ZriasMh0p3VOzyRy7eZjBhiMn
 8O2T2ZQtk1lcoUJc5Iy9kkEBd6gyt76o63PBc1ZNuwc/dZQl3NJMa3OAfcEwpfbV6e1E
 FoLFaROhLQnH+L1zMNb7rEw0oglfy+L7LSfdjdhDueu1kh03SWC3PZMyXYzqlGU8psdI
 VPqARwf2zJXhj0WXmABsmJenNFU1sFtcD1XMeUtsZtRWa2Z5BOqPn8E6Fn2m79OjUUrU
 1svtmKdP3Kw5r4AhWCO8VXkm7OZIVpOrm1FGZYiy66VViVCGmFhFSUaRHA1E7pJzoIxw
 laCQ==
X-Gm-Message-State: AOAM532553Xkxd6tg9F1E/Yn1K4367+yNwyj059edDMTSxkwKGQLO0Is
 P+/hfqc6uaFq5RdwrFAPONutWdxk98fSyZqzO3gqdw==
X-Google-Smtp-Source: ABdhPJwVbGUnwagxW6Su1x0bl9cjxCVJKxYuI21ewbPN1JWFmU8M+308yo/NGVwGEytOZ2Jhk/b0bfM7JC+j56s6TDc=
X-Received: by 2002:a17:902:7009:b029:121:a348:fa5b with SMTP id
 y9-20020a1709027009b0290121a348fa5bmr13474789plk.20.1624240989950; Sun, 20
 Jun 2021 19:03:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210531055019.10149-1-yamamoto@midokura.com>
 <20210531055019.10149-2-yamamoto@midokura.com>
 <5c344989-6b77-5cb7-4e2d-953350fe9834@vivier.eu>
In-Reply-To: <5c344989-6b77-5cb7-4e2d-953350fe9834@vivier.eu>
From: Takashi Yamamoto <yamamoto@midokura.com>
Date: Mon, 21 Jun 2021 11:02:59 +0900
Message-ID: <CAH=wFzS_-q4wRauFPKLrAf6p=oew_Ja+QpEvpyX97sYC39LnmQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] linux-user: handle /proc/self/exe for execve
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=yamamoto@midokura.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Jun 20, 2021 at 11:14 PM Laurent Vivier <laurent@vivier.eu> wrote:
>
> Le 31/05/2021 =C3=A0 07:50, YAMAMOTO Takashi a =C3=A9crit :
> > It seems somehow common to execve /proc/self/exe in docker
> > or golang community these days.
> > At least, moby "reexec" and runc "libcontainer" do that.
> >
> > Signed-off-by: YAMAMOTO Takashi <yamamoto@midokura.com>
> > ---
> >  linux-user/syscall.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> > index c9f812091c..a2b03ecb8b 100644
> > --- a/linux-user/syscall.c
> > +++ b/linux-user/syscall.c
> > @@ -8470,6 +8470,7 @@ static abi_long do_syscall1(void *cpu_env, int nu=
m, abi_long arg1,
> >  #endif
> >      case TARGET_NR_execve:
> >          {
> > +            const char *path;
> >              char **argp, **envp;
> >              int argc, envc;
> >              abi_ulong gp;
> > @@ -8537,7 +8538,11 @@ static abi_long do_syscall1(void *cpu_env, int n=
um, abi_long arg1,
> >               * before the execve completes and makes it the other
> >               * program's problem.
> >               */
> > -            ret =3D get_errno(safe_execve(p, argp, envp));
> > +            path =3D p;
> > +            if (is_proc_myself(path, "exe")) {
> > +                path =3D exec_path;
> > +            }
> > +            ret =3D get_errno(safe_execve(path, argp, envp));
> >              unlock_user(p, arg1, 0);
> >
> >              goto execve_end;
> >
>
> The problem here is QEMU can fail to execute the file directly.

i don't understand this sentence. can you explain a bit?

>
> The binary can be launched with binfmt_misc and the 'O' flag:
>
>      ``O`` - open-binary
>             Legacy behavior of binfmt_misc is to pass the full path
>             of the binary to the interpreter as an argument. When this fl=
ag is
>             included, binfmt_misc will open the file for reading and pass=
 its
>             descriptor as an argument, instead of the full path, thus all=
owing
>             the interpreter to execute non-readable binaries. This featur=
e
>             should be used with care - the interpreter has to be trusted =
not to
>             emit the contents of the non-readable binary.
>
> You should use do_openat() (that resolves the /proc/self/exe path) and fe=
xecve().

i thought there was an issue with the approach. but i don't remember
what it was.
maybe i will retry it.

>
> Thanks,
> Laurent

