Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0EA42B34F
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 05:20:07 +0200 (CEST)
Received: from localhost ([::1]:51678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maUoI-0002w8-H5
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 23:20:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUL2-0005NT-Mi
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:49:52 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:46935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUL1-00016N-8g
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:49:52 -0400
Received: by mail-pg1-x52c.google.com with SMTP id m21so864318pgu.13
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 19:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=dk0S43b6nxrquRYrbUsZ6pFDuF+19OrA7E9Ry0WMKCU=;
 b=ePbKVg7d4/Ll/Zvxl3RJbsDvQIXm2TU2eLaCgcE5O4zFNe05G3z2KS2MM+aoEhIDmh
 WwV6ZGOx9prd+PuFNWcFQQVSJZFeHbYZE/zcO547DmDmnwaZ/bAe9vvauFYJHG/VdXbF
 n5evVexEQL8/YQ+htjfCUy4KGgS65EFavABID1i/CSayebjf8ORSfxUHsfMpv1WB/8i7
 cWokMwdVA636QdxFuUa9tNZ768R66FcP3ILj3JU3fDoJ6arrbEdIU3RDt3GntNVorW9o
 q8V62/4zAfLlyW0NpqzuG5lDpfbK5uEW10kPwxiNqYop2BchQQ3YjqEE2R+7N3gPWrac
 PYIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dk0S43b6nxrquRYrbUsZ6pFDuF+19OrA7E9Ry0WMKCU=;
 b=NsGRt5VtcbyAeHDLEZny38tNQixV/c+pL3k1AcTDcXeuHKkuI6D9OLMuRu9FacK5JD
 abshp9A8CW0j3+elUEIrTrMp8E7F913tD9b1516vIWCxwWZ1//CYiB0rLZj/Fzzth2hx
 ZndzOP3C8wq3sT7Ab39K3erWGiQQ9e4d6O/rmLIH+UdXetH3iX/wJVaF5lAcz1TtHQ7Q
 AecjCIJNGbtt7gX3Qf6c5R2cGRrcFx1ZYTlGHqDhjTJa572jCt65idCsdKudM0oIAOdr
 QyRjchPhicWzrGybSCv4F8aK8F5nuYt7N8n5ljkhHvbFIqgabyQuwN/r0f4EegBgiiP2
 9vpg==
X-Gm-Message-State: AOAM530T2pV3+gkfjxFHpd/MpF0+YlX90oqFGQSLDkJrOAFHxiskIF5P
 MDEiQLurFQ24SeTuDP8fGr516hhyLnGcoA==
X-Google-Smtp-Source: ABdhPJxMy6i6upbaDsAo1d+CD6oZrYzfVuO+z30GW5b6gOa0C2yNEtpZB4OmniNloFGUqHMRdrlx/g==
X-Received: by 2002:a62:641:0:b0:44b:74bb:294c with SMTP id
 62-20020a620641000000b0044b74bb294cmr36219724pfg.12.1634093389796; 
 Tue, 12 Oct 2021 19:49:49 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y20sm12579610pfp.68.2021.10.12.19.49.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 19:49:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 41/48] tcg: Canonicalize alignment flags in MemOp
Date: Tue, 12 Oct 2021 19:46:00 -0700
Message-Id: <20211013024607.731881-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013024607.731881-1-richard.henderson@linaro.org>
References: <20211013024607.731881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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


