Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA486F521F
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:45:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6tW-0004Ta-2f; Wed, 03 May 2023 03:27:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6tN-0003uV-0u
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:13 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6tK-0005cO-OK
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:12 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f192c23fffso29634375e9.3
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098828; x=1685690828;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AcrCNc6GHVuEoru3kSHnYFGlGWejrWeSQLskEC2DiQ4=;
 b=qVDqs2MGhLYTlj7hzQDI3N3SIA9oiuL7GAQoBBQpXJ7x/u9FlmsCSxpDZkWRs+tHO0
 TI1tc4OVtbZ48PIJNQWK7yREnGh0/UGDDa9O35Q587iNSupUj3zz6l6/vZjFyPEmv1Lq
 0ue2WVSDBz8je4qU0GmhfUYk7yHBTAuzDteEQG2b9z8TiWPD0qdpQbm5BI5p0h5cqxyt
 gpziLiB6sHIMUtKP8DJyfAa3e6vds3bRCHbnlyrEjX3wyymWbyqP0FJVCHmR2CBdY2b9
 hoZbvMkCgm61XO65rjUHAO02vq7Jb6MXUCwHbmbDMwQ/NVibjeYqo9mCKhVaByIJr8Vd
 BXbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098828; x=1685690828;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AcrCNc6GHVuEoru3kSHnYFGlGWejrWeSQLskEC2DiQ4=;
 b=fBTk0fNyzl0S5+5wkjAyD0xz5jw7u2GrzqKbdKpD72OFHLHGVq9HvOZ8MZWbCoHlfQ
 Cy0+6AkgZFZW/UsI1j8LgGSdtBItQH7PCpre8Y9Qq7VLz9BhxtBx2tVXP5ApooRC3yf3
 WubtBJiROAWk2YglNFSiEtN4LMEFGxVtprLK7so1sbhaqcQDFPqXPcJSEGx46GzMcNbB
 wzdjPtzP9WE1g0zLIIUgXELrlhDtNqa48uxriDfxfbP3hfvrq7zlgB06kA2uFgeYAvY8
 pUkb8KrzcSrxeWIDHMWYIks+K5LqADYrrhoyG3Wg4Un8r3XbwJhl0wvIbNtNsck8SHfZ
 2z1w==
X-Gm-Message-State: AC+VfDwvCXg1g/Pq3iAi68aqj1IT0vEKKkIHLtCOz+gIGXjp3MsFiPPL
 EsrFj81dCocvGQiy4XfioRUqse1HGQ1qgsgnQfeKRw==
X-Google-Smtp-Source: ACHHUZ5VoY8j+ctPkIrXPPNDX0TdOolU+xineKqBhY1FMUz0i1NGB2DGGZpqYH7UG3PjLbt7pdD4WQ==
X-Received: by 2002:a05:600c:2042:b0:3f1:7e3a:2ef2 with SMTP id
 p2-20020a05600c204200b003f17e3a2ef2mr14570395wmg.14.1683098828551; 
 Wed, 03 May 2023 00:27:08 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a7bc3c4000000b003f1745c7df3sm974315wmj.23.2023.05.03.00.27.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:27:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 47/84] tcg: Remove outdated comments in helper-head.h
Date: Wed,  3 May 2023 08:22:54 +0100
Message-Id: <20230503072331.1747057-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/helper-head.h | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/include/exec/helper-head.h b/include/exec/helper-head.h
index f863a6ef5d..a355ef8ebe 100644
--- a/include/exec/helper-head.h
+++ b/include/exec/helper-head.h
@@ -1,18 +1,6 @@
-/* Helper file for declaring TCG helper functions.
-   Used by other helper files.
-
-   Targets should use DEF_HELPER_N and DEF_HELPER_FLAGS_N to declare helper
-   functions.  Names should be specified without the helper_ prefix, and
-   the return and argument types specified.  3 basic types are understood
-   (i32, i64 and ptr).  Additional aliases are provided for convenience and
-   to match the types used by the C helper implementation.
-
-   The target helper.h should be included in all files that use/define
-   helper functions.  THis will ensure that function prototypes are
-   consistent.  In addition it should be included an extra two times for
-   helper.c, defining:
-    GEN_HELPER 1 to produce op generation functions (gen_helper_*)
-    GEN_HELPER 2 to do runtime registration helper functions.
+/*
+ * Helper file for declaring TCG helper functions.
+ * Used by other helper files.
  */
 
 #ifndef EXEC_HELPER_HEAD_H
-- 
2.34.1


