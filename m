Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2AD6ADA06
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 10:16:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZTQ6-0006Ia-R9; Tue, 07 Mar 2023 04:15:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antoine.damhet@shadow.tech>)
 id 1pZTPn-000697-JY
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 04:15:25 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <antoine.damhet@shadow.tech>)
 id 1pZTPk-0000HW-Hl
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 04:15:22 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 fm20-20020a05600c0c1400b003ead37e6588so9913632wmb.5
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 01:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shadow-tech.20210112.gappssmtp.com; s=20210112; t=1678180517;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=G8EqAAFfT7bMBtlZsef438IsU/VoDt2L5j0Ru/LDWeA=;
 b=fWbg5Rf4vzq/FTpD+DoZBMejuBI1HWGzKyrE0mrPcUGcjHddEZU8jqiytN6XwMlbG6
 7xUfY64ms+ZGN0y0smBNX8wxByWa8GJk0gTIOA+lAWhXOiDAk00l5kditoUS1VVyDaR0
 Es/MXkeLfJZ89wRvLHudRTT/IlpuOr1aixJsodi0N6qu5LOIUpfKTJBGgQU9si3KNXQk
 Ebh7EIqSaUXAyQSC1DXG1rMbc2Qr7eMcA++FMp/RQZZBGeO4RTNx4lAzfO1ovGG7nX80
 +6P7R5FbKBX8Qzqv/nsLiH//Y7nnhCD8wXtH5+fwJGN2qIfLiRTcbS2vf7V6Gvn5NdVI
 Pc8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678180517;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G8EqAAFfT7bMBtlZsef438IsU/VoDt2L5j0Ru/LDWeA=;
 b=RwfqYmDaY3EqpQPyv24r8bphyNS/W74z5dJM/ZuV+CImBv00pMu0AYp2qjAK94Xx2e
 fXl04uIfUgMfnN8ITPSGlkU5Gdpzluxjta1ktvi4Ms39dvv7VNoAfyW/k+RgxSPmDrQp
 lEHG5IIBUpKduzpgRrQIJb2mxsb0DS5tKGiWwqKoSyWUEDYca4FXDgyEUl34kTo0y4sI
 33BIUJXUHanIE9h2QRp5f/6dqZsU80hApTv8LTlAGn2C6GoA+w61iCEUTGSygCZt0uJK
 AQ5sMpg4LFSx5l5QaAvZplaum2fdcQwp4b5KI5+Yw9BX1isHgz0qQ6Yv+Cu3J9eZWjsz
 wupQ==
X-Gm-Message-State: AO0yUKWnRPeAR9yXjCD/F7wjG5xJBit5Cg59+v6vnjC9IGjQ6YTAIGpr
 IdtTZSoXW5qQURhYAYcTSdKOhA==
X-Google-Smtp-Source: AK7set/XigBXudtrm4Fc5D4VSfbYc1c4Gug/i5wlXALXla7QYvJUwfWT2voXH0w0AO2CPRcXgastrg==
X-Received: by 2002:a7b:c8d9:0:b0:3eb:2067:1141 with SMTP id
 f25-20020a7bc8d9000000b003eb20671141mr12235982wml.38.1678180516995; 
 Tue, 07 Mar 2023 01:15:16 -0800 (PST)
Received: from localhost ([2a01:e34:ec43:fd01:c66b:5ea5:9a7:c104])
 by smtp.gmail.com with ESMTPSA id
 o13-20020a5d670d000000b002c8476dde7asm12047768wru.114.2023.03.07.01.15.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 01:15:16 -0800 (PST)
Date: Tue, 7 Mar 2023 10:15:15 +0100
From: Antoine Damhet <antoine.damhet@shadow.tech>
To: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 charles.frey@shadow.tech, berrange@redhat.com
Subject: Re: [PATCH] io/channel-tls: plug memory leakage on GSource
Message-ID: <20230307091515.e6am2hwzz5fxrna6@cole.xdbob.net>
References: <98f750b6ded2dd2e8d0e4ffc9935d3d6e0cd59f4.1678144392.git.quic_mathbern@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wb22qbrmgis53vw4"
Content-Disposition: inline
In-Reply-To: <98f750b6ded2dd2e8d0e4ffc9935d3d6e0cd59f4.1678144392.git.quic_mathbern@quicinc.com>
Received-SPF: permerror client-ip=2a00:1450:4864:20::32e;
 envelope-from=antoine.damhet@shadow.tech; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


--wb22qbrmgis53vw4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Nice catch !

On Mon, Mar 06, 2023 at 08:15:21PM -0300, Matheus Tavares Bernardino wrote:
> This leakage can be seen through test-io-channel-tls:
>=20
> $ ../configure --target-list=3Daarch64-softmmu --enable-sanitizers
> $ make ./tests/unit/test-io-channel-tls
> $ ./tests/unit/test-io-channel-tls
>=20
> Indirect leak of 104 byte(s) in 1 object(s) allocated from:
>     #0 0x7f81d1725808 in __interceptor_malloc ../../../../src/libsanitize=
r/asan/asan_malloc_linux.cc:144
>     #1 0x7f81d135ae98 in g_malloc (/lib/x86_64-linux-gnu/libglib-2.0.so.0=
+0x57e98)
>     #2 0x55616c5d4c1b in object_new_with_propv ../qom/object.c:795
>     #3 0x55616c5d4a83 in object_new_with_props ../qom/object.c:768
>     #4 0x55616c5c5415 in test_tls_creds_create ../tests/unit/test-io-chan=
nel-tls.c:70
>     #5 0x55616c5c5a6b in test_io_channel_tls ../tests/unit/test-io-channe=
l-tls.c:158
>     #6 0x7f81d137d58d  (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x7a58d)
>=20
> Indirect leak of 32 byte(s) in 1 object(s) allocated from:
>     #0 0x7f81d1725a06 in __interceptor_calloc ../../../../src/libsanitize=
r/asan/asan_malloc_linux.cc:153
>     #1 0x7f81d1472a20 in gnutls_dh_params_init (/lib/x86_64-linux-gnu/lib=
gnutls.so.30+0x46a20)
>     #2 0x55616c6485ff in qcrypto_tls_creds_x509_load ../crypto/tlscredsx5=
09.c:634
>     #3 0x55616c648ba2 in qcrypto_tls_creds_x509_complete ../crypto/tlscre=
dsx509.c:694
>     #4 0x55616c5e1fea in user_creatable_complete ../qom/object_interfaces=
=2Ec:28
>     #5 0x55616c5d4c8c in object_new_with_propv ../qom/object.c:807
>     #6 0x55616c5d4a83 in object_new_with_props ../qom/object.c:768
>     #7 0x55616c5c5415 in test_tls_creds_create ../tests/unit/test-io-chan=
nel-tls.c:70
>     #8 0x55616c5c5a6b in test_io_channel_tls ../tests/unit/test-io-channe=
l-tls.c:158
>     #9 0x7f81d137d58d  (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x7a58d)
>=20
> ...
>=20
> SUMMARY: AddressSanitizer: 49143 byte(s) leaked in 184 allocation(s).
>=20
> The docs for `g_source_add_child_source(source, child_source)` says
> "source will hold a reference on child_source while child_source is
> attached to it." Therefore, we should unreference the child source at
> `qio_channel_tls_read_watch()` after attaching it to `source`. With this
> change, ./tests/unit/test-io-channel-tls shows no leakages.
>=20
> Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>

Reviewed-by: Antoine Damhet <antoine.damhet@shadow.tech>

> ---
>  io/channel-tls.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/io/channel-tls.c b/io/channel-tls.c
> index 8052945ba0..5a7a3d48d6 100644
> --- a/io/channel-tls.c
> +++ b/io/channel-tls.c
> @@ -446,6 +446,7 @@ qio_channel_tls_read_watch(QIOChannelTLS *tioc, GSour=
ce *source)
>      object_ref(OBJECT(tioc));
> =20
>      g_source_add_child_source(source, child);
> +    g_source_unref(child);
>  }
> =20
>  static GSource *qio_channel_tls_create_watch(QIOChannel *ioc,
> --=20
> 2.37.2
>=20

--=20
Antoine 'xdbob' Damhet

--wb22qbrmgis53vw4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEArm1WbQx2GmOsfF83AmjLzzljz4FAmQHAJ8ACgkQ3AmjLzzl
jz75hQgAghPYBlNR7QDzGDa60cmCdbzfwIOmELkM+ghY0ryZJND3xmAT/8l1CR+l
RE2kr/lNHcR1GAw5zoygbMG9PgMSQvEnNP1Eq+pQzXDGmLw2ukVMuVtKZPyDECTD
pMD8pm6iQ8N4vat6zVvdiJ1wgs3KR7eCGAzmsmIAXk/WCDNArMBhehbHEPfAgZjS
0J84DNtunsioxw1cDxMBWIqihatE8iA/dmx8Sb11JBJDT8KTCL5Z2yH7oke33GIq
/Jx9VAkeZxuk5DlFDxqzFvRFklGAqM6gzYok9WK/c5YOUdqpVraV6XA4NQ9pivxV
4fbFznwDIJBuUNOjojT08wrymzH7yQ==
=UNhY
-----END PGP SIGNATURE-----

--wb22qbrmgis53vw4--

