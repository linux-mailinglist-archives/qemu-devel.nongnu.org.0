Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF3933AA96
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 05:55:41 +0100 (CET)
Received: from localhost ([::1]:49256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLfGW-000643-Ue
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 00:55:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lLfEy-0004ea-4e
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 00:54:05 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:6824)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lLfEw-0003Gk-Fd
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 00:54:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1615784042; x=1647320042;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aw9DN9IGcoBDSiClcF6S9CH6NCViGbLuGJDaZ0761Lg=;
 b=fKnuHRjMgLrjVDredSUzK76znMAZ7f8kdl5iE7fwwgfaXc+2ecvO8KNY
 r96KDmJSf6RjjZM3RUyG+IAUm4bplXtmJeO3pQ+QxI28Ai0NkuATPz7Hu
 a0Jnf+Bag1sopUIhjMEMy8M41jJTSIazFIWOxYF8k+uRIg0fEL4IlQZF9 I=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 14 Mar 2021 21:54:01 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg02-sd.qualcomm.com with ESMTP; 14 Mar 2021 21:54:00 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id 8DD42C90; Sun, 14 Mar 2021 23:53:59 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] Hexagon (target/hexagon) remove unnecessary checks in
 find_iclass_slots
Date: Sun, 14 Mar 2021 23:53:57 -0500
Message-Id: <1615784037-26129-1-git-send-email-tsimpson@quicinc.com>
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
Cc: philmd@redhat.com, tsimpson@quicinc.com, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Address feedback from Richard Henderson <<richard.henderson@linaro.org>

Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
---
 target/hexagon/iclass.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/target/hexagon/iclass.c b/target/hexagon/iclass.c
index 378d8a6..6091286 100644
--- a/target/hexagon/iclass.c
+++ b/target/hexagon/iclass.c
@@ -53,10 +53,6 @@ SlotMask find_iclass_slots(Opcode opcode, int itype)
                (opcode == Y2_isync) ||
                (opcode == J2_pause) || (opcode == J4_hintjumpr)) {
         return SLOTS_2;
-    } else if ((itype == ICLASS_V2LDST) && (GET_ATTRIB(opcode, A_STORE))) {
-        return SLOTS_01;
-    } else if ((itype == ICLASS_V2LDST) && (!GET_ATTRIB(opcode, A_STORE))) {
-        return SLOTS_01;
     } else if (GET_ATTRIB(opcode, A_CRSLOT23)) {
         return SLOTS_23;
     } else if (GET_ATTRIB(opcode, A_RESTRICT_PREFERSLOT0)) {
-- 
2.7.4


