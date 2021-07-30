Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDE63DBA17
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 16:09:32 +0200 (CEST)
Received: from localhost ([::1]:37886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9TCd-0007tM-R8
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 10:09:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m9T2i-0004r4-IC
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 09:59:16 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:53966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m9T2g-0006h2-SO
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 09:59:16 -0400
Received: by mail-wm1-x32a.google.com with SMTP id k4so6046080wms.3
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 06:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zxLw37g0p1U+vj1vQs/yt69khicQeemW6AG3k8dnQrE=;
 b=vRW3SfBXxyzz6/OFuIaK2o2W695xbn9jWnWWG5V/42Hu3Pb6ginIjnv6fAb1OzuRtd
 4/9uSYZMJz67hOMOvXqXXiGRq8igvejsHH1NVSlCZ/3PKMum+WjA17BCGNPXjnyZwlUE
 pc54D1T+1xxmIIptMgzwaZ2LdxhqeLxzH77hno9USafenN6kt3EeYZqCC+LXRD39+57m
 n3ac712eufWg5BOhKiMaZPbpEG+oNm6PMswbCl6i6GR6Jr0XrP8i5v/mUzeV10MJoyhI
 2ZzgrqPhos0xmJ06pKsYrBaOleAElmwme7NzzNxBaAUhBWvR59fN6hxqduqiuWjIdwld
 JAiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zxLw37g0p1U+vj1vQs/yt69khicQeemW6AG3k8dnQrE=;
 b=rpgZi+7LDU9w++9HiVekzbb12cJ1s8EfupLkMpelOxs1g1tZxLAFR7DcltnqYbTxWk
 Zfp0gsuZK/b0Is/vAfrY7Hn8Cu20sNM5bfJprTXAyNJK/fz0lPJufO52qNGmZoZQ7MT9
 7bJMj7RofHwGgWGa9/Y/gWhPdqEj87ZAqvp55BYowrQWgnMVc0jV5iJnWqZkHiuyxb9h
 VZ0STw540acTrHSZbOlQgOeW7a5Y/+UnvaWMVb5e891APx9ggm7j1yfi0z+rH/AfjbeN
 m7dOhdfopudffKIBl9O3n59DLwoxUyPpn4/rTxdS/wIxBXE/PgHRxV0s5a06dyS4phnf
 YuIA==
X-Gm-Message-State: AOAM530nvjZuVmFVrKqoiho/HUryQPWaU8oBXONxYYXnjzxjkfSdQsmW
 UF9Cgc6Q1mt1DwZuiov4dG/AlaH79wU=
X-Google-Smtp-Source: ABdhPJzcpx/jj0afxzSqBSguLIcN4Kv0CeXH6kK4mh3HyUWWlj4qdSeZPLbViMZueB1t1H/sukH9tA==
X-Received: by 2002:a7b:c5d2:: with SMTP id n18mr3239283wmk.97.1627653553313; 
 Fri, 30 Jul 2021 06:59:13 -0700 (PDT)
Received: from localhost.localdomain ([102.44.217.242])
 by smtp.gmail.com with ESMTPSA id h9sm1770277wrw.38.2021.07.30.06.59.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 06:59:13 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 10/13] tests/plugins/insn: made arg inline not positional
 and parse it as bool
Date: Fri, 30 Jul 2021 15:58:14 +0200
Message-Id: <20210730135817.17816-11-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210730135817.17816-1-ma.mandourr@gmail.com>
References: <20210730135817.17816-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x32a.google.com
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
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Made argument "inline" not positional, this has two benefits. First is
that we adhere to how QEMU passes args generally, by taking the last
value of an argument and drop the others. And the second is that this
sets up a framework for potentially adding new args easily.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/plugin/insn.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/tests/plugin/insn.c b/tests/plugin/insn.c
index c253980ec8..0f6a1938c1 100644
--- a/tests/plugin/insn.c
+++ b/tests/plugin/insn.c
@@ -62,8 +62,18 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
                                            const qemu_info_t *info,
                                            int argc, char **argv)
 {
-    if (argc && !strcmp(argv[0], "inline")) {
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
 
     qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);
-- 
2.25.1


