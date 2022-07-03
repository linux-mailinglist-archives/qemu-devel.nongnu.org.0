Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6475645C7
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 10:27:29 +0200 (CEST)
Received: from localhost ([::1]:37208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7uwy-0002i1-EM
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 04:27:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uuF-0006UL-Ns
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:24:39 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:46668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uuE-0005p1-8n
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:24:39 -0400
Received: by mail-pg1-x52b.google.com with SMTP id s27so6221402pga.13
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OyhgMtHZywg9GRP+8mihPGj8BuF/naRM6gs7r7z8hHQ=;
 b=ZJa/BhCdw3nBLUTg7JIYQgmw28aG85EwS2+jkg2CpG55qsVxDWl8VDBLQ6JkQJOfCb
 r3dSK5fx2MJAB2YHdpIS29fjqlTWolNk/qYQz4Jxitmd5EVJlLPyY3qFRUkU9i7AItDY
 GYtXoCjYiV5JxlFtFjPUxDZUx0nsFZHH1xMT1TtBYLJ1HJqvrf3gJ6YTLMi8ZA99olgu
 /xLMbQ1APYyjcRJxZVMdBMt2huR9NlEeFQoM+xiVqN5K9RdQqlHqHNGHrhTzCTebJkhm
 q8RgVvANVFBd82Vs8+BHuLfXkWGYSs/PeROnBPncTqm03FeduNZVshAIHOBCvQpBGGCS
 6gzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OyhgMtHZywg9GRP+8mihPGj8BuF/naRM6gs7r7z8hHQ=;
 b=bIbx1IbtGldsg3ZvsCE/k8ND1iv4lqnvGrPLSrRzZCgx8ekdqLK9MWu8tBL31zuSUv
 cf/nJuaKbAR71l3m8nFQ2asRXINtLkS2B+9HFbBECIQRrHDNEteY7q9P6FPYxlZt06YD
 5MZYIeHJ5JxUQP5AzHN8Kdo2hQuzIM+BWFgD38XOWcGLZHTZPs87p5+nIttbMXsHo9Up
 R2WhcV7QecUZM/+x+PP0I+Q/ffpvBsasiENFAlIIi2yQO/JBwVKhn9uLOP6qOB98rD1i
 kwmb+V7cAOtzxE5Blco4hjCklSkJ+u9/4EHKtskEeIyild5+mWOYuyg8hApvIU39GSv5
 DZ1g==
X-Gm-Message-State: AJIora8SQ7AWOOJdAtBma9y/sefeqDBCnufcfaW3XSXe4PU7rasTxa0+
 jOWod08QziKXcMrJZl7kLsUY6RKkxpd4VfuY
X-Google-Smtp-Source: AGRyM1sCjs6VALRtHkSuTpq8sTOH9gCkRWWMqucFoBOA3AuKc4BPP6zuVZhFcoZ5UYsTAxpwy8gaww==
X-Received: by 2002:a63:1047:0:b0:40d:7553:d897 with SMTP id
 7-20020a631047000000b0040d7553d897mr19436627pgq.485.1656836677017; 
 Sun, 03 Jul 2022 01:24:37 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 im22-20020a170902bb1600b0016a3f9e528asm13569112plb.57.2022.07.03.01.24.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:24:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 04/62] target/arm: Record tagged bit for user-only in
 sve_probe_page
Date: Sun,  3 Jul 2022 13:53:21 +0530
Message-Id: <20220703082419.770989-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Fixes a bug in that we were not honoring MTE from user-only
SVE. Copy the user-only MTE logic from allocation_tag_mem
into sve_probe_page.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve_helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index db15d03ded..0c6379e6e8 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -5337,6 +5337,9 @@ bool sve_probe_page(SVEHostPage *info, bool nofault, CPUARMState *env,
 
 #ifdef CONFIG_USER_ONLY
     memset(&info->attrs, 0, sizeof(info->attrs));
+    /* Require both MAP_ANON and PROT_MTE -- see allocation_tag_mem. */
+    arm_tlb_mte_tagged(&info->attrs) =
+        (flags & PAGE_ANON) && (flags & PAGE_MTE);
 #else
     /*
      * Find the iotlbentry for addr and return the transaction attributes.
-- 
2.34.1


