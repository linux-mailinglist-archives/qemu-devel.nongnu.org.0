Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A036159C38D
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 17:59:01 +0200 (CEST)
Received: from localhost ([::1]:57798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ9pM-0000Ah-Pd
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 11:59:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9LS-0007mv-TG
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:28:06 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:44770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9LK-0000jl-FL
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:28:06 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 r15-20020a17090a1bcf00b001fabf42a11cso11649835pjr.3
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=SMbOfNjA07XEkQhhsLqoAxwBL+AS6vzLDZt69vTOMCc=;
 b=y3gNImoSdCwStRufdXqqyxKcmhSASmalR28HV59f04Z/K54PkxhRapmiYCMz8uEUWP
 UomGuP92hkEYfn26/6/RPoZWrX8MXkAJUMYVt8+wGnelO5Pz6IvpXyL7IMhIvWe7l7ch
 n3k0uas44pj/gJe5aTgxvPREVX+W2/++bbAqkXVFAi55QSVe1mTKLEIVI6eXRBBCBERu
 OSfdWK0ldzHQwjdosoedTAKRytRofQGHxE6acGKCgZAXHg4tKDkO2bn8qfly/77AaVsU
 j5eLzKFW1+mHcbigDJhjwntS3CCXvA1UgPLYGriwXtCGLJnRbLtZr1YBDfVdCYDsgPBB
 GURQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=SMbOfNjA07XEkQhhsLqoAxwBL+AS6vzLDZt69vTOMCc=;
 b=RlJow8kU3may4/5BzFzf5X2A8I+dMSswziGx6RZL00ifQUiNCdAdYE3/Caf2tfCbv+
 wsziwsfX4KlvzNRiwsc/Og0PdxTXIV4kb4jkmSQTO1103QxQHbIYj7EDlad+HzRnegEX
 a+U4zY2EKhteE8Vj3EJX2G2z1u0zys+byedTfeaBBD36fzMcZlHiL863liTM1lep+30p
 K0WzJnOJwY/XE6nDwEXNvNaJHEPCyDTn/38MwATW1HIo9jMTHGv8oQQ7tQnT+p2qK4dz
 CbAbVURz3aQ9LNcxEcoSR6Up2K982jCITPOClYWvVVVturToOn9J1sNJVNOOyOHiTjhQ
 uCcA==
X-Gm-Message-State: ACgBeo2DemtQPAi5dfUjLIOkFS25NBmZZ2AksVoQYw3ES99lXG4oe4fO
 0DPGl9DLi9dRKbdcDVS8TJW4aL9w6JB2UA==
X-Google-Smtp-Source: AA6agR6rfxTm8r6DnIlseDV9ZBQ5q9MeDpMty/nLaQqSz0XIF/rHrM/B0AirGheWhM8Jq7uEGTpu1g==
X-Received: by 2002:a17:902:e8d8:b0:172:7e6b:c8ec with SMTP id
 v24-20020a170902e8d800b001727e6bc8ecmr20494695plg.171.1661182077204; 
 Mon, 22 Aug 2022 08:27:57 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.27.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:27:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 18/66] target/arm: Add secure parameter to
 get_phys_addr_pmsav7
Date: Mon, 22 Aug 2022 08:26:53 -0700
Message-Id: <20220822152741.1617527-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Remove the use of regime_is_secure from get_phys_addr_pmsav7,
using the new parameter instead.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index e95fd6b0d9..224ba09ecd 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1510,12 +1510,11 @@ static bool pmsav7_use_background_region(ARMCPU *cpu, ARMMMUIdx mmu_idx,
 
 static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
                                  MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                                 GetPhysAddrResult *result,
+                                 bool secure, GetPhysAddrResult *result,
                                  ARMMMUFaultInfo *fi)
 {
     ARMCPU *cpu = env_archcpu(env);
     int n;
-    bool secure = regime_is_secure(env, mmu_idx);
     bool is_user = regime_is_user(env, mmu_idx);
 
     result->phys = address;
@@ -2414,7 +2413,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
         } else if (arm_feature(env, ARM_FEATURE_V7)) {
             /* PMSAv7 */
             ret = get_phys_addr_pmsav7(env, address, access_type, mmu_idx,
-                                       result, fi);
+                                       is_secure, result, fi);
         } else {
             /* Pre-v7 MPU */
             ret = get_phys_addr_pmsav5(env, address, access_type, mmu_idx,
-- 
2.34.1


