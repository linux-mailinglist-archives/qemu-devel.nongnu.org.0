Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF70C25DE58
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Sep 2020 17:49:22 +0200 (CEST)
Received: from localhost ([::1]:56856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kEDxp-0008Gh-Nd
	for lists+qemu-devel@lfdr.de; Fri, 04 Sep 2020 11:49:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kEDu9-0001mj-3B
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 11:45:34 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:47981
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kEDu7-0007dO-5e
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 11:45:32 -0400
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-566-oPozlDBnMQ-BHpZupHXqTg-1; Fri, 04 Sep 2020 11:45:29 -0400
X-MC-Unique: oPozlDBnMQ-BHpZupHXqTg-1
Received: by mail-wr1-f69.google.com with SMTP id 33so2445182wrk.12
 for <qemu-devel@nongnu.org>; Fri, 04 Sep 2020 08:45:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=88VzwaD6NZkIeGp94pbPYvLyI6pXPU6GwCC8RqSJAfo=;
 b=LghF+o5tol75AECYEXfQdl1e4MkaI6K2RgwRCL1DSLItxYIfih4WxogC+Ibs0YYEhl
 /7WFXvRepWxhkGAxpNENKQ6F3LNZcONOF9rvRpVfKDgAVuv+XJojNFfPglGJzaraDjsx
 CqXdUyBj/VeYpzfN37xgu9HDqddcMWt8L/i0JQxL6E19d7tFmDyPSl82xNPz9Rkc2GIp
 VFciYpl9uCa4ozxWbZK9PPZRq5epJUrMxbwTwubwDXwk58eoHCq134YscTskxGlVS+CS
 ISMw3GPjimI9XZVG9rwuT21LXE4beuDI6ETlc4gwEbweiyoe+b7ovQtzVBbAW1M4YOda
 /sUg==
X-Gm-Message-State: AOAM531jYdoLblexlt2qrMB5+EW37L1c9BPbHioIRXqVQFDsJiF9IPon
 H0QL2eqQSLajxruInK7AYG1LVtcqvhOa504Ua8iZ19P8qKZqUZZTYKJf4IAsO2VywV0tYXq1eXv
 eXPXaDQPAc7w943w=
X-Received: by 2002:a05:600c:ce:: with SMTP id
 u14mr8537727wmm.137.1599234327831; 
 Fri, 04 Sep 2020 08:45:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyilkRW5eMWPpxwBYcqKhgCNwVWDAI895kp0huJC9lWBKdvi74Ba4SYKpGEMSGFUL3gca1tkw==
X-Received: by 2002:a05:600c:ce:: with SMTP id
 u14mr8537693wmm.137.1599234327664; 
 Fri, 04 Sep 2020 08:45:27 -0700 (PDT)
Received: from localhost.localdomain (50.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.50])
 by smtp.gmail.com with ESMTPSA id f1sm12061964wrt.20.2020.09.04.08.45.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 08:45:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 08/13] dma: Let dma_memory_valid() take MemTxAttrs argument
Date: Fri,  4 Sep 2020 17:44:34 +0200
Message-Id: <20200904154439.643272-9-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200904154439.643272-1-philmd@redhat.com>
References: <20200904154439.643272-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/04 01:57:12
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-block@nongnu.org,
 Joel Stanley <joel@jms.id.au>, David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Andrew Jeffery <andrew@aj.id.au>, Laszlo Ersek <lersek@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let devices specify transaction attributes when calling
dma_memory_valid().

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/ppc/spapr_vio.h | 2 +-
 include/sysemu/dma.h       | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/hw/ppc/spapr_vio.h b/include/hw/ppc/spapr_vio.h
index bed7df60e35..f134f6cf574 100644
--- a/include/hw/ppc/spapr_vio.h
+++ b/include/hw/ppc/spapr_vio.h
@@ -96,7 +96,7 @@ static inline void spapr_vio_irq_pulse(SpaprVioDevice *dev)
 static inline bool spapr_vio_dma_valid(SpaprVioDevice *dev, uint64_t taddr,
                                        uint32_t size, DMADirection dir)
 {
-    return dma_memory_valid(&dev->as, taddr, size, dir);
+    return dma_memory_valid(&dev->as, taddr, size, dir, MEMTXATTRS_UNSPECIFIED);
 }
 
 static inline int spapr_vio_dma_read(SpaprVioDevice *dev, uint64_t taddr,
diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
index f4ade067a46..b322aa5947b 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -73,11 +73,11 @@ static inline void dma_barrier(AddressSpace *as, DMADirection dir)
  * dma_memory_{read,write}() and check for errors */
 static inline bool dma_memory_valid(AddressSpace *as,
                                     dma_addr_t addr, dma_addr_t len,
-                                    DMADirection dir)
+                                    DMADirection dir, MemTxAttrs attrs)
 {
     return address_space_access_valid(as, addr, len,
                                       dir == DMA_DIRECTION_FROM_DEVICE,
-                                      MEMTXATTRS_UNSPECIFIED);
+                                      attrs);
 }
 
 static inline MemTxResult dma_memory_rw_relaxed(AddressSpace *as,
-- 
2.26.2


