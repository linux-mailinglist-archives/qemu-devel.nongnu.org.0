Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B61631B746
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 11:38:21 +0100 (CET)
Received: from localhost ([::1]:42428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBbGm-00025T-Fe
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 05:38:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBbB7-0004Ml-4U
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 05:32:29 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:44788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBbB1-0001iT-LH
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 05:32:28 -0500
Received: by mail-wr1-x431.google.com with SMTP id g6so8208001wrs.11
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 02:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a/+Lp00ImdUdFCYzgiMMi+eXXtTKdO25fqdcbshDHFk=;
 b=wzf5lP4M2v8m9ufOOVGz9/4OfRXiTCbT/YdMpZzPmTEHLBbSeSPxU03oJVjPe9Icsf
 Q+fM+Ryg4bHNT4uFq36lNp8gBxljAyAIb1gAeT7Ty8QKCxJHrLq1RgiD4MQYJp32h9zt
 bG0cBz79TUDL2xyAawmsOjtjI0a1MRB3o1D7Oaw8lrOkMMOb5GMJ1Ibp8J2w4VCb9uNd
 XE7EIp74tstX+p+P1hlY0iqbh6WR5MwOMQlPZZWQFpC6u3DitZGeB/ZucKiJuaP85AaI
 ZiUsYhY+i/BsysJ04t6br3VLxMC2dsbbqwPN2d9wZaHVs0ZtVV8mOEptTZiOw6uPk1mI
 feHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a/+Lp00ImdUdFCYzgiMMi+eXXtTKdO25fqdcbshDHFk=;
 b=jU4EEwoX64jwFcQ0sguSoJkfsfVI+hPsbZ1gq5eqoBVNHQDvcEtRqQRfBISpIwZv8h
 9u5E7nsUfw/UQycDEgvrtwaMLzBf9vk41CY4ju3+rko63RmqBq9hkCnQAqSW+fdiKoCo
 6z4gh03NFgzhpMr3rJ4paS+cR2VcwIgOqT9kh7q6pw/CXy00lbbLdF7XfwShYc3xr3gV
 1lC6kisWq6T5pE3fVAM8SKTzROXVzIK5j35neIYQsVMZ7ghWsm57rts0+7XINtGtUK7k
 J+HAatfyg+cuUU+ZPBn7mM1ji7BL4H6BSKFMwXX1dvqLKEWjVf5l6JpcCtQlExLCnP9V
 AJzQ==
X-Gm-Message-State: AOAM531w2i0VxL64FtJ3PYIHnDltVRYtCAvEB6QOSASQPHNd7IAAEVEF
 hm8UcHrTaL8yfXCCbWslkQVtlA==
X-Google-Smtp-Source: ABdhPJzc2JJv4ycwTYjqCaojZ6kIw9W+5qlEeJ9IauCyoCuamCtSz7KSdeXJT1IugU839CRJ9V+5rg==
X-Received: by 2002:a05:6000:152:: with SMTP id
 r18mr17790825wrx.226.1613385142286; 
 Mon, 15 Feb 2021 02:32:22 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 36sm25196300wrj.97.2021.02.15.02.32.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 02:32:21 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 6/9] hw/display/omap_lcdc: Drop broken bigendian ifdef
Date: Mon, 15 Feb 2021 10:32:12 +0000
Message-Id: <20210215103215.4944-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210215103215.4944-1-peter.maydell@linaro.org>
References: <20210215103215.4944-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
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


