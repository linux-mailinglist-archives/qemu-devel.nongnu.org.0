Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A54553C7473
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 18:26:10 +0200 (CEST)
Received: from localhost ([::1]:34734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3LEX-00012I-MN
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 12:26:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m3L7u-0003g7-Ip
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:19:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m3L7r-0006sw-LF
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:19:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626193155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ALEnfj4s62YiLhb4PH6vAUPHNn69yqcAhnzmcAIB5hI=;
 b=S0osXQ2FcCRvCfJ3D1WXYivTYu+UZiSwZZiCsQd4lEg9HAbXk/1n8LEcuTxmrJ/M1T9ns/
 WFVtD447tUVy6/8WvtgDrfX4r+eEuGZS6M8iOw1NdEmXCFJPcNUmOsf1iRPTdm62bwDDGt
 y6E1+B6nigwU2YMyiQcZOibzixLtZ5M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-eKtbZfxoM_i_gZY6WOWK4g-1; Tue, 13 Jul 2021 12:19:13 -0400
X-MC-Unique: eKtbZfxoM_i_gZY6WOWK4g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 468EF801AEB;
 Tue, 13 Jul 2021 16:19:12 +0000 (UTC)
Received: from localhost (ovpn-112-172.ams2.redhat.com [10.36.112.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CCF455D6AB;
 Tue, 13 Jul 2021 16:19:11 +0000 (UTC)
Date: Tue, 13 Jul 2021 15:58:04 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH 3/3] linux-aio: limit the batch size using
 `aio-max-batch` parameter
Message-ID: <YO2p/Ns7SsV6LE1x@stefanha-x1.localdomain>
References: <20210707150019.201442-1-sgarzare@redhat.com>
 <20210707150019.201442-4-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210707150019.201442-4-sgarzare@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="u9obwYTG/0YXmETZ"
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--u9obwYTG/0YXmETZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 07, 2021 at 05:00:19PM +0200, Stefano Garzarella wrote:
> @@ -371,7 +375,7 @@ static int laio_do_submit(int fd, struct qemu_laiocb *laiocb, off_t offset,
>      s->io_q.in_queue++;
>      if (!s->io_q.blocked &&
>          (!s->io_q.plugged ||
> -         s->io_q.in_flight + s->io_q.in_queue >= MAX_EVENTS)) {
> +         s->io_q.in_queue >= max_batch)) {

Is it safe to drop the MAX_EVENTS case?

Perhaps the following can be used:

  int64_t max_batch = s->aio_context->aio_max_batch ?: DEFAULT_MAX_BATCH;
  max_batch = MIN_NON_ZERO(MAX_EVENTS - s->io_q.in_flight + s->io_q.in_queue, max_batch);

Here we'll only need to check against max_batch but it takes into
account MAX_EVENT and in_flight.

Stefan

--u9obwYTG/0YXmETZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmDtqfwACgkQnKSrs4Gr
c8iGAQgAoYW2gIIuBdkaoqZ8FF7ibiAsfUHIfCZ924C7jaNChmadesnrvBunK1QB
vaNAUKdu197lriv3Oq4sHe6J0JDDgKbZCdS/Wy6cUSK4W9CaRjoHWRsEeumQ/sbR
8gT7ntrg1Se8Cri8kASX+Sl/Rl3wSDuj+Qrpzmn10jclkfBif80YiToO0X6gf/pW
F4fzTPSJ8MBjpZWl4pMW734NDhOeM68vz+WQNt8N4Z+ExfW/oOyLdIJYPfXXCrjO
/CfxANIbdvo0wfhEmmD8doRN8G+VkvQmO/Cq23/LqpjFwK5wZ2stJtvRJDBM68uB
vxBGhfDPNlExjGGk+7TI2V/H9ww9Kg==
=jpuX
-----END PGP SIGNATURE-----

--u9obwYTG/0YXmETZ--


