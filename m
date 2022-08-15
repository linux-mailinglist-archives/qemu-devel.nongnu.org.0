Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6AA5929B6
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 08:41:53 +0200 (CEST)
Received: from localhost ([::1]:37794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNTnM-0006Y4-GX
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 02:41:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oNTcX-0000tg-QW
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 02:30:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oNTcO-0000TC-Qn
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 02:30:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660545032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pwnd7e8QXID66LzBd8J+loW/aJ3/AJ4BEQX9bXg+q4A=;
 b=Fq84GC6yIEUmI2wyT9v8rDhy3kwlKHZv6gX66AXJj7qI+As0uABCxj/8MOvq2vAGnpVLmT
 VIgcORcXEUaKxPOd5ErThfJfG/hS5q0HnI4dBNUtDiiGilZZhxaAXNvaqWItOiYl6pTLiA
 pgKvE8e8XvOh8uD3N6Z7a0wGBO2J2K8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-315-gVxPYvISNeyk7gweXIHdaQ-1; Mon, 15 Aug 2022 02:30:28 -0400
X-MC-Unique: gVxPYvISNeyk7gweXIHdaQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CCAC01C05EB2;
 Mon, 15 Aug 2022 06:30:27 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-77.bne.redhat.com [10.64.54.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 975D82026D64;
 Mon, 15 Aug 2022 06:30:24 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 cohuck@redhat.com, zhenyzha@redhat.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, shan.gavin@gmail.com
Subject: [PATCH v2 2/4] hw/arm/virt: Introduce variable region_base in
 virt_set_memmap()
Date: Mon, 15 Aug 2022 14:29:56 +0800
Message-Id: <20220815062958.100366-3-gshan@redhat.com>
In-Reply-To: <20220815062958.100366-1-gshan@redhat.com>
References: <20220815062958.100366-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

This introduces variable 'region_base' for the base address of
the specific high memory region. It's the preparatory to improve
the address assignment for high memory region in next patch.

No functional change intended.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/arm/virt.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index f8e9f3e205..582a8960fc 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1744,11 +1744,11 @@ static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
     vms->highest_gpa = memtop - 1;
 
     for (i = VIRT_LOWMEMMAP_LAST; i < ARRAY_SIZE(extended_memmap); i++) {
+        hwaddr region_base = ROUND_UP(base, extended_memmap[i].size);
         hwaddr region_size = extended_memmap[i].size;
         bool fits;
 
-        base = ROUND_UP(base, region_size);
-        vms->memmap[i].base = base;
+        vms->memmap[i].base = region_base;
         vms->memmap[i].size = region_size;
 
         /*
@@ -1757,9 +1757,9 @@ static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
          *
          * For each device that doesn't fit, disable it.
          */
-        fits = (base + region_size) <= BIT_ULL(pa_bits);
+        fits = (region_base + region_size) <= BIT_ULL(pa_bits);
         if (fits) {
-            vms->highest_gpa = base + region_size - 1;
+            vms->highest_gpa = region_base + region_size - 1;
         }
 
         switch (i) {
@@ -1774,7 +1774,7 @@ static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
             break;
         }
 
-        base += region_size;
+        base = region_base + region_size;
     }
 
     if (device_memory_size > 0) {
-- 
2.23.0


