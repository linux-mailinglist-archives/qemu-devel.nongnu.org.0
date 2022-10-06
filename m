Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF5D5F6000
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 06:19:00 +0200 (CEST)
Received: from localhost ([::1]:55270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogILb-0004X2-GG
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 00:18:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHoQ-0004Ke-R1
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:44:46 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:46902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHoN-0003xB-M9
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:44:42 -0400
Received: by mail-pg1-x534.google.com with SMTP id 78so718972pgb.13
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 20:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=7HI+xpPxCIX6BauxWntrNZ0C5lHr5ZXLxWzQGdsbbe4=;
 b=cZjtz7zvp4/OiXRRM3IPKHzvAx0Tkgbvq2kkevwyhVC6+bvNlFgq08dSlEnmzN0p0G
 n2b7Nz6KGdr8LRLEfPXN0GnqC2aT/qMnlZgYdKaEpyxrPKW2vRKM6NJmPakkfl/cWpt7
 cwQ4fQMqN7qtPAib0UOSGVyfaNEEvm1phQyDJqG7MMCzg+sIg/J2h/i0V6qdg2ri/C3r
 l2WcveNAbp5zdyZBzEA+YcONXwb0n8HVZmOaDpxT1nxGO7iNzjiuH9c5GBYtp8M1llZ+
 2k8M+nIg0nLGyzKjNmnwhOz49NO4ldQTkMcuDQZobwELeg0RHBmYusfXlayrefNRHTUd
 EJWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=7HI+xpPxCIX6BauxWntrNZ0C5lHr5ZXLxWzQGdsbbe4=;
 b=FDJSCmvsGSBBF8JvOMRF5P7cQzfXWBPW3yMmgDetiaxX3yOypG4iRl8fb6YpgYRBdY
 MeEkHMciryj4KgdOLCPOS2jaIwhoqOPXSj41e9a3Sy9AotxVOGB0NDUs1zbnj92hkSN1
 Ab6Jms6JRCytY7B0bJcwjUTDa4YRxUEkUzk7nRMTPvXDeaYSJP0eNGez/umpRHsBThrY
 7AWpXOv5tlp1bRlexv0skwt4goAIq6Sx7b+mO1vwgCzFmgNlESUIpIIi1ua2MxJCj9mU
 1dFKq17EimOXy0j+OAXYEjKwuK7z1PhPYNSQ8ggUqkHdH8F2ZVDBbTyakrUNwZd2DgG5
 8g3w==
X-Gm-Message-State: ACrzQf2Zcv9JrR/JdAb4EmENusXjPusPOIcwMupdPXzQt+0vvDdyiYTs
 CA/7FPxf0jitQdSdQodrzBkc/5EnYUm5Wg==
X-Google-Smtp-Source: AMsMyM43uyjSN1RNBzrOmjsVsqUX0WzStnus83HM6qTU2HkbCh8uV+VnFZ5ncvQunqcQWtGe7Kq5rQ==
X-Received: by 2002:a63:87c3:0:b0:450:9613:c3d4 with SMTP id
 i186-20020a6387c3000000b004509613c3d4mr2719650pge.455.1665027878332; 
 Wed, 05 Oct 2022 20:44:38 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:9ad0:4307:7d39:bb61])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a17090ad0c600b00205f4f7a3b3sm1905086pjw.21.2022.10.05.20.44.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 20:44:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: [PATCH 16/26] target/s390x: Disable conditional branch-to-next for PER
Date: Wed,  5 Oct 2022 20:44:11 -0700
Message-Id: <20221006034421.1179141-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006034421.1179141-1-richard.henderson@linaro.org>
References: <20221006034421.1179141-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

For PER, we require a conditional call to helper_per_branch
for the conditional branch.  Fold the remaining optimization
into a call to helper_goto_direct, which will take care of
the remaining gbea adjustment.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index cd311b4b2a..fc6b04e23e 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -1203,13 +1203,12 @@ static DisasJumpType help_branch(DisasContext *s, DisasCompare *c,
         goto egress;
     }
     if (is_imm) {
-        if (disp == s->ilen) {
-            /* Branch to next.  */
-            per_branch(s, true);
-            ret = DISAS_NEXT;
-            goto egress;
-        }
-        if (c->cond == TCG_COND_ALWAYS) {
+        /*
+         * Do not optimize a conditional branch if PER enabled, because we
+         * still need a conditional call to helper_per_branch.
+         */
+        if (c->cond == TCG_COND_ALWAYS
+            || (disp == s->ilen && !per_enabled(s))) {
             ret = help_goto_direct(s, disp);
             goto egress;
         }
-- 
2.34.1


