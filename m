Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D90E5615F95
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 10:23:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oq9wR-0006ly-BA; Wed, 02 Nov 2022 05:21:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1oq9wQ-0006lr-1D
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 05:21:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1oq9wN-0005WI-Ea
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 05:21:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667380902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tBtrdYdlbzPjoNipzUgKwyUV6LUAfeu3VF7JgGI3w3M=;
 b=B2Eet6uniGooab+bYQtmWXTPjT2tOPonM3/uNT3fbVJk0APsegnk6GLVBxP0ZxZkWF5Fdn
 IUmxLz1iatE66Ry5zT++BTVBe+FuvV6Je+MQpMY0pzk8OJ4FBmqIemW0NKyY1TVVbm5XW1
 GmSCa2tjk7o86MdMHE8SJTsZ8fq00Mo=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-662-l2WLgBoCMXuVCK6N6s0F2A-1; Wed, 02 Nov 2022 05:21:41 -0400
X-MC-Unique: l2WLgBoCMXuVCK6N6s0F2A-1
Received: by mail-qt1-f197.google.com with SMTP id
 c11-20020ac87dcb000000b0039cdb815f3bso11773567qte.4
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 02:21:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tBtrdYdlbzPjoNipzUgKwyUV6LUAfeu3VF7JgGI3w3M=;
 b=UE7S68QaJkg1zrEqfm7dBLrQFcQEtb+e2SqL2CZIBkDEeczqEI79SaRqP/M5mwJQc8
 ZNUvcXoaWwRMgXid314J2Lp34EWetVXBboO8WTL/JRETIX9cxLnsKkBAMBpPwLE8k0i+
 3ufpO+jR+PRfjCSEQdPB440WQd7//SulSezV0JU4ON1Zuk1431TGa5PkxDHMACvZIj6h
 VJ+KlaBCrow0zIIS6bNOMwx4rIQXh/X73YH6bCmNv8f3ts7MRwoPu7f7wMR79mbp3fPW
 YI5uta8Am8tjN/eJZK0fItNufcTW9H3ikKJgH8hY/MEIQOxHZxJp3BNqFQ5PZTMDufEh
 M8Rg==
X-Gm-Message-State: ACrzQf2nPER8dVItUObSFrEvdz+R9O+x7dbHtWM2dO0qXqDJa4fDNuRA
 XWhEY3rZeYtl7x3OzucVRJpYHVAlJLZuyWUgvJAmtPRDJtbOCvRuETNZvtfu7eKnRFUNoeVNhhP
 ieNCsEYbMLEBXYA8=
X-Received: by 2002:a05:6214:27ec:b0:4bb:db35:3a81 with SMTP id
 jt12-20020a05621427ec00b004bbdb353a81mr16708330qvb.58.1667380900699; 
 Wed, 02 Nov 2022 02:21:40 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM58iuoMdsMQEhzNmsveb8qnMHR16B/vBRwFGibzw5pgJD1T/TBnJJzHKNLqmoKyYqryDKXh8A==
X-Received: by 2002:a05:6214:27ec:b0:4bb:db35:3a81 with SMTP id
 jt12-20020a05621427ec00b004bbdb353a81mr16708320qvb.58.1667380900490; 
 Wed, 02 Nov 2022 02:21:40 -0700 (PDT)
Received: from sgarzare-redhat (host-82-53-134-234.retail.telecomitalia.it.
 [82.53.134.234]) by smtp.gmail.com with ESMTPSA id
 bi29-20020a05620a319d00b006f956766f76sm8296419qkb.1.2022.11.02.02.21.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 02:21:39 -0700 (PDT)
Date: Wed, 2 Nov 2022 10:21:32 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Alberto Faria <afaria@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH] block/blkio: Make driver nvme-io_uring take a "path"
 instead of a "filename"
Message-ID: <20221102092132.tf3xoidh2gu2mgux@sgarzare-redhat>
References: <20221028233854.839933-1-afaria@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20221028233854.839933-1-afaria@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.051,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sat, Oct 29, 2022 at 12:38:54AM +0100, Alberto Faria wrote:
>The nvme-io_uring driver expects a character special file such as
>/dev/ng0n1. Follow the convention of having a "filename" option when a
>regular file is expected, and a "path" option otherwise.
>
>This makes io_uring the only libblkio-based driver with a "filename"
>option, as it accepts a regular file (even though it can also take a
>block special file).
>
>Signed-off-by: Alberto Faria <afaria@redhat.com>
>---
> block/blkio.c        | 12 ++++++++----
> qapi/block-core.json |  4 ++--
> 2 files changed, 10 insertions(+), 6 deletions(-)
>
>diff --git a/block/blkio.c b/block/blkio.c
>index 82f26eedd2..5f600e5e9e 100644
>--- a/block/blkio.c
>+++ b/block/blkio.c
>@@ -639,12 +639,17 @@ static int blkio_io_uring_open(BlockDriverState *bs, QDict *options, int flags,
> static int blkio_nvme_io_uring(BlockDriverState *bs, QDict *options, int flags,
>                                Error **errp)
> {
>-    const char *filename = qdict_get_str(options, "filename");
>+    const char *path = qdict_get_try_str(options, "path");
>     BDRVBlkioState *s = bs->opaque;
>     int ret;
>
>-    ret = blkio_set_str(s->blkio, "path", filename);
>-    qdict_del(options, "filename");
>+    if (!path) {
>+        error_setg(errp, "missing 'path' option");
>+        return -EINVAL;
>+    }
>+
>+    ret = blkio_set_str(s->blkio, "path", path);
>+    qdict_del(options, "path");
>     if (ret < 0) {
>         error_setg_errno(errp, -ret, "failed to set path: %s",
>                          blkio_get_error_msg());
>@@ -986,7 +991,6 @@ static BlockDriver bdrv_io_uring = BLKIO_DRIVER(
>
> static BlockDriver bdrv_nvme_io_uring = BLKIO_DRIVER(
>     DRIVER_NVME_IO_URING,
>-    .bdrv_needs_filename = true,
> );
>
> static BlockDriver bdrv_virtio_blk_vhost_user = BLKIO_DRIVER(
>diff --git a/qapi/block-core.json b/qapi/block-core.json
>index cb5079e645..6d36c0ed8b 100644
>--- a/qapi/block-core.json
>+++ b/qapi/block-core.json
>@@ -3703,12 +3703,12 @@
> #
> # Driver specific block device options for the nvme-io_uring backend.
> #
>-# @filename: path to the image file
>+# @path: path to the image file

Maybe we can update the "path" description with something similar to 
what we have in the libblkio docs:
   path to the NVMe namespace's character device (e.g., `/dev/ng0n1`).

Thanks,
Stefano


