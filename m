Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE3B653145
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 14:05:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7ylp-0003zR-LN; Wed, 21 Dec 2022 08:04:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ylo-0003yx-2Y
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:04:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ylm-0003ux-KM
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:04:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671627865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OY03Jipu/EW/PEsu2X6l4LuB6pikOF9AmfATTzvBABs=;
 b=Izkb9zpun0cVPyplR9A1rpO26iw7KuNn1hnaeZTrayoGw3tM7nEiLyv1pH4GNOc6daV/fJ
 SfeRjTwJZXxmk8fwM/sgC+/m0x69KuAM6Ek+D1GQW+tjwBdz4BSbjLajq/qfFgEoDJO/LC
 QfWIB65W1Zo5WpSW4cEYNM6k6J/DAHw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-592-9sqm-LdbO3apPkAzyC19Fg-1; Wed, 21 Dec 2022 08:04:24 -0500
X-MC-Unique: 9sqm-LdbO3apPkAzyC19Fg-1
Received: by mail-ed1-f72.google.com with SMTP id
 h8-20020a056402280800b0046af59e0986so11435678ede.22
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 05:04:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OY03Jipu/EW/PEsu2X6l4LuB6pikOF9AmfATTzvBABs=;
 b=KTF3kEKsBufVeU8Yr9AAppTF+ZDaS71Oq0yISEm00aqrDkugg4FpiHS/EQO+MZDdVM
 d188Ydt/dhqGszISoyv33I83CulJBGR4dez0k3iBp02dDvUs5w+Nv/yyV8s3PKb5wK9l
 JL4+P1GmPwOsCVBvvK1ykOE24upkic/3z0uV26ba3PTMchR2gKqGSka7Wo1ycSs/nwLb
 1LP65qCfTWcWWnsrVkofbtkkdxISgY1lJiKnujC0TduZ2B3yRMDC8xZNnZrcuFsPVClF
 NM5zjr4Rbl8g+IPAYEALlBGanXTRo4cwdUvEM71JlI/O3ulsSokhruyBd+i/xptr9ViP
 +pgg==
X-Gm-Message-State: AFqh2kr3UaMB3D8KQqyAV5K+YlKhjWhhL427UUWym60FC7JcEJ02Sm05
 HFxWJFxKlnulIEwxtwBsXUPQ0wNf/5via1C7cXQh13aXt94jXen3H0xPpa6J7OMtPj36syh9c7d
 VMx7b5ZjbCdhJUhKEa2h+/Sigfnh2fgZuE/tztbE4Yb0DkM81RE7rhDbQwtAW
X-Received: by 2002:a17:906:7046:b0:7ae:8194:7e06 with SMTP id
 r6-20020a170906704600b007ae81947e06mr1245943ejj.56.1671627860932; 
 Wed, 21 Dec 2022 05:04:20 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv1yiJ0bW/qJPoAo7vVZLK15UwhRgblvrYeT8V6GMMLWgrN9snJEniz7zdsjxcKUaVp3L0I0Q==
X-Received: by 2002:a17:906:7046:b0:7ae:8194:7e06 with SMTP id
 r6-20020a170906704600b007ae81947e06mr1245924ejj.56.1671627860622; 
 Wed, 21 Dec 2022 05:04:20 -0800 (PST)
Received: from redhat.com ([2.52.8.61]) by smtp.gmail.com with ESMTPSA id
 p6-20020a5d48c6000000b002366553eca7sm14905405wrs.83.2022.12.21.05.04.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 05:04:16 -0800 (PST)
Date: Wed, 21 Dec 2022 08:04:13 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 "Richard W . M . Jones" <rjones@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 02/41] hw/isa: add trace events for ICH9 LPC chip config access
Message-ID: <20221221130339.1234592-3-mst@redhat.com>
References: <20221221130339.1234592-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221221130339.1234592-1-mst@redhat.com>
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

From: Daniel P. Berrangé <berrange@redhat.com>

These tracepoints aid in understanding and debugging the guest drivers
for the TCO watchdog.

Reviewed-by: Richard W.M. Jones <rjones@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20221216125749.596075-3-berrange@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/isa/lpc_ich9.c   | 3 +++
 hw/isa/trace-events | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index 6c44cc9767..cea73924b4 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -52,6 +52,7 @@
 #include "hw/nvram/fw_cfg.h"
 #include "qemu/cutils.h"
 #include "hw/acpi/acpi_aml_interface.h"
+#include "trace.h"
 
 /*****************************************************************************/
 /* ICH9 LPC PCI to ISA bridge */
@@ -162,6 +163,7 @@ static void ich9_cc_write(void *opaque, hwaddr addr,
 {
     ICH9LPCState *lpc = (ICH9LPCState *)opaque;
 
+    trace_ich9_cc_write(addr, val, len);
     ich9_cc_addr_len(&addr, &len);
     memcpy(lpc->chip_config + addr, &val, len);
     pci_bus_fire_intx_routing_notifier(pci_get_bus(&lpc->d));
@@ -177,6 +179,7 @@ static uint64_t ich9_cc_read(void *opaque, hwaddr addr,
     uint32_t val = 0;
     ich9_cc_addr_len(&addr, &len);
     memcpy(&val, lpc->chip_config + addr, len);
+    trace_ich9_cc_read(addr, val, len);
     return val;
 }
 
diff --git a/hw/isa/trace-events b/hw/isa/trace-events
index b8f877e1ed..c4567a9b47 100644
--- a/hw/isa/trace-events
+++ b/hw/isa/trace-events
@@ -21,3 +21,7 @@ via_pm_io_read(uint32_t addr, uint32_t val, int len) "addr 0x%x val 0x%x len 0x%
 via_pm_io_write(uint32_t addr, uint32_t val, int len) "addr 0x%x val 0x%x len 0x%x"
 via_superio_read(uint8_t addr, uint8_t val) "addr 0x%x val 0x%x"
 via_superio_write(uint8_t addr, uint32_t val) "addr 0x%x val 0x%x"
+
+# lpc_ich9.c
+ich9_cc_write(uint64_t addr, uint64_t val, unsigned len) "addr=0x%"PRIx64 " val=0x%"PRIx64 " len=%u"
+ich9_cc_read(uint64_t addr, uint64_t val, unsigned len) "addr=0x%"PRIx64 " val=0x%"PRIx64 " len=%u"
-- 
MST


