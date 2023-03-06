Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6031C6AB3F4
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 01:50:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYyyB-0003V9-K8; Sun, 05 Mar 2023 19:44:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyxI-00015F-Q5
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:43:59 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyxG-0007Ii-Rx
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:43:56 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 m20-20020a17090ab79400b00239d8e182efso11546266pjr.5
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 16:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678063430;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=agy/u0GMKA+XJZ7eZrr4m/SwvDijeZedhgSDznlTFuI=;
 b=FRj1HB8rMP1LTHpm5Y4tli50+2qct+wv3IRh+jaCkVaAlLHL0uaCg6tsJ7d/CXx1IM
 de+Cceco3C/X3YBlzSI5QQlaqtx8VDmu/xAikldNMl5fPqmM9YFpjzaQLMPTX35gVqBO
 UDTCHyMDZW5Higxy9gKPQssnXYm9ZVE1bvwOsXu+H8wS3i6w4weJLH9GqSr9WUhiMEHZ
 RAVIxyC5PuEri/T/nr3zqHrulbKz1qFDtnDD5zxLPx2y+G2vS+iV2d9DXJ+zYe7+XZsK
 Wq80N/ughtG97nOsSHjjMZ9oX+Bhl3WrCcvatk/ZSXYNbsO6Fzh04X6cP6o2YpO5qCTr
 UWQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678063430;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=agy/u0GMKA+XJZ7eZrr4m/SwvDijeZedhgSDznlTFuI=;
 b=uB9atJmAzcqvB+cZJQRt2QzPJfM3UjIvtcFhHu7DQzSnCih7odh13tVxsVT+/AlgRQ
 yIPmlPhQtFB/+nlW+sKZvJiolxKK0HC+Od+GLBmVtj7Xn6lSDGcG+oJnBKuJ/N2ie/4A
 pV4nqGyJTKX2umInhptXfjfkbyPniZvxTUtyPlKbDRFZ6CdL73hkAm6byPKv06+PUxxe
 n5SQSxOCSF9LxV+FFe0H1Ur8UsfE/YneJeuT001WAYGaCxI3CijGKGw+hZeDw5b0Pwpa
 4Ewb21Rek3sdvl9hlmx9S4iWkZhDLPY+tSZgQBW31pfNA8EDbIWBqzLEviESHSCthrdr
 dwaQ==
X-Gm-Message-State: AO0yUKW/RTgUOCpdFIkGvQ0Osd7l5aOij7sHidvSukmKezLYnFw43DnL
 P9hAPp1fzRH6OYWkRWqPSQLA8ug0ghMYrr95//dbyg==
X-Google-Smtp-Source: AK7set/R/lrSaZF23GzrjiOCF236ko9UwvxNzkKnXjFOtaS6Yz0GX2M6o3xgVIq9s+5uKve4KD1vdw==
X-Received: by 2002:a05:6a20:3941:b0:cc:7c25:2e1c with SMTP id
 r1-20020a056a20394100b000cc7c252e1cmr11784571pzg.13.1678063429879; 
 Sun, 05 Mar 2023 16:43:49 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 x52-20020a056a000bf400b005895f9657ebsm5045726pfu.70.2023.03.05.16.43.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 16:43:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	Max Filippov <jcmvbkbc@gmail.com>
Subject: [PULL 60/84] target/xtensa: Drop reset_sar_tracker
Date: Sun,  5 Mar 2023 16:39:30 -0800
Message-Id: <20230306003954.1866998-61-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306003954.1866998-1-richard.henderson@linaro.org>
References: <20230306003954.1866998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

Translators are no longer required to free tcg temporaries.
Remove sar_m32_allocated, as sar_m32 non-null is equivalent.

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/translate.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 4af0650deb..910350dec6 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -57,7 +57,6 @@ struct DisasContext {
 
     bool sar_5bit;
     bool sar_m32_5bit;
-    bool sar_m32_allocated;
     TCGv_i32 sar_m32;
 
     unsigned window;
@@ -284,14 +283,7 @@ static void init_sar_tracker(DisasContext *dc)
 {
     dc->sar_5bit = false;
     dc->sar_m32_5bit = false;
-    dc->sar_m32_allocated = false;
-}
-
-static void reset_sar_tracker(DisasContext *dc)
-{
-    if (dc->sar_m32_allocated) {
-        tcg_temp_free(dc->sar_m32);
-    }
+    dc->sar_m32 = NULL;
 }
 
 static void gen_right_shift_sar(DisasContext *dc, TCGv_i32 sa)
@@ -306,9 +298,8 @@ static void gen_right_shift_sar(DisasContext *dc, TCGv_i32 sa)
 
 static void gen_left_shift_sar(DisasContext *dc, TCGv_i32 sa)
 {
-    if (!dc->sar_m32_allocated) {
+    if (!dc->sar_m32) {
         dc->sar_m32 = tcg_temp_new_i32();
-        dc->sar_m32_allocated = true;
     }
     tcg_gen_andi_i32(dc->sar_m32, sa, 0x1f);
     tcg_gen_sub_i32(cpu_SR[SAR], tcg_constant_i32(32), dc->sar_m32);
@@ -1247,7 +1238,6 @@ static void xtensa_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
 
-    reset_sar_tracker(dc);
     if (dc->icount) {
         tcg_temp_free(dc->next_icount);
     }
-- 
2.34.1


