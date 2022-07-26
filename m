Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5AA581823
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 19:11:45 +0200 (CEST)
Received: from localhost ([::1]:39410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGO5w-00053V-AV
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 13:11:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oGNTh-0005Ze-Vk
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:32:14 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:50705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oGNTg-0000wh-4C
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:32:13 -0400
Received: by mail-wm1-x32d.google.com with SMTP id v5so9081329wmj.0
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 09:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CGvQiIFMlOrrEaULg5rsrG44DygaTz/1MqDAYgHgSEU=;
 b=CoaMQLm/OvWyCUfVMtf0WR5Vl2S+Lk2y4ZBokdaTX9D5BQ5Y030knTcFSVvuy/mPA4
 3L3Eo3CAPhfzQdFyJoSUQULbZ/UtqYfS3gr72W7mTTWkBsgCNn8rbTLvrmb3bknxibJJ
 vJA2o/dZsU5ECeEQwCFXoWBkP/9jKObxUR4YQ2ZKfZxQOfFCDKT8zdugmBxPA2rtY+d0
 eafndM65klFuyA8LE94mr+O2Gdox+AaHBgJC5lxGt9gpfDPbbLkJH60lvANZfw9qIs9l
 9tGzvqBqbyD+H9w/ZIVEvjMeTpd5TYHK8YAATAV+iwKAdJwVYcGWoko477MnalMIzYWz
 PHew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CGvQiIFMlOrrEaULg5rsrG44DygaTz/1MqDAYgHgSEU=;
 b=ydZtGFvtIlp3NdROA500sEeDKGVoo7acB/jpjRkpqp2RxYufNVAvVIL2Ull/D+UR0e
 dktvpLl0gIT7GLera8MtmUViPJVtBYnGka2v7SFsQsMExptNzDoFHwJM6YVQhqY7U042
 qwRndnd7c4lSI1sJFmjgdv2c+rX27kgPmCFzc28ONV7XA3S3tC8F0AFW/HuynRwTEOyN
 rvfhBot3F337YvI8EXHb8ZRo4nTCZmIPJUbLwdjrH6pPBzDMUJ5YTuaSSEJjq35ig9Su
 A8SxPqT7aq81AcYtezLeyCRWQrQkOELzNZOjOcjo8L9lI/S6IbLxbJ6EeeRtraAEnNSu
 JilQ==
X-Gm-Message-State: AJIora8YwiVRsXM3ewLI3R2Nijjgvz4sIYD832TR0/8SQbkM5WeIXP+g
 U7CmGAibR/dLOVplJeQv4pv4NlhLoQk/lw==
X-Google-Smtp-Source: AGRyM1uDBxCJ8uiQFkrtmZhvgdxcwD8E+AHWZgblwH207izUugeZJVA4bVhvn/iz4gf6gqdKVdJrhw==
X-Received: by 2002:a05:600c:4e0d:b0:3a3:bc7:e9ec with SMTP id
 b13-20020a05600c4e0d00b003a30bc7e9ecmr1204wmq.167.1658853129953; 
 Tue, 26 Jul 2022 09:32:09 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d14-20020a05600c34ce00b0039747cf8354sm19236198wmq.39.2022.07.26.09.32.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 09:32:09 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH 1/2] pci: Remove unused pci_get_*_by_mask() functions
Date: Tue, 26 Jul 2022 17:32:05 +0100
Message-Id: <20220726163206.1780707-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220726163206.1780707-1-peter.maydell@linaro.org>
References: <20220726163206.1780707-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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

The helper functions pci_get_{byte,word,long,quad}_by_mask()
were added in 2012 in commit c9f50cea70a1596. In the decade
since we have never added a single use of them.

The helpers clearly aren't that helpful, so drop them
rather than carrying around dead code.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/pci/pci.h | 28 ----------------------------
 1 file changed, 28 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index b54b6ef88fc..c79144bc5ef 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -692,13 +692,6 @@ pci_set_byte_by_mask(uint8_t *config, uint8_t mask, uint8_t reg)
     pci_set_byte(config, (~mask & val) | (mask & rval));
 }
 
-static inline uint8_t
-pci_get_byte_by_mask(uint8_t *config, uint8_t mask)
-{
-    uint8_t val = pci_get_byte(config);
-    return (val & mask) >> ctz32(mask);
-}
-
 static inline void
 pci_set_word_by_mask(uint8_t *config, uint16_t mask, uint16_t reg)
 {
@@ -707,13 +700,6 @@ pci_set_word_by_mask(uint8_t *config, uint16_t mask, uint16_t reg)
     pci_set_word(config, (~mask & val) | (mask & rval));
 }
 
-static inline uint16_t
-pci_get_word_by_mask(uint8_t *config, uint16_t mask)
-{
-    uint16_t val = pci_get_word(config);
-    return (val & mask) >> ctz32(mask);
-}
-
 static inline void
 pci_set_long_by_mask(uint8_t *config, uint32_t mask, uint32_t reg)
 {
@@ -722,13 +708,6 @@ pci_set_long_by_mask(uint8_t *config, uint32_t mask, uint32_t reg)
     pci_set_long(config, (~mask & val) | (mask & rval));
 }
 
-static inline uint32_t
-pci_get_long_by_mask(uint8_t *config, uint32_t mask)
-{
-    uint32_t val = pci_get_long(config);
-    return (val & mask) >> ctz32(mask);
-}
-
 static inline void
 pci_set_quad_by_mask(uint8_t *config, uint64_t mask, uint64_t reg)
 {
@@ -737,13 +716,6 @@ pci_set_quad_by_mask(uint8_t *config, uint64_t mask, uint64_t reg)
     pci_set_quad(config, (~mask & val) | (mask & rval));
 }
 
-static inline uint64_t
-pci_get_quad_by_mask(uint8_t *config, uint64_t mask)
-{
-    uint64_t val = pci_get_quad(config);
-    return (val & mask) >> ctz32(mask);
-}
-
 PCIDevice *pci_new_multifunction(int devfn, bool multifunction,
                                     const char *name);
 PCIDevice *pci_new(int devfn, const char *name);
-- 
2.25.1


