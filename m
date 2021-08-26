Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2243F8F3E
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 21:53:11 +0200 (CEST)
Received: from localhost ([::1]:53146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJLR0-0007i0-99
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 15:53:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJLON-0004rd-Bs
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 15:50:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJLOK-0002kj-LR
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 15:50:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630007423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DPW4a8fAJ5aQIhBkKgFcCQAwlhPjH6NHU1IvtDHYfFc=;
 b=G50sgsfH31pWoeXgLLRtOKlGvBfS0xjFMEGoNxBjSn9QfSbeGL/9mh9yTB7t5WRwo20mWw
 AeFU1EjvAZG+jlEVYVDMg/FPUimUqp/QPEIfumirOr+Vq3fz+lov3xbhdFuANWKJCYJHiS
 M0rNNxwYM2Z3ZS6jWKeuxImne5zga/8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-PbnQHP7TM9Ok6ASZH6rKbQ-1; Thu, 26 Aug 2021 15:50:22 -0400
X-MC-Unique: PbnQHP7TM9Ok6ASZH6rKbQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 l1-20020adff481000000b00156e670a09dso1220900wro.1
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 12:50:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DPW4a8fAJ5aQIhBkKgFcCQAwlhPjH6NHU1IvtDHYfFc=;
 b=khfd7rjvUHpwT5/UTqICmS1LEMn4Sv6prWxNIYg4ed5nFSv7afdBOcJAn3OmF0IYcP
 o6wNOuuyIAceC7p+I3SD3KOnhid/JYBIjYLym1sajMfK3M4VfgiMj7uHF7lGjBHyW/sc
 Tjy7kGDO4eOyKzPvk2LhbtbhnsZlZM6xLZWzn3gZ1AzzZ5pPao1tizlG//Kw0bLMcUIk
 AMYQ9oeQZdchwDz3Chk+UzwKM+C4NMR3uKOsbw1bDGfkh4SMqAQBXQ+QbTp9NE6EmrLH
 fL0dCzcZ/FRbUEV4wgQ1AgrhHwbDTx+98MYLRoc2mlLyAkNiHW3eSV9yP1u7cz9vRmz7
 4B+g==
X-Gm-Message-State: AOAM531jDIDPCyFGMjywCYNz1FZaJX/8vSAmtaG3d4b5x4jSzgC9SvDB
 p+fGIqbHxYxxSuDca4+JCj4xvjhyU6bzixj81UMJW9aj9yReK4sc1eQWKgrTm60z1TXMQXh8JwM
 7rpHHqPUM79ZhJ0KuOEFzV6lwrJbjohnc3Mo55o3fbilBqSERRH+xOvCPxacC94h2
X-Received: by 2002:adf:fcc5:: with SMTP id f5mr6147570wrs.114.1630007420963; 
 Thu, 26 Aug 2021 12:50:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRI0s+iQs7V4r++edyJffi8HHplgzEnD3/oANNrp3ZWOtGA3u2MsUT7LDyLQ4pQ6/+PmgATg==
X-Received: by 2002:adf:fcc5:: with SMTP id f5mr6147548wrs.114.1630007420667; 
 Thu, 26 Aug 2021 12:50:20 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 n15sm4106961wrv.48.2021.08.26.12.50.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 12:50:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/11] block/nvme: Use safer trace format string
Date: Thu, 26 Aug 2021 21:50:04 +0200
Message-Id: <20210826195014.2180369-2-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210826195014.2180369-1-philmd@redhat.com>
References: <20210826195014.2180369-1-philmd@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
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


