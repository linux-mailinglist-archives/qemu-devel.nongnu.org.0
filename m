Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 416626F4388
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 14:16:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptovh-0004ou-PJ; Tue, 02 May 2023 08:16:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptoun-0003qO-B1
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:15:36 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptoug-0003FE-Dd
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:15:26 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f09b4a1527so38398575e9.0
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 05:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683029716; x=1685621716;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3rPSogG4MrvVCG0zuAlajnVlpabyYpYIusrY/Xyt5hs=;
 b=kbJrjik0wH7W8QX+zUSm1ZFCzPtbp+vCb17iqai5AGTdVhBH4s4JO8JSJP+NtA4dkz
 UrJQD08W2W4uMqk9ikttKR18UpXhK4QA5SjpBEW7Rn/F8ezpfq5CvUqhnYjuR8Jf0dIs
 VWluHkjUPYPsDPhLrPUw1v25rGI1zAvLUbrKlspwTWBBERg9KhE0kAhemhqxvpOEMtCw
 M/WiJNaD3Bc+GazbJMjE6cw7BY5s6FnKEGTQ6wpqyvLddorVArceyQaC4wJUAcwfO/eZ
 7RGNFybtWq/mhhPVaLjgrVKdkkXkrLnNno5IvZXn+BAUYBjguN6bXc95HmWWXIDnrE3e
 eXaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683029716; x=1685621716;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3rPSogG4MrvVCG0zuAlajnVlpabyYpYIusrY/Xyt5hs=;
 b=iFduSfVAKRZKVOsjR685wLh6/d9U7ZsHxeOXxQpLA8mBvHSCt/XLrZeoe0rqTLm3zi
 blRIRRVimuy5P0pFVrudru0dCWHunGAp7IQYwNZcASKxrF3miNRsdVlJKavdlxLfYLq4
 zlMWhufacFzy+REcantZsKqUFJTJt5VG2Z1T6P1MfaEDuiNG3vPVPeLEwc5FIwMx9+Ok
 ms0QlsIn+cG16tmAk5PIVfWn0lRY08Sjc5AIX9Rba2Dd7R+/z+8VM0kC8i9HTF777Sf+
 m7KVGo86LNmTvn9eIOHT8mNeEplKeFovHWE5hccROSnSptlInUP7Z2kk3tFOhUuZ4woy
 6o1Q==
X-Gm-Message-State: AC+VfDwMNKo4QHd/27jC+kC4Ipf66w4qp/Y87JBbMlT6C9BdUAK5Dkco
 Q28kBgmKZ2bCv5YxehfpsJ2hIfsuxgf5CoOqJ4c=
X-Google-Smtp-Source: ACHHUZ6mNK6p//efKl5d0ongvKpAEkxdL2UDvvkb4S0n2GAoox6pNreGVZRClaJ+RwayiTtIA04JHQ==
X-Received: by 2002:a7b:cc94:0:b0:3f1:69cc:475b with SMTP id
 p20-20020a7bcc94000000b003f169cc475bmr12859241wma.36.1683029715864; 
 Tue, 02 May 2023 05:15:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a7bc4ca000000b003f171234a08sm35040330wmk.20.2023.05.02.05.15.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 05:15:15 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 33/35] target/arm: Add compile time asserts to
 load/store_cpu_field macros
Date: Tue,  2 May 2023 13:14:57 +0100
Message-Id: <20230502121459.2422303-34-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502121459.2422303-1-peter.maydell@linaro.org>
References: <20230502121459.2422303-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Add some compile-time asserts to the load_cpu_field() and store_cpu_field()
macros that the struct field being accessed is the expected size. This
lets us catch cases where we incorrectly tried to do a 32-bit load
from a 64-bit struct field.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230424153909.1419369-3-peter.maydell@linaro.org
---
 target/arm/translate-a32.h | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate-a32.h b/target/arm/translate-a32.h
index 99eea85fa86..48a15379d22 100644
--- a/target/arm/translate-a32.h
+++ b/target/arm/translate-a32.h
@@ -59,7 +59,12 @@ static inline TCGv_i32 load_cpu_offset(int offset)
     return tmp;
 }
 
-#define load_cpu_field(name) load_cpu_offset(offsetof(CPUARMState, name))
+/* Load from a 32-bit field to a TCGv_i32 */
+#define load_cpu_field(name)                                            \
+    ({                                                                  \
+        QEMU_BUILD_BUG_ON(sizeof_field(CPUARMState, name) != 4);        \
+        load_cpu_offset(offsetof(CPUARMState, name));                   \
+    })
 
 /* Load from the low half of a 64-bit field to a TCGv_i32 */
 #define load_cpu_field_low32(name)                                      \
@@ -70,9 +75,13 @@ static inline TCGv_i32 load_cpu_offset(int offset)
 
 void store_cpu_offset(TCGv_i32 var, int offset, int size);
 
-#define store_cpu_field(var, name)                              \
-    store_cpu_offset(var, offsetof(CPUARMState, name),          \
-                     sizeof_field(CPUARMState, name))
+#define store_cpu_field(val, name)                                      \
+    ({                                                                  \
+        QEMU_BUILD_BUG_ON(sizeof_field(CPUARMState, name) != 4          \
+                          && sizeof_field(CPUARMState, name) != 1);     \
+        store_cpu_offset(val, offsetof(CPUARMState, name),              \
+                         sizeof_field(CPUARMState, name));              \
+    })
 
 #define store_cpu_field_constant(val, name) \
     store_cpu_field(tcg_constant_i32(val), name)
-- 
2.34.1


