Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A37371D25
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 19:00:21 +0200 (CEST)
Received: from localhost ([::1]:48752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldbvg-0006wa-R4
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 13:00:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ldbr6-0002B2-Tw
 for qemu-devel@nongnu.org; Mon, 03 May 2021 12:55:37 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:42790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ldbr0-0003wa-SL
 for qemu-devel@nongnu.org; Mon, 03 May 2021 12:55:36 -0400
Received: by mail-wr1-x434.google.com with SMTP id l2so6301543wrm.9
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 09:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0X6grANLwk+ExZnCAqsNBYR2iXdC0Vt7l7CQDrbCCds=;
 b=pgcTQqQi4c+8651MpF6VT7qy9wgG0PklaNSRcSzaRNqKI+bvBLftxuTJ9g5HJ4y5nx
 DR+25tHSjSjDmg3GI8/yfx41T7rBWOzFiY6nxKxDq14Unqv3MQbTj904cou5+FN6hqLJ
 T5uN2x6GS2oGMOJlEDOM5KFMZLB3FlwDmQ/A/7/QYQ1Lzl/o2RZPaZ5N5W9eFZkSarrh
 7oY5YWsuHhGwhomvlTdQBHIa1n4tf70hrV1k3spS+NMWBCeIGnxsG/xqqzL4A4juAZ5f
 dPLhGjqJWVWwSYExg6lYcNvqEyP22q1A8mxLBN9aCNcThbhAZWLvejiplWjAFW0+LpJK
 kHHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0X6grANLwk+ExZnCAqsNBYR2iXdC0Vt7l7CQDrbCCds=;
 b=HcFlOyX1/Wn2Ew44mmoCkMgAOUCLh8gYWAMU1fy/iHguHz64ScCoNKgKqZRsbQmpgq
 HzfWkDLtMgSbDry3ij/KcUNyTNxUwv5L5lv+WwwyZnorHL2Qufnjo6RtzMS3DZDxCKwU
 7hVz6O9mXLmucWSA/6wlJC2+5ZNtJt2NTjF40t+g9bLcoUUCJvXBz2ndG40HmeHGCcB+
 pJ1KsnzOVjzUy+L1etNUSSj+uchmShtqghDw92XWsIenspSH5I/rohezuAnLVK4l10Sc
 uYje1WzoA2irxTAuB0F3OuY/gc6EN+MHF3PGDSQTe+A94yoWD2Le5oQKKajL12zJeBlI
 72XQ==
X-Gm-Message-State: AOAM531wbiXr/KjTvMNXU8LhJW5pWaIT7tVOS0C3XWMjXaqy0DeDa1WN
 HquBmDhTjwpiJf5RYC0Uvo6k9sEpb5v9ww==
X-Google-Smtp-Source: ABdhPJzHyBLSngHI27/jgBU7BdwT/atkOgUw4wQP2BeqUZqTfLLBxCHOO9waw4693KE3EdqnMrASvA==
X-Received: by 2002:adf:ef4d:: with SMTP id c13mr25740095wrp.277.1620060929081; 
 Mon, 03 May 2021 09:55:29 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l12sm15282794wrq.36.2021.05.03.09.55.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 09:55:28 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] tests/qtest/tpm-util.c: Free memory with correct free
 function
Date: Mon,  3 May 2021 17:55:23 +0100
Message-Id: <20210503165525.26221-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210503165525.26221-1-peter.maydell@linaro.org>
References: <20210503165525.26221-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Corey Minyard <minyard@acm.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

tpm_util_migration_start_qemu() allocates memory with g_strdup_printf()
but frees it with free() rather than g_free(), which provokes Coverity
complaints (CID 1432379, 1432350). Use the correct free function.

Fixes: Coverity CID 1432379, CID 1432350
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
With newer glib (2.46 and up) g_free() is guaranteed to be the same
as free(), but matching things up is neater anyway.
---
 tests/qtest/tpm-util.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/tpm-util.c b/tests/qtest/tpm-util.c
index b70cc32d600..3a40ff3f96c 100644
--- a/tests/qtest/tpm-util.c
+++ b/tests/qtest/tpm-util.c
@@ -289,6 +289,6 @@ void tpm_util_migration_start_qemu(QTestState **src_qemu,
 
     *dst_qemu = qtest_init(dst_qemu_args);
 
-    free(src_qemu_args);
-    free(dst_qemu_args);
+    g_free(src_qemu_args);
+    g_free(dst_qemu_args);
 }
-- 
2.20.1


