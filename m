Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74ECA5EC897
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 17:52:56 +0200 (CEST)
Received: from localhost ([::1]:34574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odCtC-0001JC-Bx
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 11:52:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odBMn-0005A4-3r
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 10:15:21 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:46940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odBMj-00061f-Ox
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 10:15:20 -0400
Received: by mail-wr1-x42b.google.com with SMTP id bk15so7472677wrb.13
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 07:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=9V9LEBkVMIt0gNfbFS+tXVi8Jwwq7HDOfuY//HgX7ok=;
 b=POsf1l2YOZ4HYa8opijLwGMGJqQhh9MPr1yNJf9NX9Bnao5LC70yNnQtyhrjQ1MAOv
 WSq6saiyH8qF7SU4PbGQMmpFfWlb00zwiQctj7JukLqe+7KwOLVF3kXNeDo3oKGjR9pp
 u6KimzDFcGdWJ7EHN/edh0nfPmrclKcmPE1qI6O+MVVy3UJiX3JK7bm5hngQy4eMyiXy
 mKydhvMlCerMq0bDqmn7knkK7Skzp4uPrCkAcbWkMZHMWlIy0WzxbZ63Ko2Fk2RU8/RU
 gUw7mpbUt0XrvbioTquu+U22TQ8hh9ykkTHAWSFS/VllPky6aDkj3RWilkFo2rt0HwFf
 meig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=9V9LEBkVMIt0gNfbFS+tXVi8Jwwq7HDOfuY//HgX7ok=;
 b=zpF9s8oAjj5C1Zk79vffezEJ9JpeSjrFhM2+EulUaow92D9jt2ltTkWE9V/T0StZA1
 HD3IY2s8tUY4p6/FiXEQSU83feJwinrQekIQGYvAv+OEiMaYAn2Cblb20ywUYGZ0WxpK
 FJrsgk0V1rz6AVNC6F6GBaAgryIA7FAMBk11vYGUhJnDNhkX/T50lSZmcUWykKRcKIxf
 DHEPkQmeCeHp4+fbPVWlT0p6yEFKTAmgI5OSFe60HQgiEDRThR7bxjhniZ5bIIx7DeXS
 e7Nocs9+ikXHat5wyxOZiIk186mmh5h1XBnsCwJ1KVTNCpBCDLnMJg84mD2Vgmwlp7ZX
 opnQ==
X-Gm-Message-State: ACrzQf3G8z+1LyaUMnSj16GGYmYN6mA4tNB0N4kvvKLCq/JXninjWeGa
 swqBM6nIC/V1qdmSk7yccXye8w==
X-Google-Smtp-Source: AMsMyM5iGTNZ0Ns3xvQpfQkJD+YNGy1TrVzPzPkbZ/VP8zUtpCHUlWe4zpNEdt140qMCO9F2isoWQw==
X-Received: by 2002:a5d:588f:0:b0:22b:623:ad04 with SMTP id
 n15-20020a5d588f000000b0022b0623ad04mr16915896wrf.607.1664288113769; 
 Tue, 27 Sep 2022 07:15:13 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 p14-20020adfce0e000000b0022af6c93340sm1957085wrn.17.2022.09.27.07.15.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 07:15:10 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DCC711FFC0;
 Tue, 27 Sep 2022 15:15:06 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 09/15] hw/timer: convert mptimer access to attrs to derive
 cpu index
Date: Tue, 27 Sep 2022 15:14:58 +0100
Message-Id: <20220927141504.3886314-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927141504.3886314-1-alex.bennee@linaro.org>
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This removes the hacks to deal with empty current_cpu.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - update for new fields
  - bool asserts
---
 hw/timer/arm_mptimer.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/hw/timer/arm_mptimer.c b/hw/timer/arm_mptimer.c
index cdfca3000b..34693a2534 100644
--- a/hw/timer/arm_mptimer.c
+++ b/hw/timer/arm_mptimer.c
@@ -41,9 +41,10 @@
  * which is used in both the ARM11MPCore and Cortex-A9MP.
  */
 
-static inline int get_current_cpu(ARMMPTimerState *s)
+static inline int get_current_cpu(ARMMPTimerState *s, MemTxAttrs attrs)
 {
-    int cpu_id = current_cpu ? current_cpu->cpu_index : 0;
+    int cpu_id = attrs.requester_id;
+    g_assert(attrs.requester_type == MTRT_CPU);
 
     if (cpu_id >= s->num_cpu) {
         hw_error("arm_mptimer: num-cpu %d but this cpu is %d!\n",
@@ -178,25 +179,27 @@ static void timerblock_write(void *opaque, hwaddr addr,
 /* Wrapper functions to implement the "read timer/watchdog for
  * the current CPU" memory regions.
  */
-static uint64_t arm_thistimer_read(void *opaque, hwaddr addr,
-                                   unsigned size)
+static MemTxResult arm_thistimer_read(void *opaque, hwaddr addr, uint64_t *data,
+                                      unsigned size, MemTxAttrs attrs)
 {
     ARMMPTimerState *s = (ARMMPTimerState *)opaque;
-    int id = get_current_cpu(s);
-    return timerblock_read(&s->timerblock[id], addr, size);
+    int id = get_current_cpu(s, attrs);
+    *data = timerblock_read(&s->timerblock[id], addr, size);
+    return MEMTX_OK;
 }
 
-static void arm_thistimer_write(void *opaque, hwaddr addr,
-                                uint64_t value, unsigned size)
+static MemTxResult arm_thistimer_write(void *opaque, hwaddr addr,
+                                uint64_t value, unsigned size, MemTxAttrs attrs)
 {
     ARMMPTimerState *s = (ARMMPTimerState *)opaque;
-    int id = get_current_cpu(s);
+    int id = get_current_cpu(s, attrs);
     timerblock_write(&s->timerblock[id], addr, value, size);
+    return MEMTX_OK;
 }
 
 static const MemoryRegionOps arm_thistimer_ops = {
-    .read = arm_thistimer_read,
-    .write = arm_thistimer_write,
+    .read_with_attrs = arm_thistimer_read,
+    .write_with_attrs = arm_thistimer_write,
     .valid = {
         .min_access_size = 4,
         .max_access_size = 4,
-- 
2.34.1


