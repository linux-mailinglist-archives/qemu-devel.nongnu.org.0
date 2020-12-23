Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC59C2E18BB
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 07:05:21 +0100 (CET)
Received: from localhost ([::1]:54126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krxGy-0001h0-Nh
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 01:05:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1krxDy-0008Ot-8D
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 01:02:16 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:39799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1krxDs-0000KF-Mr
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 01:02:11 -0500
Received: by mail-pj1-x1032.google.com with SMTP id hk16so2613492pjb.4
 for <qemu-devel@nongnu.org>; Tue, 22 Dec 2020 22:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=rAW07Dku/fTSAeGLs/tMwXeih7Omsc2EM7pIkYPifgA=;
 b=q6xztLYwFw1kzEMs+tCaA80dtPD5X3ysM8Xh1aKZb3jN+8JsyEkbKzA0Xw3ZwztEJ5
 0ivL6zXErkq4YT12V1Gls9ImIsq10Ie7/0JYIAS8o/EjXclJ1InarV7dYxi4h8qoWXjr
 FiL9v37IZ0B6RzTjH1q8dAimn9o5PbhLHg3UmodUPr0N46rOaFMYwa5TaoUvZp5Xu8Vx
 C8z6gifNFZu1S7dW/7KtOMYwKht3e41rnkkfC+CPwQ5AijtqzIUhPpWViG0LXGYqTBla
 ltIMZPGnDgzgihWanAuPiGbIPMk9/w8wu2GgkowUXuZGcCo6jvBI7rknlUD94UAxmrdw
 5BYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rAW07Dku/fTSAeGLs/tMwXeih7Omsc2EM7pIkYPifgA=;
 b=VoCCM3MIAXJvhUmIRo2YYG3URNrenpG0OukeCaMuEZmTZ27YOo0w8zFZ2DgXheCL82
 NaQr7IJQyTWbD1zH2NvFt218b5S0pWDrZOdzqwoEmNRPefIUqKCU/Xocz5qDsQ6iFDlx
 UZXJQPsVXLJHUNFqSfZLlrsiCkn7BcE9xCwA8Ec4h62aLdUCzfqwPlOENG2CvyRpHrDj
 E7FT7sRybWV16x/pWBwTljVHU+lw0AiliDrzWO/Q9oduxUVy6O75nDcVetRCk2GSZ0NI
 K9myj4RySG9+pGCKI0lJl0eUQfaprMusJ40zxtU2CLhyG20IEW0QLJi4etTi4Khe1M5j
 hKbg==
X-Gm-Message-State: AOAM532Aui3gToICIXLT0oxCY6EtAvxsuzoF9nhLkdC9aazWrrqZAFDD
 U8BT7yn5ws6kEQEmvqE+gYapkkx1V2lZxg==
X-Google-Smtp-Source: ABdhPJwTRG18Ejh6Ybf3yH1Whp+ot+O+8PwT7Os85K8sWaPIsh+UcJJ6q8Ga62y2J9q3dNGV1WU5Xg==
X-Received: by 2002:a17:90a:f00f:: with SMTP id
 bt15mr25500109pjb.209.1608703327270; 
 Tue, 22 Dec 2020 22:02:07 -0800 (PST)
Received: from localhost.localdomain (174-21-139-177.tukw.qwest.net.
 [174.21.139.177])
 by smtp.gmail.com with ESMTPSA id s1sm21943620pfb.103.2020.12.22.22.02.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Dec 2020 22:02:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/22] tcg/tci: Drop L and S constraints
Date: Tue, 22 Dec 2020 22:01:43 -0800
Message-Id: <20201223060204.576856-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201223060204.576856-1-richard.henderson@linaro.org>
References: <20201223060204.576856-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These are identical to the 'r' constraint.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 231b9b1775..50a08bef03 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -46,11 +46,11 @@
 # define R64    "r"
 #endif
 #if TARGET_LONG_BITS > TCG_TARGET_REG_BITS
-# define L      "L", "L"
-# define S      "S", "S"
+# define L      "r", "r"
+# define S      "r", "r"
 #else
-# define L      "L"
-# define S      "S"
+# define L      "r"
+# define S      "r"
 #endif
 
 /* TODO: documentation. */
@@ -390,8 +390,6 @@ static const char *target_parse_constraint(TCGArgConstraint *ct,
 {
     switch (*ct_str++) {
     case 'r':
-    case 'L':                   /* qemu_ld constraint */
-    case 'S':                   /* qemu_st constraint */
         ct->regs = BIT(TCG_TARGET_NB_REGS) - 1;
         break;
     default:
-- 
2.25.1


