Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 927AC6B4BE8
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 17:05:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pafDw-0002k1-Qg; Fri, 10 Mar 2023 11:04:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1pafDp-0002df-IC
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 11:03:57 -0500
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1pafDn-0006bE-4b
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 11:03:57 -0500
Received: from [167.98.27.226] (helo=lawrence-thinkpad.office.codethink.co.uk)
 by imap5.colo.codethink.co.uk with esmtpsa (Exim 4.94.2 #2 (Debian))
 id 1pafDj-00H4ad-Gj; Fri, 10 Mar 2023 16:03:51 +0000
From: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
To: qemu-devel@nongnu.org
Cc: dickon.hood@codethink.co.uk, nazar.kazakov@codethink.co.uk,
 kiran.ostrolenk@codethink.co.uk, frank.chang@sifive.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 pbonzini@redhat.com, philipp.tomsich@vrull.eu, kvm@vger.kernel.org
Subject: [PATCH 09/45] qemu/bitops.h: Limit rotate amounts
Date: Fri, 10 Mar 2023 16:03:10 +0000
Message-Id: <20230310160346.1193597-10-lawrence.hunter@codethink.co.uk>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310160346.1193597-1-lawrence.hunter@codethink.co.uk>
References: <20230310160346.1193597-1-lawrence.hunter@codethink.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=78.40.148.171;
 envelope-from=lawrence.hunter@codethink.co.uk; helo=imap5.colo.codethink.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Dickon Hood <dickon.hood@codethink.co.uk>

Rotates have been fixed up to only allow for reasonable rotate amounts
(ie, no rotates >7 on an 8b value etc.)  This fixes a problem with riscv
vector rotate instructions.

Signed-off-by: Dickon Hood <dickon.hood@codethink.co.uk>
---
 include/qemu/bitops.h | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/include/qemu/bitops.h b/include/qemu/bitops.h
index 03213ce952..c443995b3b 100644
--- a/include/qemu/bitops.h
+++ b/include/qemu/bitops.h
@@ -218,7 +218,8 @@ static inline unsigned long find_first_zero_bit(const unsigned long *addr,
  */
 static inline uint8_t rol8(uint8_t word, unsigned int shift)
 {
-    return (word << shift) | (word >> ((8 - shift) & 7));
+    shift &= 7;
+    return (word << shift) | (word >> (8 - shift));
 }
 
 /**
@@ -228,7 +229,8 @@ static inline uint8_t rol8(uint8_t word, unsigned int shift)
  */
 static inline uint8_t ror8(uint8_t word, unsigned int shift)
 {
-    return (word >> shift) | (word << ((8 - shift) & 7));
+    shift &= 7;
+    return (word >> shift) | (word << (8 - shift));
 }
 
 /**
@@ -238,7 +240,8 @@ static inline uint8_t ror8(uint8_t word, unsigned int shift)
  */
 static inline uint16_t rol16(uint16_t word, unsigned int shift)
 {
-    return (word << shift) | (word >> ((16 - shift) & 15));
+    shift &= 15;
+    return (word << shift) | (word >> (16 - shift));
 }
 
 /**
@@ -248,7 +251,8 @@ static inline uint16_t rol16(uint16_t word, unsigned int shift)
  */
 static inline uint16_t ror16(uint16_t word, unsigned int shift)
 {
-    return (word >> shift) | (word << ((16 - shift) & 15));
+    shift &= 15;
+    return (word >> shift) | (word << (16 - shift));
 }
 
 /**
@@ -258,7 +262,8 @@ static inline uint16_t ror16(uint16_t word, unsigned int shift)
  */
 static inline uint32_t rol32(uint32_t word, unsigned int shift)
 {
-    return (word << shift) | (word >> ((32 - shift) & 31));
+    shift &= 31;
+    return (word << shift) | (word >> (32 - shift));
 }
 
 /**
@@ -268,7 +273,8 @@ static inline uint32_t rol32(uint32_t word, unsigned int shift)
  */
 static inline uint32_t ror32(uint32_t word, unsigned int shift)
 {
-    return (word >> shift) | (word << ((32 - shift) & 31));
+    shift &= 31;
+    return (word >> shift) | (word << (32 - shift));
 }
 
 /**
@@ -278,7 +284,8 @@ static inline uint32_t ror32(uint32_t word, unsigned int shift)
  */
 static inline uint64_t rol64(uint64_t word, unsigned int shift)
 {
-    return (word << shift) | (word >> ((64 - shift) & 63));
+    shift &= 63;
+    return (word << shift) | (word >> (64 - shift));
 }
 
 /**
@@ -288,7 +295,8 @@ static inline uint64_t rol64(uint64_t word, unsigned int shift)
  */
 static inline uint64_t ror64(uint64_t word, unsigned int shift)
 {
-    return (word >> shift) | (word << ((64 - shift) & 63));
+    shift &= 63;
+    return (word >> shift) | (word << (64 - shift));
 }
 
 /**
-- 
2.39.2


