Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2324C17CBE
	for <lists+qemu-devel@lfdr.de>; Wed,  8 May 2019 17:02:01 +0200 (CEST)
Received: from localhost ([127.0.0.1]:38664 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hOO52-0006RX-6E
	for lists+qemu-devel@lfdr.de; Wed, 08 May 2019 11:02:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32987)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ysato@users.sourceforge.jp>) id 1hONzm-0002pG-Nf
	for qemu-devel@nongnu.org; Wed, 08 May 2019 10:56:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ysato@users.sourceforge.jp>) id 1hONzg-000851-UW
	for qemu-devel@nongnu.org; Wed, 08 May 2019 10:56:34 -0400
Received: from mail02.asahi-net.or.jp ([202.224.55.14]:46420)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ysato@users.sourceforge.jp>) id 1hONzg-00083U-K4
	for qemu-devel@nongnu.org; Wed, 08 May 2019 10:56:28 -0400
Received: from h61-195-96-97.vps.ablenet.jp (h61-195-96-97.vps.ablenet.jp
	[61.195.96.97]) (Authenticated sender: PQ4Y-STU)
	by mail02.asahi-net.or.jp (Postfix) with ESMTPA id D8CDD3C107;
	Wed,  8 May 2019 23:56:27 +0900 (JST)
Received: from ysato.dip.jp (v096129.dynamic.ppp.asahi-net.or.jp
	[124.155.96.129])
	by h61-195-96-97.vps.ablenet.jp (Postfix) with ESMTPSA id 6F1E4240085; 
	Wed,  8 May 2019 23:56:27 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: qemu-devel@nongnu.org
Date: Wed,  8 May 2019 23:56:11 +0900
Message-Id: <20190508145611.107133-14-ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190508145611.107133-1-ysato@users.sourceforge.jp>
References: <20190508145611.107133-1-ysato@users.sourceforge.jp>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 202.224.55.14
Subject: [Qemu-devel] [PATCH v10 13/13] qemu/bitops.h: Add extract8 and
 extract16
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 include/qemu/bitops.h | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/include/qemu/bitops.h b/include/qemu/bitops.h
index 3f0926cf40..0dfd81efb2 100644
--- a/include/qemu/bitops.h
+++ b/include/qemu/bitops.h
@@ -301,6 +301,44 @@ static inline uint32_t extract32(uint32_t value, int start, int length)
 }
 
 /**
+ * extract8:
+ * @value: the value to extract the bit field from
+ * @start: the lowest bit in the bit field (numbered from 0)
+ * @length: the length of the bit field
+ *
+ * Extract from the 8 bit input @value the bit field specified by the
+ * @start and @length parameters, and return it. The bit field must
+ * lie entirely within the 8 bit word. It is valid to request that
+ * all 8 bits are returned (ie @length 8 and @start 0).
+ *
+ * Returns: the value of the bit field extracted from the input value.
+ */
+static inline uint8_t extract8(uint8_t value, int start, int length)
+{
+    assert(start >= 0 && length > 0 && length <= 8 - start);
+    return (value >> start) & (~0U >> (32 - length));
+}
+
+/**
+ * extract16:
+ * @value: the value to extract the bit field from
+ * @start: the lowest bit in the bit field (numbered from 0)
+ * @length: the length of the bit field
+ *
+ * Extract from the 16 bit input @value the bit field specified by the
+ * @start and @length parameters, and return it. The bit field must
+ * lie entirely within the 16 bit word. It is valid to request that
+ * all 16 bits are returned (ie @length 16 and @start 0).
+ *
+ * Returns: the value of the bit field extracted from the input value.
+ */
+static inline uint16_t extract16(uint32_t value, int start, int length)
+{
+    assert(start >= 0 && length > 0 && length <= 16 - start);
+    return (value >> start) & (~0U >> (32 - length));
+}
+
+/**
  * extract64:
  * @value: the value to extract the bit field from
  * @start: the lowest bit in the bit field (numbered from 0)
-- 
2.11.0


