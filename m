Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C973140046E
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 19:59:52 +0200 (CEST)
Received: from localhost ([::1]:58160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMDTj-0007tx-Pq
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 13:59:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMDH9-0000t6-K9
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:46:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMDH5-0001pO-JB
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:46:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630691207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RC7jHm0YE2K1GdbYZ8il6kV9I4tGJG8Mj2QiHey69tU=;
 b=bTs5roZhdbu7tae5mzlU+PPfr6h54CG0GiNmBkJLAtda1iGdXMtXDa5G4RvxIgkYx8Uxm+
 B0t7MKfXAVuSvjt3TYZDkCRA0L6tN3cPBqkv3Sd6A7JKINlzGoqrkaTd4ROntXTmP4Wndj
 C03VcPD6/jCITZhPAj8wSnp0Kxw98tI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-mLZJkXjYN_6JYx4RUKueEw-1; Fri, 03 Sep 2021 13:46:46 -0400
X-MC-Unique: mLZJkXjYN_6JYx4RUKueEw-1
Received: by mail-wr1-f71.google.com with SMTP id
 b8-20020a5d5508000000b001574e8e9237so1817566wrv.16
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 10:46:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RC7jHm0YE2K1GdbYZ8il6kV9I4tGJG8Mj2QiHey69tU=;
 b=uK4xFXQvlIBi3dAxc/+E6eYUj0bUa4OEXdTj9pLjIFIruzUWfSjPzP0W7RbPCFnQyu
 /AXex5XBRFdPn5VqsNg1a9yA1tvUwKuQp3OkNZKIj87U+RfbykAZapvc8hC+EZSTR94W
 IM2N0cXEfEkWIDCRjY0tpUoNujNSK8xILGsEQG/GyPnAdu7c80xyL0zDJaNjGsnmeh3K
 SLu1qiJIy4ncYLGq1pO6/QEfV9OJ8bLr4qcO4zv92F6iV2ppPDWxUW2ddVBRQWleNeac
 o2Szh1gpOUoaSiDYk6btoi6VgTkrtMhTWKnv4mQV/TxIsRwqhHA/v/PTe7NaEjJAdTc6
 kTYg==
X-Gm-Message-State: AOAM533k0eROk+GgFlCDBGJ4dojT2WutgUx/VB4dGXK3jePSiKC3jwW/
 lkV3EZR0Et3f/RJrjK0LFV6R6ol8/i6rXRWFQ/zftOebCHbyjo+ZpQtVX8JLwjSTyqf/hu5CivQ
 6Pnki7DpfLx5yS8qFsdkkKRdI3yIoJo1AtrErhooe/CeX+U/MjV3UAhg0VI64CTdl
X-Received: by 2002:adf:df08:: with SMTP id y8mr295592wrl.124.1630691204712;
 Fri, 03 Sep 2021 10:46:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyEqlLCvDbe8I1c0cYqTm2SctcTai282wCFFigi8GMIfzPOHrQq6E8hmfp7BS2oQrCH6lRkbQ==
X-Received: by 2002:adf:df08:: with SMTP id y8mr295545wrl.124.1630691204405;
 Fri, 03 Sep 2021 10:46:44 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id z2sm18833wma.45.2021.09.03.10.46.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 10:46:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 17/28] hw/rdma: Replace g_memdup() by g_memdup2()
Date: Fri,  3 Sep 2021 19:44:59 +0200
Message-Id: <20210903174510.751630-18-philmd@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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

Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538

  The old API took the size of the memory to duplicate as a guint,
  whereas most memory functions take memory sizes as a gsize. This
  made it easy to accidentally pass a gsize to g_memdup(). For large
  values, that would lead to a silent truncation of the size from 64
  to 32 bits, and result in a heap area being returned which is
  significantly smaller than what the caller expects. This can likely
  be exploited in various modules to cause a heap buffer overflow.

Replace g_memdup() by the safer g_memdup2() wrapper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/rdma/rdma_utils.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/rdma/rdma_utils.c b/hw/rdma/rdma_utils.c
index 98df58f6897..6d6b8286b69 100644
--- a/hw/rdma/rdma_utils.c
+++ b/hw/rdma/rdma_utils.c
@@ -71,7 +71,7 @@ void rdma_protected_gqueue_append_int64(RdmaProtectedGQueue *list,
                                         int64_t value)
 {
     qemu_mutex_lock(&list->lock);
-    g_queue_push_tail(list->list, g_memdup(&value, sizeof(value)));
+    g_queue_push_tail(list->list, g_memdup2(&value, sizeof(value)));
     qemu_mutex_unlock(&list->lock);
 }
 
-- 
2.31.1


