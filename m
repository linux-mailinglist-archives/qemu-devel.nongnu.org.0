Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E9D6A284D
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 10:23:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVqk0-0000nT-Q3; Sat, 25 Feb 2023 04:21:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqjL-0006UD-6I
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:20:38 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqjF-0002xb-8W
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:20:34 -0500
Received: by mail-pj1-x102e.google.com with SMTP id c23so1415577pjo.4
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 01:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cc505buS8ZqTwJy0cVRT4/uSaARbJr2+/eIoFYK/Stw=;
 b=oObm07HLe0yPe+9NJ552EyEZEPBwOkuHr1qMlXiZPq1Ir0BaIwh1VcSD7V1+o9gAbZ
 vqLadV5MXa4tK1yv5gVAEgm+OSpfyHVeouuhL9mGWBlnDj8y5AP4laxFfqRccx2qtkD6
 8fznehzPJGgGVAmeLLMCS/EG6DaTA1Vq4oUKQw4VkDTc/7Nvt4SX2pMoJJgeej35fj+2
 kQ+QkBsbG6/hk07/gdxNPFGA2Clrn4Woi9rSw3iWikFNuj/u/IXztgrZgZFfbrv+0x/U
 78HSw/+zPpcS/y5BuM1s4Efr15qk8RFyY2AE5tS6rkU0MK5Q6yTQSgvIng+BPafh2leB
 yvWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cc505buS8ZqTwJy0cVRT4/uSaARbJr2+/eIoFYK/Stw=;
 b=DkGTHNJ/+zd9G0MB270JG1VESXC4nGud2XYtu79I99pSgFKeiF75HiJczqqYNb+ozq
 RwWuQbbQQ/AB0yZVV9XJgwgaFuSrXCneAFaci7PkFTMfgIQKWfIYNIP7TvAfDVvHoQjt
 ux8rNuFNn/AlQyk+ulscSW46PZ+CdFUpnHcnzTPA6K1G4YjQViJ+F7txaOefuhn30M2r
 orSB7l2lRsp1GdVbfTVHluSJhDQwE9EhTPlB+167jM3Li2JvqDgHKzUEwuv9/J+VmJYO
 1E40hSHdc98ehMMiHNaTpkgFKubMIbvzM5ji472PO2+KcpC7/bKAfNZ2goR6t1kH8Gbk
 HfMQ==
X-Gm-Message-State: AO0yUKXtHIsBkii69YYZ5+MR/HVDkW+srlGyo4n64qp2Sey1b/aH922x
 5CGhoD1ywhmb3Os6eiGpMF9fwXuF0YLQipIPvx8=
X-Google-Smtp-Source: AK7set8RtVvUVdIzgkmWnmYAKGV3Zj01O4tFoCLRqq+2yqkBa80CxQgHv9te9qZdlCKorn+JgP3mVg==
X-Received: by 2002:a05:6a20:8402:b0:cc:39c5:1232 with SMTP id
 c2-20020a056a20840200b000cc39c51232mr9063368pzd.51.1677316827364; 
 Sat, 25 Feb 2023 01:20:27 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 26-20020aa7921a000000b00592417157f2sm843114pfo.148.2023.02.25.01.20.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:20:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 67/76] target/sparc: Remove egress label in disas_sparc_context
Date: Fri, 24 Feb 2023 23:14:18 -1000
Message-Id: <20230225091427.1817156-68-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/translate.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index bdf464f802..560fb32e28 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -5727,32 +5727,31 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
         dc->npc = dc->npc + 4;
     }
  jmp_insn:
-    goto egress;
+    return;
  illegal_insn:
     gen_exception(dc, TT_ILL_INSN);
-    goto egress;
+    return;
  unimp_flush:
     gen_exception(dc, TT_UNIMP_FLUSH);
-    goto egress;
+    return;
 #if !defined(CONFIG_USER_ONLY)
  priv_insn:
     gen_exception(dc, TT_PRIV_INSN);
-    goto egress;
+    return;
 #endif
  nfpu_insn:
     gen_op_fpexception_im(dc, FSR_FTT_UNIMPFPOP);
-    goto egress;
+    return;
 #if !defined(CONFIG_USER_ONLY) && !defined(TARGET_SPARC64)
  nfq_insn:
     gen_op_fpexception_im(dc, FSR_FTT_SEQ_ERROR);
-    goto egress;
+    return;
 #endif
 #ifndef TARGET_SPARC64
  ncp_insn:
     gen_exception(dc, TT_NCP_INSN);
-    goto egress;
+    return;
 #endif
- egress:;
 }
 
 static void sparc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
-- 
2.34.1


