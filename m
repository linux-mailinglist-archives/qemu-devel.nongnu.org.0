Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E750853F272
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 01:17:29 +0200 (CEST)
Received: from localhost ([::1]:46438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyLyR-0004FB-Hy
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 19:17:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyLvz-0001HL-Nm
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 19:14:56 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:40453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyLvx-0003iu-T6
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 19:14:55 -0400
Received: by mail-pg1-x52d.google.com with SMTP id f65so3993359pgc.7
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 16:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8X8K+rV+wE28jHiIh8/ya6IXzVzgmUsISV5Nv8U9r7c=;
 b=amrOukZoVtgzxg8YgWktFfxoIpV9+lQuVdhf+bVpTBPS/S5PvecWueW2eNV42Iu5tY
 UCkkQSYdmz16/37N9w231suEqH9tf5CKUBoOoXxy16P5jScKthJDvMHNEVZcggoPTLC7
 Kn7HRRTtXuy5PR1QwzVtC2PpHTu1mcmKsoWNll0/xYGDsabUtOrGITtTEU4rd+8OpZ/2
 l35s9R70yUAuzRbbdcmtSxvwJVWlPFgUlGkib4LlEhEaIy3QmBYfKs7FtyeSo01gTIXp
 EEssrz2bcVhL//048ZUowR9DjWvMFuKB9OY/Vjemkv11d7nzCdeXwGX3W0zPBtQVZz5r
 8WNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8X8K+rV+wE28jHiIh8/ya6IXzVzgmUsISV5Nv8U9r7c=;
 b=CNNWZ+rGhGwuzmZgENRkXPmZOiDNqFuadfAHtdWVknhKnAp/gtr/V/4El3GYngK96v
 m/Vcpr+iEteRs+CRqU6x+skwJo2jCfXwFYYk5I45qeV6KVpfJ9wdI9AtM1fzyBaDiuM0
 +mfhcEfK+ZGvxu5n4TNZvBLZQkJx3aeq+LiJsXnC6bptRsnou221xuP1eHF3B+yQhms8
 0VZWbneKV2fYbCIJav4vW2+pnjm+jhZ3iU7QQFefiAxTv2K9M5+zX6xaF7krU39TSvPV
 8/D+hu5Y24Sh+99iCrGNA6pdpJIIDtdAGarXy53GIiFQT5/ZXTntwiCksra6N4re+3Ix
 5yhg==
X-Gm-Message-State: AOAM533mKgZ/bqC3K7k/h9OFs1T9eHm36bqMQGfMYIqerNIM5NgN+/b7
 b1MLWSEQNFlo+Ydj0NmSuvY1wxCfmW/8KA==
X-Google-Smtp-Source: ABdhPJww4WK+aXzFXgy8tmOfYJ9bHk/A+71T6hv6yehfJYOLyVSpNTx1t42ndVK5r2sylDZehpwwjw==
X-Received: by 2002:a63:5d50:0:b0:3db:5325:b120 with SMTP id
 o16-20020a635d50000000b003db5325b120mr23431213pgm.212.1654557292576; 
 Mon, 06 Jun 2022 16:14:52 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:dd1c:9738:3e40:ffe0])
 by smtp.gmail.com with ESMTPSA id
 2-20020a170902c24200b00162523fdb8fsm10954623plg.252.2022.06.06.16.14.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 16:14:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =gaosong@loongson.cn, yangxiaojuan@loongson.cn,
 Song Gao <gaosong@loongson.cn>
Subject: [PULL 01/43] target/loongarch: Add README
Date: Mon,  6 Jun 2022 16:14:08 -0700
Message-Id: <20220606231450.448443-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220606231450.448443-1-richard.henderson@linaro.org>
References: <20220606231450.448443-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Song Gao <gaosong@loongson.cn>

This patch gives an introduction to the LoongArch target.

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220606124333.2060567-2-yangxiaojuan@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 MAINTAINERS             |  6 ++++++
 target/loongarch/README | 10 ++++++++++
 2 files changed, 16 insertions(+)
 create mode 100644 target/loongarch/README

diff --git a/MAINTAINERS b/MAINTAINERS
index 5fe8f7eca2..319a5d805a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -212,6 +212,12 @@ S: Maintained
 F: target/hppa/
 F: disas/hppa.c
 
+LoongArch TCG CPUs
+M: Song Gao <gaosong@loongson.cn>
+M: Xiaojuan Yang <yangxiaojuan@loongson.cn>
+S: Maintained
+F: target/loongarch/
+
 M68K TCG CPUs
 M: Laurent Vivier <laurent@vivier.eu>
 S: Maintained
diff --git a/target/loongarch/README b/target/loongarch/README
new file mode 100644
index 0000000000..de141c1a58
--- /dev/null
+++ b/target/loongarch/README
@@ -0,0 +1,10 @@
+- Introduction
+
+  LoongArch is the general processor architecture of Loongson.
+
+  The following versions of the LoongArch core are supported
+    core: 3A5000
+    https://github.com/loongson/LoongArch-Documentation/releases/download/2021.08.17/LoongArch-Vol1-v1.00-EN.pdf
+
+  We can get the latest loongarch documents at https://github.com/loongson/LoongArch-Documentation/tags.
+
-- 
2.34.1


