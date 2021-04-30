Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E161A36FB9A
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 15:37:14 +0200 (CEST)
Received: from localhost ([::1]:55534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcTKT-0005ik-Nw
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 09:37:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcTBa-0005qM-CH
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 09:28:02 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:38692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcTBN-0003tu-A5
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 09:28:02 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 p6-20020a05600c3586b029014131bbe5c7so1714199wmq.3
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 06:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=hxR9cUBcBhIKjsbBPEpzkOhwLX13m2fjTkIEHgCHVJk=;
 b=WWgViwDxUXqjRLxXoeHVHiCS3uGu+AnvkeT+YqsrJYAd/E5QABqOjACau4Be66Q7xT
 y3xTZ9CREUnlGZ7PmyPd8ODNLcenmlgOUPJDwv5aXJIqo7+EbiZiU44HAkJKFV4BDFbp
 KyYBpjcRUXYktW5u9LoqCD1lj39BUEcrLJzQWq4ZyBSfj2dVNOMlrzjGGSRi+4oHG495
 orRBLr+I1DATqIB8QJkcjld/rxp6VY40gSuL+nHRznUoCkd+0CEslgJhZh97EZm7E4ni
 gyIxUJFaNtSAmBKkxIVj/tkVZYLHT9HUJL1Gch/iy2cK5wrhaUtRWsJfKrsFlocHB1vf
 E6Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hxR9cUBcBhIKjsbBPEpzkOhwLX13m2fjTkIEHgCHVJk=;
 b=j+UXycu8UQKrtyMW+EyPH51psVPztxdXTEgqTpRwoE3Qd/2VuM+lav3Td7TRyLCPmO
 fPaaWVc1R1FsK1/4GfCULFdtv/iyDXF80LqZfSz30BlEfjZI3s5xsT+n+B2vWqJw1ram
 /Jk4wX3Fr508jvDnpisI8wRG2hipLaj9u62MtbKh1HwPzLFBwsbxaGsrxAMrB9xFne74
 9XPa6orBC7CQFSCsDa+ozVRpYTzYRfm4Sbm1udWTpVZdBO3lp5OWWiVBdrpyZJBbtwRS
 17NtM96Y9iXTclxWIl4s964PkLZ+6ozf5djtuYcpq2rX07uc10uqbiYYDxmEyr3mB+io
 Uqqw==
X-Gm-Message-State: AOAM532jq28d38WzdgoFvXJ17ge2b05iOyB6/HywHTE+JoLAZ6fOtG36
 ZqzswsmZou7h01qTUpFv97nMZkR2dbOy0rSm
X-Google-Smtp-Source: ABdhPJz0Sa1I1XDsddTOl4SR2e9lzn5Wom4TyVIW95yg+ZmwOmKiGllUkRr0yB1ehod0/omS0BRf8Q==
X-Received: by 2002:a05:600c:2148:: with SMTP id
 v8mr6189168wml.35.1619789263289; 
 Fri, 30 Apr 2021 06:27:43 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm2420349wrx.15.2021.04.30.06.27.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 06:27:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/13] target/arm: Move constant expanders to translate.h
Date: Fri, 30 Apr 2021 14:27:28 +0100
Message-Id: <20210430132740.10391-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210430132740.10391-1-peter.maydell@linaro.org>
References: <20210430132740.10391-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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

Some of the constant expanders defined in translate.c are generically
useful and will be used by the separate C files for VFP and Neon once
they are created; move the expander definitions to translate.h.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h | 24 ++++++++++++++++++++++++
 target/arm/translate.c | 24 ------------------------
 2 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index ccf60c96d84..b5b21619597 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -118,6 +118,30 @@ extern TCGv_i32 cpu_NF, cpu_ZF, cpu_CF, cpu_VF;
 extern TCGv_i64 cpu_exclusive_addr;
 extern TCGv_i64 cpu_exclusive_val;
 
+/*
+ * Constant expanders for the decoders.
+ */
+
+static inline int negate(DisasContext *s, int x)
+{
+    return -x;
+}
+
+static inline int plus_2(DisasContext *s, int x)
+{
+    return x + 2;
+}
+
+static inline int times_2(DisasContext *s, int x)
+{
+    return x * 2;
+}
+
+static inline int times_4(DisasContext *s, int x)
+{
+    return x * 4;
+}
+
 static inline int arm_dc_feature(DisasContext *dc, int feature)
 {
     return (dc->features & (1ULL << feature)) != 0;
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 43ff0d4b8ac..bb9e228d1ae 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -109,30 +109,6 @@ static void arm_gen_condlabel(DisasContext *s)
     }
 }
 
-/*
- * Constant expanders for the decoders.
- */
-
-static int negate(DisasContext *s, int x)
-{
-    return -x;
-}
-
-static int plus_2(DisasContext *s, int x)
-{
-    return x + 2;
-}
-
-static int times_2(DisasContext *s, int x)
-{
-    return x * 2;
-}
-
-static int times_4(DisasContext *s, int x)
-{
-    return x * 4;
-}
-
 /* Flags for the disas_set_da_iss info argument:
  * lower bits hold the Rt register number, higher bits are flags.
  */
-- 
2.20.1


