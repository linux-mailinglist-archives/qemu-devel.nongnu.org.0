Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E766933A857
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 22:46:24 +0100 (CET)
Received: from localhost ([::1]:48758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLYZ6-0001xw-0n
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 17:46:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLYH1-000667-Ts
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 17:27:44 -0400
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36]:40914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLYGx-0008CO-95
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 17:27:42 -0400
Received: by mail-qv1-xf36.google.com with SMTP id d10so514675qve.7
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 14:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M+GW/FjdFE0LjCNjl+PKpujGwHht+vUuynWRRTNqZ50=;
 b=W9EWIAYYbiO2Q6ZUxeVr5YPtTr1LDApzVKQWZ2GzhKufQLanv30gPAhtF6PeHWozgu
 X68zP/nd66KSGUoe0/S8TGAzbi2XUgaVxh0deeARPH4dDlPfBdciinj5EIzF935ZUNP0
 r8pWZ25Ju6BVc69QEmrfvmD79Kv4LiMH39DeXhnifp8QAcQkN0uYKbRJ04viTpIZ60/a
 DIcg4VR3fS2FjXk4EbDzC/GHEG1m604hNu9t5Xgron0XfBivW0D9lpW+lpqU7wmRoaii
 SYSZfr+ke1/TOUe6dm+fKTiVddSFsAwfBeBMkWF8XhVfsmUIHrju9SW6nv0Rvgiv0gjW
 mU2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M+GW/FjdFE0LjCNjl+PKpujGwHht+vUuynWRRTNqZ50=;
 b=HEk84H0FpkA0yYV8JUeYJ2RIMpBP0Zc406h8y8eVp/zWaZWB9TTJGZqpuci3D4+jin
 G1PBPinBScep6uZ+jTArc51NmTweu/CiyA86S8m5UhAA6PqeWHGZSqXCzZn0AcjzdKU/
 dx9MrDDQ0fnite42NcBUOGVsBiNpsAyMjYqPTK26zZn+OlxwS9kFHeDZwHyTRccXpRt9
 y8SrM+Z/c2vAWgfXFva6GJWM0Ur0xDVfKVRtpDulEWHh1T0btPkYtR8TSbwA1ZbyFpeV
 V2ROX2jsbHlfm0Cj/tTOhjOcbM2dPr/Z0ac4R16wItsb8Agn2cbOKGLcK3AEbdfwSWMs
 e49w==
X-Gm-Message-State: AOAM532Sc+3e2TV+ICBK4eRAeYes2qCRM6rwWW7BQNwDBx6DwagYAoax
 GmLdtF5vJkzthDamUf8TjJQ75o7oF/gqv3V7
X-Google-Smtp-Source: ABdhPJy1s8Q4SEFBr7HTmMDqzo411lI0IoPR4kRh9KdkkbZ7h95g0C3tdNBBlx7ZZpo2ir0XF6i1Hw==
X-Received: by 2002:ad4:4e53:: with SMTP id eb19mr8088279qvb.8.1615757258393; 
 Sun, 14 Mar 2021 14:27:38 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t2sm9337749qtd.13.2021.03.14.14.27.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 14:27:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/29] accel/tcg: Rename tcg_init to tcg_init_machine
Date: Sun, 14 Mar 2021 15:27:05 -0600
Message-Id: <20210314212724.1917075-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210314212724.1917075-1-richard.henderson@linaro.org>
References: <20210314212724.1917075-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f36;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf36.google.com
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
Cc: r.bolshakov@yadro.com, j@getutm.app,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We shortly want to use tcg_init for something else.
Since the hook is called init_machine, match that.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/tcg-all.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/accel/tcg/tcg-all.c b/accel/tcg/tcg-all.c
index f132033999..30d81ff7f5 100644
--- a/accel/tcg/tcg-all.c
+++ b/accel/tcg/tcg-all.c
@@ -105,7 +105,7 @@ static void tcg_accel_instance_init(Object *obj)
 
 bool mttcg_enabled;
 
-static int tcg_init(MachineState *ms)
+static int tcg_init_machine(MachineState *ms)
 {
     TCGState *s = TCG_STATE(current_accel());
 
@@ -189,7 +189,7 @@ static void tcg_accel_class_init(ObjectClass *oc, void *data)
 {
     AccelClass *ac = ACCEL_CLASS(oc);
     ac->name = "tcg";
-    ac->init_machine = tcg_init;
+    ac->init_machine = tcg_init_machine;
     ac->allowed = &tcg_allowed;
 
     object_class_property_add_str(oc, "thread",
-- 
2.25.1


