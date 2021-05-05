Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B40B537384D
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 12:03:26 +0200 (CEST)
Received: from localhost ([::1]:39158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leENJ-0003WR-G6
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 06:03:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1leELA-0002ej-In
 for qemu-devel@nongnu.org; Wed, 05 May 2021 06:01:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1leEL8-0002om-S4
 for qemu-devel@nongnu.org; Wed, 05 May 2021 06:01:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620208870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9a12ynog7GxjX7oCCiQS2/T1gOSAB7Spqi1Y8TT3fpQ=;
 b=FRN15olqWnv+FabqpG3bK47l7prYyLr1V8KXqeDyxhdfnfIFPX4BliSoT46EBFWVzZoEkG
 fL9wOmKS9XRJs/LJ9WP1C4wWs5pTSMzFOYrJpiNiXttl/79iHsoYnRg1vir1GDSJUME4aD
 XFmcrZgLl7p3S9DbgZNTWPZYECM1sj8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-JmxmI3IYMjOIiQ-vKoM-GQ-1; Wed, 05 May 2021 06:01:07 -0400
X-MC-Unique: JmxmI3IYMjOIiQ-vKoM-GQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 428EB8049CA;
 Wed,  5 May 2021 10:01:06 +0000 (UTC)
Received: from localhost (ovpn-115-109.ams2.redhat.com [10.36.115.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE77E687D2;
 Wed,  5 May 2021 10:01:04 +0000 (UTC)
Date: Wed, 5 May 2021 11:01:03 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v2 8/8] block: do not take AioContext around reopen
Message-ID: <YJJs34rcW9MbeWYj@stefanha-x1.localdomain>
References: <20210419085541.22310-1-eesposit@redhat.com>
 <20210419085541.22310-9-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210419085541.22310-9-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="u6vvhZtFzvwf6ntO"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--u6vvhZtFzvwf6ntO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 19, 2021 at 10:55:41AM +0200, Emanuele Giuseppe Esposito wrote:
>  block/block-backend.c |  4 ----
>  block/mirror.c        |  9 ---------
>  blockdev.c            | 19 ++++++-------------
>  3 files changed, 6 insertions(+), 26 deletions(-)

There are still many aio_context_acquire/release() calls in QEMU. I'm
not sure why these are safe to remove. The patch series needs to
communicate and document the final state of thread safety and AioContext
lock usage so that it's clear for developers going forward.

Stefan

--u6vvhZtFzvwf6ntO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCSbN8ACgkQnKSrs4Gr
c8jaLAgAiwwnSVg+ZbL9OfzPQCVKs9QsgefHG4tzfY/nx3bTs2MkTmXqtG7D/xlP
RKOKUqe6sqfFJTlvO9I91aWw9BxPdDwy7a3LI5X7OJEfvY8NlGuI/Uz7UhVzhONh
C6V617/q5PWir87hfswSLQX8d74Qj/PJ9zWbehN7xx/ztLB+J1BDXzBOW4QDmWqn
rtUpekqAJK59jsFqdJEMW8/EyfGqOHskUNQLxu8uYdogY6/xnW5iA3lZKHm5vHHY
gwsCwxihwm+u9VHzhlsNb8ZmVrbZN/j9uNuslL8S4NYfBcAeOwmSGuhN4Fa5/pW5
fayTq0QOKAKhMTG7MWAftB5jI1J+EA==
=vrRa
-----END PGP SIGNATURE-----

--u6vvhZtFzvwf6ntO--


