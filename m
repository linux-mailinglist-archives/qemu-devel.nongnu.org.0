Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 309D34F9881
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 16:47:27 +0200 (CEST)
Received: from localhost ([::1]:44096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncptV-0002Cu-Qz
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 10:47:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPY-0007Fj-2n
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:28 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:46978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPW-0002S0-B5
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:27 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 l62-20020a1c2541000000b0038e4570af2fso5640744wml.5
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 07:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ks7J+0C271Igfu0vbL909LbuL+1GBzKju/AYg8mpFsw=;
 b=F9s+HR232xnXmJhusMaUQpEzuxdcMBKv1VUOw0stX9tTTls33K3172IQkUPSiJtBMH
 PCIY23b9W1onsldqWzHnD8Plhr6nVfJVelzmSuZUM060oZpQcrfnuO7NJTw2mMoabyGP
 y++IQ1gPbzse950L/EgyPERARbHh7QuD+Lin0xxkhvbCAB79JKzDt1pqflhdQFObUKWk
 aC+y2HkyHUAZZwz9SUBpa+tnqJjiKBPkZD5fxZiPOXDvKMCNqyqNBFEHGZnScHEIoUhE
 +37bd3+EpqoUd14JwAuA3Ome1VKkqXWek9cR7ENodYcaZG2GDBLWJZkZBQ60/Loy/Gcq
 iyVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ks7J+0C271Igfu0vbL909LbuL+1GBzKju/AYg8mpFsw=;
 b=viDT84FctBwk36h5ldZUyMZywDn1CeiXHgBGJXDLcYaxLlwnjYULYF6HEzpDzscffX
 UJLQ6kdeLYDLv4PJI4RJROzghQg6hAszTsy1Hg1ORWcijh5yC5rqCC0h6rPS//P/jGPm
 hznnU/O6tpQgPUWObtXXCg5sIywQboLCYwwDjaLdRXxI43uShRrYWfAZzA1lSsNoTnfl
 YBRir0gXnPQFpD1gLfJ9otCxVan5WhwIQGCDb+EmK9PRyElbBvgYLtPBH7xdLeWOH1ZB
 VavHKG1te1kiOO42gxFjdYThSDPVoVi6501lAp3rwH7lQjWy24ly2MPVwE2tINbrAveY
 iSzg==
X-Gm-Message-State: AOAM530bbuZsizzU1Sn/Q0DakX379ZFSqV0vfSqpEb/1aAzi9yO4a9Bd
 359EoqsyqaYmyRtNNcZjgXwZZUjHptIEqA==
X-Google-Smtp-Source: ABdhPJyWfCuZOlg1gtb0Ze7mC/PT51vdC1ClFlX4mZ/1BAj+E/KXct4IxK5QBH9qL47KSFUOBtInJA==
X-Received: by 2002:a05:600c:3d9a:b0:38c:a579:844a with SMTP id
 bi26-20020a05600c3d9a00b0038ca579844amr16795311wmb.121.1649427384468; 
 Fri, 08 Apr 2022 07:16:24 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i3-20020adffc03000000b0020616ee90dbsm11498849wrr.42.2022.04.08.07.16.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 07:16:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 34/41] hw/intc/arm_gicv3_redist: Implement
 gicv3_redist_mov_vlpi()
Date: Fri,  8 Apr 2022 15:15:43 +0100
Message-Id: <20220408141550.1271295-35-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408141550.1271295-1-peter.maydell@linaro.org>
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the gicv3_redist_mov_vlpi() function (previously left as a
stub).  This function handles the work of a VMOVI command: it marks
the vLPI not-pending on the source and pending on the destination.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_redist.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index 3127af3e2ca..9866dd94c60 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -1067,9 +1067,25 @@ void gicv3_redist_mov_vlpi(GICv3CPUState *src, uint64_t src_vptaddr,
                            int irq, int doorbell)
 {
     /*
-     * The redistributor handling for moving a VLPI will be added
-     * in a subsequent commit.
+     * Move the specified vLPI's pending state from the source redistributor
+     * to the destination.
      */
+    if (!set_pending_table_bit(src, src_vptaddr, irq, 0)) {
+        /* Not pending on source, nothing to do */
+        return;
+    }
+    if (vcpu_resident(src, src_vptaddr) && irq == src->hppvlpi.irq) {
+        /*
+         * Update src's cached highest-priority pending vLPI if we just made
+         * it not-pending
+         */
+        gicv3_redist_update_vlpi(src);
+    }
+    /*
+     * Mark the vLPI pending on the destination (ringing the doorbell
+     * if the vCPU isn't resident)
+     */
+    gicv3_redist_process_vlpi(dest, irq, dest_vptaddr, doorbell, irq);
 }
 
 void gicv3_redist_vinvall(GICv3CPUState *cs, uint64_t vptaddr)
-- 
2.25.1


