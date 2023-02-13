Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC45A69524A
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 21:50:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRfku-0000qO-PX; Mon, 13 Feb 2023 15:48:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pRbT1-00083I-3c
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 11:14:11 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pRbSz-0005jr-FQ
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 11:14:10 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 j29-20020a05600c1c1d00b003dc52fed235so9448003wms.1
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 08:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vGXouOChIYjl8AkJ3HhGb5U80hOl0zPVyYzc37vy0jM=;
 b=WCllbPTYj7Vud2F7vQj3yhg1D6dziLwm9+gftTJRayUZkPCwHjUJJ/oW2/3I7ekMmn
 WNA9xORPbErgpzxxDiJmdL43ghuPBPo6t1Tc9zjrZ5cLj0+Cwi8pcz0VZQ5J/R5LJX7H
 7HH9N03LgWjwJCtix/BKouIEBsBQpaUWRApqsdwfghCYw1d9TmRX2wNZsE3SiCCoiKoQ
 SUx8oeY/aCkfvkEyvgKRi4IgkXdsVjItfaiQqdJmOqBhXe3HByQBQ2VfEofERucQIaoW
 qPe+dWcXHRk0j3Df89KzAT+7mFDpVkhIekoiBNipFvUyliFHjnwH9wuWV6JL6upcMhYA
 1qWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vGXouOChIYjl8AkJ3HhGb5U80hOl0zPVyYzc37vy0jM=;
 b=VmUqJJECDnyIizQMTmfm7VKEKdBw6R6vfcV6ybo/pbxzE1s9M9bufxNX6KZnw6QOFk
 UQ+wv1pE57f3tfHHVSTZg/aRU0c5HoHaMQI12yXM6DpDfTOYHuO32Ylae+tsEKLWSDEH
 kCPp6JetYVd1s3hxjca2IQvld0vfNU+seEPK3bc6ndBUPCkbcNUPRL/7vj4Td4KXETxi
 CCEi4MkFGiwhNyTfGhUqqA0xF+f//tq1Ljj5vHpNaTDMeqIsAFy8eiZscXCY9zf0Aegq
 8KUi1H/TraAKGZn+wZ7bNsfSuVnjkTebfU/wdpAU7yQ8jQFFomUkg3CbFkJ0vQFmC1vw
 H0Lg==
X-Gm-Message-State: AO0yUKUntrigNgjyEVmYarkLpqpI1BoBvsOWd2wp0iiAQ9GUCSSsj26w
 2y5HRsESVelYVghwcfTnfGocjNfyd6ULeziKK5M=
X-Google-Smtp-Source: AK7set+l9mZ/R7TkEOpA945CuAcNHoni2h6uzFjgIRSH85LaT07xpNzg3O3A9OSVsaRgl26lNF7TfQ==
X-Received: by 2002:a05:600c:4da4:b0:3dc:443e:420e with SMTP id
 v36-20020a05600c4da400b003dc443e420emr18549209wmp.2.1676304847598; 
 Mon, 13 Feb 2023 08:14:07 -0800 (PST)
Received: from volterra.localdomain ([2a01:e0a:5cc:caa0:8df5:e191:f2b0:5825])
 by smtp.gmail.com with ESMTPSA id
 t13-20020adfe44d000000b002c557f82e27sm3582882wrm.99.2023.02.13.08.14.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 08:14:07 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: sw@weilnetz.de, kkostiuk@redhat.com, clg@kaod.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 2/4] sysemu/os-win32: fix setjmp/longjmp on windows-arm64
Date: Mon, 13 Feb 2023 17:13:50 +0100
Message-Id: <20230213161352.17199-3-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230213161352.17199-1-pierrick.bouvier@linaro.org>
References: <20230213161352.17199-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 13 Feb 2023 15:48:53 -0500
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

Windows implementation of setjmp/longjmp is done in
C:/WINDOWS/system32/ucrtbase.dll. Alas, on arm64, it seems to *always*
perform stack unwinding, which crashes from generated code.

By using alternative implementation built in mingw, we avoid doing stack
unwinding and this fixes crash when calling longjmp.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/sysemu/os-win32.h | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/include/sysemu/os-win32.h b/include/sysemu/os-win32.h
index 5b38c7bd04..84f62d0a17 100644
--- a/include/sysemu/os-win32.h
+++ b/include/sysemu/os-win32.h
@@ -51,14 +51,28 @@ typedef struct sockaddr_un {
 extern "C" {
 #endif
 
-#if defined(_WIN64)
+#if defined(__aarch64__)
+/* On windows-arm64, setjmp is available in only one variant, and longjmp always
+ * does stack unwinding. This crash with generated code.
+ * Thus, we use another implementation of setjmp (not windows one), coming from
+ * mingw, which never performs stack unwinding. */
+#undef setjmp
+#undef longjmp
+/* These functions are not declared in setjmp.h because __aarch64__ defines
+ * setjmp to _setjmpex instead. However, they are still defined in libmingwex.a,
+ * which gets linked automatically. */
+extern int __mingw_setjmp(jmp_buf);
+extern void __attribute__((noreturn)) __mingw_longjmp(jmp_buf, int);
+#define setjmp(env) __mingw_setjmp(env)
+#define longjmp(env, val) __mingw_longjmp(env, val)
+#elif defined(_WIN64)
 /* On w64, setjmp is implemented by _setjmp which needs a second parameter.
  * If this parameter is NULL, longjump does no stack unwinding.
  * That is what we need for QEMU. Passing the value of register rsp (default)
  * lets longjmp try a stack unwinding which will crash with generated code. */
 # undef setjmp
 # define setjmp(env) _setjmp(env, NULL)
-#endif
+#endif /* __aarch64__ */
 /* QEMU uses sigsetjmp()/siglongjmp() as the portable way to specify
  * "longjmp and don't touch the signal masks". Since we know that the
  * savemask parameter will always be zero we can safely define these
-- 
2.30.2


