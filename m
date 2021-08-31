Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E623FCBCB
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 18:50:33 +0200 (CEST)
Received: from localhost ([::1]:48484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL6y0-0005DU-7X
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 12:50:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mL6rs-0006oc-0n; Tue, 31 Aug 2021 12:44:12 -0400
Received: from [201.28.113.2] (port=43158 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luis.pires@eldorado.org.br>)
 id 1mL6rp-0008P9-DV; Tue, 31 Aug 2021 12:44:11 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 31 Aug 2021 13:43:04 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id EDB2C800930;
 Tue, 31 Aug 2021 13:43:01 -0300 (-03)
From: Luis Pires <luis.pires@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 02/19] host-utils: move abs64() to host-utils as uabs64()
Date: Tue, 31 Aug 2021 13:39:50 -0300
Message-Id: <20210831164007.297781-3-luis.pires@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210831164007.297781-1-luis.pires@eldorado.org.br>
References: <20210831164007.297781-1-luis.pires@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 31 Aug 2021 16:43:04.0271 (UTC)
 FILETIME=[44CBF5F0:01D79E87]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=luis.pires@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, richard.henderson@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, groug@kaod.org,
 Luis Pires <luis.pires@eldorado.org.br>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move abs64 to host-utils as uabs64, so it can be used elsewhere.
The function was renamed to uabs64 and modified to return an
unsigned value. This avoids the undefined behavior for common
abs implementations, where abs of the most negative value is
undefined.

Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
---
 hw/i386/kvm/i8254.c       | 7 +------
 include/qemu/host-utils.h | 8 ++++++++
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/hw/i386/kvm/i8254.c b/hw/i386/kvm/i8254.c
index fa68669e8a..191a26fa57 100644
--- a/hw/i386/kvm/i8254.c
+++ b/hw/i386/kvm/i8254.c
@@ -59,11 +59,6 @@ struct KVMPITClass {
     DeviceRealize parent_realize;
 };
 
-static int64_t abs64(int64_t v)
-{
-    return v < 0 ? -v : v;
-}
-
 static void kvm_pit_update_clock_offset(KVMPITState *s)
 {
     int64_t offset, clock_offset;
@@ -81,7 +76,7 @@ static void kvm_pit_update_clock_offset(KVMPITState *s)
         clock_gettime(CLOCK_MONOTONIC, &ts);
         offset -= ts.tv_nsec;
         offset -= (int64_t)ts.tv_sec * 1000000000;
-        if (abs64(offset) < abs64(clock_offset)) {
+        if (uabs64(offset) < uabs64(clock_offset)) {
             clock_offset = offset;
         }
     }
diff --git a/include/qemu/host-utils.h b/include/qemu/host-utils.h
index 711b221704..0c6715774c 100644
--- a/include/qemu/host-utils.h
+++ b/include/qemu/host-utils.h
@@ -357,6 +357,14 @@ static inline uint64_t revbit64(uint64_t x)
 #endif
 }
 
+/**
+ * Return the absolute value of a 64-bit integer as an unsigned 64-bit value
+ */
+static inline uint64_t uabs64(int64_t v)
+{
+    return v < 0 ? -v : v;
+}
+
 /**
  * sadd32_overflow - addition with overflow indication
  * @x, @y: addends
-- 
2.25.1


