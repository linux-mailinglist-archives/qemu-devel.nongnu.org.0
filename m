Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 488FD6A3AC7
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 06:47:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWWI3-0002rP-Ai; Mon, 27 Feb 2023 00:43:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWI0-0002mH-2W
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:43:08 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWHx-0004sG-1D
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:43:07 -0500
Received: by mail-pf1-x431.google.com with SMTP id a7so2783355pfx.10
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dD1wamCoNKZFIfQmB4g+Cu58J9uOq8aDnkIyPrSbVuM=;
 b=eVymLw/jK+sSGk4aIbnExUx9TvZm0bM3vrf64rar+J3dm/GQxf77RGiOJ+CTdg5ovh
 7zwh/AJcYtfuQNcUzTCCrpj+0ucjBC+N7dMoZkGnBCdlJyxe0KmO+zQ59Mw565yfd1DM
 DCxuRkcDPXdPczjlN2RBDyLFBuWeF5FOq+xJkdzMs/OwcPMCm+/0xJWbuGbwf2a5k1BM
 +4pSR1isgEnR57qrWxCzv13KQwcxD7stjRM8jgxgBzonkgRdNCyIFMQ1cD7qh3LokyOZ
 LInpfJspBe9qZncTchZ/Zq3ura8l3eTS4b/b0QfXZJVV62G7SWdlMkvg+KXrmKY8+kIT
 b1wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dD1wamCoNKZFIfQmB4g+Cu58J9uOq8aDnkIyPrSbVuM=;
 b=yAUgEHaudFjL4dmWu06Kft+S4pHfpQcnf6TyCJfJS3i1NzQ3qQ5G+xeL0ZBw2UlzD2
 4+UvYMeHqBCkt6jNVbcMR7S5djJDAe2gBvfZYgGhci95dAroWvRqwDQj7FNkP/Npjzgi
 ty3RudnnwJsTmzmv3YgBmp/7jzTs1ZFriPHqVOmh7JD7N4Xs7WdlX7Dsmx8KqcPuIsWW
 8Hv4c9A7H1JpCkZ2a/RIU/Jbx/lTO9GhQUndYOMW2MXMA1ZiOskQ4fPRTBs2s9pGUw94
 hDdygwsXKVazeht7/vZfhxmLlGJfHpB01WEk4B/k3TymcwGi7592sGCyFDBUKmDgEqb3
 6QWQ==
X-Gm-Message-State: AO0yUKVW6t1+UfVIC8wKu3DKsV6mIfDJBoE54nO5rYjUsypL4PbH2Dco
 YRRkTT/pVNTwmgpcA/3AGIWIHDPHybAo21uYdcY=
X-Google-Smtp-Source: AK7set9rm2jzI90qT1lsRb5B8K9V/SmYDp+HS7Shl/1uDJkLeqaHVOpEnNGw0WfEDwAlxeICcAsNlg==
X-Received: by 2002:aa7:9604:0:b0:5e0:1073:1f25 with SMTP id
 q4-20020aa79604000000b005e010731f25mr10677648pfg.7.1677476582559; 
 Sun, 26 Feb 2023 21:43:02 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7868a000000b005cdc64a287dsm3317137pfo.115.2023.02.26.21.43.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:43:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 07/70] target/arm: Avoid tcg_const_ptr in gen_sve_{ldr,str}
Date: Sun, 26 Feb 2023 19:41:30 -1000
Message-Id: <20230227054233.390271-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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

This hides the implicit initialization of a variable.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 3ca60fb36b..92ab290106 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4206,8 +4206,9 @@ void gen_sve_ldr(DisasContext *s, TCGv_ptr base, int vofs,
         }
     } else {
         TCGLabel *loop = gen_new_label();
-        TCGv_ptr tp, i = tcg_const_ptr(0);
+        TCGv_ptr tp, i = tcg_temp_new_ptr();
 
+        tcg_gen_movi_ptr(i, 0);
         gen_set_label(loop);
 
         t0 = tcg_temp_new_i64();
@@ -4284,8 +4285,9 @@ void gen_sve_str(DisasContext *s, TCGv_ptr base, int vofs,
         }
     } else {
         TCGLabel *loop = gen_new_label();
-        TCGv_ptr tp, i = tcg_const_ptr(0);
+        TCGv_ptr tp, i = tcg_temp_new_ptr();
 
+        tcg_gen_movi_ptr(i, 0);
         gen_set_label(loop);
 
         t0 = tcg_temp_new_i64();
-- 
2.34.1


