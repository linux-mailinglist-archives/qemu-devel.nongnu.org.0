Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9C565F265
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 18:17:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDTLy-0000S5-Hl; Thu, 05 Jan 2023 11:44:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTLt-0000Ke-QB
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:25 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTLr-0007M4-VT
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:25 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 p1-20020a05600c1d8100b003d8c9b191e0so1773915wms.4
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 08:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SBtE1WaPGjXlOvM4v7lfDebcyZ7mACd7pg2snYYPi6M=;
 b=ihjQueGM9bP+CPvnaesnHe1pT6sp2QspjYleUq+tvbjnNECfiS4cGKTObPe6p9YVhU
 c0SuWf9NpD157Dj0PVrutwqFK8ZZuEmb6Hc9uEctTLWMUmgUtmwnagPtP/KIZin66GHO
 IzsKgDLCUQv2SSX26vulTvteNiEocTq4HHrlacpRL9o1tM6Zrf8cSD6uQuDzBP0oFDZq
 qook4FiSSzMMpfQboEOEcmXv30sQQCup0A92xTaxMGttAngfmxvkva6Q1bwM3eqh4aIN
 B85gr5j4sXMEx36P4/TEF+J+hPyu9pbH8jKCKWQoXH2vvuXru9O2yYB/Z7ViSaaU7Ums
 M3cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SBtE1WaPGjXlOvM4v7lfDebcyZ7mACd7pg2snYYPi6M=;
 b=ck6G1aPM92hLM2gbc4hVrnglQxc59WS7GLdhQKN2aVWMmInPoI+miWYfK0ZY2rVqZK
 2hLzA9AU4jfBS7+OlBNd6qmIMTUO53JPFgVbF72ClHdVM1/2nGZpKEtiXffulRe+3Wk6
 +9wE5V846zNQGzM4rQ9q3snDF4kTReVemBefIt8CKZcDuSuCN3JkBewubYxVqZ3Pzj4N
 d0/k5KraVc0sa4Uu43zcTWccb4StKUzOyCE/5p19gTADtopwlyrcs6IOHdRUYJ2df0DL
 etD5c9K6KgyVKCguEhUFuG5aGMJT8igGE48t23SGpxzbUOCiQWWMe+7THWzGefqdl5EF
 OGAQ==
X-Gm-Message-State: AFqh2krdayY5EO0yQLsqukGBY/cf5RBL3v8tBtCG05Njk9p7y4kODlzd
 LT6sT2IESgRBteaQW+Y94Q++OzHRqSvByi3w
X-Google-Smtp-Source: AMrXdXuSg2soUoTlQ2qC9iZEWEphZlLGy3Qpj1isxmJzV03VfWSQHDimU/uDwvDOXO2AEYuz6C71jA==
X-Received: by 2002:a05:600c:43ca:b0:3d0:73f5:b2c0 with SMTP id
 f10-20020a05600c43ca00b003d073f5b2c0mr38841841wmn.20.1672937062671; 
 Thu, 05 Jan 2023 08:44:22 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 hg9-20020a05600c538900b003cf71b1f66csm3055547wmb.0.2023.01.05.08.44.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 08:44:22 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/34] target/arm: Make stage_2_format for cache attributes
 optional
Date: Thu,  5 Jan 2023 16:43:47 +0000
Message-Id: <20230105164417.3994639-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230105164417.3994639-1-peter.maydell@linaro.org>
References: <20230105164417.3994639-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>

The v8R PMSAv8 has a two-stage MPU translation process, but, unlike
VMSAv8, the stage 2 attributes are in the same format as the stage 1
attributes (8-bit MAIR format). Rather than converting the MAIR
format to the format used for VMSA stage 2 (bits [5:2] of a VMSA
stage 2 descriptor) and then converting back to do the attribute
combination, allow combined_attrs_nofwb() to accept s2 attributes
that are already in the MAIR format.

We move the assert() to combined_attrs_fwb(), because that function
really does require a VMSA stage 2 attribute format. (We will never
get there for v8R, because PMSAv8 does not implement FEAT_S2FWB.)

Signed-off-by: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20221206102504.165775-4-tobias.roehmel@rwth-aachen.de
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 2e7826dc29b..1c7c9cb5e37 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2361,7 +2361,11 @@ static uint8_t combined_attrs_nofwb(uint64_t hcr,
 {
     uint8_t s1lo, s2lo, s1hi, s2hi, s2_mair_attrs, ret_attrs;
 
-    s2_mair_attrs = convert_stage2_attrs(hcr, s2.attrs);
+    if (s2.is_s2_format) {
+        s2_mair_attrs = convert_stage2_attrs(hcr, s2.attrs);
+    } else {
+        s2_mair_attrs = s2.attrs;
+    }
 
     s1lo = extract32(s1.attrs, 0, 4);
     s2lo = extract32(s2_mair_attrs, 0, 4);
@@ -2418,6 +2422,8 @@ static uint8_t force_cacheattr_nibble_wb(uint8_t attr)
  */
 static uint8_t combined_attrs_fwb(ARMCacheAttrs s1, ARMCacheAttrs s2)
 {
+    assert(s2.is_s2_format && !s1.is_s2_format);
+
     switch (s2.attrs) {
     case 7:
         /* Use stage 1 attributes */
@@ -2467,7 +2473,7 @@ static ARMCacheAttrs combine_cacheattrs(uint64_t hcr,
     ARMCacheAttrs ret;
     bool tagged = false;
 
-    assert(s2.is_s2_format && !s1.is_s2_format);
+    assert(!s1.is_s2_format);
     ret.is_s2_format = false;
 
     if (s1.attrs == 0xf0) {
-- 
2.25.1


