Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC387CA4C
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Jul 2019 19:28:08 +0200 (CEST)
Received: from localhost ([::1]:43190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hssOV-0000XZ-42
	for lists+qemu-devel@lfdr.de; Wed, 31 Jul 2019 13:28:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35341)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgilbert@redhat.com>) id 1hssNq-000052-7M
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 13:27:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hssNo-0003ae-WB
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 13:27:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56262)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hssNo-0003aS-Qa
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 13:27:24 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 14B6E30A7C65
 for <qemu-devel@nongnu.org>; Wed, 31 Jul 2019 17:27:24 +0000 (UTC)
Received: from work-vm (ovpn-116-252.ams2.redhat.com [10.36.116.252])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D90D35C1B5;
 Wed, 31 Jul 2019 17:27:18 +0000 (UTC)
Date: Wed, 31 Jul 2019 18:27:16 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20190731172716.GK3203@work-vm>
References: <20190726091103.23503-1-stefanha@redhat.com>
 <20190726091103.23503-5-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190726091103.23503-5-stefanha@redhat.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Wed, 31 Jul 2019 17:27:24 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 4/5] virtiofsd: drop lo_dirp->fd field
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
> fdopendir(3) takes ownership of the file descriptor.  The presence of
> the lo_dirp->fd field could lead to someone incorrectly adding a
> close(d->fd) cleanup call in the future.
> 
> Do not store the file descriptor in struct lo_dirp since it is unused.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>


Thanks, applied; note:
  a) This looks like it can go into upstream libfuse
  b) I think we're probably leaking DIR *'s if we do an lo_shutdown;
I've added that to my todo

> ---
>  contrib/virtiofsd/passthrough_ll.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/contrib/virtiofsd/passthrough_ll.c b/contrib/virtiofsd/passthrough_ll.c
> index c1500e092d..ad3abdd532 100644
> --- a/contrib/virtiofsd/passthrough_ll.c
> +++ b/contrib/virtiofsd/passthrough_ll.c
> @@ -1293,7 +1293,6 @@ static void lo_readlink(fuse_req_t req, fuse_ino_t ino)
>  }
>  
>  struct lo_dirp {
> -	int fd;
>  	DIR *dp;
>  	struct dirent *entry;
>  	off_t offset;
> @@ -1319,16 +1318,17 @@ static void lo_opendir(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info *fi
>  	struct lo_data *lo = lo_data(req);
>  	struct lo_dirp *d;
>  	ssize_t fh;
> +	int fd = -1;
>  
>  	d = calloc(1, sizeof(struct lo_dirp));
>  	if (d == NULL)
>  		goto out_err;
>  
> -	d->fd = openat(lo_fd(req, ino), ".", O_RDONLY);
> -	if (d->fd == -1)
> +	fd = openat(lo_fd(req, ino), ".", O_RDONLY);
> +	if (fd == -1)
>  		goto out_errno;
>  
> -	d->dp = fdopendir(d->fd);
> +	d->dp = fdopendir(fd);
>  	if (d->dp == NULL)
>  		goto out_errno;
>  
> @@ -1348,11 +1348,12 @@ static void lo_opendir(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info *fi
>  out_errno:
>  	error = errno;
>  out_err:
> +	if (fd != -1) {
> +		close(fd);
> +	}
>  	if (d) {
>  		if (d->dp)
>  			closedir(d->dp);
> -		if (d->fd != -1)
> -			close(d->fd);
>  		free(d);
>  	}
>  	fuse_reply_err(req, error);
> -- 
> 2.21.0
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

