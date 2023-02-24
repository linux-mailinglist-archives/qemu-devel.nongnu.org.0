Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 581716A1B0D
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 12:03:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVVqB-0006eO-IG; Fri, 24 Feb 2023 06:02:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVVq6-0006dX-3i
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 06:02:10 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVVq4-0000ry-FC
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 06:02:09 -0500
Received: by mail-wr1-x432.google.com with SMTP id bt28so6836901wrb.8
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 03:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UL9cbfanvKJdm70LAtZ1fItowiCtEfLbfU50/G893cY=;
 b=d7ib19uK/TVtr/noqBXWaPS34Iz4TgGUOGaXRFFVNQqi1Mqxy8O/1o2v2CZjPUZnoS
 3e6O9IY94II0qBcSuoc/V085MziEozyDfnvDHj54d6M9S1pZnTxmxw5lgjJoS4u2je1U
 HfGN8r2PWAKjBB1QZypqVRKzcMWLEooLsz1WeYDHn6fsOAhlgziNtjWVJtPcY/jqIvlI
 x+nzwQyutzLUHmL5f+VpQeMfwYdDlggNU5Z3IhKHGUfdBC7Gg2LBqU4ZhleKv7JE5wo3
 9DQFSsOccmecYSPMvfOBlDL0Jjn3Eue2w0uY6y7kEgCLOS7QPUvC6oW+srpO1h6dO3ud
 4F6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UL9cbfanvKJdm70LAtZ1fItowiCtEfLbfU50/G893cY=;
 b=NtrsnhMOw/Rff8PQKyrJGLV8h955jWiDOGEuQDa0D3aCNiAWDsfI2OP23DTfsmSYyr
 VIXyC38K/fNNuzBplXDA9kvsig52st++JjOzKbFQl3xb7WFsXOz9j9VM92bKQCRKq0mX
 UKTnVsW35hHEhU/sqyNMiR7So/HqDkDfPn8RYSMfG9MNCSL/PYqUPmGL54sikWzF1zJb
 Idr/5IzEI+kO9hyg+enBJ5e0RUOo7OM2k3mOTLnSpQRdOLOV7i2SRN1W1dukE/oR/d0I
 YT3/ZnINgrk0LCbCThENeR99AMf34Tbr9c887J8po2Xg70QsT0IldL56qg5hqwHtQg+o
 jz9g==
X-Gm-Message-State: AO0yUKVzsm4NJFUPdB1nFo7nnfDC166AloZCWYVWSlo5LlbVVi+ghwk9
 K6xcqYMsbYnzMMXioXhhX+/R1C/VaTVm0wHO
X-Google-Smtp-Source: AK7set8TX8F0t15oxg5tvDKvrwgiVOntZAMBL9H0o3hgVsVAreUQL+Xl9BtXOSE65XM+AVgASgLcnw==
X-Received: by 2002:adf:d08f:0:b0:2c6:8e3a:f6fe with SMTP id
 y15-20020adfd08f000000b002c68e3af6femr12813656wrh.51.1677236526306; 
 Fri, 24 Feb 2023 03:02:06 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 r26-20020a05600c2f1a00b003eae73ee4a1sm2498311wmn.17.2023.02.24.03.02.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 24 Feb 2023 03:02:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 2/2] ui/kbd-state: QAPI'fy QKbdModifier
Date: Fri, 24 Feb 2023 12:01:53 +0100
Message-Id: <20230224110153.8559-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230224110153.8559-1-philmd@linaro.org>
References: <20230224110153.8559-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Let QAPI maintain the QKbdModifier enum values.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/ui/kbd-state.h | 16 ----------------
 qapi/ui.json           | 10 ++++++++++
 2 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/include/ui/kbd-state.h b/include/ui/kbd-state.h
index 14ee2c59e4..83e869bc09 100644
--- a/include/ui/kbd-state.h
+++ b/include/ui/kbd-state.h
@@ -9,22 +9,6 @@
 
 #include "qapi/qapi-types-ui.h"
 
-typedef enum QKbdModifier QKbdModifier;
-
-enum QKbdModifier {
-    Q_KBD_MODIFIER_NONE = 0,
-
-    Q_KBD_MODIFIER_SHIFT,
-    Q_KBD_MODIFIER_CTRL,
-    Q_KBD_MODIFIER_ALT,
-    Q_KBD_MODIFIER_ALTGR,
-
-    Q_KBD_MODIFIER_NUMLOCK,
-    Q_KBD_MODIFIER_CAPSLOCK,
-
-    Q_KBD_MODIFIER__MAX
-};
-
 typedef struct QKbdState QKbdState;
 
 /**
diff --git a/qapi/ui.json b/qapi/ui.json
index 0abba3e930..d3230a6bc7 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -920,6 +920,16 @@
             'ac_home', 'ac_back', 'ac_forward', 'ac_refresh', 'ac_bookmarks',
             'lang1', 'lang2' ] }
 
+##
+# @QKbdModifier:
+#
+# An enumeration of keyboard modifier name.
+#
+# Since: 8.0
+##
+{ 'enum': 'QKbdModifier',
+  'data': [ 'none', 'shift', 'ctrl', 'alt', 'altgr', 'numlock', 'capslock' ] }
+
 ##
 # @KeyValueKind:
 #
-- 
2.38.1


