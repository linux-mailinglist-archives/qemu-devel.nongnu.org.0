Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D53E73FFF11
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 13:23:23 +0200 (CEST)
Received: from localhost ([::1]:60764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM7I2-0005xS-TD
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 07:23:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mM73y-0007m2-NZ
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:08:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mM73s-0001US-Os
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:08:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630667324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dyVB6AzxmMS8BlTCGJx6yUBvjK62NisiC2d6bnlid2E=;
 b=V4WrOfve+2o/sCv5zyC3jTO9ur6gUOUZr5C6+PFzI2mN9p7oPx/nLghhhfRIPPfw2pYG77
 hOczQ/GIlZiKaff2JxzX4E2skWqmU4rOZ9M536pvKczctqiO5GELGkOHtc0lUkYtTZp75k
 PjRAgPKW1DmRrh+OfxsoHqhRg9m1tAY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-i432d88ANpKW6nktwWJAJw-1; Fri, 03 Sep 2021 07:08:43 -0400
X-MC-Unique: i432d88ANpKW6nktwWJAJw-1
Received: by mail-wr1-f70.google.com with SMTP id
 p10-20020a5d68ca000000b001552bf8b9daso1449532wrw.22
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 04:08:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dyVB6AzxmMS8BlTCGJx6yUBvjK62NisiC2d6bnlid2E=;
 b=XgNTdSZKD2PrAQIiQOWnIc0z1K354DOYb/v1v/D7+CWRbjCcBy+8/AlupPR2X/uCFh
 cTCc4RD3kT0L73/Nsxa6j+5nQ5qUrH0Sfmm4lGfdEo98TCme1KAecYFfcwBixIMVk9Oz
 LZiFJoUX1apIJA0qIc267xzgxwf3BLinzaO1ef5+pngd5M95jQgGx3Vg3ECPi2kmRjlP
 EkAimT7jMkg++qJutk91/O7IkuoWkXEvJ2KjtbQpQyLiNkutyMepc0tm5EasWFXVMWyD
 KYzg02NA5CV7H+/u/WEvbfoygJc6pvxRU0UQWZkEDLN8TM0F5nHR4KfzIron37y1t5T0
 gYoA==
X-Gm-Message-State: AOAM531Jlu0/sIwGb4vQChY87ArmdEv2OfWu3tzK1rqgkyDHoI+NPrIO
 WsaQHwSFfAScy2UhNWXrYB4jo4pwRDdNdahxVmAg2Cp++fl6Wrm+3sGaj6RE7eagOxsuu2f3Vr9
 xW7JznGZHhne9DabMq+xmayVA/lHr0ez4R3GPvkiLLSCTP902kvbzZezBgXv17oT+
X-Received: by 2002:a05:600c:5102:: with SMTP id
 o2mr2733937wms.104.1630667322035; 
 Fri, 03 Sep 2021 04:08:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzb4sgtV74rpbNMK7lro6Zp2a1Bicv7CxBMUuULP/VYB1PgOM9RnbhlKgyVZuLyyqF/XcA8KA==
X-Received: by 2002:a05:600c:5102:: with SMTP id
 o2mr2733882wms.104.1630667321792; 
 Fri, 03 Sep 2021 04:08:41 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 w9sm4439669wrs.7.2021.09.03.04.08.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 04:08:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 17/28] hw/rdma: Replace g_memdup() by g_memdup2_qemu()
Date: Fri,  3 Sep 2021 13:06:51 +0200
Message-Id: <20210903110702.588291-18-philmd@redhat.com>
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538

  The old API took the size of the memory to duplicate as a guint,
  whereas most memory functions take memory sizes as a gsize. This
  made it easy to accidentally pass a gsize to g_memdup(). For large
  values, that would lead to a silent truncation of the size from 64
  to 32 bits, and result in a heap area being returned which is
  significantly smaller than what the caller expects. This can likely
  be exploited in various modules to cause a heap buffer overflow.

Replace g_memdup() by the safer g_memdup2_qemu() wrapper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/rdma/rdma_utils.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/rdma/rdma_utils.c b/hw/rdma/rdma_utils.c
index 98df58f6897..9792b1c8ef5 100644
--- a/hw/rdma/rdma_utils.c
+++ b/hw/rdma/rdma_utils.c
@@ -71,7 +71,7 @@ void rdma_protected_gqueue_append_int64(RdmaProtectedGQueue *list,
                                         int64_t value)
 {
     qemu_mutex_lock(&list->lock);
-    g_queue_push_tail(list->list, g_memdup(&value, sizeof(value)));
+    g_queue_push_tail(list->list, g_memdup2_qemu(&value, sizeof(value)));
     qemu_mutex_unlock(&list->lock);
 }
 
-- 
2.31.1


