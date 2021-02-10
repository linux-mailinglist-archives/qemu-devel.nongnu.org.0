Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 936C6317351
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 23:28:27 +0100 (CET)
Received: from localhost ([::1]:55418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9xyE-0005Iu-DZ
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 17:28:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9xhR-0005vM-Dg
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:11:06 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:51418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9xhM-0003CC-IY
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:11:04 -0500
Received: by mail-wm1-x32a.google.com with SMTP id t142so3200000wmt.1
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 14:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y0m7VVtf4raaNuNx2ajjykIh+1usimL3d/eZHQe+IRc=;
 b=Pv4k8SK356+dY5TXKSodwj3Ot+IS+03+aEIHJkkKnbInzlySRFq1LxDDxKgfLu91NH
 SgG7N5hQcuzqwA4sWhcwiica8A1oG7eAaQIfqBaE6XVY4Qd7K79mMTA2T7R9M8GjvMIu
 GZqecjZUpQ2XzvJ0QgAwKxN4BPRxVe/mTH9hlLukTs2M3cz6xrX8eNsikXGuIlA60rfm
 l+BiedjPSWpsFGpbjiyx0EZbfyCtEtcIeLm5Mw0w/I9cJ99SXQL/SycG8FUDttTDLm3n
 epA2xNn2hp9lZ3Xaqxk+4jL5Bi4DCGV0wVXPrc2ALzgzTQYzVRN1yWK3I10FXEMt9Ivx
 S9wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y0m7VVtf4raaNuNx2ajjykIh+1usimL3d/eZHQe+IRc=;
 b=td9o0VQLAEKFGudDH0Sdxl0xO5cW3XWLGxXt4Ei/3udj8qYcT/RrqsuGJb8VSvyoB9
 /GESQhdm0ZPktXD9ahvd8VgqaJ17UzKBolpkmTvBQcZhTRaK7jGzj8S7hPejUazripBP
 RjSL5MyN42ARru25VJuJZEsimPF4ZXEo198m0mG5YNOx4jKA2p31FwpKTNkIdnwplfCV
 tw9JyaI6QX0lwbuc+Bl1bgQHmVp1x3PpWtt2vMWED7cP9Rll14UQbTqkxlrfa/NMdTJp
 Ly15ZRiNp7Odx0ILt+Id26a3KbJYcNlU9Ima1VwX1EoFjvIR6PCE6yisnEXuLAcp7ON6
 /9+A==
X-Gm-Message-State: AOAM533xogYvGC7A/QdUYwf8+aJtXeI2ja0m5j35zg4r09RjsJgjGhr6
 xVtcaYpWpgjHe8qhkYl8gUwcBA==
X-Google-Smtp-Source: ABdhPJwV28jEJ/vxmWZIaE1a7uMgPNT0PEM89crf99StLgMRmDJ/Gyqvxdv6WaFsQDotStsAy1VJUQ==
X-Received: by 2002:a1c:bcc3:: with SMTP id m186mr1184901wmf.165.1612995057840; 
 Wed, 10 Feb 2021 14:10:57 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t197sm17939984wmt.3.2021.02.10.14.10.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 14:10:54 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id ADF7E1FF8C;
 Wed, 10 Feb 2021 22:10:53 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 02/21] plugins: add API to return a name for a IO device
Date: Wed, 10 Feb 2021 22:10:34 +0000
Message-Id: <20210210221053.18050-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210210221053.18050-1-alex.bennee@linaro.org>
References: <20210210221053.18050-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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

---
v4
  - use g_intern_static_string for static strings
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


