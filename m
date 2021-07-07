Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A91F63BEA70
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 17:10:56 +0200 (CEST)
Received: from localhost ([::1]:48622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m19CR-0001um-PZ
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 11:10:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m195A-0000tB-HG
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 11:03:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m1957-0006dC-Ba
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 11:03:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625670200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PjAi9rnzMN7LIiVgFWQPrUw5J76tkcgx1USiXKE9mXs=;
 b=HzB1jCy0ERdVD4euOUAYOEdrucPVFZwUJMN1PVafiEGBzMA/E7XXnunLfKl4UxWLI+7HhU
 TKYQGR6B5z9YFGn0sCaAeHumaR6w+IFAyYsknTpuKirVnjI4/1PGWQSvbTFUscq4FVrz7C
 JBB/R/twueuUSIJu4SJTNwN8TdZjRp0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-uAsuWbSMPeWOqFye_tXw_Q-1; Wed, 07 Jul 2021 11:03:19 -0400
X-MC-Unique: uAsuWbSMPeWOqFye_tXw_Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 j141-20020a1c23930000b0290212502cb19aso1110584wmj.0
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 08:03:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PjAi9rnzMN7LIiVgFWQPrUw5J76tkcgx1USiXKE9mXs=;
 b=VD1OPU0E6g9PWcs7w62kimNnOvQDif5r8k4eG0hpTIltNtlgwFm4oBAfTvUyVP3p5E
 quyRztXUIFsXPNp1dObceo/OxrfcnY9BCYczmEjBHOmfzeC3W/oVwEs4FdyKDitlPt8T
 V3K7vpFrEIhxRSRhCRcjBoxIqkPnUQ3/NHusAOjwjj9n4qkMRTI0om1LdbSlh2ZQi4au
 hiB7ZP+AGNTjavpZj2WneXUMJ9Nbdhuyu4KBh9jh55iriLXgUv069CfiM0nWRxbHIHQ4
 rLCBQ/ewtglFS8uqAzxQp98phDGQX7wiZgWBjen/k6lUaiMQZ+Mx9aLWpS3+GrNumHUR
 YnXw==
X-Gm-Message-State: AOAM530nHd1C1aV7lJ2ftpIimWgVoJ/+LynEYiKzDFij9chesAVqPc1T
 RTS2JSHoy5gQ4JwXHP8wjB0p+xuk/uQO/taEGvnvcDN8cDPIQx5GO08dRwaGHQaQyiRBTWyNwk6
 2PjlY0a9V52e+MyEOWEZAQtB6vn8Hji5zBbOR2CY0rEHoyP2DN5KGVRgbeB+N
X-Received: by 2002:a7b:c5d8:: with SMTP id n24mr27641002wmk.51.1625670197424; 
 Wed, 07 Jul 2021 08:03:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3tT1Zem7yI48HYY/Zst6l1sF8WT7ZtArqHlGRndkQ6Qb4yOqHZhrYHuvbupDJZL66u4OKeA==
X-Received: by 2002:a7b:c5d8:: with SMTP id n24mr27640969wmk.51.1625670197232; 
 Wed, 07 Jul 2021 08:03:17 -0700 (PDT)
Received: from redhat.com ([2.55.150.102])
 by smtp.gmail.com with ESMTPSA id o14sm1318292wmq.31.2021.07.07.08.03.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 08:03:16 -0700 (PDT)
Date: Wed, 7 Jul 2021 11:03:14 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/13] virtio-pci: Changed return values for "notify",
 "device" and "isr" read.
Message-ID: <20210707150157.52328-7-mst@redhat.com>
References: <20210707150157.52328-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210707150157.52328-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Andrew Melnychenko <andrew@daynix.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrew Melnychenko <andrew@daynix.com>

At some point, after unplugging virtio-pci the virtio device may be unrealised,
but the memory regions may be present in flatview. So, it's a possible situation
when memory region's callbacks are called for "unplugged" device.

Previous two patches made sure this case does not cause QEMU to crash.
This patch adds check for "notify" memory region. Now reads will return "-1" if a virtio
device is not present on a virtio bus.

Bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=1938042
Bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=1743098

Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
Message-Id: <20210609095843.141378-4-andrew@daynix.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio-pci.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index c0d9c47df7..433060ac02 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1349,6 +1349,11 @@ static void virtio_pci_common_write(void *opaque, hwaddr addr,
 static uint64_t virtio_pci_notify_read(void *opaque, hwaddr addr,
                                        unsigned size)
 {
+    VirtIOPCIProxy *proxy = opaque;
+    if (virtio_bus_get_device(&proxy->bus) == NULL) {
+        return UINT64_MAX;
+    }
+
     return 0;
 }
 
@@ -1386,7 +1391,7 @@ static uint64_t virtio_pci_isr_read(void *opaque, hwaddr addr,
     uint64_t val;
 
     if (vdev == NULL) {
-        return 0;
+        return UINT64_MAX;
     }
 
     val = qatomic_xchg(&vdev->isr, 0);
@@ -1407,7 +1412,7 @@ static uint64_t virtio_pci_device_read(void *opaque, hwaddr addr,
     uint64_t val;
 
     if (vdev == NULL) {
-        return 0;
+        return UINT64_MAX;
     }
 
     switch (size) {
-- 
MST


