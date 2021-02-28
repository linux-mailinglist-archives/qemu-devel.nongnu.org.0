Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F542327536
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 00:28:22 +0100 (CET)
Received: from localhost ([::1]:38104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGVU5-0002Fd-84
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 18:28:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPo-0005V0-EC
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:23:56 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:42628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPa-0007jO-AU
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:23:56 -0500
Received: by mail-pl1-x62a.google.com with SMTP id s16so8756376plr.9
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 15:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zJUfAY1VyGRTYaSFMvv3X+jRgCoxyXqIhxTpwb/I4ZE=;
 b=SnP2my/SyyHg3NsXQyEdUTKs4QJqM50Fo9IeYmtNhTIEqE0a1bh/8h5HxFEB/je+Xi
 sm/M9dKyBYgcLr/Ylmok4KoLGKPliatvD3yt7ECAUArfICECYy+EOu7ciZNrCWNLMS7h
 3+MGpo4xpRrFu0wTolhKUk7K805O9nrlR4Fjrh6rAQz0ilqOfbexE9O0j3UqAM/PN0qZ
 smpqEES6cdn3HJFttA7cgo111SQACwuHcAwaD1kJNYcjuDvBNc9aSj4VKQOMuxt0VUoE
 BZgp4UXzQlaeVBjaVhcFi7QbkJAGTxSAF9AfnD6SbouHlY1EObIgg8Y/qR/cqTusEP5R
 wGVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zJUfAY1VyGRTYaSFMvv3X+jRgCoxyXqIhxTpwb/I4ZE=;
 b=OPE6hTRsudWpvuvIJ/IfREZw74mKDr7khugdbMCVJ/4qRPVe+m1xBBRja87bkrMfS+
 mcbyPiS5J4WN60gX7q/eOdBTlfBVbYdtUmQArfda3NBvqdBcKQlxAIAe7ThSgdGtpo7b
 hilKv8wF/OlWyJvl34bql3WPqwjywJr1EXmPtrQL4+wtFMj9tK/5Te8We6J/e4Wm1yGR
 IbfPEKCB9S02Yewd7r41pnWnCjU2ncpZIEbdUhpH4SeGhJs2HBvWGZGxWSRhX9vVDhT1
 9aCVq3/BnRCnRQgnHIM35Xgl6nNwOn07VA32YU5ULVzSBOr0YDjrgxzBzdi4g/aH9u95
 W96A==
X-Gm-Message-State: AOAM532L09L7CjzQjAR7j4ZvEnJTAUM94MBinV2P4I+aR9SnKvJWTfGy
 ZLK2mnx85BL4Aq8y5oMd0+o2RwXJ3WoYmg==
X-Google-Smtp-Source: ABdhPJzWRv3zLm/o+rH7ByBSfTqOsrvETMordxooxUBJ0KnSw1AwAuiD8lsESjrqzFvNholfwZpmdg==
X-Received: by 2002:a17:90a:4888:: with SMTP id
 b8mr14238696pjh.106.1614554620049; 
 Sun, 28 Feb 2021 15:23:40 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id d24sm16257400pfn.54.2021.02.28.15.23.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 15:23:39 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 19/50] target/i386: Remove DisasContext.f_st as unused
Date: Sun, 28 Feb 2021 15:22:50 -0800
Message-Id: <20210228232321.322053-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228232321.322053-1-richard.henderson@linaro.org>
References: <20210228232321.322053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
Cc: cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index deb1e43430..f4af92886f 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -101,7 +101,6 @@ typedef struct DisasContext {
     int vex_v;  /* vex vvvv register, without 1's complement.  */
     CCOp cc_op;  /* current CC operation */
     bool cc_op_dirty;
-    int f_st;   /* currently unused */
     int tf;     /* TF cpu flag */
     int jmp_opt; /* use direct block chaining for direct jumps */
     int repz_opt; /* optimize jumps within repz instructions */
@@ -8501,7 +8500,6 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     g_assert(LMA(dc) == ((flags & HF_LMA_MASK) != 0));
     g_assert(ADDSEG(dc) == ((flags & HF_ADDSEG_MASK) != 0));
 
-    dc->f_st = 0;
     dc->tf = (flags >> TF_SHIFT) & 1;
     dc->cc_op = CC_OP_DYNAMIC;
     dc->cc_op_dirty = false;
-- 
2.25.1


