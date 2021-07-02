Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6176F3B9F4A
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 12:51:06 +0200 (CEST)
Received: from localhost ([::1]:54454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzGlF-0005kY-Dl
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 06:51:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzGb5-0004oY-6V
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 06:40:35 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:41793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzGaz-0006fz-Nm
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 06:40:34 -0400
Received: by mail-wr1-x431.google.com with SMTP id u8so11869746wrq.8
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 03:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pPs0EK8qhWJ7QET2DXUmT74qvqEztx/Rozsf7xNVhPY=;
 b=QNlW6bmCpuhuwYHEHYgR1XD/1wxGj7e2zKRXVYVQvq/Tw1eT0zN19yZWenyKq1A7dn
 wmK6AZH0YcB3tY7f4CUmpODZKr/zbtIDcwtNKJAPmeE8DdpW6ZdAKIqcjpApOSoqsiRP
 9bWJwBQVndRip0ZzzOND27xel0KAUB/TtlzejfF+d29L55Z2ukfrtzYn5bv0XNWYhnsj
 +4WDKUszqdBBga8FlqPg+RcHGdmGJz+s6Yu8d4RuJZJcLM+0Forg6AdcT7SxyxLKosm2
 5HgtJZqbzBGG/AaRDgTIaNa1AJY/zUgmL802b2etKs6+WbHlMwWbKMEdZIhakJaTCVQo
 satw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pPs0EK8qhWJ7QET2DXUmT74qvqEztx/Rozsf7xNVhPY=;
 b=a09DCH+JO9/5SxUXbnROHJCx6svtbFq9vq0r6AbCFFobYKK35NrJa242sNc0hAYK0E
 +3rNb1fuunaZmKWLVxdDIJoRDfgcHp5vjPWZq2faqjMvvZLaCYdl0oeXEVoF20rvZ0b/
 EBlNIIqpJHnajnnzkb41AU9y35pyLuLPCnMcyUnOTZU8zIL4aWnYLhx4tQrUsCZyqlF7
 Ds+NvsaMZOaZQClgFzisp9eSe1K8uN3/WKDAVzE73SqlyOokPMTLdyLUF9kxIxJz+nEa
 6rQoObXIDnaE3rujI5pX5PkxVJeJzpDlI8xyJebQSZ/AvdZ+jQYdvdyyENKNcjEMkSHT
 UG+g==
X-Gm-Message-State: AOAM530wVd/zf90zL9nwQb1SXILNAYgDkSr6HKf7Aha471ozD4liK2Oq
 GmuH2InbZNOOXEI4Slu8K9wQsA==
X-Google-Smtp-Source: ABdhPJy4H80rg7isC+SSIOpnUG/0lRRSbGqkviiSsjcmV++nPf/N3JuIeplHtwOQii2UoYKryR43OQ==
X-Received: by 2002:a5d:52c1:: with SMTP id r1mr1441628wrv.294.1625222428373; 
 Fri, 02 Jul 2021 03:40:28 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p16sm2745810wrs.52.2021.07.02.03.40.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 03:40:28 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 10/11] hw/gpio/pl061: Document a shortcoming in our
 implementation
Date: Fri,  2 Jul 2021 11:40:17 +0100
Message-Id: <20210702104018.19881-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210702104018.19881-1-peter.maydell@linaro.org>
References: <20210702104018.19881-1-peter.maydell@linaro.org>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Maxim Uvarov <maxim.uvarov@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Luminary PL061s in the Stellaris LM3S9695 don't all have the same
reset value for GPIOPUR.  We can get away with not letting the board
configure the PUR reset value because we don't actually wire anything
up to the lines which should reset to pull-up.  Add a comment noting
this omission.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Not worth actually fixing, but I wanted a note since I spotted this
while I was reading the datasheet anyway.
---
 hw/gpio/pl061.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/gpio/pl061.c b/hw/gpio/pl061.c
index 8d12b2d6b97..2cb3a231b43 100644
--- a/hw/gpio/pl061.c
+++ b/hw/gpio/pl061.c
@@ -455,6 +455,15 @@ static void pl061_enter_reset(Object *obj, ResetType type)
     trace_pl061_reset(DEVICE(s)->canonical_path);
 
     /* reset values from PL061 TRM, Stellaris LM3S5P31 & LM3S8962 Data Sheet */
+
+    /*
+     * FIXME: For the LM3S6965, not all of the PL061 instances have the
+     * same reset values for GPIOPUR, GPIOAFSEL and GPIODEN, so in theory
+     * we should allow the board to configure these via properties.
+     * In practice, we don't wire anything up to the affected GPIO lines
+     * (PB7, PC0, PC1, PC2, PC3 -- they're used for JTAG), so we can
+     * get away with this inaccuracy.
+     */
     s->data = 0;
     s->old_in_data = 0;
     s->dir = 0;
-- 
2.20.1


