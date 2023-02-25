Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2731D6A2813
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 10:03:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVqQG-0001gD-Lc; Sat, 25 Feb 2023 04:00:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqPq-0000sH-J8
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:00:26 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqPo-00057o-J0
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:00:26 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 qi12-20020a17090b274c00b002341621377cso5201409pjb.2
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 01:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2x/6xSpCKlYJ34/8OxjWcHuDhp8kikr1JE7fyXvIhlE=;
 b=jZCbji8yFdl8srQNvWP+4T3mDgF9sxNM3UcFUE/7zliMy/+L0irMx2hM19C+qV2IcI
 PInuoJgWrp5fBpKRqK9eIi9nXHRm+qhzoEfYSIPzwwJkWuyCbF5XiTYnmc+AEG/rWM/v
 B2DuixlfTSj/ANdEI5Q7g9oMYE55fqBItFovwLWj6a24rUzuV4eeEaiKtxqNtdIvvNl6
 Fx6LdT0wd2MS0bT4qF8J+IJmZjhI+eevRfGARFBPVeohHbF4SFbsmCWxBkBFA9EinyhQ
 DYIPHxtQlnrV9k9pcL354EGvuBwQr0SAu2c4o2njvg5wbZ9j4irrLyF1c3A14Wc6Z9/g
 Z/gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2x/6xSpCKlYJ34/8OxjWcHuDhp8kikr1JE7fyXvIhlE=;
 b=Glj6DUp8GEpmh/GWjRl8ZwMQv+H33C24mgMiyTv9lGZJzuX31cdbSfwFgGaMea6E5f
 jLxZ3dM4b5ALgxvcTi/3lNFdecIldcYq+u6Ox+vXQoXOMocTOf/EXdXLnWfvhTTv8FV/
 AU9Ag1imsrQwVWAElpwCb/oJXmH3bpMDCExp9cRuqd+TGclSem9LBx+L4z5wn2Ml3fK1
 5H+xbUVbkk1s10zIdvJH4NbH0QF53YMzRT/r++zApoi2GJA2woHH8UiomdrHr10QBC/K
 t7TNjkNn4AJE6kRvZXMqR4E8jv/21VAy9GrD0mvr5S3PURZp9Q9wrwbHvhWLTZffpfnn
 gTgg==
X-Gm-Message-State: AO0yUKW1yjSME9+HQ93IMLjRrJ/WCDgt7YmMIU4gyeDm2+Euo/akMWWJ
 o6696De1Op1ShXaUeWi8MAigVDAE3xUVxwxWa9w=
X-Google-Smtp-Source: AK7set+dMkmaxZRzvnBAUAt50/lC5OKzpON7QJua7aFuBnlrW+wh/9zNGeDHdRuBopuA1QFP1ouhBw==
X-Received: by 2002:a17:90b:4b86:b0:234:19a1:8690 with SMTP id
 lr6-20020a17090b4b8600b0023419a18690mr22129186pjb.26.1677315623212; 
 Sat, 25 Feb 2023 01:00:23 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a639251000000b00502ecb91940sm715546pgn.55.2023.02.25.01.00.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:00:22 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 23/30] target/hppa: Don't use tcg_temp_local_new
Date: Fri, 24 Feb 2023 22:59:38 -1000
Message-Id: <20230225085945.1798188-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225085945.1798188-1-richard.henderson@linaro.org>
References: <20230225085945.1798188-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

This wasn't actually used at all, just some unused
macro re-definitions.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hppa/translate.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/target/hppa/translate.c b/target/hppa/translate.c
index 0102cf451b..cee960949f 100644
--- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -35,7 +35,6 @@
 #undef TCGv
 #undef tcg_temp_new
 #undef tcg_global_mem_new
-#undef tcg_temp_local_new
 #undef tcg_temp_free
 
 #if TARGET_LONG_BITS == 64
@@ -59,7 +58,6 @@
 
 #define tcg_temp_new         tcg_temp_new_i64
 #define tcg_global_mem_new   tcg_global_mem_new_i64
-#define tcg_temp_local_new   tcg_temp_local_new_i64
 #define tcg_temp_free        tcg_temp_free_i64
 
 #define tcg_gen_movi_reg     tcg_gen_movi_i64
@@ -155,7 +153,6 @@
 #define TCGv_reg             TCGv_i32
 #define tcg_temp_new         tcg_temp_new_i32
 #define tcg_global_mem_new   tcg_global_mem_new_i32
-#define tcg_temp_local_new   tcg_temp_local_new_i32
 #define tcg_temp_free        tcg_temp_free_i32
 
 #define tcg_gen_movi_reg     tcg_gen_movi_i32
-- 
2.34.1


