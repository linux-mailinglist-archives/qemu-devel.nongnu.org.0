Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C31933FD850
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 13:00:28 +0200 (CEST)
Received: from localhost ([::1]:50322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLNyl-0006mA-RZ
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 07:00:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNcL-00076T-4y
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:17 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:34516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNcI-0005pA-H8
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:16 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 v20-20020a1cf714000000b002e71f4d2026so3499024wmh.1
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 03:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=+kXhFUWLQCA6qo5Trwr0Tjft3elFXFhPwM9yjPGmMdQ=;
 b=guE/YLgfckOMifOMAbujoeU4g74ijB+/37fn72gGMxFHo0AjiXQTew6rBRjB8PLF+r
 L6lvJLIn3n7dAePHJOAkx53WrUcgLXXZ28rph71lvqtBsMDxHQTttCrCZxDMp4npH0up
 fq7zWBncAqVy35RGWw+9tSMMHrETBH/e5aPZQllXVEAc/YvhSNIKbzPe3jyoAafOVgSj
 oGr4V402+JzFjVWu9hELbBCPI9iG7qqpzUbncMmPGoiCXJRf8XTpY8vQuNTaYxQ0iIbY
 At1YZP4sNWuy9FnmMe0FfuiKkXpF46f3MZnc5HlTV0dmN7bRtn72+ncjL9t0AC9upxl7
 Zk3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+kXhFUWLQCA6qo5Trwr0Tjft3elFXFhPwM9yjPGmMdQ=;
 b=pFOl0zrjkGsyM8f0K/7rCXxD51YVx6dInuyvBm8v4o4aYDKcHLkYi1Ezup8xFka5rB
 gSIEFBIB4kHj3q9jXLDw3VOZw/mvMtbJPdw+2n91wIMI1EMYBJIU3xBGjlUPiRAkalfn
 lF/BSzUwrGeYshugcwRN08On0QKs07QjrTjJcrjVfWX0icpDp/j5bZwHLNICNzRUYgRX
 7EezDjFma3AVXyAyqgCKx74pWJbcukWPb+reaJAACni+IyuE4iXZU/G04OIjXkqKYCmo
 lU89ds5lbGyK7mC/nrUW2wjfG8HIyv5tWSeXwJl38I0PaCALAnDpu+soRGwRpKjx7MSF
 e9fQ==
X-Gm-Message-State: AOAM5316GUp7/V7ONFJgW/oV5oZG6sIv2wZTDGagJ9r0uVpBx5AaJkiP
 VEa2jctEbvBjjjJBs0YzEpp61KSPbPwh6A==
X-Google-Smtp-Source: ABdhPJw/FXD1lIQYCZs91Kmu7yQJaTFGb0M87WZFgj0R6GmDG5GRTgeGdgAIhEqxxD5mwbN6KNL/kg==
X-Received: by 2002:a1c:1dcc:: with SMTP id d195mr9204958wmd.85.1630492632618; 
 Wed, 01 Sep 2021 03:37:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j207sm5494771wmj.40.2021.09.01.03.37.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 03:37:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 25/51] hw/arm/virt: target-arm: Add A64FX processor support to
 virt machine
Date: Wed,  1 Sep 2021 11:36:27 +0100
Message-Id: <20210901103653.13435-26-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210901103653.13435-1-peter.maydell@linaro.org>
References: <20210901103653.13435-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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

From: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>

Add -cpu a64fx to use A64FX processor when -machine virt option is
specified.  In addition, add a64fx to the Supported guest CPU types
in the virt.rst document.

Signed-off-by: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/virt.rst | 1 +
 hw/arm/virt.c            | 1 +
 2 files changed, 2 insertions(+)

diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
index 59acf0eeafa..850787495be 100644
--- a/docs/system/arm/virt.rst
+++ b/docs/system/arm/virt.rst
@@ -55,6 +55,7 @@ Supported guest CPU types:
 - ``cortex-a53`` (64-bit)
 - ``cortex-a57`` (64-bit)
 - ``cortex-a72`` (64-bit)
+- ``a64fx`` (64-bit)
 - ``host`` (with KVM only)
 - ``max`` (same as ``host`` for KVM; best possible emulation with TCG)
 
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index dbb77b59974..73e9c6bb7cb 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -200,6 +200,7 @@ static const char *valid_cpus[] = {
     ARM_CPU_TYPE_NAME("cortex-a53"),
     ARM_CPU_TYPE_NAME("cortex-a57"),
     ARM_CPU_TYPE_NAME("cortex-a72"),
+    ARM_CPU_TYPE_NAME("a64fx"),
     ARM_CPU_TYPE_NAME("host"),
     ARM_CPU_TYPE_NAME("max"),
 };
-- 
2.20.1


