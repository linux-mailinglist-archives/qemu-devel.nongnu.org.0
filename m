Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF9E5AE369
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 10:49:23 +0200 (CEST)
Received: from localhost ([::1]:55198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVUGo-0005tv-KJ
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 04:49:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVU6E-0002WL-Na
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 04:38:26 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:35577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVU6B-0005SS-Cg
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 04:38:26 -0400
Received: by mail-wr1-x433.google.com with SMTP id bz13so10891525wrb.2
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 01:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=cnDX4PL0OXe9dOqXgYaSV2oqzwR9gOMv9I1pf97HvaI=;
 b=NgeEloTqPwZf/t80BWHoQOMnEcmH//X/4Nwx9ugY39wAiJoakPz5alQTk3xwBmsb46
 DrzCKt1/o1RrIuuvgdBt21z4d2WyPasswSrPL87LP2iycNV1vqBT6j+M3SbVaaDkEwN6
 BgXB4mDiROEc9Hk0xvQajrP11zBV69bbNpTIf+f+sDZ8E5p7GdGujn6HykHWEBycsZjG
 dtd4OyFGJBWaqsKs561Id6peOeg/vo6P4iXDnWBhYiNhdhVWAkI1baHaG1LIWZjAG29v
 kAaFfbh35b1JizmEJ+9ZxXz9GDcGDc0GfrxADEksf6sPsCTHbeVSVsgyQlG7ECYHXfC6
 ssSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=cnDX4PL0OXe9dOqXgYaSV2oqzwR9gOMv9I1pf97HvaI=;
 b=F5uTmdxGvWdDAFhWQ2qtU5H7oqKHYX9Zlb1lh9ddDjIHKQBd3FXEfZrJa98nTe12Uj
 y3n9NQaGd99b18webHBzoX4w7Y6l1ZeAjeI4zkZzfdEh2BSsOWCBvtpKKoJc7NkjyHNV
 GpDrfWzgBBT3jca/rcIwo6v4/mRVMnta9+Pd76mnA4bOjfLGH66KnXJmT3fo8CHcH4ZY
 FFZBMmf/u1y7UBB+Nlwpuy8XitqJx/n+GLH68aCZ9utTQcAZ5RdwusYDJL37ySofTYwx
 TFTGX/S/DlfIwb5Hu0u7k4o+Ck3sBm83uJe+jP9kpBTGf+02lTq8qPPfXgZXelt4f1O4
 yLxQ==
X-Gm-Message-State: ACgBeo0rqk0OLVrybknWMH2bap5rXCLzwxybzx9v74DnovUCz4eoJLPx
 vsusNOZDwiCiHA+k5EwgIQzd7Rp79NJ/o3Ki
X-Google-Smtp-Source: AA6agR6J5jO9jE/j8utDsxj69zwd4mmk0FnKWcdP+8K82/QyX4q0M4vmdNkdWsl0MoWs39vdaWCIgQ==
X-Received: by 2002:adf:eb02:0:b0:227:1c:e760 with SMTP id
 s2-20020adfeb02000000b00227001ce760mr11614874wrn.635.1662453499252; 
 Tue, 06 Sep 2022 01:38:19 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 g26-20020a7bc4da000000b003a54f49c1c8sm13421859wmk.12.2022.09.06.01.38.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 01:38:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@gmail.com,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL v3 01/20] linux-user/arm: Mark the commpage executable
Date: Tue,  6 Sep 2022 09:37:56 +0100
Message-Id: <20220906083815.252478-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906083815.252478-1-richard.henderson@linaro.org>
References: <20220906083815.252478-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x433.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We're about to start validating PAGE_EXEC, which means
that we've got to mark the commpage executable.  We had
been placing the commpage outside of reserved_va, which
was incorrect and lead to an abort.

Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>
Tested-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/arm/target_cpu.h | 4 ++--
 linux-user/elfload.c        | 6 +++++-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/linux-user/arm/target_cpu.h b/linux-user/arm/target_cpu.h
index 709d19bc9e..89ba274cfc 100644
--- a/linux-user/arm/target_cpu.h
+++ b/linux-user/arm/target_cpu.h
@@ -34,9 +34,9 @@ static inline unsigned long arm_max_reserved_va(CPUState *cs)
     } else {
         /*
          * We need to be able to map the commpage.
-         * See validate_guest_space in linux-user/elfload.c.
+         * See init_guest_commpage in linux-user/elfload.c.
          */
-        return 0xffff0000ul;
+        return 0xfffffffful;
     }
 }
 #define MAX_RESERVED_VA  arm_max_reserved_va
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index ce902dbd56..3e3dc02499 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -398,7 +398,8 @@ enum {
 
 static bool init_guest_commpage(void)
 {
-    void *want = g2h_untagged(HI_COMMPAGE & -qemu_host_page_size);
+    abi_ptr commpage = HI_COMMPAGE & -qemu_host_page_size;
+    void *want = g2h_untagged(commpage);
     void *addr = mmap(want, qemu_host_page_size, PROT_READ | PROT_WRITE,
                       MAP_ANONYMOUS | MAP_PRIVATE | MAP_FIXED, -1, 0);
 
@@ -417,6 +418,9 @@ static bool init_guest_commpage(void)
         perror("Protecting guest commpage");
         exit(EXIT_FAILURE);
     }
+
+    page_set_flags(commpage, commpage + qemu_host_page_size,
+                   PAGE_READ | PAGE_EXEC | PAGE_VALID);
     return true;
 }
 
-- 
2.34.1


