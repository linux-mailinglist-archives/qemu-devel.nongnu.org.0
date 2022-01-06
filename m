Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F26154865BC
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 15:02:54 +0100 (CET)
Received: from localhost ([::1]:53526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5TLy-0002ya-2s
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 09:02:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5Sev-0005Zv-8s
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:18:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5Ser-00013E-E9
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:18:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641475100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DFg4dF0zL+6DjrQEApY58jy53XB520+11YNtoCyrIVs=;
 b=PnAWB1gLmTImidPX80Q6Pz7kMf3Chy5OIPIaQvcyAxlUrSqTiOZtr9qtQWiYS4y3S0f7Ck
 M2s1GJAauxco5pHFs8ArdQQBBRL23AoNO5UnIpQ2/+2tYPTZxgQ0aBuoJWJ1ksimlyZmqw
 5s/SdLAIPh6PN/YQVtiIpNOv9a/rDiE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-106-TCqInghCNH6mWDow2XG1kw-1; Thu, 06 Jan 2022 08:18:19 -0500
X-MC-Unique: TCqInghCNH6mWDow2XG1kw-1
Received: by mail-ed1-f72.google.com with SMTP id
 m8-20020a056402510800b003f9d22c4d48so1898098edd.21
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 05:18:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DFg4dF0zL+6DjrQEApY58jy53XB520+11YNtoCyrIVs=;
 b=rDPqAd+FccE68eyKRXj44INxaqf1nFepHG/Tc883Zg7tD72K/7Xw5bJhcK7QI1MCaX
 i2expthsDvh9y2HqzPhOZj0gyr5onHi8EnpcYN6YeULui3ksvPOHXVppia3TLHRUq/lz
 DNm8ve4VkbHu6bVeEu+3MvrLHHrzJxhCSWQokrworWGk/5H0DoPaxYy5A+2jnlWPfXHm
 PIiLigib0YMsw//94XLV4b/fEPz3Q7oKk2yNFXsw734Z4hA/ipYDOX62pu9zsDAeMfGf
 Vfx0k5k2qHjSkd8O+lpABc/wezpvwp65LweF1sO6OEf6vvJEG9vsicim9D86/dorN5rz
 APiQ==
X-Gm-Message-State: AOAM531jXLGcf/WeOpwrCw41f/zjq4B3IQKBip/3qAFMTINd8XAiEQEq
 yaBnicNB8b5cH6BL5D5KtEYE0TFaSQ0OavITKr1tz/Mi+co7E9nN1PZbFiHub3wSFtkr4wnI6zR
 8xhBZdwh0199XdSDBYBGciU2OYX0qLsc7gU9T7x/HN5OFTnjh/pUhu9NrnR2C
X-Received: by 2002:a17:907:94c2:: with SMTP id
 dn2mr47244646ejc.325.1641475097904; 
 Thu, 06 Jan 2022 05:18:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwBeQG6Mpq47DgwKVCL0FSawIspZqo9z1MivqJ6EczsW0hBH9PBQnGjwN/zQWnxS/4GtjC2KQ==
X-Received: by 2002:a17:907:94c2:: with SMTP id
 dn2mr47244621ejc.325.1641475097539; 
 Thu, 06 Jan 2022 05:18:17 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:991b:6857:5652:b903:a63b])
 by smtp.gmail.com with ESMTPSA id ne31sm492394ejc.48.2022.01.06.05.18.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 05:18:17 -0800 (PST)
Date: Thu, 6 Jan 2022 08:18:14 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 41/52] virtio-mem: Set "unplugged-inaccessible=auto" for the
 7.0 machine on x86
Message-ID: <20220106131534.423671-42-mst@redhat.com>
References: <20220106131534.423671-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220106131534.423671-1-mst@redhat.com>
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


