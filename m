Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AADC07E058
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Aug 2019 18:39:38 +0200 (CEST)
Received: from localhost ([::1]:57654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1htE77-0000w9-UZ
	for lists+qemu-devel@lfdr.de; Thu, 01 Aug 2019 12:39:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55701)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgilbert@redhat.com>) id 1htE4R-0008P7-VV
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 12:36:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1htE4R-0005tr-3H
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 12:36:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35628)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1htE4Q-0005pq-TZ
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 12:36:51 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 25C3630C4AD0
 for <qemu-devel@nongnu.org>; Thu,  1 Aug 2019 16:36:43 +0000 (UTC)
Received: from work-vm (ovpn-117-184.ams2.redhat.com [10.36.117.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 766565D9E5;
 Thu,  1 Aug 2019 16:36:36 +0000 (UTC)
Date: Thu, 1 Aug 2019 17:36:34 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20190801163634.GQ2773@work-vm>
References: <20190801163206.7906-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190801163206.7906-1-stefanha@redhat.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Thu, 01 Aug 2019 16:36:43 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] virtiofsd: fix req use-after-free in
 lo_flush()
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Stefan Hajnoczi (stefanha@redhat.com) wrote:
> Isn't it funny that a commit trying to fix use-after-free introduced its
> own use-after-free?
> 
> fuse_reply_err() frees the request so we cannot call lo_data(req)
> afterwards.
> 
> Fixes: a5081fc6fc3603671383616127b3a5e169cf64ed
>        ("virtiofsd: introduce inode refcount to prevent use-after-free")
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Squashed into the top.

Dave

> ---
>  contrib/virtiofsd/passthrough_ll.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/contrib/virtiofsd/passthrough_ll.c b/contrib/virtiofsd/passthrough_ll.c
> index ee8627446a..a81c01d0d1 100644
> --- a/contrib/virtiofsd/passthrough_ll.c
> +++ b/contrib/virtiofsd/passthrough_ll.c
> @@ -1969,9 +1969,8 @@ static void lo_flush(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info *fi)
>  	pthread_mutex_unlock(&inode->plock_mutex);
>  
>  	res = close(dup(lo_fi_fd(req, fi)));
> -	fuse_reply_err(req, res == -1 ? errno : 0);
> -
>  	lo_inode_put(lo_data(req), &inode);
> +	fuse_reply_err(req, res == -1 ? errno : 0);
>  }
>  
>  static void lo_fsync(fuse_req_t req, fuse_ino_t ino, int datasync,
> -- 
> 2.21.0
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

