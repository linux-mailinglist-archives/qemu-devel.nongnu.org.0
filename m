Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 954E964BE8C
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 22:36:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Cmz-0000iV-F1; Tue, 13 Dec 2022 16:26:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p5Cmw-0000h2-Og
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:26:10 -0500
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p5Cmu-0003Dw-QI
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:26:10 -0500
Received: by mail-oi1-x22f.google.com with SMTP id v70so1050002oie.3
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 13:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QFUsNAuul+J55fC7tXSY0WCt3qBCcqJEW4LFQbi3f+k=;
 b=VccumtVuwewimi/cUVu4XEDvuSAlRKh9q3tJP0rNqXR9hr8hbqn5jv0rUaieYRKvj3
 ZmU6L5EGH9nEteYUPwg6/7wmlPR6MEJL9tQVl8UQYgB++3uNkP/SiCTMx5yvbMJAp9N0
 qlCeQOIVeR4yd+l+pEUKT52iksA9OFi+KZlAz2vLzsQiJ067/RDuVSJVcmkLkTSfE7Cc
 uU8hN2r5dT6bkQfQy0c5nT2lalEzSrrOEBvKnIcjV8OIqd05dey1Y83v56orDFxPlBTW
 kQ36PVdI1Kpr4iRnTtwu1YF/u6QI5uCu4sQD4cxLqc845r6757zRYVfouFk3zmk6CQFb
 lbYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QFUsNAuul+J55fC7tXSY0WCt3qBCcqJEW4LFQbi3f+k=;
 b=U3qxo04I85vkIWswN14WOwg5pi0seLrQl7nrfnu1uzA254YgkTBs7H2q2QPtfC6Z6o
 Z3ks7YAO3hxUh/4H0QdhEO7FVV/kM3hVlxP9IgdCWShybeUuy8kIdZwnzzjcasgvYgpm
 tpnNKsrO8Ij2fWSqbnxXIL8LuNTa6IV9f3hEVGngqOOTYo0poajN3arQF6iES5TtTwr3
 qjmXxxSijSoH3s4seJDF43lCt1TqLl7QTgktPP8jy+H7FAc7ZLN299IgXLU3fyW7xi1b
 Uv2tcWqqvBwK1wVWv5PUPNse8EQPx5tM1G3U7lrytNSclQttxFNv8yNTZjdIhZg6pLZD
 +Q5g==
X-Gm-Message-State: ANoB5plhqNeHudvcyYr0A0xa40zAHAK0I+4MY9RZGrgiIViEZP0GBJbt
 lfjUlsgWgIzjtHxLHFNRoLPaTUumXZ578pMFDvQ=
X-Google-Smtp-Source: AA0mqf713G84k2alDtMS5LYcQn08OSfD6+v+sJ8NKjNJd5Sx7CbePRIMQ3i7q10mwh8GxtCK99jDdA==
X-Received: by 2002:a05:6808:1b1e:b0:35e:4589:19cf with SMTP id
 bx30-20020a0568081b1e00b0035e458919cfmr13206339oib.42.1670966767685; 
 Tue, 13 Dec 2022 13:26:07 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:c63:85ed:4256:8ad0])
 by smtp.gmail.com with ESMTPSA id
 a7-20020a056808098700b0035c073aa0d8sm5006831oic.18.2022.12.13.13.26.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 13:26:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 23/27] tcg: Convert typecode_to_ffi from array to function
Date: Tue, 13 Dec 2022 15:25:37 -0600
Message-Id: <20221213212541.1820840-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221213212541.1820840-1-richard.henderson@linaro.org>
References: <20221213212541.1820840-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22f.google.com
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


