Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2DA39850A
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 11:14:33 +0200 (CEST)
Received: from localhost ([::1]:54752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loMxM-0004GQ-3d
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 05:14:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1loMw1-0002Xn-SU
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 05:13:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1loMvy-0007kU-Td
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 05:13:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622625185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FfAr0mNPETvPaNgDi1suv2govfw/oXCUGt3hn0GHcaE=;
 b=EsrplVpXhFzKbZiOvxMpGZZ4jBzpTGzyEia1U4w2JnSOIPg8FBw1HXIMKi0Rtf0a2YpRZF
 VwHUzXigOKj0z/ftoieh9KDrf+cidrSSv0twJIM2J/Zr/2FMaGxtk14zdHG6x8+fIo8O0R
 /6yjG/VSxe4APKzOWTS2qJ2kKGXruQg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-54-ppoAPxtmN-CTqROW6LgKrw-1; Wed, 02 Jun 2021 05:13:02 -0400
X-MC-Unique: ppoAPxtmN-CTqROW6LgKrw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3848F801817;
 Wed,  2 Jun 2021 09:13:01 +0000 (UTC)
Received: from localhost (ovpn-114-228.ams2.redhat.com [10.36.114.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B7689687FD;
 Wed,  2 Jun 2021 09:13:00 +0000 (UTC)
Date: Wed, 2 Jun 2021 10:12:59 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 2/2] block-copy: refactor copy_range handling
Message-ID: <YLdLm/j5ctTcOOEy@stefanha-x1.localdomain>
References: <20210528141628.44287-1-vsementsov@virtuozzo.com>
 <20210528141628.44287-3-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210528141628.44287-3-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/5cdd8+ka1Eq2wxz"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: kwolf@redhat.com, eesposit@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, mreitz@redhat.com, pbonzini@redhat.com,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--/5cdd8+ka1Eq2wxz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 28, 2021 at 05:16:28PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> @@ -183,6 +184,7 @@ static BlockCopyTask *block_copy_task_create(BlockCopyState *s,
>          .call_state = call_state,
>          .offset = offset,
>          .bytes = bytes,
> +        .copy_range = s->use_copy_range,
>      };
>      qemu_co_queue_init(&task->wait_queue);
>      QLIST_INSERT_HEAD(&s->tasks, task, list);
> @@ -342,11 +344,17 @@ static coroutine_fn int block_copy_task_run(AioTaskPool *pool,
>   *
>   * No sync here: nor bitmap neighter intersecting requests handling, only copy.
>   *
> + * @copy_range is in-out argument: if *copy_range is false, copy_range is not

s/is in-out argument/is an in-out argument/

> + * done. If *copy_range is true, copy_range attempt is done. If copy_range

s/copy_range attempt is done/copy_range is attempted/

> + * attempt failed, the function fallback to usual read+write and *copy_range is

If the copy_range attempt fails, the function falls back to the usual
read+write and ...

--/5cdd8+ka1Eq2wxz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmC3S5sACgkQnKSrs4Gr
c8i7wAf/QUfhh4lNGZD6X6aq3lNCET5pWxBocgGcYQaMN6Q7qwuFeTGZnsPcFFgt
KmPD3zBk2sBmrAeb9bAHyDHRKdffqfWnVJ9nm7/E64cb9tnqQKMneMQRIFDQszI+
ebQvg2PbcWTEdyJpFggUeWFjQOphKLEg9SM+cL/J/42bUcFKpU1bK7saSWdvwlUX
zWUldrVZaryzVsNG6UVInEcSH0J9FwKTsAgEB2nVVw6LlfybuekmMGxN9K2glHVK
BW8Ni5MXjEmbtQuVCrneYUUiCBe18m78t31Bznw8zc91/UuwEIkMJiuUCrx+/CQk
oo9ZzYYArNjyDjzK/R5Ht7ZQs2CDkg==
=yynp
-----END PGP SIGNATURE-----

--/5cdd8+ka1Eq2wxz--


