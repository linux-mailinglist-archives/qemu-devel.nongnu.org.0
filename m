Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 837715AB811
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 20:16:38 +0200 (CEST)
Received: from localhost ([::1]:49156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUBDZ-0007n7-Fp
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 14:16:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oUAZd-0006A0-NR
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 13:35:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oUAZa-0007QK-Nt
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 13:35:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662140117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8mPAEteOwzwBNYOgDzE0qX3WjzRiguEjupjtAf6QR64=;
 b=B79kUTFpgE62YcXU+mpMAXkrKdU65Hd3N6iP8AUjhkj0qqp19l5EcLRKxARzRqobJdsrDd
 lGXz+syKNMbKWTI44lSZgtou3z6C9mJv/Wv32OoN32qGisHp0wbKqTpUQ3oB6qbEylXRUS
 DxNQKyJWbx4IPh/TfTGC0j74e9iICxw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-EUIPNPwSO_6qELylnLWxrg-1; Fri, 02 Sep 2022 13:35:14 -0400
X-MC-Unique: EUIPNPwSO_6qELylnLWxrg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 30D931C0755B;
 Fri,  2 Sep 2022 17:35:14 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F3C59C15BB3;
 Fri,  2 Sep 2022 17:35:11 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Bandan Das <bsd@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Gerd Hoffmann <kraxel@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: [PATCH 7/8] tests: Unfold qtest_pci
Date: Fri,  2 Sep 2022 19:34:51 +0200
Message-Id: <20220902173452.1904-8-quintela@redhat.com>
In-Reply-To: <20220902173452.1904-1-quintela@redhat.com>
References: <20220902173452.1904-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will need to configure depending on machine type for x86_64 on the
following patch.  It has only two users anyways.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 tests/qtest/meson.build | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 67b3b678d3..6f17d901ba 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -32,10 +32,6 @@ if config_host.has_key('CONFIG_MODULES')
   qtests_generic += [ 'modules-test' ]
 endif
 
-qtests_pci = \
-  (config_all_devices.has_key('CONFIG_VGA') ? ['display-vga-test'] : []) +                  \
-  (config_all_devices.has_key('CONFIG_IVSHMEM_DEVICE') ? ['ivshmem-test'] : [])
-
 qtests_cxl = \
   (config_all_devices.has_key('CONFIG_CXL') ? ['cxl-test'] : [])
 
@@ -84,10 +80,11 @@ qtests_i386 = \
    config_all_devices.has_key('CONFIG_Q35') and                                             \
    config_all_devices.has_key('CONFIG_VIRTIO_PCI') and                                      \
    slirp.found() ? ['virtio-net-failover'] : []) +                                          \
+  (config_all_devices.has_key('CONFIG_VGA') ? ['display-vga-test'] : []) +		    \
+  (config_all_devices.has_key('CONFIG_IVSHMEM_DEVICE') ? ['ivshmem-test'] : []) +	    \
   (config_all_devices.has_key('CONFIG_Q35') ? ['q35-test'] : []) +			    \
   (config_all_devices.has_key('CONFIG_Q35') ? ['tco-test'] : []) +			    \
   (unpack_edk2_blobs ? ['bios-tables-test'] : []) +                                         \
-  qtests_pci +                                                                              \
   qtests_cxl +                                                                              \
   ['fdc-test',
    'ide-test',
@@ -175,7 +172,9 @@ qtests_ppc64 = \
   (slirp.found() ? ['pxe-test'] : []) +              \
   (config_all_devices.has_key('CONFIG_USB_UHCI') ? ['usb-hcd-uhci-test'] : []) +             \
   (config_all_devices.has_key('CONFIG_USB_XHCI_NEC') ? ['usb-hcd-xhci-test'] : []) +         \
-  qtests_pci + ['migration-test', 'numa-test', 'cpu-plug-test', 'drive_del-test']
+  (config_all_devices.has_key('CONFIG_VGA') ? ['display-vga-test'] : []) +		     \
+  (config_all_devices.has_key('CONFIG_IVSHMEM_DEVICE') ? ['ivshmem-test'] : []) +	     \
+  ['migration-test', 'numa-test', 'cpu-plug-test', 'drive_del-test']
 
 qtests_sh4 = (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'] : [])
 qtests_sh4eb = (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'] : [])
-- 
2.37.2


