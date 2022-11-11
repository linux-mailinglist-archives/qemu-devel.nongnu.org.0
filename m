Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB2B6254A3
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 08:52:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otOft-0006en-MM; Fri, 11 Nov 2022 02:42:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOfq-0006a0-52
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:42:02 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOfo-00005x-LT
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:42:01 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 q1-20020a17090a750100b002139ec1e999so4063293pjk.1
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 23:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=vAH5UQ1VorYpkAuxK6us0chqcuZbbeFNgh5YdpTMZU4=;
 b=pjIOmnmTnAI3rFR9Ag383XRZY3XCxAMSuzhEzk5qlrMPXk5OS92MNScx3f3YI+GSF7
 ZEHf6RKfj9EYyXF9UtKoebRIPL5uQJ045vuSzMcElOKGZZf4r6YFgRaGREfHaVqG2SyF
 M3syhOqk6p2qrwm2Ek0p1jGlXBiURXmE4JXa4EZeQy+3RgBsSltFaQUbc/6104EcZO2/
 ncoTVLbPOml4ET78+xmYgzBXKwPP4vY/KYtYMClBh+ThhJgiiqtGci6Q5CjZh+zxwTb/
 Nww4PPGJ+ks6dqhlNdH2YOCV+tgmWywWO+3eDlEP5R+ju8biSaqE0oDt/MfqszkT4xc6
 ujgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vAH5UQ1VorYpkAuxK6us0chqcuZbbeFNgh5YdpTMZU4=;
 b=Ul1ax/QKq5XwQAxrNt21fde+96wFVcmtfNyfTC68nRoWb4g0hLfesPUaiR2Ll6NmmN
 cekO4PxTB167Uj7h2VkH3LSBl5/bB27UoJ242rJLWd27FuacUQRrlkv6Fk6eswOE+3XB
 bXLU5FWCRe4WEdF8FIDiUBnXeSE024yHmQZ4+glAagCJ6RueL9FEGWl4LwJ9bvIVJvky
 Qor6Kuc6+iYkH+qj6l6WT7YHAd7KuZPFwDFRZDvS8sxm5h7MNhKI2ViG738Aq+klQVJ/
 zhF2MhF56khItiQS0m7Lb4Gs6UsS5Nzb6qyQRrBpc5bRAdswGxlZHBVwh0jg1omIQmPL
 xQmg==
X-Gm-Message-State: ANoB5pmZgXud8oZrdxQsNqQitQwfcvAaD1MWlMcnaw2ufdmKSA4ncbg4
 lO0OousBdqoNkVfMHOaaVtK/mikB+l2pGDed
X-Google-Smtp-Source: AA0mqf7w8OdjbvSLy+ITth9GmwaEGf10yW9UC5eB7bvS8yFhYMyElkj3KsR1P/FdNVygdeU3rKxP0A==
X-Received: by 2002:a17:90b:3a8e:b0:212:b4a9:889f with SMTP id
 om14-20020a17090b3a8e00b00212b4a9889fmr674926pjb.12.1668152519160; 
 Thu, 10 Nov 2022 23:41:59 -0800 (PST)
Received: from stoup.lan
 (2001-44b8-2176-c800-0aef-59aa-1faf-7e61.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:aef:59aa:1faf:7e61])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a170902d4cf00b001754fa42065sm976069plg.143.2022.11.10.23.41.57
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 23:41:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-8.0 v3 22/45] tci: MAX_OPC_PARAM_IARGS is no longer used
Date: Fri, 11 Nov 2022 17:40:38 +1000
Message-Id: <20221111074101.2069454-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111074101.2069454-1-richard.henderson@linaro.org>
References: <20221111074101.2069454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c                | 1 -
 tcg/tci/tcg-target.c.inc | 4 ----
 2 files changed, 5 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index bdfac83492..05a24163d3 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -18,7 +18,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "tcg/tcg.h"           /* MAX_OPC_PARAM_IARGS */
 #include "exec/cpu_ldst.h"
 #include "tcg/tcg-op.h"
 #include "tcg/tcg-ldst.h"
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index f3d7441e06..c1acaa943e 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -197,10 +197,6 @@ static const int tcg_target_reg_alloc_order[] = {
     TCG_REG_R0,
 };
 
-#if MAX_OPC_PARAM_IARGS != 7
-# error Fix needed, number of supported input arguments changed!
-#endif
-
 /* No call arguments via registers.  All will be stored on the "stack". */
 static const int tcg_target_call_iarg_regs[] = { };
 
-- 
2.34.1


