Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE2F2EC1A9
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 18:04:11 +0100 (CET)
Received: from localhost ([::1]:35046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxCED-0006Gp-Oc
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 12:04:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kxC9Z-0004QX-4r
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 11:59:21 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:34850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kxC9X-0004qC-5w
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 11:59:20 -0500
Received: by mail-wm1-x333.google.com with SMTP id e25so3224184wme.0
 for <qemu-devel@nongnu.org>; Wed, 06 Jan 2021 08:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=voPqevML/KpfUPdLIIMdMEDy04TD731yu9Sw6HmnwiU=;
 b=VwCSAOedErp4Sb+pG9TX8+pNulR/NEuTWIDqXn7+T/bJuLvdlF80cwb+uK3uEGIq/w
 aMJ2I++S653q+RDINP3s77enT1q+FEB/hkVwBqRhAZ8t5tI+mEs/BtRHQ2MdPGseQps3
 mnl7O5fF3SI6X5DmY7cllQxcCXKeXq7S5Ma+lF3XhwEQw5m1D9MR/EvsStwb/8ZTrKUM
 Z6jZ4gJfFSkr7qqTS0liu0fCGbbWmX1pmDHg0FPh0Oii4E+cXUxXrOwsx/2iazpENY3k
 a94sypA5L5xUo6UzMautUY9o5E8v13xbMZ/6Hs11lbj/n4r5SzzGD1IHMw/fJAnuFNv3
 jBRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=voPqevML/KpfUPdLIIMdMEDy04TD731yu9Sw6HmnwiU=;
 b=dEroAq5KUD1wsVrUffccDtt9dkWyiRSgLKZ6QGH1rbkEnNvFuC3jhYL485IPZd8AXO
 ODUHaIw0v50E7+f7jAUgQN/FCfijbuGzxcdUdOZTqCircma6YtcPQ+LQ9YIeVez809li
 i3s4NJK4RY5Pt8wgg6ttRfXW+IxLWXX32WbC1qUh32cxjzQ2NSkhy6xi5C0Zw7T9Ju28
 jVL5tFgkLH+Gm715odhnP3pr4J2op3hHnI7ag89SAOpPC481VBVOGTaPoyTqlHs0b/ze
 cCQelSfSKoCI9QaiJ0zrM40C/655L521uqKv/Nsd5ZRjyD48YrnzTfjQg4JPw6rCkhiN
 roBw==
X-Gm-Message-State: AOAM531q3IZFUGAZEU0Ie2210TdHRFt8Cm6idYhjO3fYTBr4uhsM3Art
 X5BTUG2UzLnxBLjwDa9XHik=
X-Google-Smtp-Source: ABdhPJwJyVhJVb2Nif4mMo4MDwGLyaSsPUsbLaQOpCH5qYjRdimR3ExEzH2Ypv7fHL36v5DeJ88FNg==
X-Received: by 2002:a1c:6741:: with SMTP id b62mr4474374wmc.21.1609952357314; 
 Wed, 06 Jan 2021 08:59:17 -0800 (PST)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id g1sm4004736wrq.30.2021.01.06.08.59.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jan 2021 08:59:16 -0800 (PST)
Date: Wed, 6 Jan 2021 16:59:14 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v2 1/1] vl.c: do not execute trace_init_backends() before
 daemonizing
Message-ID: <20210106165914.GA133192@stefanha-x1.localdomain>
References: <20210105181437.538366-1-danielhb413@gmail.com>
 <20210105181437.538366-2-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ZGiS0Q5IWpPtfppv"
Content-Disposition: inline
In-Reply-To: <20210105181437.538366-2-danielhb413@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=stefanha@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 05, 2021 at 03:14:37PM -0300, Daniel Henrique Barboza wrote:
> Commit v5.2.0-190-g0546c0609c ("vl: split various early command line
> options to a separate function") moved the trace backend init code to
> the qemu_process_early_options(). Which is now being called before
> os_daemonize() via qemu_maybe_daemonize().
>=20
> Turns out that this change of order causes a problem when executing
> QEMU in daemon mode and with CONFIG_TRACE_SIMPLE. The trace thread
> is now being created by the parent, and the parent is left waiting for
> a trace file flush that was registered via st_init(). The result is
> that the parent process never exits.
>=20
> To reproduce, fire up a QEMU process with -daemonize and with
> CONFIG_TRACE_SIMPLE enabled. Two QEMU process will be left in the
> host:
>=20
> $ sudo ./x86_64-softmmu/qemu-system-x86_64 -S -no-user-config -nodefaults=
 \
>   -nographic -machine none,accel=3Dkvm:tcg -daemonize
>=20
> $ ps axf | grep qemu
>  529710 pts/3    S+     0:00  |       \_ grep --color=3Dauto qemu
>  529697 ?        Ssl    0:00  \_ ./x86_64-softmmu/qemu-system-x86_64 -S -=
no-user-config -nodefaults -nographic -machine none,accel=3Dkvm:tcg -daemon=
ize
>  529699 ?        Sl     0:00      \_ ./x86_64-softmmu/qemu-system-x86_64 =
-S -no-user-config -nodefaults -nographic -machine none,accel=3Dkvm:tcg -da=
emonize
>=20
> The parent thread is hang in flush_trace_file:
>=20
> $ sudo gdb ./x86_64-softmmu/qemu-system-x86_64 529697
> (..)
> (gdb) bt
>  #0  0x00007f9dac6a137d in syscall () at /lib64/libc.so.6
>  #1  0x00007f9dacc3c4f3 in g_cond_wait () at /lib64/libglib-2.0.so.0
>  #2  0x0000555d12f952da in flush_trace_file (wait=3Dtrue) at ../trace/sim=
ple.c:140
>  #3  0x0000555d12f95b4c in st_flush_trace_buffer () at ../trace/simple.c:=
383
>  #4  0x00007f9dac5e43a7 in __run_exit_handlers () at /lib64/libc.so.6
>  #5  0x00007f9dac5e4550 in on_exit () at /lib64/libc.so.6
>  #6  0x0000555d12d454de in os_daemonize () at ../os-posix.c:255
>  #7  0x0000555d12d0bd5c in qemu_maybe_daemonize (pid_file=3D0x0) at ../so=
ftmmu/vl.c:2408
>  #8  0x0000555d12d0e566 in qemu_init (argc=3D8, argv=3D0x7fffc594d9b8, en=
vp=3D0x7fffc594da00) at ../softmmu/vl.c:3459
>  #9  0x0000555d128edac1 in main (argc=3D8, argv=3D0x7fffc594d9b8, envp=3D=
0x7fffc594da00) at ../softmmu/main.c:49
> (gdb)
>=20
> Aside from the 'zombie' process in the host, this is directly impacting
> Libvirt. Libvirt waits for the parent process to exit to be sure that the
> QMP monitor is available in the daemonized process to fetch QEMU
> capabilities, and as is now Libvirt hangs at daemon start waiting
> for the parent thread to exit.
>=20
> The fix is simple: just move the trace backend related code back to
> be executed after daemonizing.
>=20
> Fixes: 0546c0609cb5a8d90c1cbac8e0d64b5a048bbb19
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  softmmu/vl.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)

Acked-by: Stefan Hajnoczi <stefanha@redhat.com>

--ZGiS0Q5IWpPtfppv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/17GIACgkQnKSrs4Gr
c8hEaggAytSuPG8IJg4YPNMmpCLTt2OE1skasQLtRdpkDgMDa+Wd5Hv9PpskGRKz
uBIocqZBV0hZfltOzMVlyglmVtpaBMjUR0HXJZD4VIdkpVBsnkng5/JEeP2WGyy5
7xue5O8AvbSWFjvH3mwX7cp1IiUy04/qrs6I38fBSEDhBfL0/KuVdWEUqlLdjFuW
VkptnDRiP/Dtn91W5A80v1GNZl95OpETMUCKv3adHaNJaH8S8cZPmrvPRB8swpXU
xHOJ74AQygKgCaNH71fvdu2VKC5kY1fDL+olv+C7qAD8mbP7vYTzBWxejnrvS7xM
vDFeHN8zj+Wiv8yViAPFS/QmJWvvig==
=itj/
-----END PGP SIGNATURE-----

--ZGiS0Q5IWpPtfppv--

