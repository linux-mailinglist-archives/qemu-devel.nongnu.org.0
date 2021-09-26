Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53516418D01
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 01:09:06 +0200 (CEST)
Received: from localhost ([::1]:56562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUdGb-0008Od-Ck
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 19:09:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUcfB-0006Z9-Fu
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:30:27 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:36693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUcfA-0007SM-2N
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:30:25 -0400
Received: by mail-wr1-x431.google.com with SMTP id g16so46527568wrb.3
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 15:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p+FhEVuxYvtBhbZfLgBuFMc/Z1Zw1Ec9d9CUDDVANlA=;
 b=DA1VubHwWduJoSwatuYzAl+vDf2LeRJU18jwlvUHUbi8s091WbGbU36cpcOTwaixe4
 KuhXs2ZK+cS6MuzsW/eZUyKthgajldpt22XcUhJbnn/vZAM7xK7aeKS9EtvZ6SeWzBvC
 IShYGK963szVPJS/BCuVcksx8QIg1EA0h46dMLdb1qdJ9NkgIrjGaH0tJrdBw2f18pGA
 PHvIxHMhfDVBmt+YlHj0oSPjCc24r0DATvNaqBX4DfZBT/dyb8gYb3MaCErG8oFa8QVw
 OpjV4auRajZjoSq7G46WiZ5axmMdLdg55E+tVBR+OxhpJqLo9tzHde06/mkXKSzyNlcH
 XSvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=p+FhEVuxYvtBhbZfLgBuFMc/Z1Zw1Ec9d9CUDDVANlA=;
 b=qWcWQSGG2kxNhPugXD3O7HwM8qgfTb5RKyr9o3x92Yu4w7qLpcRxhBSXET5ReX+Kup
 POMzHVYUjqR+b+2uALpwR/6CXqjHlMoUbekig3rnZqzb3rqoS0KZER10ExqVhzYphguc
 7fu8EiTtDOcmw3mAG4I9ksr5wQVv8xZ+i1wakkrqB0VAbLw3zwtq0BZ7TJtrKVhsHMiH
 2bnEJFNfIgFyCfh9wGWw1Chs8CBi9dRefR29QjmWnym1IH8tk7X+5ktRM4smTTWSOImn
 ZRMKiR+UqPU9RPi1nA+Cme/11gX2dZZ5ogKxU09qGBdpZp9Q8G93yxmLd15Pd4dq85Cg
 sO8A==
X-Gm-Message-State: AOAM533gu5x99E9WXTfiLGsIKCwvR6bvcSiSgqAhpSyBnSiHbFrLDIF0
 kyaJq+eWKe7/rU8042JvVrb5cIEP2DA=
X-Google-Smtp-Source: ABdhPJxn9+kIMyYEnwJy5Vir0YeesvqCj/gWyyw5X7h0ork5oY26Q/yM2W7ekViVqEYpvdbTVr7DDQ==
X-Received: by 2002:a7b:cbce:: with SMTP id n14mr13047789wmi.169.1632695421297; 
 Sun, 26 Sep 2021 15:30:21 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 v17sm14525662wrr.69.2021.09.26.15.30.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 15:30:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 39/40] accel/tcg: Remove CPUClass::has_work()
Date: Mon, 27 Sep 2021 00:27:15 +0200
Message-Id: <20210926222716.1732932-40-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210926222716.1732932-1-f4bug@amsat.org>
References: <20210926222716.1732932-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
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

Now that all TCG targets converted their CPUClass::has_work()
handler to a TCGCPUOps::has_work() one, we can remove has_work
from CPUClass.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h     | 2 --
 accel/tcg/tcg-accel-ops.c | 3 ---
 2 files changed, 5 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 114eb3b9b2c..c64709b898c 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -89,7 +89,6 @@ struct SysemuCPUOps;
  * instantiatable CPU type.
  * @parse_features: Callback to parse command line arguments.
  * @reset_dump_flags: #CPUDumpFlags to use for reset logging.
- * @has_work: Callback for checking if there is work to do. Only used by TCG.
  * @memory_rw_debug: Callback for GDB memory access.
  * @dump_state: Callback for dumping state.
  * @get_arch_id: Callback for getting architecture-dependent CPU ID.
@@ -132,7 +131,6 @@ struct CPUClass {
     void (*parse_features)(const char *typename, char *str, Error **errp);
 
     int reset_dump_flags;
-    bool (*has_work)(CPUState *cpu);
     int (*memory_rw_debug)(CPUState *cpu, vaddr addr,
                            uint8_t *buf, int len, bool is_write);
     void (*dump_state)(CPUState *cpu, FILE *, int flags);
diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index cd44bb6d0d8..3c75ed2cccc 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -78,9 +78,6 @@ static bool tcg_cpu_has_work(CPUState *cpu)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    if (cc->has_work) {
-        return cc->has_work(cpu);
-    }
     if (cc->tcg_ops->has_work) {
         return cc->tcg_ops->has_work(cpu);
     }
-- 
2.31.1


