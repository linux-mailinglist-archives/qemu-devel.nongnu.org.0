Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F993DE501
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 06:21:15 +0200 (CEST)
Received: from localhost ([::1]:40582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAlvW-0002XY-KA
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 00:21:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlpY-00030e-01
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:15:04 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:47011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlpW-0002A6-AZ
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:15:03 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 g23-20020a17090a5797b02901765d605e14so2967616pji.5
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 21:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KU5GqqnHBwJE2oQY4NvVS8KLTvZHsylgeTI1DbvIUb8=;
 b=Wi+UvR0T1lvyj/L1YGRuXwDshFX/A29RyIsl56tkl4cWXGUZAbYeTzFJGW5V19CkG/
 hBfLj144o/nm2VZaA+GguCsFqEHYfY4Yvl3mIGbVUdOIZri3bi/EyIij7SL9t1dPSB5s
 4wQF2cAiHtqQJHcnt9m8CuoUhoKOuCVt7AzyczrULH05ggxyOfb3objee2s17EoF5Ab2
 7kHmI1U+LYWGgTccHNNtvwvPG3rZ97g9jLahtoz3XUciogzJSn/uhmKQEiwLZjtRdyMv
 G9gfayOs4pytsoBAT+eYgSt8DmtT7Ir7jhnZj3LrdVSqLGABukircLVTd1lvpd6JUWqb
 3HMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KU5GqqnHBwJE2oQY4NvVS8KLTvZHsylgeTI1DbvIUb8=;
 b=NfO5quWkIw7L4M14pM9WSqc5L+Yeuta9Kt3BTOrT2nHWiwThiC72+NMF3T4wB53QdN
 m5NjYD4yp1tXQ1DmaVaXRqU1dQnCn0RIeQXn2Z4xjz4cA8SOQbzvj6EQdWSuu4WbzKTt
 LsEdf8gPdTZCcnH5ZF5OylhkaeFc3bmOgETjoVkBmL9Qia1xRRf9DdUR/JZGUe3zKv9p
 mnzHfP0yqtnTcTP4Xjdg4bTr8wXk1ew88hvMTNpitQuJIR1qv8+kZ1d9fYyiNvs54udK
 PT5+7mnHzgFec6nujK7cV0iObLuXRyX/7wpSKqPEX1wKIqfPCxFBRBbluyOodpzZbNQM
 f+IQ==
X-Gm-Message-State: AOAM530j5Z7Bp+fG03ehh4gpcf90mym2rdM1MbHsvzqnbsiMTdQETWNn
 cWGjxUtQKTMil5kFLjfVadxvi7kxXdR0nw==
X-Google-Smtp-Source: ABdhPJyZvvK1eq4Aih8zh1R2k6vi43TOBITWGAyolbc/sihXFUvozE3CFR8OTl7hdy0XfCWHhIuZzA==
X-Received: by 2002:a17:90b:153:: with SMTP id
 em19mr2462621pjb.158.1627964100955; 
 Mon, 02 Aug 2021 21:15:00 -0700 (PDT)
Received: from localhost.localdomain (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id c23sm13718532pfn.140.2021.08.02.21.14.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 21:15:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/55] target/sh4: Set fault address in
 superh_cpu_do_unaligned_access
Date: Mon,  2 Aug 2021 18:14:01 -1000
Message-Id: <20210803041443.55452-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803041443.55452-1-richard.henderson@linaro.org>
References: <20210803041443.55452-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We ought to have been recording the virtual address for reporting
to the guest trap handler.

Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sh4/op_helper.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/sh4/op_helper.c b/target/sh4/op_helper.c
index c0cbb95382..d6d70c339f 100644
--- a/target/sh4/op_helper.c
+++ b/target/sh4/op_helper.c
@@ -29,6 +29,9 @@ void superh_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
                                     MMUAccessType access_type,
                                     int mmu_idx, uintptr_t retaddr)
 {
+    CPUSH4State *env = cs->env_ptr;
+
+    env->tea = addr;
     switch (access_type) {
     case MMU_INST_FETCH:
     case MMU_DATA_LOAD:
@@ -37,6 +40,8 @@ void superh_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
     case MMU_DATA_STORE:
         cs->exception_index = 0x100;
         break;
+    default:
+        g_assert_not_reached();
     }
     cpu_loop_exit_restore(cs, retaddr);
 }
-- 
2.25.1


