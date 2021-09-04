Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6A7400D2E
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 23:47:17 +0200 (CEST)
Received: from localhost ([::1]:42114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMdVM-0005Mh-RB
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 17:47:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdLQ-0005lP-5c
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:37:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdLJ-0001EV-Vj
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:36:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630791413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jYn+qduJJUwE42My/YILr3Fq6lwJXG71AaCS4n8QCXM=;
 b=idsfPlkFU4P8MTdYw0DVIirgsVYKd2Hmwfm2o4hxi4l8cCuC10XuOZpcfNbrP8DU71zUSl
 Ss7RLH9C9sy6Hb74zuarTIe1LqtpnZfcijBF+BZLn/TjZRaqmbILTFOBSxOAnTNug5pYAP
 IPPWTxZ73N0qKE3oir3jgsmi6ECt9p0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-fJxgV6ZDP7aoNYWcWcpYOA-1; Sat, 04 Sep 2021 17:36:51 -0400
X-MC-Unique: fJxgV6ZDP7aoNYWcWcpYOA-1
Received: by mail-ed1-f70.google.com with SMTP id
 bf22-20020a0564021a5600b003c86b59e291so1352807edb.18
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 14:36:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=jYn+qduJJUwE42My/YILr3Fq6lwJXG71AaCS4n8QCXM=;
 b=aCAaJLHOqkQwZa8Egny+8jxiJeigaJgzFO5Yxlh+ep5sDXiK9eeFblYIMSHWK4EMig
 4AqnWLWX6OfCUv0PFLw+ToRUqv4KhkrUg27ACEMhuNPSqlFGeQvwxNttrvneusbD8V1e
 ErldVoGtxhn6/X+wyR5CJKTwhPCSW3SxL1R2OtpiOyuJ3s9Po1qzQgOqs6ip1MoL8vVQ
 InnCrMRpR6k0Mb2FeU7YzpWW8BbCeKXIXwntv8a0XVqMWV4Kdqe/touuZl7Lcakuhkzy
 WdDdkXxx6hxwLkj9IPvFcARMXbBHjwOmjD5TcllFaIugTIzLhVB44mNX6erRYKUnpCN1
 2+Jw==
X-Gm-Message-State: AOAM533NguOJ0YMpfVLX1M7S2255oW0l3l4/bPOCIL2ny2BdF2Ixr9+P
 k3aCGP9RshX5KRm2ttcO1XboZHlL09adPBfjR/xZydgtAZu2cqR8wCwoMYeG8r2rWPXTeL9ZjXE
 VHpWAB1X27gy5UGHWIGs7sM0cCRObFj64eQImOUImsuxCQS1J0oEYxIqcd2q6
X-Received: by 2002:a17:906:b84a:: with SMTP id
 ga10mr5865260ejb.143.1630791410442; 
 Sat, 04 Sep 2021 14:36:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkor17kA1bLu8iQrXgO8KTeY8BXmYlVIAM5SCtsUibkWZoPpZ9grxpXOM7qgZyT7xt8Odtqw==
X-Received: by 2002:a17:906:b84a:: with SMTP id
 ga10mr5865246ejb.143.1630791410231; 
 Sat, 04 Sep 2021 14:36:50 -0700 (PDT)
Received: from redhat.com ([2.55.150.176])
 by smtp.gmail.com with ESMTPSA id kw10sm1525608ejc.111.2021.09.04.14.36.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 14:36:49 -0700 (PDT)
Date: Sat, 4 Sep 2021 17:36:47 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/35] hw/pci: remove all references to find_i440fx function
Message-ID: <20210904213506.486886-18-mst@redhat.com>
References: <20210904213506.486886-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210904213506.486886-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ani Sinha <ani@anisinha.ca>

commit c0e427d6eb5fefc538 ("hw/acpi/ich9: Enable ACPI PCI hot-plug") removed all
uses of find_i440fx() function. This has been replaced by the more generic call
acpi_get_i386_pci_host() which maybe able to find the root bus both for i440fx
machine type as well as for the q35 machine type. There seems to be no more any
need to maintain a i440fx specific version of the api call. Remove it.

Tested by building from a clean tree successfully.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210825031949.919376-2-ani@anisinha.ca>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/pci-host/i440fx.h | 1 -
 hw/pci-host/i440fx.c         | 6 ------
 stubs/pci-host-piix.c        | 7 -------
 stubs/meson.build            | 1 -
 4 files changed, 15 deletions(-)
 delete mode 100644 stubs/pci-host-piix.c

diff --git a/include/hw/pci-host/i440fx.h b/include/hw/pci-host/i440fx.h
index 7fcfd9485c..f068aaba8f 100644
--- a/include/hw/pci-host/i440fx.h
+++ b/include/hw/pci-host/i440fx.h
@@ -45,6 +45,5 @@ PCIBus *i440fx_init(const char *host_type, const char *pci_type,
                     MemoryRegion *pci_memory,
                     MemoryRegion *ram_memory);
 
-PCIBus *find_i440fx(void);
 
 #endif
diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
index cd87e21a9b..e08716142b 100644
--- a/hw/pci-host/i440fx.c
+++ b/hw/pci-host/i440fx.c
@@ -314,12 +314,6 @@ PCIBus *i440fx_init(const char *host_type, const char *pci_type,
     return b;
 }
 
-PCIBus *find_i440fx(void)
-{
-    PCIHostState *s = PCI_HOST_BRIDGE(object_resolve_path("/machine/i440fx", NULL));
-    return s ? s->bus : NULL;
-}
-
 static void i440fx_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
diff --git a/stubs/pci-host-piix.c b/stubs/pci-host-piix.c
deleted file mode 100644
index 93975adbfe..0000000000
--- a/stubs/pci-host-piix.c
+++ /dev/null
@@ -1,7 +0,0 @@
-#include "qemu/osdep.h"
-#include "hw/pci-host/i440fx.h"
-
-PCIBus *find_i440fx(void)
-{
-    return NULL;
-}
diff --git a/stubs/meson.build b/stubs/meson.build
index 275ac89c16..beee31ec73 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -26,7 +26,6 @@ stub_ss.add(files('module-opts.c'))
 stub_ss.add(files('monitor.c'))
 stub_ss.add(files('monitor-core.c'))
 stub_ss.add(files('pci-bus.c'))
-stub_ss.add(files('pci-host-piix.c'))
 stub_ss.add(files('qemu-timer-notify-cb.c'))
 stub_ss.add(files('qmp_memory_device.c'))
 stub_ss.add(files('qmp-command-available.c'))
-- 
MST


