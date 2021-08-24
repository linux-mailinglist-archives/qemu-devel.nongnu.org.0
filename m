Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDDF3F5FF8
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 16:13:53 +0200 (CEST)
Received: from localhost ([::1]:58850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIXBS-0008CJ-AX
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 10:13:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mIX9g-0004xg-N6
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 10:11:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mIX9d-0005Dd-JM
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 10:11:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629814312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yN+5yZGDeAmkt+tWURHTcSbRHTRAgs+im7kId+unuiY=;
 b=YnF3pXXcIAUB2IwHnowUVJGG8zX4ESWHQYHUQ549HADkN4uVT4wEef+aBdsZqo7dkHhXDa
 udn0gso3UUCn20HPCeKs1a6uN0t+i43y56AL5hy5FKOPkUNCSE/kGxsX/off9EgI+KWb5a
 xT+0hJeQ7h9SUkfzPz/mRWQrfd4xS/8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-0WYZPCG8MqqkMqHh1F5iJQ-1; Tue, 24 Aug 2021 10:11:51 -0400
X-MC-Unique: 0WYZPCG8MqqkMqHh1F5iJQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 b7-20020a5d4d87000000b001575d1053d2so935444wru.23
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 07:11:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yN+5yZGDeAmkt+tWURHTcSbRHTRAgs+im7kId+unuiY=;
 b=ibzUN4JQpXmoBfTe5SEpZ4bmvdA4mE29YkZu6vyNdQA0e041vnx94B/0RGnHhddqLw
 1jmdMIlKRXgXw3VGMm19IfytBXZ2h9y8ez4H7tlooZwJ65fdpjnC8H8yy6YijIYDTPX5
 L9BVmjh38Wb76nVDL+NtX9GVz9fC7nQgDmnDnO3oCf7DXFE9TfHSq0tlC4gPmkTM+CJV
 uWmRopVSxuLM8BSgg1H8MVJ4iPZqTK55Q29D57qIujet4+RDPc8RTEAqb5ezsa+OEg2u
 rTxQWjm2q8LbLZoiH/d6QEdB1iDZAdP7e0h6UYrBZYBEl+/U6iX01hsye5FnKOOglVJw
 oH9A==
X-Gm-Message-State: AOAM532YLGYxJecbNm//zbbiUIxHEsW7yLcN86wil4aLyWleWiPwxFVo
 zsrREe5zNSTUnIJLm9c6/pGAR+9+NdOPhoER+5w0oOw7azTzzQI8F6pLwNWnCaoVDUoUNQ4XNdn
 DyFvqoPTnZg5Uft17keMxVYwLLhqZp6IhHIm/LGBNHTotSXMCcRkj0Ha14nVir+QH
X-Received: by 2002:a05:600c:2947:: with SMTP id
 n7mr4261436wmd.183.1629814309382; 
 Tue, 24 Aug 2021 07:11:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyD74QeeVEmzmUaCLAJuULZlZSXTU6ioFPiP+Ac9H//5fCizH7jH5ZIrSVWkfH6QMs1Bfbimw==
X-Received: by 2002:a05:600c:2947:: with SMTP id
 n7mr4261401wmd.183.1629814309103; 
 Tue, 24 Aug 2021 07:11:49 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 q3sm2320088wmf.37.2021.08.24.07.11.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 07:11:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/9] block/nvme: Use safer trace format string
Date: Tue, 24 Aug 2021 16:11:34 +0200
Message-Id: <20210824141142.1165291-2-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210824141142.1165291-1-philmd@redhat.com>
References: <20210824141142.1165291-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 qemu-block@nongnu.org, Auger Eric <eric.auger@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix when building with -Wshorten-64-to-32:

  warning: implicit conversion loses integer precision: 'unsigned long' to 'int' [-Wshorten-64-to-32]

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 block/trace-events | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/trace-events b/block/trace-events
index b3d2b1e62cb..f4f1267c8c0 100644
--- a/block/trace-events
+++ b/block/trace-events
@@ -156,7 +156,7 @@ nvme_dsm(void *s, uint64_t offset, uint64_t bytes) "s %p offset 0x%"PRIx64" byte
 nvme_dsm_done(void *s, uint64_t offset, uint64_t bytes, int ret) "s %p offset 0x%"PRIx64" bytes %"PRId64" ret %d"
 nvme_dma_map_flush(void *s) "s %p"
 nvme_free_req_queue_wait(void *s, unsigned q_index) "s %p q #%u"
-nvme_create_queue_pair(unsigned q_index, void *q, unsigned size, void *aio_context, int fd) "index %u q %p size %u aioctx %p fd %d"
+nvme_create_queue_pair(unsigned q_index, void *q, size_t size, void *aio_context, int fd) "index %u q %p size %zu aioctx %p fd %d"
 nvme_free_queue_pair(unsigned q_index, void *q) "index %u q %p"
 nvme_cmd_map_qiov(void *s, void *cmd, void *req, void *qiov, int entries) "s %p cmd %p req %p qiov %p entries %d"
 nvme_cmd_map_qiov_pages(void *s, int i, uint64_t page) "s %p page[%d] 0x%"PRIx64
-- 
2.31.1


