Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAD9D6209
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Oct 2019 14:08:13 +0200 (CEST)
Received: from localhost ([::1]:48458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iJz92-0006Fs-1h
	for lists+qemu-devel@lfdr.de; Mon, 14 Oct 2019 08:08:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53392)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ysato@users.sourceforge.jp>) id 1iJyzJ-0005Po-SS
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 07:58:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ysato@users.sourceforge.jp>) id 1iJyzI-0003UY-Fu
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 07:58:09 -0400
Received: from mail03.asahi-net.or.jp ([202.224.55.15]:35673)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <ysato@users.sourceforge.jp>) id 1iJyzI-0003Qe-6t
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 07:58:08 -0400
Received: from h61-195-96-97.vps.ablenet.jp (h61-195-96-97.ablenetvps.ne.jp
 [61.195.96.97]) (Authenticated sender: PQ4Y-STU)
 by mail03.asahi-net.or.jp (Postfix) with ESMTPA id 917D370D39;
 Mon, 14 Oct 2019 20:58:04 +0900 (JST)
Received: from yo-satoh-debian.localdomain (ZM005235.ppp.dion.ne.jp
 [222.8.5.235])
 by h61-195-96-97.vps.ablenet.jp (Postfix) with ESMTPSA id B9A81240090;
 Mon, 14 Oct 2019 20:58:03 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: qemu-devel@nongnu.org
Subject: [PATCH v26 02/21] qemu/bitops.h: Add extract8 and extract16
Date: Mon, 14 Oct 2019 20:57:38 +0900
Message-Id: <20191014115757.51866-3-ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191014115757.51866-1-ysato@users.sourceforge.jp>
References: <20191014115757.51866-1-ysato@users.sourceforge.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 202.224.55.15
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
Cc: Richard Henderson <richard.henderson@linaro.org>, philmd@redhat.com,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-Id: <20190607091116.49044-10-ysato@users.sourceforge.jp>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/bitops.h | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/include/qemu/bitops.h b/include/qemu/bitops.h
index 3f0926cf40..764f9d1ea0 100644
--- a/include/qemu/bitops.h
+++ b/include/qemu/bitops.h
@@ -300,6 +300,44 @@ static inline uint32_t extract32(uint32_t value, int=
 start, int length)
     return (value >> start) & (~0U >> (32 - length));
 }
=20
+/**
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
+    assert(start >=3D 0 && length > 0 && length <=3D 8 - start);
+    return extract32(value, start, length);
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
+static inline uint16_t extract16(uint16_t value, int start, int length)
+{
+    assert(start >=3D 0 && length > 0 && length <=3D 16 - start);
+    return extract32(value, start, length);
+}
+
 /**
  * extract64:
  * @value: the value to extract the bit field from
--=20
2.20.1


