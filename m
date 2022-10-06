Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A055F5FFF
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 06:18:18 +0200 (CEST)
Received: from localhost ([::1]:35228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogIKv-0003ct-Jk
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 00:18:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHoX-0004Mb-5y
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:44:52 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:54066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHoR-0003wr-5E
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:44:46 -0400
Received: by mail-pj1-x102f.google.com with SMTP id fw14so656636pjb.3
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 20:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=5HalDKM2t7tQ28RoBBhE3f7ultMsCTeXd5L6wovkjbQ=;
 b=NRH5JQDWGetHEpqbTrvhO75EggQ0bEz3PkDFSa0qfaVz0J0Y8zLnor8NF9xMw4Ewsn
 qvCMfJoWWCtf8McQ4nZxi/p9cUmPyQ1uHvhhnPy+ggFxFgY3XSzQbuPyx4CfwDVzd7CJ
 J/zNBxvk4tH9pwKOV618AI8y+eYsFVo6+y8dVsj4XtNEx7sIv4l+Kmj29ibghqYEYXOw
 bV2gDWf22PXCbgn6HGVlZr+mVql4EaDdB+Vzbnv5t+1R0qF/vyjaNPI/tdgVPgRMcCn3
 Z5Knd9qAnGIxzfJfxeUWwNsWRRvSLuIRXSzEFekYCOWg9mJwAaM9/eschUrcq/6oVnQQ
 T66A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=5HalDKM2t7tQ28RoBBhE3f7ultMsCTeXd5L6wovkjbQ=;
 b=s2icRumf2oo57e3066o7HBp2I6gKkTVnptuTM/0eysgdZ+YNRPbqx3X8kIU2vCA3WN
 pvftDyvBcd06V5FIL1W0qAZXamK1vJxb7wCFSkzulpNNTa5YOkcypSpmX3GpFbpBNV7M
 qMP0YNDCmVL2cPTw3ILEjBgwuciDcVPjOGfhZ6RlzR9axxkJBYFcAYUp+Cuc6ZPumYV3
 wgI6v9CTPgtr1Uvt0972x+jOV2ndikRAWUAvAzHESUBhyq1e+SNydVSmvOClE5LPFw4H
 e9dBbDfRDkRArxDDSVu2vW0Rw2nq+Ai8eFUhscJFiLWLCNna7pv3/iSzb8m3IaMpfRtq
 M2wA==
X-Gm-Message-State: ACrzQf2/NISdVw90rpC5Kr9xdr2j/5Fza9y+FSKqfGx4GNQ4r8JdOlxZ
 mZw2K3uIeh7ibG7pET9/EGrmzb19F+TStA==
X-Google-Smtp-Source: AMsMyM7LM3fwF652Uoc+PuO4WVHHmoocP37KLML7xX0obcifDgjJvMuab+aBSWhREAl3Zmto1uJegQ==
X-Received: by 2002:a17:90b:3b41:b0:202:8e4b:f532 with SMTP id
 ot1-20020a17090b3b4100b002028e4bf532mr8457392pjb.231.1665027882361; 
 Wed, 05 Oct 2022 20:44:42 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:9ad0:4307:7d39:bb61])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a17090ad0c600b00205f4f7a3b3sm1905086pjw.21.2022.10.05.20.44.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 20:44:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: [PATCH 20/26] target/s390x: Split per_breaking_event from per_branch_*
Date: Wed,  5 Oct 2022 20:44:15 -0700
Message-Id: <20221006034421.1179141-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006034421.1179141-1-richard.henderson@linaro.org>
References: <20221006034421.1179141-1-richard.henderson@linaro.org>
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

This allows us to update gbea before other updates to psw_addr,
which will be important for TARGET_TB_PCREL.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 498dc2930d..a2315ac73e 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -353,7 +353,6 @@ static inline bool per_enabled(DisasContext *s)
 static void per_branch_dest(DisasContext *s, TCGv_i64 dest)
 {
 #ifndef CONFIG_USER_ONLY
-    gen_psw_addr_disp(s, gbea, 0);
     if (s->base.tb->flags & FLAG_MASK_PER) {
         gen_helper_per_branch(cpu_env, gbea, dest);
     }
@@ -363,7 +362,6 @@ static void per_branch_dest(DisasContext *s, TCGv_i64 dest)
 static void per_branch_disp(DisasContext *s, int64_t disp)
 {
 #ifndef CONFIG_USER_ONLY
-    gen_psw_addr_disp(s, gbea, 0);
     if (s->base.tb->flags & FLAG_MASK_PER) {
         TCGv_i64 dest = tcg_temp_new_i64();
         gen_psw_addr_disp(s, dest, disp);
@@ -1153,13 +1151,14 @@ struct DisasInsn {
 
 static DisasJumpType help_goto_direct(DisasContext *s, int64_t disp)
 {
+    per_breaking_event(s);
+
     if (disp == s->ilen) {
         per_branch_disp(s, disp);
         return DISAS_NEXT;
     }
     if (use_goto_tb(s, s->base.pc_next + disp)) {
         update_cc_op(s);
-        per_breaking_event(s);
         tcg_gen_goto_tb(0);
         update_psw_addr_disp(s, disp);
         tcg_gen_exit_tb(s->base.tb, 0);
@@ -1173,6 +1172,7 @@ static DisasJumpType help_goto_direct(DisasContext *s, int64_t disp)
 
 static DisasJumpType help_goto_indirect(DisasContext *s, TCGv_i64 dest)
 {
+    per_breaking_event(s);
     tcg_gen_mov_i64(psw_addr, dest);
     per_branch_dest(s, psw_addr);
     return DISAS_PC_UPDATED;
@@ -1233,6 +1233,7 @@ static DisasJumpType help_branch(DisasContext *s, DisasCompare *c,
     }
 
     /* Branch taken.  */
+    per_breaking_event(s);
     if (is_imm) {
         gen_psw_addr_disp(s, psw_addr, disp);
     }
-- 
2.34.1


