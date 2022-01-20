Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C91C4953C8
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 18:59:55 +0100 (CET)
Received: from localhost ([::1]:34184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAbix-0001cg-FL
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 12:59:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgm-0004Jn-0f
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:37:16 -0500
Received: from [2a00:1450:4864:20::335] (port=43653
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgi-0003Jo-4F
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:37:15 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 e9-20020a05600c4e4900b0034d23cae3f0so13401035wmq.2
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 04:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=hKLoZfUAnWxE8TsczUrRYAiB9/tCAzdNKRMombqtkAk=;
 b=aPxWUZYE9xUp7qMR8wlmSO2tTkTwNauiaKSCkUoihG+7bZlE8FwmRs6R8Vh7Gby76G
 mFeSYabYZUZu0oDfUo9beu2yZi5/dWfQj6At084OyE4d3QuFTYDRo8o9dxrVvqs5b+aI
 bqUkANVC2jv/WUmlcbUMMvz1jvNZs08Wehca4OkbuZHgKewuxSLEBspJkzXTKDB9NXww
 zmtR2LBH8xHjZxV2OILraXJ6wppk8OkBbgcI1TQOorM+f2CF/O0Dvwp5GxP8I98palJv
 tXjNhHN8aCeapn5b8Pzicb686l9TO8Ejnzd+vINc65NZZKHHrzXBDflWXV5p2sisOiNT
 NrGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hKLoZfUAnWxE8TsczUrRYAiB9/tCAzdNKRMombqtkAk=;
 b=EIXf4BcJEPxYTgV8WYHTyT/U04e4qqpRlXuBaSG6ztyt4aTjgPm6nXKTNykrQcYO/H
 nwO9qQvo20oFa0sPb4Q1oDE7f6n6xRQa+ymesXJ0y8oimwOr8zwTBUBTLT+j6USjXjiD
 ktw1mpbQkQ37yqWPNU+oSJZ3ZLSSx6LYBTq25/ygp1EnxBvc48K434e65iHeVjuco+IU
 WuYXoUwscM9M3eBUti6VPGKLlRMCmpBHosAPvNvxCKyLaymhZulBz44oTQA+rwOo2CB/
 sKLrQgbOfGbnEXg6NRdydZDTRlliq7VI/L5ZHOwT7g7Qv9lXD75IxvfQp3NUc3SUDI9l
 NPNg==
X-Gm-Message-State: AOAM531UWupvfYA+jjmfrJdVKDJFCgPV4mzIPAYxMMgBBrA09RwYNwmz
 zKQjXZ0oMWHHBVOeD1qXYgPI6nKJRLffvw==
X-Google-Smtp-Source: ABdhPJxYLnWL3HVH30b7J/eKSmvG5UNgMqz7bsJCkh8o+QdAVZFtV83byb6gVSkJH37LOjh5mh5G8A==
X-Received: by 2002:a05:6000:545:: with SMTP id
 b5mr33465532wrf.452.1642682227813; 
 Thu, 20 Jan 2022 04:37:07 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id t8sm7993324wmq.43.2022.01.20.04.37.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 04:37:07 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 33/38] hw/intc/arm_gicv3_its: Fix return codes in process_mapc()
Date: Thu, 20 Jan 2022 12:36:25 +0000
Message-Id: <20220120123630.267975-34-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120123630.267975-1-peter.maydell@linaro.org>
References: <20220120123630.267975-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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

Fix process_mapc() to consistently return CMD_STALL for memory
errors and CMD_CONTINUE for parameter errors, as we claim in the
comments that we do.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220111171048.3545974-10-peter.maydell@linaro.org
---
 hw/intc/arm_gicv3_its.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 010779a9fdc..80ef4dbcadf 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -491,7 +491,6 @@ static ItsCmdResult process_mapc(GICv3ITSState *s, uint32_t offset)
     uint64_t rdbase;
     bool valid;
     MemTxResult res = MEMTX_OK;
-    ItsCmdResult result = CMD_STALL;
     uint64_t value;
 
     offset += NUM_BYTES_IN_DW;
@@ -501,7 +500,7 @@ static ItsCmdResult process_mapc(GICv3ITSState *s, uint32_t offset)
                                  MEMTXATTRS_UNSPECIFIED, &res);
 
     if (res != MEMTX_OK) {
-        return result;
+        return CMD_STALL;
     }
 
     icid = value & ICID_MASK;
@@ -520,11 +519,10 @@ static ItsCmdResult process_mapc(GICv3ITSState *s, uint32_t offset)
          * we ignore this command and move onto the next
          * command in the queue
          */
-    } else {
-        result = update_cte(s, icid, valid, rdbase) ? CMD_CONTINUE : CMD_STALL;
+        return CMD_CONTINUE;
     }
 
-    return result;
+    return update_cte(s, icid, valid, rdbase) ? CMD_CONTINUE : CMD_STALL;
 }
 
 static bool update_dte(GICv3ITSState *s, uint32_t devid, bool valid,
-- 
2.25.1


