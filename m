Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA874331641
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 19:38:19 +0100 (CET)
Received: from localhost ([::1]:42772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJKlm-000464-Ft
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 13:38:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJlF-0007ME-HW
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:41 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:34693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJkq-00077x-NE
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:41 -0500
Received: by mail-wr1-x42f.google.com with SMTP id u16so12326426wrt.1
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 09:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=hBs2oe4YZMn4XESXoB2fTZGh7p5EasWVcofOAmRY3vE=;
 b=MxCINSFfoJTDwv8mg6xReCtAwmjEjPkpkBzXGKY4aoAXm0nsVyX7SFaRVz60XaToYy
 l5Z3u3qqBSVv19MnGc3x362AzYL572Gt11YLzlbKEPzWifk7FHa4Uz8lnB1EF//aVGPg
 A9G62o3I8C2bHrqpZ057daw7h5SHSJ5safzFM4seOdogx9coD5JvTz0uxDZlPeaKaD2w
 uo8E425XUlaSTOIMxBHIC6aEEO/u7ugH2VviH3SId+4dSbubPMRUOYeXUOvw3Iy+2tVc
 RED7UvKZzS3lrux7SnJ4sQqeF68WWYU1qFydv/b4CovYuNDGUBrUSxy1W6uGtaGJT+V4
 eorw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hBs2oe4YZMn4XESXoB2fTZGh7p5EasWVcofOAmRY3vE=;
 b=JPlP+xClVSfRz4qkwc3bsEFIFTARXQL4E8e+AT75GYxuw80N+E6qiTGe/GMpKYRxp2
 JX8yehuyI99SIQ92SMw1nva9fN/W7GrEVvtgnrF22a/n/ApR0ZuAJ7p0HfDoZ5D+V1S8
 8vuIN2aUq86UGheV6DE3oUC9a3NQQesdri9NlZ1MUphDR4adyoILIP3DUD7h3zzXgXK/
 eQSh9BVMcFZIhfUtqmLUgYr1HtIQWa7T/uQPJ/DRYmQyVd+LNo5osK19fayvn4Hjy9IA
 XeMcMeLqvYv0k390DTTqRnnff2SmpsDw+YXS65Anq3/kzvl3AEaJKAHTxG10SQY6fnAy
 Dxfg==
X-Gm-Message-State: AOAM530buzVQ2t+AxRHoTFVynub7M7w8LUvm0mp1oJHV4yhgdbGi+dUP
 WO+gTup8uHy/Iqnuj6dVMvaa5467IzoGBQ==
X-Google-Smtp-Source: ABdhPJzZ4zBCCHq83I6Mg63CQCY2Y94qUm/8hfR70aOZkKAdbipE5KwWn1uufccKKenh2vCeVvrIFQ==
X-Received: by 2002:a5d:4592:: with SMTP id p18mr25657093wrq.244.1615224793937; 
 Mon, 08 Mar 2021 09:33:13 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i10sm18628217wrs.11.2021.03.08.09.33.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 09:33:13 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 37/54] hw/misc/mps2-fpgaio: Fold counters subsection into main
 vmstate
Date: Mon,  8 Mar 2021 17:32:27 +0000
Message-Id: <20210308173244.20710-38-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210308173244.20710-1-peter.maydell@linaro.org>
References: <20210308173244.20710-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We've already broken migration compatibility for all the MPS
boards, so we might as well take advantage of this to simplify
the vmstate for the FPGAIO device by folding the counters
subsection into the main vmstate description.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210219144617.4782-38-peter.maydell@linaro.org
---
 hw/misc/mps2-fpgaio.c | 30 +++++-------------------------
 1 file changed, 5 insertions(+), 25 deletions(-)

diff --git a/hw/misc/mps2-fpgaio.c b/hw/misc/mps2-fpgaio.c
index f3db88ddcc8..72598c8a3d2 100644
--- a/hw/misc/mps2-fpgaio.c
+++ b/hw/misc/mps2-fpgaio.c
@@ -285,41 +285,21 @@ static void mps2_fpgaio_realize(DeviceState *dev, Error **errp)
     }
 }
 
-static bool mps2_fpgaio_counters_needed(void *opaque)
-{
-    /* Currently vmstate.c insists all subsections have a 'needed' function */
-    return true;
-}
-
-static const VMStateDescription mps2_fpgaio_counters_vmstate = {
-    .name = "mps2-fpgaio/counters",
+static const VMStateDescription mps2_fpgaio_vmstate = {
+    .name = "mps2-fpgaio",
     .version_id = 2,
     .minimum_version_id = 2,
-    .needed = mps2_fpgaio_counters_needed,
     .fields = (VMStateField[]) {
+        VMSTATE_UINT32(led0, MPS2FPGAIO),
+        VMSTATE_UINT32(prescale, MPS2FPGAIO),
+        VMSTATE_UINT32(misc, MPS2FPGAIO),
         VMSTATE_INT64(clk1hz_tick_offset, MPS2FPGAIO),
         VMSTATE_INT64(clk100hz_tick_offset, MPS2FPGAIO),
         VMSTATE_UINT32(counter, MPS2FPGAIO),
         VMSTATE_UINT32(pscntr, MPS2FPGAIO),
         VMSTATE_INT64(pscntr_sync_ticks, MPS2FPGAIO),
         VMSTATE_END_OF_LIST()
-    }
-};
-
-static const VMStateDescription mps2_fpgaio_vmstate = {
-    .name = "mps2-fpgaio",
-    .version_id = 1,
-    .minimum_version_id = 1,
-    .fields = (VMStateField[]) {
-        VMSTATE_UINT32(led0, MPS2FPGAIO),
-        VMSTATE_UINT32(prescale, MPS2FPGAIO),
-        VMSTATE_UINT32(misc, MPS2FPGAIO),
-        VMSTATE_END_OF_LIST()
     },
-    .subsections = (const VMStateDescription*[]) {
-        &mps2_fpgaio_counters_vmstate,
-        NULL
-    }
 };
 
 static Property mps2_fpgaio_properties[] = {
-- 
2.20.1


