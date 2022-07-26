Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 730FC581847
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 19:22:28 +0200 (CEST)
Received: from localhost ([::1]:57124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGOGJ-0008DM-Bq
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 13:22:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oGNTi-0005aD-68
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:32:14 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:50706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oGNTg-0000wl-Ff
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:32:13 -0400
Received: by mail-wm1-x32e.google.com with SMTP id v5so9081356wmj.0
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 09:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JfWxJ00rIlfds3jFPlwG4e1sYuE0E+4UdrBr43y55Zw=;
 b=dr+20bMl0Nm2uwaBpL/mYr+RelGqMIImKVYpfQcvtYSIh1E7eLcdJTG+WgKrAV6CQb
 GgQ1hJBwVrqZVGkD0xS4sCqgTisOsUvamJytTdP9m1fcQqRHBifWRutaeRnVJPAmS1UR
 J+luhHQpLcwncsGvzvCk0lwiKGDI3ENyB9qhesPdyCbN3UVNeXHQh1NE0ze63tw84dGL
 EHG6l5bxrKBLX/5u8BRvzuMwFVr+ZuEfXV2sR6h785OMx3P61mWSDelxdhUg7hrAB7vh
 iFuYIptF4wCkAZmf0OkA/nMgk+w/4zSJO0t43o+YdK4Uq0mflksvhDqdvSdeNYZ3IvFv
 tDhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JfWxJ00rIlfds3jFPlwG4e1sYuE0E+4UdrBr43y55Zw=;
 b=AhKT6XAK5vspyd8HlsRNM5IgtesMS4LLuN9t/hr2OtJgjXt0BdqFMGd6PsNRD5M81N
 3U5bw1vcacjOIR4TaLl+2y3pWm/ya8ZrtYanrpFdYwR+f9IDBiutX1SaM3JeHYATmE4C
 pjDJA1qoxdCF+tdUiSJS5ZSHURyEgadEbkl2aomepYV2puqc9RppJ6EQUMhBCfd/+XCz
 3IkhvDXXGdU1ErQJF9QRFtCrc3NA5nG861bGjN1YwClbHIZ+TDAyGodQjXktYgvd/bbn
 Sbe7aQGYm8iws7gt2wFzpqYpwiP5FUylpRu9GnSf1ybdV7EPSZt7pYPWUp9ZhUFsgh+x
 MKuA==
X-Gm-Message-State: AJIora9NIoL9Hw98U98b3GtNz7ScUt/QUyssMiIHzEJLHlgRQl6B6/VL
 f6ZhjVZiapfq2ALk16imQC1AjEvk1CfKRg==
X-Google-Smtp-Source: AGRyM1vkaSu8aLfGD+Fv9wRZZ0rcvUa4lvb22O6bE2i7rBvpC3eU3gWIrsO8y6rrSVY93RkipyUtdw==
X-Received: by 2002:a05:600c:1552:b0:3a3:2e4c:bd0a with SMTP id
 f18-20020a05600c155200b003a32e4cbd0amr34297wmg.82.1658853130846; 
 Tue, 26 Jul 2022 09:32:10 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d14-20020a05600c34ce00b0039747cf8354sm19236198wmq.39.2022.07.26.09.32.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 09:32:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH 2/2] pci: Sanity check mask argument to pci_set_*_by_mask()
Date: Tue, 26 Jul 2022 17:32:06 +0100
Message-Id: <20220726163206.1780707-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220726163206.1780707-1-peter.maydell@linaro.org>
References: <20220726163206.1780707-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Note that only 1 of these 4 functions is used, and that only
in 2 places in the codebase. In both cases the mask argument
is a compile-time constant.
---
 include/hw/pci/pci.h | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index c79144bc5ef..0392b947b8b 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -688,7 +688,10 @@ static inline void
 pci_set_byte_by_mask(uint8_t *config, uint8_t mask, uint8_t reg)
 {
     uint8_t val = pci_get_byte(config);
-    uint8_t rval = reg << ctz32(mask);
+    uint8_t rval;
+
+    assert(mask & 0xff);
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
+    assert(mask & 0xffff);
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


