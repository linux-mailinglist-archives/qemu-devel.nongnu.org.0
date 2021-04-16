Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD44362C2D
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Apr 2021 02:02:37 +0200 (CEST)
Received: from localhost ([::1]:34530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXYQ0-0000fc-82
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 20:02:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXYN7-0005CD-5p
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 19:59:37 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:56007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXYN3-0005b1-Ur
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 19:59:36 -0400
Received: by mail-pj1-x1031.google.com with SMTP id s14so9995707pjl.5
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 16:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/N6ThJ9lpoodnukC32bBD9hHhS8zuwX7N8aEvzIih5o=;
 b=DIlY8w0TzDz7sSwpPz0Z10wMUhe4PIfaFC/qPi5eceXtGXYRhLvFYPkJyzTKSFRnct
 /2rQIZ6S6qev8XKbRX7kcxHPoKzWzoGZTgwHiTLVGmhuCsv/MZKkVy1JCphrFVqz/9Wv
 oJo48UN0PqhblcO6rVIZlF7FtgCM6D1/KgBH6nQWjTBybefUU0uFQc2KnqbH7SNpvAQA
 6d0bl4EgD5dSEBFwnFiKT2ClFlbHwmv8kaVJwZpGh5bJvc3E0mXH0cyYo9NNG1rjXLtE
 5TKiyuxq1qqBYD9YZGi7i4moaIPJaZ1u79VIhj+62H6aOHnmq5pzOdWrSBeHpth6tyYy
 sePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/N6ThJ9lpoodnukC32bBD9hHhS8zuwX7N8aEvzIih5o=;
 b=K3WhxCH5EIpG2J/z1FI4izI9l8usJMsaGSGA6sIxiVR0Kf2l1pWoxctdvPzdRodpmQ
 u3JacVyraL9Y/a9dIW1IA1DSVZbiEa/zyNnngjXNmakQ7+2u+a912lAtwamx1U1JloNz
 UTxLVHXMYa36qYQF/aagwxU7XmgsGHbLsqsWfm6BNlB4sMBYdHhFhWxjnxpdkZjbzmzI
 nIulIj3V7nsm48uHm2OCIuBv69IE281AqmlIo/5R+K2f78JPjeZbTVsl9RdW/9a/cak/
 NosrJp4mKJuc3KXXFzp7Cux+D8u6ecJkv2cEalzndhBBnbJDItvjullH53ft0L+Q7XfP
 e7QQ==
X-Gm-Message-State: AOAM533ONn8BKqMgCIkgjlv4MxsK+nOpF3x6r1LCMbSAlbz1MjjudZLB
 1NRzAq+XlWTzaa2OXOQWpHPO5Ubsbnejrw==
X-Google-Smtp-Source: ABdhPJwU5ii5T37hWJnTwZzvk3HK9wNTPfIEy3bdx4Ui55iAr7HYF4eY5NXq7KXaehaR8uCEJN6ITw==
X-Received: by 2002:a17:90a:4f41:: with SMTP id
 w1mr10603836pjl.231.1618617572489; 
 Fri, 16 Apr 2021 16:59:32 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d71sm560853pfd.83.2021.04.16.16.59.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 16:59:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 02/11] target/arm: Unify unallocated path in disas_fp_1src
Date: Fri, 16 Apr 2021 16:59:19 -0700
Message-Id: <20210416235928.1631788-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416235928.1631788-1-richard.henderson@linaro.org>
References: <20210416235928.1631788-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 668edf3a00..d8ec219bb2 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -6509,8 +6509,7 @@ static void disas_fp_1src(DisasContext *s, uint32_t insn)
     int rd = extract32(insn, 0, 5);
 
     if (mos) {
-        unallocated_encoding(s);
-        return;
+        goto do_unallocated;
     }
 
     switch (opcode) {
@@ -6519,8 +6518,7 @@ static void disas_fp_1src(DisasContext *s, uint32_t insn)
         /* FCVT between half, single and double precision */
         int dtype = extract32(opcode, 0, 2);
         if (type == 2 || dtype == type) {
-            unallocated_encoding(s);
-            return;
+            goto do_unallocated;
         }
         if (!fp_access_check(s)) {
             return;
@@ -6532,8 +6530,7 @@ static void disas_fp_1src(DisasContext *s, uint32_t insn)
 
     case 0x10 ... 0x13: /* FRINT{32,64}{X,Z} */
         if (type > 1 || !dc_isar_feature(aa64_frint, s)) {
-            unallocated_encoding(s);
-            return;
+            goto do_unallocated;
         }
         /* fall through */
     case 0x0 ... 0x3:
@@ -6555,8 +6552,7 @@ static void disas_fp_1src(DisasContext *s, uint32_t insn)
             break;
         case 3:
             if (!dc_isar_feature(aa64_fp16, s)) {
-                unallocated_encoding(s);
-                return;
+                goto do_unallocated;
             }
 
             if (!fp_access_check(s)) {
@@ -6565,11 +6561,12 @@ static void disas_fp_1src(DisasContext *s, uint32_t insn)
             handle_fp_1src_half(s, opcode, rd, rn);
             break;
         default:
-            unallocated_encoding(s);
+            goto do_unallocated;
         }
         break;
 
     default:
+    do_unallocated:
         unallocated_encoding(s);
         break;
     }
-- 
2.25.1


