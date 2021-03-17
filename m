Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 497C933F545
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 17:17:09 +0100 (CET)
Received: from localhost ([::1]:55768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMYr6-0002Z2-B7
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 12:17:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCp-0005MX-9F
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:31 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336]:38754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCf-0007IE-6P
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:30 -0400
Received: by mail-ot1-x336.google.com with SMTP id
 w21-20020a9d63950000b02901ce7b8c45b4so2172091otk.5
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 08:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iJwT/HchTMrOmF06Inc3VxMEiywuZ3FSHjKSPtMbAL4=;
 b=QSlM7N/lfrxTHtpjnXqXzuQlMUoYrFJPcHFGkC5+S201KfjBH6woC84g1pQfw0xre1
 vMA2ZL9a83EcVip0iSQqKzRrHxKvjWYsr0xVQzE5SI/szrGb/JNdjS8CmRWGQxW13iA1
 jADdyxj5pX6CtEh24pGVmQQ4m/TMB1e8lefdYTK5O0rsKDwyfDUAtHKFgohZ8x7Ut1b2
 M2yAxEn4bDyCi6S0yqOZ59nPV/hnI1VWRYaaAjLnKlnC5GjUe5pIgY5gpmvc/DSorTgz
 u9kWWwEq1RctihsnpA4sOYJqQpRylYEWOQMg46kv/S6CcHyIA1UTPxrH4TZw6kKvpDAP
 4FHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iJwT/HchTMrOmF06Inc3VxMEiywuZ3FSHjKSPtMbAL4=;
 b=bxHAla5GVgElLG0gRb1UudS84kwqcnLQ8rZyhOb0yEGrKx9zY2lMAdvACvjrtQILlh
 NqyT0CcjkIzwhenMPtXMQhzHfkueyHfO2MXxBjrB9P07hNhq6izTKgkvbmHeyxL9kogJ
 0Y99yZ5JjNZp6cImpUyK9BElkFUuaLcxzp/ApJFpCwO7hSFGZagPX8EYiiSHjJ5IvqLw
 jii2rHi2Q8vGk1OHvdbRLO2dwRRX0sJ4cPObmeSi4smT3xDPu4bg3Zki22Pws0FLIyfw
 7/uLUGE2Uto3pIJTt5JW8wFJF01vFF/VK85wj8nyXwUJZaabDvmTH8Jh+E4ZKWN9UoTx
 /BsQ==
X-Gm-Message-State: AOAM531MK6XLsvuUa3HeVlsiB6G8sAFvRq4VY5dTbDk/GJcdyHIsw2wr
 L1elAa+ECin4Gzixu4K44ruSVxaw7D864cbn
X-Google-Smtp-Source: ABdhPJxGb8Rppr89o1aNGrf/ro/grx+p+aBz8zEAlRj9IuEAXXxVel3JC9MUrAwSX74PdBdhoEkHoQ==
X-Received: by 2002:a9d:6249:: with SMTP id i9mr3877671otk.166.1615995318415; 
 Wed, 17 Mar 2021 08:35:18 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id i11sm8271154otp.76.2021.03.17.08.35.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 08:35:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 32/38] tcg/tci: Split out tcg_out_op_rrrrrr
Date: Wed, 17 Mar 2021 09:34:38 -0600
Message-Id: <20210317153444.310566-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210317153444.310566-1-richard.henderson@linaro.org>
References: <20210317153444.310566-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x336.google.com
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
 tcg/tci/tcg-target.c.inc | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index d0036c9519..20dd186b84 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -415,6 +415,23 @@ static void tcg_out_op_rrrrrc(TCGContext *s, TCGOpcode op,
 
     old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
+
+static void tcg_out_op_rrrrrr(TCGContext *s, TCGOpcode op,
+                              TCGReg r0, TCGReg r1, TCGReg r2,
+                              TCGReg r3, TCGReg r4, TCGReg r5)
+{
+    uint8_t *old_code_ptr = s->code_ptr;
+
+    tcg_out_op_t(s, op);
+    tcg_out_r(s, r0);
+    tcg_out_r(s, r1);
+    tcg_out_r(s, r2);
+    tcg_out_r(s, r3);
+    tcg_out_r(s, r4);
+    tcg_out_r(s, r5);
+
+    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+}
 #endif
 
 static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg val, TCGReg base,
@@ -601,14 +618,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
 #if TCG_TARGET_REG_BITS == 32
     case INDEX_op_add2_i32:
     case INDEX_op_sub2_i32:
-        tcg_out_op_t(s, opc);
-        tcg_out_r(s, args[0]);
-        tcg_out_r(s, args[1]);
-        tcg_out_r(s, args[2]);
-        tcg_out_r(s, args[3]);
-        tcg_out_r(s, args[4]);
-        tcg_out_r(s, args[5]);
-        old_code_ptr[1] = s->code_ptr - old_code_ptr;
+        tcg_out_op_rrrrrr(s, opc, args[0], args[1], args[2],
+                          args[3], args[4], args[5]);
         break;
     case INDEX_op_brcond2_i32:
         tcg_out_op_t(s, opc);
-- 
2.25.1


