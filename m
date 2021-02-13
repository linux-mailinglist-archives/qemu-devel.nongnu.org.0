Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4267231AB93
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 14:17:04 +0100 (CET)
Received: from localhost ([::1]:43264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAunH-0002PW-1I
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 08:17:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAuaE-0001r9-OI
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 08:03:34 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:38744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAuaA-00062y-0l
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 08:03:34 -0500
Received: by mail-wm1-x32b.google.com with SMTP id x4so2509423wmi.3
 for <qemu-devel@nongnu.org>; Sat, 13 Feb 2021 05:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DU60UtHiIsjfUIwkyHpIido7OwIHpSVRKX7ieAqgajQ=;
 b=MgOJtzKDmVz6xS5isOy6KwByaFIJwb5kHvX0B6llHy6epg2jDvXFi5+5rzIQdKYuL0
 FJkDeyd8ivExHX3j7h3vh5c4fwXcqCUazDHLXn+5qsyo510Y1OTUFfGY9d6/8oindUwA
 GMpzgXvaJSVbxeORHjUfjTBMcyMLIamAewSOd6rdOwyBnulDmcVoGe9ka8QYqmQCWPfe
 mxYXhh843xDM6VPDAyz486SSRkR0IbuEJS14T1vmNavUQkB7aaxBJSgLdH8uMXDolMyt
 /agY153eOnEsdjeRUkJ8ddKZmaDEGjtbRcKvLkJf85tLOBiEgPvXHiYv35QVbCKX4GLx
 2yxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DU60UtHiIsjfUIwkyHpIido7OwIHpSVRKX7ieAqgajQ=;
 b=Q1rx895UcJdF0miTcM9/3XWAJHkquQEIHllQLM9XZDjMlHlrJpMUt/Zkx/THoVgYjW
 C+Jk8c9H7jRRlG8ybnRG6KasJ/lZidUTWOnp/uecna/T9sifcEgjRyxcXta21w/uxSuH
 PF8g4SuVLAkkSfhSYBskwHJgnDo0MNtVS3oPSCEmdOXs+NMcBn4CglhcO5H8zXFlAdle
 bkyjIq58g6r6kGOS2aAgYqav0Er25ozTmKf/rTMQRTabwOGVpzFlTy+8MiJNNx0rUIbO
 hTY9z64TuVcs9bdOhoFar7LwD4Aono8tcVyTAF7pH+ob7/yvn/ao5ruXNFb7tOWye+Yl
 TpaQ==
X-Gm-Message-State: AOAM531rDA9XjKMfjSYoMviMML/APvJDatC6HJKi0mRveosLKoss5MjV
 K5Pqg9KBWeoYPIr55zDWxr+yWA==
X-Google-Smtp-Source: ABdhPJzdXbDDzehzLaB81Q1ya+kki5fEw7N5pqWLG4m3M6CgTKpVFi9KUAml2koUdtgg/XY+eUy/JQ==
X-Received: by 2002:a7b:cc98:: with SMTP id p24mr6705220wma.113.1613221408531; 
 Sat, 13 Feb 2021 05:03:28 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u137sm2050480wmu.20.2021.02.13.05.03.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Feb 2021 05:03:26 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id ACF231FF8C;
 Sat, 13 Feb 2021 13:03:25 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 02/23] plugins: add API to return a name for a IO device
Date: Sat, 13 Feb 2021 13:03:04 +0000
Message-Id: <20210213130325.14781-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210213130325.14781-1-alex.bennee@linaro.org>
References: <20210213130325.14781-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 kuhn.chenqun@huawei.com, Clement Deschamps <clement.deschamps@greensocs.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This may well end up being anonymous but it should always be unique.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Clement Deschamps <clement.deschamps@greensocs.com>
Reviewed-by: Emilio G. Cota <cota@braap.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20200713200415.26214-11-alex.bennee@linaro.org>
Message-Id: <20210210221053.18050-3-alex.bennee@linaro.org>
---
 include/qemu/qemu-plugin.h |  6 ++++++
 plugins/api.c              | 20 ++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index 5775e82c4e..c66507fe8f 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -330,6 +330,12 @@ struct qemu_plugin_hwaddr *qemu_plugin_get_hwaddr(qemu_plugin_meminfo_t info,
 bool qemu_plugin_hwaddr_is_io(const struct qemu_plugin_hwaddr *haddr);
 uint64_t qemu_plugin_hwaddr_device_offset(const struct qemu_plugin_hwaddr *haddr);
 
+/*
+ * Returns a string representing the device. The string is valid for
+ * the lifetime of the plugin.
+ */
+const char *qemu_plugin_hwaddr_device_name(const struct qemu_plugin_hwaddr *h);
+
 typedef void
 (*qemu_plugin_vcpu_mem_cb_t)(unsigned int vcpu_index,
                              qemu_plugin_meminfo_t info, uint64_t vaddr,
diff --git a/plugins/api.c b/plugins/api.c
index bbdc5a4eb4..5dc8e6f934 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -303,6 +303,26 @@ uint64_t qemu_plugin_hwaddr_device_offset(const struct qemu_plugin_hwaddr *haddr
     return 0;
 }
 
+const char *qemu_plugin_hwaddr_device_name(const struct qemu_plugin_hwaddr *h)
+{
+#ifdef CONFIG_SOFTMMU
+    if (h && h->is_io) {
+        MemoryRegionSection *mrs = h->v.io.section;
+        if (!mrs->mr->name) {
+            unsigned long maddr = 0xffffffff & (uintptr_t) mrs->mr;
+            g_autofree char *temp = g_strdup_printf("anon%08lx", maddr);
+            return g_intern_string(temp);
+        } else {
+            return g_intern_string(mrs->mr->name);
+        }
+    } else {
+        return g_intern_static_string("RAM");
+    }
+#else
+    return g_intern_static_string("Invalid");
+#endif
+}
+
 /*
  * Queries to the number and potential maximum number of vCPUs there
  * will be. This helps the plugin dimension per-vcpu arrays.
-- 
2.20.1


