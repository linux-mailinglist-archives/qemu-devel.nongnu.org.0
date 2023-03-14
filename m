Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E8C6B9153
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 12:15:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc2c8-0008Bx-On; Tue, 14 Mar 2023 07:14:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pc2c6-0008BY-Js
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 07:14:42 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pc2c4-0007R5-Su
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 07:14:42 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 fm20-20020a05600c0c1400b003ead37e6588so12855718wmb.5
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 04:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678792479;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WBbB48OzEtBYggzYMJfettQvX0tSbRPsQ84f5gSG1Yg=;
 b=FIRoO6vpuudahcUCYoezHp/xmHcunz3bRdZ+hpkIDRLgC0OduwvBxKT44RXe+2rBTQ
 InlwYwPRPZKUz3Te4mXY6qZ9NUFeEZPpwwOKlYe1m8DmVa3X5hgtvk3vA+cIqg3uMcWh
 i5ldUpgdYoAge50nu8EYe7oPOovxzg85sKPzeJhD+oaiR9mSukS/FfFo7Xe8WI6iIKqD
 29N3II1ZJqqj2bJwWJr+gLTSHZfdhQ2ZUCZpFkouPtJ5qTeZjAU50o3JZ0yGrXIXAA0I
 f6wQQbDjrdZPZpUt7AIxV5yykYTReFVx0i4n32y63R3XcdizbG+NVTi03eeoZcnCHqrH
 V/dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678792479;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WBbB48OzEtBYggzYMJfettQvX0tSbRPsQ84f5gSG1Yg=;
 b=ToM/g9LrevBb8WpTn+oERRj27EuEbUEGeJNO+t/8dZp89Mnuhz338I/j3HEwmZWX9D
 uYtiupXwRb83rvVswO4JPaabZuifD3Xy3DNq9Q/b9h31k9x7Hdw/XRCdq0WnrL69Q8De
 4mdnvT+GUQUtbE6hlZcNIjaNkG0eS/Z63vsYTPB8MSnUTKQstUQaQvHTQjhSVvGm8Pw5
 uHhzStV7ll6926L+nJzIgZlSH0iIV8zGMLa4nbgeCujp8uLYZYkyxOWNabqrfGQqBL9h
 RaPAbEWJMN7lccP7kOCD4u39FCusXdOlUNpMrd7gVR8t5f+2UD32byxc0WqQajTvaA5U
 /DHQ==
X-Gm-Message-State: AO0yUKXvaA5sMr2OIpeFswFZTh4srY2VmgBjSlJzqjW4QyTrOx66ykgF
 RsIyA8b9w43BzdAZ7rCzsOEfDoC05Sq6ewZFlkY=
X-Google-Smtp-Source: AK7set/MhZ9JpPqaWu50oYOWiiP68EMDgXzEknJcOCBh2K+xr1p9nnSE1NnqEbcPntyW7gKkxjGdFw==
X-Received: by 2002:a05:600c:a02:b0:3e5:4fb9:ea60 with SMTP id
 z2-20020a05600c0a0200b003e54fb9ea60mr11147357wmp.9.1678792479023; 
 Tue, 14 Mar 2023 04:14:39 -0700 (PDT)
Received: from localhost.localdomain
 (233.red-88-29-167.dynamicip.rima-tde.net. [88.29.167.233])
 by smtp.gmail.com with ESMTPSA id
 v15-20020a5d678f000000b002cda9aa1dc1sm1804120wru.111.2023.03.14.04.14.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 14 Mar 2023 04:14:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/4] hw/pci: Ensure capabilities are added before calling
 pci_qdev_realize()
Date: Tue, 14 Mar 2023 12:14:31 +0100
Message-Id: <20230314111435.89796-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

Per MST in [*]: "Calling pci_add_capability when VM is running is
likely to confuse guests".
Ensure this can't happen by asserting pci_add_capability() is never
called after a PCI device is realized.

[*] https://lore.kernel.org/qemu-devel/20230308071628-mutt-send-email-mst@kernel.org/
Based-on: <20230313153031.86107-1-philmd@linaro.org>
          "hw/i386/amd_iommu: Orphanize & QDev cleanups"

Philippe Mathieu-Daudé (4):
  hw/pci/msi: Fix debug format string
  hw/pci/msi: Ensure msi_init() is called before device is realized
  hw/pci: Add sanity check in pci_find_space()
  hw/pci: Ensure pci_add_capability() is called before device is
    realized

 hw/pci/msi.c | 4 +++-
 hw/pci/pci.c | 5 ++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

-- 
2.38.1


