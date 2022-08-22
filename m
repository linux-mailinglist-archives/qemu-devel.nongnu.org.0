Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4253C59CD22
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 02:20:27 +0200 (CEST)
Received: from localhost ([::1]:53672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQHec-0003RL-DR
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 20:20:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQHJ7-000472-QQ
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:58:13 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:40498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQHJ6-0002hj-64
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:58:13 -0400
Received: by mail-pf1-x42a.google.com with SMTP id y141so11875074pfb.7
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 16:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=dKKPqc9i5CiF5LwFzHQi/Z8WbYaXN7VuC10J23PoypU=;
 b=bTN5uk409jCZyBgsAvZZUlItev1zuARYymNFWT/7XNngYAKixJP/g/qRnZI65936Mf
 mCBC3jtffIaYZVN5TUZKRdvFvgWPcGdZZlrBE8dhvfaEeyTYEdrGkUMe5w8cHfK9iVLN
 EeCwmDQ+nE/cyLbSeefRvYpN48ZPCjUZkcgkcZJ/TjYeg9F6wBxb0n3JUR9Y3wqNodBi
 d3DYcEEv+KvqEMRBdG9XFHUjMazvcet0eeLDvIi5e9SfNPBiFr5yea2NgdKajvt1OL2Q
 07wFqrOC2jkMp9eSz/1gFtTOMB3fhu67tOKnPcTuLeQlUnoqlH61j83HzB2h23UJPyhV
 Xkgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=dKKPqc9i5CiF5LwFzHQi/Z8WbYaXN7VuC10J23PoypU=;
 b=6NTfDHKIUcR5LpcmMPbn5BhCHVxqPB22OhqupcAjiJ1ANniH04BirdoeWjQZ0SuEjg
 +c7sq54tnRYB6R3UVloPLYwPQu4eQtf9eFIC2Fr4GLYw99JefMzFmFC1flylx2EbuVZP
 U2JTx3EM+AfxkoLBUZUpBlUVuTzmWzl3s6h5w7mMa1wepcAS2ueMu06yX+PSxwLY0Zvi
 OKB+VvNen3aX5Wnxst4byhN5h/grXcAdr/WBbZ1AOZAt6ZWIMefwk5Tvz/CdImWPg+Bg
 1M6LLToyr0MIijIU6csSx4CyCz5RbbH8a+kf0H/Pwz9DRuRwN+XWYW0iDAMiyW0jRAVM
 dUNA==
X-Gm-Message-State: ACgBeo1hRVvKyLF3sNZ9FLXqK06cG5KOhOuZ/qJkmMRg9BAAXer/h2oq
 95pnmR6zlUC4NCqd2uxn85J3GRUAFeXnbg==
X-Google-Smtp-Source: AA6agR5cb8a2AvUVrzZgIBkcoeYLZ+xEjdCkyr3KF/VV5Eqj1RsVLrUlbkliA1FsbvzHx2Kn6TXBzw==
X-Received: by 2002:a63:564f:0:b0:425:f2cd:d0ce with SMTP id
 g15-20020a63564f000000b00425f2cdd0cemr18394170pgm.143.1661212691328; 
 Mon, 22 Aug 2022 16:58:11 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:c3f1:b74f:5edd:63af])
 by smtp.gmail.com with ESMTPSA id
 w190-20020a6230c7000000b0052d52de6726sm9173159pfw.124.2022.08.22.16.58.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 16:58:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com,
	eduardo@habkost.net
Subject: [PATCH 08/14] target/i386: Direct call get_hphys from mmu_translate
Date: Mon, 22 Aug 2022 16:57:57 -0700
Message-Id: <20220822235803.1729290-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822235803.1729290-1-richard.henderson@linaro.org>
References: <20220822235803.1729290-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use a boolean to control the call to get_hphys instead
of passing a null function pointer.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/sysemu/excp_helper.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
index 414d8032de..ea195f7a28 100644
--- a/target/i386/tcg/sysemu/excp_helper.c
+++ b/target/i386/tcg/sysemu/excp_helper.c
@@ -24,14 +24,10 @@
 
 #define PG_ERROR_OK (-1)
 
-typedef hwaddr (*MMUTranslateFunc)(CPUState *cs, hwaddr gphys, MMUAccessType access_type,
-				int *prot);
-
 #define GET_HPHYS(cs, gpa, access_type, prot)  \
-	(get_hphys_func ? get_hphys_func(cs, gpa, access_type, prot) : gpa)
+	(use_stage2 ? get_hphys(cs, gpa, access_type, prot) : gpa)
 
-static int mmu_translate(CPUState *cs, hwaddr addr,
-                         MMUTranslateFunc get_hphys_func,
+static int mmu_translate(CPUState *cs, hwaddr addr, bool use_stage2,
                          uint64_t cr3, MMUAccessType access_type,
                          int mmu_idx, int pg_mode,
                          hwaddr *xlat, int *page_size, int *prot)
@@ -329,7 +325,7 @@ hwaddr get_hphys(CPUState *cs, hwaddr gphys, MMUAccessType access_type,
         return gphys;
     }
 
-    exit_info_1 = mmu_translate(cs, gphys, NULL, env->nested_cr3,
+    exit_info_1 = mmu_translate(cs, gphys, false, env->nested_cr3,
                                access_type, MMU_USER_IDX, env->nested_pg_mode,
                                &hphys, &page_size, &next_prot);
     if (exit_info_1 == PG_ERROR_OK) {
@@ -395,7 +391,7 @@ static int handle_mmu_fault(CPUState *cs, vaddr addr, int size,
             }
         }
 
-        error_code = mmu_translate(cs, addr, get_hphys, env->cr[3], access_type,
+        error_code = mmu_translate(cs, addr, true, env->cr[3], access_type,
                                    mmu_idx, pg_mode,
                                    &paddr, &page_size, &prot);
     }
-- 
2.34.1


