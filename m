Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0715D3FE9AB
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 09:04:54 +0200 (CEST)
Received: from localhost ([::1]:60020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLgmJ-0005ne-PE
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 03:04:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLgiN-0000XR-Uf
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 03:00:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLgiB-0007s7-3t
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 03:00:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630566034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DPW4a8fAJ5aQIhBkKgFcCQAwlhPjH6NHU1IvtDHYfFc=;
 b=b36AWFyjT64saCO5RG3ie7WacO1W9Id08koJVV2rMwHy9jZMGxRr1GY1JDNiPm1BcHKbKR
 LuIv//tg6Xy8bFfokJOktM85NzzGVM5INTt5Wb1c0CVN1Qtp4dVX0vlZzeWGoplnjVC4mw
 qrnNd1wsEVlGmqLrIZqZQnutWNTmV4Y=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-V4aBcoIZPPuQyYTF7L8lyA-1; Thu, 02 Sep 2021 03:00:33 -0400
X-MC-Unique: V4aBcoIZPPuQyYTF7L8lyA-1
Received: by mail-wm1-f69.google.com with SMTP id
 w25-20020a1cf6190000b0290252505ddd56so332790wmc.3
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 00:00:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DPW4a8fAJ5aQIhBkKgFcCQAwlhPjH6NHU1IvtDHYfFc=;
 b=tJwcLav049DgypOJsxN24Dqs46lOXHo1KXHm+9U59KmGxWtQK4A9YNBr4ji9jcvqV2
 C+zD4H3BR/Kz34yNwwMoNoXr/mcEi4kOxpPqKlqx1XT29fBx5Ohefjc+QlZIFjGG/eiF
 O+KqvRyfpLx5UBk+bslxxMN6TYl8SzZq/AJPvm5wiqOGpb/VqPzaMvHedGsLyADJdHdF
 2XfUyf2bfYCEtUGPSGTbKZFVyndKcmAfJOhqXuhPRH7QqBua3moNYgFowQqPMP0D471S
 v3s0US/R02iaYT3XHhFWUA81gqk9lCwA7dzhjoyXk8q24Q0Wn+6FyTB6MbNl9NO+6EmT
 71UA==
X-Gm-Message-State: AOAM530pk1wRST2AFZM/MUKujm44udDxW9dqXHtKmXLnwLaFQZpJ99NY
 oGc08BdSzbS0WrpvV6htEL4PDR/dyzteYex7Zsfqo98t20xwNjVqiKibxPnD3C6XymXgxu89sUm
 cbJ9rDQvFqCcdbw64S7srjpsTVK0NlLDLwR9MGVl07uPJwx3KKCuLlqmmLGqG7qGt
X-Received: by 2002:a1c:80c3:: with SMTP id b186mr1459271wmd.105.1630566032317; 
 Thu, 02 Sep 2021 00:00:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSuTMeUBYjmMj9GWscYxb35xMvhBOgt2AD3bmDvuZlwWwJvRxCponAJZjr4WVkSloZcaVXBg==
X-Received: by 2002:a1c:80c3:: with SMTP id b186mr1459238wmd.105.1630566031984; 
 Thu, 02 Sep 2021 00:00:31 -0700 (PDT)
Received: from x1w.redhat.com (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id v5sm933269wru.37.2021.09.02.00.00.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 00:00:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/11] block/nvme: Use safer trace format string
Date: Thu,  2 Sep 2021 09:00:15 +0200
Message-Id: <20210902070025.197072-2-philmd@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Auger Eric <eric.auger@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix when building with -Wshorten-64-to-32:

  warning: implicit conversion loses integer precision: 'unsigned long' to 'int' [-Wshorten-64-to-32]

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
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


