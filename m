Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4A94876B1
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 12:44:50 +0100 (CET)
Received: from localhost ([::1]:33838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5nft-00077q-KY
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 06:44:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n3y-0001RD-U5
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:05:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n3o-0002BV-0R
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:05:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641553512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DFg4dF0zL+6DjrQEApY58jy53XB520+11YNtoCyrIVs=;
 b=ZWNH2JECqpfKMxlmyW1u9oQsQznSZURQkhMIdu6GS1/jdKDJ4hu/RNK/OD/Gq8KEH8ayn7
 LS8IoQI5A+6uZb+Nb2o8WalXahtWmy2srIlQFojQ8rpXS4P5pzCa2Dg1P5O2vms0TjQjnX
 f1RdLGqpsEsxxGlxlT7CJ8TNUHngQMM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-125-3sSEjoIAONKHBxzXWUYHsw-1; Fri, 07 Jan 2022 06:05:11 -0500
X-MC-Unique: 3sSEjoIAONKHBxzXWUYHsw-1
Received: by mail-wm1-f70.google.com with SMTP id
 r2-20020a05600c35c200b00345c3b82b22so4522881wmq.0
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 03:05:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DFg4dF0zL+6DjrQEApY58jy53XB520+11YNtoCyrIVs=;
 b=KI4VfJl8doOWUBMePQJzMD3QFycPU56Ns3RVk4oJRZaujrK+9GGdWQHGEDpEiXRAOK
 Jg6XamjkfGayM5SNTEwNrBRmjY+D2NnwihZgymiOpBzHATKDG4o2cgHBs+E+Xov/h74V
 pMIAStV98drkqcIF5xprpukCVpOb+zQQmRa57oZPnlLGShlpk9YiuAve/5xsQZnSVs2Y
 ghbv8dTtHSLju9qyFJLDOvejLluOQbsGm/5qU81Sn3oTYcXqWqqh9/WGmkHIotGCwTvW
 U69ysKCbtr3XXAdJFf42/lwVlkfkbAFLlJffztP9bVG2e10v5PG7O/SSgbaZeXuUp+su
 5Xow==
X-Gm-Message-State: AOAM531MbzkmfD0pFucLHXnybG5RkliWcFXPd+342OJQ+S4iaWvywc9N
 3HJcp/ZmwBw8LDs/+kheBblzMzDsn7ufKmdbGmgRfNpvinIbAyuhY/H0COs8QqIcjmniatk5CBr
 V8wnh81MCQcVlzyTFW5jFv+K2/FKIEhllhforQnnskyJ3XAXj9XZHfy9ifiUn
X-Received: by 2002:adf:f6c1:: with SMTP id y1mr2885076wrp.557.1641553510229; 
 Fri, 07 Jan 2022 03:05:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwu2Ami5cxWXRBZ4/v5az0sgcjHAmyPaIZffGA5O9vJf2aD3UV4IZVHTH43gxcuVUEDkvxkIA==
X-Received: by 2002:adf:f6c1:: with SMTP id y1mr2885056wrp.557.1641553509988; 
 Fri, 07 Jan 2022 03:05:09 -0800 (PST)
Received: from redhat.com ([2.55.16.192])
 by smtp.gmail.com with ESMTPSA id f6sm4488134wri.115.2022.01.07.03.05.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 03:05:09 -0800 (PST)
Date: Fri, 7 Jan 2022 06:05:07 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 41/55] virtio-mem: Set "unplugged-inaccessible=auto" for
 the 7.0 machine on x86
Message-ID: <20220107102526.39238-42-mst@redhat.com>
References: <20220107102526.39238-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220107102526.39238-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, David Hildenbrand <david@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pankaj Gupta <pankaj.gupta@ionos.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

Set the new default to "auto", keeping it set to "off" for compat
machines. This property is only available for x86 targets.

Reviewed-by: Michal Privoznik <mprivozn@redhat.com>
Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20211217134039.29670-4-david@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/pc.c           | 4 +++-
 hw/virtio/virtio-mem.c | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 959efa5b3f..718ab81ba8 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -95,7 +95,9 @@
 #include "trace.h"
 #include CONFIG_DEVICES
 
-GlobalProperty pc_compat_6_2[] = {};
+GlobalProperty pc_compat_6_2[] = {
+    { "virtio-mem", "unplugged-inaccessible", "off" },
+};
 const size_t pc_compat_6_2_len = G_N_ELEMENTS(pc_compat_6_2);
 
 GlobalProperty pc_compat_6_1[] = {
diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index fb6687d4c7..04c223b0c9 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -1201,7 +1201,7 @@ static Property virtio_mem_properties[] = {
                      TYPE_MEMORY_BACKEND, HostMemoryBackend *),
 #if defined(VIRTIO_MEM_HAS_LEGACY_GUESTS)
     DEFINE_PROP_ON_OFF_AUTO(VIRTIO_MEM_UNPLUGGED_INACCESSIBLE_PROP, VirtIOMEM,
-                            unplugged_inaccessible, ON_OFF_AUTO_OFF),
+                            unplugged_inaccessible, ON_OFF_AUTO_AUTO),
 #endif
     DEFINE_PROP_END_OF_LIST(),
 };
-- 
MST


