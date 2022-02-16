Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F1B4B877E
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 13:23:16 +0100 (CET)
Received: from localhost ([::1]:50166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKJL0-0002mB-Lw
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 07:23:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nKJGJ-0001I3-3T
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 07:18:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nKJGF-0005jG-JU
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 07:18:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645013898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2i0K/IPUiFCQPHMw1zKcl1XyQYSd4Qhs1t1xdnhbiFA=;
 b=hMVkAOY5jhuTxR+NJDiv1wtrsgIyWSFNhk3L5klw9/dIMtl97OicfZ/VmldCn80B+sEyIt
 RNTUetChhlf/TfXrnRrBIhlvoVDhy9q2orFrcANOwlFuIwcv0pDm2zrQdPN3HcR/B1Yt0M
 5CXJMS+xT4WcCvydj/pYk+HqwzmClWc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-WQOJ0cirPO2W-L6Lks2fYQ-1; Wed, 16 Feb 2022 07:18:17 -0500
X-MC-Unique: WQOJ0cirPO2W-L6Lks2fYQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 g17-20020adfa591000000b001da86c91c22so1026266wrc.5
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 04:18:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=2i0K/IPUiFCQPHMw1zKcl1XyQYSd4Qhs1t1xdnhbiFA=;
 b=A5Yk506Kf8R7fxiqhXfxAZWhkyQMcbEz8r26XEh80UQJPW98mGZIszKC9ydoN8taF8
 UsZ03PiDCO9tXOdU0a+tnWz0CXUF2iFFiDj86x3jrspBb95hDI31OTz0wk4ofcSWP/wg
 MY2MjcR+PVIXaEg4XCdVQ/cTMaoQdhM7wqdAIyNYCZrHS2wKUOCmWGmjDAcmE8RBSf7i
 +sqsddy26VKJ7sY4Fglz66Z8QBGYBMUcRrkAj8Uyl9tjyBRPk2ktnOzPm/CCCOcJbI9n
 wSeUNfGV0tiV0DHVtL+D2euzFrf9qnjMFJ1/9gFKbAO4ZGO6p3sq+UzMnQPsoqORA79+
 dceg==
X-Gm-Message-State: AOAM532lDfmXIiAAt2QGM7WsFrBfpXcVKwCxY8wuYiReLdpvgQNZd149
 6Bq8Rnblc7qYbPgaqylNfqxOzt4TpGaVBmJZ4qogJBCV+78Yoi9VHyHcxrktacxuNO/aIW6+yaK
 /MYOcJw+9bK2En9I=
X-Received: by 2002:a05:6000:1e0d:b0:1e4:bb5d:4bd6 with SMTP id
 bj13-20020a0560001e0d00b001e4bb5d4bd6mr2151439wrb.676.1645013896136; 
 Wed, 16 Feb 2022 04:18:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzn0lrHVYraA4eRGiTj2kLfjRTjb/2LqGumcyPs46ksDq7qygcMTHH1IA5s+TS+jXDGufQnHQ==
X-Received: by 2002:a05:6000:1e0d:b0:1e4:bb5d:4bd6 with SMTP id
 bj13-20020a0560001e0d00b001e4bb5d4bd6mr2151419wrb.676.1645013895870; 
 Wed, 16 Feb 2022 04:18:15 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id g8sm23151001wrd.9.2022.02.16.04.18.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 04:18:15 -0800 (PST)
Date: Wed, 16 Feb 2022 12:18:13 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH v6 1/1] virtiofsd: Add basic support for FUSE_SYNCFS
 request
Message-ID: <YgzrhYK1eskcbTjV@work-vm>
References: <20220215181529.164070-1-groug@kaod.org>
 <20220215181529.164070-2-groug@kaod.org>
 <Ygv5r+6JfG1XsG8n@redhat.com>
MIME-Version: 1.0
In-Reply-To: <Ygv5r+6JfG1XsG8n@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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
 Greg Kurz <groug@kaod.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Vivek Goyal (vgoyal@redhat.com) wrote:
> On Tue, Feb 15, 2022 at 07:15:29PM +0100, Greg Kurz wrote:
> > Honor the expected behavior of syncfs() to synchronously flush all data
> > and metadata to disk on linux systems.
> > 
> > If virtiofsd is started with '-o announce_submounts', the client is
> > expected to send a FUSE_SYNCFS request for each individual submount.
> > In this case, we just create a new file descriptor on the submount
> > inode with lo_inode_open(), call syncfs() on it and close it. The
> > intermediary file is needed because O_PATH descriptors aren't
> > backed by an actual file and syncfs() would fail with EBADF.
> > 
> > If virtiofsd is started without '-o announce_submounts' or if the
> > client doesn't have the FUSE_CAP_SUBMOUNTS capability, the client
> > only sends a single FUSE_SYNCFS request for the root inode. The
> > server would thus need to track submounts internally and call
> > syncfs() on each of them. This will be implemented later.
> > 
> > Note that syncfs() might suffer from a time penalty if the submounts
> > are being hammered by some unrelated workload on the host. The only
> > solution to prevent that is to avoid shared mounts.
> > 
> > Signed-off-by: Greg Kurz <groug@kaod.org>
> 
> Looks good to me. Thanks Greg.
> 
> Reviewed-by: Vivek Goyal <vgoyal@redhat.com>

Queued

> Vivek
> 
> > ---
> >  tools/virtiofsd/fuse_lowlevel.c       | 11 +++++++
> >  tools/virtiofsd/fuse_lowlevel.h       | 13 ++++++++
> >  tools/virtiofsd/passthrough_ll.c      | 44 +++++++++++++++++++++++++++
> >  tools/virtiofsd/passthrough_seccomp.c |  1 +
> >  4 files changed, 69 insertions(+)
> > 
> > diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowlevel.c
> > index e4679c73abc2..e02d8b25a5f6 100644
> > --- a/tools/virtiofsd/fuse_lowlevel.c
> > +++ b/tools/virtiofsd/fuse_lowlevel.c
> > @@ -1876,6 +1876,16 @@ static void do_lseek(fuse_req_t req, fuse_ino_t nodeid,
> >      }
> >  }
> >  
> > +static void do_syncfs(fuse_req_t req, fuse_ino_t nodeid,
> > +                      struct fuse_mbuf_iter *iter)
> > +{
> > +    if (req->se->op.syncfs) {
> > +        req->se->op.syncfs(req, nodeid);
> > +    } else {
> > +        fuse_reply_err(req, ENOSYS);
> > +    }
> > +}
> > +
> >  static void do_init(fuse_req_t req, fuse_ino_t nodeid,
> >                      struct fuse_mbuf_iter *iter)
> >  {
> > @@ -2280,6 +2290,7 @@ static struct {
> >      [FUSE_RENAME2] = { do_rename2, "RENAME2" },
> >      [FUSE_COPY_FILE_RANGE] = { do_copy_file_range, "COPY_FILE_RANGE" },
> >      [FUSE_LSEEK] = { do_lseek, "LSEEK" },
> > +    [FUSE_SYNCFS] = { do_syncfs, "SYNCFS" },
> >  };
> >  
> >  #define FUSE_MAXOP (sizeof(fuse_ll_ops) / sizeof(fuse_ll_ops[0]))
> > diff --git a/tools/virtiofsd/fuse_lowlevel.h b/tools/virtiofsd/fuse_lowlevel.h
> > index c55c0ca2fc1c..b889dae4de0e 100644
> > --- a/tools/virtiofsd/fuse_lowlevel.h
> > +++ b/tools/virtiofsd/fuse_lowlevel.h
> > @@ -1226,6 +1226,19 @@ struct fuse_lowlevel_ops {
> >       */
> >      void (*lseek)(fuse_req_t req, fuse_ino_t ino, off_t off, int whence,
> >                    struct fuse_file_info *fi);
> > +
> > +    /**
> > +     * Synchronize file system content
> > +     *
> > +     * If this request is answered with an error code of ENOSYS,
> > +     * this is treated as success and future calls to syncfs() will
> > +     * succeed automatically without being sent to the filesystem
> > +     * process.
> > +     *
> > +     * @param req request handle
> > +     * @param ino the inode number
> > +     */
> > +    void (*syncfs)(fuse_req_t req, fuse_ino_t ino);
> >  };
> >  
> >  /**
> > diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> > index b3d0674f6d2f..0f65e6423cf5 100644
> > --- a/tools/virtiofsd/passthrough_ll.c
> > +++ b/tools/virtiofsd/passthrough_ll.c
> > @@ -3357,6 +3357,49 @@ static void lo_lseek(fuse_req_t req, fuse_ino_t ino, off_t off, int whence,
> >      }
> >  }
> >  
> > +static int lo_do_syncfs(struct lo_data *lo, struct lo_inode *inode)
> > +{
> > +    int fd, ret = 0;
> > +
> > +    fuse_log(FUSE_LOG_DEBUG, "lo_do_syncfs(ino=%" PRIu64 ")\n",
> > +             inode->fuse_ino);
> > +
> > +    fd = lo_inode_open(lo, inode, O_RDONLY);
> > +    if (fd < 0) {
> > +        return -fd;
> > +    }
> > +
> > +    if (syncfs(fd) < 0) {
> > +        ret = errno;
> > +    }
> > +
> > +    close(fd);
> > +    return ret;
> > +}
> > +
> > +static void lo_syncfs(fuse_req_t req, fuse_ino_t ino)
> > +{
> > +    struct lo_data *lo = lo_data(req);
> > +    struct lo_inode *inode = lo_inode(req, ino);
> > +    int err;
> > +
> > +    if (!inode) {
> > +        fuse_reply_err(req, EBADF);
> > +        return;
> > +    }
> > +
> > +    err = lo_do_syncfs(lo, inode);
> > +    lo_inode_put(lo, &inode);
> > +
> > +    /*
> > +     * If submounts aren't announced, the client only sends a request to
> > +     * sync the root inode. TODO: Track submounts internally and iterate
> > +     * over them as well.
> > +     */
> > +
> > +    fuse_reply_err(req, err);
> > +}
> > +
> >  static void lo_destroy(void *userdata)
> >  {
> >      struct lo_data *lo = (struct lo_data *)userdata;
> > @@ -3417,6 +3460,7 @@ static struct fuse_lowlevel_ops lo_oper = {
> >      .copy_file_range = lo_copy_file_range,
> >  #endif
> >      .lseek = lo_lseek,
> > +    .syncfs = lo_syncfs,
> >      .destroy = lo_destroy,
> >  };
> >  
> > diff --git a/tools/virtiofsd/passthrough_seccomp.c b/tools/virtiofsd/passthrough_seccomp.c
> > index a3ce9f898d2d..3e9d6181dc69 100644
> > --- a/tools/virtiofsd/passthrough_seccomp.c
> > +++ b/tools/virtiofsd/passthrough_seccomp.c
> > @@ -108,6 +108,7 @@ static const int syscall_allowlist[] = {
> >      SCMP_SYS(set_robust_list),
> >      SCMP_SYS(setxattr),
> >      SCMP_SYS(symlinkat),
> > +    SCMP_SYS(syncfs),
> >      SCMP_SYS(time), /* Rarely needed, except on static builds */
> >      SCMP_SYS(tgkill),
> >      SCMP_SYS(unlinkat),
> > -- 
> > 2.34.1
> > 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


