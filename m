Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DDF375BF3
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 21:48:17 +0200 (CEST)
Received: from localhost ([::1]:40534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lejyq-00034H-T4
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 15:48:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lejun-0001YG-EE
 for qemu-devel@nongnu.org; Thu, 06 May 2021 15:44:05 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:35688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lejuk-0005z2-64
 for qemu-devel@nongnu.org; Thu, 06 May 2021 15:44:05 -0400
Received: by mail-wr1-x433.google.com with SMTP id a4so6837476wrr.2
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 12:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OFgBiUo4F0PdQXdwF4FguM9p8gImFy47B+ViKzYfDOw=;
 b=Fmj/fmExCSwa1PjNm5T3lTu02+F3bx4cFv8llmpTK3TjD5iWtDM6sfHID1yzhbYLCB
 Lfci3ScrYV4ZfGP54PC6S/5M8km4ixaJ14fpzL4Dun5GhmWspE68TOhce05uMwo/eajC
 apk+CNyvsntYD1Z/6+dTZyNhHLSiba6PpbJGDWMuRHkkjzkmeZ7ygm1LVHS6T0oYEj5B
 qtKaBvn3MtsgXGrKc3EhnUd6AFxauyai3LZlF05EhcF8uK5b6wXPmkUjpyvRDuElFzi/
 KBWAyZfaBUXW7ibCo5dbCTWTH459TWUl6NVMepfZtfsWM6q4hUMSHIezbOHvQSr26e8K
 pe3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OFgBiUo4F0PdQXdwF4FguM9p8gImFy47B+ViKzYfDOw=;
 b=B9B6HsLI/p+F1I4cPIPiyqPLz3fzI0kY2M8YknYUpRRPCNhvyG2XyxRQxxPLTgdcfA
 uE+uaj8n5dWNmQYKMd5PISeg1z3dddG4FYIWrRa96lLoJGMq+QH4GF2YsCpNes2EHRRJ
 ckwPuhVTYpZ1cgocnzL54CNOlaxRr5PZFGmJDRCC1SaEUcxz0oiyXKhkArGn8VRhQfkA
 11TrY1SsNz9G86F9wRmGQ/GKm8AxCTxLhZ72wTQkhIHsaoBHCYlM91PBNiV4CRg3LcS9
 WWd+p/1moyFrfD8sspxUEDho07SlybBebnHfvRa0vrdQvtarauZdl1r5uIC2HpZhz1cL
 xCyQ==
X-Gm-Message-State: AOAM532MDg/SGAPKnC52BmrNq6fjicpkzr0ioz5PaGtj2DYmZPz4Efp8
 HnvdzEVPgTsra8fzU1KRXnbRdoG5mOG7nQ==
X-Google-Smtp-Source: ABdhPJzhpdG6OqOpFQ3Y6yuQQXGm8gF32/0pZ8rPpw4s5Y8LKX2q2UIu9RmnmMdTRxkWZu61JLghZQ==
X-Received: by 2002:adf:f3cd:: with SMTP id g13mr289772wrp.94.1620330240450;
 Thu, 06 May 2021 12:44:00 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g25sm10917497wmk.43.2021.05.06.12.43.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 12:44:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/qtest/ahci-test.c: Calculate iso_size with 64-bit
 arithmetic
Date: Thu,  6 May 2021 20:43:58 +0100
Message-Id: <20210506194358.3925-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Coverity notes that when calculating the 64-bit iso_size value in
ahci_test_cdrom() we actually only do it with 32-bit arithmetic.
This doesn't matter for the current test code because nsectors is
always small; but adding the cast avoids the coverity complaints.

Fixes: Coverity CID 1432343
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/qtest/ahci-test.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/ahci-test.c b/tests/qtest/ahci-test.c
index 5e1954852e7..8073ccc2052 100644
--- a/tests/qtest/ahci-test.c
+++ b/tests/qtest/ahci-test.c
@@ -1491,14 +1491,14 @@ static void ahci_test_cdrom(int nsectors, bool dma, uint8_t cmd,
     char *iso;
     int fd;
     AHCIOpts opts = {
-        .size = (ATAPI_SECTOR_SIZE * nsectors),
+        .size = ((uint64_t)ATAPI_SECTOR_SIZE * nsectors),
         .atapi = true,
         .atapi_dma = dma,
         .post_cb = ahci_cb_cmp_buff,
         .set_bcl = override_bcl,
         .bcl = bcl,
     };
-    uint64_t iso_size = ATAPI_SECTOR_SIZE * (nsectors + 1);
+    uint64_t iso_size = (uint64_t)ATAPI_SECTOR_SIZE * (nsectors + 1);
 
     /* Prepare ISO and fill 'tx' buffer */
     fd = prepare_iso(iso_size, &tx, &iso);
-- 
2.20.1


