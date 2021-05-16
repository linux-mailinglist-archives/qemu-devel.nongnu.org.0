Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90830381EDF
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 14:49:29 +0200 (CEST)
Received: from localhost ([::1]:33492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liGD2-0007dV-Hw
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 08:49:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFyw-0007PS-K3
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:34:56 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:37609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFyl-0007lj-V5
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:34:50 -0400
Received: by mail-qk1-x72f.google.com with SMTP id i67so3308705qkc.4
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 05:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fk8y2yS7knqViGJ3bJXKmDCpU5b8/c3S/Dv6Z84fdLg=;
 b=KPt/sMI/b+t6yzUc0Z6fAgmnLdgLSLH2WQP4OLyEu+8yW2KDU7BBFVnO9cSVLqJDhp
 XlQMvFaf7j9Rx/2YRDsZgOTccIJK7WHsDMOTQ5SAw4ZZmzhbvT9uZNhPHFQQiN0JUtzM
 u6TNXORYi1Krs/RRQffIZmqKQy738g4dlxt/baz3B7mR/JVHU/y+uP9VkPlTwzD/8MRh
 At9nN3/Ymh99h3QX9dOtHBmPQdsmQYV6JhfPTytEWkaFF2TT6INL3PH4ZWVigaORAh/0
 z4QIR7PfY380uMCujPewl2nGwaGP9aRuottl/TGGD+TfbHufDWWDVTkpem938KzwAuDl
 lcGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fk8y2yS7knqViGJ3bJXKmDCpU5b8/c3S/Dv6Z84fdLg=;
 b=lAJ8ckdZF0pwciO0ZOJC1bhw4Z52ObZtIFIuo4q04Af6OAKF0TbWyW8w6hwpnH+iyu
 fvYFxnTzUmun61bLObcXDAuQZ70YNRs6dxKFVAXbsNp7hfB6NMNj2Cqtx7mS26vQav/Q
 07hS3U6XvdlvY9KDTCvypbWpkviRhCVZHKHZ+H5sL9gNFLFpPG1OTrRIHVoFA+/+a9EL
 xxgT2E89EiXEvfflX2F9BiPs4nHWGflhWz+Aw4myKwhYrVAL4oVx/X0T8Psq54fcLYmd
 sWnuaURxvvh7FDib7F6QlDCcEeef+2zMC7OlTUlW4OyBXoTXq6sMsGt7iDM5YE+AqTyr
 UcnQ==
X-Gm-Message-State: AOAM533Ouv8Rky+3ZASTSbIN5uT2XJb/xrM0TOTFTIuNYH60UIxYPICX
 fih6EqdQkIdvllGnLeHxy/LXlQ5k1f0zYMeb5E8=
X-Google-Smtp-Source: ABdhPJzQpN7nTxTCjm+7pFocExzbio9L5ITjPdiEY03Dq99QO9dSJ5NQERPNWEgxpMhZ1kkYkP2JZQ==
X-Received: by 2002:a37:a0c9:: with SMTP id j192mr39305170qke.19.1621168483096; 
 Sun, 16 May 2021 05:34:43 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id s5sm8500553qkg.88.2021.05.16.05.34.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 05:34:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/46] softfloat: fix return_nan vs default_nan_mode
Date: Sun, 16 May 2021 07:33:57 -0500
Message-Id: <20210516123431.718318-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210516123431.718318-1-richard.henderson@linaro.org>
References: <20210516123431.718318-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72f.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not call parts_silence_nan when default_nan_mode is in
effect.  This will avoid an assert in a later patch.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index b694e38522..6589f00b23 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -892,21 +892,16 @@ static float64 float64_round_pack_canonical(FloatParts p, float_status *s)
 
 static FloatParts return_nan(FloatParts a, float_status *s)
 {
-    switch (a.cls) {
-    case float_class_snan:
+    g_assert(is_nan(a.cls));
+    if (is_snan(a.cls)) {
         float_raise(float_flag_invalid, s);
-        a = parts_silence_nan(a, s);
-        /* fall through */
-    case float_class_qnan:
-        if (s->default_nan_mode) {
-            return parts_default_nan(s);
+        if (!s->default_nan_mode) {
+            return parts_silence_nan(a, s);
         }
-        break;
-
-    default:
-        g_assert_not_reached();
+    } else if (!s->default_nan_mode) {
+        return a;
     }
-    return a;
+    return parts_default_nan(s);
 }
 
 static FloatParts pick_nan(FloatParts a, FloatParts b, float_status *s)
-- 
2.25.1


