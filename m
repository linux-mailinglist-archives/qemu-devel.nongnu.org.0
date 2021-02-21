Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10035320B2C
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 15:58:43 +0100 (CET)
Received: from localhost ([::1]:37976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDqC2-0002lV-1s
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 09:58:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDpr4-0007xG-Cb
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:37:04 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:39575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDpqn-0003EA-8X
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:37:02 -0500
Received: by mail-wm1-x330.google.com with SMTP id v62so12043084wmg.4
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 06:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9Gr6hhYxcoFr5/GYlEJ6i23QC05JMKXDeduQE346qJE=;
 b=VJC4PBoVn+iij9+qhSmonmdut68TwiLZuz72pQ8QVcrqgm3CrJ5dug3SWQC4Isx5FX
 SoYQbtqgNfKeQ4rX0sCPIOS0JzWdfaFb1zjxC4kvIGYujGTcv1IvTERWOmC0RSFVg02j
 G8aqWTecH45VuMt7CCJKu5TV1uN2yfC4zRPgj0yJ+PiVOdw6xS/CsoSLrvyuVvvt0jgH
 9/Hy/zMy6lhuOsn6nFdPpm5WL0HxeNGPs18r+/+Dh1iY6VECdp4CXmnMwdAOcXGWvzVN
 Qr5f/s8q/lg5aX1yWcQtBbx76jCfO+yMSJOXp17xy42/5tKmBE49xDZExVXuD9ZwVp7f
 MAZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9Gr6hhYxcoFr5/GYlEJ6i23QC05JMKXDeduQE346qJE=;
 b=tnd5K45VuTsklNOcO1Y8kLI9Kp3saRFU6xbsEB3fE8DUYKvyLa5cDcWFl/lowrSPzd
 x6m+pFNCjAcfLbPOEwWDD0Q4ahE51DTPg6CYQzrzvlLTEcgkQDh3wIoZtqSfW/KQFhNF
 NedbRybMJ38qM3bXnNwzILmSmVbBRRtRh9A6zUFW56oyXYC4GGNdDuy2FdYxTY/aMN+W
 DetvheQfnOXJ6nF8xa8xGwtwHPlUfRwYY2g1WPEg38RUF9f68sIufqZi6MUOpAh3DJCP
 fA65fBO7lLFXu6XjNgS9c1PfNFXyEE8ZLMVQOjUKL8TDTlF/d/70xiXhoHcbkkOhJAY3
 gXyA==
X-Gm-Message-State: AOAM5310Ui4LB82hlSExx02d4MoRvOUhLSs4Tfhs1LoulwWUMsnjIEox
 G1t4hcTe1RNWJrCwcF856ECqUTtolWg=
X-Google-Smtp-Source: ABdhPJyp1I7xroEGBvXD3A3+vxWuHobdCAdgTV+CBjV+nuOvAON3j530GEuFzs6LxHpOt73ZP3Lz7g==
X-Received: by 2002:a05:600c:2652:: with SMTP id
 18mr2967075wmy.96.1613918203770; 
 Sun, 21 Feb 2021 06:36:43 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id c12sm13474247wru.71.2021.02.21.06.36.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 06:36:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 26/43] target/mips: Introduce gen_load_gpr_hi() /
 gen_store_gpr_hi() helpers
Date: Sun, 21 Feb 2021 15:34:15 +0100
Message-Id: <20210221143432.2468220-27-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210221143432.2468220-1-f4bug@amsat.org>
References: <20210221143432.2468220-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210214175912.732946-7-f4bug@amsat.org>
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
index 5228e040842..a303c36be3f 100644
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


