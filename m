Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8034F3BAF1C
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 22:55:46 +0200 (CEST)
Received: from localhost ([::1]:35528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m099V-0000wm-Jp
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 16:55:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1m096x-0005AN-IZ
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 16:53:07 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:50998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1m096v-0008LK-3Y
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 16:53:07 -0400
Received: by mail-wm1-x330.google.com with SMTP id o22so10040350wms.0
 for <qemu-devel@nongnu.org>; Sun, 04 Jul 2021 13:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x418SNrj2nMR0PLcR8ORPMYCWf0JT6CneiERD1LoT4s=;
 b=OUtC+WzVUiH5YooStfNBYiK6gM3uFMVsL3dh4qSJcJx5mHKZe6IKLRFkSg8Vw1IymC
 NDv5i9Rdx2fkoex68039IPG+cPezXwJk5aJjLie3BBE12TBllZvQElhqFHfU3R7nsNM/
 N7mOgoyS50WTqlZ7SDnB9gsJlVSyeIBHZOleYWSA/O0TBj0++UFy+I3TsOvwVADAipcQ
 OITesLWBvZLvAvqdKQhAUA83zTFfRR+4omorGeJJ122z0M5WQ+9pI/kbUp4tnPDK7drf
 RKsoyYvO0Ut2WlB2qKBMXhKznb8SauHn+YV6CHfxYDG0+Y7soWIVUfZ5DfCLXPxIZ1q5
 lCdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x418SNrj2nMR0PLcR8ORPMYCWf0JT6CneiERD1LoT4s=;
 b=SjNlQ5OSsNXx+9CFz4WHfRqUfeKRHcJfOuP6U7ps87PnTpdTxTEnwmRmJEJ1+xgHwm
 +49E5P564z+k7Q1fx5GkTfxGTMHkF5kGMqFyz7oiTEZ3AGnP8dMm3KOHaweOiWYyj7sS
 VKRwcICIlZUMIjHCsgQOQXSqxbE4ZvkiqG0e4zkbBx/DtKAs47UnxN3Pg5FoISzAPau4
 3OCNRppSvkSvACpzHFaWSJeLjTeCwUg7FhPRt0NuNJIs5WlO038CXtPt2ns+kmjUiQ7R
 li0jdVu/sw4IBICDMNtaVu434yy51pNgzPGt2l1DzUJqKNcyAEz3u64DgDfGPbQNXGm+
 ARdg==
X-Gm-Message-State: AOAM531GN+lBHQLi/WeZmm/fstM9sUUqRwfKGyBYFbc7y8u3JJIxwwy8
 DP50C/YjSya+N4f1DYG9qRLFGlU9MeY=
X-Google-Smtp-Source: ABdhPJzBotuqeUlFAPoRy9QyRFU6vl9WXgMlSzy3Du7q9uwGV57jVK6w/WTrmfK5E/HtQSQD0GJoqw==
X-Received: by 2002:a1c:4602:: with SMTP id t2mr10882883wma.94.1625431983567; 
 Sun, 04 Jul 2021 13:53:03 -0700 (PDT)
Received: from localhost.localdomain ([5.29.30.165])
 by smtp.gmail.com with ESMTPSA id y19sm17199997wmj.33.2021.07.04.13.53.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 04 Jul 2021 13:53:03 -0700 (PDT)
From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL V2 3/3] pvrdma: Fix the ring init error flow (CVE-2021-3608)
Date: Sun,  4 Jul 2021 23:52:55 +0300
Message-Id: <20210704205255.27124-4-marcel.apfelbaum@gmail.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20210704205255.27124-1-marcel.apfelbaum@gmail.com>
References: <20210704205255.27124-1-marcel.apfelbaum@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=marcel.apfelbaum@gmail.com; helo=mail-wm1-x330.google.com
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

Do not unmap uninitialized dma addresses.

Fixes: CVE-2021-3608
Reviewed-by: VictorV (Kunlun Lab) <vv474172261@gmail.com>
Tested-by: VictorV (Kunlun Lab) <vv474172261@gmail.com>
Signed-off-by: Marcel Apfelbaum <marcel@redhat.com>
Message-Id: <20210630115246.2178219-1-marcel@redhat.com>
Tested-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
Reviewed-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
---
 hw/rdma/vmw/pvrdma_dev_ring.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/rdma/vmw/pvrdma_dev_ring.c b/hw/rdma/vmw/pvrdma_dev_ring.c
index 074ac59b84..42130667a7 100644
--- a/hw/rdma/vmw/pvrdma_dev_ring.c
+++ b/hw/rdma/vmw/pvrdma_dev_ring.c
@@ -41,7 +41,7 @@ int pvrdma_ring_init(PvrdmaRing *ring, const char *name, PCIDevice *dev,
     qatomic_set(&ring->ring_state->cons_head, 0);
     */
     ring->npages = npages;
-    ring->pages = g_malloc(npages * sizeof(void *));
+    ring->pages = g_malloc0(npages * sizeof(void *));

     for (i = 0; i < npages; i++) {
         if (!tbl[i]) {
-- 
2.17.2


