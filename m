Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B02418B6F
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 00:32:30 +0200 (CEST)
Received: from localhost ([::1]:55070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUchA-00008H-F2
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 18:32:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUccN-0000Vt-FW
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:27:31 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:45005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUccM-0005Bg-19
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:27:31 -0400
Received: by mail-wr1-x436.google.com with SMTP id d6so46332936wrc.11
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 15:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tcpBP/9O11lxH2OkY3DQ1OAE3IFU4nJ2jfhNdgzdGjo=;
 b=VrC3hwaeTLX0Kxv3lfQQysV9PzI8O+brgKJIBlo92D0UgV66nXXvoj8v/CyhYS2OOO
 EGIj9LMFCQ2hHkFwwlVVP9qvyEptU6cvtsWIdrK57UY3U1jFJiUW9SIyp+5vdH7Upqry
 eKOUbjxnJ+YDjw5msGdo85oWsyDgK4NxGkqmeSKzDVSMbGyq4qdzcO/6+kfAGVyxstYY
 8j9AnKlVRTuXsEWDhBHRFucZbQZ7Ud+ar7lyALa3rIDCUM3Z3XrX8JoLFvPEgQS6qxBh
 Z7hZvKAb2yoqGAfRVMv3aeFjQEzuH8GQ7JE3TIJDSfz5VcR6ya2eECYb78Ql2olW/Fik
 Knkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=tcpBP/9O11lxH2OkY3DQ1OAE3IFU4nJ2jfhNdgzdGjo=;
 b=rCsOvzVNKJs/Ryzz619ss2mqk/zl+ZZLQhxlsPMjP1PcLfZYaYncenzaqTjvzvsowU
 NDGWecpzhaTSRFH2eRvVZUGl0iIuRzwR4aetZxda8rxHggIcbzqFBKy3vLlAya8hrK65
 hApynEXGqzS35t+n6T0EhkJEezfU1ouN4jobS7z0ie1piHhgCIiJD0KVI58XA7EiLxb9
 KvVps9e7rrr6irjUUoYcjJ0+69DPKEYuMOtOw51SlxwW04b5OwT8Ffg5MSfObOt4Ksja
 YdHoUskeU3HUzqE4AIWHU6cGb88dQIQSiqDLFjTdAh17TFbc8Z/IjCmi7Ui0gDGuMVmK
 ufOg==
X-Gm-Message-State: AOAM5315WVqGuqU+HHzkCXEcPrAFLNBh/ij5h7aguyuVlJa5e7noS5OI
 xr8q915RGbP43/f4tKEuY994jNVhztU=
X-Google-Smtp-Source: ABdhPJzFWnvMDXy1tAkMScNtbQaTQALGQxVxwGGiqTw84p9GDsoqfslCrBW60APRwQRYg9smqLdBPQ==
X-Received: by 2002:a5d:6c69:: with SMTP id r9mr24946283wrz.78.1632695248403; 
 Sun, 26 Sep 2021 15:27:28 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 d11sm7987590wrx.22.2021.09.26.15.27.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 15:27:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 02/40] hw/core: Restrict cpu_has_work() to sysemu
Date: Mon, 27 Sep 2021 00:26:38 +0200
Message-Id: <20210926222716.1732932-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210926222716.1732932-1-f4bug@amsat.org>
References: <20210926222716.1732932-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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

cpu_has_work() is only called from system emulation code.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index bc864564cee..2bd563e221f 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -538,6 +538,22 @@ enum CPUDumpFlags {
 void cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 
 #ifndef CONFIG_USER_ONLY
+/**
+ * cpu_has_work:
+ * @cpu: The vCPU to check.
+ *
+ * Checks whether the CPU has work to do.
+ *
+ * Returns: %true if the CPU has work, %false otherwise.
+ */
+static inline bool cpu_has_work(CPUState *cpu)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    g_assert(cc->has_work);
+    return cc->has_work(cpu);
+}
+
 /**
  * cpu_get_phys_page_attrs_debug:
  * @cpu: The CPU to obtain the physical page address for.
@@ -636,22 +652,6 @@ CPUState *cpu_create(const char *typename);
  */
 const char *parse_cpu_option(const char *cpu_option);
 
-/**
- * cpu_has_work:
- * @cpu: The vCPU to check.
- *
- * Checks whether the CPU has work to do.
- *
- * Returns: %true if the CPU has work, %false otherwise.
- */
-static inline bool cpu_has_work(CPUState *cpu)
-{
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    g_assert(cc->has_work);
-    return cc->has_work(cpu);
-}
-
 /**
  * qemu_cpu_is_self:
  * @cpu: The vCPU to check against.
-- 
2.31.1


