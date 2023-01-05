Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD62365E78D
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 10:20:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDMML-0003BU-2Z; Thu, 05 Jan 2023 04:16:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMMG-00034n-0W
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:16:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMME-0007aP-2q
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:16:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672910176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qI3G7+NMQMU0Spg/H09uIDhVgCH9MOTadRqiBKpnSDc=;
 b=gF30ZfF8m9EbzEAAvAUbzz1QQ4uhJqGvc2M4pJFUlhkPZCiwM/s17zXqxbB5hMgLeFaO7y
 xyv2o7E4efLrX7M5CObkWMLZsyh3umsor3wteA8Z20uAt4FcgfuKetp+iHryeNkczzd+12
 T7pUkysglSOeJUmR1C3KyhuTgWk36mk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-312-DuYDzaDWMDWThBCHJlao3g-1; Thu, 05 Jan 2023 04:16:15 -0500
X-MC-Unique: DuYDzaDWMDWThBCHJlao3g-1
Received: by mail-wm1-f70.google.com with SMTP id
 m8-20020a05600c3b0800b003d96bdce12fso17733070wms.9
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 01:16:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qI3G7+NMQMU0Spg/H09uIDhVgCH9MOTadRqiBKpnSDc=;
 b=5H+Wo32qdDifXszMNKwbtZLskPsLeQBlfbwIEny6krLfrTuSzgX5D08Aivb4tFDqto
 9zEQRRqdA4iJnZ9/1tysI8UyLEi2JC2W4JBRuNHOaVCb6y46bEeflRVcK+fCBHb8L5qO
 yRg0EYVHrFzqQin90CLevFnND/3SEhrzaH8cwBhgCZxziun0A3mMDMn+FE8tjNbw3P8W
 klDxPdxMM8vvx9zZTUrYWQoCb32UJ+0gAksQ98YrXnSLx4wGOI2ZS1obpUvD5KtaoYo3
 12RkNMouGoWKwkh/1FzGiRTpbkn+6GoPE9BSiOma9wnKUY3tKDFlpCWqDjJUqfRij9NH
 jNMQ==
X-Gm-Message-State: AFqh2kpiAmICtEWl54P/cvr9yO5PTDp1Mt+hf3zlVWKMquyXI8DzIt74
 llj/SIRDMwO77lWUahyQuTfEYlvZjSFXjxe+xq0sJq04OjbbJWy6V7vMb6T7Y7ZI4qm6k+rcv9Y
 9BvD3v43pbbJZmjmhZZAiaTNFta+B025f29bHeasgNzkOT8zev+hmSf4tLZQK
X-Received: by 2002:a05:6000:49:b0:242:6777:c7e2 with SMTP id
 k9-20020a056000004900b002426777c7e2mr29793733wrx.31.1672910174023; 
 Thu, 05 Jan 2023 01:16:14 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtF16DX4KeryuEYVOq4e4BVTepgZ+ZGOD/rtcafMGeJShmXDAqM7AnoapDSFE4UZWRMBblJDA==
X-Received: by 2002:a05:6000:49:b0:242:6777:c7e2 with SMTP id
 k9-20020a056000004900b002426777c7e2mr29793713wrx.31.1672910173688; 
 Thu, 05 Jan 2023 01:16:13 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 b9-20020adfde09000000b00276d8c2332fsm37286429wrm.108.2023.01.05.01.16.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 01:16:13 -0800 (PST)
Date: Thu, 5 Jan 2023 04:16:10 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Edgar E . Iglesias" <edgar@zeroasic.com>
Subject: [PULL 34/51] include/hw/virtio: Break inclusion loop
Message-ID: <20230105091310.263867-35-mst@redhat.com>
References: <20230105091310.263867-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230105091310.263867-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Markus Armbruster <armbru@redhat.com>

hw/virtio/virtio.h and hw/virtio/vhost.h include each other.  The
former doesn't actually need the latter, so drop that inclusion to
break the loop.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Message-Id: <20221222120813.727830-2-armbru@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Reviewed-by: Edgar E. Iglesias <edgar@zeroasic.com>
---
 hw/virtio/virtio-qmp.h     | 1 +
 include/hw/virtio/virtio.h | 1 -
 hw/virtio/virtio.c         | 1 +
 3 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/virtio-qmp.h b/hw/virtio/virtio-qmp.h
index 59681082e5..8af5f5e65a 100644
--- a/hw/virtio/virtio-qmp.h
+++ b/hw/virtio/virtio-qmp.h
@@ -13,6 +13,7 @@
 
 #include "qapi/qapi-types-virtio.h"
 #include "hw/virtio/virtio.h"
+#include "hw/virtio/vhost.h"
 
 #include "qemu/queue.h"
 
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 4219968fd8..77c6c55929 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -22,7 +22,6 @@
 #include "standard-headers/linux/virtio_config.h"
 #include "standard-headers/linux/virtio_ring.h"
 #include "qom/object.h"
-#include "hw/virtio/vhost.h"
 
 /*
  * A guest should never accept this. It implies negotiation is broken
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 02a49d9fa1..f35178f5fc 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -22,6 +22,7 @@
 #include "qom/object_interfaces.h"
 #include "hw/core/cpu.h"
 #include "hw/virtio/virtio.h"
+#include "hw/virtio/vhost.h"
 #include "migration/qemu-file-types.h"
 #include "qemu/atomic.h"
 #include "hw/virtio/virtio-bus.h"
-- 
MST


