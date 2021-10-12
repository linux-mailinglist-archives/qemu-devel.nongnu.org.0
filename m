Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2582C42A962
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 18:27:28 +0200 (CEST)
Received: from localhost ([::1]:59046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maKcg-000643-4u
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 12:27:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maKXW-0005yn-0r
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 12:22:06 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:42736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maKXU-00040N-1g
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 12:22:05 -0400
Received: by mail-pl1-x632.google.com with SMTP id l6so13840587plh.9
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 09:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=1RbKRtJMoQOt2SK3hmeerAK4mlYzGNvBThJyzO1Pf1g=;
 b=wcFrW+vlTC3PDM4vzjAhMReTTBrgN0N0Mw265oX02A3e7pQbNwO+k93wiSyLv8nRpC
 GzqyACnhISQYgcCMJYjGFuq6ljocEj+Kwx0dqqjRVXSBcV70zp1HGlWHKOboc+QvpFnM
 LpmBGhVScCLI88h9KrK6uK/FCFkdAfTg//Ll+SE2U/w20ukAGQXgRWW8XMzuYnl41tXS
 9pOK8KndHhbKn9J+ZU79Wx6i6yCymSLuUK7PGuKUrWKMu/J4BA2by4x6MzTcf8f3wDmx
 Pw6s44kmXhQ3qI1lPSqNw57SBr5T7sG5rZAAkK4VZtGUg7Uy0daIe5kbHwVHj66eYBKs
 /zaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1RbKRtJMoQOt2SK3hmeerAK4mlYzGNvBThJyzO1Pf1g=;
 b=LgIYhr5DWeBkdFxHyBy+OfLzlLkZPvtZY9HfWBXbWJJDMsYrkEURgBwt5xLD5n9UHm
 lUss+QP+GMYdAKYHeNn4NQkzWmRfM2WbI/bcG0NHvkCZlCyRaF1ZYjho8gMDjeSqLG1a
 BVn4OW8+XKmNs1CxJeSjOr4bCyqId+F7J48JhZ08wNB99lwZgLsU92S6GlQS18pkeeXw
 neaA727in7h2MQs0Hy0b2OFw9i/GZLEMJsdWO/pHHXB1MuTWe6QbLN9Y9dBQPmUZ/et3
 W29RwK5Fn65Ge8BhJC3Ghfbxw58sAjnl6U4CiFvFJTpFSPF0tX8X/s9rh5bvC5OJvVUb
 HE8g==
X-Gm-Message-State: AOAM531NXq3m87vsBuFo3Y4F1DHCC9ytv+V45AkOGLr5Y1G571rQz27j
 tYAnNVBmi++BekMueemJjh9bqDu80BX8Kg==
X-Google-Smtp-Source: ABdhPJya3PbT+eIfjhZo5qI3e+c+ODbKxxdaUotdqw8MBcTuDZbk0bhMKtnK4g79uGn4F7/EeAcabw==
X-Received: by 2002:a17:902:e8ce:b0:132:b140:9540 with SMTP id
 v14-20020a170902e8ce00b00132b1409540mr30962274plg.28.1634055722652; 
 Tue, 12 Oct 2021 09:22:02 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k190sm11525023pfd.211.2021.10.12.09.22.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 09:22:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/23] target/alpha: Drop checks for singlestep_enabled
Date: Tue, 12 Oct 2021 09:21:38 -0700
Message-Id: <20211012162159.471406-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211012162159.471406-1-richard.henderson@linaro.org>
References: <20211012162159.471406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
 target/alpha/translate.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index b034206688..8341cb8706 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -2998,17 +2998,10 @@ static void alpha_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         tcg_gen_movi_i64(cpu_pc, ctx->base.pc_next);
         /* FALLTHRU */
     case DISAS_PC_UPDATED:
-        if (!ctx->base.singlestep_enabled) {
-            tcg_gen_lookup_and_goto_ptr();
-            break;
-        }
-        /* FALLTHRU */
+        tcg_gen_lookup_and_goto_ptr();
+        break;
     case DISAS_PC_UPDATED_NOCHAIN:
-        if (ctx->base.singlestep_enabled) {
-            gen_excp_1(EXCP_DEBUG, 0);
-        } else {
-            tcg_gen_exit_tb(NULL, 0);
-        }
+        tcg_gen_exit_tb(NULL, 0);
         break;
     default:
         g_assert_not_reached();
-- 
2.25.1


