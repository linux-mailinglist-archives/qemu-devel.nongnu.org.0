Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4DFE0F7F
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Oct 2019 02:56:32 +0200 (CEST)
Received: from localhost ([::1]:50038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iN4ww-0007Jh-UK
	for lists+qemu-devel@lfdr.de; Tue, 22 Oct 2019 20:56:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39674)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andrew@ziglang.org>) id 1iN4vu-0006p2-0Y
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 20:55:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrew@ziglang.org>) id 1iN4vs-0007g1-C3
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 20:55:25 -0400
Received: from mail.ziglang.org ([108.61.23.47]:53378)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrew@ziglang.org>) id 1iN4vs-0007fK-5b
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 20:55:24 -0400
Subject: Re: [PATCH] enable translating statx syscalls on more arches
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ziglang.org; s=mail;
 t=1571792121; bh=6Acz2GimKrYtWBWHEn/EhNE2zsJ2svArtRsVZYoBi10=;
 h=Subject:From:To:References:Date:In-Reply-To;
 b=Z31bEWcJj3Nwa95Z08oQN3Oe4t2kzuxD3xCAnO/Zz/+lQleObIreSTkOXBY12mG2d
 ktQdU8RV5F5gcbAtNb5/QpMKShhGJdIU63O8IDNvO66OIVd1tX8TcET0tYgpVD5taM
 LrOdqcHwokigzNfRkxZ5Q1I1VzOylNAn0U9j3QyE=
From: Andrew Kelley <andrew@ziglang.org>
To: qemu-devel@nongnu.org
References: <7fc7a64e-cb52-fab6-5739-807b40be9c1d@ziglang.org>
Autocrypt: addr=andrew@ziglang.org; prefer-encrypt=mutual; keydata=
 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
Message-ID: <0ba23b5a-b22f-aac9-bed1-85f22bdeb082@ziglang.org>
Date: Tue, 22 Oct 2019 20:55:17 -0400
MIME-Version: 1.0
In-Reply-To: <7fc7a64e-cb52-fab6-5739-807b40be9c1d@ziglang.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="SKPF9nDI7aZKuTbEiruEOJPQEfsw0nARQ"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 108.61.23.47
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--SKPF9nDI7aZKuTbEiruEOJPQEfsw0nARQ
Content-Type: multipart/mixed; boundary="gh8p2Ip9a0d0YlVqOLlsgnJk0n4uswKDP"

--gh8p2Ip9a0d0YlVqOLlsgnJk0n4uswKDP
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

bump

On 10/16/19 5:01 PM, Andrew Kelley wrote:
> Signed-off-by: Andrew Kelley <andrew@ziglang.org>
> ---
>  linux-user/aarch64/syscall_nr.h | 13 ++++++++++
>  linux-user/arm/syscall_nr.h     | 38 ++++++++++++++++++++++++++++
>  linux-user/i386/syscall_nr.h    | 43 ++++++++++++++++++++++++++++++++
>  linux-user/mips/cpu_loop.c      |  6 +++++
>  linux-user/ppc/syscall_nr.h     | 44 +++++++++++++++++++++++++++++++++=

>  5 files changed, 144 insertions(+)
>=20
> diff --git a/linux-user/aarch64/syscall_nr.h
> b/linux-user/aarch64/syscall_nr.h
> index f00ffd7fb8..4e8d0bbb15 100644
> --- a/linux-user/aarch64/syscall_nr.h
> +++ b/linux-user/aarch64/syscall_nr.h
> @@ -276,5 +276,18 @@
>  #define TARGET_NR_membarrier 283
>  #define TARGET_NR_mlock2 284
>  #define TARGET_NR_copy_file_range 285
> +#define TARGET_NR_preadv2 286
> +#define TARGET_NR_pwritev2 287
> +#define TARGET_NR_pkey_mprotect 288
> +#define TARGET_NR_pkey_alloc 289
> +#define TARGET_NR_pkey_free 290
> +#define TARGET_NR_statx 291
> +#define TARGET_NR_io_pgetevents 292
> +#define TARGET_NR_rseq 293
> +#define TARGET_NR_kexec_file_load 294
> +#define TARGET_NR_pidfd_send_signal 424
> +#define TARGET_NR_io_uring_setup 425
> +#define TARGET_NR_io_uring_enter 426
> +#define TARGET_NR_io_uring_register 427
>=20
>  #endif
> diff --git a/linux-user/arm/syscall_nr.h b/linux-user/arm/syscall_nr.h
> index e7eda0d766..20afa3992a 100644
> --- a/linux-user/arm/syscall_nr.h
> +++ b/linux-user/arm/syscall_nr.h
> @@ -400,4 +400,42 @@
>  #define TARGET_NR_membarrier                   (389)
>  #define TARGET_NR_mlock2                       (390)
>=20
> +#define TARGET_NR_copy_file_range              (391)
> +#define TARGET_NR_preadv2                      (392)
> +#define TARGET_NR_pwritev2                     (393)
> +#define TARGET_NR_pkey_mprotect                (394)
> +#define TARGET_NR_pkey_alloc                   (395)
> +#define TARGET_NR_pkey_free                    (396)
> +#define TARGET_NR_statx                        (397)
> +#define TARGET_NR_rseq                         (398)
> +#define TARGET_NR_io_pgetevents                (399)
> +#define TARGET_NR_migrate_pages                (400)
> +
> +#define TARGET_NR_kexec_file_load              (401)
> +#define TARGET_NR_clock_gettime64              (403)
> +#define TARGET_NR_clock_settime64              (404)
> +#define TARGET_NR_clock_adjtime64              (405)
> +#define TARGET_NR_clock_getres_time64          (406)
> +#define TARGET_NR_clock_nanosleep_time64       (407)
> +#define TARGET_NR_timer_gettime64              (408)
> +#define TARGET_NR_timer_settime64              (409)
> +#define TARGET_NR_timerfd_gettime64            (410)
> +
> +#define TARGET_NR_timerfd_settime64            (411)
> +#define TARGET_NR_utimensat_time64             (412)
> +#define TARGET_NR_pselect6_time64              (413)
> +#define TARGET_NR_ppoll_time64                 (414)
> +#define TARGET_NR_io_pgetevents_time64         (416)
> +#define TARGET_NR_recvmmsg_time64              (417)
> +#define TARGET_NR_mq_timedsend_time64          (418)
> +#define TARGET_NR_mq_timedreceive_time64       (419)
> +#define TARGET_NR_semtimedop_time64            (420)
> +
> +#define TARGET_NR_rt_sigtimedwait_time64       (421)
> +#define TARGET_NR_futex_time64                 (422)
> +#define TARGET_NR_sched_rr_get_interval_time64 (423)
> +#define TARGET_NR_pidfd_send_signal            (424)
> +#define TARGET_NR_io_uring_setup               (425)
> +#define TARGET_NR_io_uring_enter               (426)
> +#define TARGET_NR_io_uring_register            (427)
>  #endif
> diff --git a/linux-user/i386/syscall_nr.h b/linux-user/i386/syscall_nr.=
h
> index 3234ec21c6..e641674daf 100644
> --- a/linux-user/i386/syscall_nr.h
> +++ b/linux-user/i386/syscall_nr.h
> @@ -383,5 +383,48 @@
>  #define TARGET_NR_membarrier            375
>  #define TARGET_NR_mlock2                376
>  #define TARGET_NR_copy_file_range       377
> +#define TARGET_NR_preadv2 378
> +#define TARGET_NR_pwritev2 379
> +#define TARGET_NR_pkey_mprotect 380
> +#define TARGET_NR_pkey_alloc 381
> +#define TARGET_NR_pkey_free 382
> +#define TARGET_NR_statx 383
> +#define TARGET_NR_arch_prctl 384
> +#define TARGET_NR_io_pgetevents 385
> +#define TARGET_NR_rseq 386
> +#define TARGET_NR_semget 393
> +#define TARGET_NR_semctl 394
> +#define TARGET_NR_shmget 395
> +#define TARGET_NR_shmctl 396
> +#define TARGET_NR_shmat 397
> +#define TARGET_NR_shmdt 398
> +#define TARGET_NR_msgget 399
> +#define TARGET_NR_msgsnd 400
> +#define TARGET_NR_msgrcv 401
> +#define TARGET_NR_msgctl 402
> +#define TARGET_NR_clock_gettime64 403
> +#define TARGET_NR_clock_settime64 404
> +#define TARGET_NR_clock_adjtime64 405
> +#define TARGET_NR_clock_getres_time64 406
> +#define TARGET_NR_clock_nanosleep_time64 407
> +#define TARGET_NR_timer_gettime64 408
> +#define TARGET_NR_timer_settime64 409
> +#define TARGET_NR_timerfd_gettime64 410
> +#define TARGET_NR_timerfd_settime64 411
> +#define TARGET_NR_utimensat_time64 412
> +#define TARGET_NR_pselect6_time64 413
> +#define TARGET_NR_ppoll_time64 414
> +#define TARGET_NR_io_pgetevents_time64 416
> +#define TARGET_NR_recvmmsg_time64 417
> +#define TARGET_NR_mq_timedsend_time64 418
> +#define TARGET_NR_mq_timedreceive_time64 419
> +#define TARGET_NR_semtimedop_time64 420
> +#define TARGET_NR_rt_sigtimedwait_time64 421
> +#define TARGET_NR_futex_time64 422
> +#define TARGET_NR_sched_rr_get_interval_time64 423
> +#define TARGET_NR_pidfd_send_signal 424
> +#define TARGET_NR_io_uring_setup 425
> +#define TARGET_NR_io_uring_enter 426
> +#define TARGET_NR_io_uring_register 427
>=20
>  #endif
> diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
> index 39915b3fde..044a00f531 100644
> --- a/linux-user/mips/cpu_loop.c
> +++ b/linux-user/mips/cpu_loop.c
> @@ -390,6 +390,12 @@ static const uint8_t mips_syscall_args[] =3D {
>          MIPS_SYS(sys_copy_file_range, 6) /* 360 */
>          MIPS_SYS(sys_preadv2, 6)
>          MIPS_SYS(sys_pwritev2, 6)
> +        MIPS_SYS(sys_pkey_mprotect, 4)
> +        MIPS_SYS(sys_pkey_alloc, 2)
> +        MIPS_SYS(sys_pkey_free, 1)
> +        MIPS_SYS(sys_statx, 5)
> +        MIPS_SYS(sys_rseq, 4)
> +        MIPS_SYS(sys_io_pgetevents, 5)
>  };
>  #  undef MIPS_SYS
>  # endif /* O32 */
> diff --git a/linux-user/ppc/syscall_nr.h b/linux-user/ppc/syscall_nr.h
> index b57a07b931..eea4056e3d 100644
> --- a/linux-user/ppc/syscall_nr.h
> +++ b/linux-user/ppc/syscall_nr.h
> @@ -398,5 +398,49 @@
>  #define TARGET_NR_shmget                376
>  #define TARGET_NR_shmctl                377
>  #define TARGET_NR_mlock2                378
> +#define TARGET_NR_copy_file_range       379
> +#define TARGET_NR_preadv2               380
> +#define TARGET_NR_pwritev2              381
> +#define TARGET_NR_kexec_file_load       382
> +#define TARGET_NR_statx                 383
> +#define TARGET_NR_pkey_alloc            384
> +#define TARGET_NR_pkey_free             385
> +#define TARGET_NR_pkey_mprotect         386
> +#define TARGET_NR_rseq                  387
> +#define TARGET_NR_io_pgetevents         388
> +#define TARGET_NR_semget                393
> +#define TARGET_NR_semctl                394
> +#define TARGET_NR_shmget                395
> +#define TARGET_NR_shmctl                396
> +#define TARGET_NR_shmat                 397
> +#define TARGET_NR_shmdt                 398
> +#define TARGET_NR_msgget                399
> +#define TARGET_NR_msgsnd                400
> +#define TARGET_NR_msgrcv                401
> +#define TARGET_NR_msgctl                402
> +#define TARGET_NR_clock_gettime64       403
> +#define TARGET_NR_clock_settime64       404
> +#define TARGET_NR_clock_adjtime64       405
> +#define TARGET_NR_clock_getres_time64   406
> +#define TARGET_NR_clock_nanosleep_time64 407
> +#define TARGET_NR_timer_gettime64       408
> +#define TARGET_NR_timer_settime64       409
> +#define TARGET_NR_timerfd_gettime64     410
> +#define TARGET_NR_timerfd_settime64     411
> +#define TARGET_NR_utimensat_time64      412
> +#define TARGET_NR_pselect6_time64       413
> +#define TARGET_NR_ppoll_time64          414
> +#define TARGET_NR_io_pgetevents_time64  416
> +#define TARGET_NR_recvmmsg_time64       417
> +#define TARGET_NR_mq_timedsend_time64   418
> +#define TARGET_NR_mq_timedreceive_time64 419
> +#define TARGET_NR_semtimedop_time64     420
> +#define TARGET_NR_rt_sigtimedwait_time64 421
> +#define TARGET_NR_futex_time64          422
> +#define TARGET_NR_sched_rr_get_interval_time64 423
> +#define TARGET_NR_pidfd_send_signal     424
> +#define TARGET_NR_io_uring_setup        425
> +#define TARGET_NR_io_uring_enter        426
> +#define TARGET_NR_io_uring_register     427
>=20
>  #endif
>=20



--gh8p2Ip9a0d0YlVqOLlsgnJk0n4uswKDP--

--SKPF9nDI7aZKuTbEiruEOJPQEfsw0nARQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEl8v20Nl/A6duouJgfF9Uj3KFAakFAl2vpPUACgkQfF9Uj3KF
AanUSA//RjXjysuYvOJv93IiUwYdYgSATT6QUUvJN+HEVaxTef8i2LPrJJzC5C13
tpD/CyvpAdedXvRUIno9JNPDAvxbyygdJ/zos/rz557c6tKiaheRpp/6kilRMe3k
OwOkzXQhbtF5jSE7TYLRlvYgYC2p0NE37zxgeOq586HDNRCHqgUawZU8UB/00oe9
8mfbiH1JgLQk4i5uK7o5EEPoBdSY3+fUekKynbCoCePJ/O99pOp0hFIo6XOR8wBL
EXegPrnZ5MgcI4n57FlhiD3G0o0WL+hE5vBCHjNbijRafo24I9h+p6Sc7OIHOnKk
tmKhGY5jyAI000CcULo4imFbmHXT4wQTyOi/c7Pr1JYhRAW7QWcoxCojeKMgH8YD
B04nd/ywIkpYoPQAA5nSlRe3yGWR/ANOvenVdP0e5KL2vm5ZdZcizZkWocxXJ36V
rWlfVk7kYveGibnu2eGJzt0VLYfACsdHWZFOLYM5I07aAZ3zDLtVnBP/BsE9F7Ro
zSvuQ+mBb5S9FFCnoDpMj/pwzmCOUNDP/3KlLYniSDNUnwO2iPI6udwaPAhapZJP
pWBP2sC6LHCZZSCrwhAe9xyW6q5tE+kuCUWuFy/G3sZM91KTelAcAtZc+IwmtqhO
+dkboAmZy4/AQvEtVyiuJ4OG5OAAX+nxaql+jPQsZ9qnsk/Rk4I=
=hbqj
-----END PGP SIGNATURE-----

--SKPF9nDI7aZKuTbEiruEOJPQEfsw0nARQ--

