Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A793D17A1
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 22:12:13 +0200 (CEST)
Received: from localhost ([::1]:53820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6IZf-00086F-Sj
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 16:12:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6IOA-0002sn-5M
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 16:00:18 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:43523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6IO8-0005mC-CC
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 16:00:17 -0400
Received: by mail-pl1-x62e.google.com with SMTP id b12so1631148plh.10
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 13:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5munM6eZd/uk4n4hD7SHb+ixOouAZHeY9ReXlmZhFgI=;
 b=viTLpVQEsZL+8QAxFbaPI6rVcRXgOVtwgaOYJDgajeXL453XnRJRNAKo2v3TynVoBH
 uAXZQiiUcrosc5Yht8YK8ThnOnaqfk5FjQPp4Ok7qjia+TkSDr7pKhHJCYUjxVLXWOe7
 /gu4J8JQP6SxbEJAOLDO/UwNBdKCwy+XKclLniQ36P/zlYmd7j27c3ENcF7A7HzrVDag
 IXJk+iNe1bK/5MKJGdwV60XJtxnMV+XIzm8xfKKi0ib2CSiX5TPWsPEub6m+cOXAdumz
 daawhG3uTBJMghfBE3+l3VPWS2GIrwel3zgBYhMvxL7x0vx8PdyjRXhNgLh4byB3YtVM
 O50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5munM6eZd/uk4n4hD7SHb+ixOouAZHeY9ReXlmZhFgI=;
 b=PkktjTtMjMv06iknfrs7udRTja1vD21JhGQrJtIyuGKBwkIWn7cwMQsg+KsyjnFTD7
 epUCze8JGHGv0c4k3RDiK203awSOfzNhgkrFt47KYxxyn/MZUsqCyjRaKxudvv84aONQ
 t9X5rK4F6NWatWZxVP9l8VbgpK6oXLCE8G6A7bybXP0mmUqEEE5a2GOz6QG1QRmoUjvl
 rkxj1hzyTpQnSHp1Ab68pWtw/ncNs/HiF2aaHjE+HVsWl9GZEt1yyHFSkKoXoOpObNDs
 WtRdHK6hVmhmCOqTRqG+eQrg8oXfpKdxnacWNIQOgefN2t7NmYL+fOz43J58ieianqid
 IAnw==
X-Gm-Message-State: AOAM530Z11AqU3oeQdf+3GPwoUYHDd7pRKnTb3uROZNxBSWcUGJKHWZG
 ufkXojT5Up+17binq0ItPbUdBFztxT6gnw==
X-Google-Smtp-Source: ABdhPJxvN3Iq6b/nAdD5bMIBqG92ImXpF00oV5dl3uF9edSAP7rtA36mmcnELDCN8mVuOBXOfDxFTg==
X-Received: by 2002:a63:9d46:: with SMTP id i67mr37992809pgd.225.1626897615033; 
 Wed, 21 Jul 2021 13:00:15 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id w3sm706028pjq.12.2021.07.21.13.00.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 13:00:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/27] target/alpha: Drop goto_tb path in gen_call_pal
Date: Wed, 21 Jul 2021 09:59:40 -1000
Message-Id: <20210721195954.879535-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721195954.879535-1-richard.henderson@linaro.org>
References: <20210721195954.879535-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are certain of a page crossing here, entering the
PALcode image, so the call to use_goto_tb that should
have been here will never succeed.

We are shortly going to add an assert to tcg_gen_goto_tb
that would trigger for this case.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/alpha/translate.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index 103c6326a2..949ba6ffde 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -1207,19 +1207,8 @@ static DisasJumpType gen_call_pal(DisasContext *ctx, int palcode)
                   ? 0x2000 + (palcode - 0x80) * 64
                   : 0x1000 + palcode * 64);
 
-        /* Since the destination is running in PALmode, we don't really
-           need the page permissions check.  We'll see the existence of
-           the page when we create the TB, and we'll flush all TBs if
-           we change the PAL base register.  */
-        if (!ctx->base.singlestep_enabled) {
-            tcg_gen_goto_tb(0);
-            tcg_gen_movi_i64(cpu_pc, entry);
-            tcg_gen_exit_tb(ctx->base.tb, 0);
-            return DISAS_NORETURN;
-        } else {
-            tcg_gen_movi_i64(cpu_pc, entry);
-            return DISAS_PC_UPDATED;
-        }
+        tcg_gen_movi_i64(cpu_pc, entry);
+        return DISAS_PC_UPDATED;
     }
 #endif
 }
-- 
2.25.1


