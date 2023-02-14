Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E8A696999
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 17:32:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRyDC-0006wS-ED; Tue, 14 Feb 2023 11:31:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pRyCy-0006Ur-8M
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 11:31:08 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pRyCw-0002AM-NO
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 11:31:07 -0500
Received: by mail-pg1-x532.google.com with SMTP id v3so10583660pgh.4
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 08:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YRBnSRYi8o+DLHiV3s59zUytH0Yp49LyljZa3CvYZ4E=;
 b=fWI7kDHiT7X3OmtkOyNQejdpwA6XhJG97IZ4mlR8XOHBF9sbzjzBso/ASVPcE5VkyA
 +dh1/9QZOdvIdOty38ZgMaMlxIDNVknzr7yXmI7q8hLexL5+YaKNHol4UR5A4eYZd0Vs
 LtLhynCf1Y4tacrWoZN3n380YV65rgPD6Dv+QWRgHfpcqZbuw3kw0Ui6b8B51z57IS9t
 QM6TS4KO2PjDWtQhq4ZCR+cPxG4xvg2Sqr5y57WuTiGVUvZObcshcsLQB4YccoCvxEMb
 CogtbZaSc7tAYc2OzSk+q7uQVsqtLtLRx/edfnRrxV7IdigeEF9VV+RDEKOqafgpa5J3
 29ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YRBnSRYi8o+DLHiV3s59zUytH0Yp49LyljZa3CvYZ4E=;
 b=lX0nvv+xp66LKCH7Aui1+zVv3QVVgR5j056uQYMXuEXJbRwURD/9fR6E9lt2BOtWlI
 aZiqw6SbVFBSbO+AlmuGTollirINa9xG45Jxy6oNi0K2mIy3qZTJ2qBsi0nMc5oI7U7b
 jc+BvliVWjJ88kgbmYDUABT9/Wk7yXy23FkwZrg/n8Hrd1GeS05SgbzRLkAOfVu/NzOP
 eVFz6n4jRoxlE0TBw4kpdoLiw59UklUaIhrpAhgCW+OmUl1I/yIhLcU56lV4gcb8awEL
 DtSLefYZbjimStVu8pWUXPVR1iTcsEVY1p+7teXq50IGlrvLQVMU+1ZRua/qnIoCVsZi
 Lqug==
X-Gm-Message-State: AO0yUKWpBmkax5XfJMQyzLoGdtJqY/Oa4mfv7EsoKVclXjG/386ZGzzB
 ixys3dL0DaEyDx7B/dtd8ODgdi5eT2Ji+PWwl8w=
X-Google-Smtp-Source: AK7set/wqIYXasY4LLNYB3x1tRfHcRwLdTop4flxTxI6NRTGqzbXPh8mw6sDzfYWLETPRa8WhUJwfw==
X-Received: by 2002:a62:17c3:0:b0:5a8:aa1d:30e9 with SMTP id
 186-20020a6217c3000000b005a8aa1d30e9mr2275115pfx.18.1676392265265; 
 Tue, 14 Feb 2023 08:31:05 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 d17-20020aa78691000000b0058d99337381sm10337011pfo.172.2023.02.14.08.31.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 08:31:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 09/14] target/arm: Simplify iteration over bit widths
Date: Tue, 14 Feb 2023 06:30:43 -1000
Message-Id: <20230214163048.903964-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230214163048.903964-1-richard.henderson@linaro.org>
References: <20230214163048.903964-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/gdbstub64.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index 166cb288cd..a6a8e7eb40 100644
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


