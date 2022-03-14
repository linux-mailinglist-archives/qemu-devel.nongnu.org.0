Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA1D4D8B38
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 18:59:08 +0100 (CET)
Received: from localhost ([::1]:40238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nToyJ-0004zT-VE
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 13:59:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nTocA-0006qr-93
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 13:36:14 -0400
Received: from [2607:f8b0:4864:20::1034] (port=44602
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nToc7-0007s0-DZ
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 13:36:13 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 gj15-20020a17090b108f00b001bef86c67c1so15335552pjb.3
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 10:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z0nTGi36Q6kY2XhTWFaFoUNK+G34o+/T62xUlFxQppc=;
 b=mizFYJYRu4FqZDWn4Jp8K3wERLj7Tb1j2dPNyvkLWA7SPCvg5k03n/zMb0HOypKFiY
 7tf5pQbVwwEk/i7mzoHtgSWjs1UX5VcmJwXhbEZwnNx04OlLCukdbcu03C+0eVH4CDkO
 mlMkmLo+TtNj4GMIz6wwLbWZ4hEZ+shhvOzpDsYY2rND3WO9+Dx4pfSvgvQq2VP3vsk6
 WXabwVdpZwfGaxceq6/VVs6GLPfP7qnOUmPYRZursQv0Ae1ORckoYt0Uq+g6JmslZDwu
 7N9OJyKQoYBJ3dS/0f3pNZY/4GPaB+jNl0vOYekTok8wG6Xi5meuKWCVpr/uRCF1Gnb7
 sL+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z0nTGi36Q6kY2XhTWFaFoUNK+G34o+/T62xUlFxQppc=;
 b=cEauZNnrK9Xyyp3iJAxOuiHPkpHGjgObmpgJElS/zIYTxr4OwNMyIEswcPL3+egmNT
 oZJSXO4n7B1LdZe2J1ALRaLHFryD1wyxVb1H20GgRPgL8mnP/+5s1t5k9a8u/1pgNPi0
 CPLEOqDTHUZ+sgv3tYlnuUO6ri6h6jJV1efwDAPIFHbogKNk94lWtvDIDAeGo9qDQgpq
 D2TIgVzX6JhTJdBOf/+qDvFHsdbRAQHsZ20cXERgS06qV7Otp+BT4JRgsvgP87QLQyvU
 2jT2Fhd/qsWyacx+6CDcdMKr/mwPYCLlrC1rjctj34lpXBWNsWp84JGGL93RNEe6IBNc
 yCWw==
X-Gm-Message-State: AOAM533aZoBKPaS5qLuVvPhQpaPr7KCabJp91VBEwE4oJr55E+FMY+Sz
 lOnEMYK6RhT4YQPR+WDQXtVilqugfzPDxQ==
X-Google-Smtp-Source: ABdhPJxDHJiZKbAA39L8+0Xsrwjnp4OF9caeKzbK+CUVj3sEbVgnMoMrnN0hW3UN/AMWZPIvL/631A==
X-Received: by 2002:a17:902:7fc2:b0:153:3c90:17b9 with SMTP id
 t2-20020a1709027fc200b001533c9017b9mr15796604plb.61.1647279369586; 
 Mon, 14 Mar 2022 10:36:09 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 g24-20020a17090a579800b001c60f919656sm113847pji.18.2022.03.14.10.36.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 10:36:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 1/4] tcg/s390x: Fix tcg_out_dupi_vec vs VGM
Date: Mon, 14 Mar 2022 10:36:04 -0700
Message-Id: <20220314173607.145630-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220314173607.145630-1-richard.henderson@linaro.org>
References: <20220314173607.145630-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Cc: peter.maydell@linaro.org
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


