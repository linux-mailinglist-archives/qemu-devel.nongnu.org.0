Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BC84953A1
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 18:56:13 +0100 (CET)
Received: from localhost ([::1]:53696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAbfQ-0003xP-Pz
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 12:56:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgi-0004JG-M0
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:37:14 -0500
Received: from [2a00:1450:4864:20::329] (port=41713
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgb-0003J4-B1
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:37:06 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 q141-20020a1ca793000000b00347b48dfb53so13507346wme.0
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 04:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=F6954rTHJ8xpie6E7k7U5LhBPA4KgY3cvkEkknSMetU=;
 b=GgBPbZdGL1w9MjoqFg3tFWq1+g31k8qyzsoEmbwy/+9RZP9/euo02si9zP6amuAadJ
 aLX722JxbAmAugQ36GzmfMlqMt8muDwzkj6oao8pl1cRStnwLcBJDyuj44jdkHLQdpnZ
 QhQRZLvmXsBtzV2hTqXIJNQHn5P6v2ote0N1JTpJ9BAixGL7HbYSL2wL/AdxktgfhQgg
 alfq33GrLBqGRRr75PBl5REb3sV0SZz3WyS64bcwm8SbNJsgxiE0/VYOp3I07hFs9kfq
 BsHsMC8X9xEC5EwQIOjWUNqx96hTP0wDM1X2BVncY6CsPcjHKoymyn9CR9Ie8IG8yxVA
 0krA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F6954rTHJ8xpie6E7k7U5LhBPA4KgY3cvkEkknSMetU=;
 b=7GDaYtI96VfjErROEAzergTNbK8t8NBSJOVT8wg14I8DiSdQKDChYh9CbyrlrC+LXK
 ktD6zmSaIS2O0Gl/BjtQQPPtFOBmeAUrRDDJMbPDR3E8mBI+8hx1tIOGAsRC33q+kebP
 b0Q0eE/pYxMaed8IhG03NFKc22B3JLQHvVes+gHUvXhdBIQGBQ9O2ypRRaPaOymHeJ0I
 9BKFWlj3u/ZOEl0WaNkP3pY8TuwOIPwzdswAhUbi2xjXoQtWlMdp13exFLSUAiVmWTzT
 zPboS9YzaJH4UoHCr5stV2G0NInT1hMVxfQ3E6icW5Hm266Tf9PtBF58fr2GVydwRqGO
 xLfA==
X-Gm-Message-State: AOAM533FIGBjorQQSQAWI0KGSG6r8KHqP1P+YOcCvsEqWXrGeavnCCuT
 L+XpYSKmmVmc/LpEfyRtltpD1dmCoEMUjQ==
X-Google-Smtp-Source: ABdhPJw+d50eJneoDZX2BmHSiISvyhnCJwqa+IC3Io0EVCcJxIztEfg/O24CXiVw38fGSf5IhWQwUQ==
X-Received: by 2002:a5d:61d2:: with SMTP id q18mr727613wrv.547.1642682224153; 
 Thu, 20 Jan 2022 04:37:04 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id t8sm7993324wmq.43.2022.01.20.04.37.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 04:37:03 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 28/38] hw/intc/arm_gicv3_its: Don't use data if reading command
 failed
Date: Thu, 20 Jan 2022 12:36:20 +0000
Message-Id: <20220120123630.267975-29-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120123630.267975-1-peter.maydell@linaro.org>
References: <20220120123630.267975-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

In process_cmdq(), we read 64 bits of the command packet, which
contain the command identifier, which we then switch() on to dispatch
to an appropriate sub-function.  However, if address_space_ldq_le()
reports a memory transaction failure, we still read the command
identifier out of the data and switch() on it.  Restructure the code
so that we stop immediately (stalling the command queue) in this
case.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220111171048.3545974-5-peter.maydell@linaro.org
---
 hw/intc/arm_gicv3_its.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index a6c2299a091..c1f76682d04 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -672,8 +672,13 @@ static void process_cmdq(GICv3ITSState *s)
         data = address_space_ldq_le(as, s->cq.base_addr + cq_offset,
                                     MEMTXATTRS_UNSPECIFIED, &res);
         if (res != MEMTX_OK) {
-            result = false;
+            s->creadr = FIELD_DP64(s->creadr, GITS_CREADR, STALLED, 1);
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: could not read command at 0x%" PRIx64 "\n",
+                          __func__, s->cq.base_addr + cq_offset);
+            break;
         }
+
         cmd = (data & CMD_MASK);
 
         switch (cmd) {
-- 
2.25.1


