Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBD450A7A9
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 20:01:23 +0200 (CEST)
Received: from localhost ([::1]:37692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhb7E-00026E-Hr
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 14:01:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhaeW-0000bg-2D
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 13:31:36 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:37630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhaeT-0002wY-J3
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 13:31:34 -0400
Received: by mail-pg1-x532.google.com with SMTP id x191so5230369pgd.4
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 10:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vnUo923wbj7XIwCBnfHZzIv0sYzZ9mMty9XfzDgDwDE=;
 b=SM0tk9g109NEjtSm1262CvfGApP6QN8vvvnMiOVWXF/HFV9n5kurgBiCLoLQP9GXtQ
 j84an5TbQjIWvpU7ClsrWUg7wTPYTVt0sIisYUYNh0PUUowndi6maef7yTfwW6+gCUlV
 4KJHpDj26L/DCsVWp0t3BR0O0MrtX7o094Ut5v2aSvDubmzsNy4s1k0QWYrH02RUXWOK
 7NIOkYJyy/eUNVmkkHRez3rxpD2MCk3vlyGpWNrOWyJjZ3earTvbeAJG7uQdosk0FQ7Y
 4u5SFCOWHpX7cLCbAmxxb0nfCiMJH0Q2oi0KlkoYlzm0Z289/A/z6QG8fv6Ge9alRbcu
 HgIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vnUo923wbj7XIwCBnfHZzIv0sYzZ9mMty9XfzDgDwDE=;
 b=IZCu7/MfHU08t3pyAWqRQrFIdeH69jLRx9jO5nXaxCmtxroM6mhmWvpNAQkv/5vTSe
 O9XOX5k22bz5IjHOdEVg7nzjlvHwTs6DEXT/yBIZCoXAMnaWIq34h0WYlCAFYi/Wcwbt
 QvEu5d4Ymjsp6lidfHsH02jwHM5f5dI6Y76DbgGaKCv+D89VRVNfyQnH/ljBEkEx6Aeh
 3/wQbtml9UtR0KpRE3zAjIbgpSqybzVzEPOgYZNa+Fs3t3YSTbt+vaSvEIONLZGA68zL
 cquI5bRrjFKOgTHvjWOcCr8hzTcbrA12xsKoC8GOipBZOQanagucp662l0OXDWxUxzxi
 kbkw==
X-Gm-Message-State: AOAM532UMEQxiMP4DzQN9BTYOeSoR5WjSIfqVChlgE23dd9Dg+EW4ZQW
 2BfSWetvWNT6Yg5gLPRlocFRlcFFCVQgMRJe
X-Google-Smtp-Source: ABdhPJzf7jElnxsTCy01iptVFOEr7grNAPQrt9uDhxgaxDJZu0yoq8nw+g/F4XpuQAy827KtKW1v5w==
X-Received: by 2002:a63:40c6:0:b0:39d:9463:94ac with SMTP id
 n189-20020a6340c6000000b0039d946394acmr411018pga.289.1650562290321; 
 Thu, 21 Apr 2022 10:31:30 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80c1:f8a5:3d1f:84a9:7713:bf09])
 by smtp.gmail.com with ESMTPSA id
 204-20020a6302d5000000b00385f29b02b2sm23557644pgc.50.2022.04.21.10.31.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 10:31:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 6/7] target/rx: set PSW.I when executing wait instruction
Date: Thu, 21 Apr 2022 10:31:13 -0700
Message-Id: <20220421173114.48357-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220421173114.48357-1-richard.henderson@linaro.org>
References: <20220421173114.48357-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
Cc: Tomoaki Kawada <i@yvt.jp>, Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Tomoaki Kawada <i@yvt.jp>

This patch fixes the implementation of the wait instruction to
implicitly update PSW.I as required by the ISA specification.

Signed-off-by: Tomoaki Kawada <i@yvt.jp>
Reviewed-by: Yoshinori Sato <ysato@users.sourceforge.jp>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220417045937.2128699-1-i@yvt.jp>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/rx/op_helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/rx/op_helper.c b/target/rx/op_helper.c
index 11f952d340..81645adde3 100644
--- a/target/rx/op_helper.c
+++ b/target/rx/op_helper.c
@@ -448,6 +448,7 @@ void QEMU_NORETURN helper_wait(CPURXState *env)
 
     cs->halted = 1;
     env->in_sleep = 1;
+    env->psw_i = 1;
     raise_exception(env, EXCP_HLT, 0);
 }
 
-- 
2.34.1


