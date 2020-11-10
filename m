Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C84422AD4E2
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 12:28:24 +0100 (CET)
Received: from localhost ([::1]:46070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcRp1-0004Cl-Om
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 06:28:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcRga-0002JR-Ul
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:19:41 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:44781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcRgZ-0006sY-3C
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:19:40 -0500
Received: by mail-wr1-x42e.google.com with SMTP id c17so12241595wrc.11
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 03:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=quh1kPWjY4PNiOnUCa5MfOHlEbZgNdPUy0Qv8wRDzi8=;
 b=rSrDJOjs9KUEA3yrix9kh6N06M6VGrE0YPFgVCZUTxq2oGT0Gk3DKGo7y/IEXPPVWh
 +bHzFK3687+VVQd9KXU9cACCsdp/DIqqzKPoUZztGSXwL4aVwlIT/OjJlqF1nqD3CTLE
 O+dzBiM1ID0FtBT6PMpxg3Q8+UoNKa4PehUI00qexCVA2sLNCTINakvf4TDNyNq0sL2g
 gXLZs9skqYYx0VnDUoiGIwVoK3y/34annbiUwi7TKnSzhwMp7s+t9IE96lRvpo0t7j9d
 emzSWAUztIu7De05MpHiCVOXOrwtm/on4Isjc9KbwCt8jG0XJWSobDYAL7AyzUvazMq9
 iDpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=quh1kPWjY4PNiOnUCa5MfOHlEbZgNdPUy0Qv8wRDzi8=;
 b=HXNrR1DWMi6P+FcZ+MGlBJjOOkDfP9n201+LV3Od82+ziVQHsMxUK7bfsgCyOmLmvZ
 4S/OQj9ab1gErgNoeePEB9s9YwRs4R62soShMwAQ1racETcXwfeCxLzHQQJAQdeRHeqX
 aqH7dda2fL3M6S2R/HbzFFGHFUTjQ0Kaxkl/xMqCkih29Rd41ajBbCOO4nJf4+RY56sl
 ppuVicuuilgb7TnJjBxZpZFzEaevtGQUzpQLyiLxrXvqeE5Su63EffIuJfo5YEFO3WRI
 UjEys0OjqDs1+qPWjUhImCqe4Nij0GXERHPC+fCzha/khl5d1R++irjodUm8/4Qx6teB
 cQ1g==
X-Gm-Message-State: AOAM533x2p4yvZJoWiDOxqOyqTsNuk3oavwfKS5TXrC6SjbtN3cSFcaS
 qtIId0Dsi8CiTZkp8vKwaIJW4xwlbA3+8A==
X-Google-Smtp-Source: ABdhPJxufAsqMjATA2MsP1uZVcHzdG7aXiI9VEnVTtdt6aJgMfh2kr73lK8JNkTuvU/XORhu4/j/ng==
X-Received: by 2002:a5d:4fc1:: with SMTP id h1mr22995484wrw.226.1605007177208; 
 Tue, 10 Nov 2020 03:19:37 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 109sm16909498wra.29.2020.11.10.03.19.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 03:19:36 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/16] tests/qtest/npcm7xx_rng-test: count runs properly
Date: Tue, 10 Nov 2020 11:19:16 +0000
Message-Id: <20201110111917.29539-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201110111917.29539-1-peter.maydell@linaro.org>
References: <20201110111917.29539-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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

From: Havard Skinnemoen <hskinnemoen@google.com>

The number of runs is equal to the number of 0-1 and 1-0 transitions,
plus one. Currently, it's counting the number of times these transitions
do _not_ happen, plus one.

Source:
https://nvlpubs.nist.gov/nistpubs/Legacy/SP/nistspecialpublication800-22r1a.pdf
section 2.3.4 point (3).

Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
Message-id: 20201103011457.2959989-2-hskinnemoen@google.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/qtest/npcm7xx_rng-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/npcm7xx_rng-test.c b/tests/qtest/npcm7xx_rng-test.c
index e7cde85fbbc..c614968ffcd 100644
--- a/tests/qtest/npcm7xx_rng-test.c
+++ b/tests/qtest/npcm7xx_rng-test.c
@@ -126,7 +126,7 @@ static double calc_runs_p(const unsigned long *buf, unsigned int nr_bits)
     pi = (double)nr_ones / nr_bits;
 
     for (k = 0; k < nr_bits - 1; k++) {
-        vn_obs += !(test_bit(k, buf) ^ test_bit(k + 1, buf));
+        vn_obs += (test_bit(k, buf) ^ test_bit(k + 1, buf));
     }
     vn_obs += 1;
 
-- 
2.20.1


