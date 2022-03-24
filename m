Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A51F4E5CA3
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 02:11:20 +0100 (CET)
Received: from localhost ([::1]:59294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXC0U-0008AQ-Mi
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 21:11:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nXByr-0007TZ-J8
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 21:09:37 -0400
Received: from [2607:f8b0:4864:20::435] (port=41521
 helo=mail-pf1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nXByp-0006Ne-Mg
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 21:09:37 -0400
Received: by mail-pf1-x435.google.com with SMTP id p8so2768683pfh.8
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 18:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=b0XKP2Ef+y53BYCyKyPTqHJgjZoQgNcIIQRNIQlhHOk=;
 b=nCLWiAndUMLOf6iYZz8g2ICfLrwOSgVcaHysSnav0I1r/lHeCCey7l2WWiP7Yj5NN7
 Z4MoCwV4KbNy5Aezqy+c1MLcNCZQ0acCz6sLnfhQ6MuCxv0vxq9KEVEUzVBcABc8yo/l
 vXT9ExSKPqmtUH4OfWP28gxE9JjUQfBprtESJ2v7jdHFXmC2adqVY4Zeky5HKBAaccCZ
 n/cmTEVFJmGuQsMS0xoe8C8JNLSHwMh4kUpSrbV0Z/jucwr16VAshHjEstKAKOsb0iNN
 nqiHoOSCdXU+bsEwJSn+JTiIlCqqnzxrbBCKmAuVTIvXfFCMICldcLVc4om3G/hQcQ9G
 Qqrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=b0XKP2Ef+y53BYCyKyPTqHJgjZoQgNcIIQRNIQlhHOk=;
 b=SWwAuQvJuOoS9h3nqTcpiIjNEMv4wiOyxbldp8T49OjQsOQHx6AgMlFXBe1GrdU7GR
 HFr5PIkDr2iPr97udT32VNaJx5muja5AJ67CZayMEFf/H/TG4HPLrVdOuL4PXshsHeH4
 I2UP7XBdGqBlIb470OZTPwkv+VwnVg6YFbe8gG1IVy31GhPzqxioLjdF4aBi0OLcG5cf
 VRV8PIFPNnaCvzulUv/Ul6KVlwugG2MDVMveJPLJt4XR9xHaKAWBopaK151gunZhc/KQ
 T3L5N9CmIAXMPlohQJE1eBAuvq6SBYO+hAgP4AfrWklK/JAjeNa/CgqMsWCe3YueYJSR
 /qwg==
X-Gm-Message-State: AOAM530yzBD/B9MYsjWABdY92bfwJ2ledACcR1gOD5/WdCnJgXEJJib0
 1BeYClAZZxIUAkFLTf2s4l0cDT8d6kNyCQ==
X-Google-Smtp-Source: ABdhPJz0RyoZ41slVjrkQhc/UQzTDpG9mG/idRxM/sqfph3VJYej9Pu2S1rnowKuuZmUGuxLkohSPg==
X-Received: by 2002:a63:443:0:b0:383:f97d:a16b with SMTP id
 64-20020a630443000000b00383f97da16bmr2040613pge.297.1648084174037; 
 Wed, 23 Mar 2022 18:09:34 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 d5-20020a056a0024c500b004fae56b2921sm1009532pfv.167.2022.03.23.18.09.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 18:09:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Fix sve_ld1_z and sve_st1_z vs MMIO
Date: Wed, 23 Mar 2022 18:09:32 -0700
Message-Id: <20220324010932.190428-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::435
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Both of these functions missed handling the TLB_MMIO flag
during the conversion to handle MTE.

Fixes: 10a85e2c8ab6 ("target/arm: Reuse sve_probe_page for gather loads")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/925
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve_helper.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 07be55b7e1..d45d088615 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -6734,7 +6734,11 @@ void sve_ld1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
                     if (mtedesc && arm_tlb_mte_tagged(&info.attrs)) {
                         mte_check(env, mtedesc, addr, retaddr);
                     }
-                    host_fn(&scratch, reg_off, info.host);
+                    if (unlikely(info.flags & TLB_MMIO)) {
+                        tlb_fn(env, &scratch, reg_off, addr, retaddr);
+                    } else {
+                        host_fn(&scratch, reg_off, info.host);
+                    }
                 } else {
                     /* Element crosses the page boundary. */
                     sve_probe_page(&info2, false, env, addr + in_page, 0,
@@ -7112,7 +7116,9 @@ void sve_st1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
                 if (likely(in_page >= msize)) {
                     sve_probe_page(&info, false, env, addr, 0, MMU_DATA_STORE,
                                    mmu_idx, retaddr);
-                    host[i] = info.host;
+                    if (!(info.flags & TLB_MMIO)) {
+                        host[i] = info.host;
+                    }
                 } else {
                     /*
                      * Element crosses the page boundary.
-- 
2.25.1


