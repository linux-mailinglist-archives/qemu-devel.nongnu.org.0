Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C83C03B0B34
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 19:11:22 +0200 (CEST)
Received: from localhost ([::1]:42078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvjvl-0001Jf-UB
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 13:11:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1lvjuI-0000Wg-Kx
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 13:09:51 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:33688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1lvjuG-0007YG-F3
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 13:09:50 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8BA021FD36;
 Tue, 22 Jun 2021 17:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624381785; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mVGDkDTARf1W+6GJljq9QRnzIAmxUmn2n1Z2QSXL148=;
 b=b4pUSCezJtpp+RK49b8ooZzPSvHnqQGzj55E9A4HKR5octElarZvg7Q5x55FKjUg+AijSA
 dqN5BTAIRqCGp6ugxE2tVolkioXZjTQ5UlPTQEuAQqR/FOgZXJMGYsBx95fHIEY9YSNkc5
 sieUVLZNvErIqG796FvrLTmYhTLCmpY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624381785;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mVGDkDTARf1W+6GJljq9QRnzIAmxUmn2n1Z2QSXL148=;
 b=hUMWACH8cGB1Fq6x0Ps7CRTdasQeYkT8MazjOUWxNOxnAFA2jWAt9NlbCj37xO3YoRnmQS
 ZpKFQKi8VymdNpAA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 2739A11A97;
 Tue, 22 Jun 2021 17:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624381785; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mVGDkDTARf1W+6GJljq9QRnzIAmxUmn2n1Z2QSXL148=;
 b=b4pUSCezJtpp+RK49b8ooZzPSvHnqQGzj55E9A4HKR5octElarZvg7Q5x55FKjUg+AijSA
 dqN5BTAIRqCGp6ugxE2tVolkioXZjTQ5UlPTQEuAQqR/FOgZXJMGYsBx95fHIEY9YSNkc5
 sieUVLZNvErIqG796FvrLTmYhTLCmpY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624381785;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mVGDkDTARf1W+6GJljq9QRnzIAmxUmn2n1Z2QSXL148=;
 b=hUMWACH8cGB1Fq6x0Ps7CRTdasQeYkT8MazjOUWxNOxnAFA2jWAt9NlbCj37xO3YoRnmQS
 ZpKFQKi8VymdNpAA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id E7rQN1cZ0mBDPwAALh3uQQ
 (envelope-from <jziviani@suse.de>); Tue, 22 Jun 2021 17:09:43 +0000
Date: Tue, 22 Jun 2021 14:09:37 -0300
From: "Jose R. Ziviani" <jziviani@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 3/4] modules: module.h kerneldoc annotations
Message-ID: <YNIZUYjsZMkBBf4/@pizza>
References: <20210622125110.262843-1-kraxel@redhat.com>
 <20210622125110.262843-4-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ZFzbMhsvudhbUqqJ"
Content-Disposition: inline
In-Reply-To: <20210622125110.262843-4-kraxel@redhat.com>
Received-SPF: pass client-ip=195.135.220.29; envelope-from=jziviani@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ZFzbMhsvudhbUqqJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Gerd,

On Tue, Jun 22, 2021 at 02:51:09PM +0200, Gerd Hoffmann wrote:
> ---
>  include/qemu/module.h | 59 +++++++++++++++++++++++++++++++++----------
>  1 file changed, 45 insertions(+), 14 deletions(-)

This header has a copyright date from 2009. Not sure if it requires an
update.

>=20
> diff --git a/include/qemu/module.h b/include/qemu/module.h
> index 7f4b1af8198c..8bc80535a4d4 100644
> --- a/include/qemu/module.h
> +++ b/include/qemu/module.h
> @@ -74,11 +74,18 @@ void module_load_qom_one(const char *type);
>  void module_load_qom_all(void);
>  void module_allow_arch(const char *arch);
> =20
> -/*
> - * module info annotation macros
> +/**
> + * DOC: module info annotation macros
>   *
> - * scripts/modinfo-collect.py will collect module info,
> - * using the preprocessor and -DQEMU_MODINFO
> + * `scripts/modinfo-collect.py` will collect module info,
> + * using the preprocessor and -DQEMU_MODINFO.
> + *
> + * `scripts/modinfo-generate.py` will create a module meta-data database
> + * from the collected information so qemu knows about module
> + * dependencies and QOM objects implemented by modules.
> + *
> + * See `*.modinfo` and `modinfo.c` in the build directory to check the
> + * script results.
>   */
>  #ifdef QEMU_MODINFO
>  # define modinfo(kind, value) \
> @@ -87,24 +94,48 @@ void module_allow_arch(const char *arch);
>  # define modinfo(kind, value)
>  #endif
> =20
> -/* module implements QOM type <name> */
> +/**
> + * module_obj
> + *
> + * @name: QOM type.
> + *
> + * This module implements QOM type @name.
> + */
>  #define module_obj(name) modinfo(obj, name)
> =20
> -/* module has a dependency on <name> */
> +/**
> + * module_dep
> + *
> + * @name: module name
> + *
> + * This module depends on module @name.
> + */
>  #define module_dep(name) modinfo(dep, name)
> =20
> -/* module is for target architecture <name> */
> +/**
> + * module_arch
> + *
> + * @arch: target architecture
> + *
> + * This module is for target architecture @arch.
> + *
> + * Note that target-dependent modules are tagged automatically, so
> + * this is only needed in case target-independent modules should be
> + * restricted.  Use case example: the ccw bus is implemented by s390x
> + * only.
> + */
>  #define module_arch(name) modinfo(arch, name)
> =20
> -/* module registers QemuOpts <name> */
> +/**
> + * module_opts
> + *
> + * @name: QemuOpts name
> + *
> + * This module registers QemuOpts @name.
> + */
>  #define module_opts(name) modinfo(opts, name)
> =20
> -/*
> - * module info database
> - *
> - * scripts/modinfo-generate.c will build this using the data collected
> - * by scripts/modinfo-collect.py
> - */
> +/* module info database (created by scripts/modinfo-generate.py) */
>  typedef struct QemuModinfo QemuModinfo;
>  struct QemuModinfo {
>      const char *name;
> --=20
> 2.31.1
>=20
>=20

--ZFzbMhsvudhbUqqJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEVQB+DwLGVyv815sBaJ4wdCKKF5YFAmDSGU0ACgkQaJ4wdCKK
F5aWlxAAms9l180ES0QeE76Y+RHGNkE0s8Ke+kMx1v/MjUECyoKn4NdAXIB6R23u
9+pSbWM1CzHl6aAnRBoHC+RArXY9XZDlim9T99aDgEiag3RQEwPhuykZggtSSBPr
1kCemSJZ7fsJJ52HI1GBwujN3cSbSdWzgUx1YkNtS7Ih8l1xZcm3rNnMKhQ8x7rR
wSn/slUdN5uHl9aUDnp/krnrJMWIMZ+PbNm6ObICXOb0hlOwqF8kIXmqAhZ5hRDs
+X98rmNlyHTd0pOla9W9IDMuU7gFkQFmY2WcWRjZQZlTHvPeCr3tVjZFpfBn3mXU
hskDFy9lPw5kWvXzIN9uMBcypMguVbTFWGNatN8vJ4LXqxkYVt33qYiTET9JWBA3
G+G2ugf63YczGRidypfm+VjCARj46fYPczgPr4JYgnkcu3TP52JIquWYErg9DeFc
qYfUOz8gxAy0cxYsD6UFQj4PK9nH30JJCwS7hSlcXMcqaEmeTiq3Lc8BGkbWxzeJ
GNW7Xmi0bVpPAgDwG9MTnIUfvXV+dwnQ/IoIzVAIaa7tgnzYpPzEVS6FCqAM5VVV
7X231LMSJqMSZPS+oXfJ8vq37CN1rMkmDD7WINPuA/PwciMdGLj4qCipHTaX55xQ
PyfNhR9HNPmbkdliaR3AG6IsGspG5LgFOojyuvnFu/UhvDH2kH4=
=DJuJ
-----END PGP SIGNATURE-----

--ZFzbMhsvudhbUqqJ--

