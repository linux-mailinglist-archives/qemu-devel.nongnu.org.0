Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F423FFEBB
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 13:11:00 +0200 (CEST)
Received: from localhost ([::1]:57594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM763-0000x4-UX
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 07:10:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mM72U-0004Kn-Mv
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:07:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mM72R-0008KP-Bs
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:07:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630667234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K59TWFNfhgS3efbWdzQjx6xmDgV9ebFReZvuleU1Sck=;
 b=VI1FlFkQ40Pp4Hhjgab4vXQWuxpOBXuoLGuzYlLwXcnCEL0c2btDLpBmhaKkxlilSQFL6I
 dc7Si49tFDYV8GsH8GBrMMYWCvRSEe9L0il+kjZb/UId7z5Fn0yWp8jbC9rXHtjWtUNmUo
 LxxhUgChahHe1a8nWcsE8Epgq0Eqswg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-yb2RrzIdPNqDR3_nxZJYsw-1; Fri, 03 Sep 2021 07:07:13 -0400
X-MC-Unique: yb2RrzIdPNqDR3_nxZJYsw-1
Received: by mail-wr1-f72.google.com with SMTP id
 p18-20020a5d4e12000000b0015940dc586aso1463465wrt.6
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 04:07:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K59TWFNfhgS3efbWdzQjx6xmDgV9ebFReZvuleU1Sck=;
 b=dzFcMHivFbx9FN433bd5avy6oCYfjQtSiBPEHCVpZXi5Y25ZKW89UOvMWE3jkuhJDb
 qb2PXp4iB8a6nf3lzAVHNAZ+24/uaO9PjrxcJPVNM5d2A0UnqiRjYTehm2gWbejiLu2G
 +ta5BbDrAYgoCvX+zRVuo+9k+I4oB7Czj2IBMZcdL0G17duXwH1RixOD+H6b1So80fEe
 hRgjKXLls23ss8acTvmVPbRULVADQsAsE7YV7EgGhOaErMoaUKgzmcbcxCz74CH2Zu3N
 HqdKIph8rVk1Czzytz9ByKhasP3J6NuXSmEXK2DzhxfpTLU572LXAc8RTF4W8b8z1kIp
 gGAw==
X-Gm-Message-State: AOAM532KqFPJUY6L6IyqBRhaE+g72rpxuCACst3tkV5EV8InztmKotpA
 85gGr5qSEH3mezO12MY1S7EeOd7lH583RiPbyN8ViX+Ko/juJfKoaOzXfonul3RWULWNzKCLLk+
 yNUfBD+lHZ4LtWAHBwjHqwdRLwOO2aiJ8F0LFUTL9+F7A71EKro+7ZQWxbZuBGR3j
X-Received: by 2002:adf:d0c3:: with SMTP id z3mr3510264wrh.108.1630667232248; 
 Fri, 03 Sep 2021 04:07:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzuQzt1zQyOoV195AnoVvGJcFGlsPxFtDdDER46/qDKajNyUtQpmHaCMGAGB07QiI3cNCdLCA==
X-Received: by 2002:adf:d0c3:: with SMTP id z3mr3510188wrh.108.1630667231886; 
 Fri, 03 Sep 2021 04:07:11 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 j207sm4380948wmj.40.2021.09.03.04.07.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 04:07:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/28] hw/hyperv/vmbus: Remove unused vmbus_load/save_req()
Date: Fri,  3 Sep 2021 13:06:35 +0200
Message-Id: <20210903110702.588291-2-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903110702.588291-1-philmd@redhat.com>
References: <20210903110702.588291-1-philmd@redhat.com>
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org,
 Zhang Chen <chen.zhang@intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Helge Deller <deller@gmx.de>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Laurent Vivier <laurent@vivier.eu>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

vmbus_save_req() and vmbus_load_req() are not used.
Remove them to avoid maintaining dead code.

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
index c9887d5a7bc..18d3c3b9240 100644
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


