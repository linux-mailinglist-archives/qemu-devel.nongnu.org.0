Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC31269EA7A
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 23:55:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUbVT-0007l0-8S; Tue, 21 Feb 2023 17:53:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUbVH-0007Yo-AY
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 17:52:55 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUbV0-00048G-8p
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 17:52:55 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 j2-20020a05600c1c0200b003e1e754657aso4837550wms.2
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 14:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kwGQxDNbuoIi381f9n/oIctldgRasmJRzr/HFVuEYZ4=;
 b=WOGWaTxsD5z/FKTBp7AP4/IyukZythRHjIn7qR2DlBu2+PmrvMgIF9DbpzdxsjTai8
 DpR7VEQc70BXoQ1yqjOl0PPSIe6G5HNfmAcdsEeY+DcbhprsPPfngF6Yx/kOOtk+JUGC
 eRK0Ym7HupliogQpbpXfsAeFhakZh9/pmcm1Kqe9Xw1Y5eVPYTiX4kvmSnRswUcYqErA
 /aYFQoaXrkJ0yQ++vsshVzQxrAuglNPsBAP8hVL/6VWb+KH6uqhRfNCGt5IMCNrgikxF
 o3Dpj/b/ZHrF6Sr3ySIrvq+rzsjRC6ITYMduWwN/+oit8HEYfnwn22Ao7wkCER66ZR9V
 A0cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kwGQxDNbuoIi381f9n/oIctldgRasmJRzr/HFVuEYZ4=;
 b=4jSu7m9S5WqWp2m0xVC3dZgFF1aMEw07KJEB9aKas5aRC0aoMwwHMWPe6B7dH6JtYO
 A0zulNtPMqKwqJYii4aG4xsgL6GDR0skkBh1et4uyMjdctt6N3faEjVQTc0FSzOa85EK
 /+cApnLG6L3GEW2Pla6WWRfrTi2D7vfd8QukGpsFDeUh1/GbJceurCGWTDAqEeC/p88i
 XU0iF5gsY/j5C0FJPLmcH6sW8LYDBRxrC3/9dhaQve7bHOxWkIZeUQ/7MsagkAJAo3M5
 iCRnWl4LSdXqJEQGtAD1GqaMlp4TVwP1uqYSyUvGWWnuhy4roFP+oWSFixad012xZRDi
 If0Q==
X-Gm-Message-State: AO0yUKU+QPfJalpDcMe8v7UlD0Pyx0nU+sQiuOM6OF5yEPpjnhsCNqVF
 40v+5GfhggAKLPT01Mex0UZWxA==
X-Google-Smtp-Source: AK7set/W2f1sk3/oiXju6d7BUiPoY0iELGYqy094ztEaz0UQhzzR61I3wPHo954ntBaVKcgXuE89ZQ==
X-Received: by 2002:a05:600c:3088:b0:3d3:49db:9b25 with SMTP id
 g8-20020a05600c308800b003d349db9b25mr4947969wmn.26.1677019954695; 
 Tue, 21 Feb 2023 14:52:34 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 q6-20020a05600c46c600b003dc47d458cdsm6451600wmo.15.2023.02.21.14.52.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 14:52:34 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 40D6A1FFD1;
 Tue, 21 Feb 2023 22:52:31 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 nicolas.eder@lauterbach.com, Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>, mads@ynddal.dk,
 Marek Vasut <marex@denx.de>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Eduardo Habkost <eduardo@habkost.net>, Bin Meng <bin.meng@windriver.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Chris Wulff <crwulff@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Greg Kurz <groug@kaod.org>,
 David Hildenbrand <david@redhat.com>, Song Gao <gaosong@loongson.cn>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH v3 23/24] include: split target_long definition from cpu-defs
Date: Tue, 21 Feb 2023 22:52:26 +0000
Message-Id: <20230221225227.3735319-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230221225227.3735319-1-alex.bennee@linaro.org>
References: <20230221225227.3735319-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

While we will continue to include this via cpu-defs it is useful to be
able to define this separately for 32 and 64 bit versions of an
otherwise target independent compilation unit.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/exec/cpu-defs.h    | 19 +----------------
 include/exec/target_long.h | 42 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+), 18 deletions(-)
 create mode 100644 include/exec/target_long.h

diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
index 21309cf567..98605dfba2 100644
--- a/include/exec/cpu-defs.h
+++ b/include/exec/cpu-defs.h
@@ -58,24 +58,7 @@
 # define TARGET_TB_PCREL 0
 #endif
 
-#define TARGET_LONG_SIZE (TARGET_LONG_BITS / 8)
-
-/* target_ulong is the type of a virtual address */
-#if TARGET_LONG_SIZE == 4
-typedef int32_t target_long;
-typedef uint32_t target_ulong;
-#define TARGET_FMT_lx "%08x"
-#define TARGET_FMT_ld "%d"
-#define TARGET_FMT_lu "%u"
-#elif TARGET_LONG_SIZE == 8
-typedef int64_t target_long;
-typedef uint64_t target_ulong;
-#define TARGET_FMT_lx "%016" PRIx64
-#define TARGET_FMT_ld "%" PRId64
-#define TARGET_FMT_lu "%" PRIu64
-#else
-#error TARGET_LONG_SIZE undefined
-#endif
+#include "exec/target_long.h"
 
 #if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
 
diff --git a/include/exec/target_long.h b/include/exec/target_long.h
new file mode 100644
index 0000000000..93c9472971
--- /dev/null
+++ b/include/exec/target_long.h
@@ -0,0 +1,42 @@
+/*
+ * Target Long Definitions
+ *
+ * Copyright (c) 2003 Fabrice Bellard
+ * Copyright (c) 2023 Linaro Ltd
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef _TARGET_LONG_H_
+#define _TARGET_LONG_H_
+
+/*
+ * Usually this should only be included via cpu-defs.h however for
+ * certain cases where we want to build only two versions of a binary
+ * object we can include directly. However the build-system must
+ * ensure TARGET_LONG_BITS is defined directly.
+ */
+#ifndef TARGET_LONG_BITS
+#error TARGET_LONG_BITS not defined
+#endif
+
+#define TARGET_LONG_SIZE (TARGET_LONG_BITS / 8)
+
+/* target_ulong is the type of a virtual address */
+#if TARGET_LONG_SIZE == 4
+typedef int32_t target_long;
+typedef uint32_t target_ulong;
+#define TARGET_FMT_lx "%08x"
+#define TARGET_FMT_ld "%d"
+#define TARGET_FMT_lu "%u"
+#elif TARGET_LONG_SIZE == 8
+typedef int64_t target_long;
+typedef uint64_t target_ulong;
+#define TARGET_FMT_lx "%016" PRIx64
+#define TARGET_FMT_ld "%" PRId64
+#define TARGET_FMT_lu "%" PRIu64
+#else
+#error TARGET_LONG_SIZE undefined
+#endif
+
+#endif /* _TARGET_LONG_H_ */
-- 
2.39.1


