Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A60D64F97FC
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 16:26:15 +0200 (CEST)
Received: from localhost ([::1]:33876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncpZ0-000836-OQ
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 10:26:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPE-0006sd-Ay
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:08 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:44553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPA-0002Gf-Vd
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:07 -0400
Received: by mail-wr1-x436.google.com with SMTP id b19so13037465wrh.11
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 07:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=udZXKhjCILW7E0fUX7TNoreN3wUNIEE/HPBGgOlM0/Q=;
 b=qCzJ0W4GGxmGhN4ESxgCSs1GaRSbaDUjOtPJ5uQl9OyumJ99pEVisZ5XHsunC8G+VK
 9CaQlWldKiUVR8Paz3go3qJZJHwNECuJAqbj3hr7Bn57srWjt20ixm2nt3CW4MFDu4xX
 rnj3zImYHyLme8j45+DLzc7SZNkKg9qoXQarPIp6WpJqpLwodgPiycVgOKBOu7SgEWHk
 thXhSUEmDxksEmGzaMD3kFa3YzxVxW3b2OpwpT4+kRPsJPipC/+XDv6A7P3ZIhbfkG+K
 uYsjS6OKcLmLmq11ZNkLOiTZbuDH+VDU6SGlRn1FqE02eopUXUOt02rTglz+S1kCrCfk
 K51g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=udZXKhjCILW7E0fUX7TNoreN3wUNIEE/HPBGgOlM0/Q=;
 b=NPjMViFLsKQ3W75ibca3tqh0Df6nKkOdOAumA4mz5BDjdZtz/7Ua/KgJ/Ap6WLRBjT
 HBiBZ91UebNI8e1rOvzmDl023mLbUD4kZJcamuhkj5vrGga9mafPlSDE7ZNXF6RUNt3l
 ni68SXD1ty5nBie4+5usjZyGtNxlPzGH9Iu+aSqdgSZauOAMp9CUR4LKK2T5a9M+qsJG
 D7zqmBnS8Dopykq1gWQDM1G0KrWzOpBN5GKA2JNGXyTrzRjaKdEGLAAtZ2cUvBmqCuGd
 P7KQOGzSLK4ZIJiIdwReEWVCkZM3Ytgc7crlBrSw5EuEZbO7QwELPxmN4ghZq3DvENt8
 2Wig==
X-Gm-Message-State: AOAM532pm92xPFS/9tMnZyZozjtVD4zbJ63YRUR7+kBDQQegS6DPkXC3
 V704fi/Tb/xg4xs8TORLIiSmMA==
X-Google-Smtp-Source: ABdhPJxk52/+U6NaOy2XoyJ48/jQkwPZIRnIvFgbCfGOCUBOE+CwSDxoNiaJV1e4b1te4mijbzXdEg==
X-Received: by 2002:a05:6000:12c6:b0:206:100e:16f2 with SMTP id
 l6-20020a05600012c600b00206100e16f2mr14732131wrx.644.1649427363409; 
 Fri, 08 Apr 2022 07:16:03 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i3-20020adffc03000000b0020616ee90dbsm11498849wrr.42.2022.04.08.07.16.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 07:16:03 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 10/41] hw/intc/arm_gicv3_its: Distinguish success and error
 cases of CMD_CONTINUE
Date: Fri,  8 Apr 2022 15:15:19 +0100
Message-Id: <20220408141550.1271295-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408141550.1271295-1-peter.maydell@linaro.org>
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

In the ItsCmdResult enum, we currently distinguish only CMD_STALL
(failure, stall processing of the command queue) and CMD_CONTINUE
(keep processing the queue), and we use the latter both for "there
was a parameter error, go on to the next command" and "the command
succeeded, go on to the next command".  Sometimes we would like to
distinguish those two cases, so add CMD_CONTINUE_OK to the enum to
represent the success situation, and use it in the relevant places.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index ea2b4b9e5a7..ba1893c072b 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -78,11 +78,13 @@ typedef struct VTEntry {
  * and continue processing.
  * The process_* functions which handle individual ITS commands all
  * return an ItsCmdResult which tells process_cmdq() whether it should
- * stall or keep going.
+ * stall, keep going because of an error, or keep going because the
+ * command was a success.
  */
 typedef enum ItsCmdResult {
     CMD_STALL = 0,
     CMD_CONTINUE = 1,
+    CMD_CONTINUE_OK = 2,
 } ItsCmdResult;
 
 /* True if the ITS supports the GICv4 virtual LPI feature */
@@ -400,9 +402,9 @@ static ItsCmdResult do_process_its_cmd(GICv3ITSState *s, uint32_t devid,
         ITEntry ite = {};
         /* remove mapping from interrupt translation table */
         ite.valid = false;
-        return update_ite(s, eventid, &dte, &ite) ? CMD_CONTINUE : CMD_STALL;
+        return update_ite(s, eventid, &dte, &ite) ? CMD_CONTINUE_OK : CMD_STALL;
     }
-    return CMD_CONTINUE;
+    return CMD_CONTINUE_OK;
 }
 
 static ItsCmdResult process_its_cmd(GICv3ITSState *s, const uint64_t *cmdpkt,
@@ -495,7 +497,7 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, const uint64_t *cmdpkt,
     ite.icid = icid;
     ite.doorbell = INTID_SPURIOUS;
     ite.vpeid = 0;
-    return update_ite(s, eventid, &dte, &ite) ? CMD_CONTINUE : CMD_STALL;
+    return update_ite(s, eventid, &dte, &ite) ? CMD_CONTINUE_OK : CMD_STALL;
 }
 
 static ItsCmdResult process_vmapti(GICv3ITSState *s, const uint64_t *cmdpkt,
@@ -574,7 +576,7 @@ static ItsCmdResult process_vmapti(GICv3ITSState *s, const uint64_t *cmdpkt,
     ite.icid = 0;
     ite.doorbell = doorbell;
     ite.vpeid = vpeid;
-    return update_ite(s, eventid, &dte, &ite) ? CMD_CONTINUE : CMD_STALL;
+    return update_ite(s, eventid, &dte, &ite) ? CMD_CONTINUE_OK : CMD_STALL;
 }
 
 /*
@@ -635,7 +637,7 @@ static ItsCmdResult process_mapc(GICv3ITSState *s, const uint64_t *cmdpkt)
         return CMD_CONTINUE;
     }
 
-    return update_cte(s, icid, &cte) ? CMD_CONTINUE : CMD_STALL;
+    return update_cte(s, icid, &cte) ? CMD_CONTINUE_OK : CMD_STALL;
 }
 
 /*
@@ -696,7 +698,7 @@ static ItsCmdResult process_mapd(GICv3ITSState *s, const uint64_t *cmdpkt)
         return CMD_CONTINUE;
     }
 
-    return update_dte(s, devid, &dte) ? CMD_CONTINUE : CMD_STALL;
+    return update_dte(s, devid, &dte) ? CMD_CONTINUE_OK : CMD_STALL;
 }
 
 static ItsCmdResult process_movall(GICv3ITSState *s, const uint64_t *cmdpkt)
@@ -725,13 +727,13 @@ static ItsCmdResult process_movall(GICv3ITSState *s, const uint64_t *cmdpkt)
 
     if (rd1 == rd2) {
         /* Move to same target must succeed as a no-op */
-        return CMD_CONTINUE;
+        return CMD_CONTINUE_OK;
     }
 
     /* Move all pending LPIs from redistributor 1 to redistributor 2 */
     gicv3_redist_movall_lpis(&s->gicv3->cpu[rd1], &s->gicv3->cpu[rd2]);
 
-    return CMD_CONTINUE;
+    return CMD_CONTINUE_OK;
 }
 
 static ItsCmdResult process_movi(GICv3ITSState *s, const uint64_t *cmdpkt)
@@ -845,7 +847,7 @@ static ItsCmdResult process_movi(GICv3ITSState *s, const uint64_t *cmdpkt)
 
     /* Update the ICID field in the interrupt translation table entry */
     old_ite.icid = new_icid;
-    return update_ite(s, eventid, &dte, &old_ite) ? CMD_CONTINUE : CMD_STALL;
+    return update_ite(s, eventid, &dte, &old_ite) ? CMD_CONTINUE_OK : CMD_STALL;
 }
 
 /*
@@ -924,7 +926,7 @@ static ItsCmdResult process_vmapp(GICv3ITSState *s, const uint64_t *cmdpkt)
         return CMD_CONTINUE;
     }
 
-    return update_vte(s, vpeid, &vte) ? CMD_CONTINUE : CMD_STALL;
+    return update_vte(s, vpeid, &vte) ? CMD_CONTINUE_OK : CMD_STALL;
 }
 
 /*
@@ -963,7 +965,7 @@ static void process_cmdq(GICv3ITSState *s)
     }
 
     while (wr_offset != rd_offset) {
-        ItsCmdResult result = CMD_CONTINUE;
+        ItsCmdResult result = CMD_CONTINUE_OK;
         void *hostmem;
         hwaddr buflen;
         uint64_t cmdpkt[GITS_CMDQ_ENTRY_WORDS];
@@ -1055,7 +1057,8 @@ static void process_cmdq(GICv3ITSState *s)
             trace_gicv3_its_cmd_unknown(cmd);
             break;
         }
-        if (result == CMD_CONTINUE) {
+        if (result != CMD_STALL) {
+            /* CMD_CONTINUE or CMD_CONTINUE_OK */
             rd_offset++;
             rd_offset %= s->cq.num_entries;
             s->creadr = FIELD_DP64(s->creadr, GITS_CREADR, OFFSET, rd_offset);
-- 
2.25.1


