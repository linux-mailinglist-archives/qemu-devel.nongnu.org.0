Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7886446E2D
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Nov 2021 14:44:28 +0100 (CET)
Received: from localhost ([::1]:54544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjLzf-0006qa-Vu
	for lists+qemu-devel@lfdr.de; Sat, 06 Nov 2021 09:44:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mjLxS-0004cz-Hn
 for qemu-devel@nongnu.org; Sat, 06 Nov 2021 09:42:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mjLxQ-0004lp-O0
 for qemu-devel@nongnu.org; Sat, 06 Nov 2021 09:42:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636206127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hpWCid9UewSIDZKy89GAH4fSn0++vdwnA69NZMo4eVM=;
 b=cxOahxMC1UzUKIDDf7kgGuexlDgYN/qVt9qX2iYM7WRBdJTEwIWbGaIu4/tXBbfnAEGKFO
 UD53qiWEOHkeALGLD2HrtpYsaFEv7XxC7yuzKg1Um7KEQyEQmBPvkdGXQBM6pUHp1xP/PF
 H6Zpf2qKiDDC2BTF7Ax/unbr5Q2gHKA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-cZie70WHPFCx-eda1r2B8g-1; Sat, 06 Nov 2021 09:42:04 -0400
X-MC-Unique: cZie70WHPFCx-eda1r2B8g-1
Received: by mail-wr1-f70.google.com with SMTP id
 j12-20020adf910c000000b0015e4260febdso2694613wrj.20
 for <qemu-devel@nongnu.org>; Sat, 06 Nov 2021 06:42:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hpWCid9UewSIDZKy89GAH4fSn0++vdwnA69NZMo4eVM=;
 b=DDicFtEYi082pOB2KYZ0rFU5KC9u5Pe4oi2sabRbssBQFn/5Bp5YDUUsTqHu5vCeGT
 jhKHNqdWDhUuYvV+ogEUCSXzny64ZXaErnEGPXFq89VcTMxOHo8RmB1bdNei0kaDZBBq
 eIBvRVQnymNZCHDV6Nnf6UU5F92mzD+ihyzD2epPfMBABweHReeqsm1nhQtbEMACK5Xz
 0tOaeZQ7DwNsvUQfb7Le8Zw+xY1ff7j5gBXGn8xXSWYnU02K6xt3575mVpfnJqU2mSPN
 Ox3BTZrLeXTLkAGKPqfW9wDpUZKRWswzeonyGsuNtHufHpZpwX1pvzvJ5EJTUI0jOS2v
 fzSQ==
X-Gm-Message-State: AOAM530Uv7mZ6wbmLPLvILuhlCR4i9fwQ2XInRdEd19aMOb8Ab2GeR6T
 IJ9kE6bChaFzG9dRI1MbHXpqT1m4Edo3iZKJdxob1ckGxkcEZXpCUAR8isYvUUl453FoGRAgzCz
 8pmSTS2bleI4p603wjfHPCQtaN2rSxp+C+IT8u9LGRhMHN6vgRaGyZp/Q9tqmgz7N
X-Received: by 2002:adf:e84d:: with SMTP id d13mr63791260wrn.72.1636206122513; 
 Sat, 06 Nov 2021 06:42:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtgZ05o2NU4IXT31/WvAFgNpzJL3hkeuTy9EPekPYKqpE4PwH/QSUXeNl4HOZXSQTlP9G8Ww==
X-Received: by 2002:adf:e84d:: with SMTP id d13mr63791213wrn.72.1636206122173; 
 Sat, 06 Nov 2021 06:42:02 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id y7sm10501445wrw.55.2021.11.06.06.42.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Nov 2021 06:42:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/1] hw/hyperv/vmbus: Remove unused vmbus_load/save_req()
Date: Sat,  6 Nov 2021 14:41:55 +0100
Message-Id: <20211106134155.582312-2-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211106134155.582312-1-philmd@redhat.com>
References: <20211106134155.582312-1-philmd@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.735,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Jon Doron <arilou@gmail.com>, qemu-trivial@nongnu.org,
 Roman Kagan <rkagan@virtuozzo.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Maciej S . Szmigiero" <maciej.szmigiero@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

vmbus_save_req() and vmbus_load_req() are not used.
Remove them to avoid maintaining dead code.

This partially reverts commit 4dd8a7064b8a6527f99a62be11
("vmbus: add infrastructure to save/load vmbus requests").

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/hyperv/vmbus.h |  3 --
 hw/hyperv/vmbus.c         | 59 ---------------------------------------
 2 files changed, 62 deletions(-)

diff --git a/include/hw/hyperv/vmbus.h b/include/hw/hyperv/vmbus.h
index f98bea3888d..8ea660dd8e6 100644
--- a/include/hw/hyperv/vmbus.h
+++ b/include/hw/hyperv/vmbus.h
@@ -223,7 +223,4 @@ int vmbus_map_sgl(VMBusChanReq *req, DMADirection dir, struct iovec *iov,
 void vmbus_unmap_sgl(VMBusChanReq *req, DMADirection dir, struct iovec *iov,
                      unsigned iov_cnt, size_t accessed);
 
-void vmbus_save_req(QEMUFile *f, VMBusChanReq *req);
-void *vmbus_load_req(QEMUFile *f, VMBusDevice *dev, uint32_t size);
-
 #endif
diff --git a/hw/hyperv/vmbus.c b/hw/hyperv/vmbus.c
index dbce3b35fba..78c19caf5f7 100644
--- a/hw/hyperv/vmbus.c
+++ b/hw/hyperv/vmbus.c
@@ -1311,65 +1311,6 @@ static const VMStateDescription vmstate_vmbus_chan_req = {
     }
 };
 
-void vmbus_save_req(QEMUFile *f, VMBusChanReq *req)
-{
-    VMBusChanReqSave req_save;
-
-    req_save.chan_idx = req->chan->subchan_idx;
-    req_save.pkt_type = req->pkt_type;
-    req_save.msglen = req->msglen;
-    req_save.msg = req->msg;
-    req_save.transaction_id = req->transaction_id;
-    req_save.need_comp = req->need_comp;
-    req_save.num = req->sgl.nsg;
-    req_save.sgl = g_memdup(req->sgl.sg,
-                            req_save.num * sizeof(ScatterGatherEntry));
-
-    vmstate_save_state(f, &vmstate_vmbus_chan_req, &req_save, NULL);
-
-    g_free(req_save.sgl);
-}
-
-void *vmbus_load_req(QEMUFile *f, VMBusDevice *dev, uint32_t size)
-{
-    VMBusChanReqSave req_save;
-    VMBusChanReq *req = NULL;
-    VMBusChannel *chan = NULL;
-    uint32_t i;
-
-    vmstate_load_state(f, &vmstate_vmbus_chan_req, &req_save, 0);
-
-    if (req_save.chan_idx >= dev->num_channels) {
-        error_report("%s: %u(chan_idx) > %u(num_channels)", __func__,
-                     req_save.chan_idx, dev->num_channels);
-        goto out;
-    }
-    chan = &dev->channels[req_save.chan_idx];
-
-    if (vmbus_channel_reserve(chan, 0, req_save.msglen)) {
-        goto out;
-    }
-
-    req = vmbus_alloc_req(chan, size, req_save.pkt_type, req_save.msglen,
-                          req_save.transaction_id, req_save.need_comp);
-    if (req_save.msglen) {
-        memcpy(req->msg, req_save.msg, req_save.msglen);
-    }
-
-    for (i = 0; i < req_save.num; i++) {
-        qemu_sglist_add(&req->sgl, req_save.sgl[i].base, req_save.sgl[i].len);
-    }
-
-out:
-    if (req_save.msglen) {
-        g_free(req_save.msg);
-    }
-    if (req_save.num) {
-        g_free(req_save.sgl);
-    }
-    return req;
-}
-
 static void channel_event_cb(EventNotifier *e)
 {
     VMBusChannel *chan = container_of(e, VMBusChannel, notifier);
-- 
2.31.1


