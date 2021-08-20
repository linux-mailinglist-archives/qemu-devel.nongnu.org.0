Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 667173F2A3C
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 12:42:33 +0200 (CEST)
Received: from localhost ([::1]:59818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH1yq-0004Ip-GJ
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 06:42:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mH1x2-0002sQ-Hp
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 06:40:40 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:50535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mH1x0-00069S-PE
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 06:40:39 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-_M4k-mW8MuuESAIYMCNKcw-1; Fri, 20 Aug 2021 06:40:34 -0400
X-MC-Unique: _M4k-mW8MuuESAIYMCNKcw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A602801A92;
 Fri, 20 Aug 2021 10:40:33 +0000 (UTC)
Received: from bahia.lan (unknown [10.39.192.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EDB651A26A;
 Fri, 20 Aug 2021 10:40:32 +0000 (UTC)
Date: Fri, 20 Aug 2021 12:40:31 +0200
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH 2/2] hw/9pfs: use g_autofree in v9fs_walk() where possible
Message-ID: <20210820124031.6ea5e042@bahia.lan>
In-Reply-To: <b51670d2a39399535a035f6bc77c3cbeed85edae.1629208359.git.qemu_oss@crudebyte.com>
References: <cover.1629208359.git.qemu_oss@crudebyte.com>
 <b51670d2a39399535a035f6bc77c3cbeed85edae.1629208359.git.qemu_oss@crudebyte.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 17 Aug 2021 15:46:50 +0200
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> Suggested-by: Greg Kurz <groug@kaod.org>
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
>  hw/9pfs/9p.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> index 4d642ab12a..c857b31321 100644
> --- a/hw/9pfs/9p.c
> +++ b/hw/9pfs/9p.c
> @@ -1703,11 +1703,12 @@ static bool same_stat_id(const struct stat *a, co=
nst struct stat *b)
>  static void coroutine_fn v9fs_walk(void *opaque)
>  {
>      int name_idx;
> -    V9fsQID *qids =3D NULL;
> +    g_autofree V9fsQID *qids =3D NULL;
>      int i, err =3D 0;
>      V9fsPath dpath, path, *pathes =3D NULL;
>      uint16_t nwnames;
> -    struct stat stbuf, fidst, *stbufs =3D NULL;
> +    struct stat stbuf, fidst;
> +    g_autofree struct stat *stbufs =3D NULL;
>      size_t offset =3D 7;
>      int32_t fid, newfid;
>      V9fsString *wnames =3D NULL;
> @@ -1872,8 +1873,6 @@ out_nofid:
>              v9fs_path_free(&pathes[name_idx]);
>          }
>          g_free(wnames);
> -        g_free(qids);
> -        g_free(stbufs);
>          g_free(pathes);

It seems that wnames and pathes could be converted to
g_autofree as well or I'm missing something ?

Feel free to add my R-b with or without that extra change.

Reviewed-by: Greg Kurz <groug@kaod.org>

>      }
>  }


