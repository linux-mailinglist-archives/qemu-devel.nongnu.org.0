Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C7D418B93
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 00:40:48 +0200 (CEST)
Received: from localhost ([::1]:52446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUcpC-0000hC-Rc
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 18:40:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUcdC-0001n4-VU
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:28:23 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:39827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUcdB-0005rk-Gh
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:28:22 -0400
Received: by mail-wr1-x432.google.com with SMTP id r23so21136769wra.6
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 15:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0BYMbs0TcChkwFeeNZ8rPK4jjNXuJ+c6QHnkutAyXs4=;
 b=OR3OPo45aC2xhKChcrZz7za2Uk1gRl7+YVRHyKl4/fDo7VUbVpWL7BLLaZy15w6aGi
 H03Qa2hgDLL4UEw/IzYe9l5Zt5nEDKnLtEpKYohvsQclwEoIiVJczD9Ok8HuavRtEWiO
 /lTmvtPR8ymuzEnm4kFkuIygv2qyBtDczzPHJlugzP+rNSKrh+FZaYKtahEHxM2objv9
 usUnIm6kIOwZoR568lGNB3mBuoqerdy3D/DnzZdAapnXPXn8AudH77U7fHRfamqATa4j
 cG3+nmf3S6MownvkNDjvY+LC7X2+ojavEJQHgCGJHqGmT9+Fex5qFbGxiuNhf2KVtHte
 J1Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0BYMbs0TcChkwFeeNZ8rPK4jjNXuJ+c6QHnkutAyXs4=;
 b=TFZmBl5K3T4znJWayPkBZTTMSmuegHfIOULKGqFEy4NzXUdMuLZ5laHUU5SR7o7i6o
 XL2wIFylDylXFSizaHOnD3PDxaZ7XgW6NIzUYRBJlNgtJVgnBaURSDtGXVJ9qe3+zRS2
 YahOhlQdjKEij6dzuQfbfVIUafjdOusGnKckM82+1hZxiByAbPtw/rrTNZzM/Mz2NHD+
 fIvljj8UPNtOghh4tyvR/eZrWc7ngrgfrCA2O5q6X3tIf3PlHn/TcLzTnezOFb/jgUXQ
 MLkOta4YXv4/P46orKgp61Al8e59XoxqHxrw92O9XDlYJv6ff6B7rge4QF73u1LbSOvc
 sX5A==
X-Gm-Message-State: AOAM532a7pD4KJBz8skNNf1n8PPnmQDPgH46fL0fjrywZHCF2vLQ/GPl
 iDKckfxtw229PVjP4uDxSatPXPwVNSc=
X-Google-Smtp-Source: ABdhPJyjdJ7eLF1HdNjB1R1s6RdIQh08bx09tZ2GkYBNLlR6eCuTx9u46IUXIrAQbsfKFitvqeWSJA==
X-Received: by 2002:a05:6000:18a2:: with SMTP id
 b2mr24015945wri.342.1632695299896; 
 Sun, 26 Sep 2021 15:28:19 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 f8sm14727277wrx.15.2021.09.26.15.28.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 15:28:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 13/40] accel/tcg: Implement AccelOpsClass::has_work()
Date: Mon, 27 Sep 2021 00:26:49 +0200
Message-Id: <20210926222716.1732932-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210926222716.1732932-1-f4bug@amsat.org>
References: <20210926222716.1732932-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
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

All accelerators but TCG implement their AccelOpsClass::has_work()
handler, meaning all the remaining CPUClass::has_work() ones are
only reachable from TCG accelerator; and these has_work() handlers
belong to TCGCPUOps.

We will gradually move each target CPUClass::has_work() to
TCGCPUOps in the following commits.
For now, move the CPUClass::has_work() call to tcg_cpu_has_work(),
the TCG AccelOpsClass::has_work() implementation.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h     |  2 +-
 accel/tcg/tcg-accel-ops.c | 11 +++++++++++
 softmmu/cpus.c            |  5 -----
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index e2dd171a13f..114eb3b9b2c 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -89,7 +89,7 @@ struct SysemuCPUOps;
  * instantiatable CPU type.
  * @parse_features: Callback to parse command line arguments.
  * @reset_dump_flags: #CPUDumpFlags to use for reset logging.
- * @has_work: Callback for checking if there is work to do.
+ * @has_work: Callback for checking if there is work to do. Only used by TCG.
  * @memory_rw_debug: Callback for GDB memory access.
  * @dump_state: Callback for dumping state.
  * @get_arch_id: Callback for getting architecture-dependent CPU ID.
diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index 1a8e8390bd6..ebaacff1842 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -73,6 +73,16 @@ int tcg_cpus_exec(CPUState *cpu)
     return ret;
 }
 
+static bool tcg_cpu_has_work(CPUState *cpu)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    if (cc->has_work) {
+        return cc->has_work(cpu);
+    }
+    return false;
+}
+
 /* mask must never be zero, except for A20 change call */
 void tcg_handle_interrupt(CPUState *cpu, int mask)
 {
@@ -108,6 +118,7 @@ static void tcg_accel_ops_init(AccelOpsClass *ops)
         ops->kick_vcpu_thread = rr_kick_vcpu_thread;
         ops->handle_interrupt = tcg_handle_interrupt;
     }
+    ops->has_work = tcg_cpu_has_work;
 }
 
 static void tcg_accel_ops_class_init(ObjectClass *oc, void *data)
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 5ffa02f9cef..bb16a25bcef 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -251,11 +251,6 @@ void cpu_interrupt(CPUState *cpu, int mask)
 
 bool cpu_has_work(CPUState *cpu)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    if (cc->has_work && cc->has_work(cpu)) {
-        return true;
-    }
     if (cpus_accel->has_work && cpus_accel->has_work(cpu)) {
         return true;
     }
-- 
2.31.1


