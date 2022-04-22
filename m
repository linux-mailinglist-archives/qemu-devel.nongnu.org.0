Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2B250BEEB
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 19:44:37 +0200 (CEST)
Received: from localhost ([::1]:46210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhxKe-0007UY-KP
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 13:44:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwaz-0000Ja-Sg
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:57:25 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:45690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwav-00082e-64
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:57:25 -0400
Received: by mail-io1-xd33.google.com with SMTP id z19so4612503iof.12
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 09:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RUgiA6Oi5P+ooqWxIlZ6MCSz3k6th6h8Ep/asqMDiZk=;
 b=B77CmztIr/4YiwDU+gBvrABCjYX7mZeLabObC/2WR9YSK04hfqMhgBEJLH1b4es4NQ
 rOrD+WMJf5lzXFbP8H4UNdG3QaEPNmxCeglEwgbAkbwWG+MdziMyzy4EFuuHCZaFUroo
 ptxt3VbhzOq/nEFj+7WK1n3WPdocHGV+7EZvo42HM/w/9UhOREgPiF2Ixv8qXL5117lH
 Hq1TrXGXJ85ReE1L5JnFrxpDiX0fSBV7AYrT4bdH5SQb0WU6gOzqK8MqDI8PsRJZ9Wv7
 lV+t352wp7lB+HH29mS8XR2Z+QfUDUoKaksekKOpBZQniIGVl1VCY5Lg5vo5cVLEe8wy
 5SHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RUgiA6Oi5P+ooqWxIlZ6MCSz3k6th6h8Ep/asqMDiZk=;
 b=DZHvysI6hUTYrTP/UreeXttVkG+9nFqxhoV4JLzgFNXwXJMbk8z15voZBA9WPWluhl
 x6r3Q77VeaGEDKj6o2rXjmIHJA0QjHcfYOhMxEGvCYrDf8pMumhfyhOSYAvwo/A/XcZ1
 RhRV8+FKnmiDzHzcqKu1y2rxCs0U9P7RjF980b5Sy3kBKGDcjnRAkrBCUxmcWJ6WhHAq
 dJEznHDKnlmYrQxd5pBhiPXLBbCLVaf6GNSUF8t6ebexk2t+6bMbcG0Ey1UfO3tbwX7m
 fTpRFxr9dxUpq4NpEZENs+SX4+DMWNPB0/EtizIKCjR9FQrvDAMh7Yhd5/KW1rsKw3VA
 VTjA==
X-Gm-Message-State: AOAM53309JiepFgwP97fn+EFlfTGjB/1jb+iZ5nSszT+CSfdW9ymJaY4
 Lx8xlpbJhmbGOP4eS3lSGzp/AIdLC+jL56QC
X-Google-Smtp-Source: ABdhPJxVB6SaulznidZt7izu2sxxwIogLq3WToRoxdK+VC00ltpWWoFloX8b3K4HkfebHNYaa1t11Q==
X-Received: by 2002:a05:6638:2713:b0:32a:8bba:abae with SMTP id
 m19-20020a056638271300b0032a8bbaabaemr2749751jav.272.1650646640250; 
 Fri, 22 Apr 2022 09:57:20 -0700 (PDT)
Received: from stoup.. ([2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1])
 by smtp.gmail.com with ESMTPSA id
 n23-20020a6b8b17000000b00649a2634725sm816380iod.17.2022.04.22.09.57.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:57:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 55/68] target/nios2: Use tcg_gen_lookup_and_goto_ptr
Date: Fri, 22 Apr 2022 09:52:25 -0700
Message-Id: <20220422165238.1971496-56-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220422165238.1971496-1-richard.henderson@linaro.org>
References: <20220422165238.1971496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use lookup_and_goto_ptr for indirect chaining between TBs.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-52-richard.henderson@linaro.org>
---
 target/nios2/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 87f3e57d4c..a3e87beba4 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -190,7 +190,7 @@ static void gen_goto_tb(DisasContext *dc, int n, uint32_t dest)
         tcg_gen_exit_tb(tb, n);
     } else {
         tcg_gen_movi_tl(cpu_pc, dest);
-        tcg_gen_exit_tb(NULL, 0);
+        tcg_gen_lookup_and_goto_ptr();
     }
     dc->base.is_jmp = DISAS_NORETURN;
 }
@@ -201,7 +201,7 @@ static void gen_jumpr(DisasContext *dc, int regno, bool is_call)
     if (is_call) {
         tcg_gen_movi_tl(dest_gpr(dc, R_RA), dc->base.pc_next);
     }
-    tcg_gen_exit_tb(NULL, 0);
+    tcg_gen_lookup_and_goto_ptr();
     dc->base.is_jmp = DISAS_NORETURN;
 }
 
-- 
2.34.1


