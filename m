Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4744F2D9F8B
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 19:51:05 +0100 (CET)
Received: from localhost ([::1]:40728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kosw4-0001Ld-BA
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 13:51:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kosk0-0000BU-Di
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 13:38:36 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:45214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kosjy-0007Su-VO
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 13:38:36 -0500
Received: by mail-wr1-x444.google.com with SMTP id d26so4230467wrb.12
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 10:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LfYo5MaDY/iw8/2Abe7qf6wWPlyXVqcAmraXknKsAuI=;
 b=cDfL6rFJmoXL5vtpNF/4gnVblMRdchArkhxPQyCm3J2TZeP57Jcvrf5TIbIrVGIUeT
 35nGhFPTcFlGqxFusVNpIQlEjtGgbkvzQIr+L9MnVklUn/V5secx8J6xPA5GHYOY5qna
 nFlJwbfJ51llCxurlCT8mDUQkPXNIBZuW7Qpa4O1304oeGInFXN5/C6MmL5myfYLE4WJ
 mGjVrgqzk0p6Jin1wWS95Wbq7VGZVjmsNQKunn2SmQdefd5mIluNkKGBoEaQOVNJlXY1
 UvxRg5mRSj2T1apqPMkD46FISkHhgdZY2lI54fRnk9jU6IpjeUZ7jCpcgGOq5nO79xbg
 nyag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LfYo5MaDY/iw8/2Abe7qf6wWPlyXVqcAmraXknKsAuI=;
 b=uVYpzHDdQLp1FLq/bZ2pnpjqo9UwbT6hjIKvv82nS1xw3ZxiLa2vMFL25XnUVCVIMD
 2e0RsdgQlXzkBPqiwVu6MG1Mu770I+jtadUCzOcxJOuCRj5J3GkIUDe1CxgTGKaETWH2
 9pNB2phS+JkULbi3lmKFG2+4z6OVIpgi6+moh+Yl0K5oKBUzQm0RtlmSi7lN2RcjDJ5J
 r+5uq+wk/8zN8nSQYbNgFZfdL0wCQRqxLL1bGWkFNkxmXofIEbsnfVzTslQz8unmr+L2
 vTufkwcxDMhnx1RmLv4ulP4LqENkREaxiq51/QGVYM3wx/e39ZWyP7AIwCj6bWxX78Tq
 ofSQ==
X-Gm-Message-State: AOAM5336VH7BtoRKdw9uX9+KbLR8uAzbY5bDm7XHaYS8u6LbNa/Mw7hi
 dyq7xcMpbyggcl7BMBcuVsaGtrCY9Z8=
X-Google-Smtp-Source: ABdhPJxPEIZTvdb4fQSO7SAH8bxWAMxU5T9x6Cy3p1ighhXZQ87LEqC4RFNJudb1413UkAGHmoxApA==
X-Received: by 2002:a5d:61c4:: with SMTP id q4mr30479856wrv.304.1607971113318; 
 Mon, 14 Dec 2020 10:38:33 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id o7sm16373552wrw.62.2020.12.14.10.38.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 10:38:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/16] target/mips: Replace gen_exception_err(err=0) by
 gen_exception_end()
Date: Mon, 14 Dec 2020 19:37:33 +0100
Message-Id: <20201214183739.500368-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201214183739.500368-1-f4bug@amsat.org>
References: <20201214183739.500368-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>, Laurent Vivier <laurent@vivier.eu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

generate_exception_err(err=0) is simply generate_exception_end().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index d2614796214..2662cf26fe7 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -2956,7 +2956,7 @@ static inline void gen_move_high32(TCGv ret, TCGv_i64 arg)
 static inline void check_cp0_enabled(DisasContext *ctx)
 {
     if (unlikely(!(ctx->hflags & MIPS_HFLAG_CP0))) {
-        generate_exception_err(ctx, EXCP_CpU, 0);
+        generate_exception_end(ctx, EXCP_CpU);
     }
 }
 
@@ -3162,10 +3162,10 @@ static inline void check_mt(DisasContext *ctx)
 static inline void check_cp0_mt(DisasContext *ctx)
 {
     if (unlikely(!(ctx->hflags & MIPS_HFLAG_CP0))) {
-        generate_exception_err(ctx, EXCP_CpU, 0);
+        generate_exception_end(ctx, EXCP_CpU);
     } else {
         if (unlikely(!(ctx->CP0_Config3 & (1 << CP0C3_MT)))) {
-            generate_exception_err(ctx, EXCP_RI, 0);
+            generate_exception_end(ctx, EXCP_RI);
         }
     }
 }
-- 
2.26.2


