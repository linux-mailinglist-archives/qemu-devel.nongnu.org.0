Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E86348756
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 04:08:59 +0100 (CET)
Received: from localhost ([::1]:43682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPGMk-0005uj-Ct
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 23:08:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lPG4x-0003Fn-4M
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 22:50:35 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:1696)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lPG4g-0002bm-PY
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 22:50:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1616640618; x=1648176618;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HLLV9uTxQFSJ3nY6E5btN8mXh4JnMi3MYYxVTgqjdLY=;
 b=oON9Ngq3CXpZuUtdk+jHKlUxIAIhflixRmZGMjV5G1u1uHYwqLFSzukx
 tVGWG1DQn3+tKAfwt3DnrwlL2iELHmwbVcWZjZg2tlvvyEkhj1rB15FdZ
 J2ZzEpLGgY6hGPP485g42VQGB3vnM7IQ7NZXdURLQ+2hgFqwCSRhW5Cy4 w=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 24 Mar 2021 19:50:13 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP; 24 Mar 2021 19:50:12 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 0435B163D; Wed, 24 Mar 2021 21:50:12 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/15] Hexagon (target/hexagon) utility function changes
Date: Wed, 24 Mar 2021 21:50:01 -0500
Message-Id: <1616640610-17319-7-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616640610-17319-1-git-send-email-tsimpson@quicinc.com>
References: <1616640610-17319-1-git-send-email-tsimpson@quicinc.com>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Remove unused carry_from_add64 function
Change type of softfloat_roundingmodes

Address feedback from Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
---
 target/hexagon/arch.c   | 15 +--------------
 target/hexagon/arch.h   |  1 -
 target/hexagon/macros.h |  2 --
 3 files changed, 1 insertion(+), 17 deletions(-)

diff --git a/target/hexagon/arch.c b/target/hexagon/arch.c
index 09de124..bb51f19 100644
--- a/target/hexagon/arch.c
+++ b/target/hexagon/arch.c
@@ -76,19 +76,6 @@ uint64_t deinterleave(uint64_t src)
     return myeven | (myodd << 32);
 }
 
-uint32_t carry_from_add64(uint64_t a, uint64_t b, uint32_t c)
-{
-    uint64_t tmpa, tmpb, tmpc;
-    tmpa = fGETUWORD(0, a);
-    tmpb = fGETUWORD(0, b);
-    tmpc = tmpa + tmpb + c;
-    tmpa = fGETUWORD(1, a);
-    tmpb = fGETUWORD(1, b);
-    tmpc = tmpa + tmpb + fGETUWORD(1, tmpc);
-    tmpc = fGETUWORD(1, tmpc);
-    return tmpc;
-}
-
 int32_t conv_round(int32_t a, int n)
 {
     int64_t val;
@@ -108,7 +95,7 @@ int32_t conv_round(int32_t a, int n)
 
 /* Floating Point Stuff */
 
-static const int softfloat_roundingmodes[] = {
+static const FloatRoundMode softfloat_roundingmodes[] = {
     float_round_nearest_even,
     float_round_to_zero,
     float_round_down,
diff --git a/target/hexagon/arch.h b/target/hexagon/arch.h
index 1f7f036..6e0b0d9 100644
--- a/target/hexagon/arch.h
+++ b/target/hexagon/arch.h
@@ -22,7 +22,6 @@
 
 uint64_t interleave(uint32_t odd, uint32_t even);
 uint64_t deinterleave(uint64_t src);
-uint32_t carry_from_add64(uint64_t a, uint64_t b, uint32_t c);
 int32_t conv_round(int32_t a, int n);
 void arch_fpop_start(CPUHexagonState *env);
 void arch_fpop_end(CPUHexagonState *env);
diff --git a/target/hexagon/macros.h b/target/hexagon/macros.h
index cfcb817..8cb211d 100644
--- a/target/hexagon/macros.h
+++ b/target/hexagon/macros.h
@@ -341,8 +341,6 @@ static inline void gen_logical_not(TCGv dest, TCGv src)
 #define fWRITE_LC0(VAL) WRITE_RREG(HEX_REG_LC0, VAL)
 #define fWRITE_LC1(VAL) WRITE_RREG(HEX_REG_LC1, VAL)
 
-#define fCARRY_FROM_ADD(A, B, C) carry_from_add64(A, B, C)
-
 #define fSET_OVERFLOW() SET_USR_FIELD(USR_OVF, 1)
 #define fSET_LPCFG(VAL) SET_USR_FIELD(USR_LPCFG, (VAL))
 #define fGET_LPCFG (GET_USR_FIELD(USR_LPCFG))
-- 
2.7.4


