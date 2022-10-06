Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DD15F5F8C
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 05:21:59 +0200 (CEST)
Received: from localhost ([::1]:44268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogHSQ-0005pT-4L
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 23:21:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHIG-0005Ri-Ka
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:11:28 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:37501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHIE-0006xB-Th
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:11:28 -0400
Received: by mail-pl1-x62c.google.com with SMTP id d24so545193pls.4
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 20:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=l6SGav8RwfN0SUmZjlh737YnehkKC7vRUo7OZ2eZuSg=;
 b=ZCGKacZFlV0nBNaXAAxZOkmNJDH1XuNpmYDaZWSm937Tzz86KQuWHqtCVxWtAbl/1m
 LrWYcG1pUrMQrRYQjm8AmX8ZD+9swhLAADQSA5LxEyzp21RamkWQnAS1oW0+VRWKvn44
 JNy+LvhYY4k0rSiPCBAQeW/Z7ug7q3qtWRh5hehFsc2U1bB/o/RSEqdAUJBbYsy3FO4f
 lwRPDlRIDfKfG7KhbzK5CCd/QN+b2T9VA7I9hgkjmkDM7A1cnOu0ua6ELEkIs48qr2j/
 D9axU++FVh1G1zuROgaPZIMU1a3QZcjkEWTkXid0NJjwhQuecSAHb4BOf9Erz+AErX4Y
 zomA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=l6SGav8RwfN0SUmZjlh737YnehkKC7vRUo7OZ2eZuSg=;
 b=s0/wUsj2WZYi6AwkCCfhrSXAgyY4teiCXzj9PRhQ2xRptuE2huzrY4BpRuBRleZ+E2
 qmBN9Q9qzUb5ZLxxHmtWEINTJZLKdEaLLuQSL7cAoI0jOEb5pFgb/Vpxdo5RX33nN7qc
 yQx4l4BoLx3hFKMGWD32h979yFAym8f2QepjEXYL/VrZHuGoWmoAWwrwUEGlxHukCaiu
 RVSRYA2H44Xod3rnItTH9pIMH/+D7iUivFO3ZP1JTemv8vaHinrFBf1/G/G72fIj6zl2
 VwnClrK4aDCB/WY4kc/P5/yPX0K7mkxJLODD0r2xwWY7/skKAwmrh243J6WV1JaZ2t57
 53xA==
X-Gm-Message-State: ACrzQf3akMQphT1Xhtj5xE3wsUWUepTTFUvbuhEfLf0B6yAW6MbH8r7P
 WpbmvOYir1sJJY2Ml2oty3IfQVWXx5gZPw==
X-Google-Smtp-Source: AMsMyM73HfTPHZZusskQ2yVK80axM9zE/ORu7QfO7m0pbuuqR8QaLJORIwDS7TaXmjKTFP9RwTF5zQ==
X-Received: by 2002:a17:90b:1b52:b0:202:c1e3:7e9f with SMTP id
 nv18-20020a17090b1b5200b00202c1e37e9fmr8276005pjb.68.1665025885579; 
 Wed, 05 Oct 2022 20:11:25 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:9ad0:4307:7d39:bb61])
 by smtp.gmail.com with ESMTPSA id
 u128-20020a627986000000b0056281da3bcbsm58360pfc.149.2022.10.05.20.11.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 20:11:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, laurent@vivier.eu, pbonzini@redhat.com,
 imp@bsdimp.com, f4bug@amsat.org
Subject: [PATCH 08/24] accel/tcg: Remove duplicate store to tb->page_addr[]
Date: Wed,  5 Oct 2022 20:10:57 -0700
Message-Id: <20221006031113.1139454-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006031113.1139454-1-richard.henderson@linaro.org>
References: <20221006031113.1139454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

When we added the fast path, we initialized page_addr[] early.
These stores in and around tb_page_add() are redundant; remove them.

Fixes: 50627f1b7b1 ("accel/tcg: Add fast path for translator_ld*")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/tb-maint.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
index 9af5cb49e0..7f4e1e1299 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -405,7 +405,6 @@ static inline void tb_page_add(PageDesc *p, TranslationBlock *tb,
 
     assert_page_locked(p);
 
-    tb->page_addr[n] = page_addr;
     tb->page_next[n] = p->first_tb;
 #ifndef CONFIG_USER_ONLY
     page_already_protected = p->first_tb != (uintptr_t)NULL;
@@ -461,8 +460,6 @@ TranslationBlock *tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
     tb_page_add(p, tb, 0, phys_pc);
     if (p2) {
         tb_page_add(p2, tb, 1, phys_page2);
-    } else {
-        tb->page_addr[1] = -1;
     }
 
     /* add in the hash table */
-- 
2.34.1


