Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC7E652C49
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 06:08:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7rGR-0002KP-L5; Wed, 21 Dec 2022 00:03:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7rGP-0002Ju-VB
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 00:03:33 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7rGL-0003NB-8j
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 00:03:33 -0500
Received: by mail-pl1-x631.google.com with SMTP id u7so6249122plq.11
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 21:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KNHQY/4RRXvJU0V3H4/K7OQJyFUdroRHt7gYQp+f6XQ=;
 b=vbluLpy9B0k95RrQGhOzSiacC2gpg7TmcfHKdq0jwtwjLEhMnGIom/ZK9D+rruaAho
 fs3TN7oCJgP9N9U3YKHfWCdL2mRHU3jmWNnjuCHZvWbQdYHXp1xYOz8m0u7lPED3Rpmc
 aJKCte0Xen3ZYZKNfOo/Hfxp3yFo+ZUEmqSfssE3pIpo/UQ4KmZ9Q71YWRiVmjreuWix
 +s3CKNc2UMlkzc5ebyIjjX/11dnDg0AtJvJ5at3Y8HVBDTj2zy+u719VqqcIN8Xd9su2
 rHKPhz94Aipd6U1Q1Kypd5P4H6Hl+2rDBv+lvbs9W2cGHLPZobJ4zkEKANrpbj5K+2S7
 J6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KNHQY/4RRXvJU0V3H4/K7OQJyFUdroRHt7gYQp+f6XQ=;
 b=7Z5irC0pvJ3rZtcNT/JNCkFh30kF5VA8svz29EQbVqySRc//hNXQ46a+LiNG9FxAk/
 jjvJCwwycfpzgyB9QTNKk+pFUlVUt3l1sdFTv+P1hetf/1UtGCVN2mGgZXMbVPUfhtPr
 EqTWJmF78dJ0A05sBUyAvJ889V52dbW0hVFs0H2wZ0rgE4LGxr2mtstqSzyyiLF3qtMh
 7cESkGyiX8SaPLrp7SDAyUNgIVVOqCfrDe59dF6F/DQphm57C7py1HSqmLnfitSqeeFu
 CwQz3+OOsxRF5xjcu6xRmWciw2z+EkrPq8KKxFTqhUutdJQUu3ZtMun3RYLHIz/pi3UO
 jkjQ==
X-Gm-Message-State: AFqh2kqRtPsD9HLU0LllkmIqaKKLy3z9V3CRMTrnQxbiY2/lQXeGieqB
 vnWUoIHxDcoHTRLFXDnhd/0ORo1Y+gtsqt+l
X-Google-Smtp-Source: AMrXdXscZr7hG+J4GLuOejVa+w6zgRTBu5AlkBs4RR22jJ7AvDJFnBTnBaQdT7bXLlNlMs9t5jxv0w==
X-Received: by 2002:a17:90b:b0c:b0:223:9e00:85bd with SMTP id
 bf12-20020a17090b0b0c00b002239e0085bdmr712224pjb.40.1671599008202; 
 Tue, 20 Dec 2022 21:03:28 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:3efa:624c:5fb:32c0])
 by smtp.gmail.com with ESMTPSA id
 a8-20020a17090a688800b002135e8074b1sm390645pjd.55.2022.12.20.21.03.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 21:03:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL v2 12/14] accel/tcg: Rename tb_invalidate_phys_page_fast{,
 __locked}()
Date: Tue, 20 Dec 2022 21:03:11 -0800
Message-Id: <20221221050313.2950701-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221221050313.2950701-1-richard.henderson@linaro.org>
References: <20221221050313.2950701-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Emphasize this function is called with pages locked.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20221209093649.43738-4-philmd@linaro.org>
[rth: Use "__locked" suffix, to match other instances.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/internal.h | 6 +++---
 accel/tcg/cputlb.c   | 2 +-
 accel/tcg/tb-maint.c | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
index 35419f3fe1..d10ab69ed0 100644
--- a/accel/tcg/internal.h
+++ b/accel/tcg/internal.h
@@ -37,9 +37,9 @@ void page_table_config_init(void);
 
 #ifdef CONFIG_SOFTMMU
 struct page_collection;
-void tb_invalidate_phys_page_fast(struct page_collection *pages,
-                                  tb_page_addr_t start, int len,
-                                  uintptr_t retaddr);
+void tb_invalidate_phys_page_fast__locked(struct page_collection *pages,
+                                          tb_page_addr_t start, int len,
+                                          uintptr_t retaddr);
 struct page_collection *page_collection_lock(tb_page_addr_t start,
                                              tb_page_addr_t end);
 void page_collection_unlock(struct page_collection *set);
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index ac459478f4..f7963d3af8 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1510,7 +1510,7 @@ static void notdirty_write(CPUState *cpu, vaddr mem_vaddr, unsigned size,
     if (!cpu_physical_memory_get_dirty_flag(ram_addr, DIRTY_MEMORY_CODE)) {
         struct page_collection *pages
             = page_collection_lock(ram_addr, ram_addr + size);
-        tb_invalidate_phys_page_fast(pages, ram_addr, size, retaddr);
+        tb_invalidate_phys_page_fast__locked(pages, ram_addr, size, retaddr);
         page_collection_unlock(pages);
     }
 
diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
index 1676d359f2..8edfd910c4 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -1190,9 +1190,9 @@ void tb_invalidate_phys_range(tb_page_addr_t start, tb_page_addr_t end)
  *
  * Call with all @pages in the range [@start, @start + len[ locked.
  */
-void tb_invalidate_phys_page_fast(struct page_collection *pages,
-                                  tb_page_addr_t start, int len,
-                                  uintptr_t retaddr)
+void tb_invalidate_phys_page_fast__locked(struct page_collection *pages,
+                                          tb_page_addr_t start, int len,
+                                          uintptr_t retaddr)
 {
     PageDesc *p;
 
-- 
2.34.1


