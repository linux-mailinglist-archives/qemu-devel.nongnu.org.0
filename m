Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8D53F606D
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 16:31:28 +0200 (CEST)
Received: from localhost ([::1]:43396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIXST-0002LB-Bg
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 10:31:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mIXPG-0006No-Ai; Tue, 24 Aug 2021 10:28:02 -0400
Received: from [201.28.113.2] (port=17948 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luis.pires@eldorado.org.br>)
 id 1mIXPF-0007nQ-0d; Tue, 24 Aug 2021 10:28:02 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 24 Aug 2021 11:27:58 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 2F5AA8010FC;
 Tue, 24 Aug 2021 11:27:58 -0300 (-03)
From: Luis Pires <luis.pires@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 02/19] host-utils: move abs64() to host-utils
Date: Tue, 24 Aug 2021 11:27:13 -0300
Message-Id: <20210824142730.102421-3-luis.pires@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210824142730.102421-1-luis.pires@eldorado.org.br>
References: <20210824142730.102421-1-luis.pires@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 24 Aug 2021 14:27:58.0430 (UTC)
 FILETIME=[3C7287E0:01D798F4]
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
 groug@kaod.org, Luis Pires <luis.pires@eldorado.org.br>,
 Paolo Bonzini <pbonzini@redhat.com>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move abs64 to host-utils so it can be reused elsewhere.
Also made it inline.

Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
---
 hw/i386/kvm/i8254.c       | 5 -----
 include/qemu/host-utils.h | 8 ++++++++
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/hw/i386/kvm/i8254.c b/hw/i386/kvm/i8254.c
index fa68669e8a..761034743b 100644
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
diff --git a/include/qemu/host-utils.h b/include/qemu/host-utils.h
index 711b221704..5fec44a9c4 100644
--- a/include/qemu/host-utils.h
+++ b/include/qemu/host-utils.h
@@ -357,6 +357,14 @@ static inline uint64_t revbit64(uint64_t x)
 #endif
 }
 
+/**
+ * Return the absolute value of a 64-bit integer
+ */
+static inline int64_t abs64(int64_t v)
+{
+    return v < 0 ? -v : v;
+}
+
 /**
  * sadd32_overflow - addition with overflow indication
  * @x, @y: addends
-- 
2.25.1


