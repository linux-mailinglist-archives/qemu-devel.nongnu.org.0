Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE6063FFE1
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 06:41:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0ymo-0002js-6Q; Fri, 02 Dec 2022 00:40:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0ymm-0002j7-6S
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 00:40:32 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0ymk-0003JP-Ls
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 00:40:31 -0500
Received: by mail-pl1-x62b.google.com with SMTP id 4so3752254pli.0
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 21:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QFUsNAuul+J55fC7tXSY0WCt3qBCcqJEW4LFQbi3f+k=;
 b=dHmvXM15b8M9xyG+bXPSETkVSHIHP+oX7Ira3ds0EpmlCouJBVeeMTvl9p8AAdYb5i
 URcOyNk3T+NGyznLuhqa5Qd78SJzWBAg9aErzkpheyaAWlD+yssFcJLB595lbAbyutXi
 345Z8MOvVYs77Hz1lijxPCgOD7YYpF0ZKHy8/3sPFfd6tKaY1QW6tUB6Zd7kGm6lBCL7
 uuWc+co9aa7mqi7nvmiCNcTof7ySPXXZa99IQ/ctKxuPC6PSaLKoUjHjGm1HOo/Yp+Tt
 6vnlH6X6vFHod0J5mcEMxxB/6jBbvWs52iYrazrlzgLkJrlC2v3skeIaE5d94ZteS5rP
 buvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QFUsNAuul+J55fC7tXSY0WCt3qBCcqJEW4LFQbi3f+k=;
 b=ISsOxF/kMOJI2Zwx1LqdbsbU5dK4wTPxod2q9fdWc1Vx3KWMxqm0ABFUlprH+SMQP1
 pmgflX9hpF7d4AN9jF6AMfbEzigBIj7AFjoWiBJgtLGWrm2xPD/uk1BoBFgAkHlH7wLW
 tJGgaj59D3zNFByqEPeGno01uRBE4GLvcwQaftVD5G6JN3wA345YgblPnANnZknmtup8
 fLvVhPv0KpfMaW9Di294EPariAuXj5pn7yadIR4K3B0HWdWb/51u6Cey8XWKKmY+IngO
 2rfaogXgrOjTR08QyEYW22v6pJo1+NKbWX1x62sJ50jaiXEHTk3+hQ46U1bVT+uF54Cx
 0GJA==
X-Gm-Message-State: ANoB5pnzb7bdwASOIhSL1pJAc2suZeNjLhce9gojC5GRioKkAk1qAvsv
 cq+nz3gJjH6cTyOs1T7JjmjQgK1jwad+V4SF
X-Google-Smtp-Source: AA0mqf4G5331V7dRFtORdnNcjZb2gsyarTQ+JayTHQaVVmAtYK7G+5tUVtKaH65vbqfbEBixShVJaQ==
X-Received: by 2002:a17:90a:be02:b0:219:8199:ef57 with SMTP id
 a2-20020a17090abe0200b002198199ef57mr4702388pjs.129.1669959629932; 
 Thu, 01 Dec 2022 21:40:29 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:e3cc:2e37:17d4:f1d5])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a170903230c00b00186f0f59c85sm4637075plh.235.2022.12.01.21.40.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 21:40:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 30/34] tcg: Convert typecode_to_ffi from array to function
Date: Thu,  1 Dec 2022 21:39:54 -0800
Message-Id: <20221202053958.223890-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221202053958.223890-1-richard.henderson@linaro.org>
References: <20221202053958.223890-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

In the unlikely case of invalid typecode mask, the function
will abort instead of returning a NULL pointer.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221111074101.2069454-27-richard.henderson@linaro.org>
[PMD: Split from bigger patch]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221122180804.938-2-philmd@linaro.org>
---
 tcg/tcg.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 74f7491d73..46cce228a0 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -555,14 +555,24 @@ static GHashTable *helper_table;
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
@@ -779,14 +789,14 @@ static void tcg_context_init(unsigned max_cpus)
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
2.34.1


