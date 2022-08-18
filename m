Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1645984FC
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 15:57:25 +0200 (CEST)
Received: from localhost ([::1]:39668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOg1U-0000Js-Jb
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 09:57:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oOfyi-0004aN-4b
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 09:54:32 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:33712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oOfyf-0002QM-8G
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 09:54:30 -0400
Received: by mail-wr1-x42b.google.com with SMTP id k9so1857513wri.0
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 06:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Ltb+NJhoIgMEPDlZ1x7AyzfdFhnHp9XW9U5V5+U+A1Q=;
 b=JObpoX0Y3Kug0QGnHDZsnKLCMdq/szECSkGMEguMXKw8ZPJyXKJOOe1SG0DKfN8/Os
 X9WkKt3jyDEP3+C+VOHO2DVA3FgwJO2mw1iZcYPssyiFKWjhwb/8JRgBLmiPW9LQwd4N
 PThNh+2k/aynqvYbMEBXYNQP6rg/y7Zux55nL/oOt9XoznIMv5+3hUbCIkoSDiyCZP3A
 fVk22+cJuSxQ7K0w/BS/KK9Sdd3Fm9wnYihoZ80Ul/gIGd75aMdn+mwV/QlkN7tstpqE
 nffnG4SalbL0Hi77zi8ryef7gieQmR6BlcUlZhn/+r0R6lZl1g2SP+FVScCvcpHBQhbR
 KeDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Ltb+NJhoIgMEPDlZ1x7AyzfdFhnHp9XW9U5V5+U+A1Q=;
 b=t7m4jx1pyvaP2gUrEYvUFHwSYPwxvodcLPFXGFHHBbul+KiwyMRzGjMBs8ljn/sLWK
 ppGlKIiYpY0Q6mkFblQwdjaco/MO4QgwbR2eTapY3SG4LzmJ47h/C17g/BaIBkPrUDYs
 8n4Xr0wQgzWADPp/5DFFCxrel7RK5VNy4k9CTX1T2WnGnXWEvoepFTNoBiRlRDLvqnnZ
 rgJ0w5YMMhed1E3u4gA+NMZCOmEzEazMBWptxbNlyr9q2agWpJKMDiCqm/I8itirPGgB
 +/5JmEAgrPLg82/HNyeLUPrPvMJbNrFLDHk6m7S6dT6BXgw9elpc/KEz/N9flxo1342e
 5tyg==
X-Gm-Message-State: ACgBeo2Cp/MyxtA2gpWwN/WlORtbNn3+n0fweGy3d0nPS8En81ortoXh
 qGJfw3SIRGLdjWX6tMLgoTgja2oF1jejuQ==
X-Google-Smtp-Source: AA6agR6gwqCGVH3EkoflvP9l/r4CKqjyW6cFkp2qhlr2GqrUrkiENpwlKGRUSiSKRSSOpzNaoZlPeg==
X-Received: by 2002:a5d:5550:0:b0:221:6d3a:1984 with SMTP id
 g16-20020a5d5550000000b002216d3a1984mr1713716wrw.326.1660830867732; 
 Thu, 18 Aug 2022 06:54:27 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d24-20020adfa358000000b0021ea1bcc300sm1624410wrb.56.2022.08.18.06.54.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 06:54:27 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v2 for-7.2 2/2] pci: Sanity check mask argument to
 pci_set_*_by_mask()
Date: Thu, 18 Aug 2022 14:54:21 +0100
Message-Id: <20220818135421.2515257-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220818135421.2515257-1-peter.maydell@linaro.org>
References: <20220818135421.2515257-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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

Coverity complains that in functions like pci_set_word_by_mask()
we might end up shifting by more than 31 bits. This is true,
but only if the caller passes in a zero mask. Help Coverity out
by asserting that the mask argument is valid.

Fixes: CID 1487168

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Note that only 1 of these 4 functions is used, and that only
in 2 places in the codebase. In both cases the mask argument
is a compile-time constant.
v1->v2 changes: remove unnecessary masking
---
 include/hw/pci/pci.h | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index c79144bc5ef..97937cc9221 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -688,7 +688,10 @@ static inline void
 pci_set_byte_by_mask(uint8_t *config, uint8_t mask, uint8_t reg)
 {
     uint8_t val = pci_get_byte(config);
-    uint8_t rval = reg << ctz32(mask);
+    uint8_t rval;
+
+    assert(mask);
+    rval = reg << ctz32(mask);
     pci_set_byte(config, (~mask & val) | (mask & rval));
 }
 
@@ -696,7 +699,10 @@ static inline void
 pci_set_word_by_mask(uint8_t *config, uint16_t mask, uint16_t reg)
 {
     uint16_t val = pci_get_word(config);
-    uint16_t rval = reg << ctz32(mask);
+    uint16_t rval;
+
+    assert(mask);
+    rval = reg << ctz32(mask);
     pci_set_word(config, (~mask & val) | (mask & rval));
 }
 
@@ -704,7 +710,10 @@ static inline void
 pci_set_long_by_mask(uint8_t *config, uint32_t mask, uint32_t reg)
 {
     uint32_t val = pci_get_long(config);
-    uint32_t rval = reg << ctz32(mask);
+    uint32_t rval;
+
+    assert(mask);
+    rval = reg << ctz32(mask);
     pci_set_long(config, (~mask & val) | (mask & rval));
 }
 
@@ -712,7 +721,10 @@ static inline void
 pci_set_quad_by_mask(uint8_t *config, uint64_t mask, uint64_t reg)
 {
     uint64_t val = pci_get_quad(config);
-    uint64_t rval = reg << ctz32(mask);
+    uint64_t rval;
+
+    assert(mask);
+    rval = reg << ctz32(mask);
     pci_set_quad(config, (~mask & val) | (mask & rval));
 }
 
-- 
2.25.1


