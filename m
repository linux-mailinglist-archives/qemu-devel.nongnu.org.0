Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 564CA632E18
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 21:41:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxDZT-0008DY-44; Mon, 21 Nov 2022 15:39:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oxDZR-0008DA-Di
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 15:39:13 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oxDZO-0006sr-DJ
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 15:39:13 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 71-20020a17090a09cd00b00218adeb3549so3984779pjo.1
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 12:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VdEeeNtRsSiTz2XxItfR+APz00Vrxilj0+XvrfARfFk=;
 b=ZrjZIhb6i6ZDhPrSw5IAt4eZMpPqbWnP7aUS92RexKCGZkTWvZ+r7leaI90Z37zEen
 XvFmixWvUwrB3PYtkQUB9KehZ3foQeSol+FKgQ4k7KdEzuIdMLNV6W3rMjcnqN2Dm2mS
 Cxe+xIexbJYkalp0eovDJXGzblXzkcEhi3wJEUM5DNxIye9aBTeat4ADia9ZF0p7r8wX
 29jFygir6tIKL7e3h7N62wXlmRrH+2+CpHRgoj28hWFrNSwihSwIja5kXaxOfLGSYAJh
 aTLG3NfI3qeSS4t8KVfMMJCUnMRe3zqxRcoi29B1FJ18gz1aXf1XmNuW5BzhOecj4alg
 mNGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VdEeeNtRsSiTz2XxItfR+APz00Vrxilj0+XvrfARfFk=;
 b=oQI9huyILZTHvpI8JDNKnsGahWsLaNH/W29QTVoiDVY7To/TM36rvNKxBem1rn39u4
 CReFZkst6RKWOZjkGZ0MBqYFYAoD0Xl/lNqys0fsB26Pq4as892tRC9SvzPfu1008nSc
 iZlE/riAGnWmOblLTy7ovvd6dlRDnV0v5fEK2L5dd1PlW7nd1GDZ5nEH29l1zVbBapkT
 /2G1XV5kLa5WRqUKbieMJSaCjp8RppREWJDxI8eMB/XjZVlHW8+dqQsapWK3DBTfcIfC
 OL0XgcFx+GIrZZBSUarAvMdZgM/NYIczzUN+XPE7gvJIlZ3pPjirFttK+mxoy6hoc/SF
 r0iA==
X-Gm-Message-State: ANoB5pnFTLZs8ju59UCN2rRSqGXbhtBwA5AoX0lRf1s91dLuNweivvO+
 /y/gucZ6R/EnFd0j9UlOABHU6HA6JRj2GQ==
X-Google-Smtp-Source: AA0mqf5dLZcax/MCQh1N3ljakPVGCSw2JilYaNXwKni5bV2+UI7cemyD6afk2AQPpxgR7BTioc5yBQ==
X-Received: by 2002:a17:903:2683:b0:186:6f1e:5087 with SMTP id
 jf3-20020a170903268300b001866f1e5087mr582940plb.119.1669063148400; 
 Mon, 21 Nov 2022 12:39:08 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:dd04:f222:eac3:5b54])
 by smtp.gmail.com with ESMTPSA id
 m13-20020a170902db0d00b00188767268ddsm10269344plx.151.2022.11.21.12.39.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Nov 2022 12:39:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
Subject: [PATCH] accel/tcg/plugin: Fix op_rw
Date: Mon, 21 Nov 2022 12:39:06 -0800
Message-Id: <20221121203906.64404-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The value of op->args[2] is enum qemu_plugin_mem_rw, which
is already 1-based.  Adding 1 produces incorrect results
for QEMU_PLUGIN_MEM_W and QEMU_PLUGIN_MEM_RW.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/plugin-gen.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
index c7d6514840..cd9cee1f5d 100644
--- a/accel/tcg/plugin-gen.c
+++ b/accel/tcg/plugin-gen.c
@@ -495,10 +495,7 @@ static bool op_ok(const TCGOp *op, const struct qemu_plugin_dyn_cb *cb)
 
 static bool op_rw(const TCGOp *op, const struct qemu_plugin_dyn_cb *cb)
 {
-    int w;
-
-    w = op->args[2];
-    return !!(cb->rw & (w + 1));
+    return cb->rw & op->args[2];
 }
 
 static void inject_cb_type(const GArray *cbs, TCGOp *begin_op,
-- 
2.34.1


