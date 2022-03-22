Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC174E3C74
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 11:30:06 +0100 (CET)
Received: from localhost ([::1]:47296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWbm8-0002R7-V5
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 06:30:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nWbkd-0001Xt-M8
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 06:28:31 -0400
Received: from [2a00:1450:4864:20::32e] (port=38692
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nWbka-00007S-Sl
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 06:28:30 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 j13-20020a05600c1c0d00b0038c8f94aac2so1399488wms.3
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 03:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v9l0ogl/bdFBzuoTKFwUcvtdsfzwCyUk8BQBE8geXWs=;
 b=hjyFz2h7jiPdbth700PnMRTeYS20QfHtvFExuT/isCst65FDjQcfkL7uGR7ODPsun2
 Jg9XaP9WMtHcRdQ49dYaZuQK5ejBGf5LzNZ5vT8m5RV3T/AOZ1EcyF8t8yFLegFkk4hB
 RsfVEPF67St7Dw7Whzt2cVj701uvH787VD/cLJ6KdT1y6YsaWZl2of1Jbv9UJ6q3/B6S
 4cAwsDquKYAXpqe+x5uNQBMApwUNCPF91jihhdZwNANP8a17ROqT54uf6mIMP98o70wo
 ro7l1xPZcNQ8qUSQarOj/vhf+eiGt/8wJ+xQu5vqycMSjYwSdcW2krgg8wbzXxoAVXJR
 LG+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v9l0ogl/bdFBzuoTKFwUcvtdsfzwCyUk8BQBE8geXWs=;
 b=7SWPhS4EkjqYkTz3SPqN8h4Ckca/T7YYciOvgI3rBc6qZ6PdgfhrTkF27HX/qA2Gii
 qhFDqXz7jaN33SkPLUqqcWeUw81yjuQke+8C6ihKp8fFpHf/N0RbHmF/r3xufiGTnbnS
 soVo7h2iTFCDaWNYthxMTn4MiqTw1iC1FDqb/3VP2TflWw9MK2KqeCmd11nQNLaaND1C
 KiT6Y191kK0/rxF+swN044hvzL+e+1oUi3ga5hvct7bAnKosg89yvgja6IUJns1EmNTc
 fFndsJa33AuuKjuvKKXbqf4hOlmz5i18yACytpX1rn6r2/F4tHYHQmE1LV+7zm6DGHpS
 MOWw==
X-Gm-Message-State: AOAM5336x+7IhkUe7TxTILR+CDFHdNqrjy1xoesz3X9FgUuZpBdv//KY
 9BwC5J6EHO2qFJRsVjrpue4GZg==
X-Google-Smtp-Source: ABdhPJz0UA/2XzMRnE7dFU4zrc4G0iM2tmhRJc5WJJ7PRB2oycB8aGwoVlwvSboJWmrMBHDr1MkXKw==
X-Received: by 2002:a7b:c382:0:b0:388:2e76:49ed with SMTP id
 s2-20020a7bc382000000b003882e7649edmr3096846wmj.195.1647944906985; 
 Tue, 22 Mar 2022 03:28:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n18-20020a5d6612000000b00203fbd39059sm9275872wru.42.2022.03.22.03.28.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 03:28:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-7.0] hw/intc/arm_gicv3_its: Add missing newlines to
 process_mapc() logging
Date: Tue, 22 Mar 2022 10:28:24 +0000
Message-Id: <20220322102824.3474956-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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

In commit 84d43d2e82da we rearranged the logging of errors in
process_mapc(), and inadvertently dropped the trailing newlines
from the log messages. Restore them.

Fixes: 84d43d2e82da ("hw/intc/arm_gicv3_its: In MAPC with V=0, don't check rdbase field")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index b96b874afdf..d9c741f5fdd 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -524,12 +524,12 @@ static ItsCmdResult process_mapc(GICv3ITSState *s, const uint64_t *cmdpkt)
     trace_gicv3_its_cmd_mapc(icid, cte.rdbase, cte.valid);
 
     if (icid >= s->ct.num_entries) {
-        qemu_log_mask(LOG_GUEST_ERROR, "ITS MAPC: invalid ICID 0x%d", icid);
+        qemu_log_mask(LOG_GUEST_ERROR, "ITS MAPC: invalid ICID 0x%d\n", icid);
         return CMD_CONTINUE;
     }
     if (cte.valid && cte.rdbase >= s->gicv3->num_cpu) {
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "ITS MAPC: invalid RDBASE %u ", cte.rdbase);
+                      "ITS MAPC: invalid RDBASE %u\n", cte.rdbase);
         return CMD_CONTINUE;
     }
 
-- 
2.25.1


