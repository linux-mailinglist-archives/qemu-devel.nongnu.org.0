Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAD3430420
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Oct 2021 20:18:33 +0200 (CEST)
Received: from localhost ([::1]:54772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mboGO-0002pk-NA
	for lists+qemu-devel@lfdr.de; Sat, 16 Oct 2021 14:18:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mboDR-0008Ja-AQ
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 14:15:30 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:36751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mboDJ-0001t5-Tz
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 14:15:24 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 qe4-20020a17090b4f8400b0019f663cfcd1so11670947pjb.1
 for <qemu-devel@nongnu.org>; Sat, 16 Oct 2021 11:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=I0CzIZRWI2JoSPxoR4xs5SpApEcqlDWMcO9xYzu4ImA=;
 b=Ajq6npFn7th3y5VW+RD+oLlHq8ckBp4R5jxntrQP8CGczWOcmMhkloFlLTgAYh5Im0
 U7mRwjQ2ecvoCfBURcilTlZPUnviSTpaIZvqijgfzPSw9HGQOoM65apF2/Z8KAl2qaTE
 QqtqA0mkWhVs414Xpzltt1LK4DgHc6WAQvz5zoXDX2wp3v0o6ibDOBMyVEy85SMU1o5L
 U0Ni18DQjfWSxJKnvkpMKxfz+TCKLURP9H0GC9+0NMHRLJq4LIqGavbIb26PRfT3WQsY
 XQ4EP+1QAev66KZYlNTGFc14WTGywaexjleujlCpFVCtRJVbqYyINdoltE8vt7XNoMWG
 WKVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I0CzIZRWI2JoSPxoR4xs5SpApEcqlDWMcO9xYzu4ImA=;
 b=wVhhEd3HNFsbv4RJTBxwVIaXcmxVx8cQDafKci1fwm60RxV1J3PLySdDNLMxacYbhV
 1tz+Cs/FUWTAcfNzFYY4K5xTh41ygkQf/rvCv+qbMXapdLKkK4Q4UhY+X7Ds6WGHcTrm
 3OmNNa/iNW4LY0kUB4kBIca6+MkHRn9lvrLsq4zbgxDxWu7SshYo7tBEcYkozcMhJ3db
 EQmoZXbiyFq/lqPn8fkCdgxE92MlO1iHnqLg1ymvtqzBdS+K+RKJavXNb6DdSDbbG58U
 muEzp2iQrj/RV/U1VVabg2ZniCO52VoAVLWv2JotDr7WWv1if2Zn4SPcl1RCmWC7lgWP
 H8uQ==
X-Gm-Message-State: AOAM5331IEtoWHzdAQ0GVUdyu40pq/9nET6sXnIaqBgFFFanZpfAS7hr
 T+bzrMwOEmAxVwn/alldH4gc8le/JfSgJg==
X-Google-Smtp-Source: ABdhPJyATnW2kHeMmo9fxXCzkrPXGmpCbC+j//bYr5AVF5xBgnmiyad6BZTdc/mgd9ts1OIJBiUIDQ==
X-Received: by 2002:a17:90b:17cc:: with SMTP id
 me12mr21808389pjb.147.1634408120305; 
 Sat, 16 Oct 2021 11:15:20 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id ob5sm5075097pjb.2.2021.10.16.11.15.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 11:15:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/24] target/cris: Drop checks for singlestep_enabled
Date: Sat, 16 Oct 2021 11:14:54 -0700
Message-Id: <20211016181514.3165661-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211016181514.3165661-1-richard.henderson@linaro.org>
References: <20211016181514.3165661-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

GDB single-stepping is now handled generically.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/translate.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index a84b753349..59325b388a 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -3249,22 +3249,6 @@ static void cris_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         }
     }
 
-    if (unlikely(dc->base.singlestep_enabled)) {
-        switch (is_jmp) {
-        case DISAS_TOO_MANY:
-        case DISAS_UPDATE_NEXT:
-            tcg_gen_movi_tl(env_pc, npc);
-            /* fall through */
-        case DISAS_JUMP:
-        case DISAS_UPDATE:
-            t_gen_raise_exception(EXCP_DEBUG);
-            return;
-        default:
-            break;
-        }
-        g_assert_not_reached();
-    }
-
     switch (is_jmp) {
     case DISAS_TOO_MANY:
         gen_goto_tb(dc, 0, npc);
-- 
2.25.1


