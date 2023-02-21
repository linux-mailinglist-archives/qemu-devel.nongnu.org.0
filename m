Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC7D69D869
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 03:22:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUIGc-0001iy-Gz; Mon, 20 Feb 2023 21:20:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUIGM-0001f1-SH
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 21:20:15 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUIGH-00080z-Di
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 21:20:14 -0500
Received: by mail-pj1-x102c.google.com with SMTP id pt11so3808275pjb.1
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 18:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ktLcLczpC5J61u+Wz7S4IYVLAaoqvKihU89wRw7bX20=;
 b=ZUrhFly49U/YhRsfWD+/QRbNDqwjpvVhWlDjIlzCJKh9BEDeG4Rvki8KrgQ/Cw3w+I
 zJARHCSnJ1E8RTg2vFnUcbDjTHXc0pznpN3flUTryJjlyFZmBBYUTkUcJs+8OaBPB2Lp
 i5rTGWzfDnEI4NfL4+WPnBscvTVdM2CR+WdVLXllxbH6GIwE8ICJ4jQ17gn3zpw6NSTt
 TdSYSsL/R+WvlEFDpgM8l4EaiCIxREnKSiaQM0Rvn8yxw/cOvTcRRv1/6ioQ0VBB3xkQ
 Am2UJosyteBQUAixFx8BgoMtNw3yJdiswguPsEbm1vHg5ZT8jOh/jlWP6ehiWcV/kSYw
 vebA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ktLcLczpC5J61u+Wz7S4IYVLAaoqvKihU89wRw7bX20=;
 b=yx7zby3xWMYQ3A3mpyKYe8J1215XsMy+wA3OkCUUzNevS/aWEBRmlYSz72XSJcx8dH
 wjxTf053tU9TkyFa5NaMgX3HkRYBWclVBp9NPYKXnXZngQ6q9lnmxYMCIhD0I4YvtgQ0
 ZT4YLyh4nkdxtajIRjqaex8FebQFHlJBOmdN6OJ8sBJW1/cXFqI2ptBBbxNUsM5I/ABB
 h5JiHNu+3N5Fejp2/D2/kRl/0rsuaPLEFg5VEcGRvPW9uaVUr9ni1JTmwFjcE03wQqMK
 Yb73qz8Hux2kzeRjnb1F7tgtH4ejtkv4IZ9+vDcXVJApto2hVHtzAkaImExvoHnGe1az
 rFHg==
X-Gm-Message-State: AO0yUKWh4lT6ApLHWxOeYCGodyEknKSKpf0VfomXBZni6K69nae/92t4
 c2G1VOyBQ86sGPZXKaT4FUjXzQDeUaytIPO2YOg=
X-Google-Smtp-Source: AK7set/d1SqdMR7NW2d2sCEdNybBSlHxN+LtXzGUk81PhBXFTUCPTGWy1x9oR2IWKbGdukedyCuYDQ==
X-Received: by 2002:a17:902:d2cc:b0:19a:8316:6b51 with SMTP id
 n12-20020a170902d2cc00b0019a83166b51mr3585530plc.4.1676946008645; 
 Mon, 20 Feb 2023 18:20:08 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a170902e98300b0019141c79b1dsm8559328plb.254.2023.02.20.18.20.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 18:20:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 09/14] target/arm: Simplify iteration over bit widths
Date: Mon, 20 Feb 2023 16:19:46 -1000
Message-Id: <20230221021951.453601-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230221021951.453601-1-richard.henderson@linaro.org>
References: <20230221021951.453601-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Order suf[] by the log8 of the width.
Use ARRAY_SIZE instead of hard-coding 128.

This changes the order of the union definitions,
but retains the order of the union-of-union members.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/gdbstub64.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index 36166bf81e..3d9e9e97c8 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -240,8 +240,8 @@ static void output_vector_union_type(GString *s, int reg_width,
         { "int8", 8, 'b', 's' },
     };
 
-    static const char suf[] = { 'q', 'd', 's', 'h', 'b' };
-    int i, j, bits;
+    static const char suf[] = { 'b', 'h', 's', 'd', 'q' };
+    int i, j;
 
     /* First define types and totals in a whole VL */
     for (i = 0; i < ARRAY_SIZE(vec_lanes); i++) {
@@ -256,7 +256,9 @@ static void output_vector_union_type(GString *s, int reg_width,
      * signed and potentially float versions of each size from 128 to
      * 8 bits.
      */
-    for (bits = 128, i = 0; bits >= 8; bits /= 2, i++) {
+    for (i = 0; i < ARRAY_SIZE(suf); i++) {
+        int bits = 8 << i;
+
         g_string_append_printf(s, "<union id=\"%sn%c\">", name, suf[i]);
         for (j = 0; j < ARRAY_SIZE(vec_lanes); j++) {
             if (vec_lanes[j].size == bits) {
@@ -270,7 +272,7 @@ static void output_vector_union_type(GString *s, int reg_width,
 
     /* And now the final union of unions */
     g_string_append_printf(s, "<union id=\"%s\">", name);
-    for (bits = 128, i = 0; bits >= 8; bits /= 2, i++) {
+    for (i = ARRAY_SIZE(suf) - 1; i >= 0; i--) {
         g_string_append_printf(s, "<field name=\"%c\" type=\"%sn%c\"/>",
                                suf[i], name, suf[i]);
     }
-- 
2.34.1


