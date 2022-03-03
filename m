Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A9F4CC79D
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 22:08:13 +0100 (CET)
Received: from localhost ([::1]:45688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPsgG-0002wT-Q6
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 16:08:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsYC-00058M-4O
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 15:59:52 -0500
Received: from [2607:f8b0:4864:20::1030] (port=44715
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsYA-000420-91
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 15:59:51 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 gj15-20020a17090b108f00b001bef86c67c1so6034104pjb.3
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 12:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H//za3f5S9J3H+KCj3xVMYCo08x35IHoinSOucS409A=;
 b=UYf/DTNfdFvd8+X0RzS8aUkB12v1a3/0Sig1ej3Ov6JqO6uLEyRhClN6XpKncMCO9F
 i2yd4+JchjXHvhuGV+pw3InMFV85IhFvqh1PeltxK8GuSXCNfs6x8hAkhU6do1MZ/mUu
 QlfWIufZHX7xJ4MAUT52Jup0FR7ZFsLVkmO/eew0//sIHYeqIGN2QrmWaGnm8lznT/+q
 9nR4CDOzCV4Iboi4WGpFjnA+wFnZpQQrwVgAz+yP9qIuiB3JrTVLHbaudQOQkkvx3/D9
 yiLPmi1gWIvYwz1C2O1TLUGJ9NuK7RJcdbZYiHnKRlvjuxbbNW/VMuXiLQ0ihzXx1r79
 nSEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H//za3f5S9J3H+KCj3xVMYCo08x35IHoinSOucS409A=;
 b=Y/UM+J2cy5icKUQ3zukt3M0dQNLedOSYiYFu71A9A2vKZFQTSChC0FtS17pLNKIIlj
 6OsUcNksO0AWiiJePfBggfoYZ4eNEjgSt0LE1bqDAf5ldCZyh2JTbReowxhnLYTzZsgU
 0yvAq2jvrSp03wDEN2f7TZ5glRd0AZHzwoVOVP/1VHsXzmLGLfH2eRfybke3LxvV4cdN
 avhI1b9M3jWBSzazlb7JjflGCmV3r13AmxSPJzEmzLVTKV03/5D6/q4veOdvos+0NVkw
 ay2Awr7jj88KYCMEwLODX1Hs0xky41QqKPAserY0fMmPoYllN9tjiJuL3BP6xb4B5mqi
 ek1g==
X-Gm-Message-State: AOAM5319TVCIOxvUkbW6FFYL/EIhhkIgGPAHKILrWyxREW3NYznvFsrE
 IQGMpcm9gK9hYIZg7AVkpSrsDNqkA0ZZMQ==
X-Google-Smtp-Source: ABdhPJzXVFr3Ag0VSCkvzLOaw+ave39Q+INn1w42oHRoDhUwuFyew1O7//bxK3ZkfmWnvuw1LACk9A==
X-Received: by 2002:a17:90b:17cb:b0:1bf:138d:e0f8 with SMTP id
 me11-20020a17090b17cb00b001bf138de0f8mr3590506pjb.157.1646341188936; 
 Thu, 03 Mar 2022 12:59:48 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-119c-490c-a4ee-08e8.res6.spectrum.com.
 [2603:800c:1201:c600:119c:490c:a4ee:8e8])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a6549c8000000b00372eb3a7fb3sm2729934pgs.92.2022.03.03.12.59.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 12:59:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/30] tcg/optimize: only read val after const check
Date: Thu,  3 Mar 2022 10:59:15 -1000
Message-Id: <20220303205944.469445-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303205944.469445-1-richard.henderson@linaro.org>
References: <20220303205944.469445-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alex Bennée <alex.bennee@linaro.org>

valgrind pointed out that arg_info()->val can be undefined which will
be the case if the arguments are not constant. The ordering of the
checks will have ensured we never relied on an undefined value but for
the sake of completeness re-order the code to be clear.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220209112142.3367525-1-alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index e573000951..06213fd434 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -552,10 +552,10 @@ static bool do_constant_folding_cond_eq(TCGCond c)
 static int do_constant_folding_cond(TCGType type, TCGArg x,
                                     TCGArg y, TCGCond c)
 {
-    uint64_t xv = arg_info(x)->val;
-    uint64_t yv = arg_info(y)->val;
-
     if (arg_is_const(x) && arg_is_const(y)) {
+        uint64_t xv = arg_info(x)->val;
+        uint64_t yv = arg_info(y)->val;
+
         switch (type) {
         case TCG_TYPE_I32:
             return do_constant_folding_cond_32(xv, yv, c);
@@ -567,7 +567,7 @@ static int do_constant_folding_cond(TCGType type, TCGArg x,
         }
     } else if (args_are_copies(x, y)) {
         return do_constant_folding_cond_eq(c);
-    } else if (arg_is_const(y) && yv == 0) {
+    } else if (arg_is_const(y) && arg_info(y)->val == 0) {
         switch (c) {
         case TCG_COND_LTU:
             return 0;
-- 
2.25.1


