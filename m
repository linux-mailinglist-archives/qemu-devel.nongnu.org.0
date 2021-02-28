Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B460232756A
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 00:57:11 +0100 (CET)
Received: from localhost ([::1]:60456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGVvy-0001Xv-Mf
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 18:57:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPs-0005fV-2m
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:24:00 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:37365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPg-0007lU-72
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:23:59 -0500
Received: by mail-pf1-x430.google.com with SMTP id i10so1101226pfk.4
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 15:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U1XiVtYWvYMkkEWgKciMDe6IrloK2SNAwvVZLpof23Y=;
 b=qtGgVQDPWGYx0rb+orSlBir1h0GtP34+RnbJ1uqjprms5xsmn3IkoPX4stkvSysUwy
 0aFmXP0lOmmoMi2vmyWo6jH1fZE6ttHB9IBObdLvb1yebDUGffvxvJ/PZOmYoFb7vK/x
 vqJO03Y6VIouu3/C5914J3BNXqcSZ0SiwW1hg3NOa8hh8pdnV3xoEBc4A1wete4Hy3De
 3WFOvz8tvo8rxQie9IXDdEqUk10zPB4xdjuNdoDxlyQ3P+t7Gea/dwVe3wZOAosBFtvQ
 cRipWadnTBKQEfrW/060lBQdLUC68KHVUwd16u+f+WhMuMUFTiocW7bL7rjLovpIcJ2L
 OZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U1XiVtYWvYMkkEWgKciMDe6IrloK2SNAwvVZLpof23Y=;
 b=TV0h36aA9wd/V4AW0k7DzyeB2eVRELIPnWXUukRUKPlPGjGkYW02H5cX8qNjRKbD4O
 wJvRf7wr3b8wDIkqFxbe7j7Dmdgr8zDRggy1YSXoCze81NOk7X7HsK1omcUy2LNYOvS4
 7QJbAA7Kpj1f9Wiu8XAZDopUmhE/KDUzKE9znWNxf8x/FjSsm8Xk+1V1/LlH7ElUg90d
 EjCL66/QruIWph7ZzIXJ4egPUtW8pRDqFZjK/A0qWM7BuKU2VWTn3Ug/V8zSNH4FE+rc
 b0xrl8Kit6Lp4wns/YsrPzAuScRBPQbvW7If+PkY2VbbSmkj/+JbogX/69GKVPsTZCgb
 lncg==
X-Gm-Message-State: AOAM532kHTsODyvKSBJamUN7IFtDrlP+fwXOtZ3HSZoWlh3YY0Kl3+km
 iW04qQrBQ89rKLci/9Q7EfQeB1r+KZqOjA==
X-Google-Smtp-Source: ABdhPJzNb+ip4QloMWaH7D2SaedAwwb/ZSsv5nZDXebyCXNlxfekGXLJb70u5r7DjT0mtnudDL4fcg==
X-Received: by 2002:a62:7e01:0:b029:1ed:8173:40a1 with SMTP id
 z1-20020a627e010000b02901ed817340a1mr12491102pfc.6.1614554626931; 
 Sun, 28 Feb 2021 15:23:46 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id d24sm16257400pfn.54.2021.02.28.15.23.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 15:23:46 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 27/50] target/i386: Fix the comment for repz_opt
Date: Sun, 28 Feb 2021 15:22:58 -0800
Message-Id: <20210228232321.322053-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228232321.322053-1-richard.henderson@linaro.org>
References: <20210228232321.322053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
Cc: cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After fixing a typo in the comment, fixup for CODING_STYLE.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 6877873bee..36dee5c0c7 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -8515,15 +8515,16 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     dc->cpuid_xsave_features = env->features[FEAT_XSAVE];
     dc->jmp_opt = !(dc->base.singlestep_enabled ||
                     (flags & (HF_TF_MASK | HF_INHIBIT_IRQ_MASK)));
-    /* Do not optimize repz jumps at all in icount mode, because
-       rep movsS instructions are execured with different paths
-       in !repz_opt and repz_opt modes. The first one was used
-       always except single step mode. And this setting
-       disables jumps optimization and control paths become
-       equivalent in run and single step modes.
-       Now there will be no jump optimization for repz in
-       record/replay modes and there will always be an
-       additional step for ecx=0 when icount is enabled.
+    /*
+     * Do not optimize repz jumps at all in icount mode, because
+     * rep movsS instructions are executed with different paths
+     * in !repz_opt and repz_opt modes. The first one was used
+     * always except single step mode. And this setting
+     * disables jumps optimization and control paths become
+     * equivalent in run and single step modes.
+     * Now there will be no jump optimization for repz in
+     * record/replay modes and there will always be an
+     * additional step for ecx=0 when icount is enabled.
      */
     dc->repz_opt = !dc->jmp_opt && !(tb_cflags(dc->base.tb) & CF_USE_ICOUNT);
 
-- 
2.25.1


