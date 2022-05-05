Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 149BB51C50A
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 18:23:00 +0200 (CEST)
Received: from localhost ([::1]:34526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmeFn-0005lf-5j
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 12:22:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nmeBO-00020L-9Y; Thu, 05 May 2022 12:18:26 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:45832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nmeBM-0005j0-NK; Thu, 05 May 2022 12:18:25 -0400
Received: by mail-ej1-x635.google.com with SMTP id y3so9645910ejo.12;
 Thu, 05 May 2022 09:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qUtnbnlrI+UnKirLM6NXJpF8MZDLftaoOuEhflZEltQ=;
 b=brkb2uGwgyvMsXeFk8WzFoMDdfQSd/1o6cxzVEd4DLOKK7yDYDxVCRac5gNNxPRWn1
 T7oWutMk93OTI8kETmSpZjXRmBkogqXKnCrFydvUwvOKq3SmsRYkGf/vsybYURP09sus
 6Xwq5GtvaoCxjtBfdYZdfjHliTh9G9E8MoRH+BHLhR00Fd5FNQQ6IIIVHbBeK1NVtAgz
 w+GDX4gDfKB5dcOuEwu0mDyX6BrstXU8TqqEyEanBfvjyIDzxQIwPIcvvGAsUr0tHMnJ
 J1/YNGE+9bJmWCe1T6QncrumOVUvuv3swFTovEt4STh5NEeVkANvGkr5nCfmOvwdhyLb
 SWCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qUtnbnlrI+UnKirLM6NXJpF8MZDLftaoOuEhflZEltQ=;
 b=6sLgK2wvJhIBSDbiWKnHanM9GSSg4IQyK2PtFNwDGl+15FxKOP5Ja+597e9vkNdkLn
 jEqPuoebBwMZSJApYZqG84JNIFcHdxgpaCjd1L3uHhVLURvQ/lrq1q/QzEwvzl84DzcW
 l0hg2KrGzghfS5DuEguMjwxoKIkT7toG0T0iI7ACYdns6gmfD6z8f+U2h37W/TwVDZyW
 09W6351iy8uB2lMzoBf4HaPVOSEztsIn7WMxwwPfGBsDIUIs8SWtdBOjzVUO267NrIb2
 57Pfmp+jiU02bBrfAevkwRxjYcOsizYZ27b2LFDKZXJzk5p9N0dt7gNc7MCV3EfpqiIQ
 77JQ==
X-Gm-Message-State: AOAM5336f8ir6Kv9THPDFWpLZB9esEQ8PkWT6g1jGQhFuvKAQzMBcTuG
 IkrhOxvncothmE4ry/Vl5BFBjkWJeRw=
X-Google-Smtp-Source: ABdhPJy06WVnmA4+bFFXkHCTTo6GIEsrDjZ36MYfTCwxAZbKbLL8talOL/Q5fHSgrwnmgbIuigjhNQ==
X-Received: by 2002:a17:907:c2a:b0:6f4:4b49:9cfb with SMTP id
 ga42-20020a1709070c2a00b006f44b499cfbmr19926797ejc.697.1651767502505; 
 Thu, 05 May 2022 09:18:22 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-078-054-123-159.78.54.pool.telefonica.de. [78.54.123.159])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a17090685c600b006f3ef214dcfsm868542ejy.53.2022.05.05.09.18.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 09:18:22 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH 04/11] hw/i386/pc: Unexport PC_CPU_MODEL_IDS macro
Date: Thu,  5 May 2022 18:17:58 +0200
Message-Id: <20220505161805.11116-5-shentey@gmail.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220505161805.11116-1-shentey@gmail.com>
References: <20220505161805.11116-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x635.google.com
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
---
 hw/i386/pc.c         | 9 +++++++++
 include/hw/i386/pc.h | 8 --------
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 649511a49b..c2975d7de5 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -95,6 +95,15 @@
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
index 637367dc5f..b34c664ff5 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -289,14 +289,6 @@ extern const size_t pc_compat_1_5_len;
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
2.36.0


