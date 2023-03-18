Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D076BF9A0
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Mar 2023 12:48:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdV1Z-0004pN-S0; Sat, 18 Mar 2023 07:47:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pdV1R-0004my-8k
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 07:46:53 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pdV1P-0007Do-D9
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 07:46:53 -0400
Received: by mail-wm1-x335.google.com with SMTP id ay8so4762023wmb.1
 for <qemu-devel@nongnu.org>; Sat, 18 Mar 2023 04:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679140010;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uwD10IBSBuDnwjBnoapwHdpuo5Tp+viqzXnrVV7efY4=;
 b=kbqMXqnPJNW7KprzTLzfW4N+TSy+aj39DE7wpBUCdEt6sn08oPKhC+CtS33WKa029+
 ULvouFZnk+jO1M1iUxpIbscdoQog72TEt6WC8hgMcrvLQ2gwqECfUvtlexPSs8MjmDXW
 gnzIdmEgaoU0Zvf5QntsAiuFNlRDR+/w2TOC5ymQfsTszaeom2nAQ2n8Pj4hNEskx3i4
 01BmHfiMqObzXIz3Brd13SeJrzfqzCmNy4nVgPTaJIb3S9bxMCvnK4TiCDUNK1kR7rGy
 o6ySepJReFofQcHdrceAVAJA7bX8IMTJfsVzogJhkwsW4Ln+B2D01ljXmDtzqcDL0zuR
 0lyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679140010;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uwD10IBSBuDnwjBnoapwHdpuo5Tp+viqzXnrVV7efY4=;
 b=Y6CL5iuA5g/vJZC1ovv4soWcl4Hc78xpuCJQuiioZnvazMNkyExQTpjHDxCdq00Pi+
 AxwaGP2CKwd057BrcPo3DykXdMgZ0j6UJCLYm0rxzhdeolA7LVVkY1wupDCL0ndjfqEq
 nE0S0wTsJayGBiE68yymdIcWjDZm5ebnrjUkKhQhWNfKOsvjBJqMk5QmS4s/H6GPa9tb
 xTATCLcAecByIiVR5cYL9eka7IWUlbCRd7GPg8Da5qbg5IpsbU1wkB0t1DxiDAhAzlCe
 W/sGPaMT20dzRoiTMW6dBmTp6Tloa7TJpDqc9vSHvYzfQjBWLl4Zd5+/Wli8Z6nlf5+j
 JR3g==
X-Gm-Message-State: AO0yUKVdIlD2kHbfUKhULuOrqK7ADIeGXS+bvwjJrg1DABdCaJQ66vl0
 3udv9cwLaW6kzY03m8+/IsTxIA==
X-Google-Smtp-Source: AK7set+8TqzZSX+nfiOwy+DO3/guL0iCnFwMVa6OuFLKYHRDg33GdU/D8zmvJiU7eGscmhpVJDJSLA==
X-Received: by 2002:a05:600c:202:b0:3ed:ba4d:f081 with SMTP id
 2-20020a05600c020200b003edba4df081mr807096wmi.23.1679140009973; 
 Sat, 18 Mar 2023 04:46:49 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 z11-20020a05600c220b00b003ed3034698esm4908634wml.9.2023.03.18.04.46.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Mar 2023 04:46:49 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9B96A1FFC2;
 Sat, 18 Mar 2023 11:46:45 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 11/31] include/qemu/plugin: Remove QEMU_PLUGIN_ASSERT
Date: Sat, 18 Mar 2023 11:46:24 +0000
Message-Id: <20230318114644.1340899-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318114644.1340899-1-alex.bennee@linaro.org>
References: <20230318114644.1340899-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Richard Henderson <richard.henderson@linaro.org>

This macro is no longer used.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230310195252.210956-4-richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230315174331.2959-14-alex.bennee@linaro.org>

diff --git a/include/qemu/plugin.h b/include/qemu/plugin.h
index fb338ba576..e0ebedef84 100644
--- a/include/qemu/plugin.h
+++ b/include/qemu/plugin.h
@@ -59,8 +59,6 @@ get_plugin_meminfo_rw(qemu_plugin_meminfo_t i)
 #ifdef CONFIG_PLUGIN
 extern QemuOptsList qemu_plugin_opts;
 
-#define QEMU_PLUGIN_ASSERT(cond) g_assert(cond)
-
 static inline void qemu_plugin_add_opts(void)
 {
     qemu_add_opts(&qemu_plugin_opts);
@@ -252,8 +250,6 @@ void qemu_plugin_user_postfork(bool is_child);
 
 #else /* !CONFIG_PLUGIN */
 
-#define QEMU_PLUGIN_ASSERT(cond)
-
 static inline void qemu_plugin_add_opts(void)
 { }
 
-- 
2.39.2


