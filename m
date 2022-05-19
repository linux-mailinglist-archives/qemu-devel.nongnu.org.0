Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E18D52DBA5
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 19:47:34 +0200 (CEST)
Received: from localhost ([::1]:50280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrkFJ-0008CA-55
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 13:47:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrk55-000628-JN
 for qemu-devel@nongnu.org; Thu, 19 May 2022 13:36:59 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:45798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrk52-0000pu-KM
 for qemu-devel@nongnu.org; Thu, 19 May 2022 13:36:58 -0400
Received: by mail-wr1-x436.google.com with SMTP id w4so8171222wrg.12
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 10:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=im07PMAPEhfDlj+n2/I268ITiDkRmFr35n3lbLJx7Mg=;
 b=AVgnuCiu8YMErjsA234hHaJ0cx8vMWxkpw+HfSAUGy5HyGCsAW6t9s6UejHCt6FIpX
 XQa71iIs0R++ZC2c6oA/Kt2Is0jZ1b1Hdun0B8loUrZIsVtPBUTl0iw4V2afSukElPr6
 eJdOz3ffs8SYQaFXsNg+SA1fEp0rAZvZS0W1WTXcdVYTzc9o1ovE0oMWqmtI3DuPsqTE
 XVYxLEVx2JUPK+ApAPkcwQ8XXkpEhhIXhYa5T7+duADUZxJSh2Yl4HYlmPh6NsNaflyq
 CnyNUeKi9EDK71uXJZ1lFt+2zv1E+5gGC28x0hiW8mFwiAtUZBIHoNdkmy7CbKXGi39+
 e42g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=im07PMAPEhfDlj+n2/I268ITiDkRmFr35n3lbLJx7Mg=;
 b=vQ2v50rIjP64PxFxyN5G8ZtaRfYPFPn1XVbeiPK95nq68HMx8tK4GfVu74LZL15qZM
 DVGBMJwMskJqiLZoRv1emz0LX9YRGrFiViJen9q9d9787dtMVn5WF3iOP7LMeQVppb4t
 T9w356lleRwIHOagqoEyXutqyh5YbCj7ICaKSQ9I3EsUUYfwJ40RGvif/VHOvlqdXcXr
 858y300sOQKROrzDc39cHsE6O/v2B0fVEjTXM73oQYsYJJVYfOmHA8d/UymKDAY2ZL5I
 NYLAnO3domJBtB7wnLPZ5jz+L7VgMHbsLCO8j9ycy4eQlXQMIpQUZQFiMCnr8PhJ1w9H
 XFEw==
X-Gm-Message-State: AOAM531I8pZVqUDnF6LTZ+56oNypsXhuqEi1OdHEDnYp7B9eFoOLMSGk
 8Wz52osi30ImI/p7hPlORsf0fPiex1eIzA==
X-Google-Smtp-Source: ABdhPJxNDxNvreR8CZyN+xnayzqTpqhaL3uGPW0dQ7nSlPjcovKA+bLS7OUbg8IVZpB5bAYK442Y5A==
X-Received: by 2002:a5d:4b8b:0:b0:20c:f8c5:b9bc with SMTP id
 b11-20020a5d4b8b000000b0020cf8c5b9bcmr5280708wrt.282.1652981815291; 
 Thu, 19 May 2022 10:36:55 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e2-20020adfa742000000b0020c5253d8f2sm180183wrd.62.2022.05.19.10.36.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 10:36:54 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/22] target/arm: Factor out FWB=0 specific part of
 combine_cacheattrs()
Date: Thu, 19 May 2022 18:36:31 +0100
Message-Id: <20220519173651.399295-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220519173651.399295-1-peter.maydell@linaro.org>
References: <20220519173651.399295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Factor out the part of combine_cacheattrs() that is specific to
handling HCR_EL2.FWB == 0.  This is the part where we combine the
memory type and cacheability attributes.

The "force Outer Shareable for Device or Normal Inner-NC Outer-NC"
logic remains in combine_cacheattrs() because it holds regardless
(this is the equivalent of the pseudocode EffectiveShareability()
function).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220505183950.2781801-3-peter.maydell@linaro.org
---
 target/arm/helper.c | 88 +++++++++++++++++++++++++--------------------
 1 file changed, 50 insertions(+), 38 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 93c58ad29ab..a2a96358410 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -12578,6 +12578,46 @@ static uint8_t combine_cacheattr_nibble(uint8_t s1, uint8_t s2)
     }
 }
 
+/*
+ * Combine the memory type and cacheability attributes of
+ * s1 and s2 for the HCR_EL2.FWB == 0 case, returning the
+ * combined attributes in MAIR_EL1 format.
+ */
+static uint8_t combined_attrs_nofwb(CPUARMState *env,
+                                    ARMCacheAttrs s1, ARMCacheAttrs s2)
+{
+    uint8_t s1lo, s2lo, s1hi, s2hi, s2_mair_attrs, ret_attrs;
+
+    s2_mair_attrs = convert_stage2_attrs(env, s2.attrs);
+
+    s1lo = extract32(s1.attrs, 0, 4);
+    s2lo = extract32(s2_mair_attrs, 0, 4);
+    s1hi = extract32(s1.attrs, 4, 4);
+    s2hi = extract32(s2_mair_attrs, 4, 4);
+
+    /* Combine memory type and cacheability attributes */
+    if (s1hi == 0 || s2hi == 0) {
+        /* Device has precedence over normal */
+        if (s1lo == 0 || s2lo == 0) {
+            /* nGnRnE has precedence over anything */
+            ret_attrs = 0;
+        } else if (s1lo == 4 || s2lo == 4) {
+            /* non-Reordering has precedence over Reordering */
+            ret_attrs = 4;  /* nGnRE */
+        } else if (s1lo == 8 || s2lo == 8) {
+            /* non-Gathering has precedence over Gathering */
+            ret_attrs = 8;  /* nGRE */
+        } else {
+            ret_attrs = 0xc; /* GRE */
+        }
+    } else { /* Normal memory */
+        /* Outer/inner cacheability combine independently */
+        ret_attrs = combine_cacheattr_nibble(s1hi, s2hi) << 4
+                  | combine_cacheattr_nibble(s1lo, s2lo);
+    }
+    return ret_attrs;
+}
+
 /* Combine S1 and S2 cacheability/shareability attributes, per D4.5.4
  * and CombineS1S2Desc()
  *
@@ -12588,26 +12628,17 @@ static uint8_t combine_cacheattr_nibble(uint8_t s1, uint8_t s2)
 static ARMCacheAttrs combine_cacheattrs(CPUARMState *env,
                                         ARMCacheAttrs s1, ARMCacheAttrs s2)
 {
-    uint8_t s1lo, s2lo, s1hi, s2hi;
     ARMCacheAttrs ret;
     bool tagged = false;
-    uint8_t s2_mair_attrs;
 
     assert(s2.is_s2_format && !s1.is_s2_format);
     ret.is_s2_format = false;
 
-    s2_mair_attrs = convert_stage2_attrs(env, s2.attrs);
-
     if (s1.attrs == 0xf0) {
         tagged = true;
         s1.attrs = 0xff;
     }
 
-    s1lo = extract32(s1.attrs, 0, 4);
-    s2lo = extract32(s2_mair_attrs, 0, 4);
-    s1hi = extract32(s1.attrs, 4, 4);
-    s2hi = extract32(s2_mair_attrs, 4, 4);
-
     /* Combine shareability attributes (table D4-43) */
     if (s1.shareability == 2 || s2.shareability == 2) {
         /* if either are outer-shareable, the result is outer-shareable */
@@ -12621,37 +12652,18 @@ static ARMCacheAttrs combine_cacheattrs(CPUARMState *env,
     }
 
     /* Combine memory type and cacheability attributes */
-    if (s1hi == 0 || s2hi == 0) {
-        /* Device has precedence over normal */
-        if (s1lo == 0 || s2lo == 0) {
-            /* nGnRnE has precedence over anything */
-            ret.attrs = 0;
-        } else if (s1lo == 4 || s2lo == 4) {
-            /* non-Reordering has precedence over Reordering */
-            ret.attrs = 4;  /* nGnRE */
-        } else if (s1lo == 8 || s2lo == 8) {
-            /* non-Gathering has precedence over Gathering */
-            ret.attrs = 8;  /* nGRE */
-        } else {
-            ret.attrs = 0xc; /* GRE */
-        }
+    ret.attrs = combined_attrs_nofwb(env, s1, s2);
 
-        /* Any location for which the resultant memory type is any
-         * type of Device memory is always treated as Outer Shareable.
-         */
+    /*
+     * Any location for which the resultant memory type is any
+     * type of Device memory is always treated as Outer Shareable.
+     * Any location for which the resultant memory type is Normal
+     * Inner Non-cacheable, Outer Non-cacheable is always treated
+     * as Outer Shareable.
+     * TODO: FEAT_XS adds another value (0x40) also meaning iNCoNC
+     */
+    if ((ret.attrs & 0xf0) == 0 || ret.attrs == 0x44) {
         ret.shareability = 2;
-    } else { /* Normal memory */
-        /* Outer/inner cacheability combine independently */
-        ret.attrs = combine_cacheattr_nibble(s1hi, s2hi) << 4
-                  | combine_cacheattr_nibble(s1lo, s2lo);
-
-        if (ret.attrs == 0x44) {
-            /* Any location for which the resultant memory type is Normal
-             * Inner Non-cacheable, Outer Non-cacheable is always treated
-             * as Outer Shareable.
-             */
-            ret.shareability = 2;
-        }
     }
 
     /* TODO: CombineS1S2Desc does not consider transient, only WB, RWA. */
-- 
2.25.1


