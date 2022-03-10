Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 683944D531B
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 21:31:27 +0100 (CET)
Received: from localhost ([::1]:39598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSPRW-0004gj-H9
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 15:31:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSPO8-00087h-Im
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 15:27:56 -0500
Received: from [2607:f8b0:4864:20::1029] (port=55242
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSPO7-0008EU-76
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 15:27:56 -0500
Received: by mail-pj1-x1029.google.com with SMTP id b8so6278105pjb.4
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 12:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z0nTGi36Q6kY2XhTWFaFoUNK+G34o+/T62xUlFxQppc=;
 b=IyMjYUn++pL9X5VfODVSGDopyKpSxSia8jhxaOnmnh2AvYCbNZy8g7+LL7X1HnIANf
 BlqiWrdLyHu2MyOKaoEZzQpJvjiQDeSP/FcWhKCURBX4wh1ou+C5P2gKdz0YMnCazncQ
 FKo7n6Z/g3o1av/5wNQ8wick/FsGwUYLLV6KjdBDz7+mByGwMwKt9ObY7jmK/9q9fxQa
 J0gsyOzpYJX3x5Ppz/h1GxMFROCTmfbMqTNqqQqfxsXHZtvs+D7fIRBFMDgVUy51LkQJ
 dclvYvZIpy0XFmkZDL87XjV0S4uwmIj8NRac0TsjHabnSKNBhwviHYsadnNJB+oJn7dk
 eW1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z0nTGi36Q6kY2XhTWFaFoUNK+G34o+/T62xUlFxQppc=;
 b=Ump9biKERLRJ/yaTUrtHgXI5fCKEwNQjLYpBqG0GIbl7PgPtJUjzJ7OoKfBm1eWn/7
 zYwJE9GiZl7dXfDzrtZTi9qIj51zS28t1d/py2y8ovajXlf5tGNYV0WjxyGI+o5EsPyo
 BsrucpTgQBUvXwFsfxI3SFxAGQ0533yImA7EY1dLQqev2m5Imzpt54wv38VnUrgicTSS
 qrzyjozZ1kP8iwDhroAq/T4iv9X7lippkzx5coUl9niMginVfHRC3yKyjWFff5UNm90s
 x6Rb86Zr7K1HMv0jOeen0KakknoqTSACqkEpZ0PyMcItzd/aW+fi2YMpx0iji1yh4GQ4
 Cymw==
X-Gm-Message-State: AOAM530cJn/r5OZbdLFerXVVl1avJ8eRe3vFS5gyXYP+poONRm0rDEBX
 CGbZLBcIA14pAxQCBfkA8nxrBAyweNkhIw==
X-Google-Smtp-Source: ABdhPJyp5n97hhS47JAgZSj6Ql/2LKAl6PsRpjAwEqPMduGGgKx82X2nxf7fMcbp6wx1+HayRNUPkQ==
X-Received: by 2002:a17:90b:1809:b0:1bf:7e9:bdf5 with SMTP id
 lw9-20020a17090b180900b001bf07e9bdf5mr6991317pjb.52.1646944073750; 
 Thu, 10 Mar 2022 12:27:53 -0800 (PST)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 l9-20020a655609000000b0037589f4337dsm6399938pgs.78.2022.03.10.12.27.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 12:27:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] tcg/s390x: Fix tcg_out_dupi_vec vs VGM
Date: Thu, 10 Mar 2022 12:27:49 -0800
Message-Id: <20220310202751.594961-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310202751.594961-1-richard.henderson@linaro.org>
References: <20220310202751.594961-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The immediate operands to VGM were in the wrong order,
producing an inverse mask.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 6e65828c09..508f1bccc7 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -2715,7 +2715,7 @@ static void tcg_out_dupi_vec(TCGContext *s, TCGType type, unsigned vece,
                 msb = clz32(val);
                 lsb = 31 - ctz32(val);
             }
-            tcg_out_insn(s, VRIb, VGM, dst, lsb, msb, MO_32);
+            tcg_out_insn(s, VRIb, VGM, dst, msb, lsb, MO_32);
             return;
         }
     } else {
@@ -2729,7 +2729,7 @@ static void tcg_out_dupi_vec(TCGContext *s, TCGType type, unsigned vece,
                 msb = clz64(val);
                 lsb = 63 - ctz64(val);
             }
-            tcg_out_insn(s, VRIb, VGM, dst, lsb, msb, MO_64);
+            tcg_out_insn(s, VRIb, VGM, dst, msb, lsb, MO_64);
             return;
         }
     }
-- 
2.25.1


