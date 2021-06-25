Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE983B426C
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 13:21:47 +0200 (CEST)
Received: from localhost ([::1]:60848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwju0-0002Tn-O4
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 07:21:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1lwjrR-0007eT-3x
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 07:19:01 -0400
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233]:41582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1lwjrP-0004XD-7d
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 07:19:00 -0400
Received: by mail-lj1-x233.google.com with SMTP id z22so12000825ljh.8
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 04:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=U8+L0pfEA+Z4ZeIBlM5nqpsz15izDVESlVEK+IwSfIk=;
 b=OnyXBT2U0+l9H+w23kt6XivRAnbG60JM0jhY/RvlDiaksGrDcQv+wYaRMqNvGJkoL3
 hg7RGQV/VU+KBCQF+ypgEgvl63TkAta9iWNA5rg+cH4LbAF2R0hl2lqpfrW0Os8ZbvAF
 teYgeG1+5jkhPNLSLQ8QZuV7R6gAYRtBD9fAkxuS47j9c7KOR9fLCzfuIRBKqr8RgFei
 3zyLxrTF8ocUugS0R4wpv8TfA5NqmXI/BnSLfEwuY7/hCJVuyDo5dlNP8SxUhsPFmQLn
 zUgc84OUZc6WBLgoLOlV3Y/d2r2BBDq/tnrIJFLUVly82Pr5nJKep53t5SuH4IFzQ0Dz
 YK8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=U8+L0pfEA+Z4ZeIBlM5nqpsz15izDVESlVEK+IwSfIk=;
 b=V3GlAqc2PN89b3m3KzUN9oP02TltGNGVBCvTpTVeH4NQqARb7QFIJ/xpbCFz+5gtuQ
 B3RDPVnJ/jla5Nt6XXqEUIv1w65te/1KeI0SAkxnGFO5x4mcyzdPx1qmXOiIGW4v3YGe
 18NLPqZ6+k5nG/YSPKmb42x/TCRLkGDkeHyWaI1XT9xAokc7IwfXAouJuNOA8EfL2yP1
 PITGDcDyksNGaNkA0g25tB3LC6CcaH/uXx9AsSwntSwEJ5kf7VvKzdA3gojNBFw3Lj6n
 D5QIt22m/wl2Q7Tkp4/7AG6EPvjlJSjeB494lSaj949ZtsG9dSg76tia3XubB/eQtSAf
 ZU9Q==
X-Gm-Message-State: AOAM530fcm24uQey3WkBBGht04D0oL7QZ9iVZNVGPeMiICzgcjM3fmkc
 az5JBKW2+vjs9A87i19wc0qpUrhklpz7pA==
X-Google-Smtp-Source: ABdhPJwwoxDNpAIP3VActacGrNqLP7nP0ZYaqhRZY0eFJHPpUtkxbzEaIFXpHB1JmTZwh4+vGHxc2A==
X-Received: by 2002:a2e:22c6:: with SMTP id i189mr8075185lji.97.1624619937523; 
 Fri, 25 Jun 2021 04:18:57 -0700 (PDT)
Received: from localhost.localdomain ([91.193.178.173])
 by smtp.gmail.com with ESMTPSA id p19sm536354lfd.70.2021.06.25.04.18.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 04:18:56 -0700 (PDT)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] gpio_pwr: use shutdown function for reboot
Date: Fri, 25 Jun 2021 14:18:42 +0300
Message-Id: <20210625111842.3790-3-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210625111842.3790-1-maxim.uvarov@linaro.org>
References: <20210625111842.3790-1-maxim.uvarov@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=maxim.uvarov@linaro.org; helo=mail-lj1-x233.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
 Maxim Uvarov <maxim.uvarov@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu has 2 type of functions: shutdown and reboot. Shutdown
function has to be used for machine shutdown.

Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
---
 hw/gpio/gpio_pwr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/gpio/gpio_pwr.c b/hw/gpio/gpio_pwr.c
index 7714fa0dc4..dbaf1c70c8 100644
--- a/hw/gpio/gpio_pwr.c
+++ b/hw/gpio/gpio_pwr.c
@@ -43,7 +43,7 @@ static void gpio_pwr_reset(void *opaque, int n, int level)
 static void gpio_pwr_shutdown(void *opaque, int n, int level)
 {
     if (level) {
-        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
     }
 }
 
-- 
2.17.1


