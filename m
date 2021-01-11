Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA2C2F1C67
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 18:33:02 +0100 (CET)
Received: from localhost ([::1]:55792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz13t-0005f1-Lm
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 12:33:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz0rS-0003B4-AF
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 12:20:12 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:37113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz0rJ-000082-4b
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 12:20:10 -0500
Received: by mail-pf1-x42c.google.com with SMTP id 11so325411pfu.4
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 09:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=AC87R9xtxutHL4s1/n8odbHgwbxpwhaLEHoWjKyBlaU=;
 b=U8StMlzyR+6VDwbq6MUKmYp1atbOzVQw/85us9qUqI38Ucs6uKZB1pq9hmKRGs1WK5
 rf/AQ7LNJxd0PNMY2pZgmCsV3D+SNnOFFrJp9pcLcF8W690+GaTuGfLJE4vwDnWtFftu
 bOQB7B4uA0b+zrVI1vwHuEVbjiAOUcSTWvQaAeD9u4aI9XovcC+328+ijgm/L2K+COyH
 MvvEaSpsQzsiZQD+lp1X8BYYHFwl4gZbS/dcohancsS4Cpeb5EhmQa6HzktvRQ9//BIK
 VBh7uC+ZmrJkBBldTSabQNjeoOyKSUXhK/PZ1NfGOtF9VPkEG/EFYuZ9Wj1pb8ErAnl2
 9ViA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AC87R9xtxutHL4s1/n8odbHgwbxpwhaLEHoWjKyBlaU=;
 b=UeVGtzn4IwNvmdp9Bf+xQdZ1e8uxuKjpITyKmnGhB3xB05ZetAumtjCoAe0Vm9Gnee
 zMwmH/E4bWusfSqNcK3AKllj5KGonYcmD3s4iBGIOgTyTPTr4p9NhyM+E2Po/SETm7h8
 ZWT4stIWIcoX0EI/zmNfe1hidRWpXCoYDCM74ybovpBimTJzZQMw0GL4sogVlzpX4mIe
 RrxVtpgkb9KNdA6Bw34PONYzvsjkzO/YecX5A2aLWFCcgI75TM5b/Po+98tGwyNtIXKz
 jFvZEzXppmS4BUJF/zILuwBjVWb1lbTBMAM2xdtp8SkDs6il0qNMPwPOZ26VtbOx1Eaf
 QIEw==
X-Gm-Message-State: AOAM533hpmUju52hhRZR7J8IjhyIJkjjuBbPFhklOaFtyQ/xxcMWgUj6
 CHrzV8alKVJZmqrNctCRZDHIdFhdo3AhNw==
X-Google-Smtp-Source: ABdhPJw5GwxvxjQ5bezHxLwYW2lHcUCGfRI6t71NJYLAtXizqIKTV/fIT2gh3pz0tMY5U3vFuGbIHQ==
X-Received: by 2002:a62:8f0e:0:b029:1aa:1268:fa4e with SMTP id
 n14-20020a628f0e0000b02901aa1268fa4emr403640pfd.18.1610385598775; 
 Mon, 11 Jan 2021 09:19:58 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id k64sm206666pfd.75.2021.01.11.09.19.57
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 09:19:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 05/23] tcg: Expand TCGTemp.val to 64-bits
Date: Mon, 11 Jan 2021 07:19:28 -1000
Message-Id: <20210111171946.219469-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111171946.219469-1-richard.henderson@linaro.org>
References: <20210111171946.219469-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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

This will reduce the differences between 32-bit and 64-bit hosts,
allowing full 64-bit constants to be created with the same interface.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h | 2 +-
 tcg/tcg.c         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 2bdaeaa69c..e7adc7e265 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -506,7 +506,7 @@ typedef struct TCGTemp {
     unsigned int mem_allocated:1;
     unsigned int temp_allocated:1;
 
-    tcg_target_long val;
+    int64_t val;
     struct TCGTemp *mem_base;
     intptr_t mem_offset;
     const char *name;
diff --git a/tcg/tcg.c b/tcg/tcg.c
index e02bb71953..545dd2b0b2 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -3176,7 +3176,7 @@ static void dump_regs(TCGContext *s)
                    tcg_target_reg_names[ts->mem_base->reg]);
             break;
         case TEMP_VAL_CONST:
-            printf("$0x%" TCG_PRIlx, ts->val);
+            printf("$0x%" PRIx64, ts->val);
             break;
         case TEMP_VAL_DEAD:
             printf("D");
-- 
2.25.1


