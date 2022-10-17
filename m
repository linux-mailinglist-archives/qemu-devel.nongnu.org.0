Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AAB600BCC
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 12:00:08 +0200 (CEST)
Received: from localhost ([::1]:39932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okMul-0002bN-JQ
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 06:00:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ake@igel.co.jp>) id 1okMRL-0004By-LU
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 05:29:48 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:39637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ake@igel.co.jp>) id 1okMRJ-0003Gk-Gk
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 05:29:43 -0400
Received: by mail-pf1-x436.google.com with SMTP id d10so10555416pfh.6
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 02:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AiU1P5KE0vTRZOpxAhPbihuQIEbzFgeR5GBVOIzn92g=;
 b=0I+wxWCFJlevcA9EfL9e71nv4+TY1Cts8eU3KTWfjqRinEX4eyg/SRxHTEsYBotkfd
 XeaS++1vy1Dz2up0Tkf68goK784kp+2396OO5bRTjPNU4K8+O4UfVH+jqwfABpI3X/Mw
 iwcIIgvW+yZZxE7MIsIPB1UNkLd+R9+V1BBv0SPphqLcLpLyVw8esJQsJCzjP2rNL+Lx
 LSvJa2bXjAAUl5w66s88kdmUUHQJsVLM5FBqXX1h0RmZFV6FO4elrQgxQVw+cpNAsfaO
 AyM+HqAtF2Bq7l24fK023tp79hAWKiuOSq5QnxH3ny1I+mrOgcF5DGiDBKGklB5TcsQf
 0W0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AiU1P5KE0vTRZOpxAhPbihuQIEbzFgeR5GBVOIzn92g=;
 b=oPeaaRy/BdxMGUguzQy45gwUg6QBcf5U4IOdmMpRwscHNtaUg0UQWesvxK9dgCnCoQ
 ItOSbxAkQGRCTRXuQMJGF7MDb0FBT7vDpus/tW1R456a5Svg7wRErsmgZOfJrWiXDYO5
 LuKFQh0fNPMAndvc6fKdazhk6PEq6/n3TwPyBZQMlxmDiM7pwScAIN02gtZUHw/gew88
 JMxKViwAdF9ooyD4PPi6PZxnyBWFPn+cpu9Z5uK7JoMhCfLZGcoW6Oazy2L9oP3yoMaH
 acon7E36umGdv3FQtxJUgTlzYJAv0LU6w8VUsO1yeBBfVE16BP69MGaE+DzsUE5JK2N6
 D7Ww==
X-Gm-Message-State: ACrzQf0potyugalFY1uMsRfpv9bQL1JB5jEkzllL+IZd9NiQUJN4DUFM
 ZUzdzbq0miOC9tOfVUwudZ/oAqctLncFvRD8
X-Google-Smtp-Source: AMsMyM5b4XLN3VJTv3Z4dvroFSDY1318YpRplBu17uIoZGPaxPYkvrNYFmYxddR9faSp/KtxdoErZw==
X-Received: by 2002:a63:ea4c:0:b0:46b:2772:40a4 with SMTP id
 l12-20020a63ea4c000000b0046b277240a4mr9865474pgk.342.1665998978782; 
 Mon, 17 Oct 2022 02:29:38 -0700 (PDT)
Received: from ake-x260.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id
 r26-20020aa7989a000000b00565d35cd658sm6503365pfl.217.2022.10.17.02.29.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 02:29:38 -0700 (PDT)
From: Ake Koomsin <ake@igel.co.jp>
To: qemu-devel@nongnu.org
Cc: Ake Koomsin <ake@igel.co.jp>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH] target/arm: honor HCR_E2H and HCR_TGE in arm_excp_unmasked()
Date: Mon, 17 Oct 2022 18:24:32 +0900
Message-Id: <20221017092432.546881-1-ake@igel.co.jp>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=ake@igel.co.jp; helo=mail-pf1-x436.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

An exception targeting EL2 from lower EL is actually maskable when
HCR_E2H and HCR_TGE are both set. This applies to both secure and
non-secure Security state.

Signed-off-by: Ake Koomsin <ake@igel.co.jp>
---
 target/arm/cpu.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 94ca6f163f..86d3377d3f 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -561,14 +561,24 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
     if ((target_el > cur_el) && (target_el != 1)) {
         /* Exceptions targeting a higher EL may not be maskable */
         if (arm_feature(env, ARM_FEATURE_AARCH64)) {
-            /*
-             * 64-bit masking rules are simple: exceptions to EL3
-             * can't be masked, and exceptions to EL2 can only be
-             * masked from Secure state. The HCR and SCR settings
-             * don't affect the masking logic, only the interrupt routing.
-             */
-            if (target_el == 3 || !secure || (env->cp15.scr_el3 & SCR_EEL2)) {
+            switch (target_el) {
+            case 2:
+                /*
+                 * According to ARM DDI 0487H.a, an interrupt can be masked
+                 * when HCR_E2H and HCR_TGE are both set regardless of the
+                 * current Security state. Note that We need to revisit this
+                 * part again once we need to support NMI.
+                 */
+                if ((hcr_el2 & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
+                        unmasked = true;
+                }
+                break;
+            case 3:
+                /* Interrupt cannot be masked when the target EL is 3 */
                 unmasked = true;
+                break;
+            default:
+                g_assert_not_reached();
             }
         } else {
             /*
-- 
2.25.1


