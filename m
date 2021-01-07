Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B873F2EE9A2
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 00:14:35 +0100 (CET)
Received: from localhost ([::1]:38292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxeUE-0001Aw-RD
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 18:14:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kxeTI-0000DO-Sk
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 18:13:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kxeTH-0005Rt-4X
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 18:13:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610061213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bCKf0dJs6RQ/Wv/a6sAZ4FdrXAo8vuoJKc+2OHQPe4o=;
 b=G72+ZcKwXNVaMOxDTIX/6gFmvkVan4jKOs85sVOjWIUGdpRBo/OKyZKaWf3RuS8fT8rRop
 5/jLIkCraXVbBp6fxnwIQdDCwzw/V2T8x2Rf/fvcTg1GU7Qkx+Q+Y0DmVEL4Ycd2wrJafY
 E6iAIQwC5kZhg1M/9iKodKuhElnMuo0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-8Vp222pJO0qUrNZCJO-GQg-1; Thu, 07 Jan 2021 18:13:29 -0500
X-MC-Unique: 8Vp222pJO0qUrNZCJO-GQg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C7CE10054FF;
 Thu,  7 Jan 2021 23:13:28 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-112-59.ams2.redhat.com [10.36.112.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2A33860BF1;
 Thu,  7 Jan 2021 23:13:23 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1] s390x/tcg: Fix RISBHG
Date: Fri,  8 Jan 2021 00:13:22 +0100
Message-Id: <20210107231322.56345-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.246,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Nick Desaulniers <ndesaulniers@google.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RISBHG is broken and currently hinders clang builds of upstream kernels
from booting: the kernel crashes early, while decompressing the image.

  [...]
   Kernel fault: interruption code 0005 ilc:2
   Kernel random base: 0000000000000000
   PSW : 0000200180000000 0000000000017a1e
         R:0 T:0 IO:0 EX:0 Key:0 M:0 W:0 P:0 AS:0 CC:2 PM:0 RI:0 EA:3
   GPRS: 0000000000000001 0000000c00000000 00000003fffffff4 00000000fffffff0
         0000000000000000 00000000fffffff4 000000000000000c 00000000fffffff0
         00000000fffffffc 0000000000000000 00000000fffffff8 00000000008e25a8
         0000000000000009 0000000000000002 0000000000000008 000000000000bce0

One example of a buggy instruction is:

    17dde:       ec 1e 00 9f 20 5d       risbhg  %r1,%r14,0,159,32

With %r14 = 0x9 and %r1 = 0x7 should result in %r1 = 0x900000007, however,
results in %r1 = 0.

Let's interpret values of i3/i4 as documented in the PoP and make
computation of "mask" only based on i3 and i4 and use "pmask" only at the
very end to make sure wrapping is only applied to the high/low doubleword.

With this patch, I can successfully boot a v5.10 kernel built with
clang, and gcc builds keep on working.

Fixes: 2d6a869833d9 ("target-s390: Implement RISBG")
Reported-by: Nick Desaulniers <ndesaulniers@google.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---

This BUG was a nightmare to debug and the code a nightmare to understand.

To make clang/gcc builds boot, the following fix is required as well on
top of current master: "[PATCH] target/s390x: Fix ALGSI"
https://lkml.kernel.org/r/20210107202135.52379-1-david@redhat.com

---
 target/s390x/translate.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/target/s390x/translate.c b/target/s390x/translate.c
index 3d5c0d6106..39e33eeb67 100644
--- a/target/s390x/translate.c
+++ b/target/s390x/translate.c
@@ -3815,22 +3815,23 @@ static DisasJumpType op_risbg(DisasContext *s, DisasOps *o)
         pmask = 0xffffffff00000000ull;
         break;
     case 0x51: /* risblg */
-        i3 &= 31;
-        i4 &= 31;
+        i3 = (i3 & 31) + 32;
+        i4 = (i4 & 31) + 32;
         pmask = 0x00000000ffffffffull;
         break;
     default:
         g_assert_not_reached();
     }
 
-    /* MASK is the set of bits to be inserted from R2.
-       Take care for I3/I4 wraparound.  */
-    mask = pmask >> i3;
+    /* MASK is the set of bits to be inserted from R2. */
     if (i3 <= i4) {
-        mask ^= pmask >> i4 >> 1;
+        /* [0...i3---i4...63] */
+        mask = (-1ull >> i3) & (-1ull << (63 - i4));
     } else {
-        mask |= ~(pmask >> i4 >> 1);
+        /* [0---i4...i3---63] */
+        mask = (-1ull >> i3) | (-1ull << (63 - i4));
     }
+    /* For RISBLG/RISBHG, the wrapping is limited to the high/low doubleword. */
     mask &= pmask;
 
     /* IMASK is the set of bits to be kept from R1.  In the case of the high/low
@@ -3843,9 +3844,6 @@ static DisasJumpType op_risbg(DisasContext *s, DisasOps *o)
     len = i4 - i3 + 1;
     pos = 63 - i4;
     rot = i5 & 63;
-    if (s->fields.op2 == 0x5d) {
-        pos += 32;
-    }
 
     /* In some cases we can implement this with extract.  */
     if (imask == 0 && pos == 0 && len > 0 && len <= rot) {
-- 
2.29.2


