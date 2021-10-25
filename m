Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E7E439132
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 10:28:52 +0200 (CEST)
Received: from localhost ([::1]:33646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mevLf-0000oi-FX
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 04:28:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>) id 1mevJ4-0006bj-Pn
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 04:26:10 -0400
Received: from mail.csgraf.de ([85.25.223.15]:47928 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>) id 1mevJ1-0004Ek-8F
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 04:26:10 -0400
Received: from localhost.localdomain
 (dynamic-095-114-012-148.95.114.pool.telefonica.de [95.114.12.148])
 by csgraf.de (Postfix) with ESMTPSA id 56CF9608030F;
 Mon, 25 Oct 2021 10:25:59 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: Cameron Esfahani <dirty@apple.com>
Subject: [PATCH] hvf: Avoid mapping regions < PAGE_SIZE as ram
Date: Mon, 25 Oct 2021 10:25:58 +0200
Message-Id: <20211025082558.96864-1-agraf@csgraf.de>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

HVF has generic memory listener code that adds all RAM regions as HVF RAM
regions. However, HVF can only handle page aligned, page granule regions.

So let's ignore regions that are not page aligned and sized. They will be
trapped as MMIO instead.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 accel/hvf/hvf-accel-ops.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index 6bf319d34c..090155853a 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -135,6 +135,12 @@ static void hvf_set_phys_mem(MemoryRegionSection *section, bool add)
         }
     }
 
+    if (int128_get64(section->size) & (qemu_real_host_page_size - 1) ||
+        section->offset_within_address_space & (qemu_real_host_page_size - 1)) {
+        /* Not page aligned, so we can not map as RAM */
+        add = false;
+    }
+
     mem = hvf_find_overlap_slot(
             section->offset_within_address_space,
             int128_get64(section->size));
-- 
2.30.1 (Apple Git-130)


