Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 100503C715D
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 15:43:48 +0200 (CEST)
Received: from localhost ([::1]:37694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3IhP-00012g-4S
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 09:43:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3IbR-0008HU-7t
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:37:37 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:45604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3IbM-0003bK-LH
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:37:36 -0400
Received: by mail-wr1-x436.google.com with SMTP id t5so16680061wrw.12
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 06:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Bon4R+GO/Kh6lXfctlExnNFuhwRkWgeWXsUtfA3/MIY=;
 b=IMFRlO/2qfyAWzfeywhLG8VbndFXEw4ttLF85sFynSGtY5DjuwCw2a1iX44y7udzyH
 mUNO/YHeLf9Sk61jdG9dvaOZXivbzq7bFFuL0pATMJZw0poeiF7Trcc1486K51dSshms
 khqqabq0ykM8VioFckReDqhRhavCAG6USC8n5/fhHIW5/xY1oavQnj84sfcrSnkW7lLm
 T6CQc55/niaISZ8ybmGfxKblBCj60hV3EugtOt1YcyqfAAxYNFZFLsln0brBTJ+G+72P
 qz7JQtidTIr036mZVDrY7g3ZrXN/UEFIax9jdzVHIsSE/0TCUE5moEAnmxMZzorIq+1o
 bTGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bon4R+GO/Kh6lXfctlExnNFuhwRkWgeWXsUtfA3/MIY=;
 b=Pue67OGjM1Vj7W/6ZbXjpret3s/Ah98ShzRV1s2txHHKHlpt2kVlgucEvkwDZ3CR/x
 inn8zwlij7auW1XpTHmiQlDGlvV2YMENmtRaDpIzT09V2Nvx+9xnRrJK0s6hcvlKyyXE
 /S05ZOvBZJplXICJLQcnunATLifZxSKfnR6jEsjVutXpyjdzMpkdkzfGCd0SmsUWPJ78
 nTMqRRVthE+s1DvwKPN3x8mgJMkwm1Ho84dET/NHzrkPF6Crbn1VXc2PjniK+VJlCq8G
 jxwDioWT+QOzHPZCgqTVAQuvkRrdIRUsa+Y4/yxK7oDtBUEqfOn+huYkSKGoTik49jeT
 2Z3A==
X-Gm-Message-State: AOAM531X5qGq6lzLRDTYWzwdLgefH/W/rsXnz6vDJ6UElW5Gzz/+ZzOd
 n/tMpM+jz9v/e1UXhDjh7Lga9A==
X-Google-Smtp-Source: ABdhPJyWXGoBZgEw4iYFEjiNITrcYPYyIGWI6P4Fyfs7LjZD0ryso50Ryq54UuyyG0qYXleCAWgktQ==
X-Received: by 2002:adf:f90d:: with SMTP id b13mr5917402wrr.336.1626183451487; 
 Tue, 13 Jul 2021 06:37:31 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j6sm9827443wrm.97.2021.07.13.06.37.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 06:37:30 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 03/34] target/arm: Fix MVE VSLI by 0 and VSRI by <dt>
Date: Tue, 13 Jul 2021 14:36:55 +0100
Message-Id: <20210713133726.26842-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210713133726.26842-1-peter.maydell@linaro.org>
References: <20210713133726.26842-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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

In the MVE shift-and-insert insns, we special case VSLI by 0
and VSRI by <dt>, both of which mean "no shift". However we
incorrectly implemented these as "don't update the destination",
which works only if Qd == Qm. When Qd != Qm this kind of
shift must update Qd, honouring the predicate mask.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/mve_helper.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index db5d6220854..16a701933b8 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -1276,19 +1276,23 @@ DO_2SHIFT_S(vrshli_s, DO_VRSHLS)
                                 void *vm, uint32_t shift)               \
     {                                                                   \
         uint64_t *d = vd, *m = vm;                                      \
-        uint16_t mask;                                                  \
+        uint16_t mask = mve_element_mask(env);                          \
         uint64_t shiftmask;                                             \
         unsigned e;                                                     \
         if (shift == 0 || shift == ESIZE * 8) {                         \
             /*                                                          \
              * Only VSLI can shift by 0; only VSRI can shift by <dt>.   \
              * The generic logic would give the right answer for 0 but  \
-             * fails for <dt>.                                          \
+             * fails for <dt>. In both cases, we must not shift the     \
+             * input but just copy it to the destination, honouring     \
+             * the predicate mask.                                      \
              */                                                         \
+            for (e = 0; e < 16 / 8; e++, mask >>= 8) {                  \
+                mergemask(&d[H8(e)], m[H8(e)], mask);                   \
+            }                                                           \
             goto done;                                                  \
         }                                                               \
         assert(shift < ESIZE * 8);                                      \
-        mask = mve_element_mask(env);                                   \
         /* ESIZE / 2 gives the MO_* value if ESIZE is in [1,2,4] */     \
         shiftmask = dup_const(ESIZE / 2, MASKFN(ESIZE * 8, shift));     \
         for (e = 0; e < 16 / 8; e++, mask >>= 8) {                      \
-- 
2.20.1


