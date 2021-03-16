Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B2E33E14E
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 23:22:52 +0100 (CET)
Received: from localhost ([::1]:53978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMI5T-0006nv-76
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 18:22:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMHqo-0005fH-Oc
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 18:07:42 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:43813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMHqn-0002bX-2I
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 18:07:42 -0400
Received: by mail-qk1-x72d.google.com with SMTP id b130so36940561qkc.10
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 15:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yPAAjWDyig+xlHGQhaJtz36xF4S8yrbGq7nm4d8cwIk=;
 b=vLhsWJLZ01GGVfU9I8YpizQfL5b4XIGriaSa4gwymIC2L9bF2MGD98Lm2xIHgnyJ5E
 odjszg3d0iu82c+QChgPZR8cisrABuwQxmJbEd3Fp6wkPJyjwGau1FDNzOIR9vruSwLn
 4XbqwRyhxhhM/XFBeB+H3yWMblK70pMRIdRzXgziKithSf7c3oaFGOFbLFFkyU46Fyek
 YQJVLTtTGrM83USQAtv44gV+NgQVTkUqYO/D0X1Es3Am5TBioVtOiUWDKKFEj42PstA1
 5z3iWL90xmX1js6h/nR59QNoqe4TS/6QE7PaEUnygT/3ozoR+YHWOD0ANMZpL0NdZLgi
 VS/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yPAAjWDyig+xlHGQhaJtz36xF4S8yrbGq7nm4d8cwIk=;
 b=F5Jvczk0Gy7Jqk6/3CFjnp40s2gmTwt+2k8W6wzEdawgHWvzQpiNpTTlUoqBqH4zcK
 /7StlstSRTepODCVQgFmDxnbQ8lDvsjeNhXY2rS810l0+hn69fZt2pBmoGV2qIYQkgD4
 M12UE3sTlu7cFVEdQv7N4pRbNw6qvauwqSiwnlx004TlSsX4Sgvhw41tT1+oe6R5U9Sa
 JFho3pFsu9X7u4tY4+Fn0fF6D9mM58Ye2sf+TUmWaQvXplzpbBHJn+4SUo7dWFDXVaAq
 jW2e5moPjb89RJLe4Bi/9WaiO57q7ZwBC7C9ll2rIqF7Id47kEW9ejQzr8ww7GL6NhnR
 OcAQ==
X-Gm-Message-State: AOAM532Uge5KLmZJRERtN1TqUwC2G1qnyC4sU6X/d/8ofAKVl96VoVij
 6UMb5I629on/haSAlx46Y/89+hBfNWXEfj8q
X-Google-Smtp-Source: ABdhPJytHDAaofizcwi63+kjWp+nbOYEuA5Y+p7QvOAlsdNLawQRzA9dOIb83RbsK5ZHbmAmAPIlgw==
X-Received: by 2002:a05:620a:2111:: with SMTP id
 l17mr1264012qkl.399.1615932460071; 
 Tue, 16 Mar 2021 15:07:40 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id n77sm16546918qkn.128.2021.03.16.15.07.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 15:07:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/5] tcg: Do not elide memory barriers for CF_PARALLEL
Date: Tue, 16 Mar 2021 16:07:32 -0600
Message-Id: <20210316220735.2048137-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210316220735.2048137-1-richard.henderson@linaro.org>
References: <20210316220735.2048137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72d.google.com
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The virtio devices require proper memory ordering between
the vcpus and the iothreads.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-op.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 70475773f4..76dc7d8dc5 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -97,9 +97,13 @@ void tcg_gen_op6(TCGOpcode opc, TCGArg a1, TCGArg a2, TCGArg a3,
 
 void tcg_gen_mb(TCGBar mb_type)
 {
-    if (tcg_ctx->tb_cflags & CF_PARALLEL) {
-        tcg_gen_op1(INDEX_op_mb, mb_type);
-    }
+    /*
+     * It is tempting to elide the barrier in a single-threaded context
+     * (i.e. !(tb_cflags & CF_PARALLEL)), however, even with a single cpu
+     * we have i/o threads running in parallel, and lack of memory order
+     * can result in e.g. virtio queue entries being read incorrectly.
+     */
+    tcg_gen_op1(INDEX_op_mb, mb_type);
 }
 
 /* 32 bit ops */
-- 
2.25.1


