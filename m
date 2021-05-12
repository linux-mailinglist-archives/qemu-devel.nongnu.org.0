Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC8D37C3B4
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 17:21:55 +0200 (CEST)
Received: from localhost ([::1]:36574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgqgM-0006rn-4k
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 11:21:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lgqeJ-00056x-NZ
 for qemu-devel@nongnu.org; Wed, 12 May 2021 11:19:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lgqeG-0001Qo-Dn
 for qemu-devel@nongnu.org; Wed, 12 May 2021 11:19:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620832783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QojuVRlnklgAJ/bD51ZvZJ2U2WK07kDwQbJcvHLCNEA=;
 b=R47q8XyzupdTKeeXAS81X+s0v9qGwZF5Hd9+0bLLBE7yxF7LvUDTpqgbbbbMLDZybNjfCJ
 SyNSFlYRwSGAOvCmj2Mfq7l71ifIa0x3oNPLLe1ZzsvXBCVpbf2KTNAmv+vB9IbyWW4Npk
 r1dquoBfq0a2L+stDwqChFyJp4Xw+nQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-krAjhWI9O2uXaX9c9mkgvQ-1; Wed, 12 May 2021 11:19:41 -0400
X-MC-Unique: krAjhWI9O2uXaX9c9mkgvQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4EDB18189D4;
 Wed, 12 May 2021 15:19:40 +0000 (UTC)
Received: from localhost (ovpn-115-51.ams2.redhat.com [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E6AEA5C8AA;
 Wed, 12 May 2021 15:19:39 +0000 (UTC)
Date: Wed, 12 May 2021 16:19:38 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH 6/6] aiopool: protect with a mutex
Message-ID: <YJvyCmFMlsbyni0L@stefanha-x1.localdomain>
References: <20210510085941.22769-1-eesposit@redhat.com>
 <20210510085941.22769-7-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210510085941.22769-7-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tNyTxOVvBu4nqu8i"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--tNyTxOVvBu4nqu8i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 10, 2021 at 10:59:41AM +0200, Emanuele Giuseppe Esposito wrote:
> Divide the fields in AioTaskPool in IN and Status, and
> introduce a CoQueue instead of .wait to take care of suspending
> and resuming the calling coroutine, and a lock to protect the
> busy_tasks counter accesses and the AioTask .ret field.

The thread-safety concerns with the aio_task.h API are unclear to me.
The API is designed to have a "main" coroutine that adds task
functions to the pool and waits for them to complete. Task functions
execute in coroutines (up to the pool's max_busy_tasks limit).

It seems like the API was designed to be called only from its main
coroutine so why make everything thread-safe? Is there a caller that
shares an AioTaskPool between threads? Or will the task functions switch
threads somehow?

What exactly is the new thread-safety model? Please document it.
Unfortunately aio_task.h doesn't have doc comments already but it will
be necessary if there are thread-safety concerns.

--tNyTxOVvBu4nqu8i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCb8goACgkQnKSrs4Gr
c8isgAf/WYpTvtflct2mgV8rcS65mmGhZiAPH40QWCxbWsM0GAyEhtIByZP9sue3
AMbNmsMcHbVMdKR3DHerYItUMw28AdIU2fqwv954vIIhEHBTL9kBVcZhfSHZDqJd
jwjjAO7hh8N8yLHDOUsosU+ENhZsBeUB7jvytmd6Ka1SzrVRn4jsW5I+QXfiJD+0
BA5qO4f77Mhp6Miw9VIwZFhVS6cehKWxsWJA+pjvUmJCSglxM8PM7ejlBge3i2Of
vl9eD7TjG+iCNAyoAG1V8CZ10jmtF0gQJTs4qGvwOvOwSQKOgHvgGISArfJ+ddIr
Pu5ulbUM3vBTf4Ow4eeGY3P19HmJ0Q==
=HAZ2
-----END PGP SIGNATURE-----

--tNyTxOVvBu4nqu8i--


