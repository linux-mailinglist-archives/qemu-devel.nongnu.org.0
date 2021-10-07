Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA309424FDA
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 11:14:53 +0200 (CEST)
Received: from localhost ([::1]:54162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYPUK-0003ic-7a
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 05:14:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYPSw-0002sw-91
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 05:13:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYPSt-0006wc-2i
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 05:13:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633598001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wi8EfVmvY5PTKcsbAvbh89yPs4nCwsyDyahbgJLt9aE=;
 b=ADY0SGqOt2MDvH5jNC9gLgo3JmRwJ2fC+bSRzAsgIBJ8e513KHAex+8yRmUiZL2dE5THAv
 9OKSNJAEHOVAishbXU9t0xjQ5d8XszDcpe8GPQqBL8WtORqugPsvU+GAbEfsw9pZ7R14J+
 s4po5SCujaNIX0qaSCP2zGo8BKEparc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-MYeVqa_7MjuJKT2tdnRhkg-1; Thu, 07 Oct 2021 05:13:18 -0400
X-MC-Unique: MYeVqa_7MjuJKT2tdnRhkg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C68D1084683;
 Thu,  7 Oct 2021 09:13:17 +0000 (UTC)
Received: from localhost (unknown [10.39.194.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3FE0E5C1CF;
 Thu,  7 Oct 2021 09:13:07 +0000 (UTC)
Date: Thu, 7 Oct 2021 10:13:06 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH v2 02/25] include/sysemu/block-backend: split header
 into I/O and global state (GS) API
Message-ID: <YV66IipZXdum8Sx8@stefanha-x1.localdomain>
References: <20211005143215.29500-1-eesposit@redhat.com>
 <20211005143215.29500-3-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211005143215.29500-3-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ZzIYD6nIrRbegctZ"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--ZzIYD6nIrRbegctZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 05, 2021 at 10:31:52AM -0400, Emanuele Giuseppe Esposito wrote:
> +/*
> + * Global state (GS) API. These functions run under the BQL lock.
> + *
> + * If a function modifies the graph, it also uses drain and/or
> + * aio_context_acquire/release to be sure it has unique access.
> + * aio_context locking is needed together with BQL because of
> + * the thread-safe I/O API that concurrently runs and accesses
> + * the graph without the BQL.
> + *
> + * It is important to note that not all of these functions are
> + * necessarily limited to running under the BQL, but they would
> + * require additional auditing and may small thread-safety changes

s/may/many/

> diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
> new file mode 100644
> index 0000000000..a77b2080ce
> --- /dev/null
> +++ b/include/sysemu/block-backend-io.h
> @@ -0,0 +1,130 @@
> +/*
> + * QEMU Block backends
> + *
> + * Copyright (C) 2014-2016 Red Hat, Inc.
> + *
> + * Authors:
> + *  Markus Armbruster <armbru@redhat.com>,
> + *
> + * This work is licensed under the terms of the GNU LGPL, version 2.1
> + * or later.  See the COPYING.LIB file in the top-level directory.
> + */
> +
> +#ifndef BLOCK_BACKEND_IO_H
> +#define BLOCK_BACKEND_IO_H
> +
> +#include "block-backend-common.h"
> +
> +/*
> + * I/O API functions. These functions are thread-safe, and therefore
> + * can run in any thread as long as they have called
> + * aio_context_acquire/release().

The meaning of "they" is not 100% clear. It could be the thread or the
I/O API functions. I suggest making it explicit:

  s/they have/the thread has/

Otherwise:
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--ZzIYD6nIrRbegctZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFeuiIACgkQnKSrs4Gr
c8i9RAf/aaDAHobr6Yh2Q0VlQzdxzdZ50+47RzJKn4AlXiO/sKGOun+ZApjB29my
+sbC/s6QYqOf5Doj5b0QywaAr+V4xnVJeHUiwJ4tz4aRGFzHanrvII/Gsvek7LtU
+COMcCntFfAHEaDWosWSozoD+1nxpF2REvHN6UQOfgLohgG56lMl+mayXAmHd/4M
+DIuffchnJcCpm/Ed3qouBQ/uLGKhmX/bqfKuKJio/cO2TyEpeMfq/7WkramO3Dj
8bXfFEfa0ekK/FJHH9ksDdevK3xvDuOXo74UB7pczNxqeOKUfemtRVgvCVnUZOVi
ZPTLlsP9zPV8gT8QKiCqlmRHGi8seA==
=006B
-----END PGP SIGNATURE-----

--ZzIYD6nIrRbegctZ--


