Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D78204DAEB7
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 12:13:05 +0100 (CET)
Received: from localhost ([::1]:33152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nURaS-00062P-P6
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 07:13:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nURYS-0004i1-LS
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 07:11:00 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:45594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nURYP-00049k-Pp
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 07:10:59 -0400
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-7AiCP_heMY-KFO2iYYBmlQ-1; Wed, 16 Mar 2022 07:10:45 -0400
X-MC-Unique: 7AiCP_heMY-KFO2iYYBmlQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 18AEB100F88A;
 Wed, 16 Mar 2022 11:10:45 +0000 (UTC)
Received: from bahia (unknown [10.39.192.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 860A040885A1;
 Wed, 16 Mar 2022 11:10:44 +0000 (UTC)
Date: Wed, 16 Mar 2022 12:10:43 +0100
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH] 9pfs: fix inode sequencing in 'synth' driver
Message-ID: <20220316121043.1de4f0a1@bahia>
In-Reply-To: <E1nTpyU-0000yR-9o@lizzy.crudebyte.com>
References: <E1nTpyU-0000yR-9o@lizzy.crudebyte.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Mar 2022 19:58:11 +0100
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> The 'synth' driver's root node and the 'synth' driver's first
> subdirectory node falsely share the same inode number (zero), which
> makes it impossible for 9p clients (i.e. 9p test cases) to distinguish
> root node and first subdirectory from each other by comparing their QIDs
> (which are derived by 9p server from driver's inode numbers).
>=20
> Fix this issue by using prefix-increment instead of postfix-increment
> operator while generating new inode numbers for subdirectories and files.
>=20
> Link: https://lore.kernel.org/qemu-devel/3859307.hTDP4D0zbi@silver/
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---

Good catch !

Reviewed-by: Greg Kurz <groug@kaod.org>


>  hw/9pfs/9p-synth.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c
> index b3080e415b..f3c73d3b0b 100644
> --- a/hw/9pfs/9p-synth.c
> +++ b/hw/9pfs/9p-synth.c
> @@ -92,7 +92,7 @@ int qemu_v9fs_synth_mkdir(V9fsSynthNode *parent, int mo=
de,
>          }
>      }
>      /* Add the name */
> -    node =3D v9fs_add_dir_node(parent, mode, name, NULL, synth_node_coun=
t++);
> +    node =3D v9fs_add_dir_node(parent, mode, name, NULL, ++synth_node_co=
unt);
>      v9fs_add_dir_node(node, parent->attr->mode, "..",
>                        parent->attr, parent->attr->inode);
>      v9fs_add_dir_node(node, node->attr->mode, ".",
> @@ -130,7 +130,7 @@ int qemu_v9fs_synth_add_file(V9fsSynthNode *parent, i=
nt mode,
>      mode =3D ((mode & 0777) | S_IFREG);
>      node =3D g_malloc0(sizeof(V9fsSynthNode));
>      node->attr         =3D &node->actual_attr;
> -    node->attr->inode  =3D synth_node_count++;
> +    node->attr->inode  =3D ++synth_node_count;
>      node->attr->nlink  =3D 1;
>      node->attr->read   =3D read;
>      node->attr->write  =3D write;


