Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 635D0457266
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 17:08:40 +0100 (CET)
Received: from localhost ([::1]:56732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo6RL-0000Mo-B3
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 11:08:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6OB-0004sF-EX
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:05:23 -0500
Received: from [2a00:1450:4864:20::334] (port=39671
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6O9-000489-By
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:05:22 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 n33-20020a05600c502100b0032fb900951eso10861270wmr.4
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 08:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Sren8Rs9KrckHqTU0/cCTHuf97eHdguy2sz601ndxB0=;
 b=IFKfDbMKT149DWgJhLvY0juZonB3wgyVDeJjj44SfM6oGfS8lfrS1n0a90qrsovs68
 4H0wRWqlcuez51qi6Vv935heNSS3j4DUbUO2npJtbxxL/0U554Zj+Bq+RfD6Vj4IsA4u
 5NMuDMc4gbn8xZ5f89KyUDuflbOIADHN5mxKKdmy4mK5ludhINPjwilewD6ZliDCz2pG
 TmhWi7mNzzq+OWotqkhf4fn2P1zALYR5XdLEjNYk/0nbLFCwq45M8MDdY+CzTuJz8Bj4
 KmjaQXmvHHpmHo6FlymBbwHqztu6VbZwL/Ks9q0J4mcNv9z8zsVlN4n51vvxTbaFPSX+
 ZWqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Sren8Rs9KrckHqTU0/cCTHuf97eHdguy2sz601ndxB0=;
 b=VkqNmUCpYrbEAdZs/4wst8mj2Ggut+AcvDmW6qbScXM5WQxWZYpO7NlW35H6+BOeoB
 IK2xxN6rKo26s1ByD1BFgrqQMBYBxHZGhIfI8HOtgbbt6EgvZuQD0owwfiDjFsF2pC9u
 bBElg7BwDZr2rInndiuyNemL7yTebAqGaLc9LTDrUHJRV695gLOTgdfV5m2fCSQPN4bM
 Vuu7WQM4FUUN/Uscc5sVUjIRuag7qTTdSTcY4jL7xsIGaJ3XZ18k7oMhEsNQndByWjka
 EsqzaQoBrIurFVoKD6DEmZX8SO2x+ti++le9OPOFz2KwyCJwGlZlOPM2Rv2Z0d9R8iM1
 s50A==
X-Gm-Message-State: AOAM532dg/EDKasUdKRa4Jj6NdQ94kFc0MOBz3LGquED26c3KROqYuqO
 MjPKNj2h33jPjE+zBJqWLdIz/TLz2tBmRgu4qJo=
X-Google-Smtp-Source: ABdhPJwK4FnaSJcM/gVAgrAmzBMp1zltEw55bV5t45EfUKr7vUm+1fhFKS4gM/nlbZ3Fo6wT+Ighdg==
X-Received: by 2002:a05:600c:34d6:: with SMTP id
 d22mr868081wmq.111.1637337918611; 
 Fri, 19 Nov 2021 08:05:18 -0800 (PST)
Received: from localhost.localdomain
 (165.red-37-158-79.dynamicip.rima-tde.net. [37.158.79.165])
 by smtp.gmail.com with ESMTPSA id q84sm14044877wme.3.2021.11.19.08.05.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:05:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/35] softfloat: Add flag specific to sqrt(-x)
Date: Fri, 19 Nov 2021 17:04:32 +0100
Message-Id: <20211119160502.17432-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211119160502.17432-1-richard.henderson@linaro.org>
References: <20211119160502.17432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, alex.bennee@linaro.org,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PowerPC has this flag, and it's easier to compute it here
than after the fact.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/fpu/softfloat-types.h | 1 +
 fpu/softfloat-parts.c.inc     | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/fpu/softfloat-types.h b/include/fpu/softfloat-types.h
index 5a9671e564..33224b5f22 100644
--- a/include/fpu/softfloat-types.h
+++ b/include/fpu/softfloat-types.h
@@ -156,6 +156,7 @@ enum {
     float_flag_invalid_imz     = 0x0100,  /* inf * 0 */
     float_flag_invalid_idi     = 0x0200,  /* inf / inf */
     float_flag_invalid_zdz     = 0x0400,  /* 0 / 0 */
+    float_flag_invalid_sqrt    = 0x0800,  /* sqrt(-x) */
 };
 
 /*
diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index b8563cd2df..cc8c2c3aee 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -869,7 +869,7 @@ static void partsN(sqrt)(FloatPartsN *a, float_status *status,
     return;
 
  d_nan:
-    float_raise(float_flag_invalid, status);
+    float_raise(float_flag_invalid | float_flag_invalid_sqrt, status);
     parts_default_nan(a, status);
 }
 
-- 
2.25.1


