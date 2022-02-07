Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8DD4ABE8F
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 13:25:51 +0100 (CET)
Received: from localhost ([::1]:54310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH35a-00078R-Js
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 07:25:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nH33u-0006N9-Nl
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 07:24:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nH33r-0001tj-1H
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 07:24:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644236641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k0PEBSxsuHU6K9DFv00S1pbmAreKWZjfdaIUvfisETM=;
 b=PELOgXIAyt1+7tNz3sPrzg29Bw1RGwdomwofuKsJuU8T/BH49mUZ9bFI8eW3CZPfy14u0l
 GbYl0nIJEJSS0qnDFSLFuUhKGYxSumJSTd0Cx1fdDrgnEWDwVKXjAPzy/aTtcBMPUTpVnV
 qTlLxOh0G+Gn92yG70r0X7a/v7o/tB4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-84-ko2UcvY6OVKB6hYuhnDXdA-1; Mon, 07 Feb 2022 07:24:00 -0500
X-MC-Unique: ko2UcvY6OVKB6hYuhnDXdA-1
Received: by mail-wm1-f72.google.com with SMTP id
 l16-20020a7bcf10000000b0034ffdd81e7aso5581940wmg.4
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 04:24:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=k0PEBSxsuHU6K9DFv00S1pbmAreKWZjfdaIUvfisETM=;
 b=t+wg5Qly3S4aZ0/Tzehv1gGA3R1ANMax0tUf2D/nU9tjSfhd+GAkUPb6bi2nTTk/q9
 9pJnPRe3gH1K4MC/zsEU9++wtJFK6HSGjDwYcCkYyQAFRMtS6qmOrxG7NkugougNXnYd
 pbsOpvWWkHFQrtLhPzA1LwWb9Rk0tIVzPUXmXKS/fw9NMnI9Q/FFUExkvCchgZYqO+rk
 fSnp9C3ALhwKYe09LnfJAqzgfzWlliNICmtySw7XHfbXx7b/Fucnw7bF/JWRw1gKfub4
 RNVhvAqL6b23VV8wyK5pIDJ8ues+aTIX2XTKE8/y2dzTccIaIe3ENHkl/uiVvCIdeFhT
 6UUA==
X-Gm-Message-State: AOAM530AFCfujs+eIgBmk9+WaKFtaRGHosoXruld3DgCl+jBWky3W0Bx
 nY9tEXyVXIE1QnfRbZv4phs9fEO42taOU20hXXrVKslnUpKjpOnSwtECxOX+UtnQGt1qhOGmMMr
 Bnu2Dp1OvNDGYShw=
X-Received: by 2002:a5d:458d:: with SMTP id p13mr10118474wrq.580.1644236639431; 
 Mon, 07 Feb 2022 04:23:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxOAPfSA5UnaqsBDnBDpUQxWh4ofJcYJkor5ybGSlgw9vsNrFI0YWGAZCqtdRySv2C1p+BSQA==
X-Received: by 2002:a5d:458d:: with SMTP id p13mr10118458wrq.580.1644236639196; 
 Mon, 07 Feb 2022 04:23:59 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id l10sm9742290wrz.20.2022.02.07.04.23.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 04:23:58 -0800 (PST)
Date: Mon, 7 Feb 2022 12:23:56 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH v5 8/9] virtiofsd: Create new file using O_TMPFILE and
 set security context
Message-ID: <YgEPXBy6bPfCPjc1@work-vm>
References: <20220202193935.268777-1-vgoyal@redhat.com>
 <20220202193935.268777-9-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220202193935.268777-9-vgoyal@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
> If guest and host policies can't work with each other, then guest security
> context (selinux label) needs to be set into an xattr. Say remap guest
> security.selinux xattr to trusted.virtiofs.security.selinux.
> 
> That means setting "fscreate" is not going to help as that's ony useful
> for security.selinux xattr on host.
> 
> So we need another method which is atomic. Use O_TMPFILE to create new
> file, set xattr and then linkat() to proper place.
> 
> But this works only for regular files. So dir, symlinks will continue
> to be non-atomic.
> 
> Also if host filesystem does not support O_TMPFILE, we fallback to
> non-atomic behavior.
> 
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  tools/virtiofsd/passthrough_ll.c | 80 ++++++++++++++++++++++++++++----
>  1 file changed, 72 insertions(+), 8 deletions(-)
> 
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index acb99aa2fc..43c9b6dbe5 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -2153,14 +2153,29 @@ static int lo_do_open(struct lo_data *lo, struct lo_inode *inode,
>  
>  static int do_create_nosecctx(fuse_req_t req, struct lo_inode *parent_inode,
>                                 const char *name, mode_t mode,
> -                               struct fuse_file_info *fi, int *open_fd)
> +                               struct fuse_file_info *fi, int *open_fd,
> +                              bool tmpfile)
>  {
>      int err, fd;
>      struct lo_cred old = {};
>      struct lo_data *lo = lo_data(req);
>      int flags;
>  
> -    flags = fi->flags | O_CREAT | O_EXCL;
> +    if (tmpfile) {
> +        flags = fi->flags | O_TMPFILE;
> +        /*
> +         * Don't use O_EXCL as we want to link file later. Also reset O_CREAT
> +         * otherwise openat() returns -EINVAL.
> +         */
> +        flags &= ~(O_CREAT | O_EXCL);
> +
> +        /* O_TMPFILE needs either O_RDWR or O_WRONLY */
> +        if ((flags & O_ACCMODE) == O_RDONLY) {
> +            flags |= O_RDWR;
> +        }
> +    } else {
> +        flags = fi->flags | O_CREAT | O_EXCL;
> +    }
>  
>      err = lo_change_cred(req, &old, lo->change_umask);
>      if (err) {
> @@ -2191,7 +2206,7 @@ static int do_create_secctx_fscreate(fuse_req_t req,
>          return err;
>      }
>  
> -    err = do_create_nosecctx(req, parent_inode, name, mode, fi, &fd);
> +    err = do_create_nosecctx(req, parent_inode, name, mode, fi, &fd, false);
>  
>      close_reset_proc_fscreate(fscreate_fd);
>      if (!err) {
> @@ -2200,6 +2215,44 @@ static int do_create_secctx_fscreate(fuse_req_t req,
>      return err;
>  }
>  
> +static int do_create_secctx_tmpfile(fuse_req_t req,
> +                                    struct lo_inode *parent_inode,
> +                                    const char *name, mode_t mode,
> +                                    struct fuse_file_info *fi,
> +                                    const char *secctx_name, int *open_fd)
> +{
> +    int err, fd = -1;
> +    struct lo_data *lo = lo_data(req);
> +    char procname[64];
> +
> +    err = do_create_nosecctx(req, parent_inode, ".", mode, fi, &fd, true);
> +    if (err) {
> +        return err;
> +    }
> +
> +    err = fsetxattr(fd, secctx_name, req->secctx.ctx, req->secctx.ctxlen, 0);
> +    if (err) {
> +        err = errno;
> +        goto out;
> +    }
> +
> +    /* Security context set on file. Link it in place */
> +    sprintf(procname, "%d", fd);
> +    FCHDIR_NOFAIL(lo->proc_self_fd);
> +    err = linkat(AT_FDCWD, procname, parent_inode->fd, name,
> +                 AT_SYMLINK_FOLLOW);
> +    err = err == -1 ? errno : 0;
> +    FCHDIR_NOFAIL(lo->root.fd);
> +
> +out:
> +    if (!err) {
> +        *open_fd = fd;
> +    } else if (fd != -1) {
> +        close(fd);
> +    }
> +    return err;
> +}
> +
>  static int do_create_secctx_noatomic(fuse_req_t req,
>                                       struct lo_inode *parent_inode,
>                                       const char *name, mode_t mode,
> @@ -2208,7 +2261,7 @@ static int do_create_secctx_noatomic(fuse_req_t req,
>  {
>      int err = 0, fd = -1;
>  
> -    err = do_create_nosecctx(req, parent_inode, name, mode, fi, &fd);
> +    err = do_create_nosecctx(req, parent_inode, name, mode, fi, &fd, false);
>      if (err) {
>          goto out;
>      }
> @@ -2250,20 +2303,31 @@ static int do_lo_create(fuse_req_t req, struct lo_inode *parent_inode,
>      if (secctx_enabled) {
>          /*
>           * If security.selinux has not been remapped and selinux is enabled,
> -         * use fscreate to set context before file creation.
> -         * Otherwise fallback to non-atomic method of file creation
> -         * and xattr settting.
> +         * use fscreate to set context before file creation. If not, use
> +         * tmpfile method for regular files. Otherwise fallback to
> +         * non-atomic method of file creation and xattr settting.
>           */
>          if (!mapped_name && lo->use_fscreate) {
>              err = do_create_secctx_fscreate(req, parent_inode, name, mode, fi,
>                                              open_fd);
>              goto out;
> +        } else if (S_ISREG(mode)) {
> +            err = do_create_secctx_tmpfile(req, parent_inode, name, mode, fi,
> +                                           ctxname, open_fd);
> +            /*
> +             * If filesystem does not support O_TMPFILE, fallback to non-atomic
> +             * method.
> +             */
> +            if (!err || err != EOPNOTSUPP) {
> +                goto out;
> +            }
>          }
>  
>          err = do_create_secctx_noatomic(req, parent_inode, name, mode, fi,
>                                          ctxname, open_fd);
>      } else {
> -        err = do_create_nosecctx(req, parent_inode, name, mode, fi, open_fd);
> +        err = do_create_nosecctx(req, parent_inode, name, mode, fi, open_fd,
> +                                 false);
>      }
>  
>  out:
> -- 
> 2.34.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


