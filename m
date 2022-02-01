Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B287C4A6797
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 23:13:41 +0100 (CET)
Received: from localhost ([::1]:40522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF1PA-0006ej-7u
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 17:13:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nEytL-0001rQ-Qj
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 14:32:39 -0500
Received: from [2a00:1450:4864:20::334] (port=38900
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nEytI-0002Xo-1R
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 14:32:39 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 o30-20020a05600c511e00b0034f4c3186f4so2818468wms.3
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 11:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nPzzTIMjX8+LmKQr0pPoJuhI0Z54vBV3jrfkNEOyMpQ=;
 b=Oojr49ptSEYDc2UEYTipQgMfjRt/UNcm4OqFRkXC6pQb6P7JNCwP/oYdgDsjNOBtCr
 CPTiMNNDlEfoD4p2idxWxqn0mWR1q6iK+D+wjtfd8AqHfUJnv3iJmqVQJS3hN8LVGp1R
 AV2pstxjV0bIyRMuFlp9hAXXoJdYX5VqL/T1h5xr2TsV42uLGQSouuArdKPjRJmVZR8V
 q7aUnAo+QSRFeCi0ZjsSyZIsGPfrtr/jdLJ5bU6ccb0a3AAHb/mRJ9/zoG4JwbBEMOp4
 Y6XtXrpBIh/6qtlt2RRa/oOxw6txvdnZ8j6xBSFel1Lnv5C0K2X1QXysMKrk2IcMKEbP
 TUFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nPzzTIMjX8+LmKQr0pPoJuhI0Z54vBV3jrfkNEOyMpQ=;
 b=FWLHiDff8DpJISLSNAeF7kEhinhxpje6KQK2ZjmNmL4E+Um+sxyB0gui7cyClkxm1c
 tm/+ffySCAv7nqHIVOwWJQTjFybTd3tacJOu6sUV4KgVqBoZy9F56csF36PXzCAw8hUp
 ogg/VgBr7EdygRdAsg5owBJQyCSYBWs151ho2s0TIMo6D+KreF5NxCPRpkf22koIW3kT
 jVSlQ3HAlPZJ2pg/PLDECrZqx1q05EChOdOE35ZwWGTdKwv2lahOhGZshHQJg2WDni3Z
 itVeXcU/ewy/RRbV8f2scNRbviE6vMpfywBBNIQX4HVJIwuZ1j0m7e5ia4ixnKhxhmtA
 U7Ng==
X-Gm-Message-State: AOAM533nkBEE0DnXkjzsqb9T7OFDGpPEDTW+b9RCH/gAemibi0YSQlk/
 ZOh6DXryEajA7afNmJrdZ3GG0w==
X-Google-Smtp-Source: ABdhPJwLvw482/QHDjdabL6RHWYokOnjB7qshV5QFlECJVTiwabJPRSt3eU5JIF8Fy5n90WTBeFMqw==
X-Received: by 2002:a05:600c:ac7:: with SMTP id
 c7mr3128130wmr.61.1643743939232; 
 Tue, 01 Feb 2022 11:32:19 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id z5sm3491265wmp.10.2022.02.01.11.32.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 11:32:18 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 11/13] hw/intc/arm_gicv3_its: In MAPC with V=0,
 don't check rdbase field
Date: Tue,  1 Feb 2022 19:32:05 +0000
Message-Id: <20220201193207.2771604-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201193207.2771604-1-peter.maydell@linaro.org>
References: <20220201193207.2771604-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the MAPC command, if V=0 this is a request to delete a collection
table entry and the rdbase field of the command packet will not be
used.  In particular, the specification says that the "UNPREDICTABLE
if rdbase is not valid" only applies for V=1.

We were doing a check-and-log-guest-error on rdbase regardless of
whether the V bit was set, and also (harmlessly but confusingly)
storing the contents of the rdbase field into the updated collection
table entry.  Update the code so that if V=0 we don't check or use
the rdbase field value.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 9735d609df2..069991f7f36 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -468,21 +468,21 @@ static ItsCmdResult process_mapc(GICv3ITSState *s, const uint64_t *cmdpkt)
     CTEntry cte;
 
     icid = cmdpkt[2] & ICID_MASK;
-
-    cte.rdbase = (cmdpkt[2] & R_MAPC_RDBASE_MASK) >> R_MAPC_RDBASE_SHIFT;
-    cte.rdbase &= RDBASE_PROCNUM_MASK;
-
     cte.valid = cmdpkt[2] & CMD_FIELD_VALID_MASK;
+    if (cte.valid) {
+        cte.rdbase = (cmdpkt[2] & R_MAPC_RDBASE_MASK) >> R_MAPC_RDBASE_SHIFT;
+        cte.rdbase &= RDBASE_PROCNUM_MASK;
+    } else {
+        cte.rdbase = 0;
+    }
 
-    if ((icid >= s->ct.num_entries) || (cte.rdbase >= s->gicv3->num_cpu)) {
+    if (icid >= s->ct.num_entries) {
+        qemu_log_mask(LOG_GUEST_ERROR, "ITS MAPC: invalid ICID 0x%d", icid);
+        return CMD_CONTINUE;
+    }
+    if (cte.valid && cte.rdbase >= s->gicv3->num_cpu) {
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "ITS MAPC: invalid collection table attributes "
-                      "icid %d rdbase %u\n",  icid, cte.rdbase);
-        /*
-         * in this implementation, in case of error
-         * we ignore this command and move onto the next
-         * command in the queue
-         */
+                      "ITS MAPC: invalid RDBASE %u ", cte.rdbase);
         return CMD_CONTINUE;
     }
 
-- 
2.25.1


