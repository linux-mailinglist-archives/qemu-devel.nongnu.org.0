Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 628D0652371
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 16:06:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7eBf-00025w-Dg; Tue, 20 Dec 2022 10:05:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7eBd-00022A-9i
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 10:05:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7eBb-0006as-ND
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 10:05:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671548743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v3ldk6plhvP/ViIABz50rAc8FDFS41LGc3HDMVl68Ac=;
 b=JedJYbm2uwH7UGiU2+dVsadigkyJoZfKZ/MwDdaL3QzFOkiS0ShLd6aJJ7YyB809SXqKW1
 Wyz0/C+02BvnvLX47CxH4AjiS/5r/qyrKE1pqAkWP1jGDmTcPBmy1MpWhH5mvSkDiLwTZA
 lLeRvc27E1yHWYeBOXUVF/o42hhtr00=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-633-IPUIWfx7P4OyP5bJzDbF3g-1; Tue, 20 Dec 2022 10:05:41 -0500
X-MC-Unique: IPUIWfx7P4OyP5bJzDbF3g-1
Received: by mail-yb1-f199.google.com with SMTP id
 a4-20020a5b0004000000b006fdc6aaec4fso14600656ybp.20
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 07:05:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v3ldk6plhvP/ViIABz50rAc8FDFS41LGc3HDMVl68Ac=;
 b=j/ZDy/hmh0PdHNTCawIB+ZMzUdjpgp7AaWT6FYmvJXMH9fODEEJVh0HAgiIUA2krvm
 rkiGkeNtmwf989+41hKeFpACJ8LKbSkb6xCZjCIbBWq+gxmNCS0xAJWlnl03437psGyq
 R8jdiQlVpiX1TvWaJa62ykL6Pd+3wJOXO2YC/EZvL0WSKOMF+fUozBtS+/i7r3dzmK0p
 MENo9QGHHpmFEtI1LjaQHCpVy+aZqoFbffT+eKGXsCkz3jQ66jg6poUXElnygy8FQ6qJ
 yFkkkQxGX3skIF++xe7UmbSDXUJbykeR2hGA3CThKJEskT3yRIGmlEtTCljA/eA8CgeU
 jdGw==
X-Gm-Message-State: ANoB5pnSIQlfa89SHUle3qGVgHzrAB/WSciqQ8++KsyN0ZS2dK2nm5l9
 DzWetM6rio+fBJZCuH0Yc9I72UwI9ypT4y9M/sWw4baZGxJdTLBDVfluSjJoNajSA41DgSlx438
 ZdIL72cgIMg9CE/E=
X-Received: by 2002:a05:7500:2d9a:b0:ea:78bf:c0de with SMTP id
 er26-20020a0575002d9a00b000ea78bfc0demr4152229gab.56.1671548740718; 
 Tue, 20 Dec 2022 07:05:40 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5r7yjmP5nGm6xSL2zTod+xaqKIPD99Q3PqEQXAgsNJ+FsKl+1sHeWi/zFWk7E7khYKzgGLUQ==
X-Received: by 2002:a05:7500:2d9a:b0:ea:78bf:c0de with SMTP id
 er26-20020a0575002d9a00b000ea78bfc0demr4152191gab.56.1671548740307; 
 Tue, 20 Dec 2022 07:05:40 -0800 (PST)
Received: from redhat.com ([37.19.199.118]) by smtp.gmail.com with ESMTPSA id
 q20-20020a05620a0d9400b006eeca296c00sm9108385qkl.104.2022.12.20.07.05.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 07:05:38 -0800 (PST)
Date: Tue, 20 Dec 2022 10:05:28 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, imammedo@redhat.com, ani@anisinha.ca,
 peter.maydell@linaro.org, laurent@vivier.eu,
 edgar.iglesias@gmail.com, Alistair.Francis@wdc.com,
 bin.meng@windriver.com, palmer@dabbelt.com,
 marcel.apfelbaum@gmail.com, yangxiaojuan@loongson.cn,
 gaosong@loongson.cn, richard.henderson@linaro.org, deller@gmx.de,
 jasowang@redhat.com, vikram.garhwal@amd.com,
 francisco.iglesias@amd.com, clg@kaod.org, kraxel@redhat.com,
 marcandre.lureau@redhat.com, riku.voipio@iki.fi,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 crwulff@gmail.com, marex@denx.de
Subject: Re: [PATCH 1/2] include/hw/virtio: Break inclusion loop
Message-ID: <20221220100515-mutt-send-email-mst@kernel.org>
References: <20221210133915.4104305-1-armbru@redhat.com>
 <20221210133915.4104305-2-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221210133915.4104305-2-armbru@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Sat, Dec 10, 2022 at 02:39:14PM +0100, Markus Armbruster wrote:
> hw/virtio/virtio.h and hw/virtio/vhost.h include each other.  The
> former doesn't actually need the latter, so drop that inclusion to
> break the loop.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>


feel free to merge

> ---
>  include/hw/virtio/virtio.h | 1 -
>  hw/virtio/virtio.c         | 1 +
>  2 files changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index a973811cbf..8b68b69e00 100644
> --- a/include/hw/virtio/virtio.h
> +++ b/include/hw/virtio/virtio.h
> @@ -22,7 +22,6 @@
>  #include "standard-headers/linux/virtio_config.h"
>  #include "standard-headers/linux/virtio_ring.h"
>  #include "qom/object.h"
> -#include "hw/virtio/vhost.h"
>  
>  /*
>   * A guest should never accept this. It implies negotiation is broken
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index eb6347ab5d..faedf886da 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -26,6 +26,7 @@
>  #include "qemu/module.h"
>  #include "qom/object_interfaces.h"
>  #include "hw/virtio/virtio.h"
> +#include "hw/virtio/vhost.h"
>  #include "migration/qemu-file-types.h"
>  #include "qemu/atomic.h"
>  #include "hw/virtio/virtio-bus.h"
> -- 
> 2.37.3
> 
> 
> 


