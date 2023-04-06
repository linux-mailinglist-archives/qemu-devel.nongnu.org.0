Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFED06D9731
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 14:45:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkOzN-0005F7-FJ; Thu, 06 Apr 2023 08:45:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pkOzF-00056Q-AI
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 08:45:11 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pkOzC-0000lD-OH
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 08:45:09 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5002bb40596so1246123a12.1
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 05:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680785105;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QAHiCbBETMHWZFpGLlHqRTjPOIshy7V6m1ZC2PVupwQ=;
 b=UvPOamAUu8NmGJ1KoHO+HuAs/wC2Cwx8ILSeU/lrJW8vik0QuQQueGr8QshcTcsAK2
 JGv531SSRJ8Qj9mP0Rch5lkV5MBk5BvEYRft5FLj7CP2lSPzm28yeDySMHwvynbXComu
 ZrIzODKNXBx0aFxzHpYlw2XrOvD3zFFQzjQdy60bzZ49t81BBhDcsK2Rp3gPpDs826EF
 Aq9plu62NZK/3M3RBNONMikw5Lofx1B/QMKxg7mOU4MXE5egRdHPyU6ANhX2HNUle0WD
 B3g7MkECfwK+sZXaKe/jQTWqmBAUnRcsbarmWDSPB1iqiywyrQzORBVmdLAXjRj1cY7q
 eHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680785105;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QAHiCbBETMHWZFpGLlHqRTjPOIshy7V6m1ZC2PVupwQ=;
 b=jJp00LW5Pm0RoLkpBFLiaTqPJ5w1FA6/OgaNr39TAzEk4Js8+F99qLnnOLLHSkAiDy
 slIWr2DTplcGPsjSGqfP8DBYLlpnhqjRES1bASo9kqstGiunWs7/hFOBnc2HkClx/CYN
 c9cj0afzT5xzERuDF6Ktm2K0CCihxDeni6DVPzVRxUSnHBzTCMzBTjZd1UUTgEfdZhaf
 xHxVB28j64HCDbKBb/kEqEynmDOwg7/rbyvc0QM2kMCjDv6nzTlZB1bMI2O4t/PImxmO
 j1eHrSIlKA+E25kAmB6VTaLQQYnE8KpwvYzittsqMGCgTAYS7rxT7PEv5Bb/obqQe5cY
 5wSw==
X-Gm-Message-State: AAQBX9d5797oIN4T3qBVwlU9zcKWrHkSVmxvQUyn8PM748+/jlQVMTiL
 ZbL8FswA3PwXlSkVQvx8zw5c+DIlfE7KdUZwU7Q=
X-Google-Smtp-Source: AKy350bLQLoB+DAsyX9CiMgc4zAIdKE4go+JF7Of10tQZwgJa2VWYrm2EI+03j8z4VjXcvqciczZbB4wH59es9MMtcg=
X-Received: by 2002:a50:9f2d:0:b0:501:c965:33bd with SMTP id
 b42-20020a509f2d000000b00501c96533bdmr3003319edf.6.1680785104610; Thu, 06 Apr
 2023 05:45:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230406112041.798585-1-bmeng@tinylab.org>
 <8e935a0b-583b-ed14-fded-b0af760ae99d@linaro.org>
In-Reply-To: <8e935a0b-583b-ed14-fded-b0af760ae99d@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 6 Apr 2023 20:44:53 +0800
Message-ID: <CAEUhbmWbG9cizASqfeFxXjusb8cw2vHT2yGEzuxpH98eKhv1bw@mail.gmail.com>
Subject: Re: [PATCH] net: tap: Drop the close of fds for child process
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Bin Meng <bmeng@tinylab.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Zhangjin Wu <falcon@tinylab.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x52b.google.com
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

On Thu, Apr 6, 2023 at 8:34=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 <philmd@=
linaro.org> wrote:
>
> On 6/4/23 13:20, Bin Meng wrote:
> > Current codes using a brute-force traversal of all file descriptors
> > do not scale on a system where the maximum number of file descriptors
> > are set to a very large value (e.g.: in a Docker container of Manjaro
> > distribution it is set to 1073741816). QEMU just looks freezed during
> > start-up.
> >
> > The close-on-exec flag was introduced since a faily old Linux kernel
> > (2.6.23). With recent newer kernels that QEMU supports, we don't need
> > to manually close the fds for child process as the proper O_CLOEXEC
> > flag should have been set properly on files that we don't want child
> > process to see.
>
> But this file is common to all POSIX implementations, not only Linux.

Yes, this file is used for Linux, BSD and Solaris.
I checked that O_CLOEXEC is available on Linux (2.6.23), FreeBSD
(8.3), OpenBSD 5.0, Solaris 11. This flag is part of POSIX.1-2008.

Question is do we still need to support OSes that are older and do not
have this support?

>
> > Reported-by: Zhangjin Wu <falcon@tinylab.org>
> > Signed-off-by: Bin Meng <bmeng@tinylab.org>
> > ---
> >
> >   net/tap.c | 14 --------------
> >   1 file changed, 14 deletions(-)
> >
> > diff --git a/net/tap.c b/net/tap.c
> > index 1bf085d422..49e1915484 100644
> > --- a/net/tap.c
> > +++ b/net/tap.c
> > @@ -446,13 +446,6 @@ static void launch_script(const char *setup_script=
, const char *ifname,
> >           return;
> >       }
> >       if (pid =3D=3D 0) {
>
> Maybe guard with #ifndef O_CLOEXEC
>
> > -        int open_max =3D sysconf(_SC_OPEN_MAX), i;
> > -
> > -        for (i =3D 3; i < open_max; i++) {
> > -            if (i !=3D fd) {
> > -                close(i);
> > -            }
> > -        }
>
> or add qemu_close_cloexec() in util/osdep.c similar to qemu_open_cloexec(=
)?
>
> >           parg =3D args;
> >           *parg++ =3D (char *)setup_script;
> >           *parg++ =3D (char *)ifname;
> > @@ -536,17 +529,10 @@ static int net_bridge_run_helper(const char *help=
er, const char *bridge,
> >           return -1;
> >       }
> >       if (pid =3D=3D 0) {
> > -        int open_max =3D sysconf(_SC_OPEN_MAX), i;
> >           char *fd_buf =3D NULL;
> >           char *br_buf =3D NULL;
> >           char *helper_cmd =3D NULL;
> >
> > -        for (i =3D 3; i < open_max; i++) {
> > -            if (i !=3D sv[1]) {
> > -                close(i);
> > -            }
> > -        }
> > -
> >           fd_buf =3D g_strdup_printf("%s%d", "--fd=3D", sv[1]);
> >
> >           if (strrchr(helper, ' ') || strrchr(helper, '\t')) {

Regards,
Bin

