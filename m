Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BF34F98A1
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 16:51:50 +0200 (CEST)
Received: from localhost ([::1]:58028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncpxl-0003Ec-E1
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 10:51:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPa-0007Kx-Os
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:30 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:36354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPX-0002T0-PB
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:30 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 i6-20020a1c3b06000000b0038e710da2dcso7685813wma.1
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 07:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LtZz4rR4JTiEt09cH5eXBwQY/mFcoau4efeuuU9fWxY=;
 b=IQ0AkNqGdxjR/lWNvljBqpTxtqpHNLVzTAA44jXIE74VUMSoHwm/2Irh6DYtgdOwhq
 aIcTotjRAflCsP4Cuycm1vlF4LPjQnjV6EpoYYXIasG/As2jjIsDvFyVRqNooaMnA/Bl
 OtQX0SPIc7nnxYtmZEWcmmANuhHbW++vRdlKU2HNtLxmRCb3h09VrCTIGBuWFWGeGmEC
 nrqTq0D0yUQvv5XkV0nMCuwa0q5Oe1ikibGvIgseWGFCyZORDRZP9BG2B6CzjqFcz7Du
 kulpemzrKOeQo3lzGswYo/ecJf7eMKs6nzhHaB0Yu0cC+jasH1MjSBXbChFcXNfed6uU
 872Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LtZz4rR4JTiEt09cH5eXBwQY/mFcoau4efeuuU9fWxY=;
 b=k2X1Mt2YwedF/MEpRqLnnYjEf8468Jef2JYFw9rxfqZF+KTzN6XfZhtynwguOPqhqJ
 yU8DqP/EQbnwIEKI0S69AG+rovdw6PpOcJdOxbew58mYABP0bcgdORXntLhZAODIuswN
 gVKqHlxUNDA4W8oA2VV4SPo2+XvW+7vOadK3SzkjOZyT5IQU1KGcqoQCFg9Nheb+g7aD
 +cmXGGcjQWaFSFA/PJabupaNcjXXCYhXGuspNmeE1DKAzhkLXh0fo5hJr6v9McR+Pczz
 Erakb3hqEvcM/yGZKpZNlbDTDHLm7yx2JIRo5WGMxCHUhWV8tac5LKQQeKzVBDg0GYot
 yNdQ==
X-Gm-Message-State: AOAM532G3gquogDOJP31YXWP/D70C8e+kzDYnviXT0KvtA/mFsUPjCzs
 MyUln9GL07UtgcGtm24l2n8/HmIrYwYwhA==
X-Google-Smtp-Source: ABdhPJxgMNxsLTK3OoCM7lvmmrc4MLYbFmkg/Oy1mP7q+5ByJtjbRLQr3n/052ud9FXTwvTaegroHQ==
X-Received: by 2002:a7b:cf10:0:b0:38e:6a68:98c3 with SMTP id
 l16-20020a7bcf10000000b0038e6a6898c3mr17264660wmg.156.1649427386366; 
 Fri, 08 Apr 2022 07:16:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i3-20020adffc03000000b0020616ee90dbsm11498849wrr.42.2022.04.08.07.16.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 07:16:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 36/41] hw/intc/arm_gicv3_redist: Implement
 gicv3_redist_inv_vlpi()
Date: Fri,  8 Apr 2022 15:15:45 +0100
Message-Id: <20220408141550.1271295-37-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408141550.1271295-1-peter.maydell@linaro.org>
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the function gicv3_redist_inv_vlpi(), which was previously
left as a stub.  This is the function that does the work of the INV
command for a virtual interrupt.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_redist.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index a586c9ef498..0738d3822d1 100644
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


