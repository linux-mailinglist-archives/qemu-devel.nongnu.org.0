Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E7C4AD87A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 13:56:58 +0100 (CET)
Received: from localhost ([::1]:45254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHQ3F-0001nm-Ho
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 07:56:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOrT-00016A-4c
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:45 -0500
Received: from [2a00:1450:4864:20::330] (port=33396
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOr1-0002Md-E7
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:22 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 y6-20020a7bc186000000b0037bdc5a531eso737687wmi.0
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 03:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=uJSi79pD20H9mn2ISVJzcWT+Ek0/1qEnDg0RX82vzg4=;
 b=uvPUH5cgksrJgQnxcGUSVFr/PIYVyy8o8aFbfc0eY8NJMu0Z9jcS1ud7ds6G6K2j5a
 zyh/7GrMHK2d2D8krtJedCK8zd80aVqsQ9dNTG2sdUi7Y6wOhGALsIRwIkoctlct0N63
 aMN73whJkh64lYLPI4OaperCB2NS1Z0eYP9HKOl1ylK8QEPkYU0FHYzPGoYD7fHRPC0m
 ot4hmW2sVZgzN6zrJLvTp58Yxwr0rgvo4QaLKAtEJwn8B3pqjFq4ycZJdfFOFz0HaK1g
 xdql0jU2Ana25H4lrqnfg2gzVCFYV8DuOaXVKlVy06mgwbLzS3i+E4WGYXCr8y1jAR8C
 I7GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uJSi79pD20H9mn2ISVJzcWT+Ek0/1qEnDg0RX82vzg4=;
 b=EsvjkfBqNqmriZj6ZydTc6CA0iqfDM4DSLVCONr1Y8eDvbaJ7ogkJf0pcie/Vtx1xK
 dpDkOBSTNAEq2NEUA/nGrVnPb3zsw5KoSDubBnibvrXNmvmxJ09QRC2uQC1HF0mcxC53
 AImhSYqV+xw36mNYeHLYS76u6DJwVwnLlFuDyrR0Uf+Th/UpPNkEIMWwwfaHMNCKyHvl
 Hy0Xl9TL8kFw/IMNmB6zVfJlqDw/BJE4K6SJ8a5mVvxgSBqV1d7zEDsttftiBrxmQMfm
 nhdqWXMIqK4fQSuvc0K7IMGKOBhYMAsoXygq4JD9cM9BfCo+//qhnKEsmVBZp3DLsw87
 8UHw==
X-Gm-Message-State: AOAM532NHwX6qRHFDwQHUIOivRlR1TlcZtrkBjoovv4Co53UW8V8ZK+G
 GTIJh/6CsZkKip8GZUVXHm+ODooI4DMm4w==
X-Google-Smtp-Source: ABdhPJzQY36aBYtOhA6TB9dx46W+LdcL1xeEkcmvCgIEnAh5Z6qOsdtEWREyib3S0O6vkDU6A9od1Q==
X-Received: by 2002:a1c:f210:: with SMTP id s16mr769201wmc.121.1644320414084; 
 Tue, 08 Feb 2022 03:40:14 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id r11sm4245199wrt.28.2022.02.08.03.40.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 03:40:13 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 36/39] hw/intc/arm_gicv3_its: In MAPC with V=0,
 don't check rdbase field
Date: Tue,  8 Feb 2022 11:39:45 +0000
Message-Id: <20220208113948.3217356-37-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208113948.3217356-1-peter.maydell@linaro.org>
References: <20220208113948.3217356-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220201193207.2771604-12-peter.maydell@linaro.org
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


