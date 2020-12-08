Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 683F52D2F15
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 17:06:51 +0100 (CET)
Received: from localhost ([::1]:40952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmfVq-0002Ja-AH
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 11:06:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcroce@linux.microsoft.com>)
 id 1kmfUU-0001hT-Ux
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 11:05:28 -0500
Received: from linux.microsoft.com ([13.77.154.182]:55730)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mcroce@linux.microsoft.com>) id 1kmfUP-00011z-Al
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 11:05:26 -0500
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by linux.microsoft.com (Postfix) with ESMTPSA id BA57920B717A
 for <qemu-devel@nongnu.org>; Tue,  8 Dec 2020 08:05:18 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com BA57920B717A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1607443518;
 bh=gLN6HN/AmcgWybrnwqgClPpFSfrI5CM9Pg8FkZnoAxA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hhFyKNrn4DLXjMKQ1AxjFnWBzShUregRzFWp9BhFu1ip1267hb/a+5HzWJXIrdjcz
 NQzbi4H2JJ1Yj1sAZe6djygBdBqh8Bd8qw4yderfTEy6nJLLGVu00+sAhGqhlhA6JN
 Yno0Fyr6yPXTEpePCva2mAYSRORWZksllyFYgC3Q=
Received: by mail-pg1-f170.google.com with SMTP id e23so12535671pgk.12
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 08:05:18 -0800 (PST)
X-Gm-Message-State: AOAM530n9PjrFfrRy0fv9UEUaNnIg3YrVepgace3MskcTGbPFWcrNvZt
 RHg16IDcwyWQZo7mjN6OEoWFEzImM6sU8lpswDA=
X-Google-Smtp-Source: ABdhPJySnXLHMkNi2PL7lETxkuEfnggRMvRcg7FmVsNo/Mu5k0meeTE1Qxn10Q9UqafEiCv1qmmT2Bg3ZWzNcp2OlmU=
X-Received: by 2002:a63:ca0a:: with SMTP id n10mr23594905pgi.326.1607443518280; 
 Tue, 08 Dec 2020 08:05:18 -0800 (PST)
MIME-Version: 1.0
References: <20201208001727.17433-1-mcroce@linux.microsoft.com>
 <f37589e0-90d9-a5f0-a5a9-423c583c675d@vivier.eu>
In-Reply-To: <f37589e0-90d9-a5f0-a5a9-423c583c675d@vivier.eu>
From: Matteo Croce <mcroce@linux.microsoft.com>
Date: Tue, 8 Dec 2020 17:04:42 +0100
X-Gmail-Original-Message-ID: <CAFnufp1QkXMxMwVksczL8jSHET2zwLSgv4Lm34MgqWd5jyYTNA@mail.gmail.com>
Message-ID: <CAFnufp1QkXMxMwVksczL8jSHET2zwLSgv4Lm34MgqWd5jyYTNA@mail.gmail.com>
Subject: Re: [PATCH] linux-user: add option to chroot before emulation
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=13.77.154.182;
 envelope-from=mcroce@linux.microsoft.com; helo=linux.microsoft.com
X-Spam_score_int: -117
X-Spam_score: -11.8
X-Spam_bar: -----------
X-Spam_report: (-11.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, T_SPF_TEMPERROR=0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 8, 2020 at 9:21 AM Laurent Vivier <laurent@vivier.eu> wrote:
>
> Le 08/12/2020 =C3=A0 01:17, Matteo Croce a =C3=A9crit :
> > From: Matteo Croce <mcroce@microsoft.com>
> >
> > Add a '-c' option which does a chroot() just before starting the
> > emulation. This is useful when the static QEMU user binary can't
> > be copied into the target root filesystem, e.g. if it's readonly.
>
> Did you try to use the binfmt_misc 'F' flag (fix binary)?
>
> https://www.kernel.org/doc/Documentation/admin-guide/binfmt-misc.rst
>
> ``F`` - fix binary
>
> The usual behaviour of binfmt_misc is to spawn the
> binary lazily when the misc format file is invoked.  However,
> this doesn``t work very well in the face of mount namespaces and
> changeroots, so the ``F`` mode opens the binary as soon as the
> emulation is installed and uses the opened image to spawn the
> emulator, meaning it is always available once installed,
> regardless of how the environment changes.
>
> This can be configured with scripts/qemu-binfmt-conf.sh and
> "--persistent yes"" option
>

Yes, this works too.
Basically it's the same trick, open the binary early and then emulate.
The only difference is that with binfmt emulation the procfs open
still fails:

# strace -feopenat chroot debian /bin/true 2>&1 |grep /proc/sys
[pid  9359] openat(AT_FDCWD, "/proc/sys/vm/mmap_min_addr", O_RDONLY) =3D
-1 ENOENT (No such file or directory)

vs

# strace -feopenat qemu-aarch64 -c debian /bin/true 2>&1 |grep /proc/sys
[pid  9348] openat(AT_FDCWD, "/proc/sys/vm/mmap_min_addr", O_RDONLY) =3D 3

--=20
per aspera ad upstream

