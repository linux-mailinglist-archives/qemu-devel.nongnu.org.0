Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B83E5390322
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 15:54:22 +0200 (CEST)
Received: from localhost ([::1]:48558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llXVl-0006yF-R5
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 09:54:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llXMp-0008LS-Mm
 for qemu-devel@nongnu.org; Tue, 25 May 2021 09:45:07 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:45806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llXMn-0005qL-Si
 for qemu-devel@nongnu.org; Tue, 25 May 2021 09:45:07 -0400
Received: by mail-wr1-x430.google.com with SMTP id x7so12709643wrt.12
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 06:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=81BcStrDLjfG9r2+15kQcn3KAVBeJOQ+xGFWyk9GtLs=;
 b=mNnXmVkl9xOIRNT09Y2jzBjTclNNGh83LJt9aR6ZVa92kckh/qQn1aEw8un5tCyvZx
 LEH42RBqi7crjv2jLJnsZfAiAPUzXXp6zz6QWPBogzCq8v9Mu3TNGzV45KmHXyJ7IoAE
 F65aBYc5UelvJGNdKfJyysw1b+jtCmKvetrk2BM+Mx6gT6sn5GRlqYyAc4k1dcIPtKiF
 4t7sDIGOUPJpSMR7HD2Xbi57HheuoWrvrZ8Rms3/gwpDR+cMvjMHpf17XQTgssFF9QXK
 3AOPkgh1o+fUb6cn//YEIM+AgKRO8HsxP5//vvzhjnePgz38LsPEqOdl0eE9vJaKCkal
 Tp/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=81BcStrDLjfG9r2+15kQcn3KAVBeJOQ+xGFWyk9GtLs=;
 b=WZoDDw1Qi972zASvwP0hElmCiR3Wii1RTVYqQcVmS9w2dfAcJ2iPBa7YQtZkWOQNE2
 Zq3vfqNRbXywQt2lC70A/ZgGWloHDzJr7Ztu6EOvijCg1K6USJKRaF6k9uJxU0KTk4S9
 q13NaQyTM7r4izIuVJG049uKkHfH5Zp4whIiCgAiB2MMPx1tvNEbujgceRbkv8Lyd1Ln
 VbZaiMxL2d8MvnXfGAD++i16lJysi0bt1gd6v0JaCH5RS74rEtZ614TqDcDQWzB2JDtV
 RCaihku5NE1yWcNJJB08/9ku0jCkYzAW4X30XZKEztYAt+RBOSibL75iJ6HfftRO99I0
 //tw==
X-Gm-Message-State: AOAM530yimD9QvfIUGp5H4STzK6DeE2Wmz7huD50xsFtAmTmsBKwRJP/
 6kboobOSKNZ95JnXSQ0LTPudAjYUGkkywVN9
X-Google-Smtp-Source: ABdhPJxaabybQtX6nm4vm6CDXpyqHySRzp6D4lu2mjoWRgBIWw9rpNGtfJePTLgWNcsdY2oiLcQ3lA==
X-Received: by 2002:a05:6000:22f:: with SMTP id
 l15mr27149320wrz.316.1621950304574; 
 Tue, 25 May 2021 06:45:04 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id t7sm15794460wrs.87.2021.05.25.06.45.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 06:45:04 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/6] tests/qtest/tpm-tests: Remove unnecessary NULL checks
Date: Tue, 25 May 2021 14:44:57 +0100
Message-Id: <20210525134458.6675-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525134458.6675-1-peter.maydell@linaro.org>
References: <20210525134458.6675-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Coverity points out that in tpm_test_swtpm_migration_test() we
assume that src_tpm_addr and dst_tpm_addr are non-NULL (we
pass them to tpm_util_migration_start_qemu() which will
unconditionally dereference them) but then later explicitly
check them for NULL. Remove the pointless checks.

Fixes: Coverity CID 1432367, 1432359

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/qtest/tpm-tests.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/tests/qtest/tpm-tests.c b/tests/qtest/tpm-tests.c
index 0da3a8a4df5..25073d1f9e9 100644
--- a/tests/qtest/tpm-tests.c
+++ b/tests/qtest/tpm-tests.c
@@ -123,14 +123,10 @@ void tpm_test_swtpm_migration_test(const char *src_tpm_path,
     qtest_quit(src_qemu);
 
     tpm_util_swtpm_kill(dst_tpm_pid);
-    if (dst_tpm_addr) {
-        g_unlink(dst_tpm_addr->u.q_unix.path);
-        qapi_free_SocketAddress(dst_tpm_addr);
-    }
+    g_unlink(dst_tpm_addr->u.q_unix.path);
+    qapi_free_SocketAddress(dst_tpm_addr);
 
     tpm_util_swtpm_kill(src_tpm_pid);
-    if (src_tpm_addr) {
-        g_unlink(src_tpm_addr->u.q_unix.path);
-        qapi_free_SocketAddress(src_tpm_addr);
-    }
+    g_unlink(src_tpm_addr->u.q_unix.path);
+    qapi_free_SocketAddress(src_tpm_addr);
 }
-- 
2.20.1


