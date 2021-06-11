Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4343A4BA8
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 02:14:18 +0200 (CEST)
Received: from localhost ([::1]:45964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrrI1-0007oY-Tf
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 20:14:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqmv-00036T-0l
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:42:09 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:46775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqms-0002nN-Di
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:42:08 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 o10-20020a17090aac0ab029016e92770073so913282pjq.5
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 16:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JF1Hf1+TdXcOHMQWjuxHp6sHzQbmxSqgzI3Kb+3k2Wc=;
 b=mcSZhwgIQsUXktt+bP95/Tfa9HfZQARxFR16Ba0mQmtWQcMCJKtuHsAihjxXPYHMZp
 HOnNfvytNfI7F2ld9ex3ECVKVC0isv/3CMYvfqdKAu7mbhmsd3MJzST9JtG4vf/zlyPE
 +I1dKDggEKyalBPIcyZ0oZVw4TcMNtDZpB9xZvxJWox4B/Vk30AmqtdK3wolZEOtfA11
 F07pE8t3HCnT5vBgZM2O0eh/NPnkFOBXmMw9a/PDu4QpPRDILZu5dMhEpGJ1JNiRjgac
 fUZGUsAtMl0OKZFfoYjg3VgJhKicXAk5zqepKpGWbBzvfigj4oLzp84NgTc38GTYg7dN
 05uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JF1Hf1+TdXcOHMQWjuxHp6sHzQbmxSqgzI3Kb+3k2Wc=;
 b=YY/JxJpwMh4kxgpHK1qMuAKdLOhkGHs61t7TijNW41cxvCLVmpYQUWZeRayCb9z6SR
 a6THh48EbwgQf38g0cdzaXXO6y4Kmyql3Vz0p765g/euEjgm8yTYk026RmkRTYp6rxa1
 O+I+s5Z9IvaUKHVWurIlCUc9BDaLgd/ikL7MK+bjNbiiY3nBtsTFVh40y+AiCehvWeS/
 sDzHx1HiUj156DHNnnShqEeG1v3ssfMlkjxmry15crrsVQyD0z3mIAwA5FeOIQaz82s0
 nUyCk7RKIJFLmkA1fz9fDvwlnV0xYuqUEzb1Ai0bibMyA8ypKtR8YAROMsyDT/zNoFvm
 fEbA==
X-Gm-Message-State: AOAM533Pgqc5AWFBRblY15+YuPa08xUzvRhQBKrgY+Rrvq/JcbLotn7V
 ZWvcbl0chBMQLEZxN0FTiP7KDFuHL4Tpdw==
X-Google-Smtp-Source: ABdhPJwNPAMZPZCYKjCEgmAJA1u4PNeR0o05PprzB6n3L+FNEQolSyR3WfP+nNbE7mUPHEcWCKRM9A==
X-Received: by 2002:a17:902:9a85:b029:10f:45c4:b40f with SMTP id
 w5-20020a1709029a85b029010f45c4b40fmr6121450plp.32.1623454924966; 
 Fri, 11 Jun 2021 16:42:04 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id q23sm6139829pgm.31.2021.06.11.16.42.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 16:42:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 32/34] tcg/arm: Fix tcg_out_op function signature
Date: Fri, 11 Jun 2021 16:41:42 -0700
Message-Id: <20210611234144.653682-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210611234144.653682-1-richard.henderson@linaro.org>
References: <20210611234144.653682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Cc: "Jose R. Ziviani" <jziviani@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Jose R. Ziviani" <jziviani@suse.de>

Commit 5e8892db93 fixed several function signatures but tcg_out_op for
arm is missing. This patch fixes it as well.

Signed-off-by: Jose R. Ziviani <jziviani@suse.de>
Message-Id: <20210610224450.23425-1-jziviani@suse.de>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.c.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index f4c9cb8f9f..5157143246 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1984,7 +1984,8 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
 static void tcg_out_epilogue(TCGContext *s);
 
 static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
-                const TCGArg *args, const int *const_args)
+                const TCGArg args[TCG_MAX_OP_ARGS],
+                const int const_args[TCG_MAX_OP_ARGS])
 {
     TCGArg a0, a1, a2, a3, a4, a5;
     int c;
-- 
2.25.1


