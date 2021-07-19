Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB603CEE14
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 23:25:07 +0200 (CEST)
Received: from localhost ([::1]:53420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5al3-000790-BG
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 17:25:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5aj5-0004K9-9U
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 17:22:59 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:33415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5aj3-0000t6-Pj
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 17:22:58 -0400
Received: by mail-pg1-x52b.google.com with SMTP id 37so20592689pgq.0
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 14:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+p6ro6D5KFq3icWk04aTft7NAAiKyhL4s7d6P84Hy6s=;
 b=YPoL/WIx0mnwSOwPkTh7ICAypA8Cy0siFDpmeDy+v4LwHjksPzlx628S/Ug2rBliv+
 UoWvtld3pRKvhqDbsqwWkuRbFzozxwYQ1JVUG3RjqpndGly8+0TZNSMsGlg4QUOPvxBS
 5MjodjqJHPyZr67JPbhyIOO67cX01SkCvGA283xLvkRfFYTCCT6McLDGILW+MzrVoeEH
 r5ZZSa145UM198H2aJLtPdvXKkoQ0sqCACmcCFC/a0zR8QSm/Vju9BO1Pr/9BW4nZiyE
 m0lHXkbklhUuvBL46ZwzQ64vQg3lIFa9xsigETOqDxawOiW/sriF5jWzn+F9sTA/6UBg
 5Dpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+p6ro6D5KFq3icWk04aTft7NAAiKyhL4s7d6P84Hy6s=;
 b=cprnwgYCk+5aKB9oQ4wwPXwsZo9y9iOTiOviQQKS/dOyNh77+9apJR6hImubG2moO0
 hJ9dAlof6cZcfikREwwyrrWBEmJtck13s6aq6KXw9AnU195od3XGD+msMtiEZucFOIaJ
 Ejj1g0DWafEJ5moVGGnsX5q7SJlVeHpuPO0yqT8WoihFba9lCa9HlAKYbzRfYrDHd6KH
 SO3nKkDHK/WS/CjMYlwXlSXxEnpvWfv0gmhanqWy+gXnxVf9tu8vhpa77qHNFoxfue2C
 vEhV/GR+cpUo8Vm6vR4GlledZZ2bebbmA4ndsMKz9Qg0X61X8a6qv48VbN8SeXBRf0aX
 IBBA==
X-Gm-Message-State: AOAM532lEIOBXdm5xE8EvZwHVf9brwJb+KAhy0x+K6GsxAiZcNSZB7WY
 GMQrbklCE38R99/N+EWwnDZq/pEcV6jElw==
X-Google-Smtp-Source: ABdhPJzcoX+ectZhYsHs87Q/wLIF1QjygZOXouqbBllFsyIU9MCmQyzWRzrVV9qNh9/G3mSm/gaR2Q==
X-Received: by 2002:a62:15c5:0:b029:32c:ea9f:a5ed with SMTP id
 188-20020a6215c50000b029032cea9fa5edmr27400216pfv.27.1626729776536; 
 Mon, 19 Jul 2021 14:22:56 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id e4sm25008434pgi.94.2021.07.19.14.22.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 14:22:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1 v4 09/15] hw/core: Introduce
 TCGCPUOps.debug_check_breakpoint
Date: Mon, 19 Jul 2021 11:22:33 -1000
Message-Id: <20210719212239.428740-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210719212239.428740-1-richard.henderson@linaro.org>
References: <20210719212239.428740-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
 alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

New hook to return true when an architectural breakpoint is
to be recognized and false when it should be suppressed.

First use must wait until other pieces are in place.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/tcg-cpu-ops.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index 72d791438c..eab27d0c03 100644
--- a/include/hw/core/tcg-cpu-ops.h
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -88,6 +88,12 @@ struct TCGCPUOps {
      */
     bool (*debug_check_watchpoint)(CPUState *cpu, CPUWatchpoint *wp);
 
+    /**
+     * @debug_check_breakpoint: return true if the architectural
+     * breakpoint whose PC has matched should really fire.
+     */
+    bool (*debug_check_breakpoint)(CPUState *cpu);
+
     /**
      * @io_recompile_replay_branch: Callback for cpu_io_recompile.
      *
-- 
2.25.1


