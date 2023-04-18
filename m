Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 140D46E6054
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 13:48:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pojoF-00076Y-Vb; Tue, 18 Apr 2023 07:47:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pojoE-00076O-HK
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 07:47:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pojoD-0003cJ-06
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 07:47:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681818459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+DfkRtYe5Pjp1nnO8xYTYV6UlEGhFN7v4S8/0E4tCCM=;
 b=RTxf4X4SSk/jg8bCGPQi5aCiwWpMlpn95cWwrkW54+7m5hcVJTSUfYssULOYpe72dOoWWQ
 9z5QEO2XVWozT5izsi3C+N020Sxrhdo/uPhZSMYWw2veXBM0jwnp6ZWHuhZN4206Gm6Eg5
 HN9y8YlIojvYsFJIC0rHrVVWCFemOn4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-uAfRMpt-MkKJFpckcMDHtg-1; Tue, 18 Apr 2023 07:47:38 -0400
X-MC-Unique: uAfRMpt-MkKJFpckcMDHtg-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f17b8d24bbso1104475e9.2
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 04:47:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681818457; x=1684410457;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+DfkRtYe5Pjp1nnO8xYTYV6UlEGhFN7v4S8/0E4tCCM=;
 b=ErtSAlvAnETAWbHyMryAmyg/fC7a1777R1pfhOwjzqjoovRDRQmZzOHtYn4vu2QkEv
 UcN+bgnZp/61cG0wyLZDP+XH7Rqscsjr66vzmnxDItiU7TCZXqUZ0z2sSev+zzjlc8mQ
 BVmCmkSp/DQ06DT3jQDrAMrWkIZ7vfqBtZJtpwc3YE+pvgRLYqiFkrUBcp1PjdfTbix2
 QWbKCoa/BjRUWdsXO3jXIWUvhklx3urzN1u3snsvSAhy3IE9UfazODOQimKJGFkjjDfg
 J6/oAai3VK8b80Ds0tHINo8plxpfDEQ0ywNehQrtuv51JXkqf5eAhwljXHyS7jOcq02J
 CjKw==
X-Gm-Message-State: AAQBX9e6sriICQH1yRLsjvp2QjCBmGB5H7LXBI05h2N/xzXFzDJao/8q
 DtWDlfGt8/1KT0+y+WZhUexF922cHW5pAG/CffT2QmEUNt1z/IcPyR5vm6jgvwu1sNVqDpjunMd
 Dzik7m7TN6ptiw94=
X-Received: by 2002:a5d:42d2:0:b0:2f4:e580:a72f with SMTP id
 t18-20020a5d42d2000000b002f4e580a72fmr1649707wrr.45.1681818456969; 
 Tue, 18 Apr 2023 04:47:36 -0700 (PDT)
X-Google-Smtp-Source: AKy350baWMC4zV2Ic/j/QFVcOodJivlmQUCV+uDWy2SdyHzdCv73UAufSOt2IyAAQJmLBx7pUfGvcA==
X-Received: by 2002:a5d:42d2:0:b0:2f4:e580:a72f with SMTP id
 t18-20020a5d42d2000000b002f4e580a72fmr1649699wrr.45.1681818456690; 
 Tue, 18 Apr 2023 04:47:36 -0700 (PDT)
Received: from redhat.com ([2.52.136.129]) by smtp.gmail.com with ESMTPSA id
 v21-20020a05600c471500b003ef5bb63f13sm18436440wmo.10.2023.04.18.04.47.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 04:47:36 -0700 (PDT)
Date: Tue, 18 Apr 2023 07:47:33 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David 'Digit' Turner <digit@google.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH 1/3] Fix libvhost-user.c compilation.
Message-ID: <20230418074609-mutt-send-email-mst@kernel.org>
References: <20230405172109.3081788-1-digit@google.com>
 <20230405172109.3081788-2-digit@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230405172109.3081788-2-digit@google.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Apr 05, 2023 at 07:21:07PM +0200, David 'Digit' Turner wrote:
> The source file uses VIRTIO_F_VERSION_1 which is
> not defined by <linux/virtio_config.h> on Debian 10.
> 
> The system-provided <linux/virtio_config.h> which
> does not include the macro definition is included
> through <linux/vhost.h>, so fix the issue by including
> the standard-headers version before that.
> 
> Signed-off-by: David 'Digit' Turner <digit@google.com>

And maybe we want to use linux-headers on Linux then?

> ---
>  subprojects/libvhost-user/libvhost-user.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
> index 0200b78e8e..0a5768cb55 100644
> --- a/subprojects/libvhost-user/libvhost-user.c
> +++ b/subprojects/libvhost-user/libvhost-user.c
> @@ -32,6 +32,12 @@
>  #include <sys/mman.h>
>  #include <endian.h>
>  
> +/* Necessary to provide VIRTIO_F_VERSION_1 on system
> + * with older linux headers. Must appear before
> + * <linux/vhost.h> below.
> + */
> +#include "standard-headers/linux/virtio_config.h"
> +
>  #if defined(__linux__)
>  #include <sys/syscall.h>
>  #include <fcntl.h>
> -- 
> 2.40.0.348.gf938b09366-goog


