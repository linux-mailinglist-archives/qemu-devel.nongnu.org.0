Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F94531B1C7
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 19:07:30 +0100 (CET)
Received: from localhost ([::1]:50358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBLnt-0005Uo-88
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 13:07:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLgS-0007BQ-UH
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 12:59:48 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:55105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLgR-0004FD-1J
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 12:59:48 -0500
Received: by mail-wm1-x332.google.com with SMTP id w4so4199329wmi.4
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 09:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5iC/ffrrmyVLY0EDOJ/UkLv4vuk3u7VA9Ue4o0gxHXk=;
 b=k/nhZ3n6V9zl28eL4Q0Nf+yLWMsIrqEBA5Oi34wtYHKKL9aLrnj2kcY21H4QjoOLnx
 6507KeP4q6mIMTZDLVrkcSTGJFl7d3DDDTnhjsMpudoxw9ASnpL4dL8y7IT4ox/lNeUE
 wbfsEWB6DEJM4zjrL/4XlA2hIwY41ezdpkHCTQXOufaJDeK4YXQeG7VxpnCTPfwpF4sm
 NiWmrW2kgCdooH0luTbAEyk46Z0OWK45nGNwTqzcejizVKIBn8GvMIO5Usc1QxKDF1q/
 Phdmi9Khz5VBJ06s2z4i9cFhO2bR6oYoXPr3AY6cc6iKHgy5/BqicHc+NFlLyQe+huVc
 ki1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5iC/ffrrmyVLY0EDOJ/UkLv4vuk3u7VA9Ue4o0gxHXk=;
 b=Nl+VoskG7VaWVGUCVu1DFrjEGa0Z3AdsH+Slg77kx8LvcYcpkZwlj7uQvOhI3y3s7m
 tjGpajwbXx4HDdPFe4ZGEXZUDd+9+EstZqDGercjp0UYcI+lWAXWRNy2hXNCHEVl7Nld
 yK48X1IISIIO+PNUxaJ0GHxP4YXOWqKtedrSA7So2uP+z3qw2ZHhylZGCTKR/CvZVU2B
 fdEu3Z2tWkmhLOh8+q/i5XSweoSaqr6jGdhwByJ/h/0LUeePO7CNaAjV8Vd2IUYKyM9A
 H+RQsKJ98NKidI0ZXl6x86+NGdlnFH6NvyfgOxXJzrF669cxmB51rzbqgvP7nL0eoebG
 G8Ow==
X-Gm-Message-State: AOAM533OME7D7u2VTzBx+LugLwE8pk9G2f+n/CcW6n0GNdH8Wh/OiKFJ
 HBQrZAIQHtTsFt1KovG711zPMbHXV50=
X-Google-Smtp-Source: ABdhPJwx2RJ8pNLUw5R+K15D7lp+2uBOVt4SUUpS1JOihS6n9apVrMTK2I8G3/X3bgV7mFCWObYYGw==
X-Received: by 2002:a7b:c5cc:: with SMTP id n12mr10929618wmk.123.1613325585575; 
 Sun, 14 Feb 2021 09:59:45 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id t6sm11181283wrn.96.2021.02.14.09.59.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Feb 2021 09:59:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 06/42] target/mips: Introduce gen_load_gpr_hi() /
 gen_store_gpr_hi() helpers
Date: Sun, 14 Feb 2021 18:58:36 +0100
Message-Id: <20210214175912.732946-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210214175912.732946-1-f4bug@amsat.org>
References: <20210214175912.732946-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Fredrik Noring <noring@nocrew.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.h |  4 ++++
 target/mips/translate.c | 18 ++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/target/mips/translate.h b/target/mips/translate.h
index 3014c20cadb..468e29d7578 100644
--- a/target/mips/translate.h
+++ b/target/mips/translate.h
@@ -131,6 +131,10 @@ void gen_move_low32(TCGv ret, TCGv_i64 arg);
 void gen_move_high32(TCGv ret, TCGv_i64 arg);
 void gen_load_gpr(TCGv t, int reg);
 void gen_store_gpr(TCGv t, int reg);
+#if defined(TARGET_MIPS64)
+void gen_load_gpr_hi(TCGv_i64 t, int reg);
+void gen_store_gpr_hi(TCGv_i64 t, int reg);
+#endif /* TARGET_MIPS64 */
 void gen_load_fpr32(DisasContext *ctx, TCGv_i32 t, int reg);
 void gen_load_fpr64(DisasContext *ctx, TCGv_i64 t, int reg);
 void gen_store_fpr32(DisasContext *ctx, TCGv_i32 t, int reg);
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 9c034c934d5..16a731d3f37 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -2291,6 +2291,24 @@ void gen_store_gpr(TCGv t, int reg)
     }
 }
 
+#if defined(TARGET_MIPS64)
+void gen_load_gpr_hi(TCGv_i64 t, int reg)
+{
+    if (reg == 0) {
+        tcg_gen_movi_i64(t, 0);
+    } else {
+        tcg_gen_mov_i64(t, cpu_gpr_hi[reg]);
+    }
+}
+
+void gen_store_gpr_hi(TCGv_i64 t, int reg)
+{
+    if (reg != 0) {
+        tcg_gen_mov_i64(cpu_gpr_hi[reg], t);
+    }
+}
+#endif /* TARGET_MIPS64 */
+
 /* Moves to/from shadow registers. */
 static inline void gen_load_srsgpr(int from, int to)
 {
-- 
2.26.2


