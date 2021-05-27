Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA76392E2A
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 14:41:15 +0200 (CEST)
Received: from localhost ([::1]:57900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmFK5-0000Cj-Ja
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 08:41:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lmEo7-0007i4-7j
 for qemu-devel@nongnu.org; Thu, 27 May 2021 08:08:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lmEo1-0003ww-SD
 for qemu-devel@nongnu.org; Thu, 27 May 2021 08:08:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622117278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nOzy2Bf9Q3t5BfBmY647L30G6LVT3RQeNVgcmVXi7EE=;
 b=by5KTuNF5Z2rv1Vk/WzfsgowHewo14bAztkXhKGWO25aLfqDAKaFLniCuguhyEQa8l69ZW
 Hs2Vmd3JI4oosNtXz3i5FaV8z+xMwBl6wHBFRK2Vktev73G3vVtNKyZZk+/39oVTo7nG9G
 al/C1i5NN8SFCafpLKBH4OKzJjYVWWs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-2hWP2MaFP-aakIG8AKf9oQ-1; Thu, 27 May 2021 08:07:56 -0400
X-MC-Unique: 2hWP2MaFP-aakIG8AKf9oQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8FB14180FD62;
 Thu, 27 May 2021 12:07:55 +0000 (UTC)
Received: from localhost (ovpn-114-147.ams2.redhat.com [10.36.114.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3766460CDE;
 Thu, 27 May 2021 12:07:55 +0000 (UTC)
Date: Thu, 27 May 2021 10:07:23 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v2 4/7] block-copy: add a CoMutex to the BlockCopyTask list
Message-ID: <YK9hS9q9wAQ1X4zM@stefanha-x1.localdomain>
References: <20210518100757.31243-1-eesposit@redhat.com>
 <20210518100757.31243-5-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210518100757.31243-5-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kbjhdklNY6kdANI7"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIMWL_WL_HIGH=-0.374, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--kbjhdklNY6kdANI7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 18, 2021 at 12:07:54PM +0200, Emanuele Giuseppe Esposito wrote:
> -static BlockCopyTask *find_conflicting_task(BlockCopyState *s,
> -                                            int64_t offset, int64_t bytes)
> +/* Called with lock held */

s/lock/tasks_lock/

--kbjhdklNY6kdANI7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCvYUsACgkQnKSrs4Gr
c8iwaQgApOap/AnaH4blo1rorEnm0mr9eMYla9h31khx0MJnwHUwJGkT6cqQMhIj
CtktdDPCJsWpDTLjniiIEd77wfIBjISYVG/vz8JL2bEX6lDhEh96DDwIsn6j+Hqh
FGrNt8oXjFVgQ03XyyhFDcJMNirMPzZhEnsbkUufIthA2kBiZyTSTrnfiGqP39R3
6QOP0cpJN4WNQtVQuf+7/vltVwI3MwLW23KSzE1ohKGE63YdTpnSX41ykT4SfHCr
kAxedgpOguzWP/4aV8L3e4auQwjHJlg5WFMkjPQxTNr9BYPP5ZF2wIDB9JXMaIaz
7NerJTeKB7Mx5bj78BHbBWWf05pHCw==
=uYy8
-----END PGP SIGNATURE-----

--kbjhdklNY6kdANI7--


