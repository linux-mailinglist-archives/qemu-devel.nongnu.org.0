Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3964B74AE
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 20:25:51 +0100 (CET)
Received: from localhost ([::1]:34240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK3SQ-0003U0-Fh
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 14:25:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1nK3A2-00047E-MK
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 14:06:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1nK39x-0003Eq-OC
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 14:06:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644952004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0F1h11CEyOJ35ptObuAciRzgWT/V1LbVkolQAkYHIa8=;
 b=F4tCuM9FzyvE6PlOvN/MvRqiclp2pYwJqEcHqVDn42PXVYkDyXCM/J3qIOLco4+jDmfReS
 Po04iIg6hnlq0F1WHYcHCxOSQtX3pYpjNkvOa77AzFwyxk62Q3NaDmPKJ8ePM7w7XQvHSp
 w0JqEBZ4eZvw6bolFY0wliqrjIb+IsQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-426-ryVSoAIJPeCt7aI_Q2qH4Q-1; Tue, 15 Feb 2022 14:06:43 -0500
X-MC-Unique: ryVSoAIJPeCt7aI_Q2qH4Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7015D814243;
 Tue, 15 Feb 2022 19:06:42 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.32.164])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6888D60854;
 Tue, 15 Feb 2022 19:06:24 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id F263322361A; Tue, 15 Feb 2022 14:06:23 -0500 (EST)
Date: Tue, 15 Feb 2022 14:06:23 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v6 1/1] virtiofsd: Add basic support for FUSE_SYNCFS
 request
Message-ID: <Ygv5r+6JfG1XsG8n@redhat.com>
References: <20220215181529.164070-1-groug@kaod.org>
 <20220215181529.164070-2-groug@kaod.org>
MIME-Version: 1.0
In-Reply-To: <20220215181529.164070-2-groug@kaod.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: virtio-fs@redhat.com,
 Sebastian Hasler <sebastian.hasler@stuvus.uni-stuttgart.de>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 15, 2022 at 07:15:29PM +0100, Greg Kurz wrote:
> Honor the expected behavior of syncfs() to synchronously flush all data
> and metadata to disk on linux systems.
> 
> If virtiofsd is started with '-o announce_submounts', the client is
> expected to send a FUSE_SYNCFS request for each individual submount.
> In this case, we just create a new file descriptor on the submount
> inode with lo_inode_open(), call syncfs() on it and close it. The
> intermediary file is needed because O_PATH descriptors aren't
> backed by an actual file and syncfs() would fail with EBADF.
> 
> If virtiofsd is started without '-o announce_submounts' or if the
> client doesn't have the FUSE_CAP_SUBMOUNTS capability, the client
> only sends a single FUSE_SYNCFS request for the root inode. The
> server would thus need to track submounts internally and call
> syncfs() on each of them. This will be implemented later.
> 
> Note that syncfs() might suffer from a time penalty if the submounts
> are being hammered by some unrelated workload on the host. The only
> solution to prevent that is to avoid shared mounts.
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>

Looks good to me. Thanks Greg.

Reviewed-by: Vivek Goyal <vgoyal@redhat.com>

Vivek

> ---
>  tools/virtiofsd/fuse_lowlevel.c       | 11 +++++++
>  tools/virtiofsd/fuse_lowlevel.h       | 13 ++++++++
>  tools/virtiofsd/passthrough_ll.c      | 44 +++++++++++++++++++++++++++
>  tools/virtiofsd/passthrough_seccomp.c |  1 +
>  4 files changed, 69 insertions(+)
> 
> diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowlevel.c
> index e4679c73abc2..e02d8b25a5f6 100644
> --- a/tools/virtiofsd/fuse_lowlevel.c
> +++ b/tools/virtiofsd/fuse_lowlevel.c
> @@ -1876,6 +1876,16 @@ static void do_lseek(fuse_req_t req, fuse_ino_t nodeid,
>      }
>  }
>  
> +static void do_syncfs(fuse_req_t req, fuse_ino_t nodeid,
> +                      struct fuse_mbuf_iter *iter)
> +{
> +    if (req->se->op.syncfs) {
> +        req->se->op.syncfs(req, nodeid);
> +    } else {
> +        fuse_reply_err(req, ENOSYS);
> +    }
> +}
> +
>  static void do_init(fuse_req_t req, fuse_ino_t nodeid,
>                      struct fuse_mbuf_iter *iter)
>  {
> @@ -2280,6 +2290,7 @@ static struct {
>      [FUSE_RENAME2] = { do_rename2, "RENAME2" },
>      [FUSE_COPY_FILE_RANGE] = { do_copy_file_range, "COPY_FILE_RANGE" },
>      [FUSE_LSEEK] = { do_lseek, "LSEEK" },
> +    [FUSE_SYNCFS] = { do_syncfs, "SYNCFS" },
>  };
>  
>  #define FUSE_MAXOP (sizeof(fuse_ll_ops) / sizeof(fuse_ll_ops[0]))
> diff --git a/tools/virtiofsd/fuse_lowlevel.h b/tools/virtiofsd/fuse_lowlevel.h
> index c55c0ca2fc1c..b889dae4de0e 100644
> --- a/tools/virtiofsd/fuse_lowlevel.h
> +++ b/tools/virtiofsd/fuse_lowlevel.h
> @@ -1226,6 +1226,19 @@ struct fuse_lowlevel_ops {
>       */
>      void (*lseek)(fuse_req_t req, fuse_ino_t ino, off_t off, int whence,
>                    struct fuse_file_info *fi);
> +
> +    /**
> +     * Synchronize file system content
> +     *
> +     * If this request is answered with an error code of ENOSYS,
> +     * this is treated as success and future calls to syncfs() will
> +     * succeed automatically without being sent to the filesystem
> +     * process.
> +     *
> +     * @param req request handle
> +     * @param ino the inode number
> +     */
> +    void (*syncfs)(fuse_req_t req, fuse_ino_t ino);
>  };
>  
>  /**
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index b3d0674f6d2f..0f65e6423cf5 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -3357,6 +3357,49 @@ static void lo_lseek(fuse_req_t req, fuse_ino_t ino, off_t off, int whence,
>      }
>  }
>  
> +static int lo_do_syncfs(struct lo_data *lo, struct lo_inode *inode)
> +{
> +    int fd, ret = 0;
> +
> +    fuse_log(FUSE_LOG_DEBUG, "lo_do_syncfs(ino=%" PRIu64 ")\n",
> +             inode->fuse_ino);
> +
> +    fd = lo_inode_open(lo, inode, O_RDONLY);
> +    if (fd < 0) {
> +        return -fd;
> +    }
> +
> +    if (syncfs(fd) < 0) {
> +        ret = errno;
> +    }
> +
> +    close(fd);
> +    return ret;
> +}
> +
> +static void lo_syncfs(fuse_req_t req, fuse_ino_t ino)
> +{
> +    struct lo_data *lo = lo_data(req);
> +    struct lo_inode *inode = lo_inode(req, ino);
> +    int err;
> +
> +    if (!inode) {
> +        fuse_reply_err(req, EBADF);
> +        return;
> +    }
> +
> +    err = lo_do_syncfs(lo, inode);
> +    lo_inode_put(lo, &inode);
> +
> +    /*
> +     * If submounts aren't announced, the client only sends a request to
> +     * sync the root inode. TODO: Track submounts internally and iterate
> +     * over them as well.
> +     */
> +
> +    fuse_reply_err(req, err);
> +}
> +
>  static void lo_destroy(void *userdata)
>  {
>      struct lo_data *lo = (struct lo_data *)userdata;
> @@ -3417,6 +3460,7 @@ static struct fuse_lowlevel_ops lo_oper = {
>      .copy_file_range = lo_copy_file_range,
>  #endif
>      .lseek = lo_lseek,
> +    .syncfs = lo_syncfs,
>      .destroy = lo_destroy,
>  };
>  
> diff --git a/tools/virtiofsd/passthrough_seccomp.c b/tools/virtiofsd/passthrough_seccomp.c
> index a3ce9f898d2d..3e9d6181dc69 100644
> --- a/tools/virtiofsd/passthrough_seccomp.c
> +++ b/tools/virtiofsd/passthrough_seccomp.c
> @@ -108,6 +108,7 @@ static const int syscall_allowlist[] = {
>      SCMP_SYS(set_robust_list),
>      SCMP_SYS(setxattr),
>      SCMP_SYS(symlinkat),
> +    SCMP_SYS(syncfs),
>      SCMP_SYS(time), /* Rarely needed, except on static builds */
>      SCMP_SYS(tgkill),
>      SCMP_SYS(unlinkat),
> -- 
> 2.34.1
> 


