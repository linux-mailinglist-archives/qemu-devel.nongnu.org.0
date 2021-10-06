Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B4C4243A5
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 19:02:40 +0200 (CEST)
Received: from localhost ([::1]:54088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYAJT-00063a-Mx
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 13:02:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYA7F-0004RO-Fk
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 12:50:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYA7C-0007ab-Ph
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 12:50:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633538998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d3SY8kt+0eUr16xiO6WRv5UUaNaOH2E74e2h2BTlxRY=;
 b=RBuZldxpt2+H8VjqJj4puyGxU/7Es5yOPD4FU4N4GKJc//omfMXbpSMoN9JNhbbZAy5EKf
 93d3/cviQK/G5JBPUc1VGSilgnNf1zbHJo1CLKC5egJkJkK5dG8msqWdveLySDGPXCQQ7Y
 khG4DQzTYg3394gsYVIYzq8OMq/TdT8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-aaKbAiqeM4mRfsOKcDCgeg-1; Wed, 06 Oct 2021 12:49:57 -0400
X-MC-Unique: aaKbAiqeM4mRfsOKcDCgeg-1
Received: by mail-wr1-f69.google.com with SMTP id
 d13-20020adfa34d000000b00160aa1cc5f1so2547211wrb.14
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 09:49:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d3SY8kt+0eUr16xiO6WRv5UUaNaOH2E74e2h2BTlxRY=;
 b=o87He0HME8O9T07Bku/qmXECDkGv38ZqdXEFs99+bSNsJl/u2/I/JEV9jvE+jkD220
 gjaER/Vk4PD63WgrDwPfUn2dBpznSsUcrtWWB7ujmFALeYRFAEzdoFIebE6lZT7+hKRC
 yZEK48OKuGzSXtXLbIf69w2cXjLuAKWBcnACSbH83v+Pm9fOxSK5eIMLtgDQhEqbaSNb
 SYEHCGHKYXt3uVJNy1kPQBUKlfxEP01ryy3LX9zUBA1i5CTVjvL0dz8a0smq0OcR/nsb
 Tfwk4pgL82yuPRFdIneCz4OMwovEeA2xX6PfHuSOKAeAcZh5/6Zc9KbVScrosZGwB2Bu
 Rtag==
X-Gm-Message-State: AOAM530t+RRHrsRmxxGepVuuApyzGJ9zddFqqiJhgArwQCsrwVQXmQLQ
 071ZTxP2dkxSNKp5CuDjjp1fekNb4ADeQcaiOpwfw0IRDsfHTmePcIr6XhSM6gH4Z+ea1ziMVRR
 KIDUju+yVR6NnVXjZQDirzksm14KzW6H9i08nQ61zftE+2mOl0ROn3dIFMaVK+6ce
X-Received: by 2002:a1c:158:: with SMTP id 85mr10873941wmb.187.1633538995662; 
 Wed, 06 Oct 2021 09:49:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYXrWDPsnysXoTslg9CNi8EtDOIX+tHxKAHzrlnJ6h+EnzldDiVm9QAyPTkus4yIScFH6FPg==
X-Received: by 2002:a1c:158:: with SMTP id 85mr10873911wmb.187.1633538995379; 
 Wed, 06 Oct 2021 09:49:55 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id k22sm21875271wrd.59.2021.10.06.09.49.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 09:49:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/5] block/nvme: Fix memory leak from nvme_init_queue()
Date: Wed,  6 Oct 2021 18:49:31 +0200
Message-Id: <20211006164931.172349-6-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211006164931.172349-1-philmd@redhat.com>
References: <20211006164931.172349-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

nvme_create_queue_pair() allocates resources with qemu_vfio_dma_map(),
but we never release them. Do it in nvme_free_queue() which is called
from nvme_free_queue_pair().

Reported by valgrind:

  ==252858== 520,192 bytes in 1 blocks are still reachable in loss record 8,293 of 8,302
  ==252858==    at 0x4846803: memalign (vg_replace_malloc.c:1265)
  ==252858==    by 0x484691F: posix_memalign (vg_replace_malloc.c:1429)
  ==252858==    by 0xB8AFE4: qemu_try_memalign (oslib-posix.c:210)
  ==252858==    by 0xA9E315: nvme_create_queue_pair (nvme.c:229)
  ==252858==    by 0xAA0125: nvme_init (nvme.c:799)
  ==252858==    by 0xAA081C: nvme_file_open (nvme.c:953)
  ==252858==    by 0xA23DDD: bdrv_open_driver (block.c:1550)
  ==252858==    by 0xA24806: bdrv_open_common (block.c:1827)
  ==252858==    by 0xA2889B: bdrv_open_inherit (block.c:3747)
  ==252858==    by 0xA28DE4: bdrv_open (block.c:3840)
  ==252858==    by 0x9E0F8E: bds_tree_init (blockdev.c:675)
  ==252858==    by 0x9E7C74: qmp_blockdev_add (blockdev.c:3551)

Fixes: bdd6a90a9e5 ("block: Add VFIO based NVMe driver")
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 block/nvme.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/block/nvme.c b/block/nvme.c
index 6e476f54b9f..903c8ffa060 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -185,6 +185,7 @@ static bool nvme_init_queue(BDRVNVMeState *s, NVMeQueue *q,
 
 static void nvme_free_queue(BDRVNVMeState *s, NVMeQueue *q)
 {
+    qemu_vfio_dma_unmap(s->vfio, q->queue);
     qemu_vfree(q->queue);
 }
 
-- 
2.31.1


