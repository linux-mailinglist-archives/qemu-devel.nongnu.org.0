Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC9E3F7368
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 12:37:15 +0200 (CEST)
Received: from localhost ([::1]:40356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIqHS-0005nX-Ev
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 06:37:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqFz-0002m1-UH
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:35:43 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:37475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqFx-0005Ft-H9
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:35:43 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 c8-20020a7bc008000000b002e6e462e95fso3921116wmb.2
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 03:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=AdQbpZh4Nsn4ZEWXMN8/5MXfv9l4tGOGQ949NSeXfXg=;
 b=Sb2kzKedAI20nwsZqEpzaLIlrTxfpyLtft6cetmP2ACPMIcE924qu3jwL3Ix8fSCwq
 4kfxBJnIcaSH3V4YKAo6+5oyD5lM2OL4NxAxH8pft4IXIiFsq/gesoiOIoSAKUqVutX5
 4zxNYR6LgJxOzu2WPUOy9VuLYnE8ezBKYhGQqY/V4yxLxiqKEs1OF4Yz2ne/gf9QtF4F
 mhOQj6bVpP+Ni1YDSaevAYxGfJ4y1BnTsELxtQhyvrxK7uUfB6cMfvzJxnQFJ9MKTkH/
 m4DkjbDSPWe4ywgINIlBAu5ayXVgiI+dMMC+Z0ESS4Xhh8is2SEY1YCvEW1g7P73mP8p
 0B7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AdQbpZh4Nsn4ZEWXMN8/5MXfv9l4tGOGQ949NSeXfXg=;
 b=SydBe0GAkgaO1ciCH8tOiyl+w40SCWjbCsacgFCI+/8cy5J7bqCM7bRLe2DcM3tP1A
 QSMwtN9gdE79mAtaFn0QIR837Prc7r+tytat/ND2nJrBY8l2i3A3f1afUblVujeA1Cpd
 L5emzuVKGprSYG0S3WWsEVKr4qvdJ8s8VUQafuNvgBDFcvYJwj3S4xQpnJs8qPI1zgSa
 oTsxdMwxGmtacerjud72ynOINsLBR6MgmgWGduDMKM158H8pW8sFnL34+mhUqrWyd953
 xyNQ3pcvEFSRuljmnEIMdYWbGaEYSGg3t8NBtCFan22BIYUaRBmzGk+Rmm4O+12CUV1n
 vRlw==
X-Gm-Message-State: AOAM532I88i3r9XZp6S+CqwCDU3SCwQGYI8yDQTg1pbT+flFis5crMdj
 Pww5XRlnz4O9XyE4E0m4wZqE3SR6JZInXg==
X-Google-Smtp-Source: ABdhPJyomkbti62gZqlzJ1sAxjLMkj1PrR+QYRz5hIYvQYw/FD0JY7Du0Q0uKWUUucK9KkDguW29jA==
X-Received: by 2002:a1c:9d8f:: with SMTP id g137mr4155016wme.187.1629887740069; 
 Wed, 25 Aug 2021 03:35:40 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m4sm5075931wml.28.2021.08.25.03.35.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 03:35:39 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/44] target/arm: Fix mask handling for MVE narrowing
 operations
Date: Wed, 25 Aug 2021 11:34:55 +0100
Message-Id: <20210825103534.6936-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210825103534.6936-1-peter.maydell@linaro.org>
References: <20210825103534.6936-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mve_helper.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 82151b06200..847ef5156ad 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -1358,6 +1358,7 @@ DO_VSHLL_ALL(vshllt, true)
         TYPE *d = vd;                                           \
         uint16_t mask = mve_element_mask(env);                  \
         unsigned le;                                            \
+        mask >>= ESIZE * TOP;                                   \
         for (le = 0; le < 16 / LESIZE; le++, mask >>= LESIZE) { \
             TYPE r = FN(m[H##LESIZE(le)], shift);               \
             mergemask(&d[H##ESIZE(le * 2 + TOP)], r, mask);     \
@@ -1419,11 +1420,12 @@ static inline int32_t do_sat_bhs(int64_t val, int64_t min, int64_t max,
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


