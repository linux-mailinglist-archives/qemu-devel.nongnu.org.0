Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A03370D77
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 16:52:47 +0200 (CEST)
Received: from localhost ([::1]:41000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldDSg-0001qu-Qc
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 10:52:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldDKm-0001XC-Ep
 for qemu-devel@nongnu.org; Sun, 02 May 2021 10:44:36 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:46789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldDKk-0005FD-2r
 for qemu-devel@nongnu.org; Sun, 02 May 2021 10:44:36 -0400
Received: by mail-pg1-x529.google.com with SMTP id q9so1896829pgl.13
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 07:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rZuld2Nudm5aU7AYmY0x2StLFfnXOi6CVhhsG8Zb9Hg=;
 b=l+0yPjXtwTzqlrDCC3n7f1L4VEQNwsHTWdweKi1aQej7Hgpc3tbTW3N+89r+IX42RM
 +vKrvhzF9JtO9ssm13yw72TShM6uJgC1b0hpP6IvJItyUKLVjIRecAAwvcGeFG0Fs4wM
 zOJN5bF5neJ36wMfM9tJAc8/ec656Dh8ohCVnzOM3cqi3xk2laH950AKCp1kbWQTH2eA
 8S9bi6Fk6JpdsgL3CV+jm0qmOGQBReG8cL7UCh/ImxOe1v9tX/rFxdacCqtH91xoDFYH
 uoI5yCWEbbbjYvvmYPjq+qBLp4mVqrrbEwCmzHrWLko+JJWjlXdhqusCepbFI4Kii/KE
 MKqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rZuld2Nudm5aU7AYmY0x2StLFfnXOi6CVhhsG8Zb9Hg=;
 b=GDWT+EdRNi0VVr3Hu0rRuRMb9sbu/V3rn4ZxUaZl8DXhXqYmBy8BzKHP9glnWpLrD4
 +Ahn8Y/tEAu5nL5oZUL4Q4LoRQpY+7AFk70gbiLi5YnONNGUYUHb+GAJwhHrWLmClvFS
 9qAXTHoPNQS5T1RZptHUmnoIyCUwhYsycg5m+GIPgCDjTGA2Hp0eupVab17UqIeua/S6
 rfXVb1m3duwmLeSF8YwxWIpCZdBlWG/7NykG2vQl+PF4gwpMeFXZw9K1cjbousLKiARv
 +1dh1lqPK6b0T9H30nW2H7/ytXPkCA36rBWKb0kHmgdapBTfokoNG2fNd4KnuCU1svty
 3L6A==
X-Gm-Message-State: AOAM530UVh9Slfm2o9ZaowTy0z+Was4jnhZwj8QyoAwgFwqF435bgqCr
 K7NK/mPJTJ67bapguEcnchChJGTPtJvaNw==
X-Google-Smtp-Source: ABdhPJwMQsp+1ZVbee5Nh7oRnhdfddtM3dwMghOZHNgxlFgM65GrhBCxeZBMKrlvoGQw8nW39Fa3Kg==
X-Received: by 2002:a05:6a00:1488:b029:28e:908b:5c50 with SMTP id
 v8-20020a056a001488b029028e908b5c50mr1680858pfu.79.1619966672886; 
 Sun, 02 May 2021 07:44:32 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id w14sm6889110pff.94.2021.05.02.07.44.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 07:44:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 19/31] Hexagon (target/hexagon) cleanup reg_field_info
 definition
Date: Sun,  2 May 2021 07:44:07 -0700
Message-Id: <20210502144419.1659844-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502144419.1659844-1-richard.henderson@linaro.org>
References: <20210502144419.1659844-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Cc: peter.maydell@linaro.org, Taylor Simpson <tsimpson@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Taylor Simpson <tsimpson@quicinc.com>

Include size in declaration
Remove {0, 0} entry

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <1617930474-31979-15-git-send-email-tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/reg_fields.h | 4 ++--
 target/hexagon/reg_fields.c | 3 +--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/target/hexagon/reg_fields.h b/target/hexagon/reg_fields.h
index d3c86c942f..9e2ad5d997 100644
--- a/target/hexagon/reg_fields.h
+++ b/target/hexagon/reg_fields.h
@@ -23,8 +23,6 @@ typedef struct {
     int width;
 } RegField;
 
-extern const RegField reg_field_info[];
-
 enum {
 #define DEF_REG_FIELD(TAG, START, WIDTH) \
     TAG,
@@ -33,4 +31,6 @@ enum {
 #undef DEF_REG_FIELD
 };
 
+extern const RegField reg_field_info[NUM_REG_FIELDS];
+
 #endif
diff --git a/target/hexagon/reg_fields.c b/target/hexagon/reg_fields.c
index bdcab79428..6713203725 100644
--- a/target/hexagon/reg_fields.c
+++ b/target/hexagon/reg_fields.c
@@ -18,10 +18,9 @@
 #include "qemu/osdep.h"
 #include "reg_fields.h"
 
-const RegField reg_field_info[] = {
+const RegField reg_field_info[NUM_REG_FIELDS] = {
 #define DEF_REG_FIELD(TAG, START, WIDTH)    \
       { START, WIDTH },
 #include "reg_fields_def.h.inc"
-      { 0, 0 }
 #undef DEF_REG_FIELD
 };
-- 
2.25.1


