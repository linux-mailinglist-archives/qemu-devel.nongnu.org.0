Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D675FA090
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 16:54:08 +0200 (CEST)
Received: from localhost ([::1]:37462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohuAR-0007E2-4n
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 10:54:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohtlE-0006ed-S9
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:28:04 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:42706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohtlD-0005ca-7F
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:28:04 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 o20-20020a05600c4fd400b003b4a516c479so6524474wmq.1
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 07:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ZyrQwdJTnkRxmzsd2VOm6mWaiY1ZM83JO9WWcUYcQOs=;
 b=U0DYTgngaclUZKgzcv2dnzsaBrhG6kL1a29tfI7w8+aJADz9CWa16Z9maJ7wuraust
 Ut4new1OfmDLrElOQkm40ubazGQ2UcSM3yiCBlHGl9cZDGbkJHYt3n1OvjIeAYn7D0q5
 /BlSxcNbps+0CnC4BeiyzT9/+ciG7OjCwQ9srdVzK4+lcViMDCSVSNaYijDHqCDvENdP
 9ZrT8CFx5iqsrnFQdzXROVpyNqEixD2/NzTdvXhNMxr5aGeNzrWZNM1iXJ50nRYlmxH0
 4CLE0W8xOQBuBabjbk9UusEz/EyyYWxoaKGN0D57JP1d65gxXaltIzZ3R0c/15hKLoAd
 5OfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZyrQwdJTnkRxmzsd2VOm6mWaiY1ZM83JO9WWcUYcQOs=;
 b=h9cBjIIVicofXDN78VM0kAZ7GR1xvWoAa5SeWlBI1V470yzKm7Xx6JqJbbzo3r5SJX
 ghN4ZI7L2XG8r36ODsRU0SrinhdCqmFiGTIFDMyjz+N0ZChTYoZR3QJwEBRAhsW3YJlJ
 rS082xuLjW1PJjfVuQ7gPIYOMAlpgKYg6S8hoGKJRNJcMioyITlvdHtOgzFPEMZU6xDA
 CChx9vYlJcA2nrcuqQQZM1us8+i0V1NXnIEn7mmEn/y/lXSF3pE6/+jl3rs+AIyxaDH7
 XCC9KkVpjigzEvBgWiKcCOvoW/wC5kxqpvm7C5OPi1KVQjvjgEHZWh/bshEO0Jg5NRiO
 rOfg==
X-Gm-Message-State: ACrzQf3w5NEPWGT8UMp2uZkyWyF7vb/L3Xkew/lnacDr9FRql+lMZK6N
 XuDN4EkrRJHBqvaDtJ23Wks/VBmQpEYpbA==
X-Google-Smtp-Source: AMsMyM5ogKwSHC8nYB+JzJ5vbged/fEujINUfFTyJFIJw9K/EsQakecxAZmh2NU8Heg9wgEbsTAxZQ==
X-Received: by 2002:a05:600c:1d02:b0:3c3:e6f0:6e4b with SMTP id
 l2-20020a05600c1d0200b003c3e6f06e4bmr10143855wms.202.1665412081541; 
 Mon, 10 Oct 2022 07:28:01 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 u6-20020adfed46000000b0022e04bfa661sm9037054wro.59.2022.10.10.07.28.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 07:28:01 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 28/28] docs/system/arm/emulation.rst: Report FEAT_GTG support
Date: Mon, 10 Oct 2022 15:27:30 +0100
Message-Id: <20221010142730.502083-29-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221010142730.502083-1-peter.maydell@linaro.org>
References: <20221010142730.502083-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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

FEAT_GTG is a change tho the ID register ID_AA64MMFR0_EL1 so that it
can report a different set of supported granule (page) sizes for
stage 1 and stage 2 translation tables.  As of commit c20281b2a5048
we already report the granule sizes that way for '-cpu max', and now
we also correctly make attempts to use unimplemented granule sizes
fail, so we can report the support of the feature in the
documentation.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20221003162315.2833797-4-peter.maydell@linaro.org
---
 docs/system/arm/emulation.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index be7bbffe595..cfb4b0768b0 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -31,6 +31,7 @@ the following architecture extensions:
 - FEAT_FRINTTS (Floating-point to integer instructions)
 - FEAT_FlagM (Flag manipulation instructions v2)
 - FEAT_FlagM2 (Enhancements to flag manipulation instructions)
+- FEAT_GTG (Guest translation granule size)
 - FEAT_HCX (Support for the HCRX_EL2 register)
 - FEAT_HPDS (Hierarchical permission disables)
 - FEAT_I8MM (AArch64 Int8 matrix multiplication instructions)
-- 
2.25.1


