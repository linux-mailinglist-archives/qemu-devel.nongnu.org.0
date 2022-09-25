Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 916B05E92E9
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 14:03:22 +0200 (CEST)
Received: from localhost ([::1]:40372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocQLx-0007Zg-Kx
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 08:03:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPrl-00036A-5M
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:32:09 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:47071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPrh-0006Q7-Cp
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:32:08 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 j6-20020a17090a694600b00200bba67dadso4287893pjm.5
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 04:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=HHmHosbI1UH5JFaYMLGsioCy3QztSrpxpXb6IzEKUQo=;
 b=qLFQ3sHXskR5B9tl/idxnNA1zpDCypNl3tIv7EP5aZO2Bp/akPl/1KXfX9z64CuAfU
 PFINAf9ti1QO9rb7NsdUgZGNDwW6T+F1Vzz1wKOlcXEYzxoZqnvsmz5PRz/WBNQNib8J
 dQmRgeNyzPyjeWcxpyiUS5DYopc86WF1IyBoNQrXahuRzAG+Ncgx/25RwP8wmJuvp27U
 z6yruD1hD1XqMkrIux/2Btp9+y80ATx08kFNEeFBBc0kN0/VR2VeRreslDUg0AFLKM1p
 z7x3XaHGSjug3SnX9lycgLXRSO+Zz/HIo+KgeOj/SxVb1j+rolXw28dlzBjhY69SOJ7H
 56Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=HHmHosbI1UH5JFaYMLGsioCy3QztSrpxpXb6IzEKUQo=;
 b=Ihz/INeIK9CU6/Rxp+cgUXhkE6H0YvtAY++texGMkCGMC5n6/HigGxVK6pufvg86Yi
 xTLeF0/V3kiFq2c7+T/cal2Hd1t467hIZlwJa2K8Oo3zNqIHPvD01wJSTavOjICySJeG
 Qv8F6lh72wrL6K86iY2vDb0j/G1i1bXE4WImoeG8T3mdalCCEp0EDIR7PJSrv8vZsQ9c
 tIMriGSCL+/nRXLmWJrrDq/MfZsV9JXqTrrVBoDne34+XQen83KDRhmsZ7PbCh6BjjBV
 mHOqjBXYKDQORQG4qEcX1qAV2DjQoZNgpqAtIV5UqS/oDILXmQCN1k7J3XOwM8HvLd7a
 t0oQ==
X-Gm-Message-State: ACrzQf18JeTbi4tDpIWqhnDibu47BCdukGB9Y0Wnmj5lUOUTW8oioKbC
 hOlzQCbzX2grydF3h8lkudDZVE2JiaA=
X-Google-Smtp-Source: AMsMyM6dTmGCBh6m/dzWze3nAQ4PaIFObuO1BK1qirUlu1E/Yn2frQsCUGgHHG4TO1EN1TAsnEfPYw==
X-Received: by 2002:a17:90a:e552:b0:203:627b:6c6e with SMTP id
 ei18-20020a17090ae55200b00203627b6c6emr19053956pjb.59.1664105523560; 
 Sun, 25 Sep 2022 04:32:03 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a1709027e8400b00176c6738d13sm9187760pla.169.2022.09.25.04.32.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 04:32:03 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3 32/54] tests/qtest: libqtest: Adapt global_qtest
 declaration for win32
Date: Sun, 25 Sep 2022 19:30:10 +0800
Message-Id: <20220925113032.1949844-33-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925113032.1949844-1-bmeng.cn@gmail.com>
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

Commit dd2107497275 ("tests/libqtest: Use libqtest-single.h in tests that require global_qtest")
moved global_qtest to libqtest-single.h, by declaring global_qtest
attribute to be common and weak.

This trick unfortunately does not work on Windows, and building
qtest test cases results in multiple definition errors of the weak
symbol global_qtest, as Windows PE does not have the concept of
the so-called weak symbol like ELF in the *nix world.

However Windows does provide a trick to declare a variable to be
a common symbol, via __declspec(selectany) [1]. It does not provide
the "strong override weak" effect but we don't need it in our use
case anyway. So let's use it for win32.

[1] https://docs.microsoft.com/en-us/cpp/cpp/selectany

Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

(no changes since v2)

Changes in v2:
- Use __declspec(selectany) for the common weak symbol on Windows

 tests/qtest/libqtest-single.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/qtest/libqtest-single.h b/tests/qtest/libqtest-single.h
index 4e7d0ae1dc..851724cbcb 100644
--- a/tests/qtest/libqtest-single.h
+++ b/tests/qtest/libqtest-single.h
@@ -13,7 +13,11 @@
 
 #include "libqtest.h"
 
+#ifndef _WIN32
 QTestState *global_qtest __attribute__((common, weak));
+#else
+__declspec(selectany) QTestState *global_qtest;
+#endif
 
 /**
  * qtest_start:
-- 
2.34.1


