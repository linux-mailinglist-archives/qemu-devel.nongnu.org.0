Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A33D640E06A
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 18:21:05 +0200 (CEST)
Received: from localhost ([::1]:39874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQu8G-0007tS-NU
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 12:21:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1mQtiH-0002wR-Ge; Thu, 16 Sep 2021 11:54:15 -0400
Received: from mail.csgraf.de ([85.25.223.15]:51322 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1mQtiD-00054W-1f; Thu, 16 Sep 2021 11:54:13 -0400
Received: from localhost.localdomain
 (dynamic-077-009-016-098.77.9.pool.telefonica.de [77.9.16.98])
 by csgraf.de (Postfix) with ESMTPSA id 23A70608068E;
 Thu, 16 Sep 2021 17:54:06 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: [PATCH v12 02/10] hvf: Add execute to dirty log permission bitmap
Date: Thu, 16 Sep 2021 17:53:56 +0200
Message-Id: <20210916155404.86958-3-agraf@csgraf.de>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210916155404.86958-1-agraf@csgraf.de>
References: <20210916155404.86958-1-agraf@csgraf.de>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Peter Collingbourne <pcc@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm <qemu-arm@nongnu.org>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hvf's permission bitmap during and after dirty logging does not include
the HV_MEMORY_EXEC permission. At least on Apple Silicon, this leads to
instruction faults once dirty logging was enabled.

Add the bit to make it work properly.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 accel/hvf/hvf-accel-ops.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index d1691be989..71cc2fa70f 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -239,12 +239,12 @@ static void hvf_set_dirty_tracking(MemoryRegionSection *section, bool on)
     if (on) {
         slot->flags |= HVF_SLOT_LOG;
         hv_vm_protect((uintptr_t)slot->start, (size_t)slot->size,
-                      HV_MEMORY_READ);
+                      HV_MEMORY_READ | HV_MEMORY_EXEC);
     /* stop tracking region*/
     } else {
         slot->flags &= ~HVF_SLOT_LOG;
         hv_vm_protect((uintptr_t)slot->start, (size_t)slot->size,
-                      HV_MEMORY_READ | HV_MEMORY_WRITE);
+                      HV_MEMORY_READ | HV_MEMORY_WRITE | HV_MEMORY_EXEC);
     }
 }
 
-- 
2.30.1 (Apple Git-130)


