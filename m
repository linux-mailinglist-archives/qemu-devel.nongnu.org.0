Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE655B8DAD
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 19:00:11 +0200 (CEST)
Received: from localhost ([::1]:43174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYVk9-00013b-Uq
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 13:00:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUxj-0005lN-A6
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 12:10:12 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:33398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUxe-0004Pf-SB
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 12:10:06 -0400
Received: by mail-wr1-x432.google.com with SMTP id k9so26534957wri.0
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 09:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=KTWhWCodscN9QmBf6ymhSnJIqLxNPXfRH0SuystR2vc=;
 b=VjBYn/qnFC5H71kgDB5wD+9OSGyUu9KiEHZmaonTUpgISEHHqSAfELVqCq3rYDrJfQ
 nHgmfxNDNi7SOHoBXF8GcjuCwTyOnzIXUURgqE037CKk0njVilR7bk+sRbJrWDcpUoWN
 jYUkH5hxAQkqxVFh+IL9AvO7RJneJapvAwELAL5iV2Fv/H0MPfhNOWuvnQRg11EdkpSv
 49UDFSPCOmGV/t/guRNVvj65i1zs3XfysMWe9alBDWU5fCrbvd+x9qU6Eejw411IA8h0
 d6dI+BXDbBkiDZbwQgQ0MaUi+nRIZSOaup4XVkUUunmzpIYcAH+PuodUto2fBpH5RaGN
 Zg5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=KTWhWCodscN9QmBf6ymhSnJIqLxNPXfRH0SuystR2vc=;
 b=lZrWSJFAxmrFWmf5LpR9dF65FG9OFwiHJX93Q7z23tJpySpSeQnO+ssD4mzEhlvHDw
 lejyoZ/XjkBaIP+dz/UrfB4E6TAEuO6zHX7esLVPFacrEah6SUkrUl9nGNb/HA6qs5Xv
 XMriwMUjx+B5idvQWY1fAo2D4Eqwnp4NYGrkYPrm0DUd90Wro6oR5aUQ8fXOK1CVD7xr
 fGih4fUxjWJgIWmcSlOfP6GdMx6MF99L071zVibJhML1enkXwKJvC7Zwg6vwFdSDfOf5
 YYcgnCJcV3I/V0ZHZD6CD/9QcY9x6OPCyC3xojsEhqRxb9ujAP9DxiFBVsxpMhbnRnMq
 wExg==
X-Gm-Message-State: ACgBeo3ybf1i70f9/cwEMFAS9RQi4Q/wG/PURLYjY7eoy8dsqHvBW4wR
 sIvFjbfIx5SJzPxPL+wfZ7AvQw==
X-Google-Smtp-Source: AA6agR6/EqN4BGv/4/na+ZsDnKIHgk5ApUSiECKSFulWufrnwfHta7HSNA9gMjGLBchByFhQq0VJHg==
X-Received: by 2002:adf:d1ec:0:b0:228:d9ea:cbd2 with SMTP id
 g12-20020adfd1ec000000b00228d9eacbd2mr21998462wrd.609.1663171799021; 
 Wed, 14 Sep 2022 09:09:59 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 b17-20020adfee91000000b0022ac12fff29sm4911415wro.65.2022.09.14.09.09.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 09:09:56 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 769FE1FFBC;
 Wed, 14 Sep 2022 17:09:55 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [RFC PATCH 4/4] hw/timer: convert mptimer access to attrs to derive
 cpu index
Date: Wed, 14 Sep 2022 17:09:55 +0100
Message-Id: <20220914160955.812151-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914160955.812151-1-alex.bennee@linaro.org>
References: <20220914160955.812151-1-alex.bennee@linaro.org>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/timer/arm_mptimer.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/hw/timer/arm_mptimer.c b/hw/timer/arm_mptimer.c
index cdfca3000b..a7fe6ddc0d 100644
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
+    g_assert(attrs.requester_cpu == 1);
 
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


