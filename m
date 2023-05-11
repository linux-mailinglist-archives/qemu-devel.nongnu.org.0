Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 513A26FEDAD
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 10:15:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px1Lf-0007L4-8C; Thu, 11 May 2023 04:08:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1Ld-0007JI-01
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:08:25 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1Lb-0001xi-Aj
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:08:24 -0400
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-96622bca286so1120310766b.1
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 01:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683792502; x=1686384502;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lDcrnDhHvM2xbQPbYn7Q5HQ0RaVgZKVfyZ/oIHJzpXQ=;
 b=RZeuBEcEYMWzL+62VPyTKFbTcDN1k0wSmwhtb/bC6GW+QBdnUjShSxe8p+yPniCIRF
 KzZHM+5k/5AXlHxD4phPn3ATiUgjdwtkRayhkeUkkRm4LNSLuXuhVEclJcNClXXpvITu
 A4tLHgjm6Bhlk8ITHHFNlaspcoZUR93kBb5ftwSXavl27dNLh5jYjqMSQIy1b/ZBaIuS
 IzYMo8k3wwO+cGYq88ul9l2zhfERAXpaJ1THDhoCVr7ObsCn3sAvgeYosezUnvq9YYTm
 ZOW5dz0uBro6K+3vHyrIHWGxhj3WgwnkAoPeVuf1+pju+/hj4R1C36m+7rVx9+3Ot6MF
 tOqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683792502; x=1686384502;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lDcrnDhHvM2xbQPbYn7Q5HQ0RaVgZKVfyZ/oIHJzpXQ=;
 b=ckHBaORYSQ/6Q3y5tZVYpzg6nSvUTZ1TLS5+BdrxfsLEky+7b4o+qifBYHAKw9O3TM
 x2J7tincEFuCwlgpfw0aSOlnaZdxJUFfA97YuVV3eZgvCssAddVDX9BYiGxy9FaEC63g
 Tlt7DNHxpXv+WYxxnRJnHtRlRUObGRElrJlEIfayE1X7PY9R/Wfn6+7YquzIbPVOhbys
 RtRWvwcY16Emp5M7FkLAeAw9Ka8NHg59NG5PsXS9y2q6oyxifdCUvMFg+g3K5UNEghUh
 lE/fddhr8My7c2fRJGUsGvPwWyQR1h7GKcMSMuTCpJ/nd2+nmGawbYiDhDxbvomnv/yN
 PESg==
X-Gm-Message-State: AC+VfDyidiBddBSf21uCs3RmXQyJ9keQSQzPAHeD//qRN/s7SAwMG92b
 PcIQbGH17NvOpXJQf96jLA/0pPuZdFeu0R9LtpiraA==
X-Google-Smtp-Source: ACHHUZ7x3MUMvUXBNC10rhx/jdMmGng+N/n+GJI0JkXZZpjcYxiqf4K+D6HlAEWHe7Dj+krXzpUnNA==
X-Received: by 2002:a17:907:940c:b0:960:ddba:e5bb with SMTP id
 dk12-20020a170907940c00b00960ddbae5bbmr18342977ejc.43.1683792501858; 
 Thu, 11 May 2023 01:08:21 -0700 (PDT)
Received: from stoup.. ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 ci18-20020a170907267200b00959c6cb82basm3635225ejc.105.2023.05.11.01.08.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 01:08:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 48/53] tcg: Remove TARGET_ALIGNED_ONLY
Date: Thu, 11 May 2023 09:04:45 +0100
Message-Id: <20230511080450.860923-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230511080450.860923-1-richard.henderson@linaro.org>
References: <20230511080450.860923-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

All uses have now been expunged.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/memop.h  | 13 ++-----------
 include/exec/poison.h |  1 -
 tcg/tcg.c             |  5 -----
 3 files changed, 2 insertions(+), 17 deletions(-)

diff --git a/include/exec/memop.h b/include/exec/memop.h
index 25d027434a..07f5f88188 100644
--- a/include/exec/memop.h
+++ b/include/exec/memop.h
@@ -47,8 +47,6 @@ typedef enum MemOp {
      * MO_UNALN accesses are never checked for alignment.
      * MO_ALIGN accesses will result in a call to the CPU's
      * do_unaligned_access hook if the guest address is not aligned.
-     * The default depends on whether the target CPU defines
-     * TARGET_ALIGNED_ONLY.
      *
      * Some architectures (e.g. ARMv8) need the address which is aligned
      * to a size more than the size of the memory access.
@@ -65,21 +63,14 @@ typedef enum MemOp {
      */
     MO_ASHIFT = 5,
     MO_AMASK = 0x7 << MO_ASHIFT,
-#ifdef NEED_CPU_H
-#ifdef TARGET_ALIGNED_ONLY
-    MO_ALIGN = 0,
-    MO_UNALN = MO_AMASK,
-#else
-    MO_ALIGN = MO_AMASK,
-    MO_UNALN = 0,
-#endif
-#endif
+    MO_UNALN    = 0,
     MO_ALIGN_2  = 1 << MO_ASHIFT,
     MO_ALIGN_4  = 2 << MO_ASHIFT,
     MO_ALIGN_8  = 3 << MO_ASHIFT,
     MO_ALIGN_16 = 4 << MO_ASHIFT,
     MO_ALIGN_32 = 5 << MO_ASHIFT,
     MO_ALIGN_64 = 6 << MO_ASHIFT,
+    MO_ALIGN    = MO_AMASK,
 
     /* Combinations of the above, for ease of use.  */
     MO_UB    = MO_8,
diff --git a/include/exec/poison.h b/include/exec/poison.h
index 140daa4a85..256736e11a 100644
--- a/include/exec/poison.h
+++ b/include/exec/poison.h
@@ -35,7 +35,6 @@
 #pragma GCC poison TARGET_TRICORE
 #pragma GCC poison TARGET_XTENSA
 
-#pragma GCC poison TARGET_ALIGNED_ONLY
 #pragma GCC poison TARGET_HAS_BFLT
 #pragma GCC poison TARGET_NAME
 #pragma GCC poison TARGET_SUPPORTS_MTTCG
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 88fe01f59f..1231c8ab4c 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -2185,13 +2185,8 @@ static const char * const ldst_name[] =
 };
 
 static const char * const alignment_name[(MO_AMASK >> MO_ASHIFT) + 1] = {
-#ifdef TARGET_ALIGNED_ONLY
     [MO_UNALN >> MO_ASHIFT]    = "un+",
-    [MO_ALIGN >> MO_ASHIFT]    = "",
-#else
-    [MO_UNALN >> MO_ASHIFT]    = "",
     [MO_ALIGN >> MO_ASHIFT]    = "al+",
-#endif
     [MO_ALIGN_2 >> MO_ASHIFT]  = "al2+",
     [MO_ALIGN_4 >> MO_ASHIFT]  = "al4+",
     [MO_ALIGN_8 >> MO_ASHIFT]  = "al8+",
-- 
2.34.1


