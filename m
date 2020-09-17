Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5742126DD85
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Sep 2020 16:07:50 +0200 (CEST)
Received: from localhost ([::1]:39038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIuZg-00086e-Vf
	for lists+qemu-devel@lfdr.de; Thu, 17 Sep 2020 10:07:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kIuMK-0008Um-9J
 for qemu-devel@nongnu.org; Thu, 17 Sep 2020 09:54:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kIuM3-00084K-Qh
 for qemu-devel@nongnu.org; Thu, 17 Sep 2020 09:53:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600350822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PKcG2d+YGr8WfUNwJYdVrxDHm1+AQbWAXfetZQSmt1s=;
 b=h+HC6R/iUd/EMCVTKBUrt8yZ/u2acaLsKz+VcbJkobCWukYNFX6Adwuy0oBRLRz9I+txrp
 N9IysBfH7V7tbxivHGb7rO96FDhCF6B8RRIvvpaERhQA+MRx6OFuEyAmbd5KDRwy2Ki5/Q
 bygoT9m0ObTw2aC0oSOUILtP5JbxJJI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-b3aCnK5COhOLgbnkbRZb6Q-1; Thu, 17 Sep 2020 09:53:40 -0400
X-MC-Unique: b3aCnK5COhOLgbnkbRZb6Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 870E8186DD39;
 Thu, 17 Sep 2020 13:53:39 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-85.ams2.redhat.com
 [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E71919D6C;
 Thu, 17 Sep 2020 13:53:39 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8220040BFB; Thu, 17 Sep 2020 15:53:24 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 21/21] microvm: enable ramfb
Date: Thu, 17 Sep 2020 15:53:23 +0200
Message-Id: <20200917135323.18022-22-kraxel@redhat.com>
In-Reply-To: <20200917135323.18022-1-kraxel@redhat.com>
References: <20200917135323.18022-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/17 02:01:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.997,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Message-id: 20200915120909.20838-22-kraxel@redhat.com
---
 hw/i386/microvm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 8de8ca864963..60d32722301f 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -39,6 +39,7 @@
 #include "hw/timer/i8254.h"
 #include "hw/rtc/mc146818rtc.h"
 #include "hw/char/serial.h"
+#include "hw/display/ramfb.h"
 #include "hw/i386/topology.h"
 #include "hw/i386/e820_memory_layout.h"
 #include "hw/i386/fw_cfg.h"
@@ -604,6 +605,8 @@ static void microvm_class_init(ObjectClass *oc, void *data)
     object_class_property_set_description(oc,
         MICROVM_MACHINE_AUTO_KERNEL_CMDLINE,
         "Set off to disable adding virtio-mmio devices to the kernel cmdline");
+
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
 }
 
 static const TypeInfo microvm_machine_info = {
-- 
2.27.0


