Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8619659EEE7
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 00:19:07 +0200 (CEST)
Received: from localhost ([::1]:60644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQcEk-0005nA-J9
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 18:19:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQc22-0008Tu-Ul
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 18:05:58 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:46025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQc1w-0001QH-TX
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 18:05:58 -0400
Received: by mail-pf1-x42f.google.com with SMTP id z187so14704396pfb.12
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 15:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=mJbPfVNUzEC2twD2g02EAHj57nKEYqjpuPLLVGphZY4=;
 b=nNnzBMcqqEqesYv5MBMcs7ZKhGfaeIAbI0u0D80LNn/A2awibI2/VAbw6gjV5KJFVW
 +iNzcrShUnqQ4L1RiDceryFMYGnaou/D0W2qgZG0wwH7BoBdaLLBJ3plngqfr2xt3A7V
 Iy1TeFTu+IMtC4l12yMntT6I7RHvYcDLLecSG/06hR599qTta0Zui6xNyp1OPy4gCvCQ
 tQQcu1uZoo5sCW++oxzNdHPIQtTjp9syLccgano/HO9xoZEQYdNJalfxXU5uw4D2tUZg
 6hq4l7/HpPYoqewDtg+oVRUN37WtylzKvJC3PDWNa0zgOMKP5WgCGyK9YgZSoZMP9AUh
 QWzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=mJbPfVNUzEC2twD2g02EAHj57nKEYqjpuPLLVGphZY4=;
 b=cCPS+6jvIWNLLzOp27AdnMK0na7y0ROAF2wVjeZMnqlmGkiBP1EqXKEfBqGw80GLdQ
 yVbb+tLZ3R31vuEMgmo7eLAIIeGsaqGtbq0OYg7vMN/Ykv8Skx+mYght8kEu3hx5kwsl
 iYW65rcMalGx2dHxzltDax8O4qhnRwp89tjyZHYaqZ8Hm6ceqti0/Pn9d7pBaktlROHy
 H0oLKYWNA8J5TqB8NxCSyscY0Po80tAkPZCn8d5MeOX/qgFLgkQVRjrVo6643DWfht/B
 nrQdeg1/+D8ZmTzs9AiEtYWXhCqMPAJXIfm26HuAdmcfOJzPAkSzWrfzk39oCKuPAYvg
 ItsA==
X-Gm-Message-State: ACgBeo1IPapq5o1Mm2dXJ0EHKtpZjMApT+w782vPqP7Nw1heynGC6uIq
 HP9jux+peoidTmarHmwPlH4dspwQqK+Wmg==
X-Google-Smtp-Source: AA6agR7UR5ePI4qFwHkqRr4drMFyFj6U2KZGV9Pq1fzZ3/dnQ6DdG1Sp4JZScfRSLJ9ZTO56JJOaSw==
X-Received: by 2002:a05:6a00:1a0c:b0:528:6baa:a2e3 with SMTP id
 g12-20020a056a001a0c00b005286baaa2e3mr27201936pfv.27.1661292350500; 
 Tue, 23 Aug 2022 15:05:50 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:46f9:77b4:ec0a:c2d9])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a170902f60c00b0017292073839sm11020974plg.178.2022.08.23.15.05.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 15:05:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: iii@linux.ibm.com,
	laurent@vivier.eu,
	alex.bennee@linaro.org
Subject: [PATCH v7 05/20] linux-user: Clear translations and tb_jmp_cache on
 mprotect()
Date: Tue, 23 Aug 2022 15:05:27 -0700
Message-Id: <20220823220542.1993395-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220823220542.1993395-1-richard.henderson@linaro.org>
References: <20220823220542.1993395-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

From: Ilya Leoshkevich <iii@linux.ibm.com>

Currently it's possible to execute pages that do not have PAGE_EXEC
if there is an existing translation block. Fix by clearing tb_jmp_cache
and invalidating TBs, which forces recheck of permission bits.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20220817150506.592862-2-iii@linux.ibm.com>
[rth: Invalidate is required -- e.g. riscv fallthrough cross test]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

fixup mprotect
---
 linux-user/mmap.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 048c4135af..e9dc8848be 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -115,6 +115,7 @@ int target_mprotect(abi_ulong start, abi_ulong len, int target_prot)
 {
     abi_ulong end, host_start, host_end, addr;
     int prot1, ret, page_flags, host_prot;
+    CPUState *cpu;
 
     trace_target_mprotect(start, len, target_prot);
 
@@ -177,7 +178,14 @@ int target_mprotect(abi_ulong start, abi_ulong len, int target_prot)
             goto error;
         }
     }
+
     page_set_flags(start, start + len, page_flags);
+    tb_invalidate_phys_range(start, start + len);
+
+    CPU_FOREACH(cpu) {
+        cpu_tb_jmp_cache_clear(cpu);
+    }
+
     mmap_unlock();
     return 0;
 error:
-- 
2.34.1


