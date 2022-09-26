Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE4C5EA7AB
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 15:53:18 +0200 (CEST)
Received: from localhost ([::1]:58198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocoXt-0003Ej-Mg
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 09:53:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ocoKJ-00022K-Cn
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:39:17 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:43773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ocoKH-0005es-0Z
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:39:14 -0400
Received: by mail-wr1-x432.google.com with SMTP id t7so10241126wrm.10
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 06:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=IRUW2pm7zwTwXKyvk91nrv12NDMnIiyMSqxZ62fe2xY=;
 b=hbNZb0HiWW46FdJzuX55kN0jAW/OLv8ouYLybLOZ39gZzE3KyDakHvV+iZdv9V5HTZ
 2uJ8uf3tNLs1mKnHvFW/zkp9HZpKWJE0apKrrFYivkN1Jh3XH8zJ2GA3wxOeZgizwe0T
 Y9uV8GmxVUuieo2ByTsA9cve7eGf0he/yTZ5OKGs81+ckS69ZrqKNViVydSvQfWDCZDH
 zNgNy9gn009UfkyoziRnoiFY6FbvRfvm675kbKYQBSiq2K4on4ml0jRpwfCgNAvpi8i6
 VrtWh3esXaeT0D6M4k9V6Sy0ewq331ipf8qZoMdpriRWrSXhyTDP1t+nXMyS/IRKmbau
 jcYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=IRUW2pm7zwTwXKyvk91nrv12NDMnIiyMSqxZ62fe2xY=;
 b=eaMEOOTxWheHHsA4TLFhoLIEbsnbxGovjrfy/AR8CTfe9fsUGVUJd0luvPZg5BhpyQ
 QYDICFO4bw/MZ0BXcyNhFyrkAz3hXIPTNsM5n8VcjnocpfzRmsHEaP7WhfhHFnFMAml7
 CgZhpHzCc/2zaPkmSZXu9qLgpkz8dVi4SQGegG5hZmhrIZsEaxBuRnPiGFgVGjE7TBXD
 8RxJFp6ypT+uxtmcC92u4pQFK5yDebriSLknLHi8Gva9DmKLP0UqbSwoSNPXjCbzU/j4
 42xfo85MedYPJ8A8lHhTFtZvyl62oAsN9OaC1mcbPeYZt7dGlSizN1hfYPTz+vYqo5uz
 N4BQ==
X-Gm-Message-State: ACrzQf0cv6hoclgRqLyqWcIKzLXxAfbAIW68pm5UYKPJDOGbJMjo7x9O
 cGTxhhNlSdAsJRgR3ZtKPaOUPg==
X-Google-Smtp-Source: AMsMyM7RG+0gf6wFDkSbzwjh9308vWIvbs+8IzTQaBdLcDTq4gFKQZEQagAoGIKYVV4ITqnVMDBJTA==
X-Received: by 2002:a5d:6987:0:b0:228:623e:2dc5 with SMTP id
 g7-20020a5d6987000000b00228623e2dc5mr13924955wru.574.1664199550137; 
 Mon, 26 Sep 2022 06:39:10 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 fc17-20020a05600c525100b003b435c41103sm12046538wmb.0.2022.09.26.06.39.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 06:39:08 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 46AC61FFBE;
 Mon, 26 Sep 2022 14:39:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, mads@ynddal.dk, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 06/11] hw/timer: convert mptimer access to attrs to derive
 cpu index
Date: Mon, 26 Sep 2022 14:38:59 +0100
Message-Id: <20220926133904.3297263-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220926133904.3297263-1-alex.bennee@linaro.org>
References: <20220926133904.3297263-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
index cdfca3000b..813ba3b7e8 100644
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
+    g_assert(attrs.requester_type == MEMTXATTRS_CPU);
 
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


