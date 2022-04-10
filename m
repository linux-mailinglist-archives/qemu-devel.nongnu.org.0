Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D814FAC33
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Apr 2022 08:01:12 +0200 (CEST)
Received: from localhost ([::1]:42418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndQdL-0004NA-7k
	for lists+qemu-devel@lfdr.de; Sun, 10 Apr 2022 02:01:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndQZn-0001wl-N1
 for qemu-devel@nongnu.org; Sun, 10 Apr 2022 01:57:31 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:35761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndQZl-0002yr-64
 for qemu-devel@nongnu.org; Sun, 10 Apr 2022 01:57:31 -0400
Received: by mail-pf1-x42f.google.com with SMTP id f3so11936402pfe.2
 for <qemu-devel@nongnu.org>; Sat, 09 Apr 2022 22:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rLOhJvvj7gL9dKj7DvOFNAonGDNAYGQD5IOiVrmpC+4=;
 b=gvf3jxfymqplg7m2aamXw5cSmTrPxbG7H6v6wi+7bHPg4GIOObNmEKAhAYjh3jn7TS
 AqF6awPVYSUDKw6rMDEjNH1bN+K89Kq1wWBpySB1wx1s/gc37dG/+lupS35K78Cg2drb
 hVP5qAavydPuYP2YXFdVDZHVoRiD5iObgTZNanQlG4Voa72fUz9+VSKOPp+Gc0wF0zmo
 fT4/UQuwM3cJEpk9pYvGNYBDq6M6xEw4v30S1NOC2NVnTaHVxYp68+e+fjcoabJGvA5l
 Jm/zheF4rqh1EgeQUqemzAyn96gGrC6KbfL/U8c5XRGVQMRrt68L9ESG6l2RW7vaVbxR
 biDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rLOhJvvj7gL9dKj7DvOFNAonGDNAYGQD5IOiVrmpC+4=;
 b=U9LsErPwbe9r/yVPSpOL/tHMm7AlvXu21i+w9gegW0yglw6gRQ9TfqTxLK/jUogyCh
 gf7VXOx+9PySSmdgssYbZ+FxojOqjSPEzUPcNYfTe6rHCfDClh6FeYW/H9BC3WSfYTev
 3rnf5aSG9eN9ije8VCwYPwOw8M58npd3niGzvxXhgCBBZ9oJhHMqpyC6H8nWrS1q00Ff
 txcWlkmlgeF7Mp+dgqDvN0L7Rb5nVUCv9ixHZVkaeOenBmdLPLcimEqwZY7JTYGFA0rt
 igilGNQvfvkJoVfBPgstIdOcsJXFQMe1cHqmAQV0uTb27zNioJmrnHnlo2PcCNSm3lIB
 rPXA==
X-Gm-Message-State: AOAM5331zXezwX+ycpsh79SqvqlFfltaoqMk7TooY1sRq2tcP9UxqK1D
 pYrovJHY0MvKwCILIiw8y3+pNiv87g9vog==
X-Google-Smtp-Source: ABdhPJzaI+XZ62PpRh1t+xM+qNonqPkzfFVfy3+8npYewY/9jUb+5OZwcXBfOCu/Ce4j9u/IMy/MwQ==
X-Received: by 2002:a63:535c:0:b0:39d:353e:64d5 with SMTP id
 t28-20020a63535c000000b0039d353e64d5mr2526210pgl.355.1649570247925; 
 Sat, 09 Apr 2022 22:57:27 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 l18-20020a056a00141200b004f75395b2cesm30481862pfu.150.2022.04.09.22.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Apr 2022 22:57:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/7] target/arm: Enable FEAT_CSV2 for -cpu max
Date: Sat,  9 Apr 2022 22:57:19 -0700
Message-Id: <20220410055725.380246-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220410055725.380246-1-richard.henderson@linaro.org>
References: <20220410055725.380246-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This extension concerns branch speculation, which TCG does
not implement.  Thus we can trivially enable this feature.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c   | 1 +
 target/arm/cpu_tcg.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index def0f1fdcb..c1006a067c 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -805,6 +805,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
     t = FIELD_DP64(t, ID_AA64PFR0, SEL2, 1);      /* FEAT_SEL2 */
     t = FIELD_DP64(t, ID_AA64PFR0, DIT, 1);       /* FEAT_DIT */
+    t = FIELD_DP64(t, ID_AA64PFR0, CSV2, 1);      /* FEAT_CSV2 */
     cpu->isar.id_aa64pfr0 = t;
 
     t = cpu->isar.id_aa64pfr1;
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 5cce9116d0..2750cbebec 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -71,6 +71,7 @@ void arm32_max_features(ARMCPU *cpu)
     cpu->isar.id_mmfr4 = t;
 
     t = cpu->isar.id_pfr0;
+    t = FIELD_DP32(t, ID_PFR0, CSV2, 2);          /* FEAT_CVS2 */
     t = FIELD_DP32(t, ID_PFR0, DIT, 1);           /* FEAT_DIT */
     t = FIELD_DP32(t, ID_PFR0, RAS, 1);           /* FEAT_RAS */
     cpu->isar.id_pfr0 = t;
-- 
2.25.1


