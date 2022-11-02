Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A4B615BF8
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 06:48:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oq6at-0004vX-VI; Wed, 02 Nov 2022 01:47:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oq6aq-0004uh-Qm
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 01:47:16 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oq6ap-0005cn-4N
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 01:47:16 -0400
Received: by mail-pl1-x635.google.com with SMTP id g24so15588458plq.3
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 22:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ULAXwT5VzMBCI1KaQ06N0fdiq7JAkC5SfEaYbtxC2vU=;
 b=ftojNHF4D2Wc5nS1vAhXS5sk7n3+11OEqnSv7aentEeNDQOCpx9YRlniXw80ynRNE1
 A8YAdozQitcVCfyoKUNgd2r+napGsCv0sK311aS4Sg5pniSyghu5pWDlJzcdotLxzBJ6
 +A+nqSZIlFBlETt5EDF4jD4heudDri4fhb8LTyLcgVTB+j9ndeF/nFafejfFMMgAAuJQ
 /qFUTZ+SVJD8WCfn2dveOKRKrC4ZLLl7U5qYK/H32av3TJ7yLKmIyPTqjPBSBsNarJKf
 ewG+r5ZsEEnkAHWxLS/jKdOINfz7AwKL8L89G2PIoY6cEmumTnffNxYykdZcOSleQvcO
 snIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ULAXwT5VzMBCI1KaQ06N0fdiq7JAkC5SfEaYbtxC2vU=;
 b=bHrAFce5VgxH90dr+kb7s/iZJsbchMo7WUTmSqP3l0LeuWI3HAdX7quQgW0ooUI20/
 GT5OBTtxH1Yoa17//IcOUMmqQ394tb5czA4J29CQHaz+JzeIoRmxSPkNv6CXexyP2NhE
 mg3q8M7XNKRljxhYO0bANomhz2fcuc4n2j0rlt19bHQntPcv7ZAUts7QMMx1v8RT1trK
 Ijt9QPcFAimPg2cj0C9UDr3Jx8gejpgrYsq2XKL5IKmwktNn7i72W7T4eJgvSEvSik9V
 8M7/Hce6VDGzDxBmtFKeCUzMQJ3TzYpqzLjyYDlyKZyU0kWcq3dDXaiIBoMTlV/N+yrY
 Dugg==
X-Gm-Message-State: ACrzQf247vrA2+7dz5fv2R1ANC44V/VJNvLDz03OoWwF/W62Yt/CREXO
 HXFmGOHB5ZBTL4oc1K+7wqz8bHXzHBZu9WtE
X-Google-Smtp-Source: AMsMyM52rls6aCI2XfdGgW9JCTkW/5PCmo3kt/bQNAPJ1KHFnvDEgKZ3IszmG00H4vx7YAdppKNvYA==
X-Received: by 2002:a17:902:ccc2:b0:178:29e1:899e with SMTP id
 z2-20020a170902ccc200b0017829e1899emr22802065ple.114.1667368033464; 
 Tue, 01 Nov 2022 22:47:13 -0700 (PDT)
Received: from stoup.. (mur1374950.lnk.telstra.net. [139.130.176.43])
 by smtp.gmail.com with ESMTPSA id
 x5-20020a17090a788500b0020ad53b5883sm551575pjk.14.2022.11.01.22.47.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 22:47:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org,
	qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH] target/arm: Two fixes for secure ptw
Date: Wed,  2 Nov 2022 16:47:06 +1100
Message-Id: <20221102054706.1015830-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Reversed the sense of non-secure in get_phys_addr_lpae,
and failed to initialize attrs.secure for ARMMMUIdx_Phys_S.

Fixes: 48da29e4 ("target/arm: Add ptw_idx to S1Translate")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1293
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 58a7bbda50..df3573f150 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1357,7 +1357,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     descaddr |= (address >> (stride * (4 - level))) & indexmask;
     descaddr &= ~7ULL;
     nstable = extract32(tableattrs, 4, 1);
-    if (!nstable) {
+    if (nstable) {
         /*
          * Stage2_S -> Stage2 or Phys_S -> Phys_NS
          * Assert that the non-secure idx are even, and relative order.
@@ -2671,6 +2671,13 @@ static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
     bool is_secure = ptw->in_secure;
     ARMMMUIdx s1_mmu_idx;
 
+    /*
+     * The page table entries may downgrade secure to non-secure, but
+     * cannot upgrade an non-secure translation regime's attributes
+     * to secure.
+     */
+    result->f.attrs.secure = is_secure;
+
     switch (mmu_idx) {
     case ARMMMUIdx_Phys_S:
     case ARMMMUIdx_Phys_NS:
@@ -2712,12 +2719,6 @@ static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
         break;
     }
 
-    /*
-     * The page table entries may downgrade secure to non-secure, but
-     * cannot upgrade an non-secure translation regime's attributes
-     * to secure.
-     */
-    result->f.attrs.secure = is_secure;
     result->f.attrs.user = regime_is_user(env, mmu_idx);
 
     /*
-- 
2.34.1


