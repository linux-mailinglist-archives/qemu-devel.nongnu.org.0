Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC211587673
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 06:49:51 +0200 (CEST)
Received: from localhost ([::1]:35506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIjqo-0005Ce-OC
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 00:49:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oIjo8-0008Bx-GQ
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 00:47:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oIjo5-0004W7-EJ
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 00:47:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659415620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OzSd66vMiAGfWp3SjT783MBf4FZiMzQ6hwrmJytEckg=;
 b=KMDRPsqS6IDbxPw+hL8nW/yAnKcRrpc8HRmlBoSK5qN6cLbdK8izEtyXdgWr8AXNv4WM0h
 lxR56Nf/5L5oWZa0/qD3zaGE1c9yZ3ElGtv//DGn9QjWTBNU5L2x7Qtg+P8hzWvncFVltg
 d8b2/oGGQAhI9uzWenkvS0yezhEvMQ4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-597-Dfl41vLYOuqBMYLlAUmkDg-1; Tue, 02 Aug 2022 00:45:46 -0400
X-MC-Unique: Dfl41vLYOuqBMYLlAUmkDg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D9833C01DF7;
 Tue,  2 Aug 2022 04:45:46 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-18.bne.redhat.com [10.64.54.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0570B492C3B;
 Tue,  2 Aug 2022 04:45:42 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, eric.auger@redhat.com, cohuck@redhat.com,
 zhenyzha@redhat.com, shan.gavin@gmail.com
Subject: [PATCH 2/2] hw/arm/virt: Warn when high memory region is disabled
Date: Tue,  2 Aug 2022 14:45:29 +0800
Message-Id: <20220802064529.547361-3-gshan@redhat.com>
In-Reply-To: <20220802064529.547361-1-gshan@redhat.com>
References: <20220802064529.547361-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When one specific high memory region is disabled due to the PA
limit, it'd better to warn user about that. The warning messages
help to identify the cause in some cases. For example, PCIe device
that has large MMIO bar, to be covered by PCIE_MMIO high memory
region, won't work properly if PCIE_MMIO high memory region is
disabled due to the PA limit.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/arm/virt.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index bc0cd218f9..c91756e33d 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1691,6 +1691,7 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
 static void virt_memmap_fits(VirtMachineState *vms, int index,
                              bool *enabled, hwaddr *base, int pa_bits)
 {
+    const char *region_name;
     hwaddr size = extended_memmap[index].size;
 
     /* The region will be disabled if its size isn't given */
@@ -1713,6 +1714,23 @@ static void virt_memmap_fits(VirtMachineState *vms, int index,
         vms->highest_gpa = *base + size - 1;
 
 	*base = *base + size;
+    } else {
+        switch (index) {
+        case VIRT_HIGH_GIC_REDIST2:
+            region_name = "GIC_REDIST2";
+            break;
+        case VIRT_HIGH_PCIE_ECAM:
+            region_name = "PCIE_ECAM";
+            break;
+        case VIRT_HIGH_PCIE_MMIO:
+            region_name = "PCIE_MMIO";
+            break;
+        default:
+            region_name = "unknown";
+        }
+
+        warn_report("Disabled %s high memory region due to PA limit",
+                    region_name);
     }
 }
 
-- 
2.23.0


