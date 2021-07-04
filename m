Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D39123BAF1B
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 22:55:42 +0200 (CEST)
Received: from localhost ([::1]:35348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m099R-0000pN-UJ
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 16:55:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1m096u-00056j-FN
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 16:53:04 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:38522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1m096q-0008Hs-Lp
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 16:53:04 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 b14-20020a1c1b0e0000b02901fc3a62af78so6090853wmb.3
 for <qemu-devel@nongnu.org>; Sun, 04 Jul 2021 13:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=90sztYKQ4hH2bjI7sMOZVyfw8++lW2jnRTA4Dgj5zb4=;
 b=ViBViJbKuvARdf8c/Y9yMTUbGo7gdhCsSfUF8bUcAL3bYCjL2Y2QlzkxO1fgTWKkEA
 w3zydS/oDM/jTI3yYtaYe2fZLkcspSmuXpSb8Ef+Q7+Hsr5yalw0RqCXz3YsSMro61SM
 RK5Hq5SLfn/D+4DP7GDAqnvVuBVWI4hn9gFqdA1BXKLICPL+D4omQPUQpstQ/jdhdfVz
 ezNStLkpZURU7KJ0ippAElhuJ5RUN+4J2/eeNZwkLDm3ajGv0fPPERlI0I9Wx3n1HaNy
 cmLI6zorm8D4P0ZosgomPTB5TbQxXrK0uQYKknddT5vTjY2h9C26NS32HthpD57oorza
 Qd8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=90sztYKQ4hH2bjI7sMOZVyfw8++lW2jnRTA4Dgj5zb4=;
 b=D03QWDJLHeohj+wa69hhvGaZXQSdRz9HcuxkqB1NCQVnUGtmExNuYv16LJN+zLRz4d
 0sqb4EXNNk0p6qekeA3hGvN9w/snuplRp4nUydZ1FRPxLUDbrzICFssTV2mZQJjdYPVt
 XdrVCEDAPkHDcSEWHeH0s5oyBWYmwqZj0BO48ReIfH/owzrFjWH82+OL/uB4ZcpshpHi
 gFy/XpHWhUCPK1HY1YV/tQwdR/X9J/rW6AIX8ED9n9cGFj3qX8SxJORdyJukc338BHKl
 UuFpIr+7QpW1NX+SoU0DkNw/V5LtIb5u3/AMSvAvdnNoxjMu67D26jiT+d3eEVXj8fMG
 kgvA==
X-Gm-Message-State: AOAM533lbtF11KioEBkdybdI/mQR9mpyngmx8y0N8CbPO3vE4ZNit39s
 0Zw6dtjW84RSE1/oLjvlrMBOivfegEQ=
X-Google-Smtp-Source: ABdhPJwXm3qSOXVLFTJ8CsfyCFs4Po3oIyCGhB40VhdWvsM1kYlIaZmNJ7/lzItaSh2nzNWDxAxfQg==
X-Received: by 2002:a1c:4c14:: with SMTP id z20mr11092437wmf.146.1625431978708; 
 Sun, 04 Jul 2021 13:52:58 -0700 (PDT)
Received: from localhost.localdomain ([5.29.30.165])
 by smtp.gmail.com with ESMTPSA id y19sm17199997wmj.33.2021.07.04.13.52.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 04 Jul 2021 13:52:58 -0700 (PDT)
From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL V2 0/3] PVRDMA queue
Date: Sun,  4 Jul 2021 23:52:52 +0300
Message-Id: <20210704205255.27124-1-marcel.apfelbaum@gmail.com>
X-Mailer: git-send-email 2.17.2
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=marcel.apfelbaum@gmail.com; helo=mail-wm1-x336.google.com
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
Cc: mcascell@redhat.com, pjp@fedoraproject.org, yuval.shaia.ml@gmail.com,
 vv474172261@gmail.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 9c2647f75004c4f7d64c9c0ec55f8c6f0739a8b1:

  Merge remote-tracking branch 'remotes/kevin/tags/for-upstream' into staging (2021-07-02 11:46:32 +0100)

are available in the Git repository at:

  https://github.com/marcel-apf/qemu tags/pvrdma-04-07-2021-v2

for you to fetch changes up to 66ae37d8cc313f89272e711174a846a229bcdbd3:

  pvrdma: Fix the ring init error flow (CVE-2021-3608) (2021-07-04 22:47:51 +0300)

----------------------------------------------------------------
PVRDMA queue

Several CVE fixes for the PVRDMA device.

----------------------------------------------------------------

Marcel Apfelbaum (3):
  hw/rdma: Fix possible mremap overflow in the pvrdma device
    (CVE-2021-3582)
  pvrdma: Ensure correct input on ring init (CVE-2021-3607)
  pvrdma: Fix the ring init error flow (CVE-2021-3608)

 hw/rdma/vmw/pvrdma_cmd.c      | 7 +++++++
 hw/rdma/vmw/pvrdma_dev_ring.c | 2 +-
 hw/rdma/vmw/pvrdma_main.c     | 5 +++++
 3 files changed, 13 insertions(+), 1 deletion(-)

-- 
2.17.2


