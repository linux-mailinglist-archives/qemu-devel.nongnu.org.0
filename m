Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3123D4612BE
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 11:43:03 +0100 (CET)
Received: from localhost ([::1]:35726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mre7h-0006tT-Ow
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 05:43:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mre4B-0002OC-39
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 05:39:23 -0500
Received: from [2a00:1450:4864:20::434] (port=46975
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mre48-0004mn-4A
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 05:39:22 -0500
Received: by mail-wr1-x434.google.com with SMTP id u1so35648414wru.13
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 02:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=6uEVSjpgTVy8n9IaNTLJk5fiY17QBGe2oJgmoK4hlrk=;
 b=aqxe/SjhSgD2XUJjT0eboYXLxyuewhwxS1MgQqSmIpG97L/xlofnm1C3XA6VHKy+LD
 WUwl+nPdDJRiI28aRR/NKXkad/DgmOpld+cCW3ICDjgmgldr5pNPLOJVBhABP60Ej1YC
 Fqc5h4cPfYVmIJfX3fQsxvKTt+7nCx12LqDC0nH4gN8A2i+xoKToKoywpNT7AuxygKg2
 cHA0hXqtwCtV8ffnHJL7Q+oNXhNnEvpFs/Wyl3mhSHaWFM6ZeKJgbo6SlB+wqVoQQwUV
 JJNCiE3NEvOXPSmayC4JF/VIuf7O/SuZ2j8NqAGcbkG3MtCxt/YVXzXjyuq5eZY4PNQt
 ChUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6uEVSjpgTVy8n9IaNTLJk5fiY17QBGe2oJgmoK4hlrk=;
 b=rjrYwBXXuZH0PoWUy2YVWso0QSJuneo+aipVkkm1FE2IpDHeM9pkNHn9mhmZToKO3j
 bwG9uwODM9tF90pjWTmmlOJdo7nSCq0akTWCoatQsbFGb3IgABgPSTzpLHQcqyKs8bVg
 lloWtslitfO9qYwt3sVcI7e/YhDvfMsqA7OSTWHVKL8UKZ64Nzoy1vSL1Ky4CG+r+3oe
 towekeB5/lqhdeKudvAULoX0cwbDzfgzvZ56FBhMWHtwJy/TETqFvggAEMi8KjW9KbOz
 jKU4kxnnleB3AKVElxS22vPtoA5t+dsho1eN9a2vuVJYIXwZ2Q+OR9CbCnwG1voz98QA
 jXvQ==
X-Gm-Message-State: AOAM531vLAKZwj5+T7Fx6WunYd09D9UWC0XElzC3+2gGJJpwLvnhOQ+t
 6MzFfyd8KSJKUHOKrZfh2ie0Qd7gfOydjQ==
X-Google-Smtp-Source: ABdhPJxionqdFVhuvC4e1HpuSw4i220dUcOEH9dxo103XD52RKfj6YZEkT0kheBvnrVd0t76HYKaQQ==
X-Received: by 2002:adf:e0c3:: with SMTP id m3mr32736618wri.546.1638182358558; 
 Mon, 29 Nov 2021 02:39:18 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id t17sm18810912wmq.15.2021.11.29.02.39.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 02:39:18 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 2/5] hw/intc: cannot clear GICv3 ITS CTLR[Enabled] bit
Date: Mon, 29 Nov 2021 10:39:12 +0000
Message-Id: <20211129103915.1162989-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129103915.1162989-1-peter.maydell@linaro.org>
References: <20211129103915.1162989-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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

From: Shashi Mallela <shashi.mallela@linaro.org>

When Enabled bit is cleared in GITS_CTLR,ITS feature continues
to be enabled.This patch fixes the issue.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20211124182246.67691-1-shashi.mallela@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 84bcbb5f56a..c929a9cb5c3 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -896,13 +896,14 @@ static bool its_writel(GICv3ITSState *s, hwaddr offset,
 
     switch (offset) {
     case GITS_CTLR:
-        s->ctlr |= (value & ~(s->ctlr));
-
-        if (s->ctlr & ITS_CTLR_ENABLED) {
+        if (value & R_GITS_CTLR_ENABLED_MASK) {
+            s->ctlr |= ITS_CTLR_ENABLED;
             extract_table_params(s);
             extract_cmdq_params(s);
             s->creadr = 0;
             process_cmdq(s);
+        } else {
+            s->ctlr &= ~ITS_CTLR_ENABLED;
         }
         break;
     case GITS_CBASER:
-- 
2.25.1


