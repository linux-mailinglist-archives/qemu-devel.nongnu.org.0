Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C53A7663144
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 21:19:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEyRw-0003Lb-Bz; Mon, 09 Jan 2023 15:08:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEyRu-0003Ko-I7
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:08:50 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEyRs-0007Yi-Sm
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:08:50 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 o1-20020a17090a678100b00219cf69e5f0so13994700pjj.2
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 12:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qoDF/rY8HtyNlykYqkZFXY86Nrt61o0/K7nWThd7Dr8=;
 b=C55XT/Y8pcqTS9wJxPULL0JkLdEKLwdtO7ffSpOz8+67bzCfu25VFz7xovjoLLPE8F
 KraNpNs/qV0kAlaSKTN+inChsSFrNfkvnMJlRetxxzdhO5NxYVVNqnk4ZZxwwXu6LJzW
 XLnikOCG/RRiGeRgzcG1YdUoDJumPQGUYJfEqPdt/zrmay9ZLOifTMGrk8bhFdQ1CTDR
 KGzsZZlVWrHNalLg3EPgriciEtA4Vc5KOL8AuYen4CJhyBiEvK37YHMCwm/s7Br2Pyzs
 AL9BVtIz/lZ5ZaOsPAuTskxRuCzYewTeTp/xa7T6bBCesS/P7GjRitn4J5w8/75AXDuv
 Xmwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qoDF/rY8HtyNlykYqkZFXY86Nrt61o0/K7nWThd7Dr8=;
 b=E3+IiBQHAj29taewJ4RzUucmkczwEDv/RLZ4n22VYUf7vo0SRcmpJmdeA6quUGhVuv
 BtkGc6n1P8JkuRQqJkbywKrV2IM4jk+vqrhk7Opt2TzWsLifpMLPwZ3lcdDwRHQ72ciW
 yR0WklchuVeKDh6yLo95s5a3DbGrC1xWtKAtZ7AXKa5WTRSIPZWniUYU60vf+qHhyZ42
 8jC2/5lA3eqOPYYi1rO1u+p4LGEP37czVMzqQF8I0WcRoAKDD5sY3bxejIP9msG67KV1
 EBM2mLbqIURhMleEtBgdzwnuA4jGxjUzMfig7PWm84E/YDzJPc1sv9LtNE5KOVLWG2TW
 hFeg==
X-Gm-Message-State: AFqh2koqAgnu3ZSG3QRZHoTFHcqhLmCDt04uuJIQQNoUpMgyCODR6iU3
 p83n9wJ8Uu46orf2T1AJV8SBOQFAeUbZN2QE
X-Google-Smtp-Source: AMrXdXucUQJkRWBa2G0aQi9Unc8coCQcIiL2f1k5geenKb0uxeMpYmgzjlX+QYfsVI6iUZMyUKJo+A==
X-Received: by 2002:a17:90a:7849:b0:226:3a7c:f248 with SMTP id
 y9-20020a17090a784900b002263a7cf248mr42388845pjl.24.1673294928131; 
 Mon, 09 Jan 2023 12:08:48 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:158e:facf:7a46:ba9f])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a17090a384200b0022727d4af8dsm577574pjf.48.2023.01.09.12.08.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 12:08:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3 24/27] target/s390x: Fix successful-branch PER events
Date: Mon,  9 Jan 2023 12:08:16 -0800
Message-Id: <20230109200819.3916395-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230109200819.3916395-1-richard.henderson@linaro.org>
References: <20230109200819.3916395-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Ilya Leoshkevich <iii@linux.ibm.com>

The branching code sets per_perc_atmid, but afterwards it does
goto_tb/exit_tb, so per_check_exception() added by translate_one() is
not reached.

Fix by raising PER exception in per_branch().

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20221130174610.434590-1-iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/misc_helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/s390x/tcg/misc_helper.c b/target/s390x/tcg/misc_helper.c
index 576157b1f3..e5015daf07 100644
--- a/target/s390x/tcg/misc_helper.c
+++ b/target/s390x/tcg/misc_helper.c
@@ -618,6 +618,7 @@ void HELPER(per_branch)(CPUS390XState *env, uint64_t from, uint64_t to)
             || get_per_in_range(env, to)) {
             env->per_address = from;
             env->per_perc_atmid = PER_CODE_EVENT_BRANCH | get_per_atmid(env);
+            tcg_s390_program_interrupt(env, PGM_PER, GETPC());
         }
     }
 }
-- 
2.34.1


