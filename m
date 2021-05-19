Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3A5388BF8
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 12:48:50 +0200 (CEST)
Received: from localhost ([::1]:48298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljJkv-0007qP-G2
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 06:48:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1ljJh9-0005Oq-F9; Wed, 19 May 2021 06:44:55 -0400
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c]:46711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1ljJh8-0000Ec-1m; Wed, 19 May 2021 06:44:55 -0400
Received: by mail-lj1-x22c.google.com with SMTP id e11so15014025ljn.13;
 Wed, 19 May 2021 03:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=olWhdhaWqeV2dbP01gnazSRmYCaz/VE+FnQZbWHx/cc=;
 b=fkSMfgCh1zhA0B3RlxSlOcz6DbUdVoRY2g/lm8Vpcs5+PkrxtLAGbSfJA1gGiL9JN7
 51CFBhdU/w9a/lp7NlSEP/+qgRYjIqgKiUvQUyE3CIlVWelBl44cmL1ZvsVcG+MwrBKc
 p8lclF7HVrSwwiEs9RvlWYU3Hy786bUUbjbtyzdP7DrFhmgV6HlrTZ0Ppvtx3cVwInRy
 0ggAXkDi4aY6MoemgLdJ2dTvbtvwYtqFcTYpAz2GDI0UBk87qVRCkQ0t53x4Yq1LEZc+
 k53M+VOq0qScOfXpcedaSt56eoqBBFKbfGSCimrnnXk7YcIEeKqM6eGw51jJKQX36Kg4
 Hgbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=olWhdhaWqeV2dbP01gnazSRmYCaz/VE+FnQZbWHx/cc=;
 b=XaEu9dbePCoRTaEBxuZfLkvZBtbanU4sW67O3CRx1RoGM4yLImSoWeSIJNJFidrZT/
 aarf9L0gBPqo16WhJaDsGslimfjW+JW8GRaCErvS+L9E1rAgOIoLQ1adYYtGsUCc5X7B
 InGbxJjEKUt/4+yY35dlxeHeq3rF1ShrMi0wRDwYuCI2xlKJ2eaxUuvHwfMNGVhvnUEk
 H8uiUpXp2+UXLaeGecE63e6Un9P6mOU80wQe97cthhHg/7cNsOYs48gHKAnqPYem1Fxn
 XgqRoqf5lZZG5d7bnBEV4gGQdim+3WDYEwc66NSXp2vKbd9a1/ZyqRXaoI7T/mxCPErt
 h2gQ==
X-Gm-Message-State: AOAM530Mi2aWwaz3l6wXQ8UHI7pvDKh9hRfT30qxWGaTzWr1Q/HJ2Lp4
 EWCmhXe2z8AN0YEDUFldrjZQwr4yYh4poA==
X-Google-Smtp-Source: ABdhPJyOC7ro4uM+wFqiI23uGT+kaI3O2W2wIe3N/q0BhotJHXwOLOVJDppsl2czPSGWer/lnQ+CtQ==
X-Received: by 2002:a2e:8005:: with SMTP id j5mr8514533ljg.336.1621421091525; 
 Wed, 19 May 2021 03:44:51 -0700 (PDT)
Received: from octofox.metropolis ([5.18.202.173])
 by smtp.gmail.com with ESMTPSA id s17sm3715913ljo.117.2021.05.19.03.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 03:44:50 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/xtensa: fix access ring in l32ex
Date: Wed, 19 May 2021 03:44:33 -0700
Message-Id: <20210519104433.16870-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-lj1-x22c.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=1,
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
Cc: Max Filippov <jcmvbkbc@gmail.com>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

l32ex does memory access as all regular load/store operations at CRING
level. Fix apparent pasto from l32e that caused it to use RING instead.

Cc: qemu-stable@nongnu.org
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 target/xtensa/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index f93df87ec490..95f6b21c2a1e 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -1814,7 +1814,7 @@ static void translate_l32ex(DisasContext *dc, const OpcodeArg arg[],
     tcg_gen_mov_i32(addr, arg[1].in);
     gen_load_store_alignment(dc, 2, addr, true);
     gen_check_exclusive(dc, addr, false);
-    tcg_gen_qemu_ld_i32(arg[0].out, addr, dc->ring, MO_TEUL);
+    tcg_gen_qemu_ld_i32(arg[0].out, addr, dc->cring, MO_TEUL);
     tcg_gen_mov_i32(cpu_exclusive_addr, addr);
     tcg_gen_mov_i32(cpu_exclusive_val, arg[0].out);
     tcg_temp_free(addr);
-- 
2.20.1


