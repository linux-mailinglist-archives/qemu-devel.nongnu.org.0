Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FC052D65A
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 16:43:35 +0200 (CEST)
Received: from localhost ([::1]:40462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrhNF-0003BK-Lu
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 10:43:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <uwu@icenowy.me>) id 1nrh4F-0001OS-Rx
 for qemu-devel@nongnu.org; Thu, 19 May 2022 10:23:55 -0400
Received: from sender4-op-o18.zoho.com ([136.143.188.18]:17871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <uwu@icenowy.me>) id 1nrh4D-0005Hx-L4
 for qemu-devel@nongnu.org; Thu, 19 May 2022 10:23:55 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1652970215; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=UUc/a1qTKCDlF2+3QHLcqhwsYBOdFfAQ7x8UUnDAfDnoqcAGOcnYXLkuOyS8wZwBT14i4dxF4lhlH7wXeORxMD8lVwEGIw7cXIdUfVdyIAWjh3uyqubLk6oy9jIhoowkpAAzVsP0RMuwLq/NfCBuYCL3Dq0VVbsBhs24+pEi2tY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1652970215;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=OU6h4AK10q/BZFnU+VciJzWkp2XjAXU1sgSVxL87nkU=; 
 b=VEOppScIwmi94N6RIbdn3BjOltknspwh14Xv3+QEjHnJpaZQocYGJ9PWpUBKmd9loJkx+p3jDaNFOA6gFprOGsfBFh0cygwLx4D5lXMSWfeurBcS+uCO2V5obYmlG4DrXi/hC7yeDWUvo/d+5YajrsjsbvSyU6W0lpsl7+om+gc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1652970215; 
 s=zmail; d=icenowy.me; i=uwu@icenowy.me;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=OU6h4AK10q/BZFnU+VciJzWkp2XjAXU1sgSVxL87nkU=;
 b=Wk64YyXTSZf+wXh+uDWh1ZOB9Ji+GiEqGpG2DeqPamXD2JXNweoKZi9aaEX4U9vO
 P5tjTYcOV3fXR1Ldcj/44RRy/FctA6dCWTCa+noc9+kN2JgdEHyZSVrc7ushuku33YA
 SXvcPhVMNGAvRbC5OXfQcllBTB98hmRV9tNjl9Pc=
Received: from edelgard.icenowy.me (59.41.160.82 [59.41.160.82]) by
 mx.zohomail.com with SMTPS id 165297021293546.341349506360984;
 Thu, 19 May 2022 07:23:32 -0700 (PDT)
Message-ID: <b63c04ff68340d367ad4138f3496d217df9b5151.camel@icenowy.me>
Subject: Re: [PATCH v4] fcntl: Add 32bit filesystem mode
From: Icenowy Zheng <uwu@icenowy.me>
To: Linus Walleij <linus.walleij@linaro.org>, Theodore Ts'o <tytso@mit.edu>,
 Andreas Dilger <adilger.kernel@dilger.ca>
Cc: linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-api@vger.kernel.org, qemu-devel@nongnu.org, Florian Weimer
 <fw@deneb.enyo.de>,  Peter Maydell <peter.maydell@linaro.org>, Andy
 Lutomirski <luto@kernel.org>, Eric Blake <eblake@redhat.com>, 
 =?gb2312?Q?=C2=DE=D3=C2=B8=D5?= <luoyonggang@gmail.com>
Date: Thu, 19 May 2022 22:23:08 +0800
In-Reply-To: <20201117233928.255671-1-linus.walleij@linaro.org>
References: <20201117233928.255671-1-linus.walleij@linaro.org>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.18; envelope-from=uwu@icenowy.me;
 helo=sender4-op-o18.zoho.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 19 May 2022 10:42:30 -0400
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

=E5=9C=A8 2020-11-18=E6=98=9F=E6=9C=9F=E4=B8=89=E7=9A=84 00:39 +0100=EF=BC=
=8CLinus Walleij=E5=86=99=E9=81=93=EF=BC=9A
> It was brought to my attention that this bug from 2018 was
> still unresolved: 32 bit emulators like QEMU were given
> 64 bit hashes when running 32 bit emulation on 64 bit systems.
>=20

Sorry for replying such an old mail, but I found that using 32-bit file
syscalls in 32-bit QEMU user on 64-bit hosts are still broken today,
and google sent me here.

This mail does not get any reply according to linux-ext4 patchwork, so
could I ping it?

Thanks,
Icenowy Zheng

> This adds a flag to the fcntl() F_GETFD and F_SETFD operations
> to set the underlying filesystem into 32bit mode even if the
> file handle was opened using 64bit mode without the compat
> syscalls.
>=20
> Programs that need the 32 bit file system behavior need to
> issue a fcntl() system call such as in this example:
>=20
> =C2=A0 #define FD_32BIT_MODE 2
>=20
> =C2=A0 int main(int argc, char** argv) {
> =C2=A0=C2=A0=C2=A0 DIR* dir;
> =C2=A0=C2=A0=C2=A0 int err;
> =C2=A0=C2=A0=C2=A0 int mode;
> =C2=A0=C2=A0=C2=A0 int fd;
>=20
> =C2=A0=C2=A0=C2=A0 dir =3D opendir("/boot");
> =C2=A0=C2=A0=C2=A0 fd =3D dirfd(dir);
> =C2=A0=C2=A0=C2=A0 mode =3D fcntl(fd, F_GETFD);
> =C2=A0=C2=A0=C2=A0 mode |=3D FD_32BIT_MODE;
> =C2=A0=C2=A0=C2=A0 err =3D fcntl(fd, F_SETFD, mode);
> =C2=A0=C2=A0=C2=A0 if (err) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf("fcntl() failed! err=3D%d\n", err);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 1;
> =C2=A0=C2=A0=C2=A0 }
> =C2=A0=C2=A0=C2=A0 printf("dir=3D%p\n", dir);
> =C2=A0=C2=A0=C2=A0 printf("readdir(dir)=3D%p\n", readdir(dir));
> =C2=A0=C2=A0=C2=A0 printf("errno=3D%d: %s\n", errno, strerror(errno));
> =C2=A0=C2=A0=C2=A0 return 0;
> =C2=A0 }
>=20
> This can be pretty hard to test since C libraries and linux
> userspace security extensions aggressively filter the parameters
> that are passed down and allowed to commit into actual system
> calls.
>=20
> Cc: Florian Weimer <fw@deneb.enyo.de>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Andy Lutomirski <luto@kernel.org>
> Cc: Eric Blake <eblake@redhat.com>
> Reported-by: =E7=BD=97=E5=8B=87=E5=88=9A(Yonggang Luo) <luoyonggang@gmail=
.com>
> Suggested-by: Theodore Ts'o <tytso@mit.edu>
> Link: https://bugs.launchpad.net/qemu/+bug/1805913
> Link: https://lore.kernel.org/lkml/87bm56vqg4.fsf@mid.deneb.enyo.de/
> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=3D205957
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v3 RESEND 1-> v4:
> - Update the example in the commit message to a read/modify/write
> =C2=A0 version.
> - Notice that Yonggang Luo sees the sema problem on i386 binaries
> =C2=A0 as we see on ARM 32bit binaries.
> ChangeLog v3->v3 RESEND 1:
> - Resending during the v5.10 merge window to get attention.
> ChangeLog v2->v3:
> - Realized that I also have to clear the flag correspondingly
> =C2=A0 if someone ask for !FD_32BIT_MODE after setting it the
> =C2=A0 first time.
> ChangeLog v1->v2:
> - Use a new flag FD_32BIT_MODE to F_GETFD and F_SETFD
> =C2=A0 instead of a new fcntl operation, there is already a fcntl
> =C2=A0 operation to set random flags.
> - Sorry for taking forever to respin this patch :(
> ---
> =C2=A0fs/fcntl.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 7 +++++++
> =C2=A0include/uapi/asm-generic/fcntl.h | 8 ++++++++
> =C2=A02 files changed, 15 insertions(+)
>=20
> diff --git a/fs/fcntl.c b/fs/fcntl.c
> index 19ac5baad50f..6c32edc4099a 100644
> --- a/fs/fcntl.c
> +++ b/fs/fcntl.c
> @@ -335,10 +335,17 @@ static long do_fcntl(int fd, unsigned int cmd,
> unsigned long arg,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0break;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case F_GETFD:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0err =3D get_close_on_exec(fd) ? FD_CLOEXEC : 0;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0/* Report 32bit file system mode */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0if (filp->f_mode & FMODE_32BITHASH)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0err |=3D =
FD_32BIT_MODE;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0break;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case F_SETFD:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0err =3D 0;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0set_close_on_exec(fd, arg & FD_CLOEXEC);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0if (arg & FD_32BIT_MODE)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0filp->f_m=
ode |=3D FMODE_32BITHASH;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0else
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0filp->f_m=
ode &=3D ~FMODE_32BITHASH;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0break;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case F_GETFL:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0err =3D filp->f_flags;
> diff --git a/include/uapi/asm-generic/fcntl.h b/include/uapi/asm-
> generic/fcntl.h
> index 9dc0bf0c5a6e..edd3573cb7ef 100644
> --- a/include/uapi/asm-generic/fcntl.h
> +++ b/include/uapi/asm-generic/fcntl.h
> @@ -160,6 +160,14 @@ struct f_owner_ex {
> =C2=A0
> =C2=A0/* for F_[GET|SET]FL */
> =C2=A0#define FD_CLOEXEC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A01=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0/* actually anything with low bit set
> goes */
> +/*
> + * This instructs the kernel to provide 32bit semantics (such as
> hashes) from
> + * the file system layer, when running a userland that depend on 32bit
> + * semantics on a kernel that supports 64bit userland, but does not
> use the
> + * compat ioctl() for e.g. open(), so that the kernel would otherwise
> assume
> + * that the userland process is capable of dealing with 64bit
> semantics.
> + */
> +#define FD_32BIT_MODE=C2=A0=C2=A02
> =C2=A0
> =C2=A0/* for posix fcntl() and lockf() */
> =C2=A0#ifndef F_RDLCK



