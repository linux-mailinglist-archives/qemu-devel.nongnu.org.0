Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5249D3B6613
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 17:50:07 +0200 (CEST)
Received: from localhost ([::1]:34344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxtWQ-0002bn-5E
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 11:50:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lxtVX-0001x8-5X
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 11:49:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lxtVU-00068T-EH
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 11:49:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624895347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BeBeHVr5QHOLg/CSfMbTluQDVS9JEQfwmZYCS+FcIHA=;
 b=ZatEphcllJywbh2unEGJu+n4mLUHpCImtifS6hUULyxO5yqxBn8vtjSlT3ZVF21Tzo5EDR
 BwbXoICvBSH1vfaAzJpx60SpceOgwFH/9G42adow7mZU0A6wq9WZInMvTp+R92b2To1UGh
 oBBSKG/NMkQ1ZNJqaxCSBFwxpq4m3TY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-AuPAvxqvOkSgNE7DxwUWRA-1; Mon, 28 Jun 2021 11:49:06 -0400
X-MC-Unique: AuPAvxqvOkSgNE7DxwUWRA-1
Received: by mail-wr1-f71.google.com with SMTP id
 b3-20020a05600018a3b029011a84f85e1cso4787664wri.10
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 08:49:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=BeBeHVr5QHOLg/CSfMbTluQDVS9JEQfwmZYCS+FcIHA=;
 b=BL7h0341rRQ1hrCqPKnBy0gEv/BUfSm2uA+vk/y24JA5uMYOxLrk8oHBckvd3caKaE
 DtkhEt490JwzYvX8jYR9UgkX29Wn9FwfS8QG/w/ZqETudNyeDICBLkuX52v81uRhTFf0
 X9/haY8A+R1tvuKRMCeQIh6/UBColC+TBk+F0C14qJeJ6gzTuNW8Dv4RFC0NKAa6csyA
 qb/AKtKyU832FGcGEajJ2bPJFAGKhMwFxj+03K9qmUVmoE9Swe37ocDpogm9QzVyABfV
 miFPhYJPzb5aS/2DAlqy0aNFMDTy+PXQn8dYduQ6lTui5fdJRnMdm5hnknjQ4cjNcWb9
 io8Q==
X-Gm-Message-State: AOAM530CKOcIu/oENxM62qSmmVPFLytmgHHby6bqV7PqLJSgDtA6kY/d
 EMrG+pu4CzNCqd3fE7ueAHLubq5l7pKp1Cd/Q17iK68A6ddOdq2WFU+vlWT7zcuucF/VYacklL1
 t4GWADvQQvoWH7ww=
X-Received: by 2002:a1c:9d10:: with SMTP id g16mr8651044wme.108.1624895345024; 
 Mon, 28 Jun 2021 08:49:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxomz/O5HbIOtiF/dguK9NK/Rcr5QGSOywLtj7Z6BGz1TWCqZrHQh4nhtU6FaMnE3XRKtxRRQ==
X-Received: by 2002:a1c:9d10:: with SMTP id g16mr8651013wme.108.1624895344736; 
 Mon, 28 Jun 2021 08:49:04 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id d12sm12322167wri.77.2021.06.28.08.49.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 08:49:04 -0700 (PDT)
Date: Mon, 28 Jun 2021 16:49:02 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH v7 3/7] virtiofsd: Add support for extended setxattr
Message-ID: <YNnvbneBCm4GYRP9@work-vm>
References: <20210622150852.1507204-1-vgoyal@redhat.com>
 <20210622150852.1507204-4-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210622150852.1507204-4-vgoyal@redhat.com>
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
> Add the bits to enable support for setxattr_ext if fuse offers it. Do not
> enable it by default yet. Let passthrough_ll opt-in. Enabling it by deafult
> kind of automatically means that you are taking responsibility of clearing
> SGID if ACL is set.
> 
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> ---
>  tools/virtiofsd/fuse_common.h    |  5 +++++
>  tools/virtiofsd/fuse_lowlevel.c  | 11 ++++++++++-
>  tools/virtiofsd/fuse_lowlevel.h  |  3 ++-
>  tools/virtiofsd/passthrough_ll.c |  3 ++-
>  4 files changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/virtiofsd/fuse_common.h b/tools/virtiofsd/fuse_common.h
> index 0c2665b977..8abac80098 100644
> --- a/tools/virtiofsd/fuse_common.h
> +++ b/tools/virtiofsd/fuse_common.h
> @@ -377,6 +377,11 @@ struct fuse_file_info {
>   */
>  #define FUSE_CAP_SETXATTR_EXT (1 << 29)
>  
> +/**
> + * Indicates that file server supports extended struct fuse_setxattr_in
> + */
> +#define FUSE_CAP_SETXATTR_EXT (1 << 29)
> +

You already added that in 1/7 - but other than that, 


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

>  /**
>   * Ioctl flags
>   *
> diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowlevel.c
> index c2b6ff1686..d1e24c013f 100644
> --- a/tools/virtiofsd/fuse_lowlevel.c
> +++ b/tools/virtiofsd/fuse_lowlevel.c
> @@ -1439,7 +1439,9 @@ static void do_setxattr(fuse_req_t req, fuse_ino_t nodeid,
>      }
>  
>      if (req->se->op.setxattr) {
> -        req->se->op.setxattr(req, nodeid, name, value, arg->size, arg->flags);
> +        uint32_t setxattr_flags = setxattr_ext ? arg->setxattr_flags : 0;
> +        req->se->op.setxattr(req, nodeid, name, value, arg->size, arg->flags,
> +                             setxattr_flags);
>      } else {
>          fuse_reply_err(req, ENOSYS);
>      }
> @@ -1986,6 +1988,9 @@ static void do_init(fuse_req_t req, fuse_ino_t nodeid,
>      if (arg->flags & FUSE_HANDLE_KILLPRIV_V2) {
>          se->conn.capable |= FUSE_CAP_HANDLE_KILLPRIV_V2;
>      }
> +    if (arg->flags & FUSE_SETXATTR_EXT) {
> +        se->conn.capable |= FUSE_CAP_SETXATTR_EXT;
> +    }
>  #ifdef HAVE_SPLICE
>  #ifdef HAVE_VMSPLICE
>      se->conn.capable |= FUSE_CAP_SPLICE_WRITE | FUSE_CAP_SPLICE_MOVE;
> @@ -2121,6 +2126,10 @@ static void do_init(fuse_req_t req, fuse_ino_t nodeid,
>          outarg.flags |= FUSE_HANDLE_KILLPRIV_V2;
>      }
>  
> +    if (se->conn.want & FUSE_CAP_SETXATTR_EXT) {
> +        outarg.flags |= FUSE_SETXATTR_EXT;
> +    }
> +
>      fuse_log(FUSE_LOG_DEBUG, "   INIT: %u.%u\n", outarg.major, outarg.minor);
>      fuse_log(FUSE_LOG_DEBUG, "   flags=0x%08x\n", outarg.flags);
>      fuse_log(FUSE_LOG_DEBUG, "   max_readahead=0x%08x\n", outarg.max_readahead);
> diff --git a/tools/virtiofsd/fuse_lowlevel.h b/tools/virtiofsd/fuse_lowlevel.h
> index 3bf786b034..4b4e8c9724 100644
> --- a/tools/virtiofsd/fuse_lowlevel.h
> +++ b/tools/virtiofsd/fuse_lowlevel.h
> @@ -798,7 +798,8 @@ struct fuse_lowlevel_ops {
>       *   fuse_reply_err
>       */
>      void (*setxattr)(fuse_req_t req, fuse_ino_t ino, const char *name,
> -                     const char *value, size_t size, int flags);
> +                     const char *value, size_t size, int flags,
> +                     uint32_t setxattr_flags);
>  
>      /**
>       * Get an extended attribute
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index ec91b3c133..9f5cd98fb5 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -2955,7 +2955,8 @@ out:
>  }
>  
>  static void lo_setxattr(fuse_req_t req, fuse_ino_t ino, const char *in_name,
> -                        const char *value, size_t size, int flags)
> +                        const char *value, size_t size, int flags,
> +                        uint32_t extra_flags)
>  {
>      char procname[64];
>      const char *name;
> -- 
> 2.25.4
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


