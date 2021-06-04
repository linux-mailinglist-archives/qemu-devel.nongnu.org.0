Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0215939BA22
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 15:47:05 +0200 (CEST)
Received: from localhost ([::1]:52276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpAAB-0007lR-IB
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 09:47:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lpA9C-00074g-W4
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 09:46:03 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:44989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lpA9B-0005Wh-3C
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 09:46:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=cGDbvTk5oUtW0jTrYn82Ig/ZGjoz4S43f18HsQC6w+w=; b=iKaSuzKbp1iFx8O7Cv+4LrJrbt
 E5Q9VOvSFxqCIbBLvVBpHBX7aA+R4VvRg/sIYB3rc6jIGFGhICLbEmbP+c8vYNATd/ldJAJwSLqXo
 t8+GDdDvGQ97XnWypAfuFwnTQ9K47wpQtmFrAECXyFj1l9B5e5I5rTXGDeYRYtwua+3FkmNK/R5CE
 k7G4jT1fkQ0a4Wh+Re8RD5NCgDhMFzr0IgMPXk4Pc/EKTAh5c36+HvZPL1xhVEDsFdC8I3QVIYBEa
 RzYWp7haJ1sz6p3MrgNmIabw/IS+XskX0yjwbiljo8jiQUuECC+14p+wzXOj3X96t1rduqohJCBxG
 dF6v46TvCmJYLdUqw8POBdyvFyFAJlfRlLq++jinQh1ENQTkc3wGV3rqfaZP68VHSPpVwjJDQsO1F
 8vyfKZ4+vR/Eitc5ghJs+fLrMMLIBvpx/GT2HGZMykOTPZAUnrd3UIStTYrBAUNzByXoVqo0rglFi
 poVJWqCVOPITu4mLj6skqShAIOtCIiRi2m6eeScsCTJ1DeapfUHB10TOduZ540kQAt4Qag1IMuBhs
 wicUOh+kwPdEyNYI8L64K3Yx8rLPXOc3cVoHNBJNXVCwVM55H6ZJjgL5t85QV2bxhTXVClzIAQTIs
 uQKSAwXslFisv4QzElC5hQkfaB3XhOxRpO6E9z0jw=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 2/3] 9pfs: capture root stat
Date: Fri, 04 Jun 2021 15:45:58 +0200
Message-ID: <3855995.j4n3Whajus@silver>
In-Reply-To: <e6a33f077cf0675f51bff979e976f8472cfe027d.1622135592.git.qemu_oss@crudebyte.com>
References: <cover.1622135592.git.qemu_oss@crudebyte.com>
 <e6a33f077cf0675f51bff979e976f8472cfe027d.1622135592.git.qemu_oss@crudebyte.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Donnerstag, 27. Mai 2021 19:04:11 CEST Christian Schoenebeck wrote:
> We already capture the QID of the exported 9p root path, i.e. to
> prevent client access outside the defined, exported filesystem's tree.
> This is currently checked by comparing the root QID with another FID's
> QID.
> 
> The problem with the latter is that resolving a QID of any given 9p path
> can only be done on 9p server's main thread, that's because it might
> mutate the server's state if inode remapping is enabled.
> 
> For that reason also capture the POSIX stat info of the root path for
> being able to identify on any (e.g. worker) thread whether an
> arbitrary given path is identical to the export root.
> 
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
>  hw/9pfs/9p.c | 10 +++++++++-
>  hw/9pfs/9p.h |  1 +
>  2 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> index 89aa07db78..825de1561d 100644
> --- a/hw/9pfs/9p.c
> +++ b/hw/9pfs/9p.c
> @@ -1400,6 +1400,7 @@ static void coroutine_fn v9fs_attach(void *opaque)
>      size_t offset = 7;
>      V9fsQID qid;
>      ssize_t err;
> +    struct stat stbuf;
> 
>      v9fs_string_init(&uname);
>      v9fs_string_init(&aname);
> @@ -1422,7 +1423,13 @@ static void coroutine_fn v9fs_attach(void *opaque)
>          clunk_fid(s, fid);
>          goto out;
>      }
> -    err = fid_to_qid(pdu, fidp, &qid);
> +    err = v9fs_co_lstat(pdu, &fidp->path, &stbuf);
> +    if (err < 0) {
> +        err = -EINVAL;
> +        clunk_fid(s, fid);
> +        goto out;
> +    }
> +    err = stat_to_qid(pdu, &stbuf, &qid);
>      if (err < 0) {
>          err = -EINVAL;
>          clunk_fid(s, fid);
> @@ -1455,6 +1462,7 @@ static void coroutine_fn v9fs_attach(void *opaque)
>      err += offset;
> 
>      memcpy(&s->root_qid, &qid, sizeof(qid));
> +    memcpy(&s->root_st, &stbuf, sizeof(struct stat));

I'll make that sizeof(stbuf) instead to match with common code style here.

>      trace_v9fs_attach_return(pdu->tag, pdu->id,
>                               qid.type, qid.version, qid.path);
>  out:
> diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h
> index 00381591ff..6f0b4c78c0 100644
> --- a/hw/9pfs/9p.h
> +++ b/hw/9pfs/9p.h
> @@ -356,6 +356,7 @@ struct V9fsState {
>      Error *migration_blocker;
>      V9fsConf fsconf;
>      V9fsQID root_qid;
> +    struct stat root_st;
>      dev_t dev_id;
>      struct qht qpd_table;
>      struct qht qpp_table;



