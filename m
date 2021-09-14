Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F1040A20D
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 02:31:49 +0200 (CEST)
Received: from localhost ([::1]:56088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPwMV-0001ip-Ti
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 20:31:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6O-0001gn-3l
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:08 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:44008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6L-0007dB-DC
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:07 -0400
Received: by mail-pf1-x435.google.com with SMTP id f65so10432846pfb.10
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 17:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zk1Xc7v798/v3MVPLkwWlC7sy9W9XT/J+dwHkhEwhvw=;
 b=p1gNYx53f8A3BqBIt6GzpNwsDU5PLP3slJCw7JISfOo7EYtGrIhkes5MoAgmFgTKV+
 j4j9M4K7RDKf9zgWt6fY/+slu33ytxUwYMQbk8fPQ8ErEiZFymTnk5MN3XqYPuLyAhdL
 BsBgNIWYQD/DcYNtw1LmoQb5wLYQ2L+F4QaIT6s/LZ426D0P9ouLbUrQHcCVgMHIffHX
 x4jIfu8LPQpa4f3GDHEyfg0hFhYyUEoYvcyU8WCmf1Ox55O+/XmcBaHnUAGizNC+aYI/
 y6Af3wlJfmcKfA06551yrRTdk5vG5ESdVn1ozRylctAhWusd/fRPoAjpSAYmcSJHHWmR
 2avg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zk1Xc7v798/v3MVPLkwWlC7sy9W9XT/J+dwHkhEwhvw=;
 b=6OuxlTEe1qhi29x1FDeZ5HnSIb6fkwQkaXAsX4uLgBFcZope2Zm8KIrdO+BTm5N1TX
 mDM2D7AcbCZGSAKmsNkIikzwmF9y980dudQxQJ10jFC39FCB2NOEakViNtYrcO8L1FRI
 4jmvpt76eGbu8iij47JL8hp0IARLO6qxBhboWnIsVVXHGsBq9fJRwRWsd58wAu7bX450
 4W2D0UEW+H8wJPRkY0h5b4YckikRRSHcljC9Jwl6Tp82yGmy9kY+5X76SeQ6GYAzSWXT
 Lt2BeJYk5Tgucgtc+KgXM38BB/crU0zJbmYmjvMpiMK4T+MApTLJ+5s1IWSKn3Fz0U6j
 h0Ag==
X-Gm-Message-State: AOAM530d7YRSSYYQL3OBNQ9TJMPdW7MFCiknhtZDIfi0/5pB0vGMby5j
 xac163dBYT0szORZR38h9W/eVhuE4Alu0w==
X-Google-Smtp-Source: ABdhPJzn5iNOxucxVITyHZNRANzymMQ9/HaHevQh1YC0Hc0NJv5YEux+gJ0V9X0YDnjw88bMfNoBoA==
X-Received: by 2002:a63:705:: with SMTP id 5mr13258890pgh.265.1631578504091;
 Mon, 13 Sep 2021 17:15:04 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m7sm9334179pgn.32.2021.09.13.17.15.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 17:15:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/44] tcg/arm: Fix tcg_out_vec_op function signature
Date: Mon, 13 Sep 2021 17:14:20 -0700
Message-Id: <20210914001456.793490-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914001456.793490-1-richard.henderson@linaro.org>
References: <20210914001456.793490-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Jose R. Ziviani" <jziviani@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Jose R. Ziviani" <jziviani@suse.de>

Commit 5e8892db93 fixed several function signatures but tcg_out_vec_op
for arm is missing. It causes a build error on armv6 and armv7:

tcg-target.c.inc:2718:42: error: argument 5 of type 'const TCGArg *'
{aka 'const unsigned int *'} declared as a pointer [-Werror=array-parameter=]
   const TCGArg *args, const int *const_args)
  ~~~~~~~~~~~~~~^~~~
../tcg/tcg.c:120:41: note: previously declared as an array 'const TCGArg[16]'
{aka 'const unsigned int[16]'}
   const TCGArg args[TCG_MAX_OP_ARGS],
  ~~~~~~~~~~~~~~^~~~

Signed-off-by: Jose R. Ziviani <jziviani@suse.de>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210908185338.7927-1-jziviani@suse.de>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.c.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 007ceee68e..e5b4f86841 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -2715,7 +2715,8 @@ static const ARMInsn vec_cmp0_insn[16] = {
 
 static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
                            unsigned vecl, unsigned vece,
-                           const TCGArg *args, const int *const_args)
+                           const TCGArg args[TCG_MAX_OP_ARGS],
+                           const int const_args[TCG_MAX_OP_ARGS])
 {
     TCGType type = vecl + TCG_TYPE_V64;
     unsigned q = vecl;
-- 
2.25.1


