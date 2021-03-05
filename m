Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AE532F1F1
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 18:56:26 +0100 (CET)
Received: from localhost ([::1]:41040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIEgb-0005KL-Ml
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 12:56:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE3T-00077D-2h
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:15:59 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:38181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE33-0007Yn-Rd
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:15:58 -0500
Received: by mail-wm1-x330.google.com with SMTP id h7so2106506wmf.3
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 09:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=1YovYc2LIv645u50nIn6bkmgm6nXTMjECoAetz4WC4k=;
 b=F7d29E4RV5FcMvjMujP7jquhou2818LE1mRa1xPY2IzWJor9g1is5tArDrYYpMQ/vK
 jCIfCuZw/Ni8Ln8nnX8P02UnOC90zCYgdCBOtLJrfcwxwPTdDq/3S1rP7FI3MQVHtONJ
 2IVcNqd1Am+ZbL1zXS6+QEmD+Le1cI3xivct3L1WVzr0fwmRSmyZ13JGmLfJ/EFmncSD
 Bfvc7ZdhLVkQDHzhcjRUX9z/euQFBpahXZSOZeMO7MW/T/KSqUUwzYrhL6dmbn6TuiO3
 JrYa7strUk2ocpVyycyZnVPii6hi7W3L81qUJwlvzO5S2pSCxvYt78kEsAG56/D3qMGq
 IRbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1YovYc2LIv645u50nIn6bkmgm6nXTMjECoAetz4WC4k=;
 b=IWej22mxYe0JVshVA9/orKmptyo8gnkBP4fIxRdS3zUfE++brc2kOjVvw7Jn6Uhbks
 euDtRDGbvdROw/ZmgnxN0lDJstM2dtRCS3H8z8o+tkaASX5T0CVo5iVC+1gtcPvX/HLC
 1pczdUQEb2LNdfrU8RQBUdpYmfipsS1ENmpZ0/CLDSy26ZPUDGrbI3IL6+8C44rJwYoG
 TAc9s5sebzZQPrVamzWE6EeDSBzIfni135VhgSFq2RWPiTPeEcZANU8pCl9nEAT++JMu
 QOKO5VSAXWcwwGeukDspk1o0R9Y6V5y9+zpSAeHcZxwUk5vTloZ8AKfStt+b9Xyeb1gO
 +l3g==
X-Gm-Message-State: AOAM530sW0wBvRgSeRerBpIVcaPqglTDtB/ftENQN1vSzL5+OYtrJqvy
 PU9BBfsJWFN5Z+T2THnKT1tBL6EZw10WBw==
X-Google-Smtp-Source: ABdhPJzGNxjrHBQr66p74OZ3pYifkBGw5VVOXIPFGdcYIfP0piO2fRkhoBrtHzqpp6VMmOatmRhbzg==
X-Received: by 2002:a7b:cb01:: with SMTP id u1mr9968387wmj.149.1614964532616; 
 Fri, 05 Mar 2021 09:15:32 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m132sm5942357wmf.45.2021.03.05.09.15.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 09:15:32 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/49] hw/display/omap_lcdc: Drop broken bigendian ifdef
Date: Fri,  5 Mar 2021 17:14:47 +0000
Message-Id: <20210305171515.1038-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210305171515.1038-1-peter.maydell@linaro.org>
References: <20210305171515.1038-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The draw_line16_32() function in the omap_lcdc template header
includes an ifdef for the case where HOST_WORDS_BIGENDIAN matches
TARGET_WORDS_BIGENDIAN.  This is trying to optimise for "source
bitmap and destination bitmap format match", but it is broken,
because in this function the formats don't match: the source is
16-bit colour and the destination is 32-bit colour, so a memcpy()
will produce corrupted graphics output.  Drop the bogus ifdef.

This bug was introduced in commit ea644cf343129, when we dropped
support for DEPTH values other than 32 from the template header.
The old #if line was
  #if DEPTH == 16 && defined(HOST_WORDS_BIGENDIAN) == defined(TARGET_WORDS_BIGENDIAN)
and this was mistakenly changed to
  #if defined(HOST_WORDS_BIGENDIAN) == defined(TARGET_WORDS_BIGENDIAN)
rather than deleting the #if as now having an always-false condition.

Fixes: ea644cf343129
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210215103215.4944-7-peter.maydell@linaro.org
---
 hw/display/omap_lcd_template.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/display/omap_lcd_template.h b/hw/display/omap_lcd_template.h
index c7c5025fb04..22e51d9bffb 100644
--- a/hw/display/omap_lcd_template.h
+++ b/hw/display/omap_lcd_template.h
@@ -139,9 +139,6 @@ static void draw_line12_32(void *opaque, uint8_t *d, const uint8_t *s,
 static void draw_line16_32(void *opaque, uint8_t *d, const uint8_t *s,
                            int width, int deststep)
 {
-#if defined(HOST_WORDS_BIGENDIAN) == defined(TARGET_WORDS_BIGENDIAN)
-    memcpy(d, s, width * 2);
-#else
     uint16_t v;
     uint8_t r, g, b;
 
@@ -154,5 +151,4 @@ static void draw_line16_32(void *opaque, uint8_t *d, const uint8_t *s,
         s += 2;
         d += 4;
     } while (-- width != 0);
-#endif
 }
-- 
2.20.1


