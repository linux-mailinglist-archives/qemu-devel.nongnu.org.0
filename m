Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0E852F21A
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 20:10:43 +0200 (CEST)
Received: from localhost ([::1]:44662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ns75G-0000ou-9d
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 14:10:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ns6wY-0003rM-5d; Fri, 20 May 2022 14:01:42 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:43866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ns6wW-0004Fd-Cp; Fri, 20 May 2022 14:01:41 -0400
Received: by mail-ej1-x62b.google.com with SMTP id m20so16968911ejj.10;
 Fri, 20 May 2022 11:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2JfOSXedVx9zd/uj2U6R7U6NlLpjul8WVbgYbN02e5g=;
 b=ebi6bPToYWk4BUV0EvqKGDP4zpqySNZ5ajFoul4NlDAsyQ9VnbgpoLQNFtCST15sT6
 e4zIIIPnfx92vC8olRbiNk6+bHskr78u49dmD3HCUX0aGzMj1/3i1hT6nXgcIGP8s6bK
 xwe0xLau48k178Yuxeai+nbI/C3/HMN3k5t8aQHPMAgB8rsOdYD2ssH1cJGOzgtdy5sF
 BORXnpnEuURlCZL2+cG1QSXqWPGtGk/OG3s+OVhlTZoZC+VaN7/qKOfrxme0Rdvw3ray
 cZmLknuyKKYbUuoUCBaaGmXmHAyk6rmEw5QEqBtNmwOj/hDtGTmRoBZbIv7CPsFuhUNf
 YkuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2JfOSXedVx9zd/uj2U6R7U6NlLpjul8WVbgYbN02e5g=;
 b=Pfp/+Wt9XJn3pF+VYscPftVyDcaYRb7v4Ymu7y8RsEvyWjRz4ZIt8tLWC+ajO20vQI
 rAUSYNJOoWWxHzGIPqoN6wlqfIsznXq5eCKTZSumrELCN+pjzoUisYkwlxf75TlY6/gd
 wU+GRfkGc2Dzs3XBB+P+1R5bh3lmKXyE618Aw6d0Mccash+vY5yAhfYNfV7tZq0d41Kr
 nf7Bz5NwARCwVN0bMtCOY7GuOGvNKOrLfsFcMILrr5uRN3KchKrlLgo7W+pYwgqs9tcO
 fq3Nv8vUskwuBSSA1eQXTV0s3ezfjjue21+L3byntFj+HofSjpfkE5tAdjhAFzSI3Yo/
 yaUA==
X-Gm-Message-State: AOAM532hSqjB/yEs/MDiESs5RvmzDa+UWxcf7TA3Xy6y2R46hyMNv8Kc
 +I7/7Wzsu+GriWlnlse8M4vyS1uwW8c=
X-Google-Smtp-Source: ABdhPJwAIa6JMAX7NhXQXDdrHB+Phu01dccMM8fqoIQabowHveKI/UR660lBBeZwSOXexcNvHK95bQ==
X-Received: by 2002:a17:907:9609:b0:6f4:d4d7:7c82 with SMTP id
 gb9-20020a170907960900b006f4d4d77c82mr9467330ejc.483.1653069698191; 
 Fri, 20 May 2022 11:01:38 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-089-014-209-236.89.14.pool.telefonica.de. [89.14.209.236])
 by smtp.gmail.com with ESMTPSA id
 w5-20020aa7cb45000000b0042aa7e0f892sm4622029edt.15.2022.05.20.11.01.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 11:01:37 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v2 03/10] hw/i386/pc: Unexport PC_CPU_MODEL_IDS macro
Date: Fri, 20 May 2022 20:01:02 +0200
Message-Id: <20220520180109.8224-4-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220520180109.8224-1-shentey@gmail.com>
References: <20220520180109.8224-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The macro seems to be used only internally, so remove it.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/pc.c         | 9 +++++++++
 include/hw/i386/pc.h | 8 --------
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index c914ac0154..2ffaac52fb 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -96,6 +96,15 @@
 #include "trace.h"
 #include CONFIG_DEVICES
 
+/*
+ * Helper for setting model-id for CPU models that changed model-id
+ * depending on QEMU versions up to QEMU 2.4.
+ */
+#define PC_CPU_MODEL_IDS(v) \
+    { "qemu32-" TYPE_X86_CPU, "model-id", "QEMU Virtual CPU version " v, },\
+    { "qemu64-" TYPE_X86_CPU, "model-id", "QEMU Virtual CPU version " v, },\
+    { "athlon-" TYPE_X86_CPU, "model-id", "QEMU Virtual CPU version " v, },
+
 GlobalProperty pc_compat_7_0[] = {};
 const size_t pc_compat_7_0_len = G_N_ELEMENTS(pc_compat_7_0);
 
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index ffcac5121e..38be346a13 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -287,14 +287,6 @@ extern const size_t pc_compat_1_5_len;
 extern GlobalProperty pc_compat_1_4[];
 extern const size_t pc_compat_1_4_len;
 
-/* Helper for setting model-id for CPU models that changed model-id
- * depending on QEMU versions up to QEMU 2.4.
- */
-#define PC_CPU_MODEL_IDS(v) \
-    { "qemu32-" TYPE_X86_CPU, "model-id", "QEMU Virtual CPU version " v, },\
-    { "qemu64-" TYPE_X86_CPU, "model-id", "QEMU Virtual CPU version " v, },\
-    { "athlon-" TYPE_X86_CPU, "model-id", "QEMU Virtual CPU version " v, },
-
 #define DEFINE_PC_MACHINE(suffix, namestr, initfn, optsfn) \
     static void pc_machine_##suffix##_class_init(ObjectClass *oc, void *data) \
     { \
-- 
2.36.1


