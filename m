Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF385F4A12
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 22:04:10 +0200 (CEST)
Received: from localhost ([::1]:60932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofo9A-0005aw-8J
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 16:04:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofnyC-0001hc-Sn
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 15:52:49 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:45940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofnyA-0000FQ-4s
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 15:52:48 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 o9-20020a17090a0a0900b0020ad4e758b3so3329753pjo.4
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 12:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=FcUiK2Okdru3cG4LiS1rgcAo1RAHSsbMmma9k9kUJWI=;
 b=kuBZvX5feW4t64zNS9h+KCca7LFoyZtDleefHmb3s5RqSF1SZPn8sdNGESf0hOfmF9
 KLsKEjnyF0FDmAL5S3TN5l91e+OgOnxO3m5o+GPC+gI0UM2fM6qoOYPuWGVvl5VnRlEj
 dxquTvo0ASip/L8XVHEkJiJYoS/Gi/LcAn8hm3kIQjFmOjonZfFVsJ83VAGO3f5qxODC
 rUmrGABrnrb4ToLS/bOh29YdZnCkp5VrBUNQFJhcWNyqK+lx6JYF+5IGVU1upDpMWnfv
 3P/nzn4eLw2sRfTG39Fiz4tHKp9+LowQ3Rkg4+orsllwxXQMmNXlWOSw383l0wLjoa8m
 Smxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=FcUiK2Okdru3cG4LiS1rgcAo1RAHSsbMmma9k9kUJWI=;
 b=OjAs34NpBOY2pJ2mqmuIgTZLrM9jW7p/4/rA/0wEbojQMPWEzY8/F1BA1ZxHiVVPcU
 7yNp9JckJudXFiINmUd7hxsoDl+HrHaYJN2utiqMQoQ2JrN/CzgiXGT+EoRP9T/Rba9Q
 XVZpBR+LkQuuYGwlJUEYcm6UR2lpnkZI0l03uqER6mAe6SSDpe/R32xUcNvsey+1UYBY
 5PlhrkLMvVw6z2MFn7cMUNbfe6YhB79KtDAZSHnhN+xO2zLxna4JL4qKvx53D2GgO3dX
 SBKdkv8UF35lUTJg+yZlflHPLp1S8vWFCrN/RQjCXaoB2RsUqAL4qnNYyKAUcv0AkRPv
 HJIw==
X-Gm-Message-State: ACrzQf0zsqXmFT/JbSu/A3bPcGfVsTcEKAkYH2wl0swWKrCSOkmhCV2r
 2qrrFLoOk8XdLDwigA7Mmdo7pmDfBA8hvg==
X-Google-Smtp-Source: AMsMyM5rOV7t9AKsgCY6qmS01tmPsH5/tIG/c9l+OED8WlrvMC5qUXLWPyEvbZP+TgNFkQUreRO0qg==
X-Received: by 2002:a17:902:7b95:b0:178:ab50:76b5 with SMTP id
 w21-20020a1709027b9500b00178ab5076b5mr28864247pll.161.1664913164593; 
 Tue, 04 Oct 2022 12:52:44 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:526e:3326:a84e:e5e3])
 by smtp.gmail.com with ESMTPSA id
 u23-20020a1709026e1700b00172973d3cd9sm9293406plk.55.2022.10.04.12.52.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 12:52:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 02/20] hw/core/cpu-sysemu: used cached class in
 cpu_asidx_from_attrs
Date: Tue,  4 Oct 2022 12:52:23 -0700
Message-Id: <20221004195241.46491-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004195241.46491-1-richard.henderson@linaro.org>
References: <20221004195241.46491-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Alex Bennée <alex.bennee@linaro.org>

This is a heavily used function so lets avoid the cost of
CPU_GET_CLASS. On the romulus-bmc run it has a modest effect:

  Before: 36.812 s ±  0.506 s
  After:  35.912 s ±  0.168 s

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220811151413.3350684-4-alex.bennee@linaro.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220923084803.498337-4-clg@kaod.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/core/cpu-sysemu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/core/cpu-sysemu.c b/hw/core/cpu-sysemu.c
index 00253f8929..5eaf2e79e6 100644
--- a/hw/core/cpu-sysemu.c
+++ b/hw/core/cpu-sysemu.c
@@ -69,11 +69,10 @@ hwaddr cpu_get_phys_page_debug(CPUState *cpu, vaddr addr)
 
 int cpu_asidx_from_attrs(CPUState *cpu, MemTxAttrs attrs)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
     int ret = 0;
 
-    if (cc->sysemu_ops->asidx_from_attrs) {
-        ret = cc->sysemu_ops->asidx_from_attrs(cpu, attrs);
+    if (cpu->cc->sysemu_ops->asidx_from_attrs) {
+        ret = cpu->cc->sysemu_ops->asidx_from_attrs(cpu, attrs);
         assert(ret < cpu->num_ases && ret >= 0);
     }
     return ret;
-- 
2.34.1


