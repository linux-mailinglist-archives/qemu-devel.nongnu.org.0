Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D802F60AD6F
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 16:24:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omxSU-0003HX-Cj; Mon, 24 Oct 2022 09:25:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omxSM-0003GE-KS
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:25:30 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omxSK-0003yq-6Q
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:25:30 -0400
Received: by mail-pl1-x62b.google.com with SMTP id c24so8420794pls.9
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 06:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=U318AeTBizk8iybf4IKiTJfeP/3EJY4p5aqb59+L12c=;
 b=D2ikOz5RQm7yrLZdBEt66GoP+FEP+YtuZVXPtofKWYJz5gwZw2TK55eSgs3zbdtXK9
 0Lunj3mhL6cXSRa3gcWnUiu0ynjRYrhXt38j7xrhRlUJDSZ+UaxlgWaRkXR8Cp5QFknf
 dBVZG3nI5+vJu/Vtslrt1D2fu5GcUkykZ+2rZV4vBePLOWMZUHzDQfwV6oqvNC6hOYjX
 P31FJlz/nmaqpr3rH5JSFHcTe9kh5WmKe13VDlHoRyE58YYBP5U0chLNSyAh25+KgQNg
 IZyzi1SaCcM4+FDo75t0YLb3X9+2zF/fokxPzQ3WNa/qO8PkF1v2ptJ4c1ydzRVesvrB
 hWvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U318AeTBizk8iybf4IKiTJfeP/3EJY4p5aqb59+L12c=;
 b=Wi3wNGtjgmlTO8boIox4hJYHGU7AUdFonlUAhWmpMjMTWpB+/cTvayafs2smGXkpDx
 02ujZR+3+1HnsaTGyjqbFuM6ekLbUcXbPWKyj28o/cAmtiNcVTy5z31u17K1/HAu4y12
 pq4afKiODjh1VzwYLNYTCq5i7xOIdtvrS6LpQE05UOkc1JHMz3FOzXsbBgnn1c9DUBd/
 KJvhOW9JHYrvRD40pPTV5z67m28IwgCyhcgG8bRI3fRXuK9buy1e40VPHoPIJSL7l5yg
 AA7GbuJIKl3weOhkuHpaX2jQ9EZIoBvZWd0+vSaNjg9UHiS0hbGzZLqRrxnywkEKXqFc
 Znpw==
X-Gm-Message-State: ACrzQf180Kv8aP/lgzobJhS0zTdpc6F6KZqChzEQmKlJ7iPZ2+wAgGKo
 /+/z+SqCN7rj7zTY9Syhh0A+SWihDofMRA==
X-Google-Smtp-Source: AMsMyM6KNyrk7pbhDBDSfzjNUYawsta39Idn/aV49futNgIFXyUTHSwqBMoHPfS67WdQJqKdKy0deA==
X-Received: by 2002:a17:90a:d30c:b0:213:1035:f914 with SMTP id
 p12-20020a17090ad30c00b002131035f914mr5928436pju.196.1666617926965; 
 Mon, 24 Oct 2022 06:25:26 -0700 (PDT)
Received: from stoup.. ([103.100.225.182]) by smtp.gmail.com with ESMTPSA id
 b12-20020a1709027e0c00b00178ab008364sm17009216plm.37.2022.10.24.06.25.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 06:25:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/29] target/hexagon: Convert to tcg_ops restore_state_to_opc
Date: Mon, 24 Oct 2022 23:24:36 +1000
Message-Id: <20221024132459.3229709-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024132459.3229709-1-richard.henderson@linaro.org>
References: <20221024132459.3229709-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/cpu.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index fa6d722555..03221fbdc2 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -271,9 +271,13 @@ static bool hexagon_cpu_has_work(CPUState *cs)
     return true;
 }
 
-void restore_state_to_opc(CPUHexagonState *env, TranslationBlock *tb,
-                          target_ulong *data)
+static void hexagon_restore_state_to_opc(CPUState *cs,
+                                         const TranslationBlock *tb,
+                                         const uint64_t *data)
 {
+    HexagonCPU *cpu = HEXAGON_CPU(cs);
+    CPUHexagonState *env = &cpu->env;
+
     env->gpr[HEX_REG_PC] = data[0];
 }
 
@@ -327,6 +331,7 @@ static void hexagon_cpu_init(Object *obj)
 static const struct TCGCPUOps hexagon_tcg_ops = {
     .initialize = hexagon_translate_init,
     .synchronize_from_tb = hexagon_cpu_synchronize_from_tb,
+    .restore_state_to_opc = hexagon_restore_state_to_opc,
 };
 
 static void hexagon_cpu_class_init(ObjectClass *c, void *data)
-- 
2.34.1


