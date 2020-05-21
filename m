Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC631DD3ED
	for <lists+qemu-devel@lfdr.de>; Thu, 21 May 2020 19:08:24 +0200 (CEST)
Received: from localhost ([::1]:46134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbogB-0002z1-3V
	for lists+qemu-devel@lfdr.de; Thu, 21 May 2020 13:08:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.foley@linaro.org>)
 id 1jboIs-0003z0-Te
 for qemu-devel@nongnu.org; Thu, 21 May 2020 12:44:18 -0400
Received: from mail-qv1-xf43.google.com ([2607:f8b0:4864:20::f43]:42555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <robert.foley@linaro.org>)
 id 1jboIr-0006ct-Ve
 for qemu-devel@nongnu.org; Thu, 21 May 2020 12:44:18 -0400
Received: by mail-qv1-xf43.google.com with SMTP id g20so3345197qvb.9
 for <qemu-devel@nongnu.org>; Thu, 21 May 2020 09:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cJAv+EbsefdW66yr8LjRtj+7g6Sr3jeK6hHxTVUkhJA=;
 b=CfujEWZnCTXFPZ9auk2CPEj0Hxw0F4l/8hAAjB2gUlQOCOxDHMLLp1OGcX1W+lUngG
 rfnOEA0I1hzQ1u0mYCUIlZMyARu4kLf2/d9VuJBzncz+Ta5isApzSg7VejYmuOTNDSPo
 1c8ZV6RYfBL9i9E6y80ILhxHRB3igsGM13ao2qJJEv/yUILzfwTPYNB8PFYv3QlviYtd
 z7sul4WjYnIWwY6Yv5Scwx3SCZci7bFpvnuY2+EtIuJYr65bDUCcGRdoquQMHd3auBLs
 2q4dq6fmFXHFINABhKuK4ZFyuexO3Akq++Avwgqn+pKuQJjQqBCVaAwJaO1QiY0ART9i
 +v5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cJAv+EbsefdW66yr8LjRtj+7g6Sr3jeK6hHxTVUkhJA=;
 b=DVGz5PSL2JPuiMdrrJBFw01oH/ngG77LYPlxc+rScLHtjDbaz5NNP6lzDHR7vIDmeR
 skB4jdPnyGGV9Wjotcv8BfZaQUZ9tIOZCsbIWE1XAVbXmyCok/oLsDcgM/WteVG1wxg3
 cySPENf8gxAG2MywBZXX+UgRVXnCQ7e4pLNlUTR4IMtrUnYPfLN4rq/ZVi4caMX2zXM/
 QGnNr+CibdDxO5L+OkNwVGo96Bhkj/UDTVbwTRr9KViQF3ukl45QGkhpgRpXPd2hNJco
 H3RRj28ii0N4J64AGmI260cWvIXSTqP0sd98S/HB5PJDSRelIjcQXKo1wXHfNTGc/DNI
 KeKQ==
X-Gm-Message-State: AOAM531CgPdgLUCr12WhYzrXsjQrMY8JwXHrkxtlaX9ETPoskNOOUbZw
 0mzmHnPQHU+Hxy6FVgOC1JcrCMZRwWQLwg==
X-Google-Smtp-Source: ABdhPJz2TSxG9laS5gW1TVM6nOt/7g+Xlz2FXHIZ/RIjKH8laIpAmAo8uN9iimexu69D7Q7VPboCGw==
X-Received: by 2002:a0c:d981:: with SMTP id y1mr11099259qvj.64.1590079456735; 
 Thu, 21 May 2020 09:44:16 -0700 (PDT)
Received: from Rfoley-MA01.hsd1.ma.comcast.net
 ([2601:199:4480:60c0:1944:c530:655c:5583])
 by smtp.gmail.com with ESMTPSA id x24sm5923829qth.57.2020.05.21.09.44.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2020 09:44:16 -0700 (PDT)
From: Robert Foley <robert.foley@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 46/74] sh4: convert to cpu_interrupt_request
Date: Thu, 21 May 2020 12:39:43 -0400
Message-Id: <20200521164011.638-47-robert.foley@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200521164011.638-1-robert.foley@linaro.org>
References: <20200521164011.638-1-robert.foley@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f43;
 envelope-from=robert.foley@linaro.org; helo=mail-qv1-xf43.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: robert.foley@linaro.org, richard.henderson@linaro.org, cota@braap.org,
 peter.puhov@linaro.org, alex.bennee@linaro.org,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Emilio G. Cota" <cota@braap.org>

Cc: Aurelien Jarno <aurelien@aurel32.net>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Robert Foley <robert.foley@linaro.org>
---
 target/sh4/cpu.c    | 2 +-
 target/sh4/helper.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 3c68021c56..18f3448183 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -44,7 +44,7 @@ static void superh_cpu_synchronize_from_tb(CPUState *cs, TranslationBlock *tb)
 
 static bool superh_cpu_has_work(CPUState *cs)
 {
-    return cs->interrupt_request & CPU_INTERRUPT_HARD;
+    return cpu_interrupt_request(cs) & CPU_INTERRUPT_HARD;
 }
 
 static void superh_cpu_reset(DeviceState *dev)
diff --git a/target/sh4/helper.c b/target/sh4/helper.c
index 408478ce5d..1e32365c75 100644
--- a/target/sh4/helper.c
+++ b/target/sh4/helper.c
@@ -62,7 +62,7 @@ void superh_cpu_do_interrupt(CPUState *cs)
 {
     SuperHCPU *cpu = SUPERH_CPU(cs);
     CPUSH4State *env = &cpu->env;
-    int do_irq = cs->interrupt_request & CPU_INTERRUPT_HARD;
+    int do_irq = cpu_interrupt_request(cs) & CPU_INTERRUPT_HARD;
     int do_exp, irq_vector = cs->exception_index;
 
     /* prioritize exceptions over interrupts */
-- 
2.17.1


