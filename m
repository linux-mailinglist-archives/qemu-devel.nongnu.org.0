Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DC53F0C87
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 22:17:48 +0200 (CEST)
Received: from localhost ([::1]:32888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGS0R-0004IN-SH
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 16:17:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGRA6-0008Ge-DU
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:23:42 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:40702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGRA5-0002wd-1D
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:23:42 -0400
Received: by mail-pg1-x52e.google.com with SMTP id y23so3313508pgi.7
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=dk0S43b6nxrquRYrbUsZ6pFDuF+19OrA7E9Ry0WMKCU=;
 b=Hvgjtn+gfUbxmrSvpy4LBmTzXMbf/1CiYOs210zPn5O8uuDGwBKJ6CVK40zcXx/oal
 K0Z8xmnJz4oecyujBCmD5/EjvedzhCUfAjTJ6cz2VCSeI2zvl/9gM4oP8bgGwqhbWqPQ
 JFW4dwnnXZUD+ctCbmm0q9HZ07wfJAzv6pZ42YuRNBmNZg/mM3ewSymms3pz5XVMFbBi
 svQzxfQ8cP0CaokXgH6y6n4mqyKsWbakcz82FB7dTkC8OIY3Xz80lpmnF+fy71iL6rf+
 jxUmb99P56f78gQUEN9Jy1ZEkE6n2gLQ6Qdfd5xajgeValOAFDrBQ76/XyvUya2t99vX
 wv1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dk0S43b6nxrquRYrbUsZ6pFDuF+19OrA7E9Ry0WMKCU=;
 b=AXt6AZY2dU2kzHYyb9V9Y+51zaB6tpfKInDK+HLcHBBGGZCQgEytPWvVk8XF3ZlncU
 CxCzoI3u9jFnGGRJXWNvr4Jho9iE+wVmE1w5QRDvbASrU7nEKGS7Xm+FFtWxgkdUccGz
 070feSAg2t8NN3yazRkDJ82UNR/z2yOTYMp7thiDz4jbL4d3NMWNaA9H7YvBVDV7cGYf
 /0FfN2YKg9kR6qiz/8s4z6UjapwSrJ9xTzAebtbdi/fsWK379seCQYVUBqpwDCq8T/4h
 Lo13XdYfweJ7JmqG8A4xHsseyP6Jus7ux9k3dJHbVJYL+izxwPS5t+3gQKbePn9Fj+yI
 ggfQ==
X-Gm-Message-State: AOAM531Zvjmz3v3Bh0CtonttbImkSboeoNWg8RctTOUNqpNZlRqkxTeY
 wxo7Eo20IthULoTPCbjui/yx5uNqbIWWRw==
X-Google-Smtp-Source: ABdhPJyHREZa3S5xfrG8+c+bdZdn7G+sX8YS3//OcMvdf1qTiSiysb84bTU9MSGPLXSH4Zky9h5ykQ==
X-Received: by 2002:aa7:888b:0:b0:3e1:6855:a01f with SMTP id
 z11-20020aa7888b000000b003e16855a01fmr10906062pfe.75.1629314619860; 
 Wed, 18 Aug 2021 12:23:39 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id w82sm569302pff.112.2021.08.18.12.23.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 12:23:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 64/66] tcg: Canonicalize alignment flags in MemOp
Date: Wed, 18 Aug 2021 09:19:18 -1000
Message-Id: <20210818191920.390759-65-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818191920.390759-1-richard.henderson@linaro.org>
References: <20210818191920.390759-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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

Having observed e.g. al8+leq in dumps, canonicalize to al+leq.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-op.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index b1cfd36f29..61b492d89f 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -2765,7 +2765,12 @@ void tcg_gen_lookup_and_goto_ptr(void)
 static inline MemOp tcg_canonicalize_memop(MemOp op, bool is64, bool st)
 {
     /* Trigger the asserts within as early as possible.  */
-    (void)get_alignment_bits(op);
+    unsigned a_bits = get_alignment_bits(op);
+
+    /* Prefer MO_ALIGN+MO_XX over MO_ALIGN_XX+MO_XX */
+    if (a_bits == (op & MO_SIZE)) {
+        op = (op & ~MO_AMASK) | MO_ALIGN;
+    }
 
     switch (op & MO_SIZE) {
     case MO_8:
-- 
2.25.1


