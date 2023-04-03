Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 817C46D4D08
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 18:03:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjMcl-00059U-AO; Mon, 03 Apr 2023 12:01:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjMcX-00055R-U7
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 12:01:25 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjMcU-0002BX-Gq
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 12:01:24 -0400
Received: by mail-wr1-x42f.google.com with SMTP id m2so29891628wrh.6
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 09:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680537681;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=V/wpFoRtLBHl9IngzkoD10ivVrKdxV4x7qoi+Upw/so=;
 b=HtbRkW21a7zfV7ELZNgGd5IQ/ZL/bdRZBqsompvJMKp/Sf4tiPzXzz31OAGoxmdBRF
 14mhAHYIj0V7WvixvaGjBalgooKBJcVieG2Zml/AeTeXPZwI9tcpp/5GqNZVuQsvhJFk
 69Xbc5DcAsbD9ZPQz/feKXpa3hKgO7knmr6Q7gmROpAnn4zGyZm2uLKRvaoapwhlXycW
 gVattwbREYY9qipBBGhGd6eSoDrRwfPtF5k+mlm2xtexz+l7SMuSrCtRquzOtKkYh0dv
 TZTwYIh5NeWjyOtKb/zxDOGlZNC/306mIHS68maNFVUwnwZ2qcoAbKb+4UvB/+m0tyqq
 7BDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680537681;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V/wpFoRtLBHl9IngzkoD10ivVrKdxV4x7qoi+Upw/so=;
 b=qlnIafhHdMEbkibCcOSpIWJbFRFbU7HY9TAd/GUcVjGpF+mKws6CHjZeyisAJB6wPh
 YWsve2JO8mWCvrGAJ6HqQ4Ah4iDT7uP1ylDpVycMb8IurpgutTyxN+k3XoWLRntX5SxM
 IsJKJ5TYUnj+2KtwRZPSYpC58KXdyDW5k6DM6qczUy4jtArNeM/smLZxgvb2iCYMINPS
 D1/lKnLl35V5ZkOR+CDBAvvKmeAAdR6Up0zQl0PuqjHmvtlR4cr3iAu9lc7ro3rJ4M1u
 fL4HWcddPwaJoBEsPxNOIWYj+Ky12L8ajh6vcVPPEy2VcWZQd3a1KWzi5lpzRme8jmV/
 XIqg==
X-Gm-Message-State: AAQBX9cWYbiXaWFw8dvHEUUkXlSY6DxxdxV5cSfnwzD4MWJXy+LGsQWf
 5nA9tmUeaHGmhH6amQsgtB+Y0ToelDPZ+Wx9bzk=
X-Google-Smtp-Source: AKy350brUm7g1lvw5FDYGQykiasPe3zhuxW1eRMiIZpXziz1GEE1IyCjo8XtTa5rlVYLhBy+tArERQ==
X-Received: by 2002:a5d:6ac8:0:b0:2e4:cc1c:102c with SMTP id
 u8-20020a5d6ac8000000b002e4cc1c102cmr12430466wrw.48.1680537681185; 
 Mon, 03 Apr 2023 09:01:21 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a5d68c1000000b002c59f18674asm10088668wrw.22.2023.04.03.09.01.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 09:01:20 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 4/4] hw/ssi: Fix Linux driver init issue with xilinx_spi
Date: Mon,  3 Apr 2023 17:01:17 +0100
Message-Id: <20230403160117.3034102-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230403160117.3034102-1-peter.maydell@linaro.org>
References: <20230403160117.3034102-1-peter.maydell@linaro.org>
MIME-Version: 1.0
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Chris Rauer <crauer@google.com>

The problem is that the Linux driver expects the master transaction inhibit
bit(R_SPICR_MTI) to be set during driver initialization so that it can
detect the fifo size but QEMU defaults it to zero out of reset.  The
datasheet indicates this bit is active on reset.

See page 25, SPI Control Register section:
https://www.xilinx.com/content/dam/xilinx/support/documents/ip_documentation/axi_quad_spi/v3_2/pg153-axi-quad-spi.pdf

Signed-off-by: Chris Rauer <crauer@google.com>
Message-id: 20230323182811.2641044-1-crauer@google.com
Reviewed-by: Edgar E. Iglesias <edgar@zeroasic.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/ssi/xilinx_spi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/ssi/xilinx_spi.c b/hw/ssi/xilinx_spi.c
index 552927622f4..d4de2e7aabc 100644
--- a/hw/ssi/xilinx_spi.c
+++ b/hw/ssi/xilinx_spi.c
@@ -156,6 +156,7 @@ static void xlx_spi_do_reset(XilinxSPI *s)
     txfifo_reset(s);
 
     s->regs[R_SPISSR] = ~0;
+    s->regs[R_SPICR] = R_SPICR_MTI;
     xlx_spi_update_irq(s);
     xlx_spi_update_cs(s);
 }
-- 
2.34.1


