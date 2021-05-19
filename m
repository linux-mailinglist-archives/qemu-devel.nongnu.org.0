Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D90E3890DE
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 16:30:56 +0200 (CEST)
Received: from localhost ([::1]:41814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljNDr-0000tX-1E
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 10:30:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1ljN9R-00012v-5M; Wed, 19 May 2021 10:26:21 -0400
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232]:43000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1ljN9P-0006Zo-E9; Wed, 19 May 2021 10:26:20 -0400
Received: by mail-lj1-x232.google.com with SMTP id w4so15865032ljw.9;
 Wed, 19 May 2021 07:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gxorUMhAoO0g6OH58RJSTa6HptrIpmISWhJfvC1EhI4=;
 b=t529sERlvEg71kmjsmZ8299CzIkidaqyVssIOkvfNOFsOfifSl9GB557sQwwsGtrem
 hF5K0Fj9ot/uhYvY4FsRiSy7l1BmubLifNWkGTqxfku3FtalQ7B89BQFbu3Jg4wvUNkd
 Hys/JdxEHT+l7MAQVtG7ZjKWOJKm1r4jxh9/7DMRVdMHmzzL/Rktxptj/idC5t3rvqNM
 lReijQf5Hf5eD58f5LIaoIGdEs/QwaGa1EM/pGG/SyyTCzNkQx9NH2P4UgqhNqrYnqZI
 QLXG+3X7f7lDEE7E/BfKLKvyM7/1XaN70U7Zwc6VrhozpHOw8EkNT3J2bdmIYyqIgvR9
 Fliw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gxorUMhAoO0g6OH58RJSTa6HptrIpmISWhJfvC1EhI4=;
 b=JtvIZ5XpeDQux4Yk+LbdIMdnhxqxbfjDKRTRQdfQboSXdxd3Z4pyvIZLuNRiVO2zK+
 3o8IkkKdkZr9dZYY4wKcR5JjhTADfKceZWfMtIsJOUzv/yBYDgV/Tjp3detaR6G8IuU2
 0NtenajXBmBBrEZypLCNTsFG7SxW+CxSaK76TJuS6z1w9zSfzONi5YF30zXu2usKZj/X
 icBeQ0DinhauUs15gp1Brb6Pum/PoGsPRNP3+c/cpMTKkd7/Oee9MfGgsXtDX6IQN2No
 hoRqwlhvQ649GT94gGh24qurfbV3oLoVS2+jLpx25fPvxErn9CGVWAJXQn974fr5yPZl
 9uxw==
X-Gm-Message-State: AOAM530XWpIA4G1nxzrAjsx7GgU8ACOTqcqm468SOG6bOM0Lg3E3xXZw
 Lu8mB8THq01UJKCYX0CNWuTBtwVo5Zk=
X-Google-Smtp-Source: ABdhPJyLMPTyN3cf6w0/bS90/wqJs6zBh+wL9oEWkH/19LQwnVdEvJlncgqKoHFVzqVZkyAvwPLENQ==
X-Received: by 2002:a2e:8417:: with SMTP id z23mr9416251ljg.487.1621434376759; 
 Wed, 19 May 2021 07:26:16 -0700 (PDT)
Received: from octofox.metropolis ([5.18.202.173])
 by smtp.gmail.com with ESMTPSA id m25sm814353lfb.240.2021.05.19.07.26.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 07:26:16 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] target/xtensa: fix access ring in l32ex
Date: Wed, 19 May 2021 07:26:07 -0700
Message-Id: <20210519142607.27190-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-lj1-x232.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=0.999,
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
Cc: Max Filippov <jcmvbkbc@gmail.com>,
 Joaquin de Andres <me@xcancerberox.com.ar>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

l32ex does memory access as all regular load/store operations at CRING
level. Fix apparent pasto from l32e that caused it to use RING instead.

This is a correctness issue, not a security issue, because in the worst
case the privilege level of memory access may be lowered, resulting in
an exception when the correct implementation would've succeeded.
In no case it would allow memory access that would've raised an
exception in the correct implementation.

Cc: qemu-stable@nongnu.org
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
Changes v1->v2:
- add correctness/security rationale to the patch description.

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


