Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A62482C173F
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 22:08:18 +0100 (CET)
Received: from localhost ([::1]:53188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khJ4L-0005gc-NM
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 16:08:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khIj4-0002Mr-NU
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 15:46:27 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:40257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khIiz-0001iK-Mt
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 15:46:17 -0500
Received: by mail-wr1-x444.google.com with SMTP id m6so20104427wrg.7
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 12:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c4jJTZD8ogptt8KJFpuKBUvTjXtZDzKX+vqshTzv/Ig=;
 b=IeDxl9A/net7p/bDAiEoWuyWSiaYCbyRuReQy7GNau6p1zvbfZD7TGBybD39262e03
 RuytwnF+8BoIMWPy+8dAA3stwbdNNVsLjO/4BMimF4UfGaaKUfVPzZSujGpaYkJ87lCV
 IHKcfSDys/Ugdh6frOvvFjw5bMuSbJGr4BwWnZqkp8Z5t4Ujnl/Q6ciJ12gbSFTXic85
 JtP1Mum7utgQmru5Uar7Suj0eRFZbKHKWPJR5DYAs5dAztnDXCTiKDrc0Nb9hgVQnQmW
 yUiPzHraomQX4AEpGoiu7RW/i+wZOdahJB7VppHbXNH6EoFgiMLdOlGK//smRhGchQLz
 aQxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=c4jJTZD8ogptt8KJFpuKBUvTjXtZDzKX+vqshTzv/Ig=;
 b=pHmJD8YSH4hywr61+aXLFTtqRmVi0FV5YcJUM44s92qr3VxM8RS8hJk9dPqheF4FWM
 yEpbLr+th6N6ssAIbk0EY2p7gLwzTPhn9ASP1vhGJmAjmifZoAF+yaBefc7jci4hmnMO
 fOR56sZbfNj4dWpQoqdI5pRUgIpZv30ZCIrSuzwUJ5gZzLj0UaETOAAAvSG9wOEBBKNY
 ka/o4EWve9NFGTtNPoa4+vShL1lqfYPt6xxAH8kVRvPTVp4h0bNG5cwc7t/71j7YEPyi
 ospRugb1bUmSrwcX3crK8qJhyrGV38wRalVFqQ0twpvk5MLz3N0BNdEUh+RQeJm+Iwz7
 LZZQ==
X-Gm-Message-State: AOAM533f17xvchNzvHIgBvY6ruDd4cnMKTOVqJK8+FuGS/wzqSDQDeX8
 DTJZVqOiplO9+wjd7YKI1rgG7aGJJUE=
X-Google-Smtp-Source: ABdhPJybk1c0phz6/1h5exIJonwGQGWb61Hfm/SgAkvYl9Am/GeirtvW04xkqkd1iGgbUWNWvVEZag==
X-Received: by 2002:adf:de05:: with SMTP id b5mr1496041wrm.131.1606164370583; 
 Mon, 23 Nov 2020 12:46:10 -0800 (PST)
Received: from x1w.redhat.com (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id o197sm865922wme.17.2020.11.23.12.46.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 12:46:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 16/28] target/mips: Extract NEC Vr54xx helper definitions
Date: Mon, 23 Nov 2020 21:44:36 +0100
Message-Id: <20201123204448.3260804-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201123204448.3260804-1-f4bug@amsat.org>
References: <20201123204448.3260804-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extract the NEC Vr54xx helper definitions to
'vendor-vr54xx_helper.h'.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201120210844.2625602-15-f4bug@amsat.org>
---
 target/mips/helper.h                   | 17 ++---------------
 target/mips/vendor-vr54xx_helper.h.inc | 24 ++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 15 deletions(-)
 create mode 100644 target/mips/vendor-vr54xx_helper.h.inc

diff --git a/target/mips/helper.h b/target/mips/helper.h
index 06da4c6cf68..58c716a1480 100644
--- a/target/mips/helper.h
+++ b/target/mips/helper.h
@@ -20,21 +20,6 @@ DEF_HELPER_3(lld, tl, env, tl, int)
 #endif
 #endif
 
-DEF_HELPER_3(muls, tl, env, tl, tl)
-DEF_HELPER_3(mulsu, tl, env, tl, tl)
-DEF_HELPER_3(macc, tl, env, tl, tl)
-DEF_HELPER_3(maccu, tl, env, tl, tl)
-DEF_HELPER_3(msac, tl, env, tl, tl)
-DEF_HELPER_3(msacu, tl, env, tl, tl)
-DEF_HELPER_3(mulhi, tl, env, tl, tl)
-DEF_HELPER_3(mulhiu, tl, env, tl, tl)
-DEF_HELPER_3(mulshi, tl, env, tl, tl)
-DEF_HELPER_3(mulshiu, tl, env, tl, tl)
-DEF_HELPER_3(macchi, tl, env, tl, tl)
-DEF_HELPER_3(macchiu, tl, env, tl, tl)
-DEF_HELPER_3(msachi, tl, env, tl, tl)
-DEF_HELPER_3(msachiu, tl, env, tl, tl)
-
 DEF_HELPER_FLAGS_1(bitswap, TCG_CALL_NO_RWG_SE, tl, tl)
 #ifdef TARGET_MIPS64
 DEF_HELPER_FLAGS_1(dbitswap, TCG_CALL_NO_RWG_SE, tl, tl)
@@ -424,3 +409,5 @@ DEF_HELPER_3(cache, void, env, tl, i32)
 #include "mod-dsp_helper.h.inc"
 #include "mod-msa_helper.h.inc"
 #include "mod-mt_helper.h.inc"
+
+#include "vendor-vr54xx_helper.h.inc"
diff --git a/target/mips/vendor-vr54xx_helper.h.inc b/target/mips/vendor-vr54xx_helper.h.inc
new file mode 100644
index 00000000000..50b1f5b818d
--- /dev/null
+++ b/target/mips/vendor-vr54xx_helper.h.inc
@@ -0,0 +1,24 @@
+/*
+ * MIPS NEC Vr54xx instruction emulation helpers for QEMU.
+ *
+ *  Copyright (c) 2004-2005 Jocelyn Mayer
+ *  Copyright (c) 2006 Marius Groeger (FPU operations)
+ *  Copyright (c) 2006 Thiemo Seufer (MIPS32R2 support)
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ */
+
+DEF_HELPER_3(muls, tl, env, tl, tl)
+DEF_HELPER_3(mulsu, tl, env, tl, tl)
+DEF_HELPER_3(macc, tl, env, tl, tl)
+DEF_HELPER_3(maccu, tl, env, tl, tl)
+DEF_HELPER_3(msac, tl, env, tl, tl)
+DEF_HELPER_3(msacu, tl, env, tl, tl)
+DEF_HELPER_3(mulhi, tl, env, tl, tl)
+DEF_HELPER_3(mulhiu, tl, env, tl, tl)
+DEF_HELPER_3(mulshi, tl, env, tl, tl)
+DEF_HELPER_3(mulshiu, tl, env, tl, tl)
+DEF_HELPER_3(macchi, tl, env, tl, tl)
+DEF_HELPER_3(macchiu, tl, env, tl, tl)
+DEF_HELPER_3(msachi, tl, env, tl, tl)
+DEF_HELPER_3(msachiu, tl, env, tl, tl)
-- 
2.26.2


