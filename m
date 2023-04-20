Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6A46E8F3D
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 12:08:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppRAH-0000f1-MD; Thu, 20 Apr 2023 06:05:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppRAD-0000c2-13
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:05:17 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppRA6-0003ss-VJ
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:05:16 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-2eed43bfa4bso413779f8f.2
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 03:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681985108; x=1684577108;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=q8LtUQbrNbIcb7AmK/HYZ5o0bALmmnEK3mbIWEsTZ58=;
 b=yDCp9XmGgFs0/vv77YflBnI5uYEBYXaazrbCqQDaxJAgCvn1fQYiudiC/S2hGEXVgW
 abSlxhBUWGhLjo0cn0etGdIZX25SQwbI/S7bTESvXxNXX8Nwvg1kDY9n1npWwTwqteu5
 P5FjdEg2AUbR4S5AnETxgG9HB/Hf5aoQVI56oRzFn6UW44bD5nGhZ/IiPZ4rSUVexZv5
 qgiW/0QtM2RSPVhttb9Gu6qWn9Jq7rlfR4fWybwYiS9ST3+lYa+z/J3nUKQrNdHrBco3
 lwAOdrY9Sg2+uMlzGptmAmo8ov0+Ct2xdQ8ZpLyO9AC9bwbj8lrYFsNWUsrzrfcN95b0
 pCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681985108; x=1684577108;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q8LtUQbrNbIcb7AmK/HYZ5o0bALmmnEK3mbIWEsTZ58=;
 b=bF6Ooi6H9wUfP+oXhpX0zgB1AQZJmn7Ndxw7OM60HCjp4t9/axwSrzEmegMnm+jVE6
 RciM/JTfRa3vnLouJwBXRUsQsVuGwhHIkjEXYucYE9Sa6IivAAn3PKY2Yhiy76oHLwBe
 88oEmWd7WnjAJBZvM5fRrhH852O1J+1E+tCUoYf6dGuyCaiYWxXT4lFKuL4rdVR3Rane
 jtVJ7SrpXPtud5gUa8xZNsjEMgQk8i+h+g0efRbTt63Qe5M0ShX5gA3tYlh9xGzaRofW
 Dg6fQw8KNpiXDGGRZavNPVNlv5h6eyDfFQm7saEphoy85mNDDdgor2etf14c/qmsssOg
 Zfgw==
X-Gm-Message-State: AAQBX9ecXpdNc3CpUeVUxIU0AQHW47IpN8GpyKcJYlIDJoQctHNKAvB2
 ePZJR+IT6E9rc64eRVhodr2iWP75WHQ+3yQqxiI=
X-Google-Smtp-Source: AKy350YSF92wrRmJS+nQORAL+qUgJnCe/fmAPXPkCjdOPCnmo+/5pyAg+75sfJybrDnTdYzzQKeKbw==
X-Received: by 2002:adf:f988:0:b0:2f4:eb13:4091 with SMTP id
 f8-20020adff988000000b002f4eb134091mr885751wrr.45.1681985108346; 
 Thu, 20 Apr 2023 03:05:08 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a5d58c2000000b002fe522117fdsm1556388wrf.36.2023.04.20.03.05.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 03:05:08 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/21] hw/net/imx_fec: Support two Ethernet interfaces
 connected to single MDIO bus
Date: Thu, 20 Apr 2023 11:04:52 +0100
Message-Id: <20230420100456.944969-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230420100456.944969-1-peter.maydell@linaro.org>
References: <20230420100456.944969-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Guenter Roeck <linux@roeck-us.net>

The SOC on i.MX6UL and i.MX7 has 2 Ethernet interfaces. The PHY on each may
be connected to separate MDIO busses, or both may be connected on the same
MDIO bus using different PHY addresses. Commit 461c51ad4275 ("Add a phy-num
property to the i.MX FEC emulator") added support for specifying PHY
addresses, but it did not provide support for linking the second PHY on
a given MDIO bus to the other Ethernet interface.

To be able to support two PHY instances on a single MDIO bus, two properties
are needed: First, there needs to be a flag indicating if the MDIO bus on
a given Ethernet interface is connected. If not, attempts to read from this
bus must always return 0xffff. Implement this property as phy-connected.
Second, if the MDIO bus on an interface is active, it needs a link to the
consumer interface to be able to provide PHY access for it. Implement this
property as phy-consumer.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Message-id: 20230315145248.1639364-2-linux@roeck-us.net
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/net/imx_fec.h |  2 ++
 hw/net/imx_fec.c         | 27 +++++++++++++++++++++++----
 2 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/include/hw/net/imx_fec.h b/include/hw/net/imx_fec.h
index e3a8755db92..2d13290c787 100644
--- a/include/hw/net/imx_fec.h
+++ b/include/hw/net/imx_fec.h
@@ -270,6 +270,8 @@ struct IMXFECState {
     uint32_t phy_int;
     uint32_t phy_int_mask;
     uint32_t phy_num;
+    bool phy_connected;
+    struct IMXFECState *phy_consumer;
 
     bool is_fec;
 
diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index c862d965930..5d1f1f104cc 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -282,11 +282,19 @@ static uint32_t imx_phy_read(IMXFECState *s, int reg)
     uint32_t val;
     uint32_t phy = reg / 32;
 
-    if (phy != s->phy_num) {
-        trace_imx_phy_read_num(phy, s->phy_num);
+    if (!s->phy_connected) {
         return 0xffff;
     }
 
+    if (phy != s->phy_num) {
+        if (s->phy_consumer && phy == s->phy_consumer->phy_num) {
+            s = s->phy_consumer;
+        } else {
+            trace_imx_phy_read_num(phy, s->phy_num);
+            return 0xffff;
+        }
+    }
+
     reg %= 32;
 
     switch (reg) {
@@ -343,11 +351,19 @@ static void imx_phy_write(IMXFECState *s, int reg, uint32_t val)
 {
     uint32_t phy = reg / 32;
 
-    if (phy != s->phy_num) {
-        trace_imx_phy_write_num(phy, s->phy_num);
+    if (!s->phy_connected) {
         return;
     }
 
+    if (phy != s->phy_num) {
+        if (s->phy_consumer && phy == s->phy_consumer->phy_num) {
+            s = s->phy_consumer;
+        } else {
+            trace_imx_phy_write_num(phy, s->phy_num);
+            return;
+        }
+    }
+
     reg %= 32;
 
     trace_imx_phy_write(val, phy, reg);
@@ -1327,6 +1343,9 @@ static Property imx_eth_properties[] = {
     DEFINE_NIC_PROPERTIES(IMXFECState, conf),
     DEFINE_PROP_UINT32("tx-ring-num", IMXFECState, tx_ring_num, 1),
     DEFINE_PROP_UINT32("phy-num", IMXFECState, phy_num, 0),
+    DEFINE_PROP_BOOL("phy-connected", IMXFECState, phy_connected, true),
+    DEFINE_PROP_LINK("phy-consumer", IMXFECState, phy_consumer, TYPE_IMX_FEC,
+                     IMXFECState *),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.34.1


