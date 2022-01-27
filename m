Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0D449EB65
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 20:55:45 +0100 (CET)
Received: from localhost ([::1]:40840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDArx-0005D6-28
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 14:55:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nDAmg-0001U5-MN
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 14:50:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nDAmd-0003zo-RQ
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 14:50:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643313014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r8FCQMNdUHzZELqflB7Azpa9OgClb8PoIhZfsRwhsVs=;
 b=KYl+yQIqZB9U1oHiVzQIsL2g0jjm+eC9dQ3GMqASY+9M6+0rOwDTpBtiQeuG3rpYW01kiY
 A4GaZvTq7ABYYzWRcZSlEEYf+fVqBhOh7s8kQr3L9ggvuLoLoItQ4W8KMAm9GoULv3amwJ
 aaO55rxOAYtv3F7KzTLS5rPjQOoqJjU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-184-cjr9r9bcO8i7bE5-5Bc0tw-1; Thu, 27 Jan 2022 14:50:13 -0500
X-MC-Unique: cjr9r9bcO8i7bE5-5Bc0tw-1
Received: by mail-wm1-f71.google.com with SMTP id
 c7-20020a1c3507000000b0034a0dfc86aaso2524749wma.6
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 11:50:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=r8FCQMNdUHzZELqflB7Azpa9OgClb8PoIhZfsRwhsVs=;
 b=4aT6StlnpwtVTz35M2nlV+XYqSeCx30mnguBcuisohOb9xdZsgD4j/qXxG6p+e2pZW
 kVmuANC+1wt3dvbUKsaqnFFP27DENPcCLloY6wYWnV0gQnwFSBP8djaQ8yhm6q4aAFkj
 URxKynTcxZwGGRPtB6M3FVNxlz3LlpU0nmrElWLluomAFXyjAuOkwCubD9k1wb8+Sq9v
 wHxIAEFL7FNW5cq2qG2QsfBt2YbFylLsXcEb4BTEMvu6ed+coa3mvs0QJnkwKDerPHT4
 M8yb2SxjAYHmAInWuHRMhje+/Lt00yZZpPvkdRVCYU5X/XsUsG2x3IVh8ILDz+RT0m7i
 knag==
X-Gm-Message-State: AOAM531jaHgiErgpkp4dqt9tFw39wbf/1YoUkHUw0bBxC9uEhCfezStN
 oLEA705AagD5wxXoVawvbIhWIbwPckILQwNeaSUFB7mutKo0P21Kuxo2iddaeChLf2opf8fkk/F
 3PWCxTu4tisdSlmo=
X-Received: by 2002:a5d:4344:: with SMTP id u4mr4285922wrr.341.1643313012147; 
 Thu, 27 Jan 2022 11:50:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxDF9ahwOegZgLGieSp01FAGGFWzRSEYJ9XNUNAqKHT0LEx5kL5hyFDqoN1KkoB3RIxY687rQ==
X-Received: by 2002:a5d:4344:: with SMTP id u4mr4285910wrr.341.1643313011988; 
 Thu, 27 Jan 2022 11:50:11 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id g6sm2819668wrq.97.2022.01.27.11.50.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 11:50:11 -0800 (PST)
Date: Thu, 27 Jan 2022 19:50:09 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH v4 6/9] virtiofsd: Move core file creation code in
 separate function
Message-ID: <YfL3cXaerCHrNRA7@work-vm>
References: <20220124212455.83968-1-vgoyal@redhat.com>
 <20220124212455.83968-7-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220124212455.83968-7-vgoyal@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: virtio-fs@redhat.com, mszeredi@redhat.com, qemu-devel@nongnu.org,
 stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Vivek Goyal (vgoyal@redhat.com) wrote:
> Move core file creation bits in a separate function. Soon this is going
> to get more complex as file creation need to set security context also.
> And there will be multiple modes of file creation in next patch.
> 
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  tools/virtiofsd/passthrough_ll.c | 36 ++++++++++++++++++++++----------
>  1 file changed, 25 insertions(+), 11 deletions(-)
> 
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index 64b5b4fbb1..54978b7fae 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -1976,6 +1976,30 @@ static int lo_do_open(struct lo_data *lo, struct lo_inode *inode,
>      return 0;
>  }
>  
> +static int do_lo_create(fuse_req_t req, struct lo_inode *parent_inode,
> +                        const char *name, mode_t mode,
> +                        struct fuse_file_info *fi, int* open_fd)
> +{
> +    int err = 0, fd;
> +    struct lo_cred old = {};
> +    struct lo_data *lo = lo_data(req);
> +
> +    err = lo_change_cred(req, &old, lo->change_umask);
> +    if (err) {
> +        return err;
> +    }
> +
> +    /* Try to create a new file but don't open existing files */
> +    fd = openat(parent_inode->fd, name, fi->flags | O_CREAT | O_EXCL, mode);
> +    if (fd == -1) {
> +        err = errno;
> +    } else {
> +        *open_fd = fd;
> +    }
> +    lo_restore_cred(&old, lo->change_umask);
> +    return err;
> +}
> +
>  static void lo_create(fuse_req_t req, fuse_ino_t parent, const char *name,
>                        mode_t mode, struct fuse_file_info *fi)
>  {
> @@ -1985,7 +2009,6 @@ static void lo_create(fuse_req_t req, fuse_ino_t parent, const char *name,
>      struct lo_inode *inode = NULL;
>      struct fuse_entry_param e;
>      int err;
> -    struct lo_cred old = {};
>  
>      fuse_log(FUSE_LOG_DEBUG, "lo_create(parent=%" PRIu64 ", name=%s)"
>               " kill_priv=%d\n", parent, name, fi->kill_priv);
> @@ -2001,18 +2024,9 @@ static void lo_create(fuse_req_t req, fuse_ino_t parent, const char *name,
>          return;
>      }
>  
> -    err = lo_change_cred(req, &old, lo->change_umask);
> -    if (err) {
> -        goto out;
> -    }
> -
>      update_open_flags(lo->writeback, lo->allow_direct_io, fi);
>  
> -    /* Try to create a new file but don't open existing files */
> -    fd = openat(parent_inode->fd, name, fi->flags | O_CREAT | O_EXCL, mode);
> -    err = fd == -1 ? errno : 0;
> -
> -    lo_restore_cred(&old, lo->change_umask);
> +    err = do_lo_create(req, parent_inode, name, mode, fi, &fd);
>  
>      /* Ignore the error if file exists and O_EXCL was not given */
>      if (err && (err != EEXIST || (fi->flags & O_EXCL))) {
> -- 
> 2.31.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


