Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BD353B15B
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 03:55:16 +0200 (CEST)
Received: from localhost ([::1]:53354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwa3P-0000k7-Ny
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 21:55:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwZjL-0002hL-Av
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 21:34:31 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:35486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwZjI-0005Ht-Q7
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 21:34:31 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 o6-20020a17090a0a0600b001e2c6566046so7988838pjo.0
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 18:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L/s5DB9oA5m3J3r5mnRcmLEGwctJwKQaqGAa+nl3EZs=;
 b=xwtzXLAhoMju4N5qLw1tZp4zDEkGY2MnVNNFRnFL5fYtcu4T5Ci7yvpHqbd/UXctWB
 CM0n4SmJqdbGOIpb43GpyJhaxdUhUOvRJzR80VGtde0U5WYa7KHfZF7yiPd+STJD+m/k
 +kc3dxv0MgskyzudzhvK8fU2J8EA51ZbhgQ3lSqn5entGdqhi7SFjT3eopHvXk8Jmf7p
 Rnfdp09Yn2e3CAAqszaqxTYKKAROAQVc+apG3Rlwpk9qo2BqrCw6dIrqf/V1SmpfGPOW
 m0g6eityYLZWmFwM3AjFQa+Iw311sQoz1R+dKgs935u4oa135TVPKG9AIlD0fEQ6q9JG
 YwQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L/s5DB9oA5m3J3r5mnRcmLEGwctJwKQaqGAa+nl3EZs=;
 b=qQinrN6fbLNaMFzAh1qILcn4xSaN8JhfurzO3dAy8KnMwI7ht4mJBxeVSc62Ckl0yr
 PX+BC/RnjPZobOITByXmXqUdlTPgGCUi9ghXicMYv7eNhYtPEJdOcXbgTeClxMjJj5lZ
 5QEL40V/Fim2i9vF/ez2x4q5LyHZqakmRvs0WXh3vDhiqp5iba0CS7I+fvsm3Xb2K+q4
 3oSyMut1GbXbwj2oPcooKTKpds9iK9Wb9MEVdAhnAaAOPhKOC86Lm/hdpqyEBszt2e7q
 kEZLhqZ1c0ormyOxianrjFxTgPhKCZNDvEbJjMaz2CCbQhRLGVbcl07sPF2CP6WVBiE8
 p+pA==
X-Gm-Message-State: AOAM531wEzaWL0EzOhEeMh+iHKRY4LbtF6owO/LJSuJPHINK5g7v+jlY
 NH/j2OPaPYcq69hSmxD3MPrvyqWdkHizwA==
X-Google-Smtp-Source: ABdhPJxsayAq0vUrHM3Icu6hBINZa4SrHqImxVegRJk199sEZEQ8Gc6pDJ4bKlTh9tDmHpjWrPV9lQ==
X-Received: by 2002:a17:90a:fe0d:b0:1e2:e9bf:1139 with SMTP id
 ck13-20020a17090afe0d00b001e2e9bf1139mr2442184pjb.106.1654133658860; 
 Wed, 01 Jun 2022 18:34:18 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:1eca:8ee3:9269:e00c])
 by smtp.gmail.com with ESMTPSA id
 l191-20020a6391c8000000b003fc5b1db26fsm1962875pge.52.2022.06.01.18.34.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 18:34:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
Subject: [PATCH v6 12/17] target/m68k: Implement TRAPV
Date: Wed,  1 Jun 2022 18:33:56 -0700
Message-Id: <20220602013401.303699-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602013401.303699-1-richard.henderson@linaro.org>
References: <20220602013401.303699-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/translate.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 83c2f73063..fa704e0c25 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -4910,6 +4910,14 @@ DISAS_INSN(trapcc)
     do_trapcc(s, &c);
 }
 
+DISAS_INSN(trapv)
+{
+    DisasCompare c;
+
+    gen_cc_cond(&c, s, 9); /* V set */
+    do_trapcc(s, &c);
+}
+
 static void gen_load_fcr(DisasContext *s, TCGv res, int reg)
 {
     switch (reg) {
@@ -6073,6 +6081,7 @@ void register_m68k_insns (CPUM68KState *env)
     BASE(nop,       4e71, ffff);
     INSN(rtd,       4e74, ffff, RTD);
     BASE(rts,       4e75, ffff);
+    INSN(trapv,     4e76, ffff, M68000);
     INSN(rtr,       4e77, ffff, M68000);
     BASE(jump,      4e80, ffc0);
     BASE(jump,      4ec0, ffc0);
-- 
2.34.1


