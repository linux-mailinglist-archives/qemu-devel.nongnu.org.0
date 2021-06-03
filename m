Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F6939A5A2
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 18:20:47 +0200 (CEST)
Received: from localhost ([::1]:56334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loq5N-0003lT-Ts
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 12:20:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopl8-0001z9-5T
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:50 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:34478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopl6-0007K5-AI
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:49 -0400
Received: by mail-wr1-x429.google.com with SMTP id q5so6407880wrm.1
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 08:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ppBM5sB9swc2F+kqmAJujcvoKiiJMssttgA/rEBYgGw=;
 b=CwNIqLZXIQC31giBISFJAPVPjZYJgWg00bwsxWqB5pMhs9qj/0AOD4pDigXdFliqeN
 lofXGTqGMreH8z11gaN0QL2ubvJZdvKPsw2gRqSun8RgbZl7AzIAz5FKoeJkfdaukUQ2
 aCIYOGvPRdUhvKAhZh4WsCai/N5egwAnDsWa0Q9ccCHV+HfvIkKH1ICfIR6cbzZXBVtV
 Os0ovdad/Xt0tKYQSdkYVa9toDT7xRB4wy/PRn9TCZD6Sr3Jdr9vDUdICPibREjiWkM0
 3UfRQXtBqjR9Mpth7tS1IH3phhTHlKGCj5sP2UWTnaEgRQIcG/dTQ0SHIMjT1IvjvsJF
 eBBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ppBM5sB9swc2F+kqmAJujcvoKiiJMssttgA/rEBYgGw=;
 b=QdiruyQYh4+beAyQt6k4v2Xfn1vdBaaBc6+DVV5OJdHZ68o7Lxw0lgG6K8soWBDDxH
 Qq1LR5wPCtkDmUR4vHyvPEF9AJuKIKEzCcNGXq8jpgIacgnHfE2W0VUWK8vwXRzzDbm0
 CxjQbLUVImmkXCBB90MhpcdjCMUwEA51XMewe8RkFnCjk+xukshntcdXyJHoBtwbYTMg
 5H7OFRmNYVKN6vxij8kBCRHK/A0I8y7rUjZW1EYfyxlKwduEGOE6lP44KeQsomx4iBFm
 VcyHOkUMp46qaU+EzCb8vacLGK8PKsY+QeoQXJFEfbcSAAFi531Wv00LTICIXungQZCD
 Ngxw==
X-Gm-Message-State: AOAM530nTRZtvtYzoBgSUpIeq2U4F9LLiPGHD9VUxeeMrutKdbMnIcm4
 x4hKegwYkuJKxdCpTS9tojdi7uwKziRkYvmK
X-Google-Smtp-Source: ABdhPJyg1V+g/rkvxFFlNSww61TGh8ArJRyiSL87s479QaBBd6k878ETSWu8RfbJk4igc41/+Lqllw==
X-Received: by 2002:adf:f90c:: with SMTP id b12mr647307wrr.409.1622735987065; 
 Thu, 03 Jun 2021 08:59:47 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m7sm3856470wrv.35.2021.06.03.08.59.46
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 08:59:46 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 41/45] tests/qtest/e1000e-test: Check qemu_recv() succeeded
Date: Thu,  3 Jun 2021 16:59:00 +0100
Message-Id: <20210603155904.26021-42-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210603155904.26021-1-peter.maydell@linaro.org>
References: <20210603155904.26021-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

The e1000e_send_verify() test calls qemu_recv() but doesn't
check that the call succeeded, which annoys Coverity. Add
an explicit test check for the length of the data.

(This is a test check, not a "we assume this syscall always
succeeds", so we use g_assert_cmpint() rather than g_assert().)

Fixes: Coverity CID 1432324
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Message-id: 20210525134458.6675-3-peter.maydell@linaro.org
---
 tests/qtest/e1000e-test.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/e1000e-test.c b/tests/qtest/e1000e-test.c
index fc226fdfeb5..0273fe4c156 100644
--- a/tests/qtest/e1000e-test.c
+++ b/tests/qtest/e1000e-test.c
@@ -93,7 +93,8 @@ static void e1000e_send_verify(QE1000E *d, int *test_sockets, QGuestAllocator *a
     /* Check data sent to the backend */
     ret = qemu_recv(test_sockets[0], &recv_len, sizeof(recv_len), 0);
     g_assert_cmpint(ret, == , sizeof(recv_len));
-    qemu_recv(test_sockets[0], buffer, 64, 0);
+    ret = qemu_recv(test_sockets[0], buffer, 64, 0);
+    g_assert_cmpint(ret, >=, 5);
     g_assert_cmpstr(buffer, == , "TEST");
 
     /* Free test data buffer */
-- 
2.20.1


