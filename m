Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD2E53F290
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 01:31:35 +0200 (CEST)
Received: from localhost ([::1]:54754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyMC6-0004Hp-Mn
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 19:31:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyLwK-0001ga-FJ
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 19:15:16 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:36647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyLwE-0003xh-CY
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 19:15:13 -0400
Received: by mail-pf1-x42f.google.com with SMTP id 15so13944844pfy.3
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 16:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=orDJBcxXhPFgqlL4Stw6ZA+/WM99GbM6modqMxMEw+8=;
 b=mO9tmX9GLRtxTaLGnx7pyBcXAFGvJPHtJxyn9mxN7hnv6jzZYREA7ST1PZX4oPfY6v
 VEkzk3+1n9rFvP/rvUVpPjD+Az2UVsmD82B8tN13CIBGz+sHGgsqBAgSXrsluT6qK4SS
 Vz/ghWEcOM/Wde0SLI5HiOywMr4I056ZSOa/KRpe1UiFPNjuN4RVpbUdPZjjp6dkqWFS
 jk5lce++pJOGSoLkUwB1wZ8cd2/IKTCjbYNgChExoqGihrt6mqp60GUPVtTkVwrj03bt
 K4Hbxdh3S299GMnH219t4R9nKn041kYt9MD+C5kIh6VJc89vyg196fXEWpJPGrBzmn22
 TD7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=orDJBcxXhPFgqlL4Stw6ZA+/WM99GbM6modqMxMEw+8=;
 b=xlVFUIyiCKl/aS6jDe2tVP2363XCZscaVIORITj6JBh2DvtUBreU0h03YSTluVTDov
 4QsZwjhA50OX8KEqK83yiKk9UeHu9md7Vq7oNz49Nh/lrXJovj+V0R741uCF2lsX5PRg
 ZidRTbCFcv+VRo4AsnvAwUeJtbZ9I2zfNt/vuW690lu2fQ7hTlngGIvp6amxccIimi0b
 q7AYb7NYf73OEQX1uitSBQOhfFQGye/GE/c4+Wq5d7m9DM9pRy+PpiM7kemGBKsStx5N
 xULwzLYkiE6zLPBLNbPqpYCuzLJ8dq847yOQfyhEn9SipUgd/TN8SYu3q5SOjO1kiQnV
 gBdQ==
X-Gm-Message-State: AOAM530S0V6ew5HV1MlM2C6JJLfKkwifsxKffHEk53iOdMoPBSSc/BCM
 bG8vk/+g9+umPUozWauTy2Yv+XkNk5UvhA==
X-Google-Smtp-Source: ABdhPJyiUkH5MQSrKaySQKBG3S8WAsbrFB+F9gfdR1j3Z31/uEoq5jKRZ3f/4FIOmq4Bb55cz2ItGQ==
X-Received: by 2002:a05:6a00:4503:b0:51b:de97:7f2c with SMTP id
 cw3-20020a056a00450300b0051bde977f2cmr20539593pfb.12.1654557308115; 
 Mon, 06 Jun 2022 16:15:08 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:dd1c:9738:3e40:ffe0])
 by smtp.gmail.com with ESMTPSA id
 2-20020a170902c24200b00162523fdb8fsm10954623plg.252.2022.06.06.16.15.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 16:15:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =gaosong@loongson.cn, yangxiaojuan@loongson.cn,
 Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 17/43] target/loongarch: Add target build suport
Date: Mon,  6 Jun 2022 16:14:24 -0700
Message-Id: <20220606231450.448443-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220606231450.448443-1-richard.henderson@linaro.org>
References: <20220606231450.448443-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220606124333.2060567-18-yangxiaojuan@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/meson.build | 19 +++++++++++++++++++
 target/meson.build           |  1 +
 2 files changed, 20 insertions(+)
 create mode 100644 target/loongarch/meson.build

diff --git a/target/loongarch/meson.build b/target/loongarch/meson.build
new file mode 100644
index 0000000000..bcb076e55f
--- /dev/null
+++ b/target/loongarch/meson.build
@@ -0,0 +1,19 @@
+gen = decodetree.process('insns.decode')
+
+loongarch_ss = ss.source_set()
+loongarch_ss.add(files(
+  'cpu.c',
+  'disas.c',
+))
+loongarch_tcg_ss = ss.source_set()
+loongarch_tcg_ss.add(gen)
+loongarch_tcg_ss.add(files(
+  'fpu_helper.c',
+  'op_helper.c',
+  'translate.c',
+))
+loongarch_tcg_ss.add(zlib)
+
+loongarch_ss.add_all(when: 'CONFIG_TCG', if_true: [loongarch_tcg_ss])
+
+target_arch += {'loongarch': loongarch_ss}
diff --git a/target/meson.build b/target/meson.build
index 2f6940255e..a53a60486f 100644
--- a/target/meson.build
+++ b/target/meson.build
@@ -5,6 +5,7 @@ subdir('cris')
 subdir('hexagon')
 subdir('hppa')
 subdir('i386')
+subdir('loongarch')
 subdir('m68k')
 subdir('microblaze')
 subdir('mips')
-- 
2.34.1


