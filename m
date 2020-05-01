Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 977E61C0B50
	for <lists+qemu-devel@lfdr.de>; Fri,  1 May 2020 02:40:46 +0200 (CEST)
Received: from localhost ([::1]:54450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jUJjR-0008UQ-H7
	for lists+qemu-devel@lfdr.de; Thu, 30 Apr 2020 20:40:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39274)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <joseph_myers@mentor.com>) id 1jUJhS-0006gn-Lf
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 20:38:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <joseph_myers@mentor.com>) id 1jUJhO-0001PX-Kt
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 20:38:42 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:50663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joseph_myers@mentor.com>)
 id 1jUJhH-0000q2-Hb
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 20:38:31 -0400
IronPort-SDR: NzgG2ZN8FDdUKs5X1wc1tLbu1mJy/JuADaXL6FyxCuEb6/oQ3G9wAAV1og/dUVaZkm5MZPCJfa
 0l/o9p+7UVlId4QhrtIUjX/QgrKXopSVOZdYAMrIk/mj/5jsoe2LSkDK2S4M2bJi2oEHGYk+55
 CukxClcT7s7BmclxnhEnyoxd07yGPZ0q8QDTn5MBaP/t4qq0Z809Zuoof1KrKF2xP0rvT5bir7
 0aZpQUxf6pmNQmV/as39VvAaLFw+7LMX1X4vd7FPeL8xIyY/LPm5dbFWEG7V9unuiz9U208TQ6
 1IA=
X-IronPort-AV: E=Sophos;i="5.73,337,1583222400"; d="scan'208";a="50425281"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
 by esa1.mentor.iphmx.com with ESMTP; 30 Apr 2020 16:38:22 -0800
IronPort-SDR: eLLb2kazPkwkSMag9soaFnpE8HLydlDe6PuRFzjfqGmidh67GQyR6VkpJMqe152lOUFdiSspHd
 Gy9YOpdr4SlMUXrpCzm/srkJDWXxaUXQY/pu/6WGLIXG0Qv3bksHaILJ/kU9OVHJDEbLkkUHjQ
 ZDsF00rvBMiSKQeKRx6cOI56xVlkkp+kX/m7vrk/okb8Krpj1GeWO2T9YaWopBg3wh5Mcy2xSM
 ocTSvfRcN6WTsIB/APouOM0BaEoL8eorRtaYlacS/q5CJv0DFVuolyBcaOvwwnRX+WRUtGJL5k
 hQ4=
Date: Fri, 1 May 2020 00:38:17 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: <qemu-devel@nongnu.org>
Subject: [PATCH 2/4] softfloat: fix floatx80 pseudo-denormal addition /
 subtraction
Message-ID: <alpine.DEB.2.21.2005010037350.30535@digraph.polyomino.org.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
Received-SPF: pass client-ip=68.232.129.153;
 envelope-from=joseph_myers@mentor.com; helo=esa1.mentor.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/30 20:38:23
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Received-From: 68.232.129.153
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The softfloat function addFloatx80Sigs, used for addition of values
with the same sign and subtraction of values with opposite sign, fails
to handle the case where the two values both have biased exponent zero
and there is a carry resulting from adding the significands, which can
occur if one or both values are pseudo-denormals (biased exponent
zero, explicit integer bit 1).  Add a check for that case, so making
the results match those seen on x86 hardware for pseudo-denormals.

Signed-off-by: Joseph Myers <joseph@codesourcery.com>
---
 fpu/softfloat.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index ac116c70b8..6094d267b5 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -5866,6 +5866,12 @@ static floatx80 addFloatx80Sigs(floatx80 a, floatx80 b, flag zSign,
         zSig1 = 0;
         zSig0 = aSig + bSig;
         if ( aExp == 0 ) {
+            if ((aSig | bSig) & UINT64_C(0x8000000000000000) && zSig0 < aSig) {
+                /* At least one of the values is a pseudo-denormal,
+                 * and there is a carry out of the result.  */
+                zExp = 1;
+                goto shiftRight1;
+            }
             if (zSig0 == 0) {
                 return packFloatx80(zSign, 0, 0);
             }
-- 
2.17.1


-- 
Joseph S. Myers
joseph@codesourcery.com

