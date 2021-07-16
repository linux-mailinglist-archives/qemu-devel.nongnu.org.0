Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9F33CB9D7
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 17:29:39 +0200 (CEST)
Received: from localhost ([::1]:38484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4PmU-0007lw-6Z
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 11:29:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m4Ph5-00042x-Tb
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 11:24:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m4Ph4-0001Bp-Ap
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 11:24:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626449041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QKnWKwaIRPAChcnKPc1/GE6D+yFfcf2gurnUrN4WEak=;
 b=hYO6jtms9ha+P/Z5eliMDkSoa8OhQ1F2zfF7tx/Ibf/F1gM4bjLh9uHqfP90luaQKxFzsj
 z2Fy/mWLlJnMuNs86dCsoRJdiOoiG34Sm8yvldRsNFheWE7FesIU5NvYK/UFF/GOPtJ8ST
 ghrbHCl0krBQ1nq9SmgOMIypBzBR+7c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-78-lgIUeL3dPjWnBrJmbxGtEA-1; Fri, 16 Jul 2021 11:23:58 -0400
X-MC-Unique: lgIUeL3dPjWnBrJmbxGtEA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD006100C61B;
 Fri, 16 Jul 2021 15:23:56 +0000 (UTC)
Received: from redhat.com (ovpn-113-8.ams2.redhat.com [10.36.113.8])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D4FA55D703;
 Fri, 16 Jul 2021 15:23:51 +0000 (UTC)
Date: Fri, 16 Jul 2021 17:23:50 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC PATCH 0/6] job: replace AioContext lock with job_mutex
Message-ID: <YPGkhtRrhc144vT7@redhat.com>
References: <20210707165813.55361-1-eesposit@redhat.com>
 <YObVSuBjCEwSMvu7@stefanha-x1.localdomain>
 <6dadca95-632a-61fa-4a91-c2df25e19b52@redhat.com>
 <YOb31YOF8Q3t9RoK@stefanha-x1.localdomain>
 <629fb077-9d0a-7c33-0b2e-d055c0493005@redhat.com>
 <YO2QvuBqbw58fuo/@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YO2QvuBqbw58fuo/@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="OlQrLbLds9nObUCx"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--OlQrLbLds9nObUCx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Am 13.07.2021 um 15:10 hat Stefan Hajnoczi geschrieben:
> AIO_WAIT_WHILE() requires that AioContext is acquired according to its
> documentation, but I'm not sure that's true anymore. Thread-safe/atomic
> primitives are used by AIO_WAIT_WHILE(), so as long as the condition
> being waited for is thread-safe too it should work without the
> AioContext lock.

Polling something in a different AioContext from the main thread still
temporarily drops the lock, which crashes if it isn't locked. I'm not
sure if the documentation claims that the lock is needed in more cases,
I guess you could interpret it either way.

Kevin

--OlQrLbLds9nObUCx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE3D3rFZqa+V09dFb+fwmycsiPL9YFAmDxpIYACgkQfwmycsiP
L9YrghAAiv05EziXk4OQpFeeU+RC07P0ydx8Y7BanhoSvGxBZzWsMj+pCS5xH7SF
JHmuxMikofvxLLRksX7CsO4QUpfPc4saiVdGgpCFqhVaUL9DBoCp9Ap0KqSBsePr
Gq+z3293cfqN7vvligGR7r1K+fjAH3Da525N6NhzEYdz6al7Gjtd4rLmnzNLCKyZ
9onMmdsd3u9DS3DeKjQwh50wSaemybJ6aRgfJm9ryZonql73rbybb719oIHOAeWP
1qszUlCLgZ8qnCnBUijS9aeRYeHyVhNgX5EYWINx5sxJN1aHpuNxnWZy63se/ViY
kkJc5EUYBTOfazHUbK5SzQF/Smo1LNbTi2jBNiNZL4Efd6bip9c/8XbzddcfJi96
KoOf4OEilakgxGRrkXxIEfbC+JDnTr05biJRfWVIVnLyBGTuiU8fZVeLs3/aRVdk
9JA3/K2s2Vq5XHzELx5iRs6mFabCaRUwnTIVNro6OapcshuEiNMp7rWwMD0d042l
lWnQdEXJDuSnwFWXAMKX2mUTTFjm/5MzogiJCmeTU62XuxnUEE5VTzjfBOTgdAos
4LlH8yX0+hmx02Y2XYyX9SWzcFKJ91EEVdNKKICi6jNJzkJkQAjlBDwQ0T8lZtwH
hFTsHvi7MNjz2dt5q6iM4TVWWfs3shL6Jpuo7koDwjelxyGjaDk=
=KRwL
-----END PGP SIGNATURE-----

--OlQrLbLds9nObUCx--


