Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD1D376ED2
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 04:33:30 +0200 (CEST)
Received: from localhost ([::1]:52386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfCmW-00029z-AC
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 22:33:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC8I-0003VJ-PR
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:51:55 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:34613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC89-0005Yp-WB
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:51:54 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 t2-20020a17090a0242b0290155433387beso5537904pje.1
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ObkIztaGC6a7pVE6TIEKtyoNhb2comi6sJZolj2TpM0=;
 b=rbRUCdLxtG+ui6vz1v7bVF1YZKfdmtggHIGUQ6yARpVwNwXRPcrnL6qh6xDn45teOI
 Icfdox8YzKP5nTSO8JUPlrONgr+GfQBh9uVkvLiFqqR6/364pQszstyrolN8N6RSCHgg
 EjnKXtmuk2VuboluTtATNF5AWthKr+/MLye8fKUMhkwXFr5A9tsDSqlZepp6EcM5kn2R
 AClbUJmWPH0A+zoItJ/IamBxE/Ru9VvFl7EdV9oJmkBcwjXbnUkSVv6xPPK2GpIc0MOq
 J91MA1OSizSjIN0ckq467dWfaoK6FelCKjmGZBHNzTZcSVSu+yfqJLMmwWXcICBNOJC1
 /fgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ObkIztaGC6a7pVE6TIEKtyoNhb2comi6sJZolj2TpM0=;
 b=SSk4qdzlrzkNA9C4pGIDRtO1HMJYQAxpz2S1BTZdhpTKZxO6qc0Y9G6lDC47rRKuwq
 7x+gz8xdYTNQCtiPaPAvKjakv2i0Rjz+n2bpja//24ZeIL/eHYharafO8OYB6rLyuKJP
 UpScfx+zX2x43qKMrM4KqMpaRqvH0FmSXH/xWOHite8vJoT4oN4ma8S+I92JdnvE2BVZ
 kyjrDhrmPaZFhBhuHDW1X3iLxfRnjghuTtnO8x0CA6i/cRXgqWyjNLiZLjp9AlgPe2p1
 An0JcKmrnygIpSMBN/dx4OyJYt2cDOPMss/wwTszAZXSa1ZivyXKy4SBGWWFafxgK4YU
 T7zQ==
X-Gm-Message-State: AOAM530KODKB+tlM0vF8NorgOiroGvY/oKmjqqLKTek//3w+2CIxztJe
 lOUC/HL91bSXUODkERbThEnrtVmjOGjl/w==
X-Google-Smtp-Source: ABdhPJwf5lkioWg+ZuActWuJpOq3YHusoNLw230pPOcBGUqwz2I5Rv2fymhPt2ywtr+Xw0jYHAo3ow==
X-Received: by 2002:a17:90a:7605:: with SMTP id
 s5mr25617979pjk.166.1620438704731; 
 Fri, 07 May 2021 18:51:44 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 204sm5861396pfw.158.2021.05.07.18.51.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:51:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 63/72] softfloat: Convert floatx80_round to FloatParts
Date: Fri,  7 May 2021 18:47:53 -0700
Message-Id: <20210508014802.892561-64-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508014802.892561-1-richard.henderson@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Cc: alex.bennee@linaro.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 7050d8f012..faccc8df41 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -5794,10 +5794,12 @@ float128 floatx80_to_float128(floatx80 a, float_status *status)
 
 floatx80 floatx80_round(floatx80 a, float_status *status)
 {
-    return roundAndPackFloatx80(status->floatx80_rounding_precision,
-                                extractFloatx80Sign(a),
-                                extractFloatx80Exp(a),
-                                extractFloatx80Frac(a), 0, status);
+    FloatParts128 p;
+
+    if (!floatx80_unpack_canonical(&p, a, status)) {
+        return floatx80_default_nan(status);
+    }
+    return floatx80_round_pack_canonical(&p, status);
 }
 
 /*----------------------------------------------------------------------------
-- 
2.25.1


