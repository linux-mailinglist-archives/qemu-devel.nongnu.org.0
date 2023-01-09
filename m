Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C40663105
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 21:11:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEyRr-0003DB-9P; Mon, 09 Jan 2023 15:08:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEyRo-000381-Di
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:08:44 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEyRn-0007NI-1R
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:08:44 -0500
Received: by mail-pl1-x630.google.com with SMTP id v23so5856616plo.1
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 12:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=huHLV3sTv30gudJNWzDsqVS9kBrPAjakiU9Bz/DYeo4=;
 b=D+H7sClqc79NZxVexdPNSAtImOp975ABRLcUdV297Kn6175KJAq7tp/7MTn1q/8ZcG
 kiBFKNxqphbgAgeSc9ogLs443zVqT4ixSLyFo4uYbiYpn32OTyuZrKkWBwaifs8B7zXB
 nfcVz3xZNagu1o0ulVr7QqNtxJpRpi9WfRXPMKImzqXmFFPpwo3sO7TsuK0ZeYDGPCOp
 qesRSSDPdB2mKLXhpj7qL6FqYQNd5JQ1eoGzqBJzQJJy9QgixYsbftP1OSMcb/PEX+Ik
 Mg/3QKoaAgqTjThmFf5SgU09sTQ6j3AeWGAcoyoXwcElLz3bKcZYiya8Q8I65D7EfETD
 3M5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=huHLV3sTv30gudJNWzDsqVS9kBrPAjakiU9Bz/DYeo4=;
 b=iNCCfEOdQqSS3OdceM0BqJ/q5QpHqN+w0k1BrtQyQPctHKFOqUgPQuGVRe0O1BUfSX
 yiA+jM7iIX/D1hOrzwnHlDZV1PdbYvNn5Jxk4c4/AUQ+p00pC1GJxtCGqLsdV7Cqz9ND
 eb5SbL0+gB0NxdCq3Y68C05NARJUi8vIiQvniautcA+YXsNSDPTIhEtwtqbTHS020qmm
 Fn8RpZE7oYTfXpMEAOkzdqjzGXab2NjTSJT+WAMcF/ukjvq09bwvbMZoSqVqkr+j8BlT
 ZVyJiEAh5kx9ioo10si9rOPAed2ZX4T1tH2FfQ2Ib2hrc4tc1dowMjXLlO4xjBrg9KMl
 p8bg==
X-Gm-Message-State: AFqh2kr/GBXLbGKaE4l9z+PQEIrqHsGASBnfdaQw6rorgPBaoWd4nqoJ
 Ly+EleqYX0YXEY2CtZMrgsdqAnuD5rA9COjb
X-Google-Smtp-Source: AMrXdXuXJpO4ytMrYk/8Azc161E35GQWHhkh7cwB78S26s8iNkdzuN39GPC/A3+qvK14Lp7fB6iC3g==
X-Received: by 2002:a17:90a:fa43:b0:226:c6fa:9843 with SMTP id
 dt3-20020a17090afa4300b00226c6fa9843mr17069935pjb.1.1673294921966; 
 Mon, 09 Jan 2023 12:08:41 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:158e:facf:7a46:ba9f])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a17090a384200b0022727d4af8dsm577574pjf.48.2023.01.09.12.08.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 12:08:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3 18/27] target/s390x: Disable conditional branch-to-next for
 PER
Date: Mon,  9 Jan 2023 12:08:10 -0800
Message-Id: <20230109200819.3916395-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230109200819.3916395-1-richard.henderson@linaro.org>
References: <20230109200819.3916395-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
index b02b76dfad..bbe39dd083 100644
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


