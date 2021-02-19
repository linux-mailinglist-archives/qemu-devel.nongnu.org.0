Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2499531FB73
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 15:56:46 +0100 (CET)
Received: from localhost ([::1]:53740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD7D3-0004OD-5f
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 09:56:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73S-0002KV-8E
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:46:50 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:36326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73B-0003Tm-3n
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:46:49 -0500
Received: by mail-wr1-x431.google.com with SMTP id u14so8897285wri.3
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 06:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=qKpO3g5I9T89Pw01l2LVIOco0YgBK3pSTlmYgHP1fjA=;
 b=UPc5qbYJ3BncknN1yf8s1CSy4n29Q9AOq7jKpPZkhtQEa0wcGVs2TwlaRiB3pufwTA
 0o2N1itB2QAN6w+61DKMcDlU96q+OVKRTMK7SpkUXHdnOtSty+CVEd+PnKvPIPMrtc+6
 O1/xIE1YFvg7cjjuUtc2AsTYmuV9WbxqVXXx7nJVn5LjH3gajp6D24TMTGqSHsZQyJjv
 xj8hqgmLC1z2/RRPMC4HikV4TYJ12kJW/UCCMxc1egdVdOgaxnDkmxLWv0Xgf1UhCs+F
 IIsKUFQu59FIg2NTD5wph8NAQgupZhy4P+jYuc5CcusMCouTT1fJzq7E4Icdkmx3JZPA
 Ap5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qKpO3g5I9T89Pw01l2LVIOco0YgBK3pSTlmYgHP1fjA=;
 b=QvTZnH/TL3FNMbg2Y2duAgQTSHSq0KWaIbftVZaTxHr2bgz6FYhx0fpb6askledo1A
 Lqp9CfxR8CYSp8dZqm3NGSi3mzSqcmvy5BRUaaWdCQfNRm8Hbccibv1nmJmf1yOMghaO
 7oS87CP1umy83hCufql76kKDHwLEgokabDM60t1d4SETgg9BhOV1C/+/EtckQJOFcHX7
 QjfHxrLGAxHmtg1wdsGYSVI1w9oQdHP0u2QkG1uq8rXBqCrZiOpcRlvnRq6TRdQD/TP5
 yA3T+Hal4Z/zJgbTS8XRF8/fH6M1gFXBse6E1NFs+6mo1JypAcRUGFFs2aEz1B4+18VJ
 GDNg==
X-Gm-Message-State: AOAM531B9FwPFhbaNkZ662LJQYQqrcDyw4wdXkbz7demzDkKafzs6lSc
 4KNm+lsUyX6szd0CNLZsWy02gQ==
X-Google-Smtp-Source: ABdhPJyvu7riBEgbeotpuQAGeeDW9e6I1433Y4BpYmaa72kFjMR4lTQVxeJ3bnrMd/Wh1X6dzp6ZWg==
X-Received: by 2002:a5d:66c5:: with SMTP id k5mr9721886wrw.302.1613745991830; 
 Fri, 19 Feb 2021 06:46:31 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q18sm2263628wrw.91.2021.02.19.06.46.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 06:46:31 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 15/44] hw/misc/iotkit-sysctl: Handle INITSVTOR* for SSE-300
Date: Fri, 19 Feb 2021 14:45:48 +0000
Message-Id: <20210219144617.4782-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210219144617.4782-1-peter.maydell@linaro.org>
References: <20210219144617.4782-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The SSE-300 has only one CPU and so no INITSVTOR1. It does
have INITSVTOR0, but unlike the SSE-200 this register now
has a LOCK bit which can be set to 1 to prevent any further
writes to the register. Implement these differences.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/misc/iotkit-sysctl.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/hw/misc/iotkit-sysctl.c b/hw/misc/iotkit-sysctl.c
index 54004bebcbf..ab97055f529 100644
--- a/hw/misc/iotkit-sysctl.c
+++ b/hw/misc/iotkit-sysctl.c
@@ -45,6 +45,7 @@ REG32(SWRESET, 0x108)
     FIELD(SWRESET, SWRESETREQ, 9, 1)
 REG32(GRETREG, 0x10c)
 REG32(INITSVTOR0, 0x110)
+    FIELD(INITSVTOR0, LOCK, 0, 1)
 REG32(INITSVTOR1, 0x114)
 REG32(CPUWAIT, 0x118)
 REG32(NMI_ENABLE, 0x11c) /* BUSWAIT in IoTKit */
@@ -167,6 +168,8 @@ static uint64_t iotkit_sysctl_read(void *opaque, hwaddr offset,
         case ARMSSE_SSE200:
             r = s->initsvtor1;
             break;
+        case ARMSSE_SSE300:
+            goto bad_offset;
         default:
             g_assert_not_reached();
         }
@@ -358,8 +361,25 @@ static void iotkit_sysctl_write(void *opaque, hwaddr offset,
         s->gretreg = value;
         break;
     case A_INITSVTOR0:
-        s->initsvtor0 = value;
-        set_init_vtor(0, s->initsvtor0);
+        switch (s->sse_version) {
+        case ARMSSE_SSE300:
+            /* SSE300 has a LOCK bit which prevents further writes when set */
+            if (s->initsvtor0 & R_INITSVTOR0_LOCK_MASK) {
+                qemu_log_mask(LOG_GUEST_ERROR,
+                              "IoTKit INITSVTOR0 write when register locked\n");
+                break;
+            }
+            s->initsvtor0 = value;
+            set_init_vtor(0, s->initsvtor0 & ~R_INITSVTOR0_LOCK_MASK);
+            break;
+        case ARMSSE_IOTKIT:
+        case ARMSSE_SSE200:
+            s->initsvtor0 = value;
+            set_init_vtor(0, s->initsvtor0);
+            break;
+        default:
+            g_assert_not_reached();
+        }
         break;
     case A_CPUWAIT:
         switch (s->sse_version) {
@@ -464,6 +484,8 @@ static void iotkit_sysctl_write(void *opaque, hwaddr offset,
             s->initsvtor1 = value;
             set_init_vtor(1, s->initsvtor1);
             break;
+        case ARMSSE_SSE300:
+            goto bad_offset;
         default:
             g_assert_not_reached();
         }
-- 
2.20.1


