Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6424C1054
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 11:34:27 +0100 (CET)
Received: from localhost ([::1]:46024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMoyZ-0000z5-0P
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 05:34:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nMofW-0007my-Ro
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 05:14:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nMofT-0004gn-By
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 05:14:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645611282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9Wei8gsu0FNY0s54mbQ86nflN2ALhzTSAqrtJyoKVUs=;
 b=VuEAEEmNOkCSVE86wP2/J2kcEUd4c2Tjc3JXxdOBrqdzx/FGISdNj5NuDoL/zZnaoW3BMy
 uwjoz65+IOyF40Xz3aaEUCZckFMoHRaqo5EGjf74LopA/nfTO4c+9VL7us4Qh/W4pg8eZG
 wJiBh6STv8gsSrLCs2Ef4YmMVDol8eQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-536-Hf5ygLu6MyKgZ7O3RiTtig-1; Wed, 23 Feb 2022 05:14:36 -0500
X-MC-Unique: Hf5ygLu6MyKgZ7O3RiTtig-1
Received: by mail-wm1-f72.google.com with SMTP id
 p14-20020a05600c1d8e00b00381001316a8so88577wms.8
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 02:14:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9Wei8gsu0FNY0s54mbQ86nflN2ALhzTSAqrtJyoKVUs=;
 b=rx/92aBrokwmVvGGRUu80JptsB6a+RvbjV25Y+Tu6BNWBvCEzwCOf2BmtsniTZQigQ
 u7v3F00v0HFNm0vuRIRPQtagmCP+iL9XEjnpwU9XERTd+yj64mW6UuWcD1Wx3brTiqgD
 Qagrf39krQ4NKI1e8LKYcU1ckRx4zdYLAT0+vNGExw9SO9BIOm7oxiss4BG5BVO/VGqa
 rMyXHJ1VhI40I2+APz0wmjcalHl1BLhs0zOylNoGBt6tTTRs3BuzN6nj7JqzW67NJS1E
 /jnvDVWFcPzz5Ttj0g8zlz0TDeTD4pO/tHZrpVzsk5OzGMJj9xEG8DsdNIjFGmTf/RqB
 265Q==
X-Gm-Message-State: AOAM530UriknT2/etynAccU/+mH+uF/G273w01/b9QrtYIZsBgQip08H
 5sCH05E2NzzEinBZqNMiPhyLECSRCDgwEKrpwVf4KG0R9YTWDuFWZ1G3+0DAjW3z9zU/R0l0Whe
 o/5+/Lle0bHYbsjI=
X-Received: by 2002:a05:600c:3d12:b0:37b:ef1d:7460 with SMTP id
 bh18-20020a05600c3d1200b0037bef1d7460mr6793855wmb.36.1645611274835; 
 Wed, 23 Feb 2022 02:14:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx+oxbPrD7tTAjidAklLU+YeeWP3I2qJhIHHDZkS80NZEumkD7h/AfHrQzI2aFAJnkH4qjopQ==
X-Received: by 2002:a05:600c:3d12:b0:37b:ef1d:7460 with SMTP id
 bh18-20020a05600c3d1200b0037bef1d7460mr6793835wmb.36.1645611274660; 
 Wed, 23 Feb 2022 02:14:34 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 f17-20020a7bc8d1000000b0037bc3effe27sm4877075wml.38.2022.02.23.02.14.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 02:14:34 -0800 (PST)
Date: Wed, 23 Feb 2022 10:14:32 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH] virtiofsd: Let meson check for statx.stx_mnt_id
Message-ID: <YhYJCNvA1raSxHvT@work-vm>
References: <20220223092340.9043-1-hreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220223092340.9043-1-hreitz@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Hanna Reitz (hreitz@redhat.com) wrote:
> In virtiofsd, we assume that the presence of the STATX_MNT_ID macro
> implies existence of the statx.stx_mnt_id field.  Unfortunately, that is
> not necessarily the case: glibc has introduced the macro in its commit
> 88a2cf6c4bab6e94a65e9c0db8813709372e9180, but the statx.stx_mnt_id field
> is still missing from its own headers.
> 
> Let meson.build actually chek for both STATX_MNT_ID and
> statx.stx_mnt_id, and set CONFIG_STATX_MNT_ID if both are present.
> Then, use this config macro in virtiofsd.
> 
> Closes: https://gitlab.com/qemu-project/qemu/-/issues/882
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  meson.build                      | 13 +++++++++++++
>  tools/virtiofsd/passthrough_ll.c |  2 +-
>  2 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/meson.build b/meson.build
> index 8df40bfac4..a5b63e62cd 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1306,6 +1306,18 @@ statx_test = gnu_source_prefix + '''
>  
>  has_statx = cc.links(statx_test)
>  
> +# Check whether statx() provides mount ID information
> +
> +statx_mnt_id_test = gnu_source_prefix + '''
> +  #include <sys/stat.h>
> +  int main(void) {
> +    struct statx statxbuf;
> +    statx(0, "", 0, STATX_BASIC_STATS | STATX_MNT_ID, &statxbuf);
> +    return statxbuf.stx_mnt_id;
> +  }'''
> +
> +has_statx_mnt_id = cc.links(statx_mnt_id_test)
> +
>  have_vhost_user_blk_server = get_option('vhost_user_blk_server') \
>    .require(targetos == 'linux',
>             error_message: 'vhost_user_blk_server requires linux') \
> @@ -1553,6 +1565,7 @@ config_host_data.set('CONFIG_NETTLE', nettle.found())
>  config_host_data.set('CONFIG_QEMU_PRIVATE_XTS', xts == 'private')
>  config_host_data.set('CONFIG_MALLOC_TRIM', has_malloc_trim)
>  config_host_data.set('CONFIG_STATX', has_statx)
> +config_host_data.set('CONFIG_STATX_MNT_ID', has_statx_mnt_id)
>  config_host_data.set('CONFIG_ZSTD', zstd.found())
>  config_host_data.set('CONFIG_FUSE', fuse.found())
>  config_host_data.set('CONFIG_FUSE_LSEEK', fuse_lseek.found())
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index dfa2fc250d..028dacdd8f 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -1039,7 +1039,7 @@ static int do_statx(struct lo_data *lo, int dirfd, const char *pathname,
>  {
>      int res;
>  
> -#if defined(CONFIG_STATX) && defined(STATX_MNT_ID)
> +#if defined(CONFIG_STATX) && defined(CONFIG_STATX_MNT_ID)
>      if (lo->use_statx) {
>          struct statx statxbuf;
>  
> -- 
> 2.34.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


