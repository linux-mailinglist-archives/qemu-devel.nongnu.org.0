Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05348418334
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 17:23:14 +0200 (CEST)
Received: from localhost ([::1]:60520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU9WD-0005Hm-03
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 11:23:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU94R-0004dt-IH
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:54:31 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:46595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU94O-0007Nm-Om
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:54:31 -0400
Received: by mail-wr1-x434.google.com with SMTP id c21so6797854wrb.13
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 07:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p+FhEVuxYvtBhbZfLgBuFMc/Z1Zw1Ec9d9CUDDVANlA=;
 b=j2XKcvZjAzhbF0iXh1wHoimnzK7MTcasZiXgGUDBIw24aQkysZpZV2MgjkdvCQaqqB
 uvmyElm74VQUVie93oSPhaseqL1alTXdcYvvpm7YDSbt249dKlqfFL6WTX7EenuptBjZ
 9WhNhhKr1XFI8+BTCXM9VmbMFhIOiMCHyeTfBHeLXleTUpUv3PQ/LGkXUaxAHujJbm3W
 xyZnPFTls1bGWelGTcb5BQIlHW/umcbs0QrgfrG4x+1TT6/Eoo8dQR9gHgFVhj+lNfRk
 C/i30R73O83Xy2w1GlS9ziojb4DslJe/IHVHFiFV9YaXZ9p48+4hiQN8wH3u9UFaW7AF
 MeNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=p+FhEVuxYvtBhbZfLgBuFMc/Z1Zw1Ec9d9CUDDVANlA=;
 b=gO/DBOFLasc8KpciIuX5DwmLJDMkC6c2ue9G5zs4Pvd6EzOm6n9ge9DBtXZOKxPbgS
 HnwzbmQsaROXMXTRbS8IW+8DvSMmc6lc4TXrconDKJrF8C3bfuLYeJ6oNVXn91nsrvGg
 4DogpkCC2IC6k0ZWlpZf0NRSXdS4z7AVKPSKY42sntB46zclZnCfI2KtRP/XnzhlkYYd
 sNRUiP5551K0lglCDlB5m0fxzXtvzs9nwVWzBm0LrcNAgbJvzlp4FQA07KQvqzuR2pXo
 P1EvcxPVmKeJTuhvh+5fHR1Xwkt42HNliZfuZDG4FhNIcar/dSd76RATkiJDnxKtjUQ+
 k/gA==
X-Gm-Message-State: AOAM530rzxCsa1l3sLXvtAWYWxky1GTZZzBRy51al4o+Hlo2WCDqKzyI
 8DVELZnDxZzWaPBfyWIlZcoPcK6mTCk=
X-Google-Smtp-Source: ABdhPJw8KBnY91I/w/nFC+xmJ1P2SRFfjejZY8DVCqC6ojyqeRXr6WksgOhHl4teltZayCtSxnIkGg==
X-Received: by 2002:a7b:c766:: with SMTP id x6mr7293341wmk.53.1632581666382;
 Sat, 25 Sep 2021 07:54:26 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 j4sm11680888wrt.67.2021.09.25.07.54.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 07:54:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 39/40] accel/tcg: Remove CPUClass::has_work()
Date: Sat, 25 Sep 2021 16:51:17 +0200
Message-Id: <20210925145118.1361230-40-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210925145118.1361230-1-f4bug@amsat.org>
References: <20210925145118.1361230-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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


