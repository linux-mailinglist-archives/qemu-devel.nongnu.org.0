Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0393677CBA
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 14:41:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJwzy-00068o-Jn; Mon, 23 Jan 2023 08:36:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJwzi-00060a-DP
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 08:36:21 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJwzf-0002Sy-06
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 08:36:17 -0500
Received: by mail-wm1-x329.google.com with SMTP id l8so9024155wms.3
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 05:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qLC1OizCVn68FH21GRDKjbsntWejSNUy0/YImu0bDg8=;
 b=VGZ7W03/KX1ic4nVdv2+VWdXVpUupbOqE3gqbp5b4Mdgvw/dISi9dvGpPsxPUk3hGl
 M71xjWlpx5KPy1kHUFLvCnRNJLesi6MYg5tWioXljWj3aBIzLZsLaUiVTmMg3gogn+mb
 +Wk1xx1B5UANmBBLNG2PZhudz9w0kniNYh+gMKPnQJyrDkPvVQ9v3w0b4kNx56ZDs2XN
 fzCwegpoTDJDjEBspGtSoRiYB+OhOvPVEDBQ0K9nI7wOg1cbG9iw968pd/y3n3Y9u32r
 EkIMqAyHaPUnJY4zihtJxh56rv4ydtPefYvTIFbbs0CZ3pzErGjz3VZ3PtG2qRKhVBZP
 m5dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qLC1OizCVn68FH21GRDKjbsntWejSNUy0/YImu0bDg8=;
 b=hEo7aY+NzmcgAbqKa3JZMOKEMW4prVKLn308ZvUD4hwSfD2XSLcfGkWx8DtZYMFPz7
 YHTeZ0s5TV7+H5Yua67QTFeYcMr2Pz44bhq041v2gtMhVrb+V/hwyfkGgoLyqO5Pu3tn
 bMGJHig+BQm0O3s9Vzk1Bj+/hh8CBY5KCmEaaUFrIBT2WgA/Ta7F3kWaGYqfN1qN8f+n
 RHbYWYwB0lJMFA5BCNzAZcUXK9z8u6q+FKpVfmBV/OYnM/knIcXhpM9d2fTsT7T4lP+V
 rEY3Ck0myEKqvRoT37T9XgS0GyDutuToXSRWqMtpkZBqvdO86Up1wBf9Zz9i8s3hcz/M
 e8ag==
X-Gm-Message-State: AFqh2krTksgvpHTmSknIg+NvAKq9PA43zjyewGz0S/xHuyrp9v9O2Y7A
 Y6VKQltz9/KLS49192bvKhTu3JfZRKYo84TQ
X-Google-Smtp-Source: AMrXdXs0PM2lG8Fdsm0KX8ivbL0bFSkKwnK/+M78+0WV2Sl7LQjt/KqCfcfK4UyjhRYse5+e5Dj7Lw==
X-Received: by 2002:a05:600c:2255:b0:3da:f950:8168 with SMTP id
 a21-20020a05600c225500b003daf9508168mr22875737wmm.35.1674480973751; 
 Mon, 23 Jan 2023 05:36:13 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d19-20020a05600c34d300b003a6125562e1sm10817457wmq.46.2023.01.23.05.36.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 05:36:13 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/26] target/arm: Fix physical address resolution for MTE
Date: Mon, 23 Jan 2023 13:35:47 +0000
Message-Id: <20230123133553.2171158-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123133553.2171158-1-peter.maydell@linaro.org>
References: <20230123133553.2171158-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Richard Henderson <richard.henderson@linaro.org>

Conversion to probe_access_full missed applying the page offset.

Fixes: b8967ddf ("target/arm: Use probe_access_full for MTE")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1416
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230114031213.2970349-1-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/mte_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 86b37548386..98bcf59c225 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -142,7 +142,7 @@ static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
      * Remember these values across the second lookup below,
      * which may invalidate this pointer via tlb resize.
      */
-    ptr_paddr = full->phys_addr;
+    ptr_paddr = full->phys_addr | (ptr & ~TARGET_PAGE_MASK);
     attrs = full->attrs;
     full = NULL;
 
-- 
2.34.1


