Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AF3400467
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 19:57:04 +0200 (CEST)
Received: from localhost ([::1]:48442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMDR1-0001U7-BD
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 13:57:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMDFm-00072l-PB
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:45:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMDFi-0000Wd-Gw
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:45:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630691120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K59TWFNfhgS3efbWdzQjx6xmDgV9ebFReZvuleU1Sck=;
 b=Nr+bJgHh9BeBU8We15v74E73D9PlWpIhUYiJU5nUApjLx1AbiEGRhMLssNT6ypFpU+1CQT
 1V92Op9JpIQOLxe/GRW9SKILEQgxlaAYXh1OpMyA4L2DDd4/4gWgIyzUH4RfcecQCFBq/M
 irO8niW13SscFe2wLUasduqAHbBW4iM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-8UDDxnyCPVaM2WGSyNf1cA-1; Fri, 03 Sep 2021 13:45:19 -0400
X-MC-Unique: 8UDDxnyCPVaM2WGSyNf1cA-1
Received: by mail-wm1-f71.google.com with SMTP id
 r4-20020a1c4404000000b002e728beb9fbso39293wma.9
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 10:45:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K59TWFNfhgS3efbWdzQjx6xmDgV9ebFReZvuleU1Sck=;
 b=j2ohByN3HiMiflsKVLcCKUS5bePy8cXUkLG3qHN7ttW3codOZyx/S09ovijC3ejHL+
 lnijBZ3svjxq/f9XJDmu5F4ZE6aNM5gpUMRpVWrPfBSRkTiQ6nrNTJmpnM42EiF3hj48
 EAFp3rCHA71OYtkN3HtRaDo1MJoJ8FxbUS9gjaoDtOpMAdVp8P4jYNhyRISK19MvYJEH
 JIQWKD3vQ4C6JSXczPGjT97ZcM7LFHKX+fBUx5xgVJSFMy9jcluc/O5w7CyLiBmxezr1
 kunahMtx0WmgwWc4X3DrWfoNK6Oh0nx/1EfjD7tFg7/652lD27wgmh7wbCDiI+zwkOL3
 SVpQ==
X-Gm-Message-State: AOAM530pFtbMA2BUzylXKhMUypFEU9V7Nl2gbuO5lX6EkRZHrMqSOLIa
 gE6AMi2Mz5nZ0YVeTUkdF9u0DW9FsI/BzWO8CHk3PVE9KeoiUlQULFmQUwzH7WaHxQjWZEGAYxg
 49Md7SHWla+V9DR05y3K3GYu2p20StcrlVNcuoqp30x5vl/41lh1AZQ7M3nkEEMEt
X-Received: by 2002:a7b:c94c:: with SMTP id i12mr11438wml.111.1630691118503;
 Fri, 03 Sep 2021 10:45:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIAy0aMS0kUWMR83r4KtnfjVtz7omyPlHG7oTsDgfA6VHWB/zFqHhD8/3CJcD+7S6W6bdAiA==
X-Received: by 2002:a7b:c94c:: with SMTP id i12mr11389wml.111.1630691118170;
 Fri, 03 Sep 2021 10:45:18 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id h16sm5224136wre.52.2021.09.03.10.45.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 10:45:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/28] hw/hyperv/vmbus: Remove unused vmbus_load/save_req()
Date: Fri,  3 Sep 2021 19:44:43 +0200
Message-Id: <20210903174510.751630-2-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903174510.751630-1-philmd@redhat.com>
References: <20210903174510.751630-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.392, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
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


