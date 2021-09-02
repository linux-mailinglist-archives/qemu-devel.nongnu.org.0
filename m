Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2BA3FE9C4
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 09:10:16 +0200 (CEST)
Received: from localhost ([::1]:47862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLgrX-0008Ti-QJ
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 03:10:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLgiZ-0000g2-Ks
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 03:01:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLgiT-000892-IM
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 03:00:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630566052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fxOMagDiCYXI3yAqJDznAMmBXuTNis02iI0rK5zMlsE=;
 b=c3+6lBeZk5ICr+PxeQLk9kQIE63XFymF2TGyqbzgpoxHqWld7wDp6ckxNooKfBmNcabJE1
 5Lqj2frximDXpR57Oc2jKEC0opYtG4gLHYMYC0/UUPzz/caI/qaoW/ftH88H3m3Jm7SzCi
 0SYnoZ1jt5mMVlJXnEHTifK4N+SuTNE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-9UX6VVddOQSzN0qtPC_AwA-1; Thu, 02 Sep 2021 03:00:51 -0400
X-MC-Unique: 9UX6VVddOQSzN0qtPC_AwA-1
Received: by mail-wr1-f71.google.com with SMTP id
 i16-20020adfded0000000b001572ebd528eso207357wrn.19
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 00:00:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fxOMagDiCYXI3yAqJDznAMmBXuTNis02iI0rK5zMlsE=;
 b=CEsfuo/iDdQT1P/yb9CCtY7lA6NnUncUG7tp0fg54laA+ISWb786QCYkSKtaGF3vl4
 rFBQNyN/HyQJF9AJEWHbx/69A72TjopNZwcGny7x4OZA77oueqyLgFFOs5hHyAzwS5mU
 ftPcro9Wqq4Zk2EPNDE7d/ASBilJfmt6SwRz7oxgCOOy9cHAYK1LvETrxaCd00lRmRfC
 is8Z+beiWcarhPiy9HhinHt8BNSapKAl1dzIhexfG1mrGqxG3l3XuTY94bv4wzfyyuIL
 IczrYAsg3isq2078jQktpgVx6EAg86lft4Uy3wnO9S5O4fFgjxP4Id6Dr+ln61ByPn6Y
 jwHg==
X-Gm-Message-State: AOAM530U/wxYHhoOK/jPR83SW9rKeYXefiDzRiRApuMXDTi39vb3GyY+
 D/MvWUGj6tx5TD4yn2VE+Iu8FgpdNanJ/CgaL5ECKXI01aCA5vNsnudXfqaIJDrxLtEWqBIfaZo
 11S50FNVznIl5Lc8NLLX6XLi9b7LsSJgL2G7HrzrDctm6REkRc8v97ngIGSEjgbd8
X-Received: by 2002:a1c:f019:: with SMTP id a25mr1600357wmb.96.1630566050101; 
 Thu, 02 Sep 2021 00:00:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyj9XGwda9JFPCgQuPtB8iH/uqvLuI3dO5xcorOcnyXJ4D2BnKJrwgcJHBik02aPE9HityRnQ==
X-Received: by 2002:a1c:f019:: with SMTP id a25mr1600324wmb.96.1630566049793; 
 Thu, 02 Sep 2021 00:00:49 -0700 (PDT)
Received: from x1w.redhat.com (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id c24sm921515wrb.57.2021.09.02.00.00.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 00:00:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/11] block/nvme: Have nvme_create_queue_pair() report
 errors consistently
Date: Thu,  2 Sep 2021 09:00:19 +0200
Message-Id: <20210902070025.197072-6-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902070025.197072-1-philmd@redhat.com>
References: <20210902070025.197072-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Auger Eric <eric.auger@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

nvme_create_queue_pair() does not return a boolean value (indicating
eventual error) but a pointer, and is inconsistent in how it fills the
error handler. To fulfill callers expectations, always set an error
message on failure.

Reported-by: Auger Eric <eric.auger@redhat.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 block/nvme.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/block/nvme.c b/block/nvme.c
index e8dbbc23177..0786c501e46 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -220,6 +220,7 @@ static NVMeQueuePair *nvme_create_queue_pair(BDRVNVMeState *s,
 
     q = g_try_new0(NVMeQueuePair, 1);
     if (!q) {
+        error_setg(errp, "Cannot allocate queue pair");
         return NULL;
     }
     trace_nvme_create_queue_pair(idx, q, size, aio_context,
@@ -228,6 +229,7 @@ static NVMeQueuePair *nvme_create_queue_pair(BDRVNVMeState *s,
                           qemu_real_host_page_size);
     q->prp_list_pages = qemu_try_memalign(qemu_real_host_page_size, bytes);
     if (!q->prp_list_pages) {
+        error_setg(errp, "Cannot allocate PRP page list");
         goto fail;
     }
     memset(q->prp_list_pages, 0, bytes);
@@ -239,6 +241,7 @@ static NVMeQueuePair *nvme_create_queue_pair(BDRVNVMeState *s,
     r = qemu_vfio_dma_map(s->vfio, q->prp_list_pages, bytes,
                           false, &prp_list_iova);
     if (r) {
+        error_setg_errno(errp, -r, "Cannot map buffer for DMA");
         goto fail;
     }
     q->free_req_head = -1;
-- 
2.31.1


