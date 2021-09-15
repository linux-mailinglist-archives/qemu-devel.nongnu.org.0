Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A7D40CE78
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 22:59:42 +0200 (CEST)
Received: from localhost ([::1]:37292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQc0K-0008GI-Hj
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 16:59:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mQbyy-0006kv-Pa
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 16:58:16 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:34790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mQbyv-0005U4-0t
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 16:58:15 -0400
Received: by mail-qk1-x72c.google.com with SMTP id a66so5083218qkc.1
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 13:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ShgEHmB38y0/TC3f/A3ORO3pKSaLl3lYLY7Mc+AkT8w=;
 b=dWuo4fOoDR7yOPpYf8vHoEVHVns+DM4YaT82woqtM1EhLfUtvWohQu+8AwQ4grJOIP
 xFFSdFrYexMayt9LWxLbOY3hUfX9moP3DITiHyDLmmyE+F39QWfD36Yl1GxGgxiQGp7K
 tzVVhiPJDzlT6LCP2INxAfPIGAmftIbeYD5oLMsqP3XAlF30WmvlcGdGK8wsMnrrZObM
 xPlea1RIQQTEyeoNLgqFhtvMPM3QGn+50c6KCEo8q5hCZ/mhfBLSr8bezxsPncVBuLmk
 RUibCC+SffQUGA7BNurPloVRHy9i6osncm+rE3JGP+keM6SB/RpUoqxeRhBvMgTySRGM
 j1wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ShgEHmB38y0/TC3f/A3ORO3pKSaLl3lYLY7Mc+AkT8w=;
 b=xIPoYI3Hz5fzpHV+UZL1kEAP3ObaON8dgTb88HU0obDsuIS+/S2pmu9uFzf7YTVX4m
 FwMKp77qa7WZ/MVS3XPl9mDcv3IbP+K81mPeflNWE8OW53VWTG6+tIzNEhsQU9ill0Qu
 eC5Z6hr7QTv3nn1vnMGdaldAcn3ClbY1F/jjf1WDducETk/1ODVrLHRINTghhUKcdhyp
 hwsqwgZRALQJaAN9coYdxU8ClI/DC/Vk8RdeBpCtCWa5goPM6SJVoZ2Ww5eNWoTKW0C/
 9V5DJWuuKpwv3E7hkaImv/XGEf9zjh81g3Hio2kwEx7ylumtjxKse5MUNxRV+CrPIuqP
 /TZQ==
X-Gm-Message-State: AOAM530ftPtkWFNJKZqx3dioPNlAcKWrxhak5Nv1a128CBQQLQWWOsAl
 +179cC+E9OfkkEgj5ZrjjawMpQ==
X-Google-Smtp-Source: ABdhPJyZbC/GB93PFO5CKNzqrWLlf9DygPG9bhYle7QUSwZ30ykxkQF7ibaJAj9QzyAqRQ5eAPxwGQ==
X-Received: by 2002:a37:803:: with SMTP id 3mr1872521qki.127.1631739491669;
 Wed, 15 Sep 2021 13:58:11 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.googlemail.com with ESMTPSA id q22sm778080qtn.25.2021.09.15.13.58.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 13:58:10 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org
Subject: [PATCH] hw/intc: GIC maintenance interrupt not triggered
Date: Wed, 15 Sep 2021 16:58:09 -0400
Message-Id: <20210915205809.59068-1-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x72c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

During sbsa acs level 3 testing,it is seen that the GIC
maintenance interrupts are not triggered and the related test
cases failed.On debugging the cause,found that the value of
MISR register (from maintenance_interrupt_state()) was being
passed to qemu_set_irq() as level.Updated logic to set level
to 1 if any of the maintenance interrupt attributes are set.
Confirmed that the GIC maintanence interrupts are triggered and
sbsa acs test cases passed with this change.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
---
 hw/intc/arm_gicv3_cpuif.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 462a35f66e..34691d4fe2 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -418,7 +418,9 @@ static void gicv3_cpuif_virt_update(GICv3CPUState *cs)
     }
 
     if (cs->ich_hcr_el2 & ICH_HCR_EL2_EN) {
-        maintlevel = maintenance_interrupt_state(cs);
+        if (maintenance_interrupt_state(cs)) {
+            maintlevel = 1;
+        }
     }
 
     trace_gicv3_cpuif_virt_set_irqs(gicv3_redist_affid(cs), fiqlevel,
-- 
2.27.0


