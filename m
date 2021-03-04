Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CCA32D832
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 17:59:23 +0100 (CET)
Received: from localhost ([::1]:60252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHrJq-0008La-JW
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 11:59:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lHrHH-0007Lr-Rh
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 11:56:43 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:14692)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lHrHF-0008Nh-TN
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 11:56:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1614877001; x=1646413001;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wb6SGyUnZszCkPF9lQmtuTZiJudDthnHtYd2iNHtJiU=;
 b=EKELWZKyCr+35OemNMIvH0kIvAYfoiMWCxqpqyETW+VB1C4cpwgFq1TS
 +ArSopdSVlUH86Vud7oI0PBiXmjA6bQbpbmqjn3wc+0W61M1dzpeBr/8N
 fzROJ0jcKLOoPrtdf0/YtusJiK/lk6L2i89LAGStqb9U+UWINNIKmBm+4 E=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 04 Mar 2021 08:56:38 -0800
X-QCInternal: smtphost
Received: from vm-tsimpson-sd.qualcomm.com ([10.53.72.70])
 by ironmsg05-sd.qualcomm.com with ESMTP; 04 Mar 2021 08:56:37 -0800
Received: by vm-tsimpson-sd.qualcomm.com (Postfix, from userid 47164)
 id E892D19FE; Thu,  4 Mar 2021 08:56:37 -0800 (PST)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] Hexagon (target/hexagon) Fix shift amount check in
 fASHIFTL/fLSHIFTR
Date: Thu,  4 Mar 2021 08:56:35 -0800
Message-Id: <1614876995-30187-1-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
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
Cc: ale@rev.ng, bcain@quicinc.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, tsimpson@quicinc.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Address Coverity warnings

Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
---
 target/hexagon/macros.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/hexagon/macros.h b/target/hexagon/macros.h
index 78c4efb..cfcb817 100644
--- a/target/hexagon/macros.h
+++ b/target/hexagon/macros.h
@@ -459,7 +459,7 @@ static inline void gen_logical_not(TCGv dest, TCGv src)
                    : (fCAST##REGSTYPE##s(SRC) >> (SHAMT)))
 #define fASHIFTR(SRC, SHAMT, REGSTYPE) (fCAST##REGSTYPE##s(SRC) >> (SHAMT))
 #define fLSHIFTR(SRC, SHAMT, REGSTYPE) \
-    (((SHAMT) >= 64) ? 0 : (fCAST##REGSTYPE##u(SRC) >> (SHAMT)))
+    (((SHAMT) >= (sizeof(SRC) * 8)) ? 0 : (fCAST##REGSTYPE##u(SRC) >> (SHAMT)))
 #define fROTL(SRC, SHAMT, REGSTYPE) \
     (((SHAMT) == 0) ? (SRC) : ((fCAST##REGSTYPE##u(SRC) << (SHAMT)) | \
                               ((fCAST##REGSTYPE##u(SRC) >> \
@@ -469,7 +469,7 @@ static inline void gen_logical_not(TCGv dest, TCGv src)
                               ((fCAST##REGSTYPE##u(SRC) << \
                                  ((sizeof(SRC) * 8) - (SHAMT))))))
 #define fASHIFTL(SRC, SHAMT, REGSTYPE) \
-    (((SHAMT) >= 64) ? 0 : (fCAST##REGSTYPE##s(SRC) << (SHAMT)))
+    (((SHAMT) >= (sizeof(SRC) * 8)) ? 0 : (fCAST##REGSTYPE##s(SRC) << (SHAMT)))
 
 #ifdef QEMU_GENERATE
 #define fLOAD(NUM, SIZE, SIGN, EA, DST) MEM_LOAD##SIZE##SIGN(DST, EA)
-- 
2.7.4


