Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F84265FE4E
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 10:49:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDjLL-0005G7-K4; Fri, 06 Jan 2023 04:48:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pDjLJ-0005Fy-Ge
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 04:48:53 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pDjLH-0000h2-Vn
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 04:48:53 -0500
Received: by mail-ej1-x636.google.com with SMTP id fy8so2288262ejc.13
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 01:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G5lRfcp+dqeDqRNWt7+HhCGDtl6+LeBMz8/IFaVu//s=;
 b=jTtOjQkQVSY5zlufPnyNPLV4LY1/Nk4ub6C3Az30OtjR7c63+PD1opVKQIhzaVIras
 l/wC+VKcj3Dak7iIrA5ZVo5WmfhmLa2RgF0ippSlrfVELTGwFmqBi2TnnXZdf6ROghj8
 9SpuzAmHVFhJ0bZF6ALx72x+u65Y/SDRo0BqvBotnuuoiEC17uvtBr4xfQe3cqDJGuHT
 MUPVMKEiOF1J2SqaHBCnWn8q5mZ4hZp2cuYZ/uj472dXORQeW8X7239cvFVpAL35Fi+0
 xu+H0gqXhuskG0z2nid3Z26HV9f/TigUxwJMpONOs71lldnR1YAfeCS/sGFESoWGwC23
 LC1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G5lRfcp+dqeDqRNWt7+HhCGDtl6+LeBMz8/IFaVu//s=;
 b=tnxUVQaL+nctu8RY7KK3oZ3NJ4rchslwodWr2qPLC+HQogID8rajvwJ3cmvVBC5Q76
 asPJNWYXOYzolsVJzSr5EEyx8aeqISZcrc1y38C4htlFPMKxRofSMyAJu4ux92mpLOUg
 CLnSFufF6JFrg03d/Wt3aZ6yIBqgC/yDaXy9LpdzX9IXdwXiQtKtJi5RHCuIR8Df5yT6
 HFi9HR2aW8YVVIAdieiS1y9ArRQMnWTrZynBzsdzSI6ccKDhf3KFeBvJcxZQBZoXTZX+
 R+OmZc0ona0a1wRq2+fV5t3POOAXZS01HcQtuyXbS7GMxHPdPO5QU2cu7o3lP3/WXTHC
 gfXw==
X-Gm-Message-State: AFqh2kodhyiVTMETz3Au2dsr4dk9oDhjJ8aPBOcFD96KtuGXVRy2IMw8
 nqnfb0AH02yOiHc7GWTeI1WbSfEhLk+MOpRIKco=
X-Google-Smtp-Source: AMrXdXvZySk2qYMqa8MsrkPIu9B8hvwfNIMWZMZzqXUCxLgeGbnNZlVmRA2yCBLh0wNJ4NLPzj7fvCTn5VwqRGSn2ak=
X-Received: by 2002:a17:906:1945:b0:7c0:bb4c:e792 with SMTP id
 b5-20020a170906194500b007c0bb4ce792mr4281613eje.618.1672998530191; Fri, 06
 Jan 2023 01:48:50 -0800 (PST)
MIME-Version: 1.0
References: <20230105211940.14988-1-eiakovlev@linux.microsoft.com>
 <408a6546-025b-1a94-ee98-a577b8460e13@linaro.org>
In-Reply-To: <408a6546-025b-1a94-ee98-a577b8460e13@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 6 Jan 2023 17:48:38 +0800
Message-ID: <CAEUhbmVkDVz_DLrzAFzGT75aBf6_t3LSAfTfogkLpLQLQ-+ZHg@mail.gmail.com>
Subject: Re: [PATCH] semihosting: add O_BINARY flag in host_open for NT
 compatibility
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>, qemu-devel@nongnu.org, 
 alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, Jan 6, 2023 at 3:39 PM Philippe Mathieu-Daud=C3=A9 <philmd@linaro.o=
rg> wrote:
>
> On 5/1/23 22:19, Evgeny Iakovlev wrote:
> > Windows open(2) implementations opens files in text mode by default and
> > needs a Windows-only O_BINARY flag to open files as binary. Qemu alread=
y
>
> s/Qemu/QEMU/
>
> > knows about that flag in osdep.h, so we can just add it to the
> > host_flags for better compatibility when running qemu on Windows.
>
> s/qemu/QEMU/
>
> > Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
> > ---
> >   semihosting/syscalls.c | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
> > index 508a0ad88c..00f77507e5 100644
> > --- a/semihosting/syscalls.c
> > +++ b/semihosting/syscalls.c
> > @@ -278,6 +278,8 @@ static void host_open(CPUState *cs, gdb_syscall_com=
plete_cb complete,
> >           host_flags |=3D O_EXCL;
> >       }
> >
> > +    host_flags |=3D O_BINARY;
> > +
> >       ret =3D open(p, host_flags, mode);
> >       if (ret < 0) {
> >           complete(cs, -1, errno);
>
> Alternatively with more churn:
>
> -- >8 --
> diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
> index 508a0ad88c..b621d78c2d 100644
> --- a/semihosting/syscalls.c
> +++ b/semihosting/syscalls.c
> @@ -253,7 +253,7 @@ static void host_open(CPUState *cs,
> gdb_syscall_complete_cb complete,
>   {
>       CPUArchState *env G_GNUC_UNUSED =3D cs->env_ptr;
>       char *p;
> -    int ret, host_flags;
> +    int ret, host_flags =3D O_BINARY;
>
>       ret =3D validate_lock_user_string(&p, cs, fname, fname_len);
>       if (ret < 0) {
> @@ -262,11 +262,11 @@ static void host_open(CPUState *cs,
> gdb_syscall_complete_cb complete,
>       }
>
>       if (gdb_flags & GDB_O_WRONLY) {
> -        host_flags =3D O_WRONLY;
> +        host_flags |=3D O_WRONLY;
>       } else if (gdb_flags & GDB_O_RDWR) {
> -        host_flags =3D O_RDWR;
> +        host_flags |=3D O_RDWR;
>       } else {
> -        host_flags =3D O_RDONLY;
> +        host_flags |=3D O_RDONLY;
>       }
>       if (gdb_flags & GDB_O_CREAT) {
>           host_flags |=3D O_CREAT;
> ---
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>

With Philippe's comments addressed,
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

