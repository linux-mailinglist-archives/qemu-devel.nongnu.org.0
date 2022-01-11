Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E09148B48D
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 18:51:36 +0100 (CET)
Received: from localhost ([::1]:55684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7LJ1-000859-6b
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 12:51:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7Kfq-0005DA-4i
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 12:11:11 -0500
Received: from [2a00:1450:4864:20::42c] (port=41772
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7Kfl-0007KQ-FV
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 12:11:05 -0500
Received: by mail-wr1-x42c.google.com with SMTP id v6so34158293wra.8
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 09:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K3C/kFYJ4QIEIUS4ZNsrIp8SeCMyQxIhNuKfg2+o/Ik=;
 b=y7VCa6wd0XAg2p685ZFaOrkrHBL0lZ16qiWl1hmgnpFEuNl0OfJW5cxFaIyZaQ8J0H
 7yMZsZAJfA/XiIZ9N3WQwjvyhKB518gffWz7yl5FqXEYvBZWwoYcRW77PPc1a8ZJW0eF
 FO4niUwbqAvz8aDWnxV+Q6wSZIhdx5yCPNI0p5R1742lxLsyHAYaD9gWcB6fxqUeKFDB
 JNmfhJEuHatpWiWxbd31RCPTLwOkbdAPp27b32PRRjYy8++DRQ7ETECsGW7r7gFfJCJk
 mL9u2bdD3iGbCVy8kUsoHIYjeK/+kIPvKeSyht7THnEq5oF/ULBEwspguus/GBoMBdnb
 7LNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K3C/kFYJ4QIEIUS4ZNsrIp8SeCMyQxIhNuKfg2+o/Ik=;
 b=aOkktgYeitm/PODQFPY6kNypsj/4u/Yt+bGm3XFnBuEMZBHwltv745OBq6VC+mlQPj
 U6WJCQ6+kUWKwv6Pdtef9HN1WLwjeTUIPYexChQ1H4Eed14QP03nH6dOOF1M2vlm7Nz3
 wlxcUurGFoWRC6JgltUVLTEnNutwjiVaI4b9GeJDVeS4lv+DMwSlrizmzjFnuNdbMmpN
 RihkPxKr7hV7t7k7tYRyRjtUhLGXVvHUCK/V2A4OyHoJdBeWJFIddPasMINh5Dg0iQz0
 FAsG0vDfNuD/PP5Rhp5WLfCxiRfz7a0k2pw8yozzLCgbDXHlU2393Wmi10S7H5wo2XHn
 n3iw==
X-Gm-Message-State: AOAM532LpCtTCnkes6lEbKDfYtUxxnM9tmqmXjeBC5cD1bUwNlVlr0PB
 v5jv5K/SzlJAUZ0f+CWnUYG20w==
X-Google-Smtp-Source: ABdhPJyycWI9z4ECuzRcHLgpjusbTQ6WQxy+9sZXqod+9Kdkw7tHbHtflVH45+avr5fw2/54Whr69w==
X-Received: by 2002:a05:6000:1d89:: with SMTP id
 bk9mr4525198wrb.561.1641921057733; 
 Tue, 11 Jan 2022 09:10:57 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id c7sm11157941wri.21.2022.01.11.09.10.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 09:10:57 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 10/13] hw/intc/arm_gicv3_its: Fix return codes in
 process_mapd()
Date: Tue, 11 Jan 2022 17:10:45 +0000
Message-Id: <20220111171048.3545974-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220111171048.3545974-1-peter.maydell@linaro.org>
References: <20220111171048.3545974-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix process_mapd() to consistently return CMD_STALL for memory
errors and CMD_CONTINUE for parameter errors, as we claim in the
comments that we do.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


