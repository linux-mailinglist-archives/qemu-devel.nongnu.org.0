Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 563A22EF1BD
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 13:04:54 +0100 (CET)
Received: from localhost ([::1]:41870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxqVh-0008M3-DQ
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 07:04:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1kxqTp-0007ME-A4
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 07:02:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1kxqTm-00006C-B4
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 07:02:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610107371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nRl1PvtfpQCPx1KYbiRv2DxLMG3oug/kwifvBkuJ8vk=;
 b=MUXqik7GBJsahtmeFOwjRnFpsTFvE691XC/glhqouHSx+RdL5Fsrq0PjVHBoJTg1EDUjxl
 zaZhq4HZ/fuHYz87hNUkhYUPT+w4Z4XkYQCojZPrFLKnsu8Be5LkwFNa7iuyvhw05bxj8g
 haMeTpYEdX5QUlas6WPkkL/JoqJiTkc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-Sw7pxC86OyW6JO2QPZuz2g-1; Fri, 08 Jan 2021 07:02:49 -0500
X-MC-Unique: Sw7pxC86OyW6JO2QPZuz2g-1
Received: by mail-wm1-f71.google.com with SMTP id z12so3125850wmf.9
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 04:02:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=GZe04kumBAhHvIQi/NYdvEvC4xOEvoKxegMd3L1khXU=;
 b=E8gPRwms/ihik1Qwg/MGus3vpGHCi0zugJUSsAFAh+p/wn0aq7dfNMCQA68a6qXemu
 h/8rFetIklXeZ4R1TmMIdVLZvOuAmkxTIBcjr4pTQowpfECHfsPJyBsEtAvDf4fP6y2W
 Rw6llGsHMn8UXa2gyfIJdiyp9VxZ9kLO2McuKKSJ3zamuXS+zcIKpYK2h/k8eIG2wnnM
 321ZfWrfWez90UY1icpYRCCl7ZXevZv+/nm71F/4jytKeeRe+hsDmGrnr6PtJwRg9epR
 hsFux0Mwn530o5BqstoB7D7XS3xcMQef8ovU1JvbNSP3A+JzFPcr57R2aziiGuMx1l39
 HEsg==
X-Gm-Message-State: AOAM533gUVvaYjK5Fqv2HD9vDulhRPCQxuypHnn/X/vi89gqh7fnV621
 2j84O/dJKdgwaMja3pM8QIpuxOp4GdOK4Gr2TV4KGHBUgzUfJOClRNEOh4mHuNiWaNf7zaxGjvd
 G/4UYfgYvXsm7CX4=
X-Received: by 2002:adf:e710:: with SMTP id c16mr3333480wrm.295.1610107368461; 
 Fri, 08 Jan 2021 04:02:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz1x44AMSa5GTnREMjA1EnsuPXnmx8MNgvt7fZbJIb079M+Tr17V2dCZ0WJvPW7reU7dJpq7A==
X-Received: by 2002:adf:e710:: with SMTP id c16mr3333459wrm.295.1610107368207; 
 Fri, 08 Jan 2021 04:02:48 -0800 (PST)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id u5sm12603928wrr.32.2021.01.08.04.02.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 04:02:47 -0800 (PST)
Date: Fri, 8 Jan 2021 13:02:43 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] hw/virtio-pci: Replace error_report() by
 qemu_log_mask(GUEST_ERROR)
Message-ID: <20210108120243.zgajoyust5n56l5m@steredhat>
References: <20201210172834.178052-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201210172834.178052-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.246,
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 10, 2020 at 06:28:34PM +0100, Philippe Mathieu-Daudé wrote:
>Replace I/O write error reported with error_report() by
>qemu_log_mask(GUEST_ERROR) which allow filtering.
>
>Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>---
> hw/virtio/virtio-pci.c | 6 ++++--
> 1 file changed, 4 insertions(+), 2 deletions(-)
>
>diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
>index f863f69ede4..094c36aa3ea 100644
>--- a/hw/virtio/virtio-pci.c
>+++ b/hw/virtio/virtio-pci.c
>@@ -27,6 +27,7 @@
> #include "hw/qdev-properties.h"
> #include "qapi/error.h"
> #include "qemu/error-report.h"
             ^
Just a little thing, could we remove this inclusion since we are not 
using error_report() anymore in this file?

Anyway the patch LGTM:

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


>+#include "qemu/log.h"
> #include "qemu/module.h"
> #include "hw/pci/msi.h"
> #include "hw/pci/msix.h"
>@@ -365,8 +366,9 @@ static void virtio_ioport_write(void *opaque, uint32_t addr, uint32_t val)
>         virtio_queue_set_vector(vdev, vdev->queue_sel, val);
>         break;
>     default:
>-        error_report("%s: unexpected address 0x%x value 0x%x",
>-                     __func__, addr, val);
>+        qemu_log_mask(LOG_GUEST_ERROR,
>+                      "%s: unexpected address 0x%x value 0x%x\n",
>+                      __func__, addr, val);
>         break;
>     }
> }
>-- 
>2.26.2
>
>


