Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B211490EC0
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 18:11:50 +0100 (CET)
Received: from localhost ([::1]:41358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9VXo-0005IY-TF
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 12:11:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1n9VVH-0004WQ-3Q
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 12:09:11 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:20749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1n9VVF-0007Ik-Ga
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 12:09:10 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-209-YDh462i1Mf6pFlTACsgr7w-1; Mon, 17 Jan 2022 12:08:59 -0500
X-MC-Unique: YDh462i1Mf6pFlTACsgr7w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 216AC18C8C01;
 Mon, 17 Jan 2022 17:08:58 +0000 (UTC)
Received: from bahia (unknown [10.39.193.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 30B91105C88B;
 Mon, 17 Jan 2022 17:08:56 +0000 (UTC)
Date: Mon, 17 Jan 2022 18:08:55 +0100
From: Greg Kurz <groug@kaod.org>
To: Sebastian Hasler <sebastian.hasler@stuvus.uni-stuttgart.de>
Subject: Re: [Virtio-fs] [PATCH v2] virtiofsd: Do not support blocking flock
Message-ID: <20220117180855.6353fc05@bahia>
In-Reply-To: <20220113153249.710216-1-sebastian.hasler@stuvus.uni-stuttgart.de>
References: <20220113153249.710216-1-sebastian.hasler@stuvus.uni-stuttgart.de>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 13 Jan 2022 16:32:49 +0100
Sebastian Hasler <sebastian.hasler@stuvus.uni-stuttgart.de> wrote:

> With the current implementation, blocking flock can lead to
> deadlock. Thus, it's better to return EOPNOTSUPP if a user attempts
> to perform a blocking flock request.
>=20
> Signed-off-by: Sebastian Hasler <sebastian.hasler@stuvus.uni-stuttgart.de=
>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  tools/virtiofsd/passthrough_ll.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrou=
gh_ll.c
> index 64b5b4fbb1..faa62278c5 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -2442,6 +2442,15 @@ static void lo_flock(fuse_req_t req, fuse_ino_t in=
o, struct fuse_file_info *fi,
>      int res;
>      (void)ino;
> =20
> +    if (!(op & LOCK_NB)) {
> +        /*
> +         * Blocking flock can deadlock as there is only one thread
> +         * serving the queue.
> +         */
> +        fuse_reply_err(req, EOPNOTSUPP);
> +        return;
> +    }
> +
>      res =3D flock(lo_fi_fd(req, fi), op);
> =20
>      fuse_reply_err(req, res =3D=3D -1 ? errno : 0);


