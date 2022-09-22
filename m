Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF86A5E6A23
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 19:59:36 +0200 (CEST)
Received: from localhost ([::1]:46512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obQU3-0002gJ-Qs
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 13:59:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPBC-0002CN-7B
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:36:10 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:39871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPB8-0005S5-Ne
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:36:01 -0400
Received: by mail-wr1-x42f.google.com with SMTP id cc5so16440835wrb.6
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 09:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=325OKYY2nX8aI0G82FZc2RGAVSyYsN8rb3hEEYonRaA=;
 b=qTPOOld9YRvyrbeOp0FEA/UKgHmBt3i5wjTdpWupIXHKxxRHgyr188pcsSx48U9jRo
 VuWhWa6Cggzx+B0HoZiYAjDD0cHs+Zz6wx1M5KTMWiA98KB/0I4hK1NXptB6kXsY8N7L
 Y6FheLy9UiFL56CuUfDNuQsRdpydlQ/j4Qj0pMnHyK1DS2WX0qRe/PZU6Pa7XYIEjU3R
 wv9o/UrnaczpWKxVLM5nTZv46+z6zz/ZFPVU2WD9ybHmEwyWjC8aCUyRZcvtAyHUHIHJ
 I267nmpYG7Yx8Chl0ySNHgjEoH3ZX+gpuxS9yug9aAiuUmeiNSxi3bHvEjQHfpLkbRc2
 HrEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=325OKYY2nX8aI0G82FZc2RGAVSyYsN8rb3hEEYonRaA=;
 b=s78h5LWlYDzUnhDg+wW+4hjSCBBkweSimJ+OqaOh1L8ET1xENf/IF+6+H0xx0wLBWH
 4V8XqG2rxxipTNqBYCazkmRLJoJEd8dtG4dxnzJv4sSwkEGrIwmg3daP6mwR0Emta+zo
 P++QjimuQcpJt5vK5g/FJizh4Tu5toun5t2+MbYneIDmo9ItPxFnBYr126iduT/5cYGV
 E6/lvbUK+1I0S5+LZGR2tl2z8Ex0/3rPNt1Tl8e6zB3cER28SLttg5Jh9bJ9Pz8YBjW0
 EEjngwb+jGIeL8VEGwyAwlCCPxFI7/mqCzoIZE99PItbQNosL4bdD92711scU3nQzkTb
 5q1g==
X-Gm-Message-State: ACrzQf2pAb+Vw1KjF1dVp5V5YWhoAhyHSV3Ol0zEkAXLzLUe79wYMv5r
 eGHvkrhdsTaLswx1GScXybWYViOg4kekyg==
X-Google-Smtp-Source: AMsMyM6dT5ZlsM4C+/c6ye+RwBVB8dtfZS+3V/P0ScQiaHx5NynpyITqujfVM8GwvzNyGussMX0EtQ==
X-Received: by 2002:a5d:598c:0:b0:22b:100f:c2e0 with SMTP id
 n12-20020a5d598c000000b0022b100fc2e0mr2588405wri.702.1663864556665; 
 Thu, 22 Sep 2022 09:35:56 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 iw1-20020a05600c54c100b003b3401f1e24sm6452599wmb.28.2022.09.22.09.35.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 09:35:56 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 28/39] hw/intc/xics: Avoid dynamic stack allocation
Date: Thu, 22 Sep 2022 17:35:25 +0100
Message-Id: <20220922163536.1096175-29-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220922163536.1096175-1-peter.maydell@linaro.org>
References: <20220922163536.1096175-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Use autofree heap allocation instead of variable-length
array on the stack.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220819153931.3147384-8-peter.maydell@linaro.org
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


