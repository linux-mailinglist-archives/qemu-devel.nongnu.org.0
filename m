Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95597390962
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 21:03:21 +0200 (CEST)
Received: from localhost ([::1]:44404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llcKl-0002oJ-PU
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 15:03:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1llcJ7-00026S-Vz
 for qemu-devel@nongnu.org; Tue, 25 May 2021 15:01:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1llcJ5-00051z-Re
 for qemu-devel@nongnu.org; Tue, 25 May 2021 15:01:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621969294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VjsLX86l5th18+B4RWa7U8QT+S3KInR+TLquutRkFkM=;
 b=iJUD3BrH/q/AEzGDowxvfuTcU1heztwdGPLyNQBP0idwiYNw/ABbjIf3SrxBh7a/fm/alX
 Bocrc3HPLrkpSzobzLrTevx+LTVtVUygJEQslDSQBLG9FoNyS7DkpdVLp2KJqiOLWIkRjd
 kunbmLso4bMG2k7VLLoVKemG+yuL5zo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-Z94SVPiSOJ2NHlXXY6C0Sw-1; Tue, 25 May 2021 15:01:29 -0400
X-MC-Unique: Z94SVPiSOJ2NHlXXY6C0Sw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D27A1B2C984;
 Tue, 25 May 2021 19:01:28 +0000 (UTC)
Received: from work-vm (ovpn-115-40.ams2.redhat.com [10.36.115.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EB1455C1A1;
 Tue, 25 May 2021 19:01:23 +0000 (UTC)
Date: Tue, 25 May 2021 20:01:21 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH 6/8] tools/virtiofsd/buffer.c: replaced a calloc call
 with GLib's g_try_new0
Message-ID: <YK1JgZdyrosbdvHN@work-vm>
References: <20210314032324.45142-1-ma.mandourr@gmail.com>
 <20210314032324.45142-7-ma.mandourr@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210314032324.45142-7-ma.mandourr@gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Mahmoud Mandour (ma.mandourr@gmail.com) wrote:
> Replaced a call to calloc() and its respective free() call
> with GLib's g_try_new0() and g_free() calls.
> 
> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>

6 & 7 queued (sorry for the delay)

> ---
>  tools/virtiofsd/buffer.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/virtiofsd/buffer.c b/tools/virtiofsd/buffer.c
> index 874f01c488..b5f04be356 100644
> --- a/tools/virtiofsd/buffer.c
> +++ b/tools/virtiofsd/buffer.c
> @@ -37,7 +37,7 @@ static ssize_t fuse_buf_writev(struct fuse_buf *out_buf,
>      struct iovec *iov;
>      int fd = out_buf->fd;
>  
> -    iov = calloc(iovcnt, sizeof(struct iovec));
> +    iov = g_try_new0(struct iovec, iovcnt);
>      if (!iov) {
>          return -ENOMEM;
>      }
> @@ -61,7 +61,7 @@ static ssize_t fuse_buf_writev(struct fuse_buf *out_buf,
>          res = -errno;
>      }
>  
> -    free(iov);
> +    g_free(iov);
>      return res;
>  }
>  
> -- 
> 2.25.1
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


