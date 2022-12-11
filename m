Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA2B6494E8
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 16:36:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4OFp-0006SI-M1; Sun, 11 Dec 2022 10:28:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4OFl-0006Oi-LT
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 10:28:33 -0500
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4OFf-0007pC-S1
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 10:28:33 -0500
Received: by mail-ot1-x32d.google.com with SMTP id
 v19-20020a9d5a13000000b0066e82a3872dso5837591oth.5
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 07:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YL98l6pAG0wMqGHGwjraAdo5XKSqPbbe4JB0KEpW3m8=;
 b=EMVCgMupVYseNYZLpzWcaMLSgR5q3Q11AmcZQ/MhwWgLlyBXGB0+Oc2y1yweQni8Kh
 V85VUcmsczM2qHqKYTBm4NiPHv4GWnIeIwa6kLPJdJ362oL2/EBuQRUMdjWTVrom+CNN
 79SsyjY7s8uJwv5g7/lOZlTms77vCN8FUsa9n2j5ME9oyIAZZqv3a8n8aALSpiqYZPy1
 x8osrGhunEhQ41SgKiIXwRtl5h3epBPddV82WGXRHj6Ml2UMTck35hRhZYKCJVhjrAHb
 6667OW8+Ozm1bWC9AN+8IGcDd/TbIhs5xoM5XiBh96mS6rZpOzzHdxnJVXFvJvI7TJ1w
 4p6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YL98l6pAG0wMqGHGwjraAdo5XKSqPbbe4JB0KEpW3m8=;
 b=DCQss7Cyzx8sZClFaWNkuAv8uaaBi9nwgf+hAtzSauvN3yaJtVWY5kOiCqwJfBzJDh
 jTUulcL7OsuBDpkT7t/AeMSmKNjmw3k04K/Y8EKrypE6RcDx1gYHLQyii7GRZMDob3gE
 k2OjyBpc25NdQZF/x2OytEpJ25mzBoHKESlIzFBPsDF7gGcc5wBRq7tPvRUSNFTrJxdU
 6dRUX6tBQDdh70aawrn90ms4si/A3iqJsKdhPGwWCB94Rh3CqR0qMGmffgke01dNyoZu
 4lbxlpYPR/bQ40fWzp/2xBf8TiNZdG8hukO3O3P+K+Gemd7y9YkzJH/Zt+qig2Sw+2CC
 RjTA==
X-Gm-Message-State: ANoB5plXWcUqQAv4hVf7YNi0exLNbbwIzOlYDMh++yeQLviyI4criTYX
 gJiIWp/7p4OAOd+5axEhLvN1VO/+q2qUhkE9/fo=
X-Google-Smtp-Source: AA0mqf4oYBSmEPJvlZiD6+q2f4pCIUh23Yh4XAcIt7Zqd6Kb8A9gr3QETi+dMEit/i4zLWP2+HHD2Q==
X-Received: by 2002:a9d:654a:0:b0:661:dfeb:ea49 with SMTP id
 q10-20020a9d654a000000b00661dfebea49mr5208235otl.8.1670772505944; 
 Sun, 11 Dec 2022 07:28:25 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:7b4f:f28b:eca6:b583])
 by smtp.gmail.com with ESMTPSA id
 q24-20020a056830233800b006708d2cd8bcsm938140otg.65.2022.12.11.07.28.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Dec 2022 07:28:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 18/27] target/s390x: Disable conditional branch-to-next for
 PER
Date: Sun, 11 Dec 2022 09:27:53 -0600
Message-Id: <20221211152802.923900-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221211152802.923900-1-richard.henderson@linaro.org>
References: <20221211152802.923900-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

For PER, we require a conditional call to helper_per_branch
for the conditional branch.  Fold the remaining optimization
into a call to helper_goto_direct, which will take care of
the remaining gbea adjustment.

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 28c6e0211f..9e84f706d5 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -1203,13 +1203,12 @@ static DisasJumpType help_branch(DisasContext *s, DisasCompare *c,
         goto egress;
     }
     if (is_imm) {
-        if (disp == s->ilen) {
-            /* Branch to next.  */
-            per_branch(s, true);
-            ret = DISAS_NEXT;
-            goto egress;
-        }
-        if (c->cond == TCG_COND_ALWAYS) {
+        /*
+         * Do not optimize a conditional branch if PER enabled, because we
+         * still need a conditional call to helper_per_branch.
+         */
+        if (c->cond == TCG_COND_ALWAYS
+            || (disp == s->ilen && !per_enabled(s))) {
             ret = help_goto_direct(s, disp);
             goto egress;
         }
-- 
2.34.1


