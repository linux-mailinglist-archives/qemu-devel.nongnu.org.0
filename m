Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E32C84B043D
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 05:09:35 +0100 (CET)
Received: from localhost ([::1]:48430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI0ly-0006to-O8
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 23:09:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nI0hE-0003uD-0V
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 23:04:40 -0500
Received: from [2607:f8b0:4864:20::636] (port=38788
 helo=mail-pl1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nI0hB-00045r-02
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 23:04:38 -0500
Received: by mail-pl1-x636.google.com with SMTP id c3so747255pls.5
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 20:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AwzX6nehTYEJJpMljDUaZpO2r34jA4Ju646jiPXQlwk=;
 b=fxoubPLNEogn+zHRnWFJWC+02DY723o0fq2mD8X6E2s1xgD8o6Q8a3eI/T8JVd8rtq
 9ZT1LBBeJTKrH1XeHWmzn1q/QJX9IjQMkZlmav6rW0XnrofDTCUk/+Ck5IJm94cA6Gsg
 SDBBWqh9qQ9RgT+ewtFxdOk4c1Grp9f4tLZH9kDGC4660fg89EMBZNgkruKqmyL8rTIe
 Z1RkqS2X/006oeS+5XAXAivHdihTmQYjNZpGtW9FdDsJjUJDasBgtgXhzbNUUW8L0wxY
 lo4wUWS2/Pa6s2PHUsTMGCJIDeoQLm/Am+lDVd2VJY6vQs7Vi2VAIe0cMqOQO+yIEPkq
 uL8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AwzX6nehTYEJJpMljDUaZpO2r34jA4Ju646jiPXQlwk=;
 b=4BlxNNrOe4T1LXYha8wUgwUwKKDf4z752WxHlvPqODpqRTBJB4gW3ADtyzx/1mJITF
 Jnb8lvVYS6USqPrYq8YpqToYEke8Rw7lTCTPtEA8WZSiG5FhEtd6sAjDxzubJSXuIlbC
 3xoYM3VtXycguHi+FUY9cVQiWXOB6VsWXBJTkQhlwsu10fAEICzNkYveEveIk4YW24a7
 bcMLWT0borRRQhWKG/nlvoBvaZ74o5jhNY1Gzm0q296H1YAvw8H0REPLno1VhJuJ9azd
 e/slruz8SNs1vQWs75E+NyzLVC+rrrkUTLFyehvbmFoPGM/5HgRPfcEsY31H04uwohN3
 /9GA==
X-Gm-Message-State: AOAM533hwFxq3037Eyz2C2USm9R1mDzhENRjmusJS58XHe2QnZWRqgWQ
 lBPjGksyNdxRdVnFfEMMbkebSfGVzai8J1oh
X-Google-Smtp-Source: ABdhPJz0KVvI1mTb0oODJrEK+YKDaIymbE6d50ZoWXQ2NLmSdivXc3vxFLGoaYYn2FgKTCdxQElB7Q==
X-Received: by 2002:a17:90b:2243:: with SMTP id
 hk3mr750212pjb.244.1644465875665; 
 Wed, 09 Feb 2022 20:04:35 -0800 (PST)
Received: from localhost.localdomain ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id y4sm9749814pgp.5.2022.02.09.20.04.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 20:04:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/15] hw/registerfields: Add FIELD_SEX<N> and FIELD_SDP<N>
Date: Thu, 10 Feb 2022 15:04:09 +1100
Message-Id: <20220210040423.95120-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220210040423.95120-1-richard.henderson@linaro.org>
References: <20220210040423.95120-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::636
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add new macros to manipulate signed fields within the register.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/registerfields.h | 48 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 47 insertions(+), 1 deletion(-)

diff --git a/include/hw/registerfields.h b/include/hw/registerfields.h
index f2a3c9c41f..3a88e135d0 100644
--- a/include/hw/registerfields.h
+++ b/include/hw/registerfields.h
@@ -59,6 +59,19 @@
     extract64((storage), R_ ## reg ## _ ## field ## _SHIFT,               \
               R_ ## reg ## _ ## field ## _LENGTH)
 
+#define FIELD_SEX8(storage, reg, field)                                   \
+    sextract8((storage), R_ ## reg ## _ ## field ## _SHIFT,               \
+              R_ ## reg ## _ ## field ## _LENGTH)
+#define FIELD_SEX16(storage, reg, field)                                  \
+    sextract16((storage), R_ ## reg ## _ ## field ## _SHIFT,              \
+               R_ ## reg ## _ ## field ## _LENGTH)
+#define FIELD_SEX32(storage, reg, field)                                  \
+    sextract32((storage), R_ ## reg ## _ ## field ## _SHIFT,              \
+               R_ ## reg ## _ ## field ## _LENGTH)
+#define FIELD_SEX64(storage, reg, field)                                  \
+    sextract64((storage), R_ ## reg ## _ ## field ## _SHIFT,              \
+               R_ ## reg ## _ ## field ## _LENGTH)
+
 /* Extract a field from an array of registers */
 #define ARRAY_FIELD_EX32(regs, reg, field)                                \
     FIELD_EX32((regs)[R_ ## reg], reg, field)
@@ -95,7 +108,40 @@
     _d; })
 #define FIELD_DP64(storage, reg, field, val) ({                           \
     struct {                                                              \
-        uint64_t v:R_ ## reg ## _ ## field ## _LENGTH;                \
+        uint64_t v:R_ ## reg ## _ ## field ## _LENGTH;                    \
+    } _v = { .v = val };                                                  \
+    uint64_t _d;                                                          \
+    _d = deposit64((storage), R_ ## reg ## _ ## field ## _SHIFT,          \
+                  R_ ## reg ## _ ## field ## _LENGTH, _v.v);              \
+    _d; })
+
+#define FIELD_SDP8(storage, reg, field, val) ({                           \
+    struct {                                                              \
+        signed int v:R_ ## reg ## _ ## field ## _LENGTH;                  \
+    } _v = { .v = val };                                                  \
+    uint8_t _d;                                                           \
+    _d = deposit32((storage), R_ ## reg ## _ ## field ## _SHIFT,          \
+                  R_ ## reg ## _ ## field ## _LENGTH, _v.v);              \
+    _d; })
+#define FIELD_SDP16(storage, reg, field, val) ({                          \
+    struct {                                                              \
+        signed int v:R_ ## reg ## _ ## field ## _LENGTH;                  \
+    } _v = { .v = val };                                                  \
+    uint16_t _d;                                                          \
+    _d = deposit32((storage), R_ ## reg ## _ ## field ## _SHIFT,          \
+                  R_ ## reg ## _ ## field ## _LENGTH, _v.v);              \
+    _d; })
+#define FIELD_SDP32(storage, reg, field, val) ({                          \
+    struct {                                                              \
+        signed int v:R_ ## reg ## _ ## field ## _LENGTH;                  \
+    } _v = { .v = val };                                                  \
+    uint32_t _d;                                                          \
+    _d = deposit32((storage), R_ ## reg ## _ ## field ## _SHIFT,          \
+                  R_ ## reg ## _ ## field ## _LENGTH, _v.v);              \
+    _d; })
+#define FIELD_SDP64(storage, reg, field, val) ({                          \
+    struct {                                                              \
+        int64_t v:R_ ## reg ## _ ## field ## _LENGTH;                     \
     } _v = { .v = val };                                                  \
     uint64_t _d;                                                          \
     _d = deposit64((storage), R_ ## reg ## _ ## field ## _SHIFT,          \
-- 
2.25.1


