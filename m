Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E0D652683
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 19:46:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7ghQ-0003Kw-7o; Tue, 20 Dec 2022 12:46:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p7ghP-0003Kg-2A
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 12:46:43 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p7ghN-00005k-HA
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 12:46:42 -0500
Received: by mail-wm1-x332.google.com with SMTP id ay40so9325981wmb.2
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 09:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wFikyosjlVj+KI769mCTL7Gw6h5RtUTnkPfi/ObNwEY=;
 b=UianpQAXg6/7EdW92ZSFEXtF4/lRoAXukkYEa66VVXxvrMhsZq7ZFklhs38cMmlRPl
 BXsYx1djefVXmKQV3qUsg5M5RbBiyyXdDsKMgvlgHDp6yvvo+RzjE4Ps678wdLA7OAj1
 63FP1Qo+ukRimrwfPzcAyed/4L6PD4c/1qWJ/GvWgboyTe6Ny7Mk27jgTzGzLXsI0VGe
 JZYGM//0yUEASB7ruPiwNq/3/sMC0EoADhvX34v0cWVhgaKYoX1kKv9cj8UHoillq3Hw
 B0mbK00yNFH3T94eEbcF0893t2DW+a5EMLggmqGO5f8mb2swza6R0w5jj2eepB1Kb4J6
 MfkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wFikyosjlVj+KI769mCTL7Gw6h5RtUTnkPfi/ObNwEY=;
 b=xCCiwjg+aVNmSHeLMfWVKqNkaUBrnhx1xNf8qQma/Ss+WQjzduu5S5yHOusITkLWwS
 P7WUvJRj9kKBUeFCcRK44efWGHbAX14LTVTRtA7zmlJweQW4/PlxZJ1hgMcHvf0Rp0WT
 xpbBa1lKGB3IsMR66jTOSjvkSS3p6kEOAx6CnwsDtAlOpebCQrEMbxEX/2Lj8czImoJm
 xVFhsIH4xahhlfyI3e723TWcebGd2Ku0yJ84syQO5AacFeLAPvEjJJRs1Db6pRd6tgP7
 aksYgL6Er7s58vyBdn5CczVNK14l5NA9a8DUzyYdI+GotMA5JZU9Qa65eTB6JvGhXq1u
 6GKg==
X-Gm-Message-State: ANoB5pmPGzRPgJ8f6XG+vdb9y2ycM/0YQq3L+I25sJ/98j5Bmcfl5wJu
 3gKYkusEs54kwrFefd9hgSVHWVa5OpfqmrpP
X-Google-Smtp-Source: AA0mqf5bYX2AGLz34ivI3YvCDdmlgJrcglgL6oULcv+0+tOpz9f34Ol0JpD2rks0iM7Y2BKGahdtOA==
X-Received: by 2002:a05:600c:3c9a:b0:3c6:c6c9:d75e with SMTP id
 bg26-20020a05600c3c9a00b003c6c6c9d75emr48053386wmb.0.1671558400080; 
 Tue, 20 Dec 2022 09:46:40 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f22-20020a05600c43d600b003cf6e1df4a8sm15998512wmn.15.2022.12.20.09.46.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 09:46:39 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fabiano Rosas <farosas@suse.de>
Subject: [PATCH] block/io: Check for replay-enabled in bdrv_drain_all_begin()
Date: Tue, 20 Dec 2022 17:46:38 +0000
Message-Id: <20221220174638.2156308-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

In commit da0bd74434 we refactored bdrv_drain_all_begin() to pull out
the non-polling part into bdrv_drain_all_begin_nopoll().  This change
broke record-and-replay, because the "return early if replay enabled"
check is now in the sub-function bdrv_drain_all_begin_nopoll(), and
so it only causes us to return from that function, and not from the
calling bdrv_drain_all_begin().

Fix the regression by checking whether replay is enabled in both
functions.

The breakage and fix can be tested via 'make check-avocado': the
tests/avocado/reverse_debugging.py:ReverseDebugging_X86_64.test_x86_64_pc
tests/avocado/reverse_debugging.py:ReverseDebugging_AArch64.test_aarch64_virt
tests were both broken by this.

Fixes: da0bd744344adb1f285 ("block: Factor out bdrv_drain_all_begin_nopoll()")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Thanks to Fabiano for doing the bisect on this.
---
 block/io.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/block/io.c b/block/io.c
index d87788dfbbf..a09b1b34abf 100644
--- a/block/io.c
+++ b/block/io.c
@@ -506,6 +506,15 @@ void bdrv_drain_all_begin(void)
         return;
     }
 
+    /*
+     * bdrv queue is managed by record/replay,
+     * waiting for finishing the I/O requests may
+     * be infinite
+     */
+    if (replay_events_enabled()) {
+        return;
+    }
+
     bdrv_drain_all_begin_nopoll();
 
     /* Now poll the in-flight requests */
-- 
2.25.1


