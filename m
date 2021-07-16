Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A75A13CB3BE
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 10:07:18 +0200 (CEST)
Received: from localhost ([::1]:47326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4IsO-0003hR-OG
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 04:07:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m4IpR-0007Gq-Ns
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 04:04:13 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:41558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m4IpQ-0005Kv-7r
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 04:04:13 -0400
Received: by mail-wr1-x433.google.com with SMTP id k4so11000427wrc.8
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 01:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qWN2HIRs01eKm6dhCHQnthOBil+q+4JpNVw/kRffS9E=;
 b=Ik/je3Kbpm5MBKnh9ysuRUlQYcKW81ukCUUPzizt+Z1UCkc+AZbaG8yQbVf0MF8uSZ
 x9tsZ5X7qSQZgDMZXE9dfShIlb8f+aMpeQ5IXM8pyy2aGIcz46RSbjPs3VeFhIpyDbcn
 +G4C4xbe3pnD5S7C7RZJ4/fxBZhKV4/at8aCQBLdyAUOz/e6VKnOob5LuC8J8x/IbuWC
 l/MHY83Po9skgTJcjBZNkpjdoq8jrjzyPuEhD78Fe7s6M1ZHTwjHZrfTLvIsrChAtQtK
 LR1uJ3NHfRnfy/9xE97zcl8vHvRxKSBJN9h99KIMeJ9Qv10NbMYZigdv/H3hAdyhOW0r
 w/sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qWN2HIRs01eKm6dhCHQnthOBil+q+4JpNVw/kRffS9E=;
 b=DuPESpxOVowt5ky+KAEDfCIw7WmTnS0K3zQ98Fqpuuka37pf7oiC5Tg7jmvUNtgDZS
 n1Xsv+dZt8GWnIHdFzJmaC4PlkSq7ZIckTxk1EbsOOC2Y6PcfHMgqx/p4RD+E3EfDgBA
 NtPpeqpVYthZS/NozPRvG5LpsblzTsJx7e0KsPHsErXstuNvStF2NcYIOucxJlUy0YDO
 v8YBguVJyKFZ/aEVYzHtA5sk/7bra2Rb472Q2tSBkSFiajlLW9gCcvCR9rWuJZ8SkmWf
 W2OFTXeQtbbZqJKePdXNdbY31X6a8LMZybn1pu0LUvDJYe4lGDtF+foIN2JSsOYXcphn
 ZdLQ==
X-Gm-Message-State: AOAM530L0cVsqGDwDdyuzGUz0mRCpl0Pdsn3xSYfbR1BbrISFzKIKFch
 wFReRnxD+jDLnKjgfu0KAE9GBU6zT6/axg==
X-Google-Smtp-Source: ABdhPJyGG7kYeXiI8mfx6rRsOSwiHGbfGimqAVoyqdTbi6ek59K7fHPih3AH2/PyPG/bOja2FZU1EQ==
X-Received: by 2002:a5d:6c6d:: with SMTP id r13mr10656450wrz.227.1626422650795; 
 Fri, 16 Jul 2021 01:04:10 -0700 (PDT)
Received: from localhost.localdomain ([41.34.125.69])
 by smtp.gmail.com with ESMTPSA id p12sm6558046wma.19.2021.07.16.01.04.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 01:04:10 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/9] plugins/hotblocks: Added correct boolean argument parsing
Date: Fri, 16 Jul 2021 10:03:40 +0200
Message-Id: <20210716080345.136784-5-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210716080345.136784-1-ma.mandourr@gmail.com>
References: <20210716080345.136784-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x433.google.com
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


