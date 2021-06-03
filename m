Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE3139A5A5
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 18:21:28 +0200 (CEST)
Received: from localhost ([::1]:58150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loq63-0005DH-Fr
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 12:21:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopl9-00025r-Vd
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:52 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:44927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopl8-0007L6-5G
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:51 -0400
Received: by mail-wr1-x434.google.com with SMTP id f2so6355912wri.11
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 08:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=vB763nEKsycGOOwLmyzgDlOyxRqYkf2isox8y68EQSM=;
 b=aFdQZPAafVJ3tE4CfQnuCqfHiJPS4te81ibLEMCbl2tTO2YhzxK5Yu/HWFXqPGQvn1
 YFXN9Tl/w20mtLarPQ1KqAsFac5cdcRh9q17jUNMsPhk6XKq8zhKGocJ7EChRk8sHN0d
 PaaMWLxInMI6bLvXMAPpE/EZckFtDBgI4Rx1vcne9ixZmLvMH+iN0h7K0E14zAd5opct
 /S+pdL5wpu7D+1/VIPcbsFM9bbGR9Vy9L4bUFHhGvIMUXYiu+37SByTTCH04l4PlSv+G
 fKKm5224tpLFRhLAi6Li4rlGLlGKP7IrXBPMfj1zPwMjRggb6H+mHC2E8dAuWgsdZ7rO
 rPTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vB763nEKsycGOOwLmyzgDlOyxRqYkf2isox8y68EQSM=;
 b=MtChFSoUJ2H5geDqPlBxa8ceNbmNMkLfgvovxpj/Cyo3enTLxm4dgcoSvp2nY9VE8J
 7Y7NUIQLEyDp+mSsXAQHqIYpYQscihOe8m5AqGaJ7I25/w4dUnnT1WbIucCIQ4StHEug
 mmmWlZ6ntMCnL4vqeyWTqbhzSq9K6P3y+Z492RqgHyuXoRozHE9pzm60QLMJPe1KZpOJ
 /FlQqK9hS04pfS20xAj8fXjU45ozSe0/75CpkLKwzFLsdGbVK3qIp63baEqbfFWOK6qz
 ajrMk8TICLvGKyCN3NJaq2O2iBtP5ZuwW6IFmKOMwFOtUbRui9S4LCuuMDNiFPKUnVb/
 nw5w==
X-Gm-Message-State: AOAM531KnAW308yR/f/0pEUIkzl14chytNPPK9u3sr85zeIrNO8M697Z
 UmqqG7YfyNOtC2S+Xn34Qq9wTpG7pMnHKeSI
X-Google-Smtp-Source: ABdhPJwMruFbzwJPbRETIoZlAbGkOL3oHCVIwH4SsRplAoHOLPYAmZnhYvCmGuz0ClADpHIGHBL1jw==
X-Received: by 2002:adf:dcc3:: with SMTP id x3mr617244wrm.177.1622735988907;
 Thu, 03 Jun 2021 08:59:48 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m7sm3856470wrv.35.2021.06.03.08.59.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 08:59:48 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 44/45] tests/qtest/tpm-tests: Remove unnecessary NULL checks
Date: Thu,  3 Jun 2021 16:59:03 +0100
Message-Id: <20210603155904.26021-45-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210603155904.26021-1-peter.maydell@linaro.org>
References: <20210603155904.26021-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Coverity points out that in tpm_test_swtpm_migration_test() we
assume that src_tpm_addr and dst_tpm_addr are non-NULL (we
pass them to tpm_util_migration_start_qemu() which will
unconditionally dereference them) but then later explicitly
check them for NULL. Remove the pointless checks.

Fixes: Coverity CID 1432367, 1432359

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Message-id: 20210525134458.6675-6-peter.maydell@linaro.org
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


