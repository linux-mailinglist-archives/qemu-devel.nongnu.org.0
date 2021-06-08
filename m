Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE11C39ED61
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 06:09:40 +0200 (CEST)
Received: from localhost ([::1]:37790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqT3b-0006Qa-LK
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 00:09:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lqT2A-0003p6-WE
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 00:08:11 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:34535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lqT29-0008LI-DN
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 00:08:10 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso827771wmc.1
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 21:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=36oKeZ9qVXLT1pntDuTE8MGk4raH2gBouPHQcv/dO34=;
 b=eKaeglgEYxt4DaO7jjobQqoyYuv276p0KGc2TmIROeAfihY7YoSxG9DTdLi9ck3QpS
 HUz+0zzouJAfk2wT6/bxSkrWmtneZHkDsFtVvHIieD2YPR6tIvj9/y/Pkg98LxKPFGG9
 Kc2aDMbFT56hIwwWDQXF9NEfT2hb94opuLa0bp/H5ThQB2sKCNVdZzhZJO8g8vBPLWZb
 1XrU0RFF9QXsVs9rp+MIMtn0qpUMzddZccEXY6tIRtpSIG5u0/h2pybgqXQI6XDaX1Tm
 RHvYoGwvcX+IkPvbXTATIDkzZZXZ3MSQlpm4QWo8e/nzKleBXI5xTUJOkcIU1iLnQh8e
 ugAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=36oKeZ9qVXLT1pntDuTE8MGk4raH2gBouPHQcv/dO34=;
 b=VpgNbjC3V0Guq61tV902qiSeH/JpRSeSac1976IP5CV8PGSObNVR7qY81n6Ml6i0D5
 iL4Y/UJ+8LuwZmoSLetI+3v+pGNpN2YqK3alLE/vjNSFTNmWuhpplSsfK+MQ/u1rJPXI
 oB0rbMBl6Y/MxAY5MA1S7QZbSz6a/z3YPZKQl7z+FOg3q56uZagWaFsn7kLp4TpluaB0
 7RonpMLvKxSuUV6agwzz0U4rM6ID8N7dVsLn8hVFo841cj76ZSjf26rptFiUrk3uAogH
 TMkpdjk8mK4r5vgoP2v2eQS/th8Nfuqs5mfCc2rM75OctllRx8byn99DWRoEhe9MXKeS
 VGoA==
X-Gm-Message-State: AOAM530aCZCsprCMB/96XWKVyA6b4RYEI+3YywPIossDwW3BoO4iC/gR
 W5CcXhIHv2NFjUI5ZOIA1vhBOZ8wtwuKkA==
X-Google-Smtp-Source: ABdhPJwuRvQFwBpUv9+Ucf+U4Jp2UaEzc8vOJU+mkgivBUGNGa0hbtWVI81WJOR2FsLauCv58JA0PQ==
X-Received: by 2002:a1c:7508:: with SMTP id o8mr1958900wmc.70.1623125287778;
 Mon, 07 Jun 2021 21:08:07 -0700 (PDT)
Received: from localhost.localdomain ([197.61.123.212])
 by smtp.gmail.com with ESMTPSA id y189sm16862008wmy.25.2021.06.07.21.08.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 21:08:07 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 1/4] plugins/api: expose symbol lookup to plugins
Date: Tue,  8 Jun 2021 06:05:29 +0200
Message-Id: <20210608040532.56449-2-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210608040532.56449-1-ma.mandourr@gmail.com>
References: <20210608040532.56449-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x329.google.com
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

From: Alex Bennée <alex.bennee@linaro.org>

This is a quality of life helper for plugins so they don't need to
re-implement symbol lookup when dumping an address. The strings are
constant so don't need to be duplicated. One minor tweak is to return
NULL instead of a zero length string to show lookup failed.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210601145824.3849-1-alex.bennee@linaro.org>
Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 include/qemu/qemu-plugin.h | 9 +++++++++
 plugins/api.c              | 6 ++++++
 2 files changed, 15 insertions(+)

diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index 97cdfd7761..dc3496f36c 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -525,6 +525,15 @@ qemu_plugin_register_vcpu_syscall_ret_cb(qemu_plugin_id_t id,
 
 char *qemu_plugin_insn_disas(const struct qemu_plugin_insn *insn);
 
+/**
+ * qemu_plugin_insn_symbol() - best effort symbol lookup
+ * @insn: instruction reference
+ *
+ * Return a static string referring to the symbol. This is dependent
+ * on the binary QEMU is running having provided a symbol table.
+ */
+const char *qemu_plugin_insn_symbol(const struct qemu_plugin_insn *insn);
+
 /**
  * qemu_plugin_vcpu_for_each() - iterate over the existing vCPU
  * @id: plugin ID
diff --git a/plugins/api.c b/plugins/api.c
index 817c9b6b69..332e2c60e2 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -233,6 +233,12 @@ char *qemu_plugin_insn_disas(const struct qemu_plugin_insn *insn)
     return plugin_disas(cpu, insn->vaddr, insn->data->len);
 }
 
+const char *qemu_plugin_insn_symbol(const struct qemu_plugin_insn *insn)
+{
+    const char *sym = lookup_symbol(insn->vaddr);
+    return sym[0] != 0 ? sym : NULL;
+}
+
 /*
  * The memory queries allow the plugin to query information about a
  * memory access.
-- 
2.25.1


