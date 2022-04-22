Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9347050B5CA
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 12:58:47 +0200 (CEST)
Received: from localhost ([::1]:57130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhqzu-0003mJ-Dp
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 06:58:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqA3-0004yM-CX
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:11 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:43565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqA1-0002rG-EU
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:11 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 n40-20020a05600c3ba800b0038ff1939b16so5090734wms.2
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 03:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=mPgmj5RVzDAw4cIOgcMQ1RCLJRgE1k4EGIsJB8ypEvA=;
 b=zGETRI5Op4KYHdCpVfyRZKvL0y/ysalWTYXUnBesVAZnDnbGxiDGetBEcLS8RS6CZ/
 6fA2OwD+hFKA9cXmmFJcwxrN9xVXQ27NyL2W1qbVvpstF+9v1ASmGPYzrMAFXP28M4Ex
 dEeCt09fOgb+56H1bmYqGNGrKIqIVp2Em4LhABYzonurzfXUTVZIqxtL6YzeST6r7FtM
 467toEYyWietXnpKXt4aS2YqSaokv+z0TVhuVWNkV+M9yfHl8oS9GwpZyWZQSUSL9KQp
 RQS1oeN++MxNxpNHurJ3Z6Zdv04IrNR7fycK8RHotKnMdBII/Z7m0OML/2J0oZ2a3pOo
 H7Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mPgmj5RVzDAw4cIOgcMQ1RCLJRgE1k4EGIsJB8ypEvA=;
 b=DxSIrajKLicntvy8Z+f5E3uF1tR/8lfESUNhzf3lyv4ACG+CABJ/v9sJ8V731/bgRj
 g1oU+sS292G4n8QL/CeD5lrsiRPKFfKZrbdS+3JaOrVDd+VjRAW1yZG2CmfvQiqldHlc
 39YHxKhRK8OGzaeHT0mHmgY5HEFpnvvVnZfIVRc+GHm3LgipH01Dp5ym5W5oo+5DyJk0
 g2vcNg3iu7P1sY5CDnW2XfsdRwQCJRcFsl5tYa6FHkH1T895SIyNJ0wOhRd6uWpNRFZ4
 5djlGnT68kuO/HXDYG4AoV6x8XBK9GfS5miXW6i+qCZRD1L8I6Cc/Ze9paIGtatMLKd/
 +gVA==
X-Gm-Message-State: AOAM531Z6m9V4J0tN6qOIw2swE/7LMn7Ymnx0ThqQJW3TXWWwdB0mFOt
 I5IT6X4SHGH0oaTgYMP4ue/8TXphptQyOg==
X-Google-Smtp-Source: ABdhPJy8HlS7EGg1ET/802u7hMsbLTEbt3DU7WxBi5IxxSVKOHyVuweK0HYW4b8mXPXT/puyIgRAyw==
X-Received: by 2002:a05:600c:4ecc:b0:392:938a:d85 with SMTP id
 g12-20020a05600c4ecc00b00392938a0d85mr12352783wmq.165.1650621907872; 
 Fri, 22 Apr 2022 03:05:07 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b0038ed449cbdbsm4312148wmh.3.2022.04.22.03.05.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 03:05:07 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 36/61] hw/intc/arm_gicv3_redist: Implement
 gicv3_redist_inv_vlpi()
Date: Fri, 22 Apr 2022 11:04:07 +0100
Message-Id: <20220422100432.2288247-37-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422100432.2288247-1-peter.maydell@linaro.org>
References: <20220422100432.2288247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Implement the function gicv3_redist_inv_vlpi(), which was previously
left as a stub.  This is the function that does the work of the INV
command for a virtual interrupt.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220408141550.1271295-37-peter.maydell@linaro.org
---
 hw/intc/arm_gicv3_redist.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index 34f4308e980..bcb54bef76e 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -1102,9 +1102,12 @@ void gicv3_redist_vinvall(GICv3CPUState *cs, uint64_t vptaddr)
 void gicv3_redist_inv_vlpi(GICv3CPUState *cs, int irq, uint64_t vptaddr)
 {
     /*
-     * The redistributor handling for invalidating cached information
-     * about a VLPI will be added in a subsequent commit.
+     * The only cached information for LPIs we have is the HPPLPI.
+     * We could be cleverer about identifying when we don't need
+     * to do a full rescan of the pending table, but until we find
+     * this is a performance issue, just always recalculate.
      */
+    gicv3_redist_vinvall(cs, vptaddr);
 }
 
 void gicv3_redist_set_irq(GICv3CPUState *cs, int irq, int level)
-- 
2.25.1


