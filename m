Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDCC3BF899
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 12:56:27 +0200 (CEST)
Received: from localhost ([::1]:40060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Rhi-0007vm-DG
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 06:56:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m1RgU-00071L-G0
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 06:55:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m1RgS-0007SH-IW
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 06:55:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625741707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JCYYzB4fBkrgUnIxccBKfznSFGFeXAupjS75cHFN1tQ=;
 b=OYhphIrwNVw4aIIoQCCr96meARq0UYXy7D5MrA7df8wCHz2OFg9A+Z4Gd9uTfA5oaT7g1E
 rfSL1l78WC2HMheaFXPB1QRmWSsHC7CPp5lvaY1mC8KuXIKu7LPGG6etclMyHBnWo5dZp2
 fpWL3cJzAK07MkJVhx9f1Xq6IGu1GLE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-s94FBKdgMEOpjH0BDMo4Bw-1; Thu, 08 Jul 2021 06:55:04 -0400
X-MC-Unique: s94FBKdgMEOpjH0BDMo4Bw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03031106B7D7;
 Thu,  8 Jul 2021 10:55:03 +0000 (UTC)
Received: from localhost (ovpn-114-141.ams2.redhat.com [10.36.114.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 98C395D9FC;
 Thu,  8 Jul 2021 10:55:02 +0000 (UTC)
Date: Thu, 8 Jul 2021 11:55:01 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH 3/6] job: minor changes to simplify locking
Message-ID: <YObZhZoyfatz3etH@stefanha-x1.localdomain>
References: <20210707165813.55361-1-eesposit@redhat.com>
 <20210707165813.55361-4-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210707165813.55361-4-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xctr8xOOpnmqqYB9"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--xctr8xOOpnmqqYB9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 07, 2021 at 06:58:10PM +0200, Emanuele Giuseppe Esposito wrote:
> @@ -406,15 +410,18 @@ void *job_create(const char *job_id, const JobDrive=
r *driver, JobTxn *txn,
>              error_setg(errp, "Invalid job ID '%s'", job_id);
>              return NULL;
>          }
> -        if (job_get(job_id)) {
> -            error_setg(errp, "Job ID '%s' already in use", job_id);
> -            return NULL;
> -        }
>      } else if (!(flags & JOB_INTERNAL)) {
>          error_setg(errp, "An explicit job ID is required");
>          return NULL;
>      }
> =20
> +    job_lock();
> +    if (job_get(job_id)) {
> +        error_setg(errp, "Job ID '%s' already in use", job_id);
> +        job_unlock();
> +        return NULL;
> +    }
> +

Where is the matching job_unlock() in the success case? Please consider
lock guard macros like QEMU_LOCK_GUARD()/WITH_QEMU_LOCK_GUARD() to
prevent common errors.

--xctr8xOOpnmqqYB9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmDm2YUACgkQnKSrs4Gr
c8j+KQgApLaFCZdTJ2BZaScevjA/gSxe41nF5oaKGU6LCgGQzHK3h6BdefRrJcXi
/NJ0FyihupZGlRgkr73cFLOUsjX54MmAkATm3cO3NfwjUP52XfbD/Z64Lt5SWry1
gXO+/Zevh+gMSzr1gAXZ3S1myVMxeTLrvNE410IZBz9IriOYJTa8t86TPmJ/vMIw
C3fYdXGS6qHGsQyUGv3CwmV1SfRCGaSA1KkUS4sJAA8z9GrGHa+UGRE9VZnIc5YV
6e+s3VlW9Tp8NjWjwmpuUQIQNuB/G5lLwSpPOUVjpkDnA0fyLau9B7We4N+XDKWE
V+9jhLt8NTOU1EDaU6odNFA/ev7/2A==
=zLIR
-----END PGP SIGNATURE-----

--xctr8xOOpnmqqYB9--


