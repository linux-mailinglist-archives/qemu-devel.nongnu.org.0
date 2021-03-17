Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E51B33F534
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 17:13:45 +0100 (CET)
Received: from localhost ([::1]:46242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMYnm-0006RZ-Nh
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 12:13:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCo-0005Le-PG
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:30 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:41849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCf-0007It-6V
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:30 -0400
Received: by mail-oi1-x233.google.com with SMTP id y131so39323948oia.8
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 08:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1x50ab6bP9r7gj+5ImrMTGOsXSHzF4sQ7wTCARpQUOc=;
 b=Ly52K9kHQRrcoPOlmwVtAEoGG+ZJAJDOgndCLXjJsqs1pgwOWT06I7OelN6nTMbnDD
 iPqGKWZchyuismqeJRqe55GRL2wpcLJV2z8PoT3j1gcyiTcQSt63O1ZL39bPMg9w/bfy
 +zzQCkrfW4Lu+zUFzKDtT1oqBsQUgFV7HxsW7xdyTvWRMrtdE6zy4cSkau2LIAwAT+7h
 8+69cS7hHwyBLkUORhR2VUh07Xbi7/hrLraENWo0yfAIwGLu9EHdw85YMfrxFHRU5UBV
 TwVLLuflPDk47Y5FQYd0LpVOa1HWXTTZl2VRZ9GDtQzK6sOm3bOMQxdgj21uUqp17nM0
 pYKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1x50ab6bP9r7gj+5ImrMTGOsXSHzF4sQ7wTCARpQUOc=;
 b=dDPG/5UEQ9MQGc9L46SJstWWjETTULQ+AuWzfO6ZA08U+kG3vxgtOb6H/5QRJRvFsi
 AXTZkBvoDaRAt0UHWygEk+IXc5pe48Go6NrVw6J5Vup5+CmhUew+rYDHaxkXpy3rN6lJ
 KdddUHPOQmbDXB7yG8EjnnhHeqAkOkaW9DtpERS7uS6dxXBmsyMiKzqE7qBVITrD+5xq
 eBuW+r7zG75LfNhbIislh2ENPRsSFjkytZGuEKSKiIkzEkBH4a5prA4VPKIVxUFEmFlK
 c+KYzmGU7MpExIvgf19pQaajGeQwhNSxvUVlaANZDkl4e9KmkNsSvoJc7ShCE8AJcoFN
 YumQ==
X-Gm-Message-State: AOAM530u0Yv8Q9/2zOYPxm6eHc4OQw2z1OljR6paDCN7Gnr3aX6TbaoJ
 t9j87Wt/dCy9IVOYAlQyDQwbZytMFouy4hji
X-Google-Smtp-Source: ABdhPJytFrZE7I4XOdYiEMw6zOb/ICzgZxpt1uBMHIl0UGEkbCYPK6S9VkGH90pxOfHaBtYX8FPnVQ==
X-Received: by 2002:aca:aa84:: with SMTP id t126mr3272667oie.50.1615995319354; 
 Wed, 17 Mar 2021 08:35:19 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id i11sm8271154otp.76.2021.03.17.08.35.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 08:35:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 33/38] tcg/tci: Split out tcg_out_op_rrrr
Date: Wed, 17 Mar 2021 09:34:39 -0600
Message-Id: <20210317153444.310566-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210317153444.310566-1-richard.henderson@linaro.org>
References: <20210317153444.310566-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x233.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 20dd186b84..1e98c73417 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -399,6 +399,20 @@ static void tcg_out_op_rrrbb(TCGContext *s, TCGOpcode op, TCGReg r0,
 }
 
 #if TCG_TARGET_REG_BITS == 32
+static void tcg_out_op_rrrr(TCGContext *s, TCGOpcode op,
+                            TCGReg r0, TCGReg r1, TCGReg r2, TCGReg r3)
+{
+    uint8_t *old_code_ptr = s->code_ptr;
+
+    tcg_out_op_t(s, op);
+    tcg_out_r(s, r0);
+    tcg_out_r(s, r1);
+    tcg_out_r(s, r2);
+    tcg_out_r(s, r3);
+
+    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+}
+
 static void tcg_out_op_rrrrrc(TCGContext *s, TCGOpcode op,
                               TCGReg r0, TCGReg r1, TCGReg r2,
                               TCGReg r3, TCGReg r4, TCGCond c5)
@@ -632,12 +646,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         old_code_ptr[1] = s->code_ptr - old_code_ptr;
         break;
     case INDEX_op_mulu2_i32:
-        tcg_out_op_t(s, opc);
-        tcg_out_r(s, args[0]);
-        tcg_out_r(s, args[1]);
-        tcg_out_r(s, args[2]);
-        tcg_out_r(s, args[3]);
-        old_code_ptr[1] = s->code_ptr - old_code_ptr;
+        tcg_out_op_rrrr(s, opc, args[0], args[1], args[2], args[3]);
         break;
 #endif
 
-- 
2.25.1


