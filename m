Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9033B3CC297
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 12:19:39 +0200 (CEST)
Received: from localhost ([::1]:58178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4hQ2-00023f-KL
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 06:19:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m4hH4-0007lm-IC
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 06:10:22 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:39665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m4hH0-0007TR-AR
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 06:10:22 -0400
Received: by mail-wr1-x433.google.com with SMTP id f17so14984839wrt.6
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 03:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qWN2HIRs01eKm6dhCHQnthOBil+q+4JpNVw/kRffS9E=;
 b=D8Rd1wtV9jDH3ODltaV8pm7t/cjt6cgrOEn35a1lSGPUy1jhVKtZPcSVfRR9z3F3Z8
 ytSOPOf5y3Qq9NkRry4sgvzpxNhwNllRClWVx5Mxg0A+JupujooLNWiaIlZp5B35ueJa
 lc/z6p29oCjYlBHOM6QNYomdRNU6Hp6olb+cz0nhX4GQbCGjcfBzGpRGjzLJKyoXZilF
 l/5Foc+c1+MYecQEmQ/HeVLpMJYMZ+Qw+FubSDuQ+qm8rhrQvlnXq3mk2mpqtHkNpJ58
 +0yRJ5ksd3vVds4sWr10XtbxkhtHiQnjWH6iC1DElmqaxBNU1lLmZDrGxjMNquqMOuWQ
 NSBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qWN2HIRs01eKm6dhCHQnthOBil+q+4JpNVw/kRffS9E=;
 b=Q0KsNeUbtSw6ABIJVgoX33j+d8qlwwt43wfXeXZ8SgM9Qo/Ef8ltB9qheojFVlrXkM
 ib4vwZf/DXArVm2wXigz/7zfbRYrwcpWyJEsot+sBtxbHCwQiPzcji3qDLsl/8twtXC8
 X9LyiJ8TjnmLoj2X82zOqkkz9xNZS3x/3bD+5c+GxEMkuHJNm6Ff3v+Q5n+qMQkEUIaG
 MLfYFMjhiU2s2topU7bQWUEsVw2gqvTSSHaYgkcW2z/I8BTLUO1d6H3mHZ5tk9dDmwoS
 U8qhXN+5nDD0Vxx4exL+TpHNJiaQ1MtYNFhKvodM1hxWGEZiaAf4lgFZa9SMJdKddbgi
 lpyg==
X-Gm-Message-State: AOAM53051Lwil8Cgfcn7XNtCVKW8T0Q4t205oo/evIemxwJqna+5pGCG
 i29+ewZeh/EAvr2mntsbmsoPV2rv01A=
X-Google-Smtp-Source: ABdhPJwyeCsSFZl3e5c//9b0Lm2GtOIeFLhkpZ08jv8JlhcPAfuS8esqXGsK62z2GtFxUR6ukaib3Q==
X-Received: by 2002:a5d:4d01:: with SMTP id z1mr17628099wrt.34.1626516613711; 
 Sat, 17 Jul 2021 03:10:13 -0700 (PDT)
Received: from localhost.localdomain ([41.34.125.69])
 by smtp.gmail.com with ESMTPSA id 11sm13846923wmo.10.2021.07.17.03.10.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 03:10:13 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/13] plugins/hotblocks: Added correct boolean argument
 parsing
Date: Sat, 17 Jul 2021 12:09:11 +0200
Message-Id: <20210717100920.240793-5-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210717100920.240793-1-ma.mandourr@gmail.com>
References: <20210717100920.240793-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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


