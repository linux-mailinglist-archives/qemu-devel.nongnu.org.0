Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E49634354
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 19:09:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxXh4-0001Nn-8O; Tue, 22 Nov 2022 13:08:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxXgt-0001Lt-PC
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 13:08:16 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxXgr-0000LV-M8
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 13:08:15 -0500
Received: by mail-wr1-x433.google.com with SMTP id i12so22077200wrb.0
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 10:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E1VeCUUpz9q7d7i8rzMvb3SuAwtDGii4hs3EGRg2C90=;
 b=DpxCEhkSIb8K5aslytJCwB3KyoVf4/acuEOtEzTzW5UPlFoiTJXhjFzEUhB5LvDyiF
 wQqdOU3MuMVNvSVmF+hqtLk87hsuNkQOkRRvuOVXB/6FSHXNUwTZkkB5mdZHz9RHaXii
 Rbh+3Y9B92H8qZQ5kKn7o4TWv3QBPw+UCWLUK8arX+0RQ35bcTDIyk/Xs7qn42EjCvhX
 x8cK6Klszg0njDQIPmVaiSV+STA7zlcuCPrQOA/vLR6GujGP/BssvS9qN926IF63+PPE
 OmT4UPFZ0jLKjHxSXQazWktYHD/yqvdhsRViKfk/u1K7DsOnTUHBSODVXXl/zuhahhmT
 b4JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E1VeCUUpz9q7d7i8rzMvb3SuAwtDGii4hs3EGRg2C90=;
 b=AD2DJbiLOcaWKFUmoNzYWEN7yMqdZ5VOK5+MVnCZarZlYCZ5UtK7MeucwxNAFA0tvD
 bJ1ERJ1RjOMhOoWeMuSLHamv2xgPFXv2LhivOEeB2AebrSd0W/d7krIrPVMEuEchh5EH
 T2D17i0bL4STVBn+GPMhQHDrwrXmo3K7w5NN8Zm04PI0pOiRuUJQRyAaytqlu6PcoqpV
 TpwObOZn7q7SlNzfmVPcymoc0EJBh+1ImTg2oP0CvAYOLJ4g3+M47K0XULHAOvodguvj
 pX17dGveKn5tXcdEBCFFQtfJzaDAOQ3TI4EUu+o9szTvsxiN3IrVX1fHy6yMlvmv91cI
 NLwg==
X-Gm-Message-State: ANoB5pkEFsfPvVxKZc4MffOxDEmptnHYOga6pGIwSA0s6KPYN7ON8cda
 /H2P5MDbKqILc8w5zDP9JDbeFqWHWUYK+g==
X-Google-Smtp-Source: AA0mqf71i/kj0hr98Wt2XkrxebTegLiYd+L1gSCyj+bt+gHhRtWvmLfzvMp+t+T+s7pN/Q85xtJzxg==
X-Received: by 2002:adf:cd86:0:b0:236:8a6d:72a1 with SMTP id
 q6-20020adfcd86000000b002368a6d72a1mr14576325wrj.682.1669140491138; 
 Tue, 22 Nov 2022 10:08:11 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 g17-20020a05600c4ed100b003c701c12a17sm25628100wmq.12.2022.11.22.10.08.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 22 Nov 2022 10:08:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/3] tcg: Convert typecode_to_ffi from array to function
Date: Tue, 22 Nov 2022 19:08:02 +0100
Message-Id: <20221122180804.938-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221122180804.938-1-philmd@linaro.org>
References: <20221111074101.2069454-27-richard.henderson@linaro.org>
 <20221122180804.938-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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

In the unlikely case of invalid typecode mask, the function
will abort instead of returning a NULL pointer.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221111074101.2069454-27-richard.henderson@linaro.org>
[PMD: Split from bigger patch]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tcg/tcg.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index cabc397a38..8aa6fc9a25 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -554,14 +554,24 @@ static GHashTable *helper_table;
 #ifdef CONFIG_TCG_INTERPRETER
 static GHashTable *ffi_table;
 
-static ffi_type * const typecode_to_ffi[8] = {
-    [dh_typecode_void] = &ffi_type_void,
-    [dh_typecode_i32]  = &ffi_type_uint32,
-    [dh_typecode_s32]  = &ffi_type_sint32,
-    [dh_typecode_i64]  = &ffi_type_uint64,
-    [dh_typecode_s64]  = &ffi_type_sint64,
-    [dh_typecode_ptr]  = &ffi_type_pointer,
-};
+static ffi_type *typecode_to_ffi(int argmask)
+{
+    switch (argmask) {
+    case dh_typecode_void:
+        return &ffi_type_void;
+    case dh_typecode_i32:
+        return &ffi_type_uint32;
+    case dh_typecode_s32:
+        return &ffi_type_sint32;
+    case dh_typecode_i64:
+        return &ffi_type_uint64;
+    case dh_typecode_s64:
+        return &ffi_type_sint64;
+    case dh_typecode_ptr:
+        return &ffi_type_pointer;
+    }
+    g_assert_not_reached();
+}
 #endif
 
 typedef struct TCGCumulativeArgs {
@@ -764,14 +774,14 @@ static void tcg_context_init(unsigned max_cpus)
         nargs = DIV_ROUND_UP(nargs, 3);
 
         ca = g_malloc0(sizeof(*ca) + nargs * sizeof(ffi_type *));
-        ca->cif.rtype = typecode_to_ffi[typemask & 7];
+        ca->cif.rtype = typecode_to_ffi(typemask & 7);
         ca->cif.nargs = nargs;
 
         if (nargs != 0) {
             ca->cif.arg_types = ca->args;
             for (int j = 0; j < nargs; ++j) {
                 int typecode = extract32(typemask, (j + 1) * 3, 3);
-                ca->args[j] = typecode_to_ffi[typecode];
+                ca->args[j] = typecode_to_ffi(typecode);
             }
         }
 
-- 
2.38.1


