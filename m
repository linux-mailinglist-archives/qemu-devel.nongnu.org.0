Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA6A4A8F7A
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 22:02:32 +0100 (CET)
Received: from localhost ([::1]:50144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFjFP-0001cK-E7
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 16:02:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nFhzR-0006Hy-SK
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 14:41:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nFhzF-0007VP-KZ
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 14:41:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643917293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zioCFfhB+yy9JYixTQG5IpQzjPuLo8H5vjk1G4vbIyM=;
 b=DXZfEjfMj2PAp/8uEvEf6eEH/4OzAIsEnIkqZXHD2U3sELEoKrVgOJ2Vh0hebObPHF4psU
 45R9YtC8DN36bvaBoTae5+O6OtW6HSQwJZGy3fmISOljWkY+wGNl52OlcdS63HMrEPe4eQ
 3UQMVQIiLXm3EGKUNwN0xboKqlfOJ50=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-Dxe-i6erNx6_WOSTUnyfFQ-1; Thu, 03 Feb 2022 14:41:31 -0500
X-MC-Unique: Dxe-i6erNx6_WOSTUnyfFQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 o26-20020adfa11a000000b001dd1d3a73c7so1079028wro.21
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 11:41:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zioCFfhB+yy9JYixTQG5IpQzjPuLo8H5vjk1G4vbIyM=;
 b=v0sCnJMtED8Q6Cq1gROwbn6yLMlaOF/RO9eCjtdd3Ost0z3uEBbGcJ9/AzUhxOkqFD
 +4GJ++P6BA+NLAVvmy9ClwETwHGzD3ZqlVTXvBeh8Vtk1D7flSMz0QEkfNZTQJFROO0P
 qbfIv6xOGWAFI2F7A0IVOy06hufv108eIA97ki2qLH195pzVcezWwL6raX23S85VhfUq
 ZB13KrpZsiUC0K8AEPx45k3XU3eN9tT/xX6903+U7OhuLKa33JzPE7Cf1+Clzai95rBY
 PHdXheBwmIrserksjqGp3VbCbXKLSf+0JiIeib4S+xMGa5/B6163xBwvqyOsDsDS2U4p
 H99g==
X-Gm-Message-State: AOAM532J25sR83TEHjJIKkE6O+TwjX9vogsO5O7vGFPUZHJKv1O5vn0g
 Sb8RodmhdSheZw8xdN7weUjc53t2nF81p6u86NtP67E8fbveNGG2NECeui38OiELgmozSRSBbkl
 mo2MIifE+eYU0aNY=
X-Received: by 2002:a1c:2b06:: with SMTP id r6mr11734772wmr.4.1643917290402;
 Thu, 03 Feb 2022 11:41:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxLg1xyt8HRjHJGF1422EIh5Nb4SWAeuQ78vo3wmfmUQt3XzjmfO2RZ4qxMfvqof1LHjxcftQ==
X-Received: by 2002:a1c:2b06:: with SMTP id r6mr11734756wmr.4.1643917290108;
 Thu, 03 Feb 2022 11:41:30 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id v124sm8082701wme.30.2022.02.03.11.41.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 11:41:29 -0800 (PST)
Date: Thu, 3 Feb 2022 19:41:27 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH v5 5/9] virtiofsd, fuse_lowlevel.c: Add capability to
 parse security context
Message-ID: <Yfwv5wDFb3OcTEtH@work-vm>
References: <20220202193935.268777-1-vgoyal@redhat.com>
 <20220202193935.268777-6-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220202193935.268777-6-vgoyal@redhat.com>
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
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
Cc: virtio-fs@redhat.com, mszeredi@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Vivek Goyal (vgoyal@redhat.com) wrote:
> Add capability to enable and parse security context as sent by client
> and put into fuse_req. Filesystems now can get security context from
> request and set it on files during creation.
> 
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> ---
>  tools/virtiofsd/fuse_common.h   |  5 ++
>  tools/virtiofsd/fuse_i.h        |  7 +++
>  tools/virtiofsd/fuse_lowlevel.c | 95 ++++++++++++++++++++++++++++++++-
>  3 files changed, 106 insertions(+), 1 deletion(-)
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
> index 83d29762a4..cd9ef97b3c 100644
> --- a/tools/virtiofsd/fuse_lowlevel.c
> +++ b/tools/virtiofsd/fuse_lowlevel.c
> @@ -886,11 +886,59 @@ static void do_readlink(fuse_req_t req, fuse_ino_t nodeid,
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

Are there any sanity checks to be done on fsecctx->size?

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

It's OK to use the pointers into the iter here rather than take copies?

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
> @@ -901,6 +949,13 @@ static void do_mknod(fuse_req_t req, fuse_ino_t nodeid,
>  
>      req->ctx.umask = arg->umask;
>  
> +    if (secctx_enabled) {
> +        err = parse_secctx_fill_req(req, iter);
> +        if (err) {
> +            fuse_reply_err(req, -err);

return ?

> +        }
> +    }
> +
>      if (req->se->op.mknod) {
>          req->se->op.mknod(req, nodeid, name, arg->mode, arg->rdev);
>      } else {
> @@ -913,6 +968,8 @@ static void do_mkdir(fuse_req_t req, fuse_ino_t nodeid,
>  {
>      struct fuse_mkdir_in *arg;
>      const char *name;
> +    bool secctx_enabled = req->se->conn.want & FUSE_CAP_SECURITY_CTX;
> +    int err;
>  
>      arg = fuse_mbuf_iter_advance(iter, sizeof(*arg));
>      name = fuse_mbuf_iter_advance_str(iter);
> @@ -923,6 +980,13 @@ static void do_mkdir(fuse_req_t req, fuse_ino_t nodeid,
>  
>      req->ctx.umask = arg->umask;
>  
> +    if (secctx_enabled) {
> +        err = parse_secctx_fill_req(req, iter);
> +        if (err) {
> +            fuse_reply_err(req, err);
return ?
> +        }
> +    }
> +
>      if (req->se->op.mkdir) {
>          req->se->op.mkdir(req, nodeid, name, arg->mode);
>      } else {
> @@ -969,12 +1033,21 @@ static void do_symlink(fuse_req_t req, fuse_ino_t nodeid,
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
return ?
> +        }
> +    }
> +
>      if (req->se->op.symlink) {
>          req->se->op.symlink(req, linkname, nodeid, name);
>      } else {
> @@ -1048,6 +1121,8 @@ static void do_link(fuse_req_t req, fuse_ino_t nodeid,
>  static void do_create(fuse_req_t req, fuse_ino_t nodeid,
>                        struct fuse_mbuf_iter *iter)
>  {
> +    bool secctx_enabled = req->se->conn.want & FUSE_CAP_SECURITY_CTX;
> +
>      if (req->se->op.create) {
>          struct fuse_create_in *arg;
>          struct fuse_file_info fi;
> @@ -1060,6 +1135,15 @@ static void do_create(fuse_req_t req, fuse_ino_t nodeid,
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
> @@ -2016,6 +2100,9 @@ static void do_init(fuse_req_t req, fuse_ino_t nodeid,
>      if (flags & FUSE_SETXATTR_EXT) {
>          se->conn.capable |= FUSE_CAP_SETXATTR_EXT;
>      }
> +    if (flags & FUSE_SECURITY_CTX) {
> +        se->conn.capable |= FUSE_CAP_SECURITY_CTX;
> +    }
>  #ifdef HAVE_SPLICE
>  #ifdef HAVE_VMSPLICE
>      se->conn.capable |= FUSE_CAP_SPLICE_WRITE | FUSE_CAP_SPLICE_MOVE;
> @@ -2155,8 +2242,14 @@ static void do_init(fuse_req_t req, fuse_ino_t nodeid,
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


