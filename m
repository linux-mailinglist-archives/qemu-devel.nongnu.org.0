Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8174B521C
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 14:49:57 +0100 (CET)
Received: from localhost ([::1]:39106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJbjo-0007IL-LF
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 08:49:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nJb0U-0008Up-On
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 08:03:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nJb0R-0008Pv-NU
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 08:03:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644843781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jSiOiur9sZlqA96AChpjItGZ5EEuAcipGo0j+nob7es=;
 b=jTOi1K/j9LfS0H4NCBhQdeAvDJtxwghlYsMQe4tezOXBb8rWvJuoYp/TpyUCaNmKhbkqIx
 vv54NMu/l6qy6rji24nvfJbuDg/A4IPdYZL+SyLCp+1PC7YPT0wbXj6ryuj35VWg1IbD/S
 RXPyyQwG5LR16IcGPmJeFWUNZ/wCATI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-lNSJb0KcOfSXTpfb3OvOhA-1; Mon, 14 Feb 2022 08:02:55 -0500
X-MC-Unique: lNSJb0KcOfSXTpfb3OvOhA-1
Received: by mail-wr1-f70.google.com with SMTP id
 q8-20020adfb188000000b001e33a8cdbf4so6876718wra.16
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 05:02:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=jSiOiur9sZlqA96AChpjItGZ5EEuAcipGo0j+nob7es=;
 b=EvRT8kt8iMwx8UCNzEAzxHEjK+IX6tRQTYKPDMZbWL1WEXoSkni4+j1DmSoA7UeP5x
 QSSiPEhzSF55qcioi8Em3C9PSlGfLQ1vcB3QvM9Hq8ZMVgyz96x+UkQwHdBkHfmMzSkC
 IO5HsZ5eTB2lmfQjLrefA+VO02bEqMTrxKT3TawP1EJk1xEpmvhSZup4mTwONqDgAlsJ
 uF/lKg+JK+CV+Ak4QU7a/dHrdj2tNEpJ+f9aZeBNEzp84GJ1UcseC2TVyF6STIcMnohX
 9Wl56NRl83nM20WNCiB3/qFYNZPeeuUZlUnAbh+VJfz1rp2l2hLwI8553NtRcyMwU+BH
 tQPQ==
X-Gm-Message-State: AOAM531E25bqw6kXTWosH0hLPe3lIvq9AwZQkj/CXGZiwgg/NxT1ClCy
 s0eZUnYB7uaWX65p4BCuECDPr3M07spExTJzeya4nIkllD5O4OaT0ERb1Vj2DyXy5a3Nk2521D/
 2u61ylJKC+cP/faQ=
X-Received: by 2002:a5d:400a:: with SMTP id n10mr11467949wrp.603.1644843774197; 
 Mon, 14 Feb 2022 05:02:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyIWtiT30yg3CiXpMberIWTcVOogs++jU6qqVVGF0wfS/Ey3d2vMyRVr8vTFZOa982CTDlS1g==
X-Received: by 2002:a5d:400a:: with SMTP id n10mr11467931wrp.603.1644843773935; 
 Mon, 14 Feb 2022 05:02:53 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id o13sm11373285wmq.45.2022.02.14.05.02.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 05:02:52 -0800 (PST)
Date: Mon, 14 Feb 2022 13:02:50 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH v6 05/10] virtiofsd, fuse_lowlevel.c: Add capability to
 parse security context
Message-ID: <YgpS+jmOkI5YRUIH@work-vm>
References: <20220208204813.682906-1-vgoyal@redhat.com>
 <20220208204813.682906-6-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220208204813.682906-6-vgoyal@redhat.com>
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
Cc: virtio-fs@redhat.com, mszeredi@redhat.com, berrange@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Vivek Goyal (vgoyal@redhat.com) wrote:
> Add capability to enable and parse security context as sent by client
> and put into fuse_req. Filesystems now can get security context from
> request and set it on files during creation.
> 
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>

I'd be tempted to move the secctx_enabled check into
parse_secctx_fill_req - but OK.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  tools/virtiofsd/fuse_common.h   |   5 ++
>  tools/virtiofsd/fuse_i.h        |   7 +++
>  tools/virtiofsd/fuse_lowlevel.c | 102 +++++++++++++++++++++++++++++++-
>  3 files changed, 113 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/virtiofsd/fuse_common.h b/tools/virtiofsd/fuse_common.h
> index 6f8a988202..bf46954dab 100644
> --- a/tools/virtiofsd/fuse_common.h
> +++ b/tools/virtiofsd/fuse_common.h
> @@ -377,6 +377,11 @@ struct fuse_file_info {
>   */
>  #define FUSE_CAP_SETXATTR_EXT (1 << 29)
>  
> +/**
> + * Indicates that file server supports creating file security context
> + */
> +#define FUSE_CAP_SECURITY_CTX (1ULL << 32)
> +
>  /**
>   * Ioctl flags
>   *
> diff --git a/tools/virtiofsd/fuse_i.h b/tools/virtiofsd/fuse_i.h
> index 492e002181..a5572fa4ae 100644
> --- a/tools/virtiofsd/fuse_i.h
> +++ b/tools/virtiofsd/fuse_i.h
> @@ -15,6 +15,12 @@
>  struct fv_VuDev;
>  struct fv_QueueInfo;
>  
> +struct fuse_security_context {
> +        const char *name;
> +        uint32_t ctxlen;
> +        const void *ctx;
> +};
> +
>  struct fuse_req {
>      struct fuse_session *se;
>      uint64_t unique;
> @@ -35,6 +41,7 @@ struct fuse_req {
>      } u;
>      struct fuse_req *next;
>      struct fuse_req *prev;
> +    struct fuse_security_context secctx;
>  };
>  
>  struct fuse_notify_req {
> diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowlevel.c
> index d91cd9743a..2909122b23 100644
> --- a/tools/virtiofsd/fuse_lowlevel.c
> +++ b/tools/virtiofsd/fuse_lowlevel.c
> @@ -886,11 +886,63 @@ static void do_readlink(fuse_req_t req, fuse_ino_t nodeid,
>      }
>  }
>  
> +static int parse_secctx_fill_req(fuse_req_t req, struct fuse_mbuf_iter *iter)
> +{
> +    struct fuse_secctx_header *fsecctx_header;
> +    struct fuse_secctx *fsecctx;
> +    const void *secctx;
> +    const char *name;
> +
> +    fsecctx_header = fuse_mbuf_iter_advance(iter, sizeof(*fsecctx_header));
> +    if (!fsecctx_header) {
> +        return -EINVAL;
> +    }
> +
> +    /*
> +     * As of now maximum of one security context is supported. It can
> +     * change in future though.
> +     */
> +    if (fsecctx_header->nr_secctx > 1) {
> +        return -EINVAL;
> +    }
> +
> +    /* No security context sent. Maybe no LSM supports it */
> +    if (!fsecctx_header->nr_secctx) {
> +        return 0;
> +    }
> +
> +    fsecctx = fuse_mbuf_iter_advance(iter, sizeof(*fsecctx));
> +    if (!fsecctx) {
> +        return -EINVAL;
> +    }
> +
> +    /* struct fsecctx with zero sized context is not expected */
> +    if (!fsecctx->size) {
> +        return -EINVAL;
> +    }
> +    name = fuse_mbuf_iter_advance_str(iter);
> +    if (!name) {
> +        return -EINVAL;
> +    }
> +
> +    secctx = fuse_mbuf_iter_advance(iter, fsecctx->size);
> +    if (!secctx) {
> +        return -EINVAL;
> +    }
> +
> +    req->secctx.name = name;
> +    req->secctx.ctx = secctx;
> +    req->secctx.ctxlen = fsecctx->size;
> +    return 0;
> +}
> +
>  static void do_mknod(fuse_req_t req, fuse_ino_t nodeid,
>                       struct fuse_mbuf_iter *iter)
>  {
>      struct fuse_mknod_in *arg;
>      const char *name;
> +    bool secctx_enabled = req->se->conn.want & FUSE_CAP_SECURITY_CTX;
> +    int err;
>  
>      arg = fuse_mbuf_iter_advance(iter, sizeof(*arg));
>      name = fuse_mbuf_iter_advance_str(iter);
> @@ -901,6 +953,14 @@ static void do_mknod(fuse_req_t req, fuse_ino_t nodeid,
>  
>      req->ctx.umask = arg->umask;
>  
> +    if (secctx_enabled) {
> +        err = parse_secctx_fill_req(req, iter);
> +        if (err) {
> +            fuse_reply_err(req, -err);
> +            return;
> +        }
> +    }
> +
>      if (req->se->op.mknod) {
>          req->se->op.mknod(req, nodeid, name, arg->mode, arg->rdev);
>      } else {
> @@ -913,6 +973,8 @@ static void do_mkdir(fuse_req_t req, fuse_ino_t nodeid,
>  {
>      struct fuse_mkdir_in *arg;
>      const char *name;
> +    bool secctx_enabled = req->se->conn.want & FUSE_CAP_SECURITY_CTX;
> +    int err;
>  
>      arg = fuse_mbuf_iter_advance(iter, sizeof(*arg));
>      name = fuse_mbuf_iter_advance_str(iter);
> @@ -923,6 +985,14 @@ static void do_mkdir(fuse_req_t req, fuse_ino_t nodeid,
>  
>      req->ctx.umask = arg->umask;
>  
> +    if (secctx_enabled) {
> +        err = parse_secctx_fill_req(req, iter);
> +        if (err) {
> +            fuse_reply_err(req, err);
> +            return;
> +        }
> +    }
> +
>      if (req->se->op.mkdir) {
>          req->se->op.mkdir(req, nodeid, name, arg->mode);
>      } else {
> @@ -969,12 +1039,22 @@ static void do_symlink(fuse_req_t req, fuse_ino_t nodeid,
>  {
>      const char *name = fuse_mbuf_iter_advance_str(iter);
>      const char *linkname = fuse_mbuf_iter_advance_str(iter);
> +    bool secctx_enabled = req->se->conn.want & FUSE_CAP_SECURITY_CTX;
> +    int err;
>  
>      if (!name || !linkname) {
>          fuse_reply_err(req, EINVAL);
>          return;
>      }
>  
> +    if (secctx_enabled) {
> +        err = parse_secctx_fill_req(req, iter);
> +        if (err) {
> +            fuse_reply_err(req, err);
> +            return;
> +        }
> +    }
> +
>      if (req->se->op.symlink) {
>          req->se->op.symlink(req, linkname, nodeid, name);
>      } else {
> @@ -1048,6 +1128,8 @@ static void do_link(fuse_req_t req, fuse_ino_t nodeid,
>  static void do_create(fuse_req_t req, fuse_ino_t nodeid,
>                        struct fuse_mbuf_iter *iter)
>  {
> +    bool secctx_enabled = req->se->conn.want & FUSE_CAP_SECURITY_CTX;
> +
>      if (req->se->op.create) {
>          struct fuse_create_in *arg;
>          struct fuse_file_info fi;
> @@ -1060,6 +1142,15 @@ static void do_create(fuse_req_t req, fuse_ino_t nodeid,
>              return;
>          }
>  
> +        if (secctx_enabled) {
> +            int err;
> +            err = parse_secctx_fill_req(req, iter);
> +            if (err) {
> +                fuse_reply_err(req, err);
> +                return;
> +            }
> +        }
> +
>          memset(&fi, 0, sizeof(fi));
>          fi.flags = arg->flags;
>          fi.kill_priv = arg->open_flags & FUSE_OPEN_KILL_SUIDGID;
> @@ -2015,6 +2106,9 @@ static void do_init(fuse_req_t req, fuse_ino_t nodeid,
>      if (flags & FUSE_SETXATTR_EXT) {
>          se->conn.capable |= FUSE_CAP_SETXATTR_EXT;
>      }
> +    if (flags & FUSE_SECURITY_CTX) {
> +        se->conn.capable |= FUSE_CAP_SECURITY_CTX;
> +    }
>  #ifdef HAVE_SPLICE
>  #ifdef HAVE_VMSPLICE
>      se->conn.capable |= FUSE_CAP_SPLICE_WRITE | FUSE_CAP_SPLICE_MOVE;
> @@ -2154,8 +2248,14 @@ static void do_init(fuse_req_t req, fuse_ino_t nodeid,
>          outarg.flags |= FUSE_SETXATTR_EXT;
>      }
>  
> +    if (se->conn.want & FUSE_CAP_SECURITY_CTX) {
> +        /* bits 32..63 get shifted down 32 bits into the flags2 field */
> +        outarg.flags2 |= FUSE_SECURITY_CTX >> 32;
> +    }
> +
>      fuse_log(FUSE_LOG_DEBUG, "   INIT: %u.%u\n", outarg.major, outarg.minor);
> -    fuse_log(FUSE_LOG_DEBUG, "   flags=0x%08x\n", outarg.flags);
> +    fuse_log(FUSE_LOG_DEBUG, "   flags2=0x%08x flags=0x%08x\n", outarg.flags2,
> +             outarg.flags);
>      fuse_log(FUSE_LOG_DEBUG, "   max_readahead=0x%08x\n", outarg.max_readahead);
>      fuse_log(FUSE_LOG_DEBUG, "   max_write=0x%08x\n", outarg.max_write);
>      fuse_log(FUSE_LOG_DEBUG, "   max_background=%i\n", outarg.max_background);
> -- 
> 2.34.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


