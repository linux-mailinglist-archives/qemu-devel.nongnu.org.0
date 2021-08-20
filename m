Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CEF3F3192
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 18:39:12 +0200 (CEST)
Received: from localhost ([::1]:34798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH7Xz-0005zy-MP
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 12:39:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mH7Wm-00052e-DN
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 12:37:56 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:34397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mH7Wk-0001Ow-3e
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 12:37:56 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 v20-20020a1cf714000000b002e71f4d2026so1646970wmh.1
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 09:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gHSKMIr3DXymHcQf23ga3m0DhtBqLhGv0jmkwxAjHpM=;
 b=OyGfJlD6YTKM3WOPFo2hCwT0tPbOdzvhkxF12dBT3+qmlQoPUETSQPGNCcNCx1tm4E
 Svf4nswRe1Q/MLVCYtFBueInxZeEzKqPyKn9PfkWE2mzf718YA0QPizjwonAW1pTSX8W
 Fsw7LltQ4eZPOF3NQdJGkFV2he9TRGKk6OT2zgdps9rq8BP6EDdwOo7EF31toyGhZxz7
 nNrZO4BxQ/wRTvd//PimAOAZgKTIYNgJXHnY90/fANAbFL+3jOO24ciTZetY4CKE24qn
 dknE5L5hoDhyc8UnQfYFIch3ug1o4LWmE98wCFjvxwx6b98n7Ot2xcS9Op1bmDFTscQi
 OEvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gHSKMIr3DXymHcQf23ga3m0DhtBqLhGv0jmkwxAjHpM=;
 b=OCYgNCCPz3DMPUDVOVzeQxuRcZawzFGhJXgaXjpgf6TUO0IlM0UaLHNLrtC6i26AR4
 wpUN8aFDKfxF00H2KLlARfQmsKtnJ4W6lKPOQw84q28dNtHatBmmWXF1DDWOSopFXVEQ
 9JS7dwtMTeRYohGqQCiFGb4r0e/4Cy6xnoEKw3t88KXzKfehKFwkEClUKvcdFClhcSEU
 4sWikvJulZ9DsT4yXOL0eWkvyAmQGoMsJMSn67dck0NH29NJJuQHxoQUXiEudbgP4deI
 /q/XCsBSuvkZwarQGrJdES0ODyAPLn/cqP3Zr40EBQJTrM+bMTk6LMYESchwJ3ccyEBn
 t0zg==
X-Gm-Message-State: AOAM530mN8WIpCPQh9Yl/M/ebLmRHXgYOoXe+5Dro8CNwW6TxHPzfCOd
 bRn7NwQvJqJS62njyaPNCNdPQwdp05m+fQ==
X-Google-Smtp-Source: ABdhPJwgFhVwWXryUmz1HU3qlCHWOiDA5yW0QAdcf1/xcfoRg3zVxr02Af2RSEd20S1pClBA1YCwaA==
X-Received: by 2002:a1c:40c:: with SMTP id 12mr4820683wme.158.1629477472209;
 Fri, 20 Aug 2021 09:37:52 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id r1sm6586232wrt.24.2021.08.20.09.37.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 09:37:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] libqtest: check for g_setenv() failure
Date: Fri, 20 Aug 2021 17:37:50 +0100
Message-Id: <20210820163750.9106-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

g_setenv() can fail; check for it when starting a QEMU process
when we set the QEMU_AUDIO_DRV environment variable.

Because this happens after fork() reporting an exact message
via printf() is a bad idea; just exit(1), as we already do
for the case of execlp() failure.

Fixes: Coverity CID 1460117
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/qtest/libqtest.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 825b13a44c7..73f6b977a66 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -301,7 +301,9 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
     s->expected_status = 0;
     s->qemu_pid = fork();
     if (s->qemu_pid == 0) {
-        g_setenv("QEMU_AUDIO_DRV", "none", true);
+        if (!g_setenv("QEMU_AUDIO_DRV", "none", true)) {
+            exit(1);
+        }
         execlp("/bin/sh", "sh", "-c", command, NULL);
         exit(1);
     }
-- 
2.20.1


