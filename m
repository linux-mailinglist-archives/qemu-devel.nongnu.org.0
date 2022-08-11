Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2615D58FF3A
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 17:22:53 +0200 (CEST)
Received: from localhost ([::1]:50424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMA1M-0008Re-7P
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 11:22:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oM9t9-0005A8-U5
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 11:14:25 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:35511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oM9t5-0005ft-Bn
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 11:14:23 -0400
Received: by mail-wr1-x429.google.com with SMTP id bs25so3252700wrb.2
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 08:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=r439/WIT2yXmrXbhu3C3Szn53+ZncNSJ6N5enNtLdRM=;
 b=qhBOWzPHZ20E/P8oYJ4A9dN/hJX7DKtECEaH23/IPPm7SDqwTSOtfceAlPaOkNdLox
 yEWuNvzRNZqdlVaxp8WH5iFpLtD56olzZqVgZzPJyMk90blEluoqGUVzqy8jH1a9sSIY
 LNsArAqlbDLUzcFXvWzhuwZPppjLJ5D8Dd5fNMCpDEwj7cIrH3U2DqiveUcU7YiK0i0c
 PBtpTiKgCSb+MA0fkYkU1UkoMquOhN2K63XTfQhrp4366BetnWrchQoT2s90UJ13yFzt
 rgezt2RvgoOBkrcv7yRViJJDErwwXVOI0mQ+5LwxWmwZ+Jkf6CXuiGGkxxL8z7TYq6a0
 qTqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=r439/WIT2yXmrXbhu3C3Szn53+ZncNSJ6N5enNtLdRM=;
 b=aQQjruasiLjo+JSnRQFspn47ziBmdE2ludHLQEXBBfcN1ucFDP1HEwv/XwyP1znCjz
 h9qDIN9VGjtiGNSo/y7+J4kPdb3x1jdCcxj93eweAWihGvit6pvyDdjeHxeV7nWEPgHw
 Byzp2IbzkMknuB5XZnZniEn0Kq0CvQ5LaFE9dGvLaq2QiwpY/Y0unoPqQB/AyI2iVdv6
 IuAHIXgbYwSLQOFiAzjriWrQRFuiBLxkOJlPtz4HR0MfzL4B1o9h551k29YrS+khL0Jo
 afEWMdPCnmMyBbqGU6EjlWypgkg87ei74tC27Tqp12KZKBzU1LCSLGlHMOEhBkMRtgCe
 IOLQ==
X-Gm-Message-State: ACgBeo15VBwnjZuZkUrNN5U8FeOL5IBU+qBPmLHbWRp7E7m/6F4AJFyg
 uUtWrc7/NvVT/mYn4/KWrxFXRA==
X-Google-Smtp-Source: AA6agR4zk9hWory0PB1/8nwbfffdmIboWVeE1LbUKuLiO+IGT7/Gwowo2zarL6bZpjTh5Y1FmjogRw==
X-Received: by 2002:a5d:47ca:0:b0:220:5cbc:1c59 with SMTP id
 o10-20020a5d47ca000000b002205cbc1c59mr20069251wrc.662.1660230858033; 
 Thu, 11 Aug 2022 08:14:18 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 b6-20020adfde06000000b0022069ccb6a1sm21634474wrm.94.2022.08.11.08.14.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 08:14:14 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 738C21FFBA;
 Thu, 11 Aug 2022 16:14:13 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH  v1 2/8] cpu: cache CPUClass in CPUState for hot code paths
Date: Thu, 11 Aug 2022 16:14:07 +0100
Message-Id: <20220811151413.3350684-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220811151413.3350684-1-alex.bennee@linaro.org>
References: <20220811151413.3350684-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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

The class cast checkers are quite expensive and always on (unlike the
dynamic case who's checks are gated by CONFIG_QOM_CAST_DEBUG). To
avoid the overhead of repeatedly checking something which should never
change we cache the CPUClass reference for use in the hot code paths.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/hw/core/cpu.h | 9 +++++++++
 cpu.c                 | 9 ++++-----
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 500503da13..1a7e1a9380 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -51,6 +51,13 @@ typedef int (*WriteCoreDumpFunction)(const void *buf, size_t size,
  */
 #define CPU(obj) ((CPUState *)(obj))
 
+/*
+ * The class checkers bring in CPU_GET_CLASS() which is potentially
+ * expensive given the eventual call to
+ * object_class_dynamic_cast_assert(). Because of this the CPUState
+ * has a cached value for the class in cs->cc which is set up in
+ * cpu_exec_realizefn() for use in hot code paths.
+ */
 typedef struct CPUClass CPUClass;
 DECLARE_CLASS_CHECKERS(CPUClass, CPU,
                        TYPE_CPU)
@@ -317,6 +324,8 @@ struct qemu_work_item;
 struct CPUState {
     /*< private >*/
     DeviceState parent_obj;
+    /* cache to avoid expensive CPU_GET_CLASS */
+    CPUClass *cc;
     /*< public >*/
 
     int nr_cores;
diff --git a/cpu.c b/cpu.c
index 584ac78baf..14365e36f3 100644
--- a/cpu.c
+++ b/cpu.c
@@ -131,9 +131,8 @@ const VMStateDescription vmstate_cpu_common = {
 
 void cpu_exec_realizefn(CPUState *cpu, Error **errp)
 {
-#ifndef CONFIG_USER_ONLY
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-#endif
+    /* cache the cpu class for the hotpath */
+    cpu->cc = CPU_GET_CLASS(cpu);
 
     cpu_list_add(cpu);
     if (!accel_cpu_realizefn(cpu, errp)) {
@@ -151,8 +150,8 @@ void cpu_exec_realizefn(CPUState *cpu, Error **errp)
     if (qdev_get_vmsd(DEVICE(cpu)) == NULL) {
         vmstate_register(NULL, cpu->cpu_index, &vmstate_cpu_common, cpu);
     }
-    if (cc->sysemu_ops->legacy_vmsd != NULL) {
-        vmstate_register(NULL, cpu->cpu_index, cc->sysemu_ops->legacy_vmsd, cpu);
+    if (cpu->cc->sysemu_ops->legacy_vmsd != NULL) {
+        vmstate_register(NULL, cpu->cpu_index, cpu->cc->sysemu_ops->legacy_vmsd, cpu);
     }
 #endif /* CONFIG_USER_ONLY */
 }
-- 
2.30.2


