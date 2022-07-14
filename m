Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FAD5753B6
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 19:04:25 +0200 (CEST)
Received: from localhost ([::1]:42026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC2GH-0005YQ-3l
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 13:04:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_trohmel@quicinc.com>)
 id 1oC0ES-0000oT-7o
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 10:54:27 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:45172)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quic_trohmel@quicinc.com>)
 id 1oC0EQ-0002nT-HP
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 10:54:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1657810462; x=1689346462;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hapmOFEwmUHGSMahVEGMQVUPE796CbuBCALsQKsJHd4=;
 b=SIrQglTgXcarfFJG9MYtNj8LzXWB4v3sVrVmNSblwUx4u4uzWrcu4lsn
 8r7/BwArc6V89fMj27PPY4EgsjEpNQMt3b5bapnUe6FZ7W6qXTN8UzZCt
 A4gPD/r1qFIIkVREvNfHVPt22V88FKwOzcJ23Yv9bfHYyZN0tqwXOJK2Q 4=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 14 Jul 2022 07:54:19 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2022 07:54:19 -0700
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 14 Jul 2022 07:54:19 -0700
Received: from avd-de-lrx-6.eu.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 14 Jul 2022 07:54:18 -0700
From: Tobias Roehmel <quic_trohmel@quicinc.com>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>, =?UTF-8?q?Tobias=20R=C3=B6hmel?=
 <quic_trohmel@quicinc.com>
Subject: [PATCH 05/11] target/arm: Make stage_2_format for cache attributes
 optional
Date: Thu, 14 Jul 2022 16:53:49 +0200
Message-ID: <20220714145355.7225-6-quic_trohmel@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220714145355.7225-1-quic_trohmel@quicinc.com>
References: <20220714145355.7225-1-quic_trohmel@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
Received-SPF: pass client-ip=199.106.114.38;
 envelope-from=quic_trohmel@quicinc.com; helo=alexa-out-sd-01.qualcomm.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 14 Jul 2022 12:46:13 -0400
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Tobias Röhmel <quic_trohmel@quicinc.com>

The Cortex-R52 has a 2 stage MPU translation process but doesn't have the FEAT_S2FWB feature. This makes it neccessary to allow for the old cache attribut combination.
This is facilitated by changing the control path of combine_cacheattrs instead of failing if the second cache attributes struct is not in that format.

Signed-off-by: Tobias Röhmel <quic_trohmel@quicinc.com>
---
 target/arm/ptw.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 4d97a24808..8b037c1f55 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2108,7 +2108,11 @@ static uint8_t combined_attrs_nofwb(CPUARMState *env,
 {
     uint8_t s1lo, s2lo, s1hi, s2hi, s2_mair_attrs, ret_attrs;
 
-    s2_mair_attrs = convert_stage2_attrs(env, s2.attrs);
+    if (s2.is_s2_format) {
+        s2_mair_attrs = convert_stage2_attrs(env, s2.attrs);
+    } else {
+        s2_mair_attrs = s2.attrs;
+    }
 
     s1lo = extract32(s1.attrs, 0, 4);
     s2lo = extract32(s2_mair_attrs, 0, 4);
@@ -2166,6 +2170,8 @@ static uint8_t force_cacheattr_nibble_wb(uint8_t attr)
 static uint8_t combined_attrs_fwb(CPUARMState *env,
                                   ARMCacheAttrs s1, ARMCacheAttrs s2)
 {
+    assert(s2.is_s2_format && !s1.is_s2_format);
+
     switch (s2.attrs) {
     case 7:
         /* Use stage 1 attributes */
@@ -2215,7 +2221,6 @@ static ARMCacheAttrs combine_cacheattrs(CPUARMState *env,
     ARMCacheAttrs ret;
     bool tagged = false;
 
-    assert(s2.is_s2_format && !s1.is_s2_format);
     ret.is_s2_format = false;
 
     if (s1.attrs == 0xf0) {
-- 
2.25.1


