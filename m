Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FDF3B88E7
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 21:02:34 +0200 (CEST)
Received: from localhost ([::1]:54352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyfTl-0005Bo-Ay
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 15:02:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyf0t-0005WF-5b
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:32:43 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:45759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyf0p-00024h-MT
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:32:42 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 z3-20020a17090a3983b029016bc232e40bso1983305pjb.4
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 11:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zAnCrHtff6jPTMINAA/XQ8amtOalFE7ZmPKzxH7D+ug=;
 b=PyIoG7fqNcEfFFQ4gNjJia2QzE6oMaOP97nFiokhYPZyiEz9+WinGExIM0Pxv2iWY4
 0eRWmX+YannV1JkCm+iWDO61JsSo0eEvjlxsg3yWd4AlJ3dKWVZHaPJrUhv9wKqHR2rH
 9SGi6m/7AHKcBLiWembfrdkutc1TKuhwnRWE9jidUdA0ghmtr6WgYlX/isyeMC9ahx0S
 UZNfllpFq7bcfYu0bDrM9DjIxOz+92Q0KFPACUCjcnSLW2X27lCYH+7iBjScX+ZE+Dzn
 aUgza9k6z1eYXPOu/diW0UhE23qN4d3uOKT6RL0NNVAdR/iBJc0HfARzDkW6lTE2qPXo
 CbDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zAnCrHtff6jPTMINAA/XQ8amtOalFE7ZmPKzxH7D+ug=;
 b=EIzLFvcdeL5Kywz4ksZTQ3UW6IAZ+jZLSEEdHH6FYdtWMd+9uiw74OcHQ+u9KAjack
 C26SqZMfqvdMgFTLF+KwcqtxYG/5rSbflkKffnc/lT/v/5x+r4tyDbpoOI3JJM9ryv+l
 O+E6dreMu5xwgW1s3U1rh1l+3ILvTIHiIU7tqy2SydhE7bF8TAFBabFsHj4mzsKG7kd4
 f6qIXQKoJqFCq1h/H2bL6DgAqmOekOnY+J706virDAQfrm9QgOHdO+ppV2DP7QUMF3mX
 zAThamJhMWRu7wYXdymz/Y4Fm4cMiXsbuO6VaQka3gORD08podICjTt4ERywLsaMz57W
 oEZw==
X-Gm-Message-State: AOAM532OmSWXA+42u5u7OZoq4dfbPwgJdbTyCDY21VhHiMzas4mlP6SP
 z0194Zmpp7GgNnIEi0M/nOkAL0llXOLBGA==
X-Google-Smtp-Source: ABdhPJxK6FxHXFjXBg8VQI/1TYPsVXtfOB3dbQPM1rClB07JjUqd1BDOk6ycXVTTOZcbkzTxebDvxQ==
X-Received: by 2002:a17:902:8ec7:b029:119:a15f:3a1c with SMTP id
 x7-20020a1709028ec7b0290119a15f3a1cmr33701713plo.48.1625077958425; 
 Wed, 30 Jun 2021 11:32:38 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id m18sm23909517pff.88.2021.06.30.11.32.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 11:32:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 18/28] target/openrisc: Use translator_use_goto_tb
Date: Wed, 30 Jun 2021 11:32:16 -0700
Message-Id: <20210630183226.3290849-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210630183226.3290849-1-richard.henderson@linaro.org>
References: <20210630183226.3290849-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Cc: Stafford Horne <shorne@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reorder the cases in openrisc_tr_tb_stop to make this easier to read.

Cc: Stafford Horne <shorne@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/openrisc/translate.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/target/openrisc/translate.c b/target/openrisc/translate.c
index a9c81f8bd5..2d142d8577 100644
--- a/target/openrisc/translate.c
+++ b/target/openrisc/translate.c
@@ -1720,16 +1720,17 @@ static void openrisc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
         /* fallthru */
 
     case DISAS_TOO_MANY:
-        if (unlikely(dc->base.singlestep_enabled)) {
-            tcg_gen_movi_tl(cpu_pc, jmp_dest);
-            gen_exception(dc, EXCP_DEBUG);
-        } else if ((dc->base.pc_first ^ jmp_dest) & TARGET_PAGE_MASK) {
-            tcg_gen_movi_tl(cpu_pc, jmp_dest);
-            tcg_gen_lookup_and_goto_ptr();
-        } else {
+        if (translator_use_goto_tb(&dc->base, jmp_dest)) {
             tcg_gen_goto_tb(0);
             tcg_gen_movi_tl(cpu_pc, jmp_dest);
             tcg_gen_exit_tb(dc->base.tb, 0);
+            break;
+        }
+        tcg_gen_movi_tl(cpu_pc, jmp_dest);
+        if (unlikely(dc->base.singlestep_enabled)) {
+            gen_exception(dc, EXCP_DEBUG);
+        } else {
+            tcg_gen_lookup_and_goto_ptr();
         }
         break;
 
-- 
2.25.1


