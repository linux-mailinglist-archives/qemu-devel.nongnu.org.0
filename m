Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DD34E828F
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 18:04:14 +0100 (CET)
Received: from localhost ([::1]:37974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nY9pl-00083K-Pn
	for lists+qemu-devel@lfdr.de; Sat, 26 Mar 2022 13:04:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nY9kl-0003tn-U1; Sat, 26 Mar 2022 12:59:03 -0400
Received: from [2a00:1450:4864:20::632] (port=46747
 helo=mail-ej1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nY9kk-0001uH-EI; Sat, 26 Mar 2022 12:59:03 -0400
Received: by mail-ej1-x632.google.com with SMTP id c10so2457203ejs.13;
 Sat, 26 Mar 2022 09:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LkZ15wJd+LFpAdx6Z7RYH7A3b7bWmA7jprwHFNQo/OI=;
 b=aVO5+9ALXYQ2+LvXDMxIdtX5vgsMUD3RKGLQ5rKAkXg3AWbqFEkLAXQAzueihImtnQ
 l5jnGHJIGeRmY9NfJptFUkenke1t9lzmhk7WLvXi6YeTrXc44ssdXq8jOSk3NX4P4uwb
 YIQNe62roU6/GS7vqIi/T4QnrOEuDiVpW4ilV5qrIUNbPWBX7dVgZelHHmF0awHWC6Oa
 7kGIam6rXJQTJFOEmJQVuzICDsiXv6+vu/s1nQhkZ1eh/UUdqb0a8n3HbwIfckG5BVyp
 GBYO16X2OKQcP8z1M4h+RRnrOZjwjULYC1BBZ5ivOMYzR+KtErsr1WaavJoKmGQsb7ar
 tWHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LkZ15wJd+LFpAdx6Z7RYH7A3b7bWmA7jprwHFNQo/OI=;
 b=4NkzoH6BlwKaWpskoxjOyYC5VGb2Yd8e4GyJBU9idZYl7oZdP6usgU2oCZxMKuaUp3
 Op0ErcJg+dqPI1i7UleVXkZ8rxN/I2ZGm8x6Cqsghmhb4S7Pou1S9Y/Ejy/hl3uYBV+/
 R+Vlx3rDPyaYf2eRz3If37+7Y8Y7x7xUyKO1lMH1fpwwueTJ3kb2Ry52Zk3XpoghQa0G
 cOQU9mKwqLglT30JiAdOabjsvM6VrW5QJ2l4ia3w6AWwM9I2grTBs7MJFPjJAXIrd5NX
 rW91zOTLM3lPULCPLcSbU7dnE6lJgTqO48cK2HH0LgWkQxCb67gfvIdzNsCdIA4hKb/1
 FqBA==
X-Gm-Message-State: AOAM5323KV/9V9xZCRLRgHya0xes9xjzUHy7CreWeRiX+92mxnL0tign
 p7njl9BSdZHO7SXiDRprlXcKcmws5Zw=
X-Google-Smtp-Source: ABdhPJzYO2gb06syFIc8TRb0WdtWjgdYrAposyrJYvIapzWbj5+wwbunnqa50xyfLwrcULPoYggIGA==
X-Received: by 2002:a17:907:7f21:b0:6e0:355f:805e with SMTP id
 qf33-20020a1709077f2100b006e0355f805emr18792587ejc.752.1648313940656; 
 Sat, 26 Mar 2022 09:59:00 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-089-012-231-111.89.12.pool.telefonica.de. [89.12.231.111])
 by smtp.gmail.com with ESMTPSA id
 x12-20020a50d9cc000000b0040f70fe78f3sm4515930edj.36.2022.03.26.09.58.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 09:59:00 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] hw/xen/xen_pt: Resolve
 igd_passthrough_isa_bridge_create() indirection
Date: Sat, 26 Mar 2022 17:58:24 +0100
Message-Id: <20220326165825.30794-3-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220326165825.30794-1-shentey@gmail.com>
References: <20220326165825.30794-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::632
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 qemu-trivial@nongnu.org, Anthony Perard <anthony.perard@citrix.com>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 Bernhard Beschow <shentey@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that igd_passthrough_isa_bridge_create() is implemented within the
xen context it may use Xen* data types directly and become
xen_igd_passthrough_isa_bridge_create(). This resolves an indirection.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/xen/xen_pt.c          | 11 -----------
 hw/xen/xen_pt.h          |  3 ++-
 hw/xen/xen_pt_graphics.c |  5 ++++-
 3 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
index 829ea9985f..0ec7e52183 100644
--- a/hw/xen/xen_pt.c
+++ b/hw/xen/xen_pt.c
@@ -701,17 +701,6 @@ static const MemoryListener xen_pt_io_listener = {
     .priority = 10,
 };
 
-static void
-xen_igd_passthrough_isa_bridge_create(XenPCIPassthroughState *s,
-                                      XenHostPCIDevice *dev)
-{
-    uint16_t gpu_dev_id;
-    PCIDevice *d = &s->dev;
-
-    gpu_dev_id = dev->device_id;
-    igd_passthrough_isa_bridge_create(pci_get_bus(d), gpu_dev_id);
-}
-
 /* destroy. */
 static void xen_pt_destroy(PCIDevice *d) {
 
diff --git a/hw/xen/xen_pt.h b/hw/xen/xen_pt.h
index 806d832c94..e7c4316a7d 100644
--- a/hw/xen/xen_pt.h
+++ b/hw/xen/xen_pt.h
@@ -43,7 +43,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(XenPCIPassthroughState, XEN_PT_DEVICE)
 
 uint32_t igd_read_opregion(XenPCIPassthroughState *s);
 void igd_write_opregion(XenPCIPassthroughState *s, uint32_t val);
-void igd_passthrough_isa_bridge_create(PCIBus *bus, uint16_t gpu_dev_id);
+void xen_igd_passthrough_isa_bridge_create(XenPCIPassthroughState *s,
+                                           XenHostPCIDevice *dev);
 
 /* function type for config reg */
 typedef int (*xen_pt_conf_reg_init)
diff --git a/hw/xen/xen_pt_graphics.c b/hw/xen/xen_pt_graphics.c
index f1fbb98912..f303f67c9c 100644
--- a/hw/xen/xen_pt_graphics.c
+++ b/hw/xen/xen_pt_graphics.c
@@ -375,10 +375,13 @@ static void pt_graphics_register_types(void)
 }
 type_init(pt_graphics_register_types)
 
-void igd_passthrough_isa_bridge_create(PCIBus *bus, uint16_t gpu_dev_id)
+void xen_igd_passthrough_isa_bridge_create(XenPCIPassthroughState *s,
+                                           XenHostPCIDevice *dev)
 {
+    PCIBus *bus = pci_get_bus(&s->dev);
     struct PCIDevice *bridge_dev;
     int i, num;
+    const uint16_t gpu_dev_id = dev->device_id;
     uint16_t pch_dev_id = 0xffff;
     uint8_t pch_rev_id = 0;
 
-- 
2.35.1


