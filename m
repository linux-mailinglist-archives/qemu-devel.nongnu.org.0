Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 097967C94C
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Jul 2019 18:57:20 +0200 (CEST)
Received: from localhost ([::1]:43048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsruh-0007GM-8x
	for lists+qemu-devel@lfdr.de; Wed, 31 Jul 2019 12:57:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55530)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgilbert@redhat.com>) id 1hsru8-0006pv-0i
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 12:56:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hsru7-00043v-3z
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 12:56:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53220)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hsru6-00040e-Ub
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 12:56:43 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1642419CF7A
 for <qemu-devel@nongnu.org>; Wed, 31 Jul 2019 16:56:42 +0000 (UTC)
Received: from work-vm (ovpn-116-252.ams2.redhat.com [10.36.116.252])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BA1096012E;
 Wed, 31 Jul 2019 16:56:36 +0000 (UTC)
Date: Wed, 31 Jul 2019 17:56:33 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20190731165633.GJ3203@work-vm>
References: <20190726091103.23503-1-stefanha@redhat.com>
 <20190726091103.23503-4-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190726091103.23503-4-stefanha@redhat.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Wed, 31 Jul 2019 16:56:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 3/5] virtiofsd: make lo_release() atomic
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
> Hold the lock across both lo_map_get() and lo_map_remove() to prevent
> races between two FUSE_RELEASE requests.  In this case I don't see a
> serious bug but it's safer to do things atomically.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

OK, although I suspect there are lots of places the inode pointers 
are passed without the lock, so it might not help much.


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>


and applied

> ---
>  contrib/virtiofsd/passthrough_ll.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/contrib/virtiofsd/passthrough_ll.c b/contrib/virtiofsd/passthrough_ll.c
> index 277a17fc03..c1500e092d 100644
> --- a/contrib/virtiofsd/passthrough_ll.c
> +++ b/contrib/virtiofsd/passthrough_ll.c
> @@ -1759,14 +1759,18 @@ static void lo_open(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info *fi)
>  static void lo_release(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info *fi)
>  {
>  	struct lo_data *lo = lo_data(req);
> -	int fd;
> +	struct lo_map_elem *elem;
> +	int fd = -1;
>  
>  	(void) ino;
>  
> -	fd = lo_fi_fd(req, fi);
> -
>  	pthread_mutex_lock(&lo->mutex);
> -	lo_map_remove(&lo->fd_map, fi->fh);
> +	elem = lo_map_get(&lo->fd_map, fi->fh);
> +	if (elem) {
> +		fd = elem->fd;
> +		elem = NULL;
> +		lo_map_remove(&lo->fd_map, fi->fh);
> +	}
>  	pthread_mutex_unlock(&lo->mutex);
>  
>  	close(fd);
> -- 
> 2.21.0
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

