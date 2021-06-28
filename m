Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B06503B65B0
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 17:33:17 +0200 (CEST)
Received: from localhost ([::1]:43054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxtG8-0005ja-F3
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 11:33:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lxtEX-00049e-Vg
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 11:31:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lxtEU-0002uU-PN
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 11:31:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624894293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oSgYlYDZ0wGh0prikGzKon9Ucoj4jFQlYxbmmxHyGE0=;
 b=h7DjmhL57lEp2RF8Ry6R7qbIaASe5N6d+CjZKF/LAEXrDQAcnICaPNPhv/xRuKdhqntk+w
 1nR+1F06jqcDEu7pBrqU/bNd3DP5scPBOp5IpUCviQOT/0yP3la0kb2T/zjF1WIt9sW1cT
 f5PvMBYabbAQVbj0eVOlcVujW/Go1dM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-09BbkVk7OTixqyrOCg9YEA-1; Mon, 28 Jun 2021 11:31:31 -0400
X-MC-Unique: 09BbkVk7OTixqyrOCg9YEA-1
Received: by mail-wm1-f72.google.com with SMTP id
 p22-20020a7bcc960000b02901de8f2ae18aso130221wma.8
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 08:31:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=oSgYlYDZ0wGh0prikGzKon9Ucoj4jFQlYxbmmxHyGE0=;
 b=mkoVoS3178/T177nmbN7gpfAWegf3O/WJwZwgKG7BDKgbd+zBd8vOrrTkHrKIBY6T9
 jmtkDYER5WWdUByaSnuHns03LHewIMFp/6vqB1SZJInqfbbO9Q24akYEfpDRFqLSiBSz
 u6ZIhnj7Sxutk446YAPm9cT+Mmsn74GMKTkjYRS1VYkn+cfHTKsaLSZ6bmlyQHSJzNnv
 oaeOqk2jyLRIzpIUnES6gchRkACotCFXN6c2tUlVbDG+yFwXX1FWvvj7rEYvWr/cc9G8
 2DflQA6+iowVHcwT4fT5tyAPd8zqFI2QFw+f1zzywMvmBCj2I2Jpe9DX3P7sGjKWkQer
 2SdA==
X-Gm-Message-State: AOAM530fY7ceqLa87SH+QDgfzKvZGmmu5hzHXfRuJmXL8gWGJntw/Mnp
 14Wl8xEWWl/uHnD2WzKs1wavT7MsMpZUr/xyk1C2u1P2vHEGAsWNIKvbPMe97NKYwjrg/T+RYnQ
 ty6G52RGwIyLa+ic=
X-Received: by 2002:a1c:7219:: with SMTP id n25mr26774420wmc.3.1624894290607; 
 Mon, 28 Jun 2021 08:31:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyh7Q8G39Wk/A7ne/EPIZXyErGH+Zay01UgSXA3PGz+BpNEE00NyYNpGdCpY+GHVH+K2T0A7g==
X-Received: by 2002:a1c:7219:: with SMTP id n25mr26774398wmc.3.1624894290412; 
 Mon, 28 Jun 2021 08:31:30 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id f9sm1605939wrm.48.2021.06.28.08.31.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 08:31:29 -0700 (PDT)
Date: Mon, 28 Jun 2021 16:31:27 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH v7 2/7] virtiofsd: Fix xattr operations overwriting errno
Message-ID: <YNnrT/mCw3w26/lT@work-vm>
References: <20210622150852.1507204-1-vgoyal@redhat.com>
 <20210622150852.1507204-3-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210622150852.1507204-3-vgoyal@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.375,
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
Cc: virtio-fs@redhat.com, miklos@szeredi.hu, qemu-devel@nongnu.org,
 lhenriques@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Vivek Goyal (vgoyal@redhat.com) wrote:
> getxattr/setxattr/removexattr/listxattr operations handle regualar
> and non-regular files differently. For the case of non-regular files
> we do fchdir(/proc/self/fd) and the xattr operation and then revert
> back to original working directory. After this we are saving errno
> and that's buggy because fchdir() will overwrite the errno.
> 
> FCHDIR_NOFAIL(lo->proc_self_fd);
> ret = getxattr(procname, name, value, size);
> FCHDIR_NOFAIL(lo->root.fd);
> 
> if (ret == -1)
>     saverr = errno
> 
> In above example, if getxattr() failed, we will still return 0 to caller
> as errno must have been written by FCHDIR_NOFAIL(lo->root.fd) call.
> Fix all such instances and capture "errno" early and save in "saverr"
> variable.
> 
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>

I think the existing code is actually safe; I don't think fchdir
will/should set errno unless there's an error, and we're explictly
asserting there isn't one.

However, I do prefer doing this save since we already have the save
variables and it makes the chance of screwing it up from any other
forgotten syscall less likely, so


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  tools/virtiofsd/passthrough_ll.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index 49c21fd855..ec91b3c133 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -2791,15 +2791,17 @@ static void lo_getxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
>              goto out_err;
>          }
>          ret = fgetxattr(fd, name, value, size);
> +        saverr = ret == -1 ? errno : 0;
>      } else {
>          /* fchdir should not fail here */
>          FCHDIR_NOFAIL(lo->proc_self_fd);
>          ret = getxattr(procname, name, value, size);
> +        saverr = ret == -1 ? errno : 0;
>          FCHDIR_NOFAIL(lo->root.fd);
>      }
>  
>      if (ret == -1) {
> -        goto out_err;
> +        goto out;
>      }
>      if (size) {
>          saverr = 0;
> @@ -2864,15 +2866,17 @@ static void lo_listxattr(fuse_req_t req, fuse_ino_t ino, size_t size)
>              goto out_err;
>          }
>          ret = flistxattr(fd, value, size);
> +        saverr = ret == -1 ? errno : 0;
>      } else {
>          /* fchdir should not fail here */
>          FCHDIR_NOFAIL(lo->proc_self_fd);
>          ret = listxattr(procname, value, size);
> +        saverr = ret == -1 ? errno : 0;
>          FCHDIR_NOFAIL(lo->root.fd);
>      }
>  
>      if (ret == -1) {
> -        goto out_err;
> +        goto out;
>      }
>      if (size) {
>          saverr = 0;
> @@ -2998,15 +3002,15 @@ static void lo_setxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
>              goto out;
>          }
>          ret = fsetxattr(fd, name, value, size, flags);
> +        saverr = ret == -1 ? errno : 0;
>      } else {
>          /* fchdir should not fail here */
>          FCHDIR_NOFAIL(lo->proc_self_fd);
>          ret = setxattr(procname, name, value, size, flags);
> +        saverr = ret == -1 ? errno : 0;
>          FCHDIR_NOFAIL(lo->root.fd);
>      }
>  
> -    saverr = ret == -1 ? errno : 0;
> -
>  out:
>      if (fd >= 0) {
>          close(fd);
> @@ -3064,15 +3068,15 @@ static void lo_removexattr(fuse_req_t req, fuse_ino_t ino, const char *in_name)
>              goto out;
>          }
>          ret = fremovexattr(fd, name);
> +        saverr = ret == -1 ? errno : 0;
>      } else {
>          /* fchdir should not fail here */
>          FCHDIR_NOFAIL(lo->proc_self_fd);
>          ret = removexattr(procname, name);
> +        saverr = ret == -1 ? errno : 0;
>          FCHDIR_NOFAIL(lo->root.fd);
>      }
>  
> -    saverr = ret == -1 ? errno : 0;
> -
>  out:
>      if (fd >= 0) {
>          close(fd);
> -- 
> 2.25.4
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


