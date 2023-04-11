Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8386DCEC0
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 03:08:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pm2Sw-0005XL-12; Mon, 10 Apr 2023 21:06:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2Se-0004x5-QZ
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 21:06:17 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2Sb-0000Uh-E1
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 21:06:16 -0400
Received: by mail-pl1-x62f.google.com with SMTP id q2so11146281pll.7
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 18:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681175172;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fIirSFwi2yILi+El/t2TPjJhZKpm7okvdpXO8dD7jMw=;
 b=lTKt+itCjKNifxk7EQUs9xlVFhZ7sChSGzBy97f4HCVIG7myhJaKfztzuoouLfE6aw
 NJ0T9AJkFqi5RGF7N9eiVzRYx7W3CpzTN4F7tpX0CFBRiJB7LlJSuQyJJrRncdMj+ePL
 tqyHW2vxZD+rt3Wkk4oYN7VCWDwnbBr/4YuSF3rljD8jaV+mtd9zU+4nzCTzCkAQ57bX
 dn/iR1zsr9UJiKtvy9CjinIA6xrrf7KWhexJc3PPcbjSc+uZEVZuBdi/UZ8lT07KHjqe
 r64w7L7MKyw8Xh8dEq7PhwNtZ5eYeP8Y3ViL5csx0KVLTqVjvo524xn7D6xCSlW0dxNh
 Ym0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681175172;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fIirSFwi2yILi+El/t2TPjJhZKpm7okvdpXO8dD7jMw=;
 b=BuUzTTmx+MDAxhPNzG08Wmrpk3MwZmG/Z/2ZCMooklKo6+j4VRlBZEOOzg4QbFm7yU
 exTdgWvhKSlv84WP4bWDwuFv2FSZXsgVHv5aaOtPJUqSDQtSjxp43tkLvd+/PmyW+XhS
 KvBEpwgs5eJPBN0hDba8lMQ/rtGMrXifCia/FVqgKM/41D18Xc2wsQgZyV09mHNPBrjB
 LhtK9YyNz9BVFx0sNLuHxGAip1BWGh2RdGF4VvRP2ye4aVHPN37CwqVsV3HUTyFvbjnj
 ruhcHgSyhPfwd0Xe70QY/Zj+S0EGsr4Ct21IlIY9hITTuZs+nG8Axsxs7ayEWi7tGdW8
 bdfw==
X-Gm-Message-State: AAQBX9cIupNA9K8HHwvsITSWQna2UO0lDuYcEGeRAf90t7ZnUnBQ14JM
 gGIsfSbtFKzoP9rskveyY6JqRCNHocC/ysofNzCYjg==
X-Google-Smtp-Source: AKy350ZneI6VWk4ExEUQfLB4UaWsGOpPtTgzh5MPTYgH968KaqM1KqZhrfsWW64zZ2khqVlDGMWpsg==
X-Received: by 2002:a05:6a20:4282:b0:db:c5c:e0a3 with SMTP id
 o2-20020a056a20428200b000db0c5ce0a3mr20633728pzj.10.1681175172674; 
 Mon, 10 Apr 2023 18:06:12 -0700 (PDT)
Received: from stoup.WiFi.IPv4InfoBelow
 (h146.238.133.40.static.ip.windstream.net. [40.133.238.146])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a65690a000000b0051b0e564963sm1320291pgq.49.2023.04.10.18.06.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 18:06:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 19/54] tcg: Clear TCGLabelQemuLdst on allocation
Date: Mon, 10 Apr 2023 18:04:37 -0700
Message-Id: <20230411010512.5375-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230411010512.5375-1-richard.henderson@linaro.org>
References: <20230411010512.5375-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
 tcg/tcg-ldst.c.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tcg/tcg-ldst.c.inc b/tcg/tcg-ldst.c.inc
index 6c6848d034..403cbb0f06 100644
--- a/tcg/tcg-ldst.c.inc
+++ b/tcg/tcg-ldst.c.inc
@@ -72,6 +72,7 @@ static inline TCGLabelQemuLdst *new_ldst_label(TCGContext *s)
 {
     TCGLabelQemuLdst *l = tcg_malloc(sizeof(*l));
 
+    memset(l, 0, sizeof(*l));
     QSIMPLEQ_INSERT_TAIL(&s->ldst_labels, l, next);
 
     return l;
-- 
2.34.1


