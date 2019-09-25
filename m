Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A78FBE504
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Sep 2019 20:49:50 +0200 (CEST)
Received: from localhost ([::1]:56064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDCMH-0003ix-8k
	for lists+qemu-devel@lfdr.de; Wed, 25 Sep 2019 14:49:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46972)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iDCIX-0001fl-Ey
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 14:45:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iDCIW-0004DL-HY
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 14:45:57 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:45504)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iDCIW-0004CN-Bu
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 14:45:56 -0400
Received: by mail-pf1-x42f.google.com with SMTP id y72so4134536pfb.12
 for <qemu-devel@nongnu.org>; Wed, 25 Sep 2019 11:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Cgi8cwP/kPiakDiYJkRI89bBSyLkz6ovsWz2x/LD2wI=;
 b=pEfhyXa3LMv/9lv5T4yuYVMwG0mRmtmPtjlMft6HTOfQ6SZaQQKmNcgDXBCGvpyRhY
 zR6DJxm27kK5KLsB5eEnkJD8js6yPO3Fc8W7PfqB/DGr6nTYf8L/w2kdrloIU8hhrLh9
 9Kq8U1vjAUeIgmFWq979TJz3nnkjpxZ9o3fyw7n6Xv8dIJFFG1MGsHF+U4KVuQPWFPlZ
 kZ3hGKz4X9gR4Jf7fcwNcGXyahW1nLq92gpvRg7FSA91TN9RsBKJtci0/yT5SYqsTloL
 NYWuTEFNZ8AcgS3BxnnEf9GCdfevnrfGLiAyS3MYCUZ0Ng4WQyVFJDPglySWNL1CJaWb
 nPqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Cgi8cwP/kPiakDiYJkRI89bBSyLkz6ovsWz2x/LD2wI=;
 b=WLuR6pNu1LptV8y8PRxEMHcL+jPsymJ+sSSjhwHEWwDw36dxxauAgCfWHjpjcbpdKm
 SMLfdYpAV3lgtT6nSKoGZ7bjYKn9SJn4+xoKB93L4Z9ES3rqKQlqb/A48ctTWpdEuJa/
 RA4r2XVci4djg3lQtQ7Oy8Uf6NRxPtvgQ3le5cqWr7vlgEtXqD3b2Ei5tl/JBzXGaiMH
 1c3GheJGz218ipqBkS9gB38A5HTinx0WcS4NOilkeXHA9EFYkR2+fGZEU6UuqZI6p6Wk
 eXgV1xP12N08DLwEfXqeHm15FBAimqL1MR7udGCCb5STDYT0JOj5VCv+6gM1PKlm1C3d
 HvsQ==
X-Gm-Message-State: APjAAAX6pCSZTV1zcgFy4m9n6ROcL1Oni4ry3cUEvLtoNDDOTiajq7xl
 VJhCNb1uUyt6gyk6L3j1RyZioJR2Feo=
X-Google-Smtp-Source: APXvYqypjfOipsRqMnLGbbiW+vyiEml/uhtc4kcjhdirt98IFnuhhB3TvFgqkDABy8C72mDEDzv9Aw==
X-Received: by 2002:a62:db84:: with SMTP id f126mr11647089pfg.25.1569437154916; 
 Wed, 25 Sep 2019 11:45:54 -0700 (PDT)
Received: from localhost.localdomain ([12.206.46.61])
 by smtp.gmail.com with ESMTPSA id l24sm6133229pff.151.2019.09.25.11.45.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2019 11:45:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/16] qemu/compiler.h: Add qemu_build_not_reached
Date: Wed, 25 Sep 2019 11:45:35 -0700
Message-Id: <20190925184548.30673-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190925184548.30673-1-richard.henderson@linaro.org>
References: <20190925184548.30673-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::42f
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use this as a compile-time assert that a particular
code path is not reachable.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/compiler.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
index 20780e722d..7b93c73340 100644
--- a/include/qemu/compiler.h
+++ b/include/qemu/compiler.h
@@ -221,4 +221,19 @@
 #define QEMU_GENERIC9(x, a0, ...) QEMU_GENERIC_IF(x, a0, QEMU_GENERIC8(x, __VA_ARGS__))
 #define QEMU_GENERIC10(x, a0, ...) QEMU_GENERIC_IF(x, a0, QEMU_GENERIC9(x, __VA_ARGS__))
 
+/**
+ * qemu_build_not_reached()
+ *
+ * The compiler, during optimization, is expected to prove that a call
+ * to this function cannot be reached and remove it.  If the compiler
+ * supports QEMU_ERROR, this will be reported at compile time; otherwise
+ * this will be reported at link time due to the missing symbol.
+ */
+#ifdef __OPTIMIZE__
+extern void QEMU_NORETURN QEMU_ERROR("code path is reachable")
+    qemu_build_not_reached(void);
+#else
+#define qemu_build_not_reached()  g_assert_not_reached()
+#endif
+
 #endif /* COMPILER_H */
-- 
2.17.1


