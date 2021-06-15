Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F803A74AA
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 05:09:22 +0200 (CEST)
Received: from localhost ([::1]:47492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lszS4-0006lI-Ij
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 23:09:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lszQe-0004bH-Dh
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 23:07:52 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:34406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lszQb-000898-M9
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 23:07:52 -0400
Received: by mail-pf1-x42a.google.com with SMTP id g6so12169459pfq.1
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 20:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9glrwO//kduxlvzU2NaztkmtbUkYP+/zX6C9TwX8Wm0=;
 b=u6y/VHbBtttWaMbmktXjtbd5JgyFg28jO9+tqD6QiPP5h72jSjrIzYtgEDiaYIZNyf
 zUW1kDXFl4SsOx9qj2djtEG5+efyF2S+rbEHP8eAVCSJ1NBwSxT33gPqUeTrzeICG3Qf
 MVp2/TKTjic3l4dfJzmyxnO1Gj9nfuAY2FeEWq0r1WD0TQ3vSzdsUewbUmYVpIICWVLO
 K5b/CgKb+6hV7ygt/qLvY3tCrGi/WUsXx4RBI64a50HhrOjRB0V5e9Q3GTtZQoEFV7ql
 XIHYDXnfWNuG8ryhtMU3aTW5SOx44p7o4Z5Qfg2ZGg7nNTZh7+fhiwN+ViqTmiS4SCjs
 Blmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9glrwO//kduxlvzU2NaztkmtbUkYP+/zX6C9TwX8Wm0=;
 b=JoN2afL4PKBCB19QvzAgvJYOvzqDIha1kyezbgkfxUJ16Q9VVRiHrs+tXsKAn2BzrE
 CCGwZ1bZ0SHnGfnJ7mJ57hKb0TNNUh546jfRIAF737ACcjaAOpVV8wHZH6uSds4QGCIC
 xKijvhv+4P3vb0D/7GKbpiVS8k70A4lgJxc2fGSIGQucdXGkmoQ7ZNvh/YsT3CikNn9G
 jfvFrm8vwfdW9PAG6Q8AYx+m7oxezhKDH6f/HvFbyRAy1X8HZFsyL89p+nShX+07iAlB
 xre1jKmX6JB3lv4b+mJXfegq7Cmf2Wud2RypX5yrsUD4cQwoyqSJ6InDp8+VC/2D/OI4
 pp7g==
X-Gm-Message-State: AOAM532e5Oh8vj0YuHxWndHlaTwsob/f3MMVKa2ef2pKN9P4xKErJaK4
 L+eufiMDsDursY6fgGOHw3WSO34+JDgSww==
X-Google-Smtp-Source: ABdhPJxzXdv8TGgD+JzAxyFaGT46q7fjrbPXu2xb0Tre/FWwzq6Ukb5AnU2YbtrDH23Q/N3UjB/euQ==
X-Received: by 2002:aa7:954c:0:b029:2f5:33fc:1073 with SMTP id
 w12-20020aa7954c0000b02902f533fc1073mr2100392pfq.79.1623726468449; 
 Mon, 14 Jun 2021 20:07:48 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id w71sm7554666pfc.164.2021.06.14.20.07.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 20:07:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/5] target/s390x: Do not modify cpu state in
 s390_cpu_get_psw_mask
Date: Mon, 14 Jun 2021 20:07:41 -0700
Message-Id: <20210615030744.1252385-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210615030744.1252385-1-richard.henderson@linaro.org>
References: <20210615030744.1252385-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
Cc: ruixin.bao@ibm.com, jonathan.albrecht@linux.vnet.ibm.com, cohuck@redhat.com,
 qemu-s390x@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want to use this function for debugging, and debug should
not modify cpu state (even non-architectural cpu state) lest
we introduce heisenbugs.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/helper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/s390x/helper.c b/target/s390x/helper.c
index d311903b94..559fc3573f 100644
--- a/target/s390x/helper.c
+++ b/target/s390x/helper.c
@@ -321,12 +321,12 @@ uint64_t s390_cpu_get_psw_mask(CPUS390XState *env)
     uint64_t r = env->psw.mask;
 
     if (tcg_enabled()) {
-        env->cc_op = calc_cc(env, env->cc_op, env->cc_src, env->cc_dst,
-                             env->cc_vr);
+        uint64_t cc = calc_cc(env, env->cc_op, env->cc_src,
+                              env->cc_dst, env->cc_vr);
 
+        assert(cc <= 3);
         r &= ~PSW_MASK_CC;
-        assert(!(env->cc_op & ~3));
-        r |= (uint64_t)env->cc_op << 44;
+        r |= cc << 44;
     }
 
     return r;
-- 
2.25.1


