Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A66A3162FA
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 10:57:42 +0100 (CET)
Received: from localhost ([::1]:47630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9mFh-00068K-2e
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 04:57:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l9mD9-0004iR-Th; Wed, 10 Feb 2021 04:55:04 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:41704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l9mD2-0003QQ-AQ; Wed, 10 Feb 2021 04:55:03 -0500
Received: by mail-ed1-x535.google.com with SMTP id s5so2153572edw.8;
 Wed, 10 Feb 2021 01:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v4qw1U6KDYBOjshkawxBVwQdC+CSvskLF9qpiBI1bac=;
 b=EfJk2UEbC7VEW/T5nuqodA/k7ynZ1xtM1WyfXOTWN/rhrZ9HrMy2udoppHwwU5nd5r
 XgI4K7qUtnw/ZY9TXtJb+voORJ7ngsB1WVK8ySBPqqqJ3EDYHCf0s5y61QFecrW7aI5r
 K1fwyvivHq0IExK/+kd7Fe3rSXMQ37rDZOyttX+vvEdYhiCBkBpa3P/C7eA9SHcqTat2
 nh1K4PcoFdjtWTHELt4lKhOCl7j689ghOFkqANwJcJaGmj3gm8oE+ApJg4I4lRuxjIY2
 BT8fcGeMrwbvlm3rFg9ftuiBC+P2P88zsHmOnqDQdzXJOml+t9vlAftS/3wYF2+i1gQO
 qu4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v4qw1U6KDYBOjshkawxBVwQdC+CSvskLF9qpiBI1bac=;
 b=dBqupTC+tXHqONEhAohKjBuFUKZ7Q0R1wWZqILEPrZnUgulXIgOTttyxPXGGzV+IBW
 KppqOpFes3ofZxdRfITQTJDq+Hnzr/1nxgsRfKnwkHyQbncVzY2y5vS1fHnTeNSQMkxS
 imCQjBblufU/EYfrQkGvEqakBIsXeg3NWFJcyMY3l47gCor4ps94F+BQbwxEXcx2649K
 xioNrUW4WHdbLldyL22SG6LY03IzMkljM/H/T1JWOmCbQGjv6Xiy6kPM4bXFE5wIWivL
 DI6xr1bb2CzyjA2Qm9X3PJ29Pvo3xqQVBhTUf+lAZUzuNs2caHzADGGtrIDnTkpnxzml
 mHZA==
X-Gm-Message-State: AOAM533F3jVLyEnhcqXPseaJBxvVYxH3IxpqIkDxGvFAjTI8US6c4M5I
 WVkX6WrVp90f9z6jkV2aqwE=
X-Google-Smtp-Source: ABdhPJw6EfELzkgOMjTie+KQpc9FE4L1uoSC/VlOWmTeFlUW+mJAlznC6TjoWC5xwR16fX+0Zdk7kQ==
X-Received: by 2002:a05:6402:12c2:: with SMTP id
 k2mr2409810edx.281.1612950894206; 
 Wed, 10 Feb 2021 01:54:54 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id o4sm582755edw.78.2021.02.10.01.54.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Feb 2021 01:54:53 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Max Reitz <mreitz@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH] hw/block: nvme: Fix a build error in nvme_process_sq()
Date: Wed, 10 Feb 2021 17:54:39 +0800
Message-Id: <1612950879-49023-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 Minwoo Im <minwoo.im.dev@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Current QEMU HEAD nvme.c does not compile:

  hw/block/nvme.c: In function ‘nvme_process_sq’:
  hw/block/nvme.c:3242:9: error: ‘result’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
         trace_pci_nvme_getfeat_vwcache(result ? "enabled" : "disabled");
         ^
  hw/block/nvme.c:3150:14: note: ‘result’ was declared here
     uint32_t result;
              ^

Explicitly initialize the result to fix it.

Fixes: aa5e55e3b07e ("hw/block/nvme: open code for volatile write cache")
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/block/nvme.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 5ce21b7..c122ac0 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -3228,6 +3228,7 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeRequest *req)
         result = ns->features.err_rec;
         goto out;
     case NVME_VOLATILE_WRITE_CACHE:
+        result = 0;
         for (i = 1; i <= n->num_namespaces; i++) {
             ns = nvme_ns(n, i);
             if (!ns) {
-- 
2.7.4


