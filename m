Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 234F33BEA57
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 17:06:06 +0200 (CEST)
Received: from localhost ([::1]:59064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m197l-00073v-4e
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 11:06:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m195P-0001Cu-Kn
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 11:03:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m195N-0006j1-EC
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 11:03:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625670216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kygCYc/xTO46JNFLXdnXe2JmZoZzEtwl+GsjRYnanPU=;
 b=CiZu+yhtv080nQzBF6ScerlY807uZFGcMDTUGMSWmdrvdC4OqXuRrPqYQxP5aUVh2STdxV
 6cLVyKmerYQ2bOdmyK26PsvuAJS6HU5+M0VLQBQ7/6TvKZWEQhjyaZAh+CyDKHLOuWVib6
 Y9qr9+yYrtXUccSw7vfnIuXCaGUiQp4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-7VUDQJm6Mz-bNnVNkGRRRg-1; Wed, 07 Jul 2021 11:03:35 -0400
X-MC-Unique: 7VUDQJm6Mz-bNnVNkGRRRg-1
Received: by mail-wr1-f72.google.com with SMTP id
 h15-20020adffd4f0000b0290137e68ed637so859993wrs.22
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 08:03:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kygCYc/xTO46JNFLXdnXe2JmZoZzEtwl+GsjRYnanPU=;
 b=rD8IzzDPYBnFY4NVjqJPWnDErmF2AL7wyrICSNkzHiMQ52JwlOSdU+YA8bmjgnC/4E
 9PgV/y17vN0IOD/9VrFoqYqBHiSBJlBX1lPnxeVdXR3akJh+7jSQi8am9lY5bhMcjZyi
 bCYr+a8NefxmSldUErjZ56hLSvk1t7xYyu55NntXcTjjsUdcffTubi7N5y51yRLt5OTp
 WF91t9llZiNnMZao+ULbghBql5jsHxxlheV1y8pwTGMjWR9Y4M4b7z+ENdlxwPMzQb0Y
 t8HYZD1edms4KqjSwR7j4XfZquGZyO+SssrzgGeMjIMmxXfvVhEAjV5AQwUUshu0Txu9
 dB4w==
X-Gm-Message-State: AOAM531IEP8zF8BlklSu+9+U19w8ZWU48iP4tQw/BLECk0KR5GVDZVvE
 ZSaeBvRthqeb1ozVNHGecgjh/0Kh/g0mf0N7FCxT8jYoX4BsRkbAyT27gxgcOFJEHqmAN77JnWG
 KFqluI4/vrFgNtPJOWERO0bSBnLstKYSXO+91MC3pUYOSlqSQ8Fx34Gl88e/5
X-Received: by 2002:a1c:e485:: with SMTP id b127mr42089wmh.91.1625670213760;
 Wed, 07 Jul 2021 08:03:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlnx3jL2IxlGvqagTUowEl+dYVC4lN/vcxLT+QAhWB6gAztMEZ/GJ6J0yvqxDHxlcUTwS5yA==
X-Received: by 2002:a1c:e485:: with SMTP id b127mr42040wmh.91.1625670213456;
 Wed, 07 Jul 2021 08:03:33 -0700 (PDT)
Received: from redhat.com ([2.55.150.102])
 by smtp.gmail.com with ESMTPSA id f9sm21334891wrm.48.2021.07.07.08.03.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 08:03:33 -0700 (PDT)
Date: Wed, 7 Jul 2021 11:03:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/13] acpi: pc: revert back to v5.2 PCI slot enumeration
Message-ID: <20210707150157.52328-10-mst@redhat.com>
References: <20210707150157.52328-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210707150157.52328-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 John Sucaet <john.sucaet@ekinops.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

Commit [1] moved _SUN variable from only hot-pluggable to
all devices. This made linux kernel enumerate extra slots
that weren't present before. If extra slot happens to be
be enumerated first and there is a device in th same slot
but on other bridge, linux kernel will add -N suffix to
slot name of the later, thus changing NIC name compared to
QEMU 5.2. This in some case confuses systemd, if it is
using SLOT NIC naming scheme and interface name becomes
not the same as it was under QEMU-5.2.

Reproducer QEMU CLI:
  -M pc-i440fx-5.2 -nodefaults \
  -device pci-bridge,chassis_nr=1,id=pci.1,bus=pci.0,addr=0x3 \
  -device virtio-net-pci,id=nic1,bus=pci.1,addr=0x1 \
  -device virtio-net-pci,id=nic2,bus=pci.1,addr=0x2 \
  -device virtio-net-pci,id=nic3,bus=pci.1,addr=0x3

with RHEL8 guest produces following results:
  v5.2:
     kernel: virtio_net virtio0 ens1: renamed from eth0
     kernel: virtio_net virtio2 ens3: renamed from eth2
     kernel: virtio_net virtio1 enp1s2: renamed from eth1
      (slot 2 is assigned to empty bus 0 slot and virtio1
       is assigned to 2-2 slot, and renaming falls back,
       for some reason, to path based naming scheme)

  v6.0:
     kernel: virtio_net virtio0 ens1: renamed from eth0
     kernel: virtio_net virtio2 ens3: renamed from eth2
     systemd-udevd[299]: Error changing net interface name 'eth1' to 'ens3': File exists
     systemd-udevd[299]: could not rename interface '3' from 'eth1' to 'ens3': File exists
      (with commit [1] kernel assigns virtio2 to 3-2 slot
       since bridge advertises _SUN=0x3 and kernel assigns
       slot 3 to bridge. Still it manages to rename virtio2
       correctly to ens3, however systemd gets confused with virtio1
       where slot allocation exactly the same (2-2) as in 5.2 case
       and tries to rename it to ens3 which is rightfully taken by
       virtio2)

I'm not sure what breaks in systemd interface renaming (it probably
should be investigated), but on QEMU side we can safely revert
_SUN to 5.2 behavior (i.e. avoid cold-plugged bridges and non
hot-pluggable device classes), without breaking acpi-index, which uses
slot numbers but it doesn't have to use _SUN, it could use an arbitrary
variable name that has the same slot value).
It will help existing VMs to keep networking with non trivial
configs in working order since systemd will do its interface
renaming magic as it used to do.

1)
Fixes: b7f23f62e40 (pci: acpi: add _DSM method to PCI devices)
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20210624204229.998824-3-imammedo@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Tested-by: John Sucaet <john.sucaet@ekinops.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/acpi-build.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 796ffc6f5c..357437ff1d 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -435,11 +435,15 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
         aml_append(dev, aml_name_decl("_ADR", aml_int(slot << 16)));
 
         if (bsel) {
-            aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
+            /*
+             * Can't declare _SUN here for every device as it changes 'slot'
+             * enumeration order in linux kernel, so use another variable for it
+             */
+            aml_append(dev, aml_name_decl("ASUN", aml_int(slot)));
             method = aml_method("_DSM", 4, AML_SERIALIZED);
             aml_append(method, aml_return(
                 aml_call6("PDSM", aml_arg(0), aml_arg(1), aml_arg(2),
-                          aml_arg(3), aml_name("BSEL"), aml_name("_SUN"))
+                          aml_arg(3), aml_name("BSEL"), aml_name("ASUN"))
             ));
             aml_append(dev, method);
         }
@@ -466,6 +470,7 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
             aml_append(method, aml_return(aml_int(s3d)));
             aml_append(dev, method);
         } else if (hotplug_enabled_dev) {
+            aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
             /* add _EJ0 to make slot hotpluggable  */
             method = aml_method("_EJ0", 1, AML_NOTSERIALIZED);
             aml_append(method,
-- 
MST


