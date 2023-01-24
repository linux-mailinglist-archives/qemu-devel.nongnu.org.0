Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E85767A0F1
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 19:10:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKNi8-00066l-Ch; Tue, 24 Jan 2023 13:07:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKNhJ-00056S-U9
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 13:07:05 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKNhG-00074U-9S
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 13:07:05 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 q10-20020a1cf30a000000b003db0edfdb74so1309712wmq.1
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 10:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PgyfneOjw1nm+q621r4vl43tV7pgTZ+t6Ze4357XpBo=;
 b=cO7GfWVPt7HMjWZaTNmlQZ195pIxC1pgRtouZ2f0p8PpNL6JiJQxtXbIz0NeFPrAsD
 3Y7lQtJjpRto/h3wUdtZ62HTRcw8xMU+4kg82nJyl5KsV6VmVmEXHlGdn16FvA3dHHn5
 PZgA76VhBbSrzK+YEXqRnQW0JHZ/DYwuStukFwQYbS/QdzAjIfqM9iXwjPFPxmH441jN
 ObEd2SOdshscxGjUcvOhn5rQeqSMG0q+Wz8jdn/RckI7zYQePJPeGG8Trx8eRP3jSAY7
 DjzFfDlNtI/7uXwsZTkppZDTOPm77foZ7qG38MT/wxMhX2MaQrqggdHYNvK2b85iVswg
 1J1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PgyfneOjw1nm+q621r4vl43tV7pgTZ+t6Ze4357XpBo=;
 b=p6PfQNzCud/YO5myC0AFY2LwYXj2gYY6RtlO8EkUHWZ7WxxGJlS1Zs9O+oUnMKB6pt
 r0nRViuS1IJpWHZEZ92KAggONa3jcSizDluECWIBNEmeHm6qk4qTNyJ8MdcKmoSv7dHB
 85OPBTnTvl1/e3tAnrpzQS0anHwl9eaQu3qAm/TltbqucKHdGN13CSnp/m7zcZDZYgN3
 h1g/9Af3qfoL3MnKZhnK1ilApltVzuVdXH3M7hrZiCLcDGYhOHoWYb7CTBDH1lj6y0CN
 jY/BdL2ecbeMUCUyKPNlv9XJ1zHhQ3+kN43GCbGNXDQZMcm/AWPbeEB0gO5XuSEXYpWZ
 4t9A==
X-Gm-Message-State: AFqh2kpMslYuCjy6a5lVPa3gFeolAkOV5dUPuquZvB8sol2oOMpaTE0w
 BBFr6dlBj8m4dSFwgIVL1/rj/g==
X-Google-Smtp-Source: AMrXdXtqjGELv+z6ikav/EHGcR9mbC4vbUpzhirJUaOyrIFklJh02HsY7P/IKlkDSVysRlYs9LhCzQ==
X-Received: by 2002:a1c:7417:0:b0:3da:fcd:7dfe with SMTP id
 p23-20020a1c7417000000b003da0fcd7dfemr36566186wmc.10.1674583619909; 
 Tue, 24 Jan 2023 10:06:59 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 hu30-20020a05600ca29e00b003db0659c454sm3049876wmb.32.2023.01.24.10.06.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 10:06:58 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A50D61FFD6;
 Tue, 24 Jan 2023 18:01:31 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Ed Maste <emaste@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Bandan Das <bsd@redhat.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Michael Roth <michael.roth@amd.com>, Eduardo Habkost <eduardo@habkost.net>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, qemu-arm@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>,
 Emilio Cota <cota@braap.org>
Subject: [PATCH v2 34/35] cpu-exec: assert that plugin_mem_cbs is NULL after
 execution
Date: Tue, 24 Jan 2023 18:01:26 +0000
Message-Id: <20230124180127.1881110-35-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124180127.1881110-1-alex.bennee@linaro.org>
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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

From: Emilio Cota <cota@braap.org>

Fixes: #1381

Signed-off-by: Emilio Cota <cota@braap.org>
Message-Id: <20230108165107.62488-1-cota@braap.org>
[AJB: manually applied follow-up fix]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/qemu/plugin.h | 4 ++++
 accel/tcg/cpu-exec.c  | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/include/qemu/plugin.h b/include/qemu/plugin.h
index e0ebedef84..fb338ba576 100644
--- a/include/qemu/plugin.h
+++ b/include/qemu/plugin.h
@@ -59,6 +59,8 @@ get_plugin_meminfo_rw(qemu_plugin_meminfo_t i)
 #ifdef CONFIG_PLUGIN
 extern QemuOptsList qemu_plugin_opts;
 
+#define QEMU_PLUGIN_ASSERT(cond) g_assert(cond)
+
 static inline void qemu_plugin_add_opts(void)
 {
     qemu_add_opts(&qemu_plugin_opts);
@@ -250,6 +252,8 @@ void qemu_plugin_user_postfork(bool is_child);
 
 #else /* !CONFIG_PLUGIN */
 
+#define QEMU_PLUGIN_ASSERT(cond)
+
 static inline void qemu_plugin_add_opts(void)
 { }
 
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 25ec73ef9a..9c857eeb07 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -504,6 +504,7 @@ static void cpu_exec_exit(CPUState *cpu)
     if (cc->tcg_ops->cpu_exec_exit) {
         cc->tcg_ops->cpu_exec_exit(cpu);
     }
+    QEMU_PLUGIN_ASSERT(cpu->plugin_mem_cbs == NULL);
 }
 
 void cpu_exec_step_atomic(CPUState *cpu)
@@ -980,6 +981,7 @@ cpu_exec_loop(CPUState *cpu, SyncClocks *sc)
 
             cpu_loop_exec_tb(cpu, tb, pc, &last_tb, &tb_exit);
 
+            QEMU_PLUGIN_ASSERT(cpu->plugin_mem_cbs == NULL);
             /* Try to align the host and virtual clocks
                if the guest is in advance */
             align_clocks(sc, cpu);
-- 
2.34.1


