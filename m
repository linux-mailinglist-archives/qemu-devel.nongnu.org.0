Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BFA39031C
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 15:52:49 +0200 (CEST)
Received: from localhost ([::1]:44262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llXUG-00044i-Gq
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 09:52:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llXMo-0008IJ-N4
 for qemu-devel@nongnu.org; Tue, 25 May 2021 09:45:06 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:53824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llXMn-0005q5-2L
 for qemu-devel@nongnu.org; Tue, 25 May 2021 09:45:06 -0400
Received: by mail-wm1-x335.google.com with SMTP id h3so4032799wmq.3
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 06:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ALgUBkaFcxFN/pGGcl4oQPNKi5KOQsKMi8EGZzJAvOo=;
 b=mydUfOiHfzfeabkzVGws0/zZfx5LMeRFxdW0uj086PRiMQa3xVhQoGcnn4ePtKELzg
 2G5PUAWUamtzDjgdSWgTaw6iEnDLsjk4nhxXu5UVt1HykuTKrce82ki3idKfpc5F36sd
 Sn6HneprBluUPClAf50zWz0kjWXtsOTmrzHPxJ2qVtSebhgcE3XKVJqt7u3odqNqPyUO
 jv4HZW0NKbx6blfgeLj/vgGauHFHTQL/qJj5SV2gSHdvdJc7TZVVcunxbDKuRTZSWqv4
 k1i3hm6fflHaj/sQnflb+OBP1hUTEfnsCVcXY1dnbPAQlhzGYlA1V9LkkcAUIOJNv503
 0HXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ALgUBkaFcxFN/pGGcl4oQPNKi5KOQsKMi8EGZzJAvOo=;
 b=tnIgmVvjegyF2sZyl5a+qjgyu/C2bx9M0K9du0Icn1Y9t8f/YmrLARnktqrYWRf1SP
 LQZgcA+pranSLLW50V49a8I3tavzrJSkqZ9GVJBmVduXwq+3fnXMe2inUsiy4cOnRFEL
 LSpLTXAiWV727bWoc8jyewrTfvEWASC4a7rNE6QkqH8m14xOMdd128EGUC1S0yYGNr4h
 hfJ3hbd+7UkZ0ATdC3R9/6Mzfmomtku1EeeMtzBGiFUTdRsgBpHg6A0Ny4xfOvI7UzTl
 0Ef4U5Z1DSVyqudDc7kkqslq2PoiGWHL28+nCwAZ0LIXqKKQ6UXc20K28AmBeU6IcPb0
 Cxag==
X-Gm-Message-State: AOAM53234zizY3QeavKTBcLVN9WchSjqGU82I2XuBHQ7/nOmgFUOW8pC
 diZ4jwHb9+T20DgO1+v7UrU/5FRnRM3XuyIN
X-Google-Smtp-Source: ABdhPJxn2VhpudxAtv/VUJwXXFUnKt0rTeHvzy0aNSoYLKZ5+LoT6+OKA9hDVBaFnVuzg7fi5jnyNg==
X-Received: by 2002:a7b:cb85:: with SMTP id m5mr4036075wmi.118.1621950303737; 
 Tue, 25 May 2021 06:45:03 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id t7sm15794460wrs.87.2021.05.25.06.45.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 06:45:03 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/6] tests/qtest/pflash-cfi02-test: Avoid potential integer
 overflow
Date: Tue, 25 May 2021 14:44:56 +0100
Message-Id: <20210525134458.6675-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525134458.6675-1-peter.maydell@linaro.org>
References: <20210525134458.6675-1-peter.maydell@linaro.org>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Coverity points out that we calculate a 64-bit value using 32-bit
arithmetic; add the cast to force the multiply to be done as 64-bits.
(The overflow will never happen with the current test data.)

Fixes: Coverity CID 1432320
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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


