Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6D939A5B8
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 18:29:14 +0200 (CEST)
Received: from localhost ([::1]:35412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loqDZ-0003Mu-J3
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 12:29:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1loplA-00028C-En
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:52 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:53841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopl7-0007Ke-KU
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:52 -0400
Received: by mail-wm1-x32e.google.com with SMTP id h3so3717350wmq.3
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 08:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=30mcllybotT9ZUvdTQo+V2rYRwrN4iGSwp36CDv+3mQ=;
 b=CCfcSFZTAHO8albR41Cod11K51K6gLTJdUWQImjQXZJjDu8wJ+6BWeqECsOvyM/ZyV
 yKbXKAYhwTSDVg7PWSy+g6gcv6A9wKri+t7jcqL7QGDDc0dLm1ycFZqJCzr/2EEKggoD
 D5FgIK2g9Db1dMIw1WRQURQLzoAsrZQZ6OragXHEy0ktpkZA4JfFV9xj1x5RDfvYRLZb
 1nkNWyMg0eUpC/CWAK2t4/KXDC7AyCaaz8UKyolq0LAjMMPVs9LJg3LrgnoQMB4Knljr
 bsrfxd8mOZ6n/w1cpOS3mHfBwefDYQy7wxAuw1Io5thZ9+uOZx850IS0rCEsjcUXs8oQ
 Fh9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=30mcllybotT9ZUvdTQo+V2rYRwrN4iGSwp36CDv+3mQ=;
 b=anY2TdzYJgDzDAB//J56GV9Au4YrV3X3Wn1d2Aug9NActCpfTL15BoAejCt3cZMXlp
 /VhZEpuJYLRxcAyK/GiiFDWMlIeIUWbnoUKcIFzQALM6b6thV8fdTsox+fxx1msEG3sw
 Xn6XjaJceOHLXKjKd3VTpolDgcX0SnCMw0tZUuad+Zyv+043iz+B3Kv6FlOhPFEYqQ7m
 82Hpx0f7IDxWEVP0oB7CmxrdsxyN+vveOTVaWE997gOuYYWt7c/r1MwchVKjtm9r2JlT
 yC7aZrPIKqwydwYjbq9iVY3ZN/v8HctQ8SuhqWo+Mncu5o1/hAp8xlmqSUWVnCH0MvMf
 18bA==
X-Gm-Message-State: AOAM530Fz6HueKfoMG9KY0LRcw8+JCiL30PVv7UQqw3YFLmK+WJgoA9y
 /5UNNUVJrd24hdOElSf7rzYAl8d2QRWFv0vG
X-Google-Smtp-Source: ABdhPJwLpZtaRdSNoQlMhJvFQs1W27a1wM/B5Yk+o9PWsklO+fNeDvXY0TJ3JYyQD1xmfTM/6WjLAA==
X-Received: by 2002:a7b:cd9a:: with SMTP id y26mr11030967wmj.133.1622735988300; 
 Thu, 03 Jun 2021 08:59:48 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m7sm3856470wrv.35.2021.06.03.08.59.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 08:59:47 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 43/45] tests/qtest/pflash-cfi02-test: Avoid potential integer
 overflow
Date: Thu,  3 Jun 2021 16:59:02 +0100
Message-Id: <20210603155904.26021-44-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210603155904.26021-1-peter.maydell@linaro.org>
References: <20210603155904.26021-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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

Coverity points out that we calculate a 64-bit value using 32-bit
arithmetic; add the cast to force the multiply to be done as 64-bits.
(The overflow will never happen with the current test data.)

Fixes: Coverity CID 1432320
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Message-id: 20210525134458.6675-5-peter.maydell@linaro.org
---
 tests/qtest/pflash-cfi02-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/pflash-cfi02-test.c b/tests/qtest/pflash-cfi02-test.c
index 60db81a3a2b..6168edc821a 100644
--- a/tests/qtest/pflash-cfi02-test.c
+++ b/tests/qtest/pflash-cfi02-test.c
@@ -406,7 +406,7 @@ static void test_geometry(const void *opaque)
 
     for (int region = 0; region < nb_erase_regions; ++region) {
         for (uint32_t i = 0; i < c->nb_blocs[region]; ++i) {
-            uint64_t byte_addr = i * c->sector_len[region];
+            uint64_t byte_addr = (uint64_t)i * c->sector_len[region];
             g_assert_cmphex(flash_read(c, byte_addr), ==, bank_mask(c));
         }
     }
-- 
2.20.1


