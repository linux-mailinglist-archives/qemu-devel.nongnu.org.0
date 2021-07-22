Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 815E63D1EC6
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 09:17:14 +0200 (CEST)
Received: from localhost ([::1]:53620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6SxF-0005Zz-Fs
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 03:17:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m6St0-0005yh-9E
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 03:12:50 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:34699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m6Ssy-0005My-KE
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 03:12:50 -0400
Received: by mail-wr1-x42e.google.com with SMTP id u1so4790941wrs.1
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 00:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9YvtSymqUoD0Ep/Zs7OWqwqxy2FOGQ26RHoeEjgQ23k=;
 b=Uo+mlFhp6r5XrBESlTAeo+MckE1kfMAHkiFtwBx844BSW0Y2GqnAuCrUjaZqabxLsm
 rq7DdIc5I8+MUSGEuCgbUGye52C+Op/dYdkJNn4XsYfloH4nGXmORKCNuRiyOZ3VWcVg
 ACgrJNbCqb58SWi/L9RYjBK8YYjrOpDqo7D2UwkDdK2kyDUDV9MoQsxJW3mxESq+Nd2d
 6FfG3OxwYK6HHM+HuJAvXdK5FIKwO51mPx0nPv5lAA+IWKPvSeJARWHGlYrk9ITZ9+4/
 O3DS+Dw0W/Bq6Gmm3jBWFz+Ztpy8GbiHcNpC+PjRtB+pALMh62fFJ4EOLWiEXnMnaLy5
 gQ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9YvtSymqUoD0Ep/Zs7OWqwqxy2FOGQ26RHoeEjgQ23k=;
 b=GjHBdvlmFigv5JeWBhl/mhxhcOiplFkfNzWuDThekRCC9Vy76bv/4fE4igKZ5ZoV1g
 YIgxl+ua+eyZdzv6LJma1m2vVoHK2d5hGMrN2zfMuySMFAeSCuFP1ZPkfJS+ogB7By0N
 clG3sPCqTkN6zWMF3r7ASgSEMapFWEDKEH+/iVY+4sW2aQRydNi5z603fL2KybLNsw0M
 6QZh+tlQKBn+QeBdYOfYdXKIUAzsCjWf+w0DfG1UF/thXP3XpQgRamsRpTz6rp4hTdLb
 KUXhpAg60gBzcUKZCnx+D3UkHmlzHCS9NwD4iNVPkIpluUu1COgitpP1XrKOmjojUmHT
 fw9w==
X-Gm-Message-State: AOAM533Z/4S9Q4guqNlgS2xCZ4GyXlHMbi/Qqd6TP5VlfqUbFbuFBHaM
 WReqk3B/9pFgSjt+8Johr7pJiSg89sg=
X-Google-Smtp-Source: ABdhPJwy/tC4MFJiz4b1dUtSdfZvM0ZxGhwiPLg4JdV91TlQRf88MqXqgDlw949VUT88TBOfzgYa4A==
X-Received: by 2002:adf:fd8a:: with SMTP id d10mr47375874wrr.108.1626937967065; 
 Thu, 22 Jul 2021 00:12:47 -0700 (PDT)
Received: from localhost.localdomain ([102.44.10.38])
 by smtp.gmail.com with ESMTPSA id v21sm1802871wml.5.2021.07.22.00.12.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 00:12:46 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/13] plugins/api: added a boolean parsing plugin api
Date: Thu, 22 Jul 2021 09:12:25 +0200
Message-Id: <20210722071236.139520-3-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210722071236.139520-1-ma.mandourr@gmail.com>
References: <20210722071236.139520-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x42e.google.com
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

This call will help boolean argument parsing since arguments are now
passed to plugins as a name and value.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 include/qemu/qemu-plugin.h | 13 +++++++++++++
 plugins/api.c              |  5 +++++
 2 files changed, 18 insertions(+)

diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index dc3496f36c..7d0b23c659 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -564,4 +564,17 @@ int qemu_plugin_n_max_vcpus(void);
  */
 void qemu_plugin_outs(const char *string);
 
+/**
+ * qemu_plugin_bool_parse() - parses a boolean argument in the form of
+ * "<argname>=[on|yes|true|off|no|false]"
+ *
+ * @name: argument name, the part before the equals sign
+ * @val: argument value, what's after the equals sign
+ * @ret: output return value
+ *
+ * returns true if the combination @name=@val parses correctly to a boolean
+ * argument, and false otherwise
+ */
+bool qemu_plugin_bool_parse(const char *name, const char *val, bool *ret);
+
 #endif /* QEMU_PLUGIN_API_H */
diff --git a/plugins/api.c b/plugins/api.c
index 332e2c60e2..404a1b6120 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -383,3 +383,8 @@ void qemu_plugin_outs(const char *string)
 {
     qemu_log_mask(CPU_LOG_PLUGIN, "%s", string);
 }
+
+bool qemu_plugin_bool_parse(const char *name, const char *value, bool *ret)
+{
+    return name && value && qapi_bool_parse(name, value, ret, NULL);
+}
-- 
2.25.1


