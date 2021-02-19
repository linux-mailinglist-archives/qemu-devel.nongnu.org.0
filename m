Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D2031FBE6
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 16:23:14 +0100 (CET)
Received: from localhost ([::1]:54086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD7cf-0008AQ-1m
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 10:23:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73u-0002nT-Ly
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:47:18 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:34490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73R-0003ej-4V
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:47:17 -0500
Received: by mail-wr1-x430.google.com with SMTP id n4so8913036wrx.1
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 06:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=6R2H7Db1FqG+TCsnIWopGNIyqmv4t5RlxdvA/d2HL4A=;
 b=nTqc9AfgNxxUsn9fG5s84VIFprLWXCgd7o8kxyNuo+ptpRLrwHJLo5OaLBBB1PUBde
 l/94HMAeMzm//VJsiPR00g5S4vBk6sw9Yjmz1x6el7oqtlNpA/otZDNm49BcDx4DnQZo
 CTmbWFOBddFOb0tQpXhBGhXOe0ZrcSCQ7jDRUaQQpENuYxpDzeFZ9RJyO+DfmztpoJ0x
 cTrW0sBifEW2wSUaDt3xwyPRAPs/qIj+5sHmaTFa2lQT+4vqppwEFc8PgSdqPJWZudcg
 ALsJpEUsSLBH9AbM2OSvz7GJsRM91M6ZoG0SiLXy75Zd9bK1LeevqURusthd2WEZtrFA
 bs1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6R2H7Db1FqG+TCsnIWopGNIyqmv4t5RlxdvA/d2HL4A=;
 b=dJDKA42JxnSNTRwz6qYe9bvjmT3ouBH7aR25atSZJevWwm4uf0qJ1ZsJ4Ydh5qxTYi
 GC8oo99twKvr7tTJVHUydRKCIL+PhrOPzQMy87d2v65exA7o4AeabZThMvRhquwvQiQp
 jZ1L8zxG/iaDqyGeetD0WAm/I2xds7JuMUia7CvEAJPmfGr3OO8+fVdwX3lvp+rvwLzH
 aIucCoocTKMhHn19KYc6Bz+lqDnNolBWHb11QguKGutHrNWtx/9Mqkx4zde5+Rdbu3kf
 fZIFVz2lVa/8v+Je3mgpfeSMTnX+C+k43evMuI5QrICEhNRtWw81LPs3yUh6/NkSLbqc
 0XVw==
X-Gm-Message-State: AOAM533T/jYPzP4OSg8fQbTdBWksqVwOupxvQUvjTHD4eapDxQZ266Yx
 9wxTW164i973dc9xwXxIoPifeQ==
X-Google-Smtp-Source: ABdhPJwo+bXazC6RrAeyLeF95NELByqHKy54pm9GZKjk5uSixw93wgsObIYBwPc27YeEcgx9EB9Odg==
X-Received: by 2002:adf:82b3:: with SMTP id 48mr9255686wrc.22.1613746007635;
 Fri, 19 Feb 2021 06:46:47 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q18sm2263628wrw.91.2021.02.19.06.46.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 06:46:47 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 37/44] hw/misc/mps2-fpgaio: Fold counters subsection into main
 vmstate
Date: Fri, 19 Feb 2021 14:46:10 +0000
Message-Id: <20210219144617.4782-38-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210219144617.4782-1-peter.maydell@linaro.org>
References: <20210219144617.4782-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
---
 hw/misc/mps2-fpgaio.c | 30 +++++-------------------------
 1 file changed, 5 insertions(+), 25 deletions(-)

diff --git a/hw/misc/mps2-fpgaio.c b/hw/misc/mps2-fpgaio.c
index 76308543fcb..e3fabd58b7b 100644
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


