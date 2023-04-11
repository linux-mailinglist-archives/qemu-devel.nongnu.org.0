Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3879C6DCECA
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 03:10:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pm2TE-0006Tq-3R; Mon, 10 Apr 2023 21:06:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2T3-0005q3-3Z
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 21:06:41 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2Sz-0000rl-8F
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 21:06:40 -0400
Received: by mail-pj1-x1029.google.com with SMTP id px4so4176026pjb.3
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 18:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681175196;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U3GQzefZ28zb/sjvcPHPQ2WB6aIN+aVY6R/9kd6URaA=;
 b=PuO28f0P2bnpHXyUz0rNB7TyCDgHQYPbt+Vkuq7Z1Jgnz8GyROJrpE11x3BlZk5j31
 kvUPJSENZN6/CIM4V6iVPArkhbT1UYoyEMw54rk8Gigq8H7Qgp5/fF0ke7a/PtAkpwnO
 jCSxku7++lhjjEb3ms2hMu9Do53hqCW+cHsHK6VbhQUKG5NxGmwwe7+MvbvcGY1p8Yv7
 mOWFLyprbuIHvSI9rg7xM5L7kUJLUBcTDClswamHnvdlz5viktRDX1FQi81PNKOFK6Zk
 hzlFK0kemh1YxjLH76DH3Q2cO/LXVEwiBPuOwWNkha09Wg9KBcEHrPDweAKFIhCBlD33
 kzzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681175196;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U3GQzefZ28zb/sjvcPHPQ2WB6aIN+aVY6R/9kd6URaA=;
 b=uGykANbIBTditJ2DKBSqzVUQzTSPkRMmjbtXA2S9UujufQ8ZBGLyj6S0V6PpJru3t6
 UvcaTSfCFaqhHcMFOFLMmjmWVy5gv/Wbiv15I0z3BZ83la+bszfZENmEAUE9wXWcL6Q4
 45p3n1jX1XEdrg4ezm64VPYjbyyayI22HQ46wzbbbwJa0P/BmfoUaTNbaj2NG3czH9aF
 i8l1ybLHSUvKPNmIefs8gXMONb7V2iGibjWGmISDY4WzP0/PUFBIpanBksnP7vxqF66R
 u36HftkQt5QIL9V56rRL3K1hbmglXGWLSQlIQY4uP3qOhPxRBAmUu65l1btnpNM2Smek
 r59Q==
X-Gm-Message-State: AAQBX9eRDWiM2HpX0e2SbIqNmcRjR9hrv5iNUsBlj/qsUBiuwzqnQgDN
 QZgyP4E6LFf01jhEggWf7/JuFd1Pg45imglirM0hIg==
X-Google-Smtp-Source: AKy350btT5l1y1fp+caczLmTDyTiCLpBLSqXq1lT9d38aNUa+dut3erZ8Tg+Sp+4gaxyTTy7KT5QWg==
X-Received: by 2002:a05:6a20:7b23:b0:d6:b44e:f635 with SMTP id
 s35-20020a056a207b2300b000d6b44ef635mr9687830pzh.51.1681175196486; 
 Mon, 10 Apr 2023 18:06:36 -0700 (PDT)
Received: from stoup.WiFi.IPv4InfoBelow
 (h146.238.133.40.static.ip.windstream.net. [40.133.238.146])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a65690a000000b0051b0e564963sm1320291pgq.49.2023.04.10.18.06.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 18:06:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 29/54] tcg/sparc64: Drop is_64 test from tcg_out_qemu_ld
 data return
Date: Mon, 10 Apr 2023 18:04:47 -0700
Message-Id: <20230411010512.5375-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230411010512.5375-1-richard.henderson@linaro.org>
References: <20230411010512.5375-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

In tcg_canonicalize_memop, we remove MO_SIGN from MO_32 operations
with TCG_TYPE_I32.  Thus this is never set.  We already have an
identical test just above which does not include is_64

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc64/tcg-target.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index 086981f097..f3e5e856d6 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -1220,7 +1220,7 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data, TCGReg addr,
     tcg_out_movi(s, TCG_TYPE_I32, TCG_REG_O2, oi);
 
     /* We let the helper sign-extend SB and SW, but leave SL for here.  */
-    if (is_64 && (memop & MO_SSIZE) == MO_SL) {
+    if ((memop & MO_SSIZE) == MO_SL) {
         tcg_out_ext32s(s, data, TCG_REG_O0);
     } else {
         tcg_out_mov(s, TCG_TYPE_REG, data, TCG_REG_O0);
-- 
2.34.1


