Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 121C1392E3B
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 14:49:14 +0200 (CEST)
Received: from localhost ([::1]:35828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmFRp-0004bQ-2m
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 08:49:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lmEo7-0007hG-7O
 for qemu-devel@nongnu.org; Thu, 27 May 2021 08:08:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lmEnz-0003wd-NA
 for qemu-devel@nongnu.org; Thu, 27 May 2021 08:08:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622117277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tmO5nOrq3QwFZyWlRn9Z9ZVBLJ/OikFapTk2Nk6a6O8=;
 b=TNyuuTffWVknedYE8fGeWFIKHwG/O4nqVs+kqucwL3pw44QaxpaZKukVBeQuaC/wg0G6u+
 lp+jhPZcXZhZAEEnm4B1GExJ5TvMGqvo+8HAJE8mjx7WwPeLYZa3WHoeqI4wE0l7FuwJfW
 vve1zKzw6kPeOORTQWtj3EdmAI2SIkY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-0r2u3rhnMdWTPo-2E4XlKA-1; Thu, 27 May 2021 08:07:55 -0400
X-MC-Unique: 0r2u3rhnMdWTPo-2E4XlKA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E7EB107ACE3;
 Thu, 27 May 2021 12:07:54 +0000 (UTC)
Received: from localhost (ovpn-114-147.ams2.redhat.com [10.36.114.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A75505C5B5;
 Thu, 27 May 2021 12:07:52 +0000 (UTC)
Date: Thu, 27 May 2021 09:20:04 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v2 1/7] block-copy: streamline choice of copy_range vs.
 read/write
Message-ID: <YK9WNJUQdjjCiv40@stefanha-x1.localdomain>
References: <20210518100757.31243-1-eesposit@redhat.com>
 <20210518100757.31243-2-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210518100757.31243-2-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="uxbeBk7bgtfQeYA+"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIMWL_WL_HIGH=-0.374, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

--uxbeBk7bgtfQeYA+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 18, 2021 at 12:07:51PM +0200, Emanuele Giuseppe Esposito wrote:
>      } else {
>          /*
>           * We enable copy-range, but keep small copy_size, until first
>           * successful copy_range (look at block_copy_do_copy).
>           */

Is this comment still correct? It appears that this branch of the if
statement does not always enable copy-range (the !use_copy_range case).

> -        s->use_copy_range = use_copy_range;
> -        s->copy_size = MAX(s->cluster_size, BLOCK_COPY_MAX_BUFFER);
> +        s->method = use_copy_range ? COPY_RANGE_SMALL : COPY_READ_WRITE;

--uxbeBk7bgtfQeYA+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCvVjQACgkQnKSrs4Gr
c8hpcwf8DiJ2HQdWCLVZe53nfKEo/7Pes2F5QNCyp74qGXM3QESuh2KpRfkCk1OZ
Ghe4HAaYA5EF57oSy+EA3kED4D56plTOTB3vVPNB/b2dH3XIV3c2FA+tnth5ZDI/
yy5KcF3iVHXUkRVmX1KYgzXqoxm42ux+zH2qATF9UZ1XYZPo3is8EiLi0f5zOVi2
q6F00PjSVtqVztJeQN03aAdVRfBpPdhdrwT/EYIQ67cuXCE3KiOfPDz73a8XqxLz
QwrUWF91yyvmPxQ6XxKfz0u/aJWw4B3MB3il6uZ4LvzU9teIS09J7YsMYlmRR1k/
VyIJR8osL/XrzAQk+vvS4kpTtZxV4w==
=+tF4
-----END PGP SIGNATURE-----

--uxbeBk7bgtfQeYA+--


