Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2D7674F5F
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 09:25:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pImhB-0004pX-Ul; Fri, 20 Jan 2023 03:24:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pImh8-0004no-Ra
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 03:24:19 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pImh5-0004dh-EO
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 03:24:18 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 iv8-20020a05600c548800b003db04a0a46bso724603wmb.0
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 00:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N5m6RkKP7q/TMIRjDQYBTfdOOAJj550dV/XF1lV81V8=;
 b=Ejrrv4oC3Wuul2SsVkNrFQoWgwLiPrb2VP/L/gZnJuK1k2l9cH5aFBAorzBfVEWACk
 pC3NmbWFsoiL0i/Jd4lULB5tJi4ZXnjrr+PxSPZ5cStlWa+FNFx9gKtcEomzCJ9W3gcM
 CxfWTsH8SlNfhMTs7XKT6zWMm5JY3NI/sisp9CHqSyB1chy+6KB+OH2IL2OeXYzE/EWC
 mAdHJ5tPPLl0EEh89kqCtVbDSLYFHYrYg4rkX/6GH1w5vVk3lTxivOsIzZwF1wT3v4hQ
 Msr8JET+3dvYNOdR67L9QeCtrtyekGUg8klr5z0sqlcF2EEI0MHayCuy0epUFKpdJwWm
 4U0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N5m6RkKP7q/TMIRjDQYBTfdOOAJj550dV/XF1lV81V8=;
 b=YJwiJWsMo5JZD+sE3fnOw8SfLtp2kJ3sdMq526FeLWVOC9ikqQX0WrSjkuHDh/9A4x
 wRC89CIvv4SjHXpNkcgH07QONau5BV32yiTlSQ7Q0x/blAx72q6gGf+i71Rr1jTOlD20
 F9XmUdCdlWzJWm6hmR8msO/u9MnVeLNZ6ZaHuMPrKl56DRk3mRBb7vTvzhVRG8PqWqnt
 J0zv1oCOEQD+zPXRmtRqBhxsZ122THSUzRlWlVlAB83JLTXGYEXqT9kMvvo+n80Mr+9s
 AxPnyAwQGPej82tPtMoo6SwrgWY+fxSXsRTFo+TfFI3/ymHg8Dq2DBVOIAKqgS7C0y1S
 qbEg==
X-Gm-Message-State: AFqh2kr2HRvTLm8MaA2XVFa4Ib9/vXdity3v/ioFmm5KJTk6GnwpkrCU
 DvCnZmOuAgcXZ/agVWdsijBEIZIZHEZr/FuM
X-Google-Smtp-Source: AMrXdXs4e+K72zPHdtLRAR/OKp1SDTdf94fwA3k0TIpVKzgBixhnO+qdkNV2Wdfu4y/fUV2ibB06cg==
X-Received: by 2002:a05:600c:4256:b0:3da:2a78:d7a3 with SMTP id
 r22-20020a05600c425600b003da2a78d7a3mr12691383wmm.33.1674203053573; 
 Fri, 20 Jan 2023 00:24:13 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 v17-20020a05600c445100b003d9e74dd9b2sm1583458wmn.9.2023.01.20.00.24.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 20 Jan 2023 00:24:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 06/11] tests/qtest/migration-test: Reduce 'cmd_source'
 string scope
Date: Fri, 20 Jan 2023 09:23:36 +0100
Message-Id: <20230120082341.59913-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230120082341.59913-1-philmd@linaro.org>
References: <20230120082341.59913-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/qtest/migration-test.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 5271ddb868..f96c73f552 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -584,7 +584,6 @@ static int test_migrate_start(QTestState **from, QTestState **to,
 {
     g_autofree gchar *arch_source = NULL;
     g_autofree gchar *arch_target = NULL;
-    g_autofree gchar *cmd_source = NULL;
     g_autofree gchar *cmd_target = NULL;
     const gchar *ignore_stderr;
     g_autofree char *bootpath = NULL;
@@ -672,20 +671,22 @@ static int test_migrate_start(QTestState **from, QTestState **to,
         shmem_opts = g_strdup("");
     }
 
-    cmd_source = g_strdup_printf("-accel kvm%s -accel tcg%s%s "
-                                 "-name source,debug-threads=on "
-                                 "-m %s "
-                                 "-serial file:%s/src_serial "
-                                 "%s %s %s %s",
-                                 args->use_dirty_ring ?
-                                 ",dirty-ring-size=4096" : "",
-                                 machine_opts ? " -machine " : "",
-                                 machine_opts ? machine_opts : "",
-                                 memory_size, tmpfs,
-                                 arch_source, shmem_opts,
-                                 args->opts_source ? args->opts_source : "",
-                                 ignore_stderr);
     if (!args->only_target) {
+        g_autofree gchar *cmd_source = NULL;
+
+        cmd_source = g_strdup_printf("-accel kvm%s -accel tcg%s%s "
+                                     "-name source,debug-threads=on "
+                                     "-m %s "
+                                     "-serial file:%s/src_serial "
+                                     "%s %s %s %s",
+                                     args->use_dirty_ring ?
+                                     ",dirty-ring-size=4096" : "",
+                                     machine_opts ? " -machine " : "",
+                                     machine_opts ? machine_opts : "",
+                                     memory_size, tmpfs,
+                                     arch_source, shmem_opts,
+                                     args->opts_source ? args->opts_source : "",
+                                     ignore_stderr);
         *from = qtest_init(cmd_source);
     }
 
-- 
2.38.1


