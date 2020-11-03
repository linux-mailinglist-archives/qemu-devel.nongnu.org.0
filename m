Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20ACF2A4495
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Nov 2020 12:54:02 +0100 (CET)
Received: from localhost ([::1]:38696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZusz-0006pV-6q
	for lists+qemu-devel@lfdr.de; Tue, 03 Nov 2020 06:54:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kZuqQ-0004vl-A4
 for qemu-devel@nongnu.org; Tue, 03 Nov 2020 06:51:23 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:44808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kZuqK-0006q8-Sa
 for qemu-devel@nongnu.org; Tue, 03 Nov 2020 06:51:22 -0500
Received: by mail-wr1-x442.google.com with SMTP id b3so12303981wrx.11
 for <qemu-devel@nongnu.org>; Tue, 03 Nov 2020 03:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=alXfnBkR66bYup/wyv/podQcwPgcgWAs8h32oVCAplw=;
 b=ubZQwWICECpJCHxC3yc26hTVRrl7OIqQGy2eTOaMR5wHqXqgg8PkhjV9qNVOOuDmYE
 g8m4STSUCROdU/axyiRVMxIjRwj3OXZU+pcYjDO7OWjoUpmubCILKzzWHR1ctBJzTNgB
 5iIKNWsfEp+brDWa9aHtP+fZPshV5bneh1yR6dswY9L6r1XxufgpZLHgHXAMdu6bKqLX
 gbRenB+4doU2Bl42oqr5DT/LAL3uvh0E78y8K1FbVAjh/NFGnEDpCsTdzq3P6N8LHoIN
 58FgpBHekiqycywMnHwW/W0vFhga2lf08ASL9CcurdYzOfa5SPmR8ODj8dlE4PkN0qQ6
 YPlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=alXfnBkR66bYup/wyv/podQcwPgcgWAs8h32oVCAplw=;
 b=fEmaKNLaLeRVOxzg9WLj9CHeGqQUKrtTtCKyalChVwNZ2SSikAgK7OdKtwA16hZu2k
 2u7n8RiiFJ5nstSnAqTOTYagZoSsB63pzYYq63gZgsiGsgL8d7P3MNv/hgkNXoZVsCVl
 WAiHqlWGL0xfVgkYjR76dnrkEShhqU1HklejaRrYJ+FVG52ujFlDr4VksSrFA71N4fw7
 JCF3CAz2QoSn2aAA+vJaDa8aixQj7CLs9vafJCNZq/De4Rv1KPZf1Wq/xOlKVTqSl/b8
 tKWVtWWvs0Ax6bA9EAygQOAxiVqryz14SQXRDP4HqlLOxvJwnmTE+MNFsJcgq0w2PMsq
 OYMA==
X-Gm-Message-State: AOAM533pI/kZiQt15d+NYrE7y5CLgXBpZwkd/dTdtxc5lhrvIOCLsG3K
 GYwSZ8NlxW/kKX2dce7L+02f5wOTN3zFqg==
X-Google-Smtp-Source: ABdhPJysRhwHVA7XHWnjtvdZLYU3owcN7fs9Sbj8y/SNAu7aWh5gX2NRytlQ3sfdxkyU7kKb1f7a2A==
X-Received: by 2002:adf:c101:: with SMTP id r1mr24691041wre.87.1604404275196; 
 Tue, 03 Nov 2020 03:51:15 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id v19sm2568444wmj.31.2020.11.03.03.51.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 03:51:14 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/qtest/libqtest.c: Check for setsockopt() failure
Date: Tue,  3 Nov 2020 11:51:12 +0000
Message-Id: <20201103115112.19211-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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

In socket_accept() we use setsockopt() to set SO_RCVTIMEO,
but we don't check the return value for failure. Do so.

Fixes: Coverity CID 1432321
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/qtest/libqtest.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 99deff47efc..be0fb430ddd 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -110,8 +110,13 @@ static int socket_accept(int sock)
     struct timeval timeout = { .tv_sec = SOCKET_TIMEOUT,
                                .tv_usec = 0 };
 
-    setsockopt(sock, SOL_SOCKET, SO_RCVTIMEO, (void *)&timeout,
-               sizeof(timeout));
+    if (qemu_setsockopt(sock, SOL_SOCKET, SO_RCVTIMEO,
+                        (void *)&timeout, sizeof(timeout))) {
+        fprintf(stderr, "%s failed to set SO_RCVTIMEO: %s\n",
+                __func__, strerror(errno));
+        close(sock);
+        return -1;
+    }
 
     do {
         addrlen = sizeof(addr);
-- 
2.20.1


