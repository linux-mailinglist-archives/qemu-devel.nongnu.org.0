Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9CE678DE6
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 03:06:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK8gi-0008Q9-6x; Mon, 23 Jan 2023 21:05:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK8gc-0008Oi-Cc
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 21:05:22 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK8ga-0003rF-I5
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 21:05:22 -0500
Received: by mail-pl1-x634.google.com with SMTP id v23so13366929plo.1
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 18:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M+X3JDFyAdIiq7GuR1lXz08iKvUAJh5EzFJMUQ6OLSg=;
 b=zhZKY1iLJ0tJpVwvD/7YJDpyoW/JarwVO0HSzDFFj/eL90SQtR8B3slbGcZ+dgOLF8
 wwAvIrncNf7S1aIosQ6DzLS0QPiWj3A981O1c3tiOI0xLrKcDGw2fbvFyAuppjmuEDEO
 i0L3jsnhQ0bd3BT9M0T7REhYh8tQZTTfuMz8uA/bLJ0qrgy475EjvCoCUC6ZKLxv/35Z
 LieOeJeBkptKOA+YHbbD3WopmUELmWtV/dZRoLPaRz+FL/WLVSf8SRNkG5wFZ5UdthAi
 bxma+CHLPb1HLOJLR5XN08aHbnGcvNBlC6SpSvZOwxGfvIj52C2g5F291oBxZSuasTta
 3tGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M+X3JDFyAdIiq7GuR1lXz08iKvUAJh5EzFJMUQ6OLSg=;
 b=1tKjPU1F4L0XfBDUKM5likXW9KrSxn8LYrnGpajGPX2i321Y4fnak51kX8x98iuREZ
 44hwSj680WTugp9C+YYBL8QP4vUuz7DRtvxYFqN9XWoySjABDsPhsfuCZmh55uSokvBL
 llcOSfdD+54wJEixafbYp5e5eizLDQQKD6qo9KcWCJ6dY4XyuqRFahUqgFhYZtHr8SZp
 RdneckcuyGmqMff8tytAuWgl/R8s625uRKVANIZynne8Xx5+uehTq7TWmtyNM8Qedh/D
 mdQ/4s1E1GUFPYV/xpWjlXddIerpntUcG0ROWHrYAl97QceeHQpJmjCr+AMKUOGcqSaL
 jRTQ==
X-Gm-Message-State: AFqh2kqMVvhkMWz4+eKgzYDKNahg77dzpEh72dz6rN15VCBKLIIbFmnO
 F9aAmYkOE+pIOgF8HPki8tsIW60YJCkaukvl
X-Google-Smtp-Source: AMrXdXuW0qGHylvRtLGZSm8/0unQiw5UBloK/Rs6953GNhN2Tn27W+AEFpgUcp8OlWU1aCIhPOun3g==
X-Received: by 2002:a17:90a:1a5e:b0:22b:bc63:c8b0 with SMTP id
 30-20020a17090a1a5e00b0022bbc63c8b0mr12528204pjl.34.1674525918509; 
 Mon, 23 Jan 2023 18:05:18 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 fh3-20020a17090b034300b00228e56d375asm283936pjb.33.2023.01.23.18.05.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 18:05:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Idan Horowitz <idan.horowitz@gmail.com>
Subject: [PULL v2 05/15] tcg: Mark tcg helpers noinline to avoid an issue with
 LTO
Date: Mon, 23 Jan 2023 16:04:57 -1000
Message-Id: <20230124020507.3732200-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124020507.3732200-1-richard.henderson@linaro.org>
References: <20230124020507.3732200-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

Marking helpers __attribute__((noinline)) prevents an issue
with GCC's ipa-split pass under --enable-lto.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1454
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Idan Horowitz <idan.horowitz@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/helper-proto.h | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/include/exec/helper-proto.h b/include/exec/helper-proto.h
index c4b1bda632..7a3f04b58c 100644
--- a/include/exec/helper-proto.h
+++ b/include/exec/helper-proto.h
@@ -6,34 +6,49 @@
 
 #include "exec/helper-head.h"
 
+/*
+ * Work around an issue with --enable-lto, in which GCC's ipa-split pass
+ * decides to split out the noreturn code paths that raise an exception,
+ * taking the __builtin_return_address() along into the new function,
+ * where it no longer computes a value that returns to TCG generated code.
+ * Despite the name, the noinline attribute affects splitter, so this
+ * prevents the optimization in question.  Given that helpers should not
+ * otherwise be called directly, this should have any other visible effect.
+ *
+ * See https://gitlab.com/qemu-project/qemu/-/issues/1454
+ */
+#define DEF_HELPER_ATTR  __attribute__((noinline))
+
 #define DEF_HELPER_FLAGS_0(name, flags, ret) \
-dh_ctype(ret) HELPER(name) (void);
+dh_ctype(ret) HELPER(name) (void) DEF_HELPER_ATTR;
 
 #define DEF_HELPER_FLAGS_1(name, flags, ret, t1) \
-dh_ctype(ret) HELPER(name) (dh_ctype(t1));
+dh_ctype(ret) HELPER(name) (dh_ctype(t1)) DEF_HELPER_ATTR;
 
 #define DEF_HELPER_FLAGS_2(name, flags, ret, t1, t2) \
-dh_ctype(ret) HELPER(name) (dh_ctype(t1), dh_ctype(t2));
+dh_ctype(ret) HELPER(name) (dh_ctype(t1), dh_ctype(t2)) DEF_HELPER_ATTR;
 
 #define DEF_HELPER_FLAGS_3(name, flags, ret, t1, t2, t3) \
-dh_ctype(ret) HELPER(name) (dh_ctype(t1), dh_ctype(t2), dh_ctype(t3));
+dh_ctype(ret) HELPER(name) (dh_ctype(t1), dh_ctype(t2), \
+                            dh_ctype(t3)) DEF_HELPER_ATTR;
 
 #define DEF_HELPER_FLAGS_4(name, flags, ret, t1, t2, t3, t4) \
 dh_ctype(ret) HELPER(name) (dh_ctype(t1), dh_ctype(t2), dh_ctype(t3), \
-                                   dh_ctype(t4));
+                            dh_ctype(t4)) DEF_HELPER_ATTR;
 
 #define DEF_HELPER_FLAGS_5(name, flags, ret, t1, t2, t3, t4, t5) \
 dh_ctype(ret) HELPER(name) (dh_ctype(t1), dh_ctype(t2), dh_ctype(t3), \
-                            dh_ctype(t4), dh_ctype(t5));
+                            dh_ctype(t4), dh_ctype(t5)) DEF_HELPER_ATTR;
 
 #define DEF_HELPER_FLAGS_6(name, flags, ret, t1, t2, t3, t4, t5, t6) \
 dh_ctype(ret) HELPER(name) (dh_ctype(t1), dh_ctype(t2), dh_ctype(t3), \
-                            dh_ctype(t4), dh_ctype(t5), dh_ctype(t6));
+                            dh_ctype(t4), dh_ctype(t5), \
+                            dh_ctype(t6)) DEF_HELPER_ATTR;
 
 #define DEF_HELPER_FLAGS_7(name, flags, ret, t1, t2, t3, t4, t5, t6, t7) \
 dh_ctype(ret) HELPER(name) (dh_ctype(t1), dh_ctype(t2), dh_ctype(t3), \
                             dh_ctype(t4), dh_ctype(t5), dh_ctype(t6), \
-                            dh_ctype(t7));
+                            dh_ctype(t7)) DEF_HELPER_ATTR;
 
 #define IN_HELPER_PROTO
 
@@ -51,5 +66,6 @@ dh_ctype(ret) HELPER(name) (dh_ctype(t1), dh_ctype(t2), dh_ctype(t3), \
 #undef DEF_HELPER_FLAGS_5
 #undef DEF_HELPER_FLAGS_6
 #undef DEF_HELPER_FLAGS_7
+#undef DEF_HELPER_ATTR
 
 #endif /* HELPER_PROTO_H */
-- 
2.34.1


