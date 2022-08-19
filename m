Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E37B599EC7
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 17:48:02 +0200 (CEST)
Received: from localhost ([::1]:50956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP4E5-0003Re-KQ
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 11:48:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oP46D-0005lZ-Ih
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 11:39:53 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:39655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oP465-00064w-Bl
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 11:39:53 -0400
Received: by mail-wr1-x435.google.com with SMTP id r16so5619823wrm.6
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 08:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=MdveKL4MP90EdNQkpPRlvAKQ9ASmc2UjMbS6E+1HF1Q=;
 b=lihKwPGjA0DKnwXPdntU6GoO4IsgZ9k/4gQznM+g11xVB/9U9nbvIRDhzSaXbwnLY6
 CUc+J+ULKLAmRls3veAO+02/NAVJSc6efljwzsZ5bfTLYzB4BJ9f4GnUkadUf9UTf341
 AFiGAoBYxJXhTiXLFWaURNoDxffX9Dmyo23lSSSVN/Wm7uQ5dzMLew2qGJN1Ji5AK0uw
 EKtCH7aG2QI+CEEi3/AfFfTAgkRuiNHyvCwntiC3ENJfGT0AleM+ifLM7HzYxuQPwdAL
 D4ARWrj8jYXx+UOG2Bmn90vCyV7bHmCLBhpW0XGyxlAGfteANnv7c+ki/6iUtkKxkYXA
 rWQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=MdveKL4MP90EdNQkpPRlvAKQ9ASmc2UjMbS6E+1HF1Q=;
 b=Thbn5YsOkuiDJmr5JlTC1fXFcMcDFOB2dzwqRgdE8AaOhN+Z9W1bHpz5ZDu6yDs4mG
 9s7/SfvQHj+EOiFXYtgZ6gr7DJtpKkYouj2hir4iJkPaeWBwlEBIkzDn+3YQuN/oOa4V
 6d1Hsj8m9OYoCvfxumlLmdUvHJI3rRUb0pJiHkzgcrUWcFWuDF6wwz2bUGTxHU5v27vU
 Mccd1L7hOuELLnn79lr8P7L/Syzy7yBO4McUhBnFK/ee3pZE3Fbxlx8pLVp53xBFmwa2
 o7U4MKErivL3K3d3MA8Tn8ti5pEshz3fPq2QE6RDoAARdBJZDMFw3HNBmN+bi4d2OQpc
 KBQA==
X-Gm-Message-State: ACgBeo2rIY1L3zGR1UiV7abRTDtNxZ5B8xUukkmIRoyBIPnVokt78U4C
 nV2wzyBXhtFEz0u11irJfMAZ98A+K7ukMw==
X-Google-Smtp-Source: AA6agR4ev68+RW+xxmy99eXOV+AlqS6M1f/wmO9AecmbCxg3txCKqDiVxs4WXWzuDt4KpTTgrXXFjg==
X-Received: by 2002:a5d:4301:0:b0:21b:8af6:4a21 with SMTP id
 h1-20020a5d4301000000b0021b8af64a21mr4766102wrq.296.1660923583981; 
 Fri, 19 Aug 2022 08:39:43 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi13-20020a05600c3d8d00b003a54109a6a0sm5558396wmb.3.2022.08.19.08.39.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 08:39:43 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 07/11] hw/intc/xics: Avoid dynamic stack allocation
Date: Fri, 19 Aug 2022 16:39:27 +0100
Message-Id: <20220819153931.3147384-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220819153931.3147384-1-peter.maydell@linaro.org>
References: <20220819153931.3147384-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Use autofree heap allocation instead of variable-length
array on the stack.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/xics.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/xics.c b/hw/intc/xics.c
index 5b0b4d96242..dcd021af668 100644
--- a/hw/intc/xics.c
+++ b/hw/intc/xics.c
@@ -567,8 +567,8 @@ static void ics_reset_irq(ICSIRQState *irq)
 static void ics_reset(DeviceState *dev)
 {
     ICSState *ics = ICS(dev);
+    g_autofree uint8_t *flags = g_malloc(ics->nr_irqs);
     int i;
-    uint8_t flags[ics->nr_irqs];
 
     for (i = 0; i < ics->nr_irqs; i++) {
         flags[i] = ics->irqs[i].flags;
-- 
2.25.1


