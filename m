Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 159B7416F66
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 11:45:48 +0200 (CEST)
Received: from localhost ([::1]:33076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mThm7-0002zE-1s
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 05:45:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThfe-0002p4-FL
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:39:06 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:44929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThfd-000607-0j
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:39:06 -0400
Received: by mail-wr1-x42d.google.com with SMTP id d6so25366862wrc.11
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 02:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tcpBP/9O11lxH2OkY3DQ1OAE3IFU4nJ2jfhNdgzdGjo=;
 b=WLY7+TOk/x3MxGIBWFNhGUNSBik56JD0m+P7Kt0ZcaeIA9YpEwGM5Qsi+S5zh5nrHr
 UbpgVVcAgadzYKqxRs/bZ3nHkFfj3jWBRiFSocCVJ0B5kuQEuV3XkfFa0DYCI5qacq9k
 wejFgzHUtWnGvsj6ZFIp1tt6z1XeFjEWbDrzwFl2PSCDfl6fDVsfq1ow039vvRsRRM5s
 IhOdjr1dToXzmRu4Eo0i7eW+5wb2Zx1c2uF9YQE4fGdKMNbYihwEMXbWATSE5zH2Ov2t
 FmuOFunbalKKu6IzesVW2HqbljUPQ5dAsltiq8dqmHq0BBf4UuRx6oDN8Fx7/qo1oFFt
 iOPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=tcpBP/9O11lxH2OkY3DQ1OAE3IFU4nJ2jfhNdgzdGjo=;
 b=kcfUSU2g69Hh2FwpcRFFTYlgM5lgWg7+KtdaN1weFZs4hOK1N8eEL34eXh7/Cu0bOZ
 jqFVWeWJO9GMPegdgMjk5JWnxFkYxyZkEY04TxPKAchi38Fpu5ZRaPrlXmKHW1yx4Nzx
 nX0zgd2RmLNpd0jnpAuYmpkK/sp6AOUBaOkpwlxjwNKmw3GY5TwQGNIIbm1SH06NOtBq
 jvxWZYnpHahdo+CPk1ZaxMmn2Fe+DCj2OFjdqgbNfbCNEmPGWs9CguQ6WeNj/7kVXWKt
 /DmIJGdaMsVUl/I6BqpMaLLDHYB0QLX9xFhRYFrmY6aUBeP4pr94yeF0v1EcQwu3sG2m
 Pd+w==
X-Gm-Message-State: AOAM532GDUIMrzkusmKnzwXR83GJPXXUo3LSID91XDAeNsmkDOUbVkX/
 znI3dEAHY4d6BucxZWr1iB1juOMsPqg=
X-Google-Smtp-Source: ABdhPJxw76TXcxjMtX6av9tiKhPOijBdHW9A/O/opESJjSyXGHgMGLoZ8t4VqmFCpHCnAM53AweWAQ==
X-Received: by 2002:a7b:c20f:: with SMTP id x15mr1053776wmi.59.1632476343524; 
 Fri, 24 Sep 2021 02:39:03 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 n19sm1325752wms.47.2021.09.24.02.39.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 02:39:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 03/40] hw/core: Restrict cpu_has_work() to sysemu
Date: Fri, 24 Sep 2021 11:38:10 +0200
Message-Id: <20210924093847.1014331-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924093847.1014331-1-f4bug@amsat.org>
References: <20210924093847.1014331-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Eduardo Habkost <ehabkost@redhat.com>
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


