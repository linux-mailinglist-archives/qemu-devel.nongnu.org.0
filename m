Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F4033768C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 16:10:26 +0100 (CET)
Received: from localhost ([::1]:56884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKMxF-0004ey-Kx
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 10:10:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMUu-0003rq-TY
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:41:09 -0500
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b]:35463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMUj-0006ep-Ox
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:41:08 -0500
Received: by mail-qv1-xf2b.google.com with SMTP id x27so2635973qvd.2
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 06:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FuCnYTOQyWEVo9ZyllKi/tHo7oVf70VfVQ0xN8tYC5M=;
 b=Ki83gwgs2XuMZCafFLBrZTs6fENHNCr2pIvzI+x0OzPNmcOEGPdOhNQJ+z/8q8AUMJ
 Q1RY2U6h2fZZIELA+rINzHogO0aTRCpxNBj0B5kED7ibeDn4trEfTLljcfONWZku9NNN
 44CcQ27nIhPeLWOZAzR1Nvi93Vg69se5u5UPgufi6vW8guWs74uSFMXrF1didjB829Zq
 Lt94l+1mYloeDFRAvX3EkNZ+8eWV1OZ2kzZtfFqjmVKIvayQ2c3usUTQ772tvc8uhp7d
 Bucm4Za29WtcgjEBixCtq/JKKIaf9NI3Fasa4+YWBwGhnLeSZ/JHQgpS8/ldKEhAPqbg
 1+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FuCnYTOQyWEVo9ZyllKi/tHo7oVf70VfVQ0xN8tYC5M=;
 b=oS4+zQBX3SxR5jLEB49zHzcueDyCE3RtIT2x/Us/Ew0EX+Sibcv95/fdeWjCFNtee0
 YtU7jDu+UEjacGOZR7td+H15aHfsxf59d15TVjcV4fCm5xYPNSAgtpsWu405gVaGM0RU
 rsQlvrVLVakVHlzsqA7x+aTRjqTZcHFtuC4u/PG9k+AYuwJTEewKI7bOm7eIONGz0X9u
 Hb1BsqPksK7IqsuLj+tZLWamjs7pROJd0Y0WPr0qA2iKy+uNXwEvZzpyUJZP3Avf5c+k
 FCx31ImsAQdLpdrHgmWAlgGBIYsInn6Sp6lyhahsRS0ght10qCd4qPoYApMaA1yPj1t0
 CYhQ==
X-Gm-Message-State: AOAM533LTlhgTJBv+AlurCbJn/EqizP42lE/acVYYGbd40i7jhL+mGzn
 +6kEbXrsV9wHrNUa7dLxzp2z7GIext/G3o1q
X-Google-Smtp-Source: ABdhPJz2KtwfB13hnAeTu1DyxuivR2bqzV75MukWM8Hx8IhipJS79o+fmyCs8IuK4QhUEskjTHZcdA==
X-Received: by 2002:a05:6214:1c47:: with SMTP id
 if7mr7928877qvb.50.1615473652371; 
 Thu, 11 Mar 2021 06:40:52 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id d84sm2070324qke.53.2021.03.11.06.40.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 06:40:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 38/57] tcg/tci: Split out tcg_out_op_rrrrcl
Date: Thu, 11 Mar 2021 08:39:39 -0600
Message-Id: <20210311143958.562625-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311143958.562625-1-richard.henderson@linaro.org>
References: <20210311143958.562625-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2b.google.com
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index c2bbd85130..fb4aacaca3 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -399,6 +399,23 @@ static void tcg_out_op_rrrr(TCGContext *s, TCGOpcode op,
     old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
 
+static void tcg_out_op_rrrrcl(TCGContext *s, TCGOpcode op,
+                              TCGReg r0, TCGReg r1, TCGReg r2, TCGReg r3,
+                              TCGCond c4, TCGLabel *l5)
+{
+    uint8_t *old_code_ptr = s->code_ptr;
+
+    tcg_out_op_t(s, op);
+    tcg_out_r(s, r0);
+    tcg_out_r(s, r1);
+    tcg_out_r(s, r2);
+    tcg_out_r(s, r3);
+    tcg_out8(s, c4);
+    tci_out_label(s, l5);
+
+    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+}
+
 static void tcg_out_op_rrrrrc(TCGContext *s, TCGOpcode op,
                               TCGReg r0, TCGReg r1, TCGReg r2,
                               TCGReg r3, TCGReg r4, TCGCond c5)
@@ -636,14 +653,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
                           args[3], args[4], args[5]);
         break;
     case INDEX_op_brcond2_i32:
-        tcg_out_op_t(s, opc);
-        tcg_out_r(s, args[0]);
-        tcg_out_r(s, args[1]);
-        tcg_out_r(s, args[2]);
-        tcg_out_r(s, args[3]);
-        tcg_out8(s, args[4]);           /* condition */
-        tci_out_label(s, arg_label(args[5]));
-        old_code_ptr[1] = s->code_ptr - old_code_ptr;
+        tcg_out_op_rrrrcl(s, opc, args[0], args[1], args[2],
+                          args[3], args[4], arg_label(args[5]));
         break;
     case INDEX_op_mulu2_i32:
         tcg_out_op_rrrr(s, opc, args[0], args[1], args[2], args[3]);
-- 
2.25.1


