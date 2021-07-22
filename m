Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC433D1EBF
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 09:14:12 +0200 (CEST)
Received: from localhost ([::1]:45666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6SuI-0000Cr-VY
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 03:14:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m6St2-00061w-S8
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 03:12:52 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:33291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m6St1-0005Pp-DV
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 03:12:52 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 k14-20020a05600c1c8eb02901f13dd1672aso1974124wms.0
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 00:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qWN2HIRs01eKm6dhCHQnthOBil+q+4JpNVw/kRffS9E=;
 b=bnXzRNou3B0QNiGKhYYdq9XybemWfoFTodXM4iK0Ph/nWabvtdRK3ub7Tx0iQKySsX
 4T12bGJZqci6f8M64fCoB//E+s49mqqoa5rMR2fxbpdd4C1zkufysdwb5XpDnYys6TKv
 ijKSUY0+rC8j1didsr/5Zfc7/k/Ldi7WbrPMquE8lI1CoXV2exX40t4nZ+tK7VRQwRTT
 STsa84cGixL26RVpyj1jHXok0QzFl2izAEATvYoX4m4lziU2xaUtRQQXl9bEXsiGG8wE
 m2hl6Dc++xVNP802vx5pBADbjCjkIGQGY9R74lwscr1hN5BAQQC2HYITMqWg2l0Qg5iH
 3oSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qWN2HIRs01eKm6dhCHQnthOBil+q+4JpNVw/kRffS9E=;
 b=GW4QH2qWCQ8Gv5EorPMSWK9GulgMhIQGCwDTQujtrT13Ty+jQbfqQKDOsS2cUw1jtH
 lPv8WZQQxTzTaNIanGZpk6RFGcy/BlAyZjwyMMVbWKO10lgkUqn6dsywm425VPTTWhU6
 MeUJtfI+X7J62WxJ+lTpDyVLuCAsjixY0WHrQ9JhdYy/L6t7ddLTmP+Mobuqhpu1Zomz
 7t92l4iKYPp0Vp6KBBXatpwso06qVEs5lwvVPB2m+RVqSh+5hoXOkLPJPJMCx91X8d9/
 Cjl/mVwpRpiTu1j0Lc0b3RAIzIa9k4MRs61hGoH0QHYuaGa3sstTQI4xEcqbF7fluxhr
 ejxg==
X-Gm-Message-State: AOAM533i2lLuc5jjBELgZepIVbACWP316xHTCvTp94Qd2GVtmFkaRE3M
 z86DZvcFwcW5XnHJph85VS5SnYJgSu4=
X-Google-Smtp-Source: ABdhPJxbPKmfNwZVc8gbzzUwMRDdS5ucF15O/tvTw5/RBP5Jna+JI+jM2n0fHTg7B4zYx6rcOWzXLw==
X-Received: by 2002:a1c:7410:: with SMTP id p16mr7392085wmc.6.1626937969995;
 Thu, 22 Jul 2021 00:12:49 -0700 (PDT)
Received: from localhost.localdomain ([102.44.10.38])
 by smtp.gmail.com with ESMTPSA id v21sm1802871wml.5.2021.07.22.00.12.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 00:12:49 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/13] plugins/hotblocks: Added correct boolean argument
 parsing
Date: Thu, 22 Jul 2021 09:12:27 +0200
Message-Id: <20210722071236.139520-5-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210722071236.139520-1-ma.mandourr@gmail.com>
References: <20210722071236.139520-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>, cota@braap.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 contrib/plugins/hotblocks.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/contrib/plugins/hotblocks.c b/contrib/plugins/hotblocks.c
index 4b08340143..062200a7a4 100644
--- a/contrib/plugins/hotblocks.c
+++ b/contrib/plugins/hotblocks.c
@@ -133,8 +133,18 @@ QEMU_PLUGIN_EXPORT
 int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
                         int argc, char **argv)
 {
-    if (argc && strcmp(argv[0], "inline") == 0) {
-        do_inline = true;
+    for (int i = 0; i < argc; i++) {
+        char *opt = argv[i];
+        g_autofree char **tokens = g_strsplit(opt, "=", 2);
+        if (g_strcmp0(tokens[0], "inline") == 0) {
+            if (!qemu_plugin_bool_parse(tokens[0], tokens[1], &do_inline)) {
+                fprintf(stderr, "boolean argument parsing failed: %s\n", opt);
+                return -1;
+            }
+        } else {
+            fprintf(stderr, "option parsing failed: %s\n", opt);
+            return -1;
+        }
     }
 
     plugin_init();
-- 
2.25.1


