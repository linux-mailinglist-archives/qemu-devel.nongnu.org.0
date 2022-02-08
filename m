Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 416414ADA1E
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 14:39:25 +0100 (CET)
Received: from localhost ([::1]:57998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHQiJ-000070-Ti
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 08:39:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOqm-0000ia-RL
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:02 -0500
Received: from [2a00:1450:4864:20::42f] (port=36465
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOqh-00023U-17
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:39:58 -0500
Received: by mail-wr1-x42f.google.com with SMTP id i15so7777448wrb.3
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 03:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=/mqhqQhQLs9hWhzKkqqLGUYC8DmGhSXzHDhfqr5RRB8=;
 b=a0vPkImern1yWjt4RQVIzKl39vWu1Hdyhh3lWxzgISMhTak2vJOOqN2ODQtZBpFKMs
 weW96TugfROeSPZUW53/DT/a602upcR90OYow8WQQ8ft6KhuDCwm1XxgL6oAAmt9z7uE
 2cCiVdaxmVOOxMky7ov9BV1HOP0vYp9Qg1OeHL8IZvcS172Xa6MkN5SmkDEP1LZKdUYZ
 2Vfxy+HzEMT8m9Rj6emwBglbr29cM9MVCa1II822sQBWSj8G92f1QtY0lDN3tM+MAhDd
 9Rs4V2XAGOYGVByW8IHr9xE4WRCdK0ku4utup+OY2LQFg3yvfHCX38L+Wwi+yvF0mR3e
 0tMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/mqhqQhQLs9hWhzKkqqLGUYC8DmGhSXzHDhfqr5RRB8=;
 b=mXDEvDb9ERmeAKG0jcy0A9GootHlxYhqqq0QU/mKwFsccU/btxwton3VUqZWTyJ57/
 bBDEmJB08xyOZT0wnPGKKKhAIOPSIGiQXIjC8JgAJLaBuS1E6ew/a4UBA3zxOHhS/BFo
 vVyW328LdQmvP2cDlW8E0oK6gHXDTY/JAxj+PeqUNQz8oPfxrmI62X/hbTP2nC49iRZ+
 flVIUauEr2qT6D++X5dSSGpeb9/ntquKCjKzXIYEIWPVUdjK1cUNR10eMQpNavyvv3nv
 rpQWGCAfZLCy6HnNXuRSXWt9nL+l58o1V+7gdJcMs2c2Kinh+CyJiGwMnT0fzja8jnDp
 gNNw==
X-Gm-Message-State: AOAM530oam9QPypY1RKOAcdgsuddF2KcdkhkK9PYNrqXwrFH00DPodk5
 CvEUHpIaIpSYMLABADQVI9/N0r9R9T9/eQ==
X-Google-Smtp-Source: ABdhPJwuDeYEIHZksHR0nxNcHiv8U2ezamzF7nGekiBK2+k8t3GqHrefgm7NfnFRIWroknvDe8q0Qw==
X-Received: by 2002:adf:d849:: with SMTP id k9mr3156209wrl.366.1644320391242; 
 Tue, 08 Feb 2022 03:39:51 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id r11sm4245199wrt.28.2022.02.08.03.39.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 03:39:50 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/39] target/arm: Fix sve_zcr_len_for_el for VHE mode running
Date: Tue,  8 Feb 2022 11:39:10 +0000
Message-Id: <20220208113948.3217356-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208113948.3217356-1-peter.maydell@linaro.org>
References: <20220208113948.3217356-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

From: Richard Henderson <richard.henderson@linaro.org>

When HCR_EL2.{E2H,TGE} == '11', ZCR_EL1 is unused.

Reported-by: Zenghui Yu <yuzenghui@huawei.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Zenghui Yu <yuzenghui@huawei.com>
Message-id: 20220127063428.30212-2-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 6dd241fbef3..649958a727d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6225,7 +6225,8 @@ uint32_t sve_zcr_len_for_el(CPUARMState *env, int el)
     ARMCPU *cpu = env_archcpu(env);
     uint32_t zcr_len = cpu->sve_max_vq - 1;
 
-    if (el <= 1) {
+    if (el <= 1 &&
+        (arm_hcr_el2_eff(env) & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
         zcr_len = MIN(zcr_len, 0xf & (uint32_t)env->vfp.zcr_el[1]);
     }
     if (el <= 2 && arm_feature(env, ARM_FEATURE_EL2)) {
-- 
2.25.1


