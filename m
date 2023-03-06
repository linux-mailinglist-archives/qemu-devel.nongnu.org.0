Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1D26AC5A1
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 16:38:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZCrQ-00043K-PW; Mon, 06 Mar 2023 10:34:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZCrP-000433-Hr
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:34:47 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZCrN-00029m-Tu
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:34:47 -0500
Received: by mail-wm1-x332.google.com with SMTP id k37so5970158wms.0
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 07:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678116884;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8RypxeqHCkWrvhM6v/ukjoIBfsmqrjlJlNPR4BkYcx0=;
 b=NsNUnGuyUFxD5ZETY4XHduffwIAYUWimVXUoAXkLBIstrQvQKhMBtrIRYgw8wT09aK
 KPbwkqtzESTDTZ3pBYzddLgksHZnmeyo2BBZAdc8jEM3tmAHOU2caUrPyL+2laEmDOVG
 nyYbE3mfJqYeuxWSSaehlX+YLV0OXWVMNgp8y20yB06ksHMzWe8x3Paa0EIsnpYOONN8
 aqG7NiNzGUqOq+f6He4Q1bwUWhdI5jDVn/OA/YmhW+y0Xb/7LaQXSNaA/tTX0x17q32l
 0LxQYnScMlVYz+7PbU/Ar4jIqT7mdeQ12WKrmGReyl2PGQrHXgmk+UgzOFWFw6B9PeQo
 GtQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678116884;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8RypxeqHCkWrvhM6v/ukjoIBfsmqrjlJlNPR4BkYcx0=;
 b=WT7aFl+1bvOzYf4pP4gsP88iEiupraTgzB8zusMDnWVKTOyyZDBgNUgEHQKjTk12Z1
 PawSwMsQvL5JolBtGb5kZiN9nDBtxcGDOGVqFwSCY93/za3CmqIHdChzUMUUhY3dOhXJ
 arpHX7xbxM8JRF3CtegalgfELyxX26S+ZaLJnmMdBWgnjydg5qJVt3sAByW3fTcFU400
 pgbS8AMutTKX+VG6D2S7zxd2cLTKcR7V45i3n50SmTHLDhmML/2bDS1TnoKYds19IVPm
 0VnQLoBFQMd/ZtfFB8a9v8byOYcACuqOVIvxEMtq50Av8eiljsMvjtaN246S85CCU51/
 Vqew==
X-Gm-Message-State: AO0yUKVX6FYMIYlQIm0M0a07+jt6pSNGQHZ7vMKOrPNshU28KtMGSaSZ
 MtTcKY5WIeAW0O1NvvCsEcmyJ8Opimx6TEuhaZM=
X-Google-Smtp-Source: AK7set+TdY2r7oyhgfMCNELcy7l1HAbwtLeSAHJjlr30WDSy48YixMRGKbBfvxJI8ll6jszk8ldyOw==
X-Received: by 2002:a05:600c:4511:b0:3ea:e554:7808 with SMTP id
 t17-20020a05600c451100b003eae5547808mr9638293wmo.19.1678116884554; 
 Mon, 06 Mar 2023 07:34:44 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a05600c444700b003eb0d6f48f3sm15287432wmn.27.2023.03.06.07.34.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 07:34:44 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/21] target/arm: Simplify iteration over bit widths
Date: Mon,  6 Mar 2023 15:34:23 +0000
Message-Id: <20230306153435.490894-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306153435.490894-1-peter.maydell@linaro.org>
References: <20230306153435.490894-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Richard Henderson <richard.henderson@linaro.org>

Order suf[] by the log8 of the width.
Use ARRAY_SIZE instead of hard-coding 128.

This changes the order of the union definitions,
but retains the order of the union-of-union members.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230227213329.793795-10-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/gdbstub64.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index 36166bf81eb..3d9e9e97c86 100644
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


