Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8F53D690F
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 23:54:16 +0200 (CEST)
Received: from localhost ([::1]:36642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m88YB-0000JK-5o
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 17:54:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m88S0-00039s-8W
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 17:47:52 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:34430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m88Ry-0006Fx-Pb
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 17:47:51 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 b1-20020a17090a8001b029017700de3903so1084650pjn.1
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 14:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QxBjgCMLIKAw85vE8mpb69QJsoP7x3luF33C4fQ6fGY=;
 b=tw0GFODHjjeT/CubWiaPClxZa9EegPJxFDwyEjPeUxAAf8YICDKMyBZp95OcZ7d6Kf
 d30tMCl5UcUIKmLOFT9ImokFLSAF5qQ1LRrJEgCF+XIqJXzUJ3olEOdRLHRoNIQljgYE
 xmQ9YYNLe8kbFsJ/QHsdJPfNzcpCnGrLfNA/vNeBcEbQI/IgFjTOfp2DwBSYiPalZJCh
 NR5+h/+zNPyp27hcSvNuXNfys5nNY+EnSqb48PYMQS1d+GaNp+RsaifneqJYPw41rV/X
 2ksD7IEKBGRqqyhFchEKAPCa71+MexMianq0VXT8V4x7gHbUw1urLanhlZyDoXXyOH+5
 JB0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QxBjgCMLIKAw85vE8mpb69QJsoP7x3luF33C4fQ6fGY=;
 b=amUlJDBCLyIqRNBHWCamEMDZ5VDo3gHDLMg+uMolv5HH5qloZIq8iH4/cvB6+G3O28
 aYz8m1dd/06KMEXirV3/qcQ4/YQYcLta+tWz+kIIu/p3nz0GkFFLDbZcc+xEWbuG+s3M
 GOTON1uSZBsTw+Pe6HfsvzPuNJziFEfv/sp17mCFEjK6ohrWgUPf2NtVHSAOlDZXH7wQ
 YhzxYOi+fUCerEUQ0+0c7nLPgWAu5boe9fsI+opvSuJk4B52hqZ+wOUhIGBxgRH3vGGV
 2EC0jzwshJJ60b0oFRGGACzA1uDZarSLKKj0i1U9f9yFSL+CtGxGbr0tNEz7DRvOlK4k
 IxcA==
X-Gm-Message-State: AOAM533PsWqoM/C2ds4P/0KnjHpFl02d/JZskw5LNjqft4MCjj3B6WT5
 ScmZLkEP4XyzFPDlzAVaSHlhWAGw55U3iQ==
X-Google-Smtp-Source: ABdhPJyHFDUpzhZTBFT/1oUcewccLwtjeK9tYqb60Z+KJfgps4Gxq96OJv1Jyk1DFaBNz/LIJ3TVlQ==
X-Received: by 2002:a17:903:2445:b029:12b:9d0e:6b97 with SMTP id
 l5-20020a1709032445b029012b9d0e6b97mr16170274pls.84.1627336069486; 
 Mon, 26 Jul 2021 14:47:49 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-497b-6ae4-953c-7ad1.res6.spectrum.com.
 [2603:800c:3202:ffa7:497b:6ae4:953c:7ad1])
 by smtp.gmail.com with ESMTPSA id e8sm997679pfm.218.2021.07.26.14.47.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 14:47:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL for-6.1 12/12] tests/unit: Remove unused variable from test_io
Date: Mon, 26 Jul 2021 11:47:29 -1000
Message-Id: <20210726214729.2062862-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210726214729.2062862-1-richard.henderson@linaro.org>
References: <20210726214729.2062862-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From clang-13:
tests/unit/test-iov.c:161:26: error: variable 't' set but not used \
    [-Werror,-Wunused-but-set-variable]

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/unit/test-iov.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/tests/unit/test-iov.c b/tests/unit/test-iov.c
index 9c415e2f1f..5371066fb6 100644
--- a/tests/unit/test-iov.c
+++ b/tests/unit/test-iov.c
@@ -158,7 +158,7 @@ static void test_io(void)
 
     int sv[2];
     int r;
-    unsigned i, j, k, s, t;
+    unsigned i, j, k, s;
     fd_set fds;
     unsigned niov;
     struct iovec *iov, *siov;
@@ -182,7 +182,6 @@ static void test_io(void)
 
     FD_ZERO(&fds);
 
-    t = 0;
     if (fork() == 0) {
        /* writer */
 
@@ -201,7 +200,6 @@ static void test_io(void)
                    g_assert(memcmp(iov, siov, sizeof(*iov)*niov) == 0);
                    if (r >= 0) {
                        k += r;
-                       t += r;
                        usleep(g_test_rand_int_range(0, 30));
                    } else if (errno == EAGAIN) {
                        select(sv[1]+1, NULL, &fds, NULL, NULL);
@@ -238,7 +236,6 @@ static void test_io(void)
                    g_assert(memcmp(iov, siov, sizeof(*iov)*niov) == 0);
                    if (r > 0) {
                        k += r;
-                       t += r;
                    } else if (!r) {
                        if (s) {
                            break;
-- 
2.25.1


