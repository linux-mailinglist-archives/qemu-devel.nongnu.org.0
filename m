Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6C45E68D0
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 18:52:28 +0200 (CEST)
Received: from localhost ([::1]:37014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obPR4-0000yr-Fe
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 12:52:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPAs-00029p-QX
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:35:47 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:39869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPAq-0005Nu-NB
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:35:42 -0400
Received: by mail-wr1-x431.google.com with SMTP id cc5so16439607wrb.6
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 09:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=SJ1E1DN8UXVJBqdhqjrjiz3vYmJMmUFOalTcFegGjrQ=;
 b=axmsrd1dZZ8nN7yQ40caBOXFi7R+ZrgCi0oTF1SBQ9xmRxtJJxtmGNYQAgq7kxlTeN
 IMXPCLCr8FSxn46g9BI1iKOTNQm4x/a4YoJ5rD7Tvhwd/WZQ1g5Iz6WKOO3MZaeh6Lxh
 ZV0AFv64ADo0gmppyoYokL7rVB3a9l5GO/2fFzqam8B7QjD79ruwPaQKruXaVIBG+gsm
 8Wzyw6VWtpvYZ2rglJzdsCIRyqPkl+GgyRjB9W3n/jPvUMJ1IeMcwe6MlcIz47o8t3Fe
 fyZi8029Z3nczwwNUak7t+4KjWdpb/lASJF6glI91jMpbZfkcbAzcd6eWwvzocodnHu/
 pweQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=SJ1E1DN8UXVJBqdhqjrjiz3vYmJMmUFOalTcFegGjrQ=;
 b=5Em8D9GwOu/sLVKKPzjDgX2kbnzDFMSWjibMowoQsarS1cYAqi5ahA6K2PppEmCVLg
 Gi8BCpqLzGLc+bgeXh3mlCGJJNjSpxVzBeFDlVTEEdKU2sm/BYh9TDgaqIfhXUZHyp1i
 zxObjf1a90NmFKs2Y+6dFBRj7a//YzgfgTIExu1cm1Xkni+6ALJXKX+PZk7gIrHUgpGK
 kN6M36ndFhN3tKVHIG2SWdpYxMci8ERW3vbK8HsivUv0ueGnYPGU6+zxQtWMZzrVSFw0
 NQMekzAFb+9KE+bNV9pjaU7kZSYzZdEmLYTst2nQF7Pbf10RDGZkmAZ2k9vf8wBKeL+G
 PrVA==
X-Gm-Message-State: ACrzQf07DAcmWdmJa6AVbbKaV+EGWHzCEOIoJQq3rrLHf8yn2aLrObi8
 bR3MYJ1/UZvMJ1IXtoTRudLZBkCmpOse9w==
X-Google-Smtp-Source: AMsMyM45OjRYrimcjqPX4GrkUR2u35y0RFktCIsq2PwJj+xry4ELt+1s9GUr1FNby3MK9jQ6Ee/6Qg==
X-Received: by 2002:adf:a50e:0:b0:22a:ede1:57e with SMTP id
 i14-20020adfa50e000000b0022aede1057emr2541427wrb.63.1663864539317; 
 Thu, 22 Sep 2022 09:35:39 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 iw1-20020a05600c54c100b003b3401f1e24sm6452599wmb.28.2022.09.22.09.35.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 09:35:39 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/39] target/arm: Fix alignment for VLD4.32
Date: Thu, 22 Sep 2022 17:34:59 +0100
Message-Id: <20220922163536.1096175-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220922163536.1096175-1-peter.maydell@linaro.org>
References: <20220922163536.1096175-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Clément Chigot <chigot@adacore.com>

When requested, the alignment for VLD4.32 is 8 and not 16.

See ARM documentation about VLD4 encoding:
    ebytes = 1 << UInt(size);
    if size == '10' then
        alignment = if a == '0' then 1 else 8;
    else
        alignment = if a == '0' then 1 else 4*ebytes;

Signed-off-by: Clément Chigot <chigot@adacore.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220914105058.2787404-1-chigot@adacore.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-neon.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/arm/translate-neon.c b/target/arm/translate-neon.c
index 321c17e2c7e..4016339d46f 100644
--- a/target/arm/translate-neon.c
+++ b/target/arm/translate-neon.c
@@ -584,7 +584,11 @@ static bool trans_VLD_all_lanes(DisasContext *s, arg_VLD_all_lanes *a)
         case 3:
             return false;
         case 4:
-            align = pow2_align(size + 2);
+            if (size == 2) {
+                align = pow2_align(3);
+            } else {
+                align = pow2_align(size + 2);
+            }
             break;
         default:
             g_assert_not_reached();
-- 
2.25.1


