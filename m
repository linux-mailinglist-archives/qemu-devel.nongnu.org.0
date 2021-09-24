Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B63CC416FD3
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 12:01:56 +0200 (CEST)
Received: from localhost ([::1]:53876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTi1j-0002BU-OG
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 06:01:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThiP-0007xJ-Qv
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:41:57 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:42901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThiO-0008QW-5g
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:41:57 -0400
Received: by mail-wr1-x42a.google.com with SMTP id i24so9580119wrc.9
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 02:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p+FhEVuxYvtBhbZfLgBuFMc/Z1Zw1Ec9d9CUDDVANlA=;
 b=nrI+Wi5nhIdxAJ3i1HND91Xx//nMUpPaDkD4GsfEPgEfTnS4R+MN/5em3jlcTu4ohY
 iqJqzOrQxR9VcbhxYjd06ihV9qy0EoGep35c0ayMsWLTAjyDS2K8prE1ZZvME9lFhdU4
 /wI1iQ0zKnVU0Vv9Wy0y0WmHNjCeKNpdYlxaDad/vp6kyJKOmkccNlRWPB/toN50NvMm
 r8sxxJrh5Qdq61qpGTJZkk/V8/bNtdtHd0v8jJdivkrioOu1A6y2wfnttH8onFJ2dK7k
 Xc2kROnMVzDSHa/KQ+B36fFMDDE/7GlPu4SAiSHtGb8dRI9eliy6T1PCKkBO/sNNme39
 t3Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=p+FhEVuxYvtBhbZfLgBuFMc/Z1Zw1Ec9d9CUDDVANlA=;
 b=kZc6CxkVlw3COce2fp3cTEZC3GIHN7poJlrXVy+6i+waF6iQRSvZJhVY/22eykFnoJ
 kTUpS2ki7VxDIcun3kxc8/qAO9fXEzaJDII/ktNuKSrzUiXCYGBHXcOGD5fzsumvFKfW
 N8a4M8m9B79ct+jbq1zsI79B51OcRtsesqlfIb+yBboRN8lHR8+kJVk+cPMmkZzEezYT
 y87fGERQ3G1FOXJEGSotUd0bowlByYdb6fH9+UhTu4Ijqwx4+JWRLHB6AwZ0wZsBB2gZ
 kuRGOmwv717W9ZnmZJUH4In2sCPJX+FuPAtId5M7YpiHlKwLSsFxhEh1njrhSCMnbjyf
 eY5A==
X-Gm-Message-State: AOAM533cc5Y3Eo41S6KboEuWEeibX824LnQlHjQ+b1tuZ8tgktIMEekL
 scMTJkT21MgYBDqTnMwgTC36WRTrF4k=
X-Google-Smtp-Source: ABdhPJz9tKPYztfReNR/f4qcvNF3lXMz5l1eh+YRosHTqsiiXY9RK89YXOnvDDVKxyzsvjrI3kAVXw==
X-Received: by 2002:a1c:23cb:: with SMTP id j194mr1049741wmj.1.1632476514649; 
 Fri, 24 Sep 2021 02:41:54 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 i67sm9220524wmi.41.2021.09.24.02.41.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 02:41:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 39/40] accel/tcg: Remove CPUClass::has_work()
Date: Fri, 24 Sep 2021 11:38:46 +0200
Message-Id: <20210924093847.1014331-40-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924093847.1014331-1-f4bug@amsat.org>
References: <20210924093847.1014331-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Eduardo Habkost <ehabkost@redhat.com>
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


