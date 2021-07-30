Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 629743DB9F4
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 16:03:30 +0200 (CEST)
Received: from localhost ([::1]:46952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9T6n-0003LJ-Ep
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 10:03:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m9T2S-00042y-Ej
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 09:59:00 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:33327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m9T2Q-0006X4-Bc
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 09:59:00 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 a192-20020a1c7fc90000b0290253b32e8796so7291327wmd.0
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 06:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9YvtSymqUoD0Ep/Zs7OWqwqxy2FOGQ26RHoeEjgQ23k=;
 b=qzpy6wT0hjz3i02zD09Qz4LR41DwX3oHmk4Jg0XOiqE3hVO0PCgHbHSna03YGBsceB
 j4pZpJtPpEALP+uDaKkfqrSA4wSwl8P6uKmu3jyY3edwjNAYKiG2/R7VRdTqG2WfHjs8
 otBTwgBYRUBFs9jrFl3vlP6eyG7JsftaDM2RqxF/WD4R7KOYoIUrMWc2KocpapcnXgSz
 +EuDp1Ru66N490Ctyza2eLDfAndmRt2Fldj0RxFkOqZI3p3FtZPiBXQJe8oQdYfem5uv
 oxXzz/F3E97EM2tuh5ZyPBPjS5VnBLinjFmN0WTD8H/toT1ooz8YyeTw3mn2234r2i6o
 8lCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9YvtSymqUoD0Ep/Zs7OWqwqxy2FOGQ26RHoeEjgQ23k=;
 b=ZC07UaMHhi7FxZD7+Rm81EwbC3IiiduAA4hB4Ot3EIaqFd537lFbfRD5JNK1tgRg7E
 6z/zUZRuHq/0vrIHvMGgcrCscT9lCNI/DBbySy4Nl2Jl2hc5JiUXPSOWA3klfnKOlEP7
 ZU2OIUV1RcDkhXbyrVTK1dX9YThjNkITNGdWCisWF03K7eV5B3qFbUPwxkXzdCescjUR
 NyDyCBx0BUEpysTOiMJZlD2CyBrBRLaR2mscGNPOytScaRfZ40OVIDVheZf4GYDrFgvq
 azagNKpUsvicPJruuwB36r+Opg0Yziv2L3ongZvTOZ+qqPfzCa93Xx3w8te8ueR9VCc4
 EbNA==
X-Gm-Message-State: AOAM530SVZUiSx7HzVlNjhhZguOC22OV7YsdnWeMT6TzbqrAXP6U5fhh
 JtC2TAzRPio/eHeQjWTSU8YnSXLJW0c=
X-Google-Smtp-Source: ABdhPJzrK9OlpZKXwRyAH9dLgzSVWRiFthqPIs+JliUa2ynaq7Sw6nDwWelOXM3WjU5qzeL1+Tun7w==
X-Received: by 2002:a05:600c:414e:: with SMTP id
 h14mr3219100wmm.92.1627653536845; 
 Fri, 30 Jul 2021 06:58:56 -0700 (PDT)
Received: from localhost.localdomain ([102.44.217.242])
 by smtp.gmail.com with ESMTPSA id h9sm1770277wrw.38.2021.07.30.06.58.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 06:58:56 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 02/13] plugins/api: added a boolean parsing plugin api
Date: Fri, 30 Jul 2021 15:58:06 +0200
Message-Id: <20210730135817.17816-3-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210730135817.17816-1-ma.mandourr@gmail.com>
References: <20210730135817.17816-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x334.google.com
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


