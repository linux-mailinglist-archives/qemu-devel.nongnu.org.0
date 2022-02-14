Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1524B4B55EC
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 17:19:10 +0100 (CET)
Received: from localhost ([::1]:41212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJe4B-0006o2-6d
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 11:19:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nJdVf-0002PX-4h
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 10:43:28 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:26708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nJdVZ-0006s1-CK
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 10:43:26 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-182-eVP4PSaqP5CvZgTlQHMe3Q-1; Mon, 14 Feb 2022 10:43:19 -0500
X-MC-Unique: eVP4PSaqP5CvZgTlQHMe3Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B62C800482;
 Mon, 14 Feb 2022 15:43:18 +0000 (UTC)
Received: from bahia (unknown [10.39.192.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C6605752C5;
 Mon, 14 Feb 2022 15:43:15 +0000 (UTC)
Date: Mon, 14 Feb 2022 16:43:14 +0100
From: Greg Kurz <groug@kaod.org>
To: <qemu-devel@nongnu.org>
Subject: Re: [PATCH v5 2/3] virtiofsd: Track submounts
Message-ID: <20220214164314.0898c036@bahia>
In-Reply-To: <20220214135820.43897-3-groug@kaod.org>
References: <20220214135820.43897-1-groug@kaod.org>
 <20220214135820.43897-3-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: virtio-fs@redhat.com,
 Sebastian Hasler <sebastian.hasler@stuvus.uni-stuttgart.de>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Feb 2022 14:58:19 +0100
Greg Kurz <groug@kaod.org> wrote:

> If
> Support for FUSE_SYNCFS requires the server to track submounts
>=20
> that may exist under the shared directory. lo_do_lookup() already knows
> how to detect them : it is a directory with a different device ID or
> mount ID than its parent. Use the same logic and record the information
> under the lo_inode structure.
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---

Oops I obviously did something wrong with the changelog. It should read:

---
If the server doesn't announce submounts to the client, it needs to
track them internally to properly support FUSE_SYNCFS. lo_do_lookup()
already knows how to detect them : it is a directory with a different
device ID or mount ID than its parent. Use the same logic and record
the information under the lo_inode structure.
---

I can send an updated version if needed.

>  tools/virtiofsd/passthrough_ll.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>=20
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrou=
gh_ll.c
> index 2bf5d40df531..e94c4e6f8635 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -118,6 +118,7 @@ struct lo_inode {
>      GHashTable *posix_locks; /* protected by lo_inode->plock_mutex */
> =20
>      mode_t filetype;
> +    bool is_submount;
>  };
> =20
>  struct lo_cred {
> @@ -1017,6 +1018,7 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t =
parent, const char *name,
>      struct lo_data *lo =3D lo_data(req);
>      struct lo_inode *inode =3D NULL;
>      struct lo_inode *dir =3D lo_inode(req, parent);
> +    bool is_submount;
> =20
>      if (inodep) {
>          *inodep =3D NULL; /* in case there is an error */
> @@ -1051,8 +1053,10 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t=
 parent, const char *name,
>          goto out_err;
>      }
> =20
> -    if (S_ISDIR(e->attr.st_mode) && lo->announce_submounts &&
> -        (e->attr.st_dev !=3D dir->key.dev || mnt_id !=3D dir->key.mnt_id=
)) {
> +    is_submount =3D S_ISDIR(e->attr.st_mode) &&
> +        (e->attr.st_dev !=3D dir->key.dev || mnt_id !=3D dir->key.mnt_id=
);
> +
> +    if (is_submount && lo->announce_submounts) {
>          e->attr_flags |=3D FUSE_ATTR_SUBMOUNT;
>      }
> =20
> @@ -1079,6 +1083,7 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t =
parent, const char *name,
>          inode->key.ino =3D e->attr.st_ino;
>          inode->key.dev =3D e->attr.st_dev;
>          inode->key.mnt_id =3D mnt_id;
> +        inode->is_submount =3D is_submount;
>          if (lo->posix_lock) {
>              pthread_mutex_init(&inode->plock_mutex, NULL);
>              inode->posix_locks =3D g_hash_table_new_full(
> @@ -1100,8 +1105,9 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t =
parent, const char *name,
> =20
>      lo_inode_put(lo, &dir);
> =20
> -    fuse_log(FUSE_LOG_DEBUG, "  %lli/%s -> %lli\n", (unsigned long long)=
parent,
> -             name, (unsigned long long)e->ino);
> +    fuse_log(FUSE_LOG_DEBUG, "  %lli/%s -> %lli%s\n",
> +             (unsigned long long) parent, name, (unsigned long long) e->=
ino,
> +             is_submount ? " (submount)" : "");
> =20
>      return 0;
> =20


