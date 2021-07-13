Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C707B3C7162
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 15:44:30 +0200 (CEST)
Received: from localhost ([::1]:40150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Ii5-0002dB-Rl
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 09:44:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3IbS-0008M0-JO
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:37:38 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:34541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3IbQ-0003cH-Bt
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:37:38 -0400
Received: by mail-wr1-x42f.google.com with SMTP id p8so30507724wrr.1
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 06:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=l4h+O9UQxvrDocVeKKCEGu5i8zNpjbzWnTmmgtbEZ2s=;
 b=OaqEhGMxaVz33bTdKgnek+RTDw5dZ+clhFCdU18BF4QC3taqqoLqIlR0/KybUvROX6
 9EVjY6/GgiKAP+hmL9VjJGu6Adxcic0R0zZrNJWD8kxH3hS5JkAMWYdZcAXkzYhFBbdO
 ChJK7xO21Bsx6XH6DK2TB4NRM4h2zrvJ4s6erbbC/newnPJYPNh9P4TK0E1uvS1O/bG6
 xY5DAejwTotZTyIrOtH6SYQtsIhToRTedJ+N+itcD3BBt1P/CstQvpy5ad8r6+Bhk2/Q
 DLb4ehh+zB7CJUY8hGXmedX3dfbSCG+huPdQH26P+r0xrKhkcy1BgTz7M4TIYGtgxspB
 l0wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l4h+O9UQxvrDocVeKKCEGu5i8zNpjbzWnTmmgtbEZ2s=;
 b=GtXyMFTeJ4t/WGoJZgd2JMmsbXvuFydreazDLF9f8E3POxgZOb0ObCSXOSXld0UE57
 u84WbmSLm1FbcZQOcT3cxxxi6Jchu10pa7tSLXZ/pcg4ztdvACHEI7NLygkiqqG5fBWa
 0SdeE2gOhOdOkQgXJuk9axQIYpLb4q+gqElLe8gD7EdMSIgmbi3AMNinWzoDk9tR4rkH
 Fztk8woJKW7tF4zUi3Iy4ySVaZ8XKhVHKo1Tm6A21zoawdApMfpKelFREn/exu8ZtiSt
 VFklbk+RUmJpOe8kOy1fhYOVIYGiwqw7VPV4FHHW1Im5xrzktF8qWMbh/hnIuTGiG9rT
 yxqA==
X-Gm-Message-State: AOAM530SYJGAazmySifObYivgKbR58ZM3Mgo01VZY6Bjcee0cHiAj4jP
 CpCICNlsI7gdT3rf2FUOcpYrQ5mQ+u8VxG+J
X-Google-Smtp-Source: ABdhPJyMrKd+dSTcjSQIwTRmL6BMPOd91vKcRq/hZD8YC4XmXNBEPeE/HyvwHpAWTIMAB9M8qF0qIA==
X-Received: by 2002:a5d:5989:: with SMTP id n9mr5672702wri.8.1626183453289;
 Tue, 13 Jul 2021 06:37:33 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j6sm9827443wrm.97.2021.07.13.06.37.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 06:37:32 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 05/34] target/arm: Fix mask handling for MVE narrowing
 operations
Date: Tue, 13 Jul 2021 14:36:57 +0100
Message-Id: <20210713133726.26842-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210713133726.26842-1-peter.maydell@linaro.org>
References: <20210713133726.26842-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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

In the MVE helpers for the narrowing operations (DO_VSHRN and
DO_VSHRN_SAT) we were using the wrong bits of the predicate mask for
the 'top' versions of the insn.  This is because the loop works over
the double-sized input elements and shifts the predicate mask by that
many bits each time, but when we write out the half-sized output we
must look at the mask bits for whichever half of the element we are
writing to.

Correct this by shifting the whole mask right by ESIZE bits for the
'top' insns.  This allows us also to simplify the saturation bit
checking (where we had noticed that we needed to look at a different
mask bit for the 'top' insn.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/mve_helper.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 99b4801088f..8cbfd3a8c53 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -1361,6 +1361,7 @@ DO_VSHLL_ALL(vshllt, true)
         TYPE *d = vd;                                           \
         uint16_t mask = mve_element_mask(env);                  \
         unsigned le;                                            \
+        mask >>= ESIZE * TOP;                                   \
         for (le = 0; le < 16 / LESIZE; le++, mask >>= LESIZE) { \
             TYPE r = FN(m[H##LESIZE(le)], shift);               \
             mergemask(&d[H##ESIZE(le * 2 + TOP)], r, mask);     \
@@ -1422,11 +1423,12 @@ static inline int32_t do_sat_bhs(int64_t val, int64_t min, int64_t max,
         uint16_t mask = mve_element_mask(env);                  \
         bool qc = false;                                        \
         unsigned le;                                            \
+        mask >>= ESIZE * TOP;                                   \
         for (le = 0; le < 16 / LESIZE; le++, mask >>= LESIZE) { \
             bool sat = false;                                   \
             TYPE r = FN(m[H##LESIZE(le)], shift, &sat);         \
             mergemask(&d[H##ESIZE(le * 2 + TOP)], r, mask);     \
-            qc |= sat && (mask & 1 << (TOP * ESIZE));           \
+            qc |= sat & mask & 1;                               \
         }                                                       \
         if (qc) {                                               \
             env->vfp.qc[0] = qc;                                \
-- 
2.20.1


