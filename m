Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DE364EC74
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 14:58:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6BCD-0001mn-Kj; Fri, 16 Dec 2022 08:56:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1p6BC7-0001g6-PI; Fri, 16 Dec 2022 08:56:11 -0500
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1p6BC5-0008Ql-SV; Fri, 16 Dec 2022 08:56:11 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F21365CF80;
 Fri, 16 Dec 2022 13:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1671198967; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4PGmMQ2bHca1iLM/aBxU4PtZxXVyuriErZvLXNdYNWg=;
 b=l0GxX5w3hfABP1YG5oKt+DKKzH2ZJh/m2wmQBFtUnls9Zr4Tah+GjNT9NCJb91TSXkIou9
 1qYpJEXjDB5P2qEQ7B1nPGaDZBqCJ+jf9JjzTWgSt6xDjVYJ1vgelA4XBocfbZMvdrEfYO
 qryjnCJW8zpV1aR8qNvybcjk9rFiXhg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1671198968;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4PGmMQ2bHca1iLM/aBxU4PtZxXVyuriErZvLXNdYNWg=;
 b=EIwNp29haiYoJSh+YhUnoMJS5x9zbOiS3iS3pbi41WXu6l3ASRZQjesJRQCZzVB7eYJP6h
 rL2gQl0FPt+mDoBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 80165138F0;
 Fri, 16 Dec 2022 13:56:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8dZ0Evd4nGPhWAAAMHmgww
 (envelope-from <farosas@suse.de>); Fri, 16 Dec 2022 13:56:07 +0000
From: Fabiano Rosas <farosas@suse.de>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org, Peter Lieven
 <pl@kamp.de>, Kevin Wolf <kwolf@redhat.com>, libvir-list@redhat.com,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, =?utf-8?Q?Daniel_P=2E_Berrang?=
 =?utf-8?Q?=C3=A9?=
 <berrange@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2 3/3] ui: remove deprecated 'password' option for SPICE
In-Reply-To: <20221216113152.584460-4-berrange@redhat.com>
References: <20221216113152.584460-1-berrange@redhat.com>
 <20221216113152.584460-4-berrange@redhat.com>
Date: Fri, 16 Dec 2022 10:56:05 -0300
Message-ID: <87v8mbh2q2.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=195.135.220.29; envelope-from=farosas@suse.de;
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

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> This has been replaced by the 'password-secret' option,
> which references a 'secret' object instance.
>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Reviewed-by: Fabiano Rosas <farosas@suse.de>

Just a small detail below.

> ---
>  docs/about/deprecated.rst       |  8 --------
>  docs/about/removed-features.rst |  7 +++++++
>  qemu-options.hx                 |  9 +--------
>  ui/spice-core.c                 | 15 ---------------
>  4 files changed, 8 insertions(+), 31 deletions(-)
>
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index daf2334040..8fbe7cb5fe 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -73,14 +73,6 @@ Input parameters that take a size value should only us=
e a size suffix
>  the value is hexadecimal.  That is, '0x20M' is deprecated, and should
>  be written either as '32M' or as '0x2000000'.
>=20=20
> -``-spice password=3Dstring`` (since 6.0)
> -''''''''''''''''''''''''''''''''''''''
> -
> -This option is insecure because the SPICE password remains visible in
> -the process listing. This is replaced by the new ``password-secret``
> -option which lets the password be securely provided on the command
> -line using a ``secret`` object instance.
> -
>  ``-smp`` ("parameter=3D0" SMP configurations) (since 6.2)
>  '''''''''''''''''''''''''''''''''''''''''''''''''''''''
>=20=20
> diff --git a/docs/about/removed-features.rst b/docs/about/removed-feature=
s.rst
> index 63df9848fd..2cbb1b7afe 100644
> --- a/docs/about/removed-features.rst
> +++ b/docs/about/removed-features.rst
> @@ -408,6 +408,13 @@ pcspk-audiodev=3D<name>``.
>=20=20
>  Use ``-device`` instead.
>=20=20
> +``-spice password=3Dstring`` (removed in 8.0)
> +'''''''''''''''''''''''''''''''''''''''''''
> +
> +This optionwas insecure because the SPICE password remained visible in

Missing a space here.

> +the process listing. This was replaced by the new ``password-secret``
> +option which lets the password be securely provided on the command
> +line using a ``secret`` object instance.
>=20=20
>  QEMU Machine Protocol (QMP) commands
>  ------------------------------------
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 58efb58072..847d71e567 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -2132,7 +2132,7 @@ DEF("spice", HAS_ARG, QEMU_OPTION_spice,
>      "       [,tls-channel=3D[main|display|cursor|inputs|record|playback]=
]\n"
>      "       [,plaintext-channel=3D[main|display|cursor|inputs|record|pla=
yback]]\n"
>      "       [,sasl=3Don|off][,disable-ticketing=3Don|off]\n"
> -    "       [,password=3D<string>][,password-secret=3D<secret-id>]\n"
> +    "       [,password-secret=3D<secret-id>]\n"
>      "       [,image-compression=3D[auto_glz|auto_lz|quic|glz|lz|off]]\n"
>      "       [,jpeg-wan-compression=3D[auto|never|always]]\n"
>      "       [,zlib-glz-wan-compression=3D[auto|never|always]]\n"
> @@ -2158,13 +2158,6 @@ SRST
>      ``ipv4=3Don|off``; \ ``ipv6=3Don|off``; \ ``unix=3Don|off``
>          Force using the specified IP version.
>=20=20
> -    ``password=3D<string>``
> -        Set the password you need to authenticate.
> -
> -        This option is deprecated and insecure because it leaves the
> -        password visible in the process listing. Use ``password-secret``
> -        instead.
> -
>      ``password-secret=3D<secret-id>``
>          Set the ID of the ``secret`` object containing the password
>          you need to authenticate.
> diff --git a/ui/spice-core.c b/ui/spice-core.c
> index 72f8f1681c..76f7c2bc3d 100644
> --- a/ui/spice-core.c
> +++ b/ui/spice-core.c
> @@ -412,9 +412,6 @@ static QemuOptsList qemu_spice_opts =3D {
>              .name =3D "unix",
>              .type =3D QEMU_OPT_BOOL,
>  #endif
> -        },{
> -            .name =3D "password",
> -            .type =3D QEMU_OPT_STRING,
>          },{
>              .name =3D "password-secret",
>              .type =3D QEMU_OPT_STRING,
> @@ -666,20 +663,8 @@ static void qemu_spice_init(void)
>      }
>      passwordSecret =3D qemu_opt_get(opts, "password-secret");
>      if (passwordSecret) {
> -        if (qemu_opt_get(opts, "password")) {
> -            error_report("'password' option is mutually exclusive with "
> -                         "'password-secret'");
> -            exit(1);
> -        }
>          password =3D qcrypto_secret_lookup_as_utf8(passwordSecret,
>                                                   &error_fatal);
> -    } else {
> -        str =3D qemu_opt_get(opts, "password");
> -        if (str) {
> -            warn_report("'password' option is deprecated and insecure, "
> -                        "use 'password-secret' instead");
> -            password =3D g_strdup(str);
> -        }
>      }
>=20=20
>      if (tls_port) {

