Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4388B40DEB3
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 17:52:13 +0200 (CEST)
Received: from localhost ([::1]:59738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQtgK-00051w-9z
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 11:52:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLV-0001NW-Nc
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:30:41 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:50726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLP-0002Sd-VS
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:30:39 -0400
Received: by mail-pj1-x102e.google.com with SMTP id k23so4847871pji.0
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 08:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M/fz3nm2YLKytQPDTi7ONHRlfHiXRDVxp1klTgoeiA4=;
 b=RCzKU9EyUQ92DjLO8DRwCv8r8x5prQ3hGEc5UwjJkVvZDlY3JkE+nNHrInaY9/9j8N
 Krs+ZGyUrWEUEfn86EnBze381H69SoAv96Ae6qL0xe9SlHfbu4NUYbrfip5IpXDPnHlS
 qyNozVifkqBvbcsJ4sZUYubmLOiuLlISVdDNInCYimZsy9LjMS2WetrDZDdcM9M0dJ30
 fPl3M0CMPYSXG3p7dkwwNmUXghJnSdV5aWljnFsZSTh5NPxSL5EBsmIwM5vXk/KAF8WF
 QblYi1szvQzIGi7HqGSwJ6DaHVRM40PuHQ1pTrQf5XAWRurLIo2hh50eaVBNNUrtUIHS
 rYjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M/fz3nm2YLKytQPDTi7ONHRlfHiXRDVxp1klTgoeiA4=;
 b=GOAyGbtS6eVn/soi9rTibpWsNoNzBSj51v55R7OxGyo0/JaIcE6H/IQ1akUNVfjtC9
 as/Z7PR0B1C8++jCsmJl5stU7RNkXwbPNd1m/gsALS2UPV0+PL2kB559NrgoHdA3VxYD
 0s+HoFlMxyVu936jl8PZnrO04srE7l3nep/IoNKkj3OeIbUx6lac6p9Au8V9vF6BxBuB
 mdG8b+mwWDeQv2EBW0KoS///3CwJKlHWWOH/NNxRxu3F0SGRrfIY8cGSGmIbt8Yv93l4
 pgfXDLGlHC5lVaFV1IEZDLmslsyLWH9ItMBKorEpzpgwmCBwtvXFwlSmhDmWQfrrDdm4
 NALg==
X-Gm-Message-State: AOAM533NNKrjyqsM8VXrX3wyA/66dL7Epg2GkViZUMFUoKBMkribCbyG
 9GDykjYfDsagYUryeNh4TSyO8X13iTQhKA==
X-Google-Smtp-Source: ABdhPJwRd3v0b/DfomGbZmqlL6bx4a+HRKP2PVKsRm/08/C3j3DLDsdUmxgbTRskZpffyicA6dCJnw==
X-Received: by 2002:a17:90a:c58b:: with SMTP id
 l11mr6626853pjt.134.1631806234738; 
 Thu, 16 Sep 2021 08:30:34 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id b7sm3779447pgs.64.2021.09.16.08.30.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 08:30:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/35] target/cris: Restrict has_work() handler to sysemu
Date: Thu, 16 Sep 2021 08:30:02 -0700
Message-Id: <20210916153025.1944763-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916153025.1944763-1-richard.henderson@linaro.org>
References: <20210916153025.1944763-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Restrict has_work() to sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210912172731.789788-12-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/cris/cpu.c b/target/cris/cpu.c
index c2e7483f5b..b9f30ba58f 100644
--- a/target/cris/cpu.c
+++ b/target/cris/cpu.c
@@ -35,10 +35,12 @@ static void cris_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.pc = value;
 }
 
+#if !defined(CONFIG_USER_ONLY)
 static bool cris_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & (CPU_INTERRUPT_HARD | CPU_INTERRUPT_NMI);
 }
+#endif /* !CONFIG_USER_ONLY */
 
 static void cris_cpu_reset(DeviceState *dev)
 {
@@ -208,6 +210,7 @@ static const struct TCGCPUOps crisv10_tcg_ops = {
     .tlb_fill = cris_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = cris_cpu_has_work,
     .cpu_exec_interrupt = cris_cpu_exec_interrupt,
     .do_interrupt = crisv10_cpu_do_interrupt,
 #endif /* !CONFIG_USER_ONLY */
@@ -294,7 +297,6 @@ static void cris_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_reset(dc, cris_cpu_reset, &ccc->parent_reset);
 
     cc->class_by_name = cris_cpu_class_by_name;
-    cc->has_work = cris_cpu_has_work;
     cc->dump_state = cris_cpu_dump_state;
     cc->set_pc = cris_cpu_set_pc;
     cc->gdb_read_register = cris_cpu_gdb_read_register;
-- 
2.25.1


