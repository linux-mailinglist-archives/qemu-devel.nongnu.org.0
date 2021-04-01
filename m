Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2991A350D50
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 05:56:11 +0200 (CEST)
Received: from localhost ([::1]:36258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRoRF-000300-Kj
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 23:56:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lRoOx-0001Lu-O0
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 23:53:47 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:46761)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lRoOv-0004ri-Cf
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 23:53:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1617249225; x=1648785225;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3v9UZn8HopUm9cQP63ez8kbf0Uv8MfKI8+fTZCjxWSA=;
 b=AUb0DpQiZuEHxxdIlMiCV2WEEbhK0QMJQI3kJ4yys3W1e2TF8hymCiSz
 VEwvpdBa4gEf2LbtMAq/gRhMtnFNY5S+zIuQtR8Mie3X0mRxP5vRU04D1
 JrjDtdhqIUhecqEmOczTXZS6gUmiUXRjnH/dYEWdglAOJ6mbt5k/B1B5p g=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 31 Mar 2021 20:53:41 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg01-sd.qualcomm.com with ESMTP; 31 Mar 2021 20:53:41 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id D62241203; Wed, 31 Mar 2021 22:53:40 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/21] Hexagon (target/hexagon) replace float32_mul_pow2
 with float32_scalbn
Date: Wed, 31 Mar 2021 22:53:22 -0500
Message-Id: <1617249213-22667-11-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617249213-22667-1-git-send-email-tsimpson@quicinc.com>
References: <1617249213-22667-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=199.106.114.38;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-01.qualcomm.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: ale@rev.ng, philmd@redhat.com, tsimpson@quicinc.com,
 richard.henderson@linaro.org, bcain@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
---
 target/hexagon/arch.c | 28 +++++++++++-----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/target/hexagon/arch.c b/target/hexagon/arch.c
index bb51f19..40b6e3d 100644
--- a/target/hexagon/arch.c
+++ b/target/hexagon/arch.c
@@ -143,12 +143,6 @@ void arch_fpop_end(CPUHexagonState *env)
     }
 }
 
-static float32 float32_mul_pow2(float32 a, uint32_t p, float_status *fp_status)
-{
-    float32 b = make_float32((SF_BIAS + p) << SF_MANTBITS);
-    return float32_mul(a, b, fp_status);
-}
-
 int arch_sf_recip_common(float32 *Rs, float32 *Rt, float32 *Rd, int *adjust,
                          float_status *fp_status)
 {
@@ -217,22 +211,22 @@ int arch_sf_recip_common(float32 *Rs, float32 *Rt, float32 *Rd, int *adjust,
         if ((n_exp - d_exp + SF_BIAS) <= SF_MANTBITS) {
             /* Near quotient underflow / inexact Q */
             PeV = 0x80;
-            RtV = float32_mul_pow2(RtV, -64, fp_status);
-            RsV = float32_mul_pow2(RsV, 64, fp_status);
+            RtV = float32_scalbn(RtV, -64, fp_status);
+            RsV = float32_scalbn(RsV, 64, fp_status);
         } else if ((n_exp - d_exp + SF_BIAS) > (SF_MAXEXP - 24)) {
             /* Near quotient overflow */
             PeV = 0x40;
-            RtV = float32_mul_pow2(RtV, 32, fp_status);
-            RsV = float32_mul_pow2(RsV, -32, fp_status);
+            RtV = float32_scalbn(RtV, 32, fp_status);
+            RsV = float32_scalbn(RsV, -32, fp_status);
         } else if (n_exp <= SF_MANTBITS + 2) {
-            RtV = float32_mul_pow2(RtV, 64, fp_status);
-            RsV = float32_mul_pow2(RsV, 64, fp_status);
+            RtV = float32_scalbn(RtV, 64, fp_status);
+            RsV = float32_scalbn(RsV, 64, fp_status);
         } else if (d_exp <= 1) {
-            RtV = float32_mul_pow2(RtV, 32, fp_status);
-            RsV = float32_mul_pow2(RsV, 32, fp_status);
+            RtV = float32_scalbn(RtV, 32, fp_status);
+            RsV = float32_scalbn(RsV, 32, fp_status);
         } else if (d_exp > 252) {
-            RtV = float32_mul_pow2(RtV, -32, fp_status);
-            RsV = float32_mul_pow2(RsV, -32, fp_status);
+            RtV = float32_scalbn(RtV, -32, fp_status);
+            RsV = float32_scalbn(RsV, -32, fp_status);
         }
         RdV = 0;
         ret = 1;
@@ -274,7 +268,7 @@ int arch_sf_invsqrt_common(float32 *Rs, float32 *Rd, int *adjust,
         /* Basic checks passed */
         r_exp = float32_getexp(RsV);
         if (r_exp <= 24) {
-            RsV = float32_mul_pow2(RsV, 64, fp_status);
+            RsV = float32_scalbn(RsV, 64, fp_status);
             PeV = 0xe0;
         }
         RdV = 0;
-- 
2.7.4


