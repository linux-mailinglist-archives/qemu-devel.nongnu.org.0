Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F73677C98
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 14:36:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJwzv-000669-QR; Mon, 23 Jan 2023 08:36:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJwzS-0005v4-A0
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 08:36:07 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJwzP-0002Lo-Q3
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 08:36:02 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 f12-20020a7bc8cc000000b003daf6b2f9b9so10606339wml.3
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 05:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=baS6RwiqJNceR0oUd3JGQ4ePjOLEDMiL7ZbUGHl6dos=;
 b=Tv+4vSouO/lxvncrcG2hxr3tqLXJE/K3HXmeVFPvtutpjqCoV1mbBfb2C7MhpVDU+7
 voTLEADPeFHgVH0inQ2Id/4+XlYnfMQIKx3jlbMdYD1F8ZoXS9KCmN5AfP9N/Fwgi14M
 CNWEQTYhqkM176Y4iZVAAwNRY2JwF29UtGvuNs4+J1QvTz7Uq5u5WKy26oajKG6qGS8i
 ZzghEx1Qly3cAMOFiJS9wSu09w1jsrhjM6zFB21HrrG2BWS/+q7DrWEBWsd7f4tkSstz
 n4+aEK7Vq6lmoi3uK1ncvhHIjkxGydJ4GePpPuCF1f2bbN4gf1ccdKmjPuuvKfr9UC8D
 DrTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=baS6RwiqJNceR0oUd3JGQ4ePjOLEDMiL7ZbUGHl6dos=;
 b=Oz+xqtkp3aQDskSV+wlEJycr0yHYmPgttIbRf0nNpqaw5ybTtBtejRYHToTF1XykSb
 OtFQxku9fap2H/c24XNrOkl+GrEqwZW2g/8U6CAoNHcH41KyFfuhTh2Btb6XSmYX7C5T
 EMjLOzXzXxEgnr6fuINvvpoStVkYhu6vMKUuq8wyjXlffdY0h3BdR2FMY1KgzifPCZp9
 KkS8eJYDhRCtnfJ9QSm7o9j+lhLwjp8BPKv9sUPn/fNjcvgQcTM0C/aQG6oajN0igAYb
 nPFLAegEXXEgnlXNeSTB+eQGSMbk8vzSVwi6ddlyK8N9BujgbW9Ay7PI93kA2gSiKKX1
 rhZQ==
X-Gm-Message-State: AFqh2kpFRE6GL/sVwXOilYxA0u46H9VdwUVEc51cHtKWLeQHMy7z0K6U
 LqRuMw/+68TaCroxdsywkun/FUhx3IhTV+eW
X-Google-Smtp-Source: AMrXdXsvxfR90fAQyh8EYeBuTTKQHFax0LeSA4wmmmK0GBccJ3y+PywSqKkRz1UD3FANOGG0yp2CJw==
X-Received: by 2002:a05:600c:1c01:b0:3da:fc07:5e80 with SMTP id
 j1-20020a05600c1c0100b003dafc075e80mr26768238wms.12.1674480958099; 
 Mon, 23 Jan 2023 05:35:58 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d19-20020a05600c34d300b003a6125562e1sm10817457wmq.46.2023.01.23.05.35.57
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 05:35:57 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/26] target/arm: Unify checking for M Main Extension in
 MRS/MSR
Date: Mon, 23 Jan 2023 13:35:29 +0000
Message-Id: <20230123133553.2171158-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123133553.2171158-1-peter.maydell@linaro.org>
References: <20230123133553.2171158-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: David Reiss <dreiss@meta.com>

BASEPRI, FAULTMASK, and their _NS equivalents only exist on devices with
the Main Extension.  However, the MRS instruction did not check this,
and the MSR instruction handled it inconsistently (warning BASEPRI, but
silently ignoring writes to BASEPRI_NS).  Unify this behavior and always
warn when reading or writing any of these registers if the extension is
not present.

Signed-off-by: David Reiss <dreiss@meta.com>
Message-id: 167330628518.10497.13100425787268927786-0@git.sr.ht
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/m_helper.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 033a4d92614..d87b9ecd123 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -2465,11 +2465,17 @@ uint32_t HELPER(v7m_mrs)(CPUARMState *env, uint32_t reg)
             }
             return env->v7m.primask[M_REG_NS];
         case 0x91: /* BASEPRI_NS */
+            if (!arm_feature(env, ARM_FEATURE_M_MAIN)) {
+                goto bad_reg;
+            }
             if (!env->v7m.secure) {
                 return 0;
             }
             return env->v7m.basepri[M_REG_NS];
         case 0x93: /* FAULTMASK_NS */
+            if (!arm_feature(env, ARM_FEATURE_M_MAIN)) {
+                goto bad_reg;
+            }
             if (!env->v7m.secure) {
                 return 0;
             }
@@ -2515,8 +2521,14 @@ uint32_t HELPER(v7m_mrs)(CPUARMState *env, uint32_t reg)
         return env->v7m.primask[env->v7m.secure];
     case 17: /* BASEPRI */
     case 18: /* BASEPRI_MAX */
+        if (!arm_feature(env, ARM_FEATURE_M_MAIN)) {
+            goto bad_reg;
+        }
         return env->v7m.basepri[env->v7m.secure];
     case 19: /* FAULTMASK */
+        if (!arm_feature(env, ARM_FEATURE_M_MAIN)) {
+            goto bad_reg;
+        }
         return env->v7m.faultmask[env->v7m.secure];
     default:
     bad_reg:
@@ -2581,13 +2593,19 @@ void HELPER(v7m_msr)(CPUARMState *env, uint32_t maskreg, uint32_t val)
             env->v7m.primask[M_REG_NS] = val & 1;
             return;
         case 0x91: /* BASEPRI_NS */
-            if (!env->v7m.secure || !arm_feature(env, ARM_FEATURE_M_MAIN)) {
+            if (!arm_feature(env, ARM_FEATURE_M_MAIN)) {
+                goto bad_reg;
+            }
+            if (!env->v7m.secure) {
                 return;
             }
             env->v7m.basepri[M_REG_NS] = val & 0xff;
             return;
         case 0x93: /* FAULTMASK_NS */
-            if (!env->v7m.secure || !arm_feature(env, ARM_FEATURE_M_MAIN)) {
+            if (!arm_feature(env, ARM_FEATURE_M_MAIN)) {
+                goto bad_reg;
+            }
+            if (!env->v7m.secure) {
                 return;
             }
             env->v7m.faultmask[M_REG_NS] = val & 1;
-- 
2.34.1


