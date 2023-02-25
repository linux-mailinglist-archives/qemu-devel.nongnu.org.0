Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7539F6A281A
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 10:04:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVqQH-0001rg-W1; Sat, 25 Feb 2023 04:00:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqQ1-00015G-6U
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:00:38 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqPw-00059C-5Y
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:00:34 -0500
Received: by mail-pg1-x532.google.com with SMTP id s18so923452pgq.1
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 01:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sFtLskBtXQJv7dvYWKC68zyT6F+160XUCfsOjHVKspM=;
 b=GHxfIN2XzM66Cyma7GhKu2ItgTyVdo2O9NhWMBgytelp9RgjjQYQfKMKlu/0Z/um84
 /qnWxWhOCBxbkGiWoQvB4Ng4LCydGtNNnJv3MMPQjopUYOEfreF8HEqT0kqbTYQ2M/7b
 aG+5Ib2aRzwuXJJw/xoZjCkWSZl5H44YgKr+fHCysRkwC4L+Szr/gpdDnZ3hrxS6bGwn
 B1nUsSYxcM/UpAW6XcSCGW+3V6YIV4t22lIkOkibCnxcTddtTVisnitoLsp2jTF02YR7
 wmT2f7D1hX5erEnb39W6l2bcUc8/fLsA8sRfDl3//DQGOCVQHaVNqQrgzKipVLHOCno5
 A8yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sFtLskBtXQJv7dvYWKC68zyT6F+160XUCfsOjHVKspM=;
 b=wbvk60DYwvrwGlTkuC8zDWsr1K6XNbV/4ZllUmVfMV9ODelfb7Fon2iNRd2kFvgyHl
 +3hYwnmN8kGjBCBEZ5LVLS8b77/32YoDoCY6gdjdUjXYA9UCcsLsD4ci9aWsapbbuHPI
 sfmEeqdh2/D++znsQ470qcBZq9B5o2HMk8sbwRtvvKvlYINGbHYbCYA9NjwzdVrX+5Wf
 KETuDgjwUf/w/peKF92QpvN4GQ5i5zFyij1PAcLDSZ5t2yV7pUp5avvBj3ogcOApUsob
 jfd5rpnZeYnMdlnpQY1wVboNNmpPpVUnzqJTrrGy+IQnTJviBFURelrlt9VzYUanuc/J
 djqQ==
X-Gm-Message-State: AO0yUKXSVYApl1cmC40MP7OqhxH2LyhO2OeLWkWokP4wTbMsZ2cX46Qq
 YLHzleyvfIQCOWkrPB+zTJCZT2FQsRcK55geP5M=
X-Google-Smtp-Source: AK7set8FIZp+fv1/CFNGg5QfkC5NxNG2r0An/l8XSF0bql9Xa4TK+6HU9cgUSA6kY06YsFHMLDrYrQ==
X-Received: by 2002:a62:17c6:0:b0:5a8:b6cf:1a74 with SMTP id
 189-20020a6217c6000000b005a8b6cf1a74mr15616685pfx.18.1677315630652; 
 Sat, 25 Feb 2023 01:00:30 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a639251000000b00502ecb91940sm715546pgn.55.2023.02.25.01.00.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:00:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 28/30] exec/gen-icount: Don't use tcg_temp_local_new_i32
Date: Fri, 24 Feb 2023 22:59:43 -1000
Message-Id: <20230225085945.1798188-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225085945.1798188-1-richard.henderson@linaro.org>
References: <20230225085945.1798188-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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

Since tcg_temp_new_i32 is now identical, use that.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/gen-icount.h | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/include/exec/gen-icount.h b/include/exec/gen-icount.h
index 4d8b1f9ae5..733a2fb228 100644
--- a/include/exec/gen-icount.h
+++ b/include/exec/gen-icount.h
@@ -17,13 +17,7 @@ static inline void gen_io_start(void)
 
 static inline void gen_tb_start(const TranslationBlock *tb)
 {
-    TCGv_i32 count;
-
-    if (tb_cflags(tb) & CF_USE_ICOUNT) {
-        count = tcg_temp_local_new_i32();
-    } else {
-        count = tcg_temp_new_i32();
-    }
+    TCGv_i32 count = tcg_temp_new_i32();
 
     tcg_gen_ld_i32(count, cpu_env,
                    offsetof(ArchCPU, neg.icount_decr.u32) -
-- 
2.34.1


