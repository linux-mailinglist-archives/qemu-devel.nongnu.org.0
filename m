Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5480A42C8B5
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 20:32:00 +0200 (CEST)
Received: from localhost ([::1]:36024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maj2j-0000w4-K6
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 14:31:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maiu4-00048M-4k
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 14:23:00 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:43753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maiu1-00036P-0K
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 14:22:59 -0400
Received: by mail-pg1-x52b.google.com with SMTP id r2so3120570pgl.10
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 11:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/jngJbg9Yk2oQyeCGWWfZ1SY/lNGas159Ze4XodtNZI=;
 b=LX9JjXs5OdD9O5dOtMLDa4hVKd7C7mJaam8jlsIKccoOQyNjP9PDfvUytiqA6xLpgd
 HbybRAOIHg1LrD/f3x3rgwI4dTCFIAapmQtUly2lfcOjUjGRM3Tkcl2GgzyO7e1cuB0i
 S8AZYQmikoZNas/edN1H6vg21erLJApGiV3vi1FL16AU00yMwAm8FIswMGRNvzNjRKxv
 ik6W6YTLin2aN4h7kzcXqOCt7NBPccEsh4E60qHNhvFdNnnng4JE0A+8WWOYVOzRPswH
 ZYuuZ7RdOv6u6KxADCUuNO553cUXgW63BCQ4q8LF13d1tPt83SBPodBrQF8ESIUxg0FW
 Z4lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/jngJbg9Yk2oQyeCGWWfZ1SY/lNGas159Ze4XodtNZI=;
 b=k1j/ZTpFvgpRK5hM4Z67SAHJURPlPFkbUdlqHUj/3YGGzL+Gt2anGGqLexZOrelwb0
 rYQZWnrb71oBJRPc9/7rCn/jUw3ojPj2oNkKz1By/54QJLrGDn6KB0evZTTV/MZMHRca
 L7uzydZVhPPritlh86H1SApHW2gBKlUiJ4MPG1gi/tztg6q+ObQtfKkIoFZMvQiZFhmw
 CAfCfO3rR4ZIUM8Iog5psJBIDtsaSqc82AbvsyqFDyDKSaFg64IKk+6YNh3fEvKDqOYp
 GAzBSzCa+KD1DOFdFdm6ZhR7pYytYg8Pey5ONK+Vag9aXFdOpikA+VD7opOtMSYUlLoy
 gyCg==
X-Gm-Message-State: AOAM5311nYnvlabKALiIRKX2LXTzG/UF0k6Xe8DHzkbJJD/8pGf00nuz
 5lgQVCD7abYC8Ji/xExtE+SdypFaAa8Txw==
X-Google-Smtp-Source: ABdhPJwKCXmEdtejOtbZbMdtQN5lyMVMHeY5CavX6dI+ljDVztYoGYXP6nk6EFqt3bZfVBWO67H3/w==
X-Received: by 2002:a63:4766:: with SMTP id w38mr629323pgk.104.1634149375638; 
 Wed, 13 Oct 2021 11:22:55 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id z2sm177140pfe.210.2021.10.13.11.22.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 11:22:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/15] target/sparc: Use cpu_*_mmu instead of helper_*_mmu
Date: Wed, 13 Oct 2021 11:22:36 -0700
Message-Id: <20211013182239.991127-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013182239.991127-1-richard.henderson@linaro.org>
References: <20211013182239.991127-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The helper_*_mmu functions were the only thing available
when this code was written.  This could have been adjusted
when we added cpu_*_mmuidx_ra, but now we can most easily
use the newest set of interfaces.

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/ldst_helper.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/sparc/ldst_helper.c b/target/sparc/ldst_helper.c
index abe2889d27..bbf3601cb1 100644
--- a/target/sparc/ldst_helper.c
+++ b/target/sparc/ldst_helper.c
@@ -1333,27 +1333,27 @@ uint64_t helper_ld_asi(CPUSPARCState *env, target_ulong addr,
             oi = make_memop_idx(memop, idx);
             switch (size) {
             case 1:
-                ret = helper_ret_ldub_mmu(env, addr, oi, GETPC());
+                ret = cpu_ldb_mmu(env, addr, oi, GETPC());
                 break;
             case 2:
                 if (asi & 8) {
-                    ret = helper_le_lduw_mmu(env, addr, oi, GETPC());
+                    ret = cpu_ldw_le_mmu(env, addr, oi, GETPC());
                 } else {
-                    ret = helper_be_lduw_mmu(env, addr, oi, GETPC());
+                    ret = cpu_ldw_be_mmu(env, addr, oi, GETPC());
                 }
                 break;
             case 4:
                 if (asi & 8) {
-                    ret = helper_le_ldul_mmu(env, addr, oi, GETPC());
+                    ret = cpu_ldl_le_mmu(env, addr, oi, GETPC());
                 } else {
-                    ret = helper_be_ldul_mmu(env, addr, oi, GETPC());
+                    ret = cpu_ldl_be_mmu(env, addr, oi, GETPC());
                 }
                 break;
             case 8:
                 if (asi & 8) {
-                    ret = helper_le_ldq_mmu(env, addr, oi, GETPC());
+                    ret = cpu_ldq_le_mmu(env, addr, oi, GETPC());
                 } else {
-                    ret = helper_be_ldq_mmu(env, addr, oi, GETPC());
+                    ret = cpu_ldq_be_mmu(env, addr, oi, GETPC());
                 }
                 break;
             default:
-- 
2.25.1


