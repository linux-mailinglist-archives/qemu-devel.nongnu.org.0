Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F1E3EDEE0
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 22:58:15 +0200 (CEST)
Received: from localhost ([::1]:36726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFjgU-0002fX-83
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 16:58:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mFjaB-0008LU-I7
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 16:51:43 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:51881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mFjaA-000316-2z
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 16:51:43 -0400
Received: by mail-wm1-x335.google.com with SMTP id u15so12344379wmj.1
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 13:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gav3+6zKBq62//SE6jKBrLCgBATlNlx3yZjFm4+Th44=;
 b=SyeUYEhqgEANbmQ+9QmLF9I9eLPkOeUluvSbCbiglnVbhlXI6EyZYUZkVXy24j7hu5
 9dq8NKQFSPhcttjzHkRZWuAFl9/Dr8d+t/lFfwxvB48UrQSfauRMQtJntxp4s+7fm3Zy
 1lv+FqNWL7kw/JqJaFx7fHQD15J6FOJ003LQNON3jNo6az4isj33ewzrdsqsOkDqwqBY
 dntXh11B860g9fKrJZSrtfF4ZPcwkaHuQRjoZ24AvB7skTvj5zgu4D4o/GnMzxNQgBCK
 q8hFo31urQXGEXYyuNF2v0+g5XcFZltIbhhCofPyhDY3mkrUJYPKApNNFnER1Dhy+CSj
 qzcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gav3+6zKBq62//SE6jKBrLCgBATlNlx3yZjFm4+Th44=;
 b=O99hOdHG2utYpdWkg5m9K99fNZ8mj7Gf/237OhAVDLt9SaduSKClalQqnBSN9Tcelt
 bAErZOrmh3tR6R4Xxqs5kh+5XVIXqLQ57/h2AHlqQj2ELzQjXndtZeePioQhBGk/SaVT
 5RgVpzeY+jUdYNPQ9ztdkPWSdgqb5tkpYN+Xq7B83D+1EgU04S7D98vrFLP1+4WLnyQe
 TkApwIMf5tOvBmGm2RAt8CbpVtJ99oxyoDgs8qVZszSnZg/DVgDiYkAhC8GNnNsjAda5
 UE1YBHUPo7/XrJqXrap1Fub2qjnmA4IchrbSF4xM4kPTRqnzXxxRpTj1W1MKZJTWiEby
 zlUg==
X-Gm-Message-State: AOAM533sQA9sQZ4nIlbB8CLir3Mhc5W36Q2S6pv0ZZoWqje1tgcdViLL
 yjxI5AeYYTWoeuCUq5iuJABj87aVn60=
X-Google-Smtp-Source: ABdhPJwIKzilc2eUGqNGu8mVYkYXaY0NbHTw7tMIEl+/qxwdgQW9eWFAxeivrgoL3N8VfihJ9f5PSQ==
X-Received: by 2002:a1c:6a18:: with SMTP id f24mr100248wmc.142.1629147100597; 
 Mon, 16 Aug 2021 13:51:40 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 g12sm422846wri.18.2021.08.16.13.51.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 13:51:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/8] target/mips: Inline gen_helper_1e1i() call in
 op_ld_INSN() macros
Date: Mon, 16 Aug 2021 22:51:04 +0200
Message-Id: <20210816205107.2051495-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210816205107.2051495-1-f4bug@amsat.org>
References: <20210816205107.2051495-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

gen_helper_1e1i() is one-line long and is used in one place:
simply inline it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/translate.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 3417fc433ff..db7fc75d937 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -1225,10 +1225,6 @@ TCGv_i64 fpu_f64[32];
     gen_helper_##name(ret, cpu_env, tcg_constant_i32(arg1));      \
     } while (0)
 
-#define gen_helper_1e1i(name, ret, arg1, arg2) do {               \
-    gen_helper_##name(ret, cpu_env, arg1, tcg_constant_i32(arg2));\
-    } while (0)
-
 #define gen_helper_0e2i(name, arg1, arg2, arg3) do {              \
     gen_helper_##name(cpu_env, arg1, arg2, tcg_constant_i32(arg3));\
     } while (0)
@@ -1991,7 +1987,7 @@ static inline void op_ld_##insn(TCGv ret, TCGv arg1, int mem_idx,          \
 static inline void op_ld_##insn(TCGv ret, TCGv arg1, int mem_idx,          \
                                 DisasContext *ctx)                         \
 {                                                                          \
-    gen_helper_1e1i(insn, ret, arg1, mem_idx);                             \
+    gen_helper_##insn(ret, cpu_env, arg1, tcg_constant_i32(mem_idx));      \
 }
 #endif
 OP_LD_ATOMIC(ll, ld32s);
-- 
2.31.1


