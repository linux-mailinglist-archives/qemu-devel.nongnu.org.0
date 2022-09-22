Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA005E670D
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 17:28:10 +0200 (CEST)
Received: from localhost ([::1]:47500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obO7V-00007z-CX
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 11:28:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1obNf3-0001Kl-NW
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 10:58:45 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:34678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1obNex-0000vb-6T
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 10:58:41 -0400
Received: by mail-wr1-x434.google.com with SMTP id z6so16052062wrq.1
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 07:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=a49OfR6mA+dsNFTxNEB2qaYc7wP4HP0cXPKhpat1zIs=;
 b=q31dyP8bFark/UjGmHQBJk/uNmz4B4yHXafqnizYXRYoqVk+GA0eJWpb4dGKRw4RSw
 zZADv3NC8EH3aZy6lMqB8ezVYzmfgaJMEG2E2ifsods1qfHiCns74ToNln/9w3vL32qT
 I3BkYs5yAl8rZb7dmNbf+adaxmkxfeGkVXRNSFbxexDUsOJtlEO28vqxw2c9p8v0Ib+L
 fhC2dzydQ36jDSgpYSJUblEhLP+PJZNBCI/vG3AkYmAUcuTw6tWx23o4NjHBXpm26ay4
 DxMOQAMT6emxqRoVFdT4LC2n9o6E53QjdHmzZD96bMa1q+W4pJHvLfHWbq2kgkhdBGqo
 iZPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=a49OfR6mA+dsNFTxNEB2qaYc7wP4HP0cXPKhpat1zIs=;
 b=bZQwAxk3qV/pjCWS2bYXtPje5UOKKYlfAu0RXgnOjJPhYL326QN6JsmYw5vkXiUgyR
 hP569TVB87aZVdGpaBHeegb+UXr5zpZymBEDjHPYvldXIBuhtEnPEVJnLaAPX59C/N4P
 eKeukeGjV98kbcSzCvwfPAf964FXE+pBHlHA4kDHdB99aufON//OedqR91pPAUKzgt4B
 DeneknCbwHCnGzHwBv9iEtxDEUzt4nLg9wQZPgJ6wUMGovkzarGHVE91aDfbG4/tuh38
 JaTBM2B3JAtgPK4KPt8uLECB9utU8JRzrQ+a7wFWSUumGJR+nks6gC/kO8JdpQoN57q7
 6OLg==
X-Gm-Message-State: ACrzQf3/Ptg5iiqbrcrhvFc7mr6DrduEpyf/GgU1JmwTCyjyPdxhMpWu
 X208pw4SnMlZLZDF4fgmu32LYQ==
X-Google-Smtp-Source: AMsMyM7rRFzcErute30MgfEXGnK1/L1EFVborYxP3WMA5KHrMNkloOdLkzUZs8fw8/DF+zIX9yeK5w==
X-Received: by 2002:a5d:64cd:0:b0:22a:ba05:8bcd with SMTP id
 f13-20020a5d64cd000000b0022aba058bcdmr2465237wri.74.1663858716516; 
 Thu, 22 Sep 2022 07:58:36 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 r7-20020a5d52c7000000b0022acb7195aesm5424479wrv.33.2022.09.22.07.58.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 07:58:35 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B2B761FFBC;
 Thu, 22 Sep 2022 15:58:32 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, mads@ynddal.dk,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:ARM cores)
Subject: [PATCH v1 4/9] hw/timer: convert mptimer access to attrs to derive
 cpu index
Date: Thu, 22 Sep 2022 15:58:27 +0100
Message-Id: <20220922145832.1934429-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220922145832.1934429-1-alex.bennee@linaro.org>
References: <20220922145832.1934429-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - update for new fields
  - bool asserts
---
 hw/timer/arm_mptimer.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/hw/timer/arm_mptimer.c b/hw/timer/arm_mptimer.c
index cdfca3000b..b48536f6a3 100644
--- a/hw/timer/arm_mptimer.c
+++ b/hw/timer/arm_mptimer.c
@@ -41,9 +41,10 @@
  * which is used in both the ARM11MPCore and Cortex-A9MP.
  */
 
-static inline int get_current_cpu(ARMMPTimerState *s)
+static inline int get_current_cpu(ARMMPTimerState *s, MemTxAttrs attrs)
 {
-    int cpu_id = current_cpu ? current_cpu->cpu_index : 0;
+    int cpu_id = attrs.cpu_index;
+    g_assert(attrs.requester_is_cpu);
 
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


