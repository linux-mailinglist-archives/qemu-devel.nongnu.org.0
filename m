Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E6D4D04C3
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 17:58:55 +0100 (CET)
Received: from localhost ([::1]:40250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRGhB-0008Q0-TM
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 11:58:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRGW5-0001pG-T7
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 11:47:25 -0500
Received: from [2a00:1450:4864:20::42f] (port=33631
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRGW4-0007lU-8J
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 11:47:25 -0500
Received: by mail-wr1-x42f.google.com with SMTP id j17so24367559wrc.0
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 08:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=k3XXdEEkAT8rtcP4zgQB24XrJWOVDRQK/GtPyU/3Usc=;
 b=qt78X5T32qE3+V+QdB9RtVkOR845+/Wnc0L498DnmiZub4fOypKPtmG0LLhOmjgV/U
 qGxG5vy80ycliH+owJGNW0KW6TI4L6aS22ohN3m6ZsXbpcWnjVgJjAOhFRNwaxZNY5lP
 rhK5Piqub2JazJaY6icSaKtr2VYFZ1AKwrSdP9kNWYgW4w8WtP/yzq8l+bGhugKGR4Y6
 TW2yXQM9XKLBaE1w9eZrMbiIv8g5x+rF7Z7eXyCjOLcnAZq1pt5MTeCfC9ANg0tYfjc1
 f9+J7wCh5oxgI6V3/Zptxjbb9G+Z0Xqt9Ez+F4458ZmmK1QCl9pK46/YvmFrHD+hnNBS
 3Ojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k3XXdEEkAT8rtcP4zgQB24XrJWOVDRQK/GtPyU/3Usc=;
 b=sonNTaJ0rAac+qPe0k7XV8/TLhqzs9E6pATdU7W5jer0gwU90s91fMimCVEy3fb07x
 3ApXGQVwOWTdpRNT2gH1pEyl0o8Oj73oQg7AcRZDg4QwOyC7Me79JmB5RQwCjIJ2pfgy
 nEJWEgikqwUjsZ3PmmNQX+QhTJeLX0xS4Xa7c4YaTQVzKoLG9hFOM71coZD8yOJIvO2+
 aNKLx6u5zUqlD6dzRxHUjE5LyjSaEZ3rZDkiK1YhUGK7c5P2KjUIfYx6VCp1YPpX8+OV
 KKprYfI+UARB0DKj6YzXIIjs2yJ+8I/GayqEr3YUQBBsVZE3VSkPx6t+9eKSiONu8GFq
 umVQ==
X-Gm-Message-State: AOAM531Eh/jdJbe1sAS295kfF5+05UECdxlKDpZWlCceDilxkciqAgIx
 iAq1cKpHpMhMOA2YOcBh/s5Cj3EsVsbYEg==
X-Google-Smtp-Source: ABdhPJzljYG3cVB4SoBuOxWOnbmNx6PCspyLO+PFAvShYiwg3oeLABoFqV9juiwwGlTYLCUwtSLIxg==
X-Received: by 2002:adf:ea0f:0:b0:1f0:61f6:c3df with SMTP id
 q15-20020adfea0f000000b001f061f6c3dfmr8895702wrm.543.1646671642978; 
 Mon, 07 Mar 2022 08:47:22 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 v188-20020a1cacc5000000b00384b71a50d5sm13806652wme.24.2022.03.07.08.47.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 08:47:22 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/18] hw/intc/arm_gicv3: Specify valid and impl in
 MemoryRegionOps
Date: Mon,  7 Mar 2022 16:47:04 +0000
Message-Id: <20220307164709.2503250-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220307164709.2503250-1-peter.maydell@linaro.org>
References: <20220307164709.2503250-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

The GICv3 has some registers that support byte accesses, and some
that support 8-byte accesses.  Our TCG implementation implements all
of this, switching on the 'size' argument and handling the registers
that must support reads of that size while logging an error for
attempted accesses to registers that do not support that size access.
However we forgot to tell the core memory subsystem about this by
specifying the .impl and .valid fields in the MemoryRegionOps struct,
so the core was happily simulating 8 byte accesses by combining two 4
byte accesses.  This doesn't have much guest-visible effect, since
there aren't many 8 byte registers and they all support being written
in two 4 byte parts.

Set the .impl and .valid fields to say that all sizes from 1 to 8
bytes are both valid and implemented by the device.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220303202341.2232284-4-peter.maydell@linaro.org
---
 hw/intc/arm_gicv3.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
index 6d3c8ee231c..0b8f79a1227 100644
--- a/hw/intc/arm_gicv3.c
+++ b/hw/intc/arm_gicv3.c
@@ -369,11 +369,19 @@ static const MemoryRegionOps gic_ops[] = {
         .read_with_attrs = gicv3_dist_read,
         .write_with_attrs = gicv3_dist_write,
         .endianness = DEVICE_NATIVE_ENDIAN,
+        .valid.min_access_size = 1,
+        .valid.max_access_size = 8,
+        .impl.min_access_size = 1,
+        .impl.max_access_size = 8,
     },
     {
         .read_with_attrs = gicv3_redist_read,
         .write_with_attrs = gicv3_redist_write,
         .endianness = DEVICE_NATIVE_ENDIAN,
+        .valid.min_access_size = 1,
+        .valid.max_access_size = 8,
+        .impl.min_access_size = 1,
+        .impl.max_access_size = 8,
     }
 };
 
-- 
2.25.1


