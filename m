Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C713424368
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 18:53:46 +0200 (CEST)
Received: from localhost ([::1]:59546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYAAr-0007cy-IM
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 12:53:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYA73-00041D-K9
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 12:49:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYA70-0007OE-TE
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 12:49:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633538984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uyPtVC6HvIWx2rYECRqbct1GQVLi/CnHV8MyElho2m0=;
 b=EGGtptHMWR5bhnkmRq4nc0U8ajF4PeznpwZbaxxQCXA3DQBQ9u9IhFM+KDNRpgqVWhCYnU
 /G2hWRS00tYzePxDIGT8ngTj93SAVdyGEBf96O7zTXc7jqh/kyqZDFXgVo+I+WJD59XsGS
 rHtdq92RfSOvchgJxGx+JKbX0E8x3hM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-XRokz5fLPkaNiPtsRuuhVg-1; Wed, 06 Oct 2021 12:49:43 -0400
X-MC-Unique: XRokz5fLPkaNiPtsRuuhVg-1
Received: by mail-wr1-f72.google.com with SMTP id
 l9-20020adfc789000000b00160111fd4e8so2558720wrg.17
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 09:49:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uyPtVC6HvIWx2rYECRqbct1GQVLi/CnHV8MyElho2m0=;
 b=ogv+avT5g/pHVsm5ULVAow2d1FyofRsJ+cXnu1zKykJA875L6FGRq0WQpVUu8k+z+k
 cxa4V5RQrvEqhVQSQvbBlGZlTKrrAyHlrIsCCiefvZJ79HOPvuJVL4gBxe/7HMQpODpN
 6Rcg8J8A5hQDHllLqrAcjUpYRX2DPrhHNoAC8kbb9TPl/C16EWtwLN8zBfifmcHWmecc
 B9rQUJ4R0z86PAs9eiYmc4zEQsCC0wolRmTH0mlm9T/RQGAyMIUvpyovFr5vemI9V9iR
 zEQDVbhcF0TDJOXrj7CCXOwBq7GoRdjHevpnYQECxcysSTEcjhMnrXO2n6w+ioh+MKtp
 2QwA==
X-Gm-Message-State: AOAM531iD8FAzTKKNNlGvlPj6zUAxFlUPAfrm6em9bSZ30YFytq9jN2O
 kNqqizl2UfDDLOrfCLrKIpwnFy81WBUT/HOC3tu5LQZ/lzBaYL2VAL4rHdoo2VP7bkadKLVOU50
 TQxWtX5aIGAlKTEsGAlj538aMcLsXdZV/kyNshY/uXud/lx7ZB916W7259CED6ebv
X-Received: by 2002:a7b:c314:: with SMTP id k20mr11104730wmj.50.1633538982172; 
 Wed, 06 Oct 2021 09:49:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQsYH0xOdrDeZY6YPbibs3veeOy7/Xb5lWWrxX+u9T5Y8Dqs5Uf2WytMSPIYbHg1lGNOGlxg==
X-Received: by 2002:a7b:c314:: with SMTP id k20mr11104708wmj.50.1633538982005; 
 Wed, 06 Oct 2021 09:49:42 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id p3sm5905016wmp.43.2021.10.06.09.49.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 09:49:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/5] block/nvme: Display CQ/SQ pointer in
 nvme_free_queue_pair()
Date: Wed,  6 Oct 2021 18:49:28 +0200
Message-Id: <20211006164931.172349-3-philmd@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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

For debugging purpose it is helpful to know the CQ/SQ pointers.
We already have a trace event in nvme_free_queue_pair(), extend
it to report these pointer addresses.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 block/nvme.c       | 2 +-
 block/trace-events | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/nvme.c b/block/nvme.c
index fefcc04abe6..0c94799a541 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -185,7 +185,7 @@ static bool nvme_init_queue(BDRVNVMeState *s, NVMeQueue *q,
 
 static void nvme_free_queue_pair(NVMeQueuePair *q)
 {
-    trace_nvme_free_queue_pair(q->index, q);
+    trace_nvme_free_queue_pair(q->index, q, &q->cq, &q->sq);
     if (q->completion_bh) {
         qemu_bh_delete(q->completion_bh);
     }
diff --git a/block/trace-events b/block/trace-events
index f2d0a9b62a7..491e765c611 100644
--- a/block/trace-events
+++ b/block/trace-events
@@ -157,7 +157,7 @@ nvme_dsm_done(void *s, int64_t offset, int64_t bytes, int ret) "s %p offset 0x%"
 nvme_dma_map_flush(void *s) "s %p"
 nvme_free_req_queue_wait(void *s, unsigned q_index) "s %p q #%u"
 nvme_create_queue_pair(unsigned q_index, void *q, size_t size, void *aio_context, int fd) "index %u q %p size %zu aioctx %p fd %d"
-nvme_free_queue_pair(unsigned q_index, void *q) "index %u q %p"
+nvme_free_queue_pair(unsigned q_index, void *q, void *cq, void *sq) "index %u q %p cq %p sq %p"
 nvme_cmd_map_qiov(void *s, void *cmd, void *req, void *qiov, int entries) "s %p cmd %p req %p qiov %p entries %d"
 nvme_cmd_map_qiov_pages(void *s, int i, uint64_t page) "s %p page[%d] 0x%"PRIx64
 nvme_cmd_map_qiov_iov(void *s, int i, void *page, int pages) "s %p iov[%d] %p pages %d"
-- 
2.31.1


