Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A0537409C
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 18:34:56 +0200 (CEST)
Received: from localhost ([::1]:40030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leKUB-0008JB-Ii
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 12:34:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1leK6v-0000w4-3c
 for qemu-devel@nongnu.org; Wed, 05 May 2021 12:10:53 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:35707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1leK6t-0004bh-6C
 for qemu-devel@nongnu.org; Wed, 05 May 2021 12:10:52 -0400
Received: by mail-wr1-x434.google.com with SMTP id a4so2460911wrr.2
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 09:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YKZnUdVXT3DhhQC6sc2aNoe+FBTMI3ffJAjvFbk8MDo=;
 b=U2qhriwIVPuOdgBO/n0qXF1/HH/Dqbq/yvkpxM1SWmsDfez4HdjgufFebnp5IAOgOa
 otYbIEnKZOU2UAyv33JiVkP026w8wR0/xIeEht1iO0LfDgJjvI8fI1FlR/Xi1o7OIpI0
 8RHJvF94nwONNWZ/EFxG/Ob4VGLvvqg7azGsz5AsXo3ZwjqD1dRWHUSeyDJsMIiRNGOv
 X/qPjBB479JjTBKPLaXGOOYHgFJ6ZkgTrRjGlTooMeH0UWQgtGAAPeM97puhOZ2KNU6i
 Ni/BcBtqvYej3HRIyBOGVDeEjf/XU3Z678+uQgiwiIF4p7PC6npMKWy3PwrfyRqBOxAW
 NgbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=YKZnUdVXT3DhhQC6sc2aNoe+FBTMI3ffJAjvFbk8MDo=;
 b=NUapk39ogQQz+AThkv5xj+Y1CcRhXaGcT0jTV6fdyaPeJrCUeLQ4SzoXF3b9kdFlJd
 c1NjQDS1z6sBKxfdJfCX30GGw4h56Lk5cdeBLVJ4p3UxFgW0e9wkaPR5Bo/rLrJpTqw8
 BfE5sD1gh5gyOtSKu7mGJhL07fa0WI+1AANLM4xI2c54AZY6NyW4M1NQJII2VQvnrovz
 UphgsfQbqGTju1roq1aegnCDyMAeKCV2DJBTUMHesvnfNx0kTf6yemmCpw3TgX42K1ZP
 DgTybFUgUwhgK6gUgOiaoUZTAPeBdcVaFZhEX7TvG004WXSzp1QLZQaNj1aQtObn44i7
 2oGQ==
X-Gm-Message-State: AOAM532xtP6HD62UM8uXZ4m/q21eFfp+HP6hIwt/xVhCbBLtmduSf9do
 7qBTLXLB7ogYrGLcB3HEofokj87cqyuDKdgT
X-Google-Smtp-Source: ABdhPJxXrVh49uQyECv9VaNrl4Pd3uM+EaYLZRwirRyO5kWcCX1w479WqzGMxWHDildm2bz3EU2Hkw==
X-Received: by 2002:a05:6000:1811:: with SMTP id
 m17mr17920136wrh.318.1620231048855; 
 Wed, 05 May 2021 09:10:48 -0700 (PDT)
Received: from x1w.redhat.com
 (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
 by smtp.gmail.com with ESMTPSA id i12sm12427816wry.57.2021.05.05.09.10.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 09:10:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/sh4: Return error if CPUClass::get_phys_page_debug()
 fails
Date: Wed,  5 May 2021 18:10:46 +0200
Message-Id: <20210505161046.1397608-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If the get_physical_address() call fails, the SH4 get_phys_page_debug()
handler returns an uninitialized address. Instead return -1, which
correspond to "no page found" (see cpu_get_phys_page_debug() doc
string).

This fixes a warning emitted when building with CFLAGS=-O3
(using GCC 10.2.1 20201125):

  target/sh4/helper.c: In function ‘superh_cpu_get_phys_page_debug’:
  target/sh4/helper.c:446:12: warning: ‘physical’ may be used uninitialized in this function [-Wmaybe-uninitialized]
    446 |     return physical;
        |            ^~~~~~~~

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/sh4/helper.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/sh4/helper.c b/target/sh4/helper.c
index bd8e034f174..2d622081e85 100644
--- a/target/sh4/helper.c
+++ b/target/sh4/helper.c
@@ -441,9 +441,12 @@ hwaddr superh_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
     target_ulong physical;
     int prot;
 
-    get_physical_address(&cpu->env, &physical, &prot, addr, MMU_DATA_LOAD);
+    if (get_physical_address(&cpu->env, &physical, &prot, addr, MMU_DATA_LOAD)
+            == MMU_OK) {
+        return physical;
+    }
 
-    return physical;
+    return -1;
 }
 
 void cpu_load_tlb(CPUSH4State * env)
-- 
2.26.3


