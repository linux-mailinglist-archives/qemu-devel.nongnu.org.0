Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 831924E7591
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 16:01:06 +0100 (CET)
Received: from localhost ([::1]:46458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXlR3-000721-Jg
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 11:01:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nXlNb-0004s4-N7
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 10:57:31 -0400
Received: from [2a00:1450:4864:20::333] (port=53861
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nXlNa-0004D5-1Q
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 10:57:31 -0400
Received: by mail-wm1-x333.google.com with SMTP id p189so4605155wmp.3
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 07:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=TWtmfgvwYkUX9wcjAyTXXtbd5s1CzMoUdTQHNvNTkV0=;
 b=rt7SQHtn5jkymSs/aVCTYbI4/EyyvxWwpCgO2Mb4bqdgxCorMSWaTMFcXvm1ZiTXkv
 ldcFZlvPGZLrG0pi4d/vDfGgAT6SiX2DRZx95X0EYaAW06Gy4Dh3Ms0lu4koRaizCEDk
 D10Ouk/GgpS1UWNbVu+WQAoPyVa0W0WEFTigK4JyDyKHnhp9gHIyegBpGITMGFInSdk9
 DrTm6oypNtypGzAank0jZDCtJI3gre+GRHJz7GmQibuNNG8ONrazvk32fsKEDyrYmPLu
 BMmjwCNhw6n0nm/N7Dt2qBR6C1NTaTQ/SzS56Ve5KxfcsBu7OJKEs0Ly2bc7npwID7jO
 bYtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TWtmfgvwYkUX9wcjAyTXXtbd5s1CzMoUdTQHNvNTkV0=;
 b=J0tVNlaoqcdx2FtNPaxpDy6TPv0GauCiwohzYJ+Bop7L31EL4/3YQE+sTPkleoTzYw
 O9N93ucevX1IQlH3/aYCWOWa/vRR1e9qt+nsH3BEWIZ3rd0eeF+1f0Ps5gjaOqRDKl5N
 l5cps8CXZ3C/mGGQ2HRo7CyKF/4XSYYqKhtt5dkts0j7a8WINyWTmh0Ex6NnbmQv1pMH
 WH45hMOGSqnbXnX2175ia9RzOE4C457FUkPZ/6MIywnYUDG5iMxscpkEVinIjwpo14O1
 fffqUl7dVWLgVAGFEeZvUzNphg9k2LY+1q5TsYtfPL+fO1BuaysNavrcUqw/i7nyqsMI
 MgNQ==
X-Gm-Message-State: AOAM532H7nY9qs+BEYykPpGBRiRLbCcd5r1gtf/6vmriHu4CHLY1r4o1
 iDQVUbP/UlhDSTLNf8fbdSdbXVOJfcqejQ==
X-Google-Smtp-Source: ABdhPJwXLGP8hzyRoBZkzB26ZMfknEaTucbyT3FAc7BFPiqDU7300Xc7AFr1BEtHr73BEDAE04EcuQ==
X-Received: by 2002:a1c:3bd5:0:b0:38c:9b9f:1b24 with SMTP id
 i204-20020a1c3bd5000000b0038c9b9f1b24mr19883235wma.129.1648220248502; 
 Fri, 25 Mar 2022 07:57:28 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c7-20020a5d4f07000000b00203db8f13c6sm5200583wru.75.2022.03.25.07.57.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 07:57:28 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 1/2] target/arm: Fix sve_ld1_z and sve_st1_z vs MMIO
Date: Fri, 25 Mar 2022 14:57:24 +0000
Message-Id: <20220325145725.3891659-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220325145725.3891659-1-peter.maydell@linaro.org>
References: <20220325145725.3891659-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Both of these functions missed handling the TLB_MMIO flag
during the conversion to handle MTE.

Fixes: 10a85e2c8ab6 ("target/arm: Reuse sve_probe_page for gather loads")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/925
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220324010932.190428-1-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/sve_helper.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 07be55b7e1a..d45d0886159 100644
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


