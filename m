Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 150FF5984FB
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 15:57:25 +0200 (CEST)
Received: from localhost ([::1]:39666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOg1T-0000Ie-U1
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 09:57:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oOfyg-0004Z5-KC
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 09:54:31 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:39518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oOfye-0002QJ-MQ
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 09:54:29 -0400
Received: by mail-wr1-x431.google.com with SMTP id r16so1826035wrm.6
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 06:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=U9xOpGEBZ+FMG/fJxG2GJhXlUWOoFT9u3NruQ6RU9kM=;
 b=NG/Tb9UHXn6YsDmkmMlc/Vl+JejceB1LhuVP8xvxTGmVwiuz9yd+MUb8gaEY5KHlQK
 4iDt1NTEBjmFEIWkL7Rlva7JeMU0EFOCIFfgqltkTJWWqj9383KO13iEQ7QcOx+b+CjL
 S8CEkOKivJ/H6jA6sYch5+uGDAoI3e8oMRrtWUX+ghdCjIX0H0S0Pt0yH+KhDqxXb47E
 oUZ1Eyfg0DkYM1fs4GpS0PLCW9ucuN0QzhCl3YnVLfhI1bKavkdeixnA9onAEopu5UUb
 hHVrDHPYHrz/TEIlyTpPUggVoTZicmzeBi0qsQuSWEOno4ltcH6d0uDRI2iYeJMdpNh0
 bZ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=U9xOpGEBZ+FMG/fJxG2GJhXlUWOoFT9u3NruQ6RU9kM=;
 b=beDo/Ue0Ar1N+cVd6THl0d8XJsIDNpBZigCH6yhFDTz9K0+E4uxhuBLW43q3wXeXyc
 REnR9sfCHtf4QjGh6RmUoycsMM38Fw0CAlLLgHobwUrDg2RJZiJL2alIl6kAefDbqn0C
 eO4GnlRVRN55G8wzjhps7kx6u+J4gwb3Op/5v8hX6EVDAGFEaf5qA+Y3wVJ1NPd6/PAa
 YUzOa0eaTRyGB6DiVF/42TyaSf2BK+iuLPTwvRj2HASsZlIGfBvV1yk56jX3HNn1ZC1Q
 VAbJxzjh9Rq7CBoASlDeC40La8Rz04dvLegNMoKiNhMuj/S6nNycztwY1HBcC4fRgbd1
 bHZA==
X-Gm-Message-State: ACgBeo35vCOjrWbkEruB5YPE4nNHBCRSh0UMPZhAn65aRr08WJYOqb5T
 ukptNhzgBj4/R7PdaiIDpz3tl132YZYn/w==
X-Google-Smtp-Source: AA6agR6pr5vci0z/KCu5d30pP2ma7ZLwSWkao5jMOJLwjOiFGfzTIHknXIuaTP79hdOfOtU4CzWO0g==
X-Received: by 2002:a05:6000:178e:b0:220:635f:eb13 with SMTP id
 e14-20020a056000178e00b00220635feb13mr1703032wrg.634.1660830866938; 
 Thu, 18 Aug 2022 06:54:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d24-20020adfa358000000b0021ea1bcc300sm1624410wrb.56.2022.08.18.06.54.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 06:54:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v2 for-7.2 1/2] pci: Remove unused pci_get_*_by_mask()
 functions
Date: Thu, 18 Aug 2022 14:54:20 +0100
Message-Id: <20220818135421.2515257-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220818135421.2515257-1-peter.maydell@linaro.org>
References: <20220818135421.2515257-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


