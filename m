Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE9636D7D2
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 14:57:24 +0200 (CEST)
Received: from localhost ([::1]:48464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbjkp-0000nI-JY
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 08:57:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lbjhj-0005I3-WF
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 08:54:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lbjhf-0003Ku-Px
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 08:54:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619614446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U1QYnOt20c8FaULH4W8p+VBHhOYNeowdkJgV3UmWGfQ=;
 b=O9gDad5Fei3icf8FBdizPkieU3UZM8m/4hCRa7GaVHj71bpHOrnwTv/71ThQqUKEUwAf5/
 +DM1VVR2x/CZW/dvY1AjGn/qBwWwjH0/EqlTINezrmEJ1Ydl97BuCZuQnYXbIXwJdIw3V2
 jtgxWKWOQLNT6URy9tBg0mHmCULbBj4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-65-KuRhoZWOP6iwo-zZzPtknw-1; Wed, 28 Apr 2021 08:54:02 -0400
X-MC-Unique: KuRhoZWOP6iwo-zZzPtknw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8557C8A686F;
 Wed, 28 Apr 2021 12:53:42 +0000 (UTC)
Received: from work-vm (ovpn-115-35.ams2.redhat.com [10.36.115.35])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C6BEF6E6F7;
 Wed, 28 Apr 2021 12:53:22 +0000 (UTC)
Date: Wed, 28 Apr 2021 13:53:20 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, vgoyal@redhat.com, stefanha@redhat.com,
 groug@kaod.org
Subject: Re: [PATCH v3 19/26] DAX/unmap virtiofsd: Add wrappers for
 VHOST_USER_SLAVE_FS_IO
Message-ID: <YIlawPc33p9vFldU@work-vm>
References: <20210428110100.27757-1-dgilbert@redhat.com>
 <20210428110100.27757-20-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210428110100.27757-20-dgilbert@redhat.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: virtio-fs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Dr. David Alan Gilbert (git) (dgilbert@redhat.com) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> Add a wrapper to send VHOST_USER_SLAVE_FS_IO commands and a
> further wrapper for sending a fuse_buf write using the FS_IO
> slave command.
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  tools/virtiofsd/fuse_lowlevel.h | 25 +++++++++++++++++++
>  tools/virtiofsd/fuse_virtio.c   | 43 +++++++++++++++++++++++++++++++++
>  2 files changed, 68 insertions(+)
> 
> diff --git a/tools/virtiofsd/fuse_lowlevel.h b/tools/virtiofsd/fuse_lowlevel.h
> index 27b07bfc22..757cdae49b 100644
> --- a/tools/virtiofsd/fuse_lowlevel.h
> +++ b/tools/virtiofsd/fuse_lowlevel.h
> @@ -2013,4 +2013,29 @@ int64_t fuse_virtio_map(fuse_req_t req, VhostUserFSSlaveMsg *msg, int fd);
>   */
>  int64_t fuse_virtio_unmap(struct fuse_session *se, VhostUserFSSlaveMsg *msg);
>  
> +/**
> + * For use with virtio-fs; request IO directly to memory
> + *
> + * @param se The current session
> + * @param msg A set of IO requests
> + * @param fd The fd to map
> + * @return Length on success, negative errno on error
> + */
> +int64_t fuse_virtio_io(struct fuse_session *se, VhostUserFSSlaveMsg *msg,
> +                       int fd);
> +
> +/**
> + * For use with virtio-fs; wrapper for fuse_virtio_io for writes
> + * from memory to an fd
> + * @param req The request that triggered this action
> + * @param dst The destination (file) memory buffer
> + * @param dst_off Byte offset in the file
> + * @param src The source (memory) buffer
> + * @param src_off The GPA
> + * @param len Length in bytes
> + */
> +ssize_t fuse_virtio_write(fuse_req_t req, const struct fuse_buf *dst,
> +                          size_t dst_off, const struct fuse_buf *src,
> +                          size_t src_off, size_t len);
> +
>  #endif /* FUSE_LOWLEVEL_H_ */
> diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
> index 85d90ca595..91317bade8 100644
> --- a/tools/virtiofsd/fuse_virtio.c
> +++ b/tools/virtiofsd/fuse_virtio.c
> @@ -1141,3 +1141,46 @@ int64_t fuse_virtio_unmap(struct fuse_session *se, VhostUserFSSlaveMsg *msg)
>      return vu_fs_cache_request(&se->virtio_dev->dev, VHOST_USER_SLAVE_FS_UNMAP,
>                                 -1, msg);
>  }
> +
> +int64_t fuse_virtio_io(struct fuse_session *se, VhostUserFSSlaveMsg *msg,
> +                       int fd)
> +{
> +    if (!se->virtio_dev) {
> +        return -ENODEV;
> +    }
> +    return vu_fs_cache_request(&se->virtio_dev->dev, VHOST_USER_SLAVE_FS_IO,
> +                               fd, msg);
> +}
> +
> +/*
> + * Write to a file (dst) from an area of guest GPA (src) that probably
> + * isn't visible to the daemon.
> + */
> +ssize_t fuse_virtio_write(fuse_req_t req, const struct fuse_buf *dst,
> +                          size_t dst_off, const struct fuse_buf *src,
> +                          size_t src_off, size_t len)
> +{
> +    VhostUserFSSlaveMsg *msg = g_malloc0(sizeof(VhostUserFSSlaveMsg) +
> +                                         sizeof(VhostUserFSSlaveMsgEntry));
> +
> +    msg->count = 1;
> +
> +    if (dst->flags & FUSE_BUF_FD_SEEK) {
> +        msg->entries[0].fd_offset = dst->pos + dst_off;
> +    } else {
> +        off_t cur = lseek(dst->fd, 0, SEEK_CUR);
> +        if (cur == (off_t)-1) {
> +            g_free(msg);
> +            return -errno;
> +        }
> +        msg->entries[0].fd_offset = cur;
> +    }
> +    msg->entries[0].c_offset = (uintptr_t)src->mem + src_off;
> +    msg->entries[0].len = len;
> +    msg->entries[0].flags = VHOST_USER_FS_FLAG_MAP_W;
> +
> +    int64_t result = fuse_virtio_io(req->se, msg, dst->fd);
> +    fuse_log(FUSE_LOG_DEBUG, "%s: result=%" PRId64 " \n", __func__, result);

Oops, as the bot spotted, there's an unneeded space before the \n, I'll
sweep that out.

Dave

> +    g_free(msg);
> +    return result;
> +}
> -- 
> 2.31.1
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


