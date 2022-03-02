Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD0C4CA2CC
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 12:06:43 +0100 (CET)
Received: from localhost ([::1]:58112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPMob-0006fO-Pn
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 06:06:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nPMmi-0005vt-4n
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 06:04:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nPMme-000106-Pa
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 06:04:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646219079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JgyUptXxLbdzdMuXuglfbkFV7Juyq7fg5u/7oJ9HGFY=;
 b=OtDwevfaZnkysKNqSjOfO5GPYuMnND3wV1ckoYsur/ZewKMA9YAHzh+N5z9cthrbG5vTga
 HKOto+39qTgUVfUBMWTtstc/XwPgxJE0/Gy940Sr3Hb7b0FJOYm/Tv7BrD33Kd6spij4zb
 Syziwh6ZAW46Yxk1JUqoIzI3C9Gd9oc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-258-ZuLnjbKSPIGYwgY0mfGLAg-1; Wed, 02 Mar 2022 06:04:34 -0500
X-MC-Unique: ZuLnjbKSPIGYwgY0mfGLAg-1
Received: by mail-wm1-f70.google.com with SMTP id
 ay7-20020a05600c1e0700b003813d7a7d03so700706wmb.1
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 03:04:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JgyUptXxLbdzdMuXuglfbkFV7Juyq7fg5u/7oJ9HGFY=;
 b=Q7i2mfHoLxAkyDeNuPA3ZObl4CdDcjJZEVaGlIq+ImxHQw0A/a8KgmV+dGrFvZCiEk
 XAV+ieEM5v/jRfuyr3aFJhi274w7Mpqz4aX147W2Lsxn1qkNOqwQgBD/wWHCDcRs2xU7
 grQjgYScVubVtMkG7MhgrC73pJOILknvx2Zvmu7SnX4QTC7D4xIHo4/u1FwW9zRs0q8T
 NI8zjbAdyQc+wE19UnGSWAIhzJWfk8MAva7Y+k8cjNKzGCeogEKX/UNm02BDaS6eqPL7
 Q7ZTOLP/mFArxECQqQey6iMDSxuuukUvc7oxLJuA/wl8HRJ9BjAjh+yRk5i6kUW37+lH
 4Umg==
X-Gm-Message-State: AOAM531k1g4/w+y8FfRfC3uTF6xLFsrBGfqQjMfebc0ehNNMckYsHce1
 fAu503emGjl77/ID1/8qtU6EVEf0FwoikRhja5+0+AdUuGMhNT1CZcqiJNbItvKTYccmtE6SJOy
 UwuLntgxAQ1mv02U=
X-Received: by 2002:adf:a341:0:b0:1f0:1a12:8920 with SMTP id
 d1-20020adfa341000000b001f01a128920mr5141859wrb.100.1646219071916; 
 Wed, 02 Mar 2022 03:04:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxc3037IuJiREXeINvXU9EGrsuMuc1CJ3GhjoR1H3J6NTsxGpTMq2EmRfK1gB4V0eugU0WOkw==
X-Received: by 2002:adf:a341:0:b0:1f0:1a12:8920 with SMTP id
 d1-20020adfa341000000b001f01a128920mr5141836wrb.100.1646219071658; 
 Wed, 02 Mar 2022 03:04:31 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 s17-20020adfdb11000000b001f02d5fea43sm2135727wri.98.2022.03.02.03.04.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 03:04:31 -0800 (PST)
Date: Wed, 2 Mar 2022 11:04:29 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH] virtiofsd: Let meson check for statx.stx_mnt_id
Message-ID: <Yh9PPbWb0htAF8nc@work-vm>
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

Queued

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
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


