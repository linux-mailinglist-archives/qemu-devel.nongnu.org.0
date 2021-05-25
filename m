Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E523902BC
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 15:46:56 +0200 (CEST)
Received: from localhost ([::1]:56130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llXOZ-0001P9-Mq
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 09:46:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llXMo-0008Is-Tj
 for qemu-devel@nongnu.org; Tue, 25 May 2021 09:45:06 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:46732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llXMm-0005pG-En
 for qemu-devel@nongnu.org; Tue, 25 May 2021 09:45:06 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 l18-20020a1c79120000b0290181c444b2d0so6305330wme.5
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 06:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RpRDsEnH95uu+Ux7JoRWYhEj5tQ2gOOA0yIZFo57BOg=;
 b=W40VC2fawI+d3LnIVU+rEmwAJr/Yuo6ucm4nj4cQCLFEdt0wFz0odfWqROGgASmE9f
 RpPtZXS6OIpIvL0/AxNu49WmbX/nE1dqv4fj22V1yrBRqB0PbLev5Ql46xrajcEYuheb
 Ur0o8y+WILMlltHMqtC57tLiXE7td//WD1un2E0DLUi6h6Q6chOyLig9Qbp7HA0etTab
 5ybvCmmAD014zry3iq8IK9RX/XIZCOt1gD5Xmybk+K2Bu9Je0vy4KAWStNRcDwx9YzBo
 DUcbgOyGDEUpF9AU7aATXi/6m5MD3Yq53noImoLYpkK5/i2bLxbQtzx1hlhp3H4doepO
 sY/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RpRDsEnH95uu+Ux7JoRWYhEj5tQ2gOOA0yIZFo57BOg=;
 b=PXc344NR1iw3s1SwN1l2i1cVTltsVqnae7zaNW2Mi9vnX1aHAm8xfI4Y51EVcHa4B5
 sK+BGbstawoE7bQbFCFB+Tf2EtVfYwVSxxRnW+uxRW8ArKUirm/8qvNzMp2R47r4osmg
 KXsuP2SggmzXPckASRTu2TBE76dyAhaw875GAAnhK4+HOPbhvDqg0imo9arBNlF79MHz
 QQvrIOA5seeSBFiBf9XyGdqwvTXY2XTAGJoXyt93OTx+0MC3aF8aKp0Vk1I1yI3vQyod
 KPWDj2Lcn4PdYWukLaKqOBUuR0nxePP3hzdl6nQcEyWhRGGF3TRYzr6IQ0j+UALRpbG3
 HJ+w==
X-Gm-Message-State: AOAM533vuP6p3Uu/14+s4ngn+l9YT62dYbaipI5vGOKn0s7QUXEQfI6H
 XSip9bten0nde0UmUewvCSBX+mfE+qh9Um/N
X-Google-Smtp-Source: ABdhPJzoeU1s95DkZHOsmtIt5XyIv6KfoX5ApR6vYY3VkvJ0q2Inqy5yvV1bsAnXIhaSMcQFmlKTRw==
X-Received: by 2002:a1c:b702:: with SMTP id h2mr24111618wmf.99.1621950302831; 
 Tue, 25 May 2021 06:45:02 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id t7sm15794460wrs.87.2021.05.25.06.45.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 06:45:02 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/6] tests/qtest/hd-geo-test: Fix checks on mkstemp() return
 value
Date: Tue, 25 May 2021 14:44:55 +0100
Message-Id: <20210525134458.6675-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525134458.6675-1-peter.maydell@linaro.org>
References: <20210525134458.6675-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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

Coverity notices that the checks against mkstemp() failing in
create_qcow2_with_mbr() are wrong: mkstemp returns -1 on failure but
the check is just "g_assert(fd)".  Fix to use "g_assert(fd >= 0)",
matching the correct check in create_test_img().

Fixes: Coverity CID 1432274
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/qtest/hd-geo-test.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/hd-geo-test.c b/tests/qtest/hd-geo-test.c
index f7b7cfbc2d1..113126ae06c 100644
--- a/tests/qtest/hd-geo-test.c
+++ b/tests/qtest/hd-geo-test.c
@@ -464,7 +464,7 @@ static char *create_qcow2_with_mbr(MBRpartitions mbr, uint64_t sectors)
     }
 
     fd = mkstemp(raw_path);
-    g_assert(fd);
+    g_assert(fd >= 0);
     close(fd);
 
     fd = open(raw_path, O_WRONLY);
@@ -474,7 +474,7 @@ static char *create_qcow2_with_mbr(MBRpartitions mbr, uint64_t sectors)
     close(fd);
 
     fd = mkstemp(qcow2_path);
-    g_assert(fd);
+    g_assert(fd >= 0);
     close(fd);
 
     qemu_img_path = getenv("QTEST_QEMU_IMG");
-- 
2.20.1


