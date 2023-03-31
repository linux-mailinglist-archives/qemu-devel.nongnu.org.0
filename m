Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 148BA6D14A1
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 03:05:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pi39R-0003Fl-Po; Thu, 30 Mar 2023 21:01:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3_zAmZAcKCiIIMKJMBGEMMEJC.AMKOCKS-BCTCJLMLELS.MPE@flex--komlodi.bounces.google.com>)
 id 1pi39P-0003F1-4j
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 21:01:55 -0400
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3_zAmZAcKCiIIMKJMBGEMMEJC.AMKOCKS-BCTCJLMLELS.MPE@flex--komlodi.bounces.google.com>)
 id 1pi39N-0006by-A0
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 21:01:54 -0400
Received: by mail-pl1-x649.google.com with SMTP id
 z16-20020a170902d55000b001a06f9b5e31so12297588plf.21
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 18:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680224511;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=z9daf8epV3wtDyZD1agoFY4Syp6h/vNC0BTkpI5/9/A=;
 b=jt4DXKXc7jdVUZE1N8eMgT1Z6F64+BFuReMETxbBaGlFkD16Locc22TTP98EzHGHGT
 S/f0iTK1TISEknUPonuuV1EY1o9vmTWt7C2h0WyltPHqgajVQcgVCMH1V5mw40jL1XXD
 rC0nSor4/qNV6skNVUI78w4X1HjGUIUK8Jh0Z+8/Zyqd8ytqukmz7pVBe7PGCMF6qxRS
 9pVjesHiAWMIA/zpjyv+CvbsYy3aXK++XQGqr6evk0T1+p8RLZtpb2PL8WMwLAIGzMiu
 Aso8M0HXihVVxAZMFljEPoNAE4mni+6lNiikBbrmukSpIyVpPbJ90bcW/L7Q/eN4e9K7
 AuFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680224511;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z9daf8epV3wtDyZD1agoFY4Syp6h/vNC0BTkpI5/9/A=;
 b=RdmcBFlzs8O/tOlJ7BvezrTCRe9eimZyWwGrgfiJfx2Q0OshG1Zw6cezoXp63EKa8N
 GQDWlNuBk8Zz8IOgGnEmwQz/ugwwOBovz9AbfMp0O/OJTNzk7WpsIiyKSILxv9iI3x4A
 acJYUeFwM40hDgvSbcEJpMMd/y1BCaj6Zxhet2ipx8jQlYfOeQ7pTgIhZBzzo6G5mwv2
 tfCMCxQ9iZl6wRSdjlIBbyglBTfWeZxB/dd9+eMrg5Vkcok/k8uJyz++6SnVXGoNGWpR
 gxpiI1iN/LZuf8chmTK5h1RoVXKi/PvqR1ijGvbXM5M1RcVbMN5s3juIHHy7Am5J9Jx4
 Mvng==
X-Gm-Message-State: AAQBX9crlVUtaKKmBvVkWQAyKx1bi1HAIwNw1f8uhlanJKOnGUCJ7HCH
 Ay2n5LiGi/noRwNSttLY6JYhdirDVssL9Zd/MCN3DmHIladXzeI/4slX3Ga3LXn/i8Yb0TFzx7i
 LZZ5uLpT8Nvf/IEOhO4HcSnPi2GMYplBdrMLSxvDyEM3AtYcK16p9fg3Pj3dx00Q=
X-Google-Smtp-Source: AKy350ajrU+uwpm0u2ajBH5dwdp5V8EdIIFbxnuvDcfN5QLkP7jFt9tDpR+lXVyRzhE+BewoOKTRZclQyyK8
X-Received: from komlodi.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:35ee])
 (user=komlodi job=sendgmr) by 2002:a05:6a00:a1a:b0:62d:9b70:1afd with SMTP id
 p26-20020a056a000a1a00b0062d9b701afdmr3616121pfh.1.1680224511502; Thu, 30 Mar
 2023 18:01:51 -0700 (PDT)
Date: Fri, 31 Mar 2023 01:01:26 +0000
In-Reply-To: <20230331010131.1412571-1-komlodi@google.com>
Mime-Version: 1.0
References: <20230331010131.1412571-1-komlodi@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <20230331010131.1412571-12-komlodi@google.com>
Subject: [PATCH 11/16] hw/i3c/aspeed_i3c: Add ctrl MMIO handling
From: Joe Komlodi <komlodi@google.com>
To: qemu-devel@nongnu.org
Cc: venture@google.com, komlodi@google.com, peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::649;
 envelope-from=3_zAmZAcKCiIIMKJMBGEMMEJC.AMKOCKS-BCTCJLMLELS.MPE@flex--komlodi.bounces.google.com;
 helo=mail-pl1-x649.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

Adds functionality to the CTRL register.

Signed-off-by: Joe Komlodi <komlodi@google.com>

Reviewed-by: Titus Rwantare <titusr@google.com>
Reviewed-by: Patrick Venture <venture@google.com>
---
 hw/i3c/aspeed_i3c.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/hw/i3c/aspeed_i3c.c b/hw/i3c/aspeed_i3c.c
index 055ad3f7fd..4c0c074012 100644
--- a/hw/i3c/aspeed_i3c.c
+++ b/hw/i3c/aspeed_i3c.c
@@ -340,6 +340,8 @@ REG32(DEVICE_ADDR_TABLE_LOC1, 0x280)
     FIELD(DEVICE_ADDR_TABLE_LOC1, DEV_NACK_RETRY_CNT, 29, 2)
     FIELD(DEVICE_ADDR_TABLE_LOC1, LEGACY_I2C_DEVICE, 31, 1)
 
+static void aspeed_i3c_device_cmd_queue_execute(AspeedI3CDevice *s);
+
 static const uint32_t ast2600_i3c_controller_ro[ASPEED_I3C_DEVICE_NR_REGS] = {
     [R_I3C1_REG0]                   = 0xfc000000,
     [R_I3C1_REG1]                   = 0xfff00000,
@@ -588,6 +590,37 @@ static int aspeed_i3c_device_recv_data(AspeedI3CDevice *s, bool is_i2c,
     return ret;
 }
 
+static inline void aspeed_i3c_device_ctrl_w(AspeedI3CDevice *s,
+                                                   uint32_t val)
+{
+    /*
+     * If the user is setting I3C_RESUME, the controller was halted.
+     * Try and resume execution and leave the bit cleared.
+     */
+    if (FIELD_EX32(val, DEVICE_CTRL, I3C_RESUME)) {
+        aspeed_i3c_device_cmd_queue_execute(s);
+        val = FIELD_DP32(val, DEVICE_CTRL, I3C_RESUME, 0);
+    }
+    /*
+     * I3C_ABORT being set sends an I3C STOP. It's cleared when the STOP is
+     * sent.
+     */
+    if (FIELD_EX32(val, DEVICE_CTRL, I3C_ABORT)) {
+        aspeed_i3c_device_end_transfer(s, /*is_i2c=*/true);
+        aspeed_i3c_device_end_transfer(s, /*is_i2c=*/false);
+        val = FIELD_DP32(val, DEVICE_CTRL, I3C_ABORT, 0);
+        ARRAY_FIELD_DP32(s->regs, INTR_STATUS, TRANSFER_ABORT, 1);
+        aspeed_i3c_device_update_irq(s);
+    }
+    /* Update present state. */
+    ARRAY_FIELD_DP32(s->regs, PRESENT_STATE, CM_TFR_ST_STATUS,
+                     ASPEED_I3C_TRANSFER_STATE_IDLE);
+    ARRAY_FIELD_DP32(s->regs, PRESENT_STATE, CM_TFR_STATUS,
+                     ASPEED_I3C_TRANSFER_STATUS_IDLE);
+
+    s->regs[R_DEVICE_CTRL] = val;
+}
+
 static inline bool aspeed_i3c_device_target_is_i2c(AspeedI3CDevice *s,
                                                    uint16_t offset)
 {
@@ -1650,6 +1683,9 @@ static void aspeed_i3c_device_write(void *opaque, hwaddr offset,
                       "] = 0x%08" PRIx64 "\n",
                       __func__, offset, value);
         break;
+    case R_DEVICE_CTRL:
+        aspeed_i3c_device_ctrl_w(s, val32);
+        break;
     case R_RX_TX_DATA_PORT:
         aspeed_i3c_device_push_tx(s, val32);
         break;
-- 
2.40.0.348.gf938b09366-goog


