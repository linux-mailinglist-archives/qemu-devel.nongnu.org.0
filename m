Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2923F5F7B24
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 18:03:01 +0200 (CEST)
Received: from localhost ([::1]:53286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogpoR-000857-Uv
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 12:03:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogpAq-00016s-Nb
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 11:22:08 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:51948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogpAo-0005l3-Mw
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 11:22:04 -0400
Received: by mail-pj1-x1030.google.com with SMTP id b15so4709656pje.1
 for <qemu-devel@nongnu.org>; Fri, 07 Oct 2022 08:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=g9B6N1pLHmw9apXhytCYAiivYvGiSWVPO4ktlKtyCTM=;
 b=lDVL8ItL1TpuExARtXb3iNNo3PvJeng7rsWBqj/S3Du6W9QV8iOY8RTrxbWIZGO0Ju
 w1zD9YJmLMYZT76Q9zlsjtkWJE7faF4zWqPThw4bgEJdW30C4dAg1HnbvzDgpY5m7esG
 GpcLlJgGvVCTLSSvAvW97ETgXwgBgnCvQfmTwaxqPsbu2GYtBgaYuV06PJJA0oL3I6HL
 ffEPfTyj4RPhelYrJimqm7FLSz2Vy5mec3LD4sAh31Q26Qf+7owhkCqy1XkVjId6k9sz
 PH94Yp7vnr6TuX4nBsvfvpbbXIcH1QMp6L3jYQlUd42o4pfPxmyXV9yN+qYyerhAXsK7
 6lhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g9B6N1pLHmw9apXhytCYAiivYvGiSWVPO4ktlKtyCTM=;
 b=rVbgHQx4LLNz39A3fLVFl5VBhXMXQPZZHoSiXIpU8bL11qNbB9hWB+5M6jKbqYBP6J
 rGEByTArzVUZC3dIGW19mrvz50byyqDCksWAXyde9WQam4yi5p4P+8OZNWRHTQ8KPLWP
 wyH3tN0u/QM02PuK7MAyoGxoPxdZxA8F+F0CfffxH3SS88Xa3JeGa2S34CEv+hL/ZJyL
 i76vxj9TaNzGiftapu8LaYQeH52Jb2/gd/y+zP8m28DE6cCiPL7Tlqb+6f8J79NpGZp+
 sJSfVvAC/30qa8M2DlssrYs6kPOjLqZY9KqdBfmzxvwMJQiXbqR3ln49v4DktTvfvoQR
 qdNA==
X-Gm-Message-State: ACrzQf3qj9yzQjTqM47Di6So32+Sui2GfdLNZqnM5ZI0SEIu5Wh+cKxR
 uItcJnxfchr86pA1vr+XwXrSufWo1snH6w==
X-Google-Smtp-Source: AMsMyM5MJL+FS+PxvhPKAMOrktRlJ6wXc3/KuTyXz2yv6w8H24MG0mjIy5G+6NMFZZ1RJav9VP0j0Q==
X-Received: by 2002:a17:903:4d4:b0:17f:7ecc:88e3 with SMTP id
 jm20-20020a17090304d400b0017f7ecc88e3mr5283578plb.169.1665156121054; 
 Fri, 07 Oct 2022 08:22:01 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:3b6c:3864:9643:140a])
 by smtp.gmail.com with ESMTPSA id
 h14-20020a170902f54e00b00179f370dbfasm1706318plf.26.2022.10.07.08.22.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Oct 2022 08:22:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PATCH] target/arm: Make the final stage1+2 write to secure be
 unconditional
Date: Fri,  7 Oct 2022 08:21:59 -0700
Message-Id: <20221007152159.1414065-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

While the stage2 call to get_phys_addr_lpae should never set
attrs.secure when given a non-secure input, it's just as easy
to make the final update to attrs.secure be unconditional and
false in the case of non-secure input.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---

Hi Peter,

This is the promised patch 1.5 for v3 FEAT_HAFDBS.  It generates minor
conflicts down the line, which I have already fixed up locally.  I think
the first one you would encounter is beyond the proposed 20 that you
indicated that you intend to take into target-arm.next right now.


r~

---
 target/arm/ptw.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index b8c494ad9f..7d763a5847 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2365,17 +2365,16 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
             result->cacheattrs = combine_cacheattrs(env, cacheattrs1,
                                                     result->cacheattrs);
 
-            /* Check if IPA translates to secure or non-secure PA space. */
-            if (is_secure) {
-                if (ipa_secure) {
-                    result->attrs.secure =
-                        !(env->cp15.vstcr_el2 & (VSTCR_SA | VSTCR_SW));
-                } else {
-                    result->attrs.secure =
-                        !((env->cp15.vtcr_el2 & (VTCR_NSA | VTCR_NSW))
-                        || (env->cp15.vstcr_el2 & (VSTCR_SA | VSTCR_SW)));
-                }
-            }
+            /*
+             * Check if IPA translates to secure or non-secure PA space.
+             * Note that VSTCR overrides VTCR and {N}SW overrides {N}SA.
+             */
+            result->attrs.secure =
+                (is_secure
+                 && !(env->cp15.vstcr_el2 & (VSTCR_SA | VSTCR_SW))
+                 && (ipa_secure
+                     || !(env->cp15.vtcr_el2 & (VTCR_NSA | VTCR_NSW))));
+
             return 0;
         } else {
             /*
-- 
2.34.1


