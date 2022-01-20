Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E67B4952C0
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 17:58:04 +0100 (CET)
Received: from localhost ([::1]:50732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAal9-00038B-Cl
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 11:58:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgm-0004Jp-1L
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:37:16 -0500
Received: from [2a00:1450:4864:20::331] (port=36531
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgi-0003Jt-IW
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:37:15 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 i187-20020a1c3bc4000000b0034d2ed1be2aso20157904wma.1
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 04:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=NuKcYsldnG5fRvxxRFmykUGQrUQjSvORmUSdyYJpa6Y=;
 b=RCvoP9vST4HDAcFKAPzIEPhKCL1JW0QrIoyL7rRrO2GaR5sxMy5kIKLqi/dCA/pv46
 FxY+BrNkZHS6C0DkI+3cse00oTqjLu4nrvBzuGysGSZtnRQC93l6h7aVYcOFbZz6fBQ1
 DHkisaLfVj08GeQdfRoQyqZEYs+/sgP2pV9S9Vyv13aYoeAjmF7+FMmb8xa2igTRsxto
 EkmisYnrVwEyLohvxxfYrPLkJZEjelDoV3c2qnP0UrW2fw6GJccmkI7TV34SxiCCgdek
 wNQWXuZnswWvxY18wNzvNvRLE78wQ3wP4ImPax8k64CLTA24vPXIFoSP1kU7vk0sL2nV
 /qgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NuKcYsldnG5fRvxxRFmykUGQrUQjSvORmUSdyYJpa6Y=;
 b=0KiY1Da3pDJ+evwbC6HAQKFrwkD/2+p4nj2rpb29F+NE/iC2qk7uvuaEe7fjSBU990
 eV7iozIDPbTGTZDUgEhWO379+4BnbpyCjwJuQ5GfSV9/WLCDWYzUz/8RHAV/jpQccOz3
 EsQgcD70PTDI+TxH56rbhOsLnTugfdSwkTvdZob4+xJGUWtaCbSxajAVbgdXWlN3VpWm
 G0FujpGNbDxiXKCO6a5EIzwG0dvjYhNLKPDv9X1avPYLoznBvh5eTvpWTZIzyrWbfRd/
 eP0KlSGVKhb4cnxKTrLlAMHzfwAh66rHmHTKltfnsxGDanlVJGBsRIzsdkBoZTfDEvYv
 LuCQ==
X-Gm-Message-State: AOAM530IqeJfbSMmF7ryvYlAIjjj2mGQFNeGA5FM4OX5KN0Bd0vZF8YX
 Zq7eXZCnts2hVq6hIji7UqvVHyoW707nuQ==
X-Google-Smtp-Source: ABdhPJzWwXh27D5CVXsEkxMJw/+DGEzd9uj6qnhZqa0CtuL4hJAzG07fO74lNYW8m9qql3kEtxY2PA==
X-Received: by 2002:a5d:4906:: with SMTP id x6mr4025998wrq.552.1642682229254; 
 Thu, 20 Jan 2022 04:37:09 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id t8sm7993324wmq.43.2022.01.20.04.37.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 04:37:08 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 34/38] hw/intc/arm_gicv3_its: Fix return codes in process_mapd()
Date: Thu, 20 Jan 2022 12:36:26 +0000
Message-Id: <20220120123630.267975-35-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120123630.267975-1-peter.maydell@linaro.org>
References: <20220120123630.267975-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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

Fix process_mapd() to consistently return CMD_STALL for memory
errors and CMD_CONTINUE for parameter errors, as we claim in the
comments that we do.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220111171048.3545974-11-peter.maydell@linaro.org
---
 hw/intc/arm_gicv3_its.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 80ef4dbcadf..917201c148f 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -597,7 +597,6 @@ static ItsCmdResult process_mapd(GICv3ITSState *s, uint64_t value,
     uint64_t itt_addr;
     bool valid;
     MemTxResult res = MEMTX_OK;
-    ItsCmdResult result = CMD_STALL;
 
     devid = ((value & DEVID_MASK) >> DEVID_SHIFT);
 
@@ -606,7 +605,7 @@ static ItsCmdResult process_mapd(GICv3ITSState *s, uint64_t value,
                                  MEMTXATTRS_UNSPECIFIED, &res);
 
     if (res != MEMTX_OK) {
-        return result;
+        return CMD_STALL;
     }
 
     size = (value & SIZE_MASK);
@@ -616,7 +615,7 @@ static ItsCmdResult process_mapd(GICv3ITSState *s, uint64_t value,
                                  MEMTXATTRS_UNSPECIFIED, &res);
 
     if (res != MEMTX_OK) {
-        return result;
+        return CMD_STALL;
     }
 
     itt_addr = (value & ITTADDR_MASK) >> ITTADDR_SHIFT;
@@ -633,11 +632,10 @@ static ItsCmdResult process_mapd(GICv3ITSState *s, uint64_t value,
          * we ignore this command and move onto the next
          * command in the queue
          */
-    } else {
-        result = update_dte(s, devid, valid, size, itt_addr) ? CMD_CONTINUE : CMD_STALL;
+        return CMD_CONTINUE;
     }
 
-    return result;
+    return update_dte(s, devid, valid, size, itt_addr) ? CMD_CONTINUE : CMD_STALL;
 }
 
 /*
-- 
2.25.1


