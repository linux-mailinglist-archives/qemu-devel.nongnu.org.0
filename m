Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BA836FBEE
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 16:14:38 +0200 (CEST)
Received: from localhost ([::1]:41408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcTuf-0005YZ-5N
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 10:14:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcTBZ-0005nb-99
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 09:28:01 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:42561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcTBN-0003uw-9N
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 09:28:01 -0400
Received: by mail-wr1-x429.google.com with SMTP id l2so18284266wrm.9
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 06:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=JQ7yCHvVyn3dC2kUvL2RqYfRlHX1xoflpJBAYkM3TLA=;
 b=y54ZNsnY9O53W5w0JG+aV9kqFLYEaq9FODOuL6vj6qDWKjy8pe5rw3XlLudGfMAOaN
 2NtmbuNY279kaWDGMBckC+DNg0lcrt00HewNg60EpKy5zwW0LuN6WtUg9+SWly6MJgsd
 QMYSJfOcCCR0kZrdI1DahGq+TLFUDaGelo6w4J+lJ2bdiEvczxzWkoECi97wc/DzsCYQ
 Za7UdyfPSekXqVNQaPNH+TUsdY8y/6/I9DcIQ0riLA4ZSlexCmeAmM9RIIfHi+pMGTmi
 ih7ZGrsJ65oOHXbAJXRQcProyxYN+Ivq/+XwkbjWKkipuuqrWOLVT8DprfFvfnrkAbNm
 QC6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JQ7yCHvVyn3dC2kUvL2RqYfRlHX1xoflpJBAYkM3TLA=;
 b=MsfMirdGLNdaLKROgIC5ln+ht6FLq+bzJTsCK7+h7udAGj7zzR8Nte/5A0YTft/yvQ
 nd5mGS1ZjuzWDHwOTUJgoatRS15syt4lph292M9UZk5dJetWAGdEYbgEeFkFT3c3mkQX
 eypKaKBL6jzo3T87hlPQNOvemI89a8oh0QmvEdNUZSlGoEiaE8/hcbAeZzmCe021wjxr
 ztnct/j2yBNvlAIsZ0pCMkh2+RMUTn7BA8exh3S9oMkdscOri86ZDkYn0NqeYHq3vvqg
 S1XWAGalMKhbPLnwZQteoBBLs2euSsIEX6xgN1fdOrvOzTYX0e9Iz4y1Un/xkerVnl3G
 jrRA==
X-Gm-Message-State: AOAM533Tz8BUG1QOOEBmWBzzSJ6+G7JCuVP9mwx7Y/CsCCRH2zwRrfDY
 9a6dt8PWpx7M77pfBThBTpHHAex7mwGvC3SR
X-Google-Smtp-Source: ABdhPJzBWB42+H3lp1v51C3ZWwZmdhDk/Kv+OfOZ+UBgwGJMr3fFBJq4tBT1j2BeUdnnqLcSdrCMHQ==
X-Received: by 2002:adf:cd8c:: with SMTP id q12mr6933704wrj.328.1619789267929; 
 Fri, 30 Apr 2021 06:27:47 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm2420349wrx.15.2021.04.30.06.27.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 06:27:47 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/13] target/arm: Move vfp_{load, store}_reg{32,
 64} to translate-vfp.c.inc
Date: Fri, 30 Apr 2021 14:27:33 +0100
Message-Id: <20210430132740.10391-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210430132740.10391-1-peter.maydell@linaro.org>
References: <20210430132740.10391-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

The functions vfp_load_reg32(), vfp_load_reg64(), vfp_store_reg32()
and vfp_store_reg64() are used only in translate-vfp.c.inc. Move
them to that file.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c         | 20 --------------------
 target/arm/translate-vfp.c.inc | 20 ++++++++++++++++++++
 2 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 5113cd2fea6..c8b9cedfcfd 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1144,26 +1144,6 @@ static long vfp_reg_offset(bool dp, unsigned reg)
     }
 }
 
-static inline void vfp_load_reg64(TCGv_i64 var, int reg)
-{
-    tcg_gen_ld_i64(var, cpu_env, vfp_reg_offset(true, reg));
-}
-
-static inline void vfp_store_reg64(TCGv_i64 var, int reg)
-{
-    tcg_gen_st_i64(var, cpu_env, vfp_reg_offset(true, reg));
-}
-
-static inline void vfp_load_reg32(TCGv_i32 var, int reg)
-{
-    tcg_gen_ld_i32(var, cpu_env, vfp_reg_offset(false, reg));
-}
-
-static inline void vfp_store_reg32(TCGv_i32 var, int reg)
-{
-    tcg_gen_st_i32(var, cpu_env, vfp_reg_offset(false, reg));
-}
-
 void read_neon_element32(TCGv_i32 dest, int reg, int ele, MemOp memop)
 {
     long off = neon_element_offset(reg, ele, memop);
diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index 500492f02fb..1004d1fd095 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -30,6 +30,26 @@
 #include "decode-vfp.c.inc"
 #include "decode-vfp-uncond.c.inc"
 
+static inline void vfp_load_reg64(TCGv_i64 var, int reg)
+{
+    tcg_gen_ld_i64(var, cpu_env, vfp_reg_offset(true, reg));
+}
+
+static inline void vfp_store_reg64(TCGv_i64 var, int reg)
+{
+    tcg_gen_st_i64(var, cpu_env, vfp_reg_offset(true, reg));
+}
+
+static inline void vfp_load_reg32(TCGv_i32 var, int reg)
+{
+    tcg_gen_ld_i32(var, cpu_env, vfp_reg_offset(false, reg));
+}
+
+static inline void vfp_store_reg32(TCGv_i32 var, int reg)
+{
+    tcg_gen_st_i32(var, cpu_env, vfp_reg_offset(false, reg));
+}
+
 /*
  * The imm8 encodes the sign bit, enough bits to represent an exponent in
  * the range 01....1xx to 10....0xx, and the most significant 4 bits of
-- 
2.20.1


