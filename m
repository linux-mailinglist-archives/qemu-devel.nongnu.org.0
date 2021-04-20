Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFC23658FE
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 14:33:44 +0200 (CEST)
Received: from localhost ([::1]:39528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYpZX-00012g-9E
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 08:33:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYpX9-0008J3-0i
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 08:31:15 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:44560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYpX4-00033p-E2
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 08:31:14 -0400
Received: by mail-wr1-x42b.google.com with SMTP id e7so28456300wrs.11
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 05:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c2oZS2Tl5B0ndAM3GGIWJ8vO0djFNZfzyu4Gas/2FyI=;
 b=S2umNBC9XacFHKm3V3QsrbOwdrXbwufgH6PBgmH3MRHgq2NLm5aXb9FhRrxa1RasYJ
 T5myZ3lkrkIeiR+4agRm2MGorFptbHIbl0Apcb21ovua4pZQqRkMbJvqDXPNiYuy+C9Z
 CTT4W7qJ73hpkevdgExb7PtY964fB3+Y7chd/bfZIJhuiExtYZFYKc37FMT+glcB2h+W
 xKarRFj8/NhSdH6aRDZMN5kKMW5B4nZC8IZ6b4PpyOC3gthn9M+nUuHtU035yIMZ0rZM
 HCI5nzDSFQ0VAWk0wjuhJeaRiksBNJTEC00hcHU/EQAheROEbHKAziNEGOy4mwUT8Q7G
 jylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c2oZS2Tl5B0ndAM3GGIWJ8vO0djFNZfzyu4Gas/2FyI=;
 b=qk+zWu6SDusmmyxlOWHOlfRSf9lHqHtQRhiRwDDGX+JJqTWK9iRULi4vK95QmiAGLi
 en/0QnbEiL2vAN4Y7oe0+yBQcBq86SWcOnTD9nwrlJoCTJrT5p6dda7be9G2Rkd5qsK1
 wjhV2AEmRDdkyMCClY6R9iSJQyQd2IPK5GDm6OJcb8/f6Fu8Poq/OlOLX1GMM+f5BE/X
 ubdQim7/zf6rzYHPPtYlTOnI8exfCJE5MIgwljZ9OFRNjO2PxiXtVSZ1VnDIAtNzhedB
 ZP4pfhuw9v4m1A7FSvZCGpcV8Xhgy/mrMMvhyfyLC+WbQy3YgN9MrCdOfEs/zXGt5LjN
 rFFw==
X-Gm-Message-State: AOAM533XGNiKLAwU2JwVl8+JC5R/U6g2cnBc3LBec/w2WiDsDbL+d3rc
 lqsKN93ufByYUScMZYGbKSku7A==
X-Google-Smtp-Source: ABdhPJyUwL/mfcvEFqPfuBp4tpLt/cFpk2uyYEKcBwIf0jg1gUdtxFYGjvrdCSxLhTGm/01DZoeCSg==
X-Received: by 2002:adf:f106:: with SMTP id r6mr20082012wro.214.1618921868757; 
 Tue, 20 Apr 2021 05:31:08 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a15sm26647252wrr.53.2021.04.20.05.31.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 05:31:08 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Flush correct TLBs in tlbi_aa64_vae2is_write()
Date: Tue, 20 Apr 2021 13:31:06 +0100
Message-Id: <20210420123106.10861-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: Rebecca Cran <rebecca@nuviainc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In tlbi_aa64_vae2is_write() the calculation
  bits = tlbbits_for_regime(env, secure ? ARMMMUIdx_E2 : ARMMMUIdx_SE2,
                            pageaddr)

has the two arms of the ?: expression reversed. Fix the bug.

Fixes: b6ad6062f1e5
Reported-by: Rebecca Cran <rebecca@nuviainc.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index d9220be7c5a..957f4247010 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4742,7 +4742,7 @@ static void tlbi_aa64_vae2is_write(CPUARMState *env, const ARMCPRegInfo *ri,
     uint64_t pageaddr = sextract64(value << 12, 0, 56);
     bool secure = arm_is_secure_below_el3(env);
     int mask = secure ? ARMMMUIdxBit_SE2 : ARMMMUIdxBit_E2;
-    int bits = tlbbits_for_regime(env, secure ? ARMMMUIdx_E2 : ARMMMUIdx_SE2,
+    int bits = tlbbits_for_regime(env, secure ? ARMMMUIdx_SE2 : ARMMMUIdx_E2,
                                   pageaddr);
 
     tlb_flush_page_bits_by_mmuidx_all_cpus_synced(cs, pageaddr, mask, bits);
-- 
2.20.1


