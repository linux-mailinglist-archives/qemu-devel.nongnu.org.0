Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C696C6576A7
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 13:51:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAVsO-0000tC-Jx; Wed, 28 Dec 2022 07:49:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAVs4-0000rV-MQ
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 07:49:24 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAVs3-0002g4-2X
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 07:49:24 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 fm16-20020a05600c0c1000b003d96fb976efso9023605wmb.3
 for <qemu-devel@nongnu.org>; Wed, 28 Dec 2022 04:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HhuI1L6u/vuSUSLMQUe52IWoEVBY52BZhysTXp5u8Bs=;
 b=imPt/BkqBhF5S4Gtu1GHFI0U3+wS+2ubDQ8cWOl6nDmV6juhEGYEmguUifu3dcfH9e
 uzK6E17RRqndxpQLsz5HKSICj4sVqquNgKyoREwc2Oa0v94w/x2NbTLsA98+SqJk/jXl
 UdKXwGD4aIH6dRtxNdWVUfFwKWLfua1z7pwi3tuJArn/G9ivCwi0W6NaUXyhiOnzpWhx
 X0rocmQzeLaZ3Bii6IQrGEOzh35on2o5zLSEo66TQJu59bdKA2BwdH7/dQ+gSzGeJ7Ww
 qF84UVXEjjTLLLBl6DPhjDp5BnbF1kHqMyPF+d/8O2DUWT7gx71NMlXUwvZwdiL0nl+C
 v0rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HhuI1L6u/vuSUSLMQUe52IWoEVBY52BZhysTXp5u8Bs=;
 b=zUPDWMKk0svr3CrZgzqYnR0vg+vvU2uKElr1DW8EuiQqcoBG2ZXHPmPZNA0N2CEc2c
 k6SnBs6/vhqcZCLvYI1vr3NVS0yv8wyzFzxPivS6SNWiTMmxkZOKywK4ne+5jZU78pfN
 xthEWHh/9EA62fKv2YiFWFYnjz+m3/TZmhPs3yazr9+MMDCWS6jCr2IOUvqTy5ON1Lew
 SkHj0PpcpavGsuH6ULrh43BksxC6cIUtwNfkDYnqKu0tnmjkkD8dyRAThIC6QMge6l6r
 NtNb2S+Fxw32KzEg8/2UM214meH1qqEC2eKgpN4UdEsI0OFqAWKSSG1jES1O/1NhERNe
 i7qA==
X-Gm-Message-State: AFqh2krRJy2nTlC2syGpOfBZjtBwF/lvb/1KEt21i6kWVrzn84p/eTuK
 o5PGqhJQLXQ7ncPET1HdvsfTiI02fcM/sEkZ
X-Google-Smtp-Source: AMrXdXtyaF25lyViE+vPAKICovm2ilKZDwk+ihqSXCKVFnVWoCr3q/nxZHnfLDrFH61iT2EILTH25Q==
X-Received: by 2002:a05:600c:3845:b0:3d1:caf1:3f56 with SMTP id
 s5-20020a05600c384500b003d1caf13f56mr20943510wmr.9.1672231761092; 
 Wed, 28 Dec 2022 04:49:21 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 j30-20020a05600c1c1e00b003c71358a42dsm33430642wms.18.2022.12.28.04.49.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 28 Dec 2022 04:49:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1a/4] accel/tcg: Fix tb_invalidate_phys_page_unwind
Date: Wed, 28 Dec 2022 13:49:17 +0100
Message-Id: <20221228124918.80011-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221224151821.464455-2-richard.henderson@linaro.org>
References: <20221224151821.464455-2-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

When called from syscall(), we are not within a TB and pc == 0.
We can skip the check for invalidating the current TB.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
[PMD: Split patch in 2]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/tcg/tb-maint.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
index 1b8e860647..c9b8d3c6c3 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -1024,8 +1024,18 @@ void tb_invalidate_phys_page(tb_page_addr_t addr)
  */
 bool tb_invalidate_phys_page_unwind(tb_page_addr_t addr, uintptr_t pc)
 {
-    assert(pc != 0);
-#ifdef TARGET_HAS_PRECISE_SMC
+    /*
+     * Without precise smc semantics, or when outside of a TB,
+     * we can skip to invalidate.
+     */
+#ifndef TARGET_HAS_PRECISE_SMC
+    pc = 0;
+#endif
+    if (!pc) {
+        tb_invalidate_phys_page(addr);
+        return false;
+    }
+
     assert_memory_lock();
     {
         TranslationBlock *current_tb = tcg_tb_lookup(pc);
@@ -1058,9 +1068,6 @@ bool tb_invalidate_phys_page_unwind(tb_page_addr_t addr, uintptr_t pc)
             return true;
         }
     }
-#else
-    tb_invalidate_phys_page(addr);
-#endif /* TARGET_HAS_PRECISE_SMC */
     return false;
 }
 #else
-- 
2.38.1


