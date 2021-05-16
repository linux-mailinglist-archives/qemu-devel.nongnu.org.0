Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 684353820C2
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 22:04:45 +0200 (CEST)
Received: from localhost ([::1]:39806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liN0G-0003lE-FS
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 16:04:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1liMuo-0001zJ-Jg; Sun, 16 May 2021 15:59:06 -0400
Received: from mail.csgraf.de ([85.25.223.15]:45390 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1liMul-0008Fx-Lk; Sun, 16 May 2021 15:59:06 -0400
Received: from localhost.localdomain
 (dynamic-095-118-089-019.95.118.pool.telefonica.de [95.118.89.19])
 by csgraf.de (Postfix) with ESMTPSA id A7D3960806A0;
 Sun, 16 May 2021 21:58:59 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: [PATCH v7 05/19] hvf: Make hvf_set_phys_mem() static
Date: Sun, 16 May 2021 21:58:41 +0200
Message-Id: <20210516195855.28869-6-agraf@csgraf.de>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210516195855.28869-1-agraf@csgraf.de>
References: <20210516195855.28869-1-agraf@csgraf.de>
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
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm <qemu-arm@nongnu.org>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The hvf_set_phys_mem() function is only called within the same file.
Make it static.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 accel/hvf/hvf-accel-ops.c | 2 +-
 include/sysemu/hvf_int.h  | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index c2136dfbb8..5bec7b4d6d 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -114,7 +114,7 @@ static int do_hvf_set_memory(hvf_slot *slot, hv_memory_flags_t flags)
     return 0;
 }
 
-void hvf_set_phys_mem(MemoryRegionSection *section, bool add)
+static void hvf_set_phys_mem(MemoryRegionSection *section, bool add)
 {
     hvf_slot *mem;
     MemoryRegion *area = section->mr;
diff --git a/include/sysemu/hvf_int.h b/include/sysemu/hvf_int.h
index ef84a24dd9..d15fa3302a 100644
--- a/include/sysemu/hvf_int.h
+++ b/include/sysemu/hvf_int.h
@@ -43,7 +43,6 @@ struct HVFState {
 };
 extern HVFState *hvf_state;
 
-void hvf_set_phys_mem(MemoryRegionSection *, bool);
 void assert_hvf_ok(hv_return_t ret);
 hvf_slot *hvf_find_overlap_slot(uint64_t, uint64_t);
 int hvf_put_registers(CPUState *);
-- 
2.30.1 (Apple Git-130)


