Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DA73B78E6
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:53:53 +0200 (CEST)
Received: from localhost ([::1]:41132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJnq-0002en-TT
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:53:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyItO-0008RQ-Pa
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:30 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:39674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyItA-0000tw-5b
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:30 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 in17-20020a17090b4391b0290170ba0ec7fcso2260063pjb.4
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u029qEzk6yP7ESQgeOfYtlytu0PVU2mUIoDbqOaagp8=;
 b=s5dWuXzZcS7b3PDVR4VRBbItc/wZm+8ra50LzI5tknb6rPLSqWkxTkxHUSeMrdDqWs
 sQlhWYZSvVnbRQYc0Xcrrc6gIQNFsmiV7UPuz4EzCkUwywHdaI/lnN1yve4Q+Dshk/TQ
 1tTR/dFfpSCv+Vb+LAj2Gt8+6x7Zl5eR1Pef86/Aa/CKVsZVwvIG2phxlDScUKXsBfD2
 kuKXl5GORnagEG3J1xD7CxJu+pj5S5wjgL/40oquSoSbr+Q/iQOYad6IFfmxzNTiQO/o
 Mm5pdYhEeo0OU5GlTaXQPEvdMe+DI7QJTfm9bX4p8+44cHzu+Vj1JbateBPGhbRi0Ydv
 xOaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u029qEzk6yP7ESQgeOfYtlytu0PVU2mUIoDbqOaagp8=;
 b=V6S6q48N+yTcmKvv1YKYfntNX0TUSR+QddTQiCOOMVIEyICbcJ/Gut7Wqiw2M9KKOY
 cUfwrCZEKmCOYQllg3zv4qhTldhPgn7sNeSeCA3AM4420x/eYAqasRe/KDOTyp9235c7
 Ni/8/yA+H2SDLW/9eL0fctMw4Tj5QEdPQ9Fci7ArJj8Y/3qMNFRooIdof7NLQzfXuu9N
 fnS+ECrbEokwSsql5lKO3tb3EXYMQsXQC9CrSJ1FYV9EqfCPcOmT8fbIxSldtTaZDRdJ
 7KC9UoP3Rge+Bpj3Mto/PgqUu+9A2GeT0M6Dje6n1F2nO+jtjaVcGSpsUD5sZ2CgoT9k
 yXig==
X-Gm-Message-State: AOAM530MccqwVI31V6um1d7wPf0k8kxXzVG1PQ3jPbayfOnenz/sH3gP
 VsNL80zToFxpG1s9e1EzkoBQLuZzJcMqkg==
X-Google-Smtp-Source: ABdhPJxg2wdhmLon/FIZqm6zrLSrqIqtiH/cvSc44/g0nGylWYarW3jq88UmfR8iIR0Tb8fu7LXmhQ==
X-Received: by 2002:a17:902:e282:b029:128:dd80:5c3c with SMTP id
 o2-20020a170902e282b0290128dd805c3cmr10760336plc.81.1624992910459; 
 Tue, 29 Jun 2021 11:55:10 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j2sm18811253pfb.53.2021.06.29.11.55.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 11:55:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 25/63] target/cris: Use tcg_gen_lookup_and_goto_ptr
Date: Tue, 29 Jun 2021 11:54:17 -0700
Message-Id: <20210629185455.3131172-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629185455.3131172-1-richard.henderson@linaro.org>
References: <20210629185455.3131172-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can use this in gen_goto_tb and for DISAS_JUMP
to indirectly chain to the next TB.

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/translate.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index 7035426a9c..8b379522c6 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -546,7 +546,7 @@ static void gen_goto_tb(DisasContext *dc, int n, target_ulong dest)
         tcg_gen_exit_tb(dc->base.tb, n);
     } else {
         tcg_gen_movi_tl(env_pc, dest);
-        tcg_gen_exit_tb(NULL, 0);
+        tcg_gen_lookup_and_goto_ptr();
     }
 }
 
@@ -3354,6 +3354,8 @@ static void cris_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         tcg_gen_movi_tl(env_pc, npc);
         /* fall through */
     case DISAS_JUMP:
+        tcg_gen_lookup_and_goto_ptr();
+        break;
     case DISAS_UPDATE:
         /* Indicate that interupts must be re-evaluated before the next TB. */
         tcg_gen_exit_tb(NULL, 0);
-- 
2.25.1


