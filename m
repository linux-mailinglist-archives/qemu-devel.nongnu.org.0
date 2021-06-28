Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 417F93B6307
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 16:48:52 +0200 (CEST)
Received: from localhost ([::1]:42250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxsZ9-0007eM-AL
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 10:48:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lxsXG-0005v2-Ez
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 10:46:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lxsX9-0007Pv-B6
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 10:46:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624891606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PiHx6vUMMwCfkufGCsozqSNXpKVx9AO7m3rGkIUYunU=;
 b=Q3d0lCIWVJnGrdwGYVT62oacu80FcULgw3cHkfAqe6SU8rgKeuosJxdU8WgVrkVB2ivtsC
 +p0KXnr7j8IT61Pk1VG1l8nWmuTjcBM78GcpPpHXX5WKW78JtNCu+4g55jsPDpBBLI5UYM
 cq+Z+HJxEsb8xu2PBb5xnoMN5d9MQw8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-fLMqfl8_MpiAKF2R6ct9yw-1; Mon, 28 Jun 2021 10:46:44 -0400
X-MC-Unique: fLMqfl8_MpiAKF2R6ct9yw-1
Received: by mail-wm1-f72.google.com with SMTP id
 r204-20020a1c44d50000b02901e993531cf2so72942wma.7
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 07:46:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=PiHx6vUMMwCfkufGCsozqSNXpKVx9AO7m3rGkIUYunU=;
 b=isXefgopc04u4LSrOQ8HHAgGTUiTA/HacvJ0KiT8DtXPBOkdlh8FSVN3l5cHZEout9
 YoNk8EzpKlkNTJR+0lx9PIv/odlp5I77rAMJJ/+o8BpOssxVhopHxLKXRqpb1s729JYg
 IVfxyBqt/pu66NHMWnDe5ulhGrL5fg6idnYp28kdhqljX+W5ecBBcSeXjIS7CMy5H4mQ
 ypTdDW3AkE+bG0bQBfq7E1GbdkeF7xVElcZ+V2jaJbGVeR1R2oDe+eva/FpNVfrFj+kI
 oEEM6ivap6HcodfGyjzJrFcrnrolmlrvPFlf+eMvaYTk8ofrGwth6xleaeBJ1J+MnOi3
 2Qcw==
X-Gm-Message-State: AOAM532EVji8D8Z2Nk+rgkMGX37gCcDlUCGDdfDLmUjaUkSOzFLapW47
 EKE9TqxWD6fWRmN0HT6Zq/A7T2Lbx+2lTUy/e6oxbkOpt9sJHWz3b7ciNABcnnzFVejkkWHDoQS
 ECapalCTkCTHjbdA=
X-Received: by 2002:adf:fb92:: with SMTP id a18mr27702938wrr.182.1624891603468; 
 Mon, 28 Jun 2021 07:46:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJv7VTNjBFGFkSMwJxUMGN6bLfZNXgLIWYSf9ZfVD+JrErnZICWQQMKsGi8CUUt0jpzRfSkA==
X-Received: by 2002:adf:fb92:: with SMTP id a18mr27702916wrr.182.1624891603249; 
 Mon, 28 Jun 2021 07:46:43 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id t16sm20575603wmi.2.2021.06.28.07.46.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 07:46:42 -0700 (PDT)
Date: Mon, 28 Jun 2021 15:46:40 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH v7 1/7] virtiofsd: Fix fuse setxattr() API change issue
Message-ID: <YNng0CPIFHxDIE3a@work-vm>
References: <20210622150852.1507204-1-vgoyal@redhat.com>
 <20210622150852.1507204-2-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210622150852.1507204-2-vgoyal@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
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
> With kernel header updates fuse_setxattr_in struct has grown in size.
> But this new struct size only takes affect if user has opted in
> for fuse feature FUSE_SETXATTR_EXT otherwise fuse continues to
> send "fuse_setxattr_in" of older size. Older size is determined
> by FUSE_COMPAT_SETXATTR_IN_SIZE.
> 
> Fix this. If we have not opted in for FUSE_SETXATTR_EXT, then
> expect that we will get fuse_setxattr_in of size FUSE_COMPAT_SETXATTR_IN_SIZE
> and not sizeof(struct fuse_sexattr_in).
> 
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>

Yeh it's a bit of a grim fix, but I think it's the best we can do, and
we need to get it in since the headers have already been merged.
(I don't think libfuse has a fix for this in yet itself, but it might
survive because it doesn't bother copying the data like we do with
mbuf).


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  tools/virtiofsd/fuse_common.h   | 5 +++++
>  tools/virtiofsd/fuse_lowlevel.c | 7 ++++++-
>  2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/virtiofsd/fuse_common.h b/tools/virtiofsd/fuse_common.h
> index fa9671872e..0c2665b977 100644
> --- a/tools/virtiofsd/fuse_common.h
> +++ b/tools/virtiofsd/fuse_common.h
> @@ -372,6 +372,11 @@ struct fuse_file_info {
>   */
>  #define FUSE_CAP_HANDLE_KILLPRIV_V2 (1 << 28)
>  
> +/**
> + * Indicates that file server supports extended struct fuse_setxattr_in
> + */
> +#define FUSE_CAP_SETXATTR_EXT (1 << 29)
> +
>  /**
>   * Ioctl flags
>   *
> diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowlevel.c
> index 7fe2cef1eb..c2b6ff1686 100644
> --- a/tools/virtiofsd/fuse_lowlevel.c
> +++ b/tools/virtiofsd/fuse_lowlevel.c
> @@ -1419,8 +1419,13 @@ static void do_setxattr(fuse_req_t req, fuse_ino_t nodeid,
>      struct fuse_setxattr_in *arg;
>      const char *name;
>      const char *value;
> +    bool setxattr_ext = req->se->conn.want & FUSE_CAP_SETXATTR_EXT;
>  
> -    arg = fuse_mbuf_iter_advance(iter, sizeof(*arg));
> +    if (setxattr_ext) {
> +        arg = fuse_mbuf_iter_advance(iter, sizeof(*arg));
> +    } else {
> +        arg = fuse_mbuf_iter_advance(iter, FUSE_COMPAT_SETXATTR_IN_SIZE);
> +    }
>      name = fuse_mbuf_iter_advance_str(iter);
>      if (!arg || !name) {
>          fuse_reply_err(req, EINVAL);
> -- 
> 2.25.4
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


