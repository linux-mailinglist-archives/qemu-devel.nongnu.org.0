Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E9F318F83
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 17:09:27 +0100 (CET)
Received: from localhost ([::1]:47342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAEX0-0007CZ-Hx
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 11:09:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lAETG-0001jp-EQ
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 11:05:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lAET9-00062Z-OM
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 11:05:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613059523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QtQe8CYWl4y3ayHAFoNYUIinQ99U+kO8ivMhuBry9bI=;
 b=V5tadlk6JOYUV+x6nlkzxxr7irxLgvibUB1hnAPrn6icfV//qIIlvdigVFESyeR0jvaj2h
 KZgUrZLgmQu+8ZLTdOVg3T8gNsjZ051DxRvfsSAY5oggboamHR1ay1LTCI6D8NlWvZ8KPO
 iTdeqltJPz8nt+y4s0hrC/hT83oFUJo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-134-lzyqN31FNDyzgeQ-16lROw-1; Thu, 11 Feb 2021 11:05:22 -0500
X-MC-Unique: lzyqN31FNDyzgeQ-16lROw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE3FD1083E8F
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 16:05:20 +0000 (UTC)
Received: from horse.redhat.com (ovpn-115-229.rdu2.redhat.com [10.10.115.229])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 275DD3828;
 Thu, 11 Feb 2021 16:05:09 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 33863220BCF; Thu, 11 Feb 2021 11:05:08 -0500 (EST)
Date: Thu, 11 Feb 2021 11:05:08 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH 12/24] DAX: virtiofsd: Wire up passthrough_ll's
 lo_setupmapping
Message-ID: <20210211160508.GA3259@redhat.com>
References: <20210209190224.62827-1-dgilbert@redhat.com>
 <20210209190224.62827-13-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210209190224.62827-13-dgilbert@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
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
Cc: virtio-fs@redhat.com, marcandre.lureau@redhat.com, qemu-devel@nongnu.org,
 stefanha@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 09, 2021 at 07:02:12PM +0000, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> Wire up passthrough_ll's setupmapping to allocate, send to virtio
> and then reply OK.
> 
> Guest might not pass file pointer. In that case using inode info, open
> the file again, mmap() and close fd.
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> With fix from:
> Signed-off-by: Fotis Xenakis <foxen@windowslive.com>
> ---
>  tools/virtiofsd/fuse_lowlevel.c  | 13 ++++++--
>  tools/virtiofsd/passthrough_ll.c | 52 ++++++++++++++++++++++++++++++--
>  2 files changed, 61 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowlevel.c
> index 0d3768b7d0..f74583e095 100644
> --- a/tools/virtiofsd/fuse_lowlevel.c
> +++ b/tools/virtiofsd/fuse_lowlevel.c
> @@ -1897,8 +1897,17 @@ static void do_setupmapping(fuse_req_t req, fuse_ino_t nodeid,
>      }
>  
>      if (req->se->op.setupmapping) {
> -        req->se->op.setupmapping(req, nodeid, arg->foffset, arg->len,
> -                                 arg->moffset, genflags, &fi);
> +        /*
> +         * TODO: Add a flag to request which tells if arg->fh is
> +         * valid or not.
> +         */
> +        if (fi.fh == (uint64_t)-1) {
> +            req->se->op.setupmapping(req, nodeid, arg->foffset, arg->len,
> +                                     arg->moffset, genflags, NULL);
> +        } else {
> +            req->se->op.setupmapping(req, nodeid, arg->foffset, arg->len,
> +                                     arg->moffset, genflags, &fi);
> +        }
>      } else {
>          fuse_reply_err(req, ENOSYS);
>      }
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index 31c43d67a0..0493f00756 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -2967,8 +2967,56 @@ static void lo_setupmapping(fuse_req_t req, fuse_ino_t ino, uint64_t foffset,
>                              uint64_t len, uint64_t moffset, uint64_t flags,
>                              struct fuse_file_info *fi)
>  {
> -    /* TODO */
> -    fuse_reply_err(req, ENOSYS);
> +    struct lo_data *lo = lo_data(req);
> +    int ret = 0, fd;
> +    VhostUserFSSlaveMsg msg = { 0 };
> +    uint64_t vhu_flags;
> +    char *buf;
> +    bool writable = flags & O_RDWR;
> +
> +    fuse_log(FUSE_LOG_DEBUG,
> +             "lo_setupmapping(ino=%" PRIu64 ", fi=0x%p,"
> +             " foffset=%" PRIu64 ", len=%" PRIu64 ", moffset=%" PRIu64
> +             ", flags=%" PRIu64 ")\n",
> +             ino, (void *)fi, foffset, len, moffset, flags);
> +
> +    vhu_flags = VHOST_USER_FS_FLAG_MAP_R;
> +    if (writable) {
> +        vhu_flags |= VHOST_USER_FS_FLAG_MAP_W;
> +    }
> +
> +    msg.fd_offset[0] = foffset;
> +    msg.len[0] = len;
> +    msg.c_offset[0] = moffset;
> +    msg.flags[0] = vhu_flags;
> +
> +    if (fi) {
> +        fd = lo_fi_fd(req, fi);
> +    } else {
> +        ret = asprintf(&buf, "%i", lo_fd(req, ino));
> +        if (ret == -1) {
> +            return (void)fuse_reply_err(req, errno);
> +        }
> +
> +        fd = openat(lo->proc_self_fd, buf, flags);
> +        free(buf);

We can probably now use lo_inode_open() instead here now?

Vivek


