Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5E57758D
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Jul 2019 03:12:06 +0200 (CEST)
Received: from localhost ([::1]:43890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hrBFl-0005Y2-Gf
	for lists+qemu-devel@lfdr.de; Fri, 26 Jul 2019 21:12:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47953)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bo.liu@linux.alibaba.com>) id 1hr7rp-0001e1-ER
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 17:35:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bo.liu@linux.alibaba.com>) id 1hr7rV-0006Nr-CK
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 17:34:56 -0400
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130]:60944)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <bo.liu@linux.alibaba.com>)
 id 1hr7rG-0003fs-Gu
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 17:34:38 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R681e4; CH=green; DM=||false|;
 FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04420; MF=bo.liu@linux.alibaba.com; NM=1;
 PH=DS; RN=3; SR=0; TI=SMTPD_---0TXs008o_1564176375; 
Received: from US-160370MP2.local(mailfrom:bo.liu@linux.alibaba.com
 fp:SMTPD_---0TXs008o_1564176375) by smtp.aliyun-inc.com(127.0.0.1);
 Sat, 27 Jul 2019 05:26:16 +0800
Date: Fri, 26 Jul 2019 14:26:14 -0700
From: Liu Bo <bo.liu@linux.alibaba.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20190726212613.24lionrtvt3kz2g3@US-160370MP2.local>
References: <20190726091103.23503-1-stefanha@redhat.com>
 <20190726091103.23503-3-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190726091103.23503-3-stefanha@redhat.com>
User-Agent: NeoMutt/20180323
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 115.124.30.130
X-Mailman-Approved-At: Fri, 26 Jul 2019 21:11:54 -0400
Subject: Re: [Qemu-devel] [Virtio-fs] [PATCH 2/5] virtiofsd: prevent
 lo_lookup() NULL pointer	dereference
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
Reply-To: bo.liu@linux.alibaba.com
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 26, 2019 at 10:11:00AM +0100, Stefan Hajnoczi wrote:
> Most lo_do_lookup() have already checked that the parent inode exists.
> lo_lookup() hasn't and can therefore hit a NULL pointer dereference when
> lo_inode(req, parent) returns NULL.
>

Sigh...this one has been fixed by 3 different developers...Me, Pengtao and Stefan.

The following one on the ML did the exactly same thing.
---
Subject: [Virtio-fs] [PATCH] virtiofsd: fix lo_do_lookup panic

It needs to check for invalid parent dir.

Signed-off-by: Peng Tao <tao.peng@linux.alibaba.com>
---

thanks,
-liubo

> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  contrib/virtiofsd/passthrough_ll.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/contrib/virtiofsd/passthrough_ll.c b/contrib/virtiofsd/passthrough_ll.c
> index 9ae1381618..277a17fc03 100644
> --- a/contrib/virtiofsd/passthrough_ll.c
> +++ b/contrib/virtiofsd/passthrough_ll.c
> @@ -766,6 +766,10 @@ static int lo_do_lookup(fuse_req_t req, fuse_ino_t parent, const char *name,
>  	struct lo_data *lo = lo_data(req);
>  	struct lo_inode *inode, *dir = lo_inode(req, parent);
>  
> +	if (!dir) {
> +		return EBADF;
> +	}
> +
>  	memset(e, 0, sizeof(*e));
>  	e->attr_timeout = lo->timeout;
>  	e->entry_timeout = lo->timeout;
> -- 
> 2.21.0
> 
> _______________________________________________
> Virtio-fs mailing list
> Virtio-fs@redhat.com
> https://www.redhat.com/mailman/listinfo/virtio-fs

