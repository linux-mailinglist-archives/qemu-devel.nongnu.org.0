Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E63207237
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 13:35:34 +0200 (CEST)
Received: from localhost ([::1]:57078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jo3gj-0003FZ-L7
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 07:35:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jo3c6-00045o-9g
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 07:30:46 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:52838
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jo3c0-0007x8-RU
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 07:30:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592998240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=fanjKxgAK/LsGTnft9MxiyfjNtB5nsw2oHCpiHFskdw=;
 b=F/Aze3QrRLGarQh7pgR8F1rYaWawLN3rJiHCG+Um/xnkxC+MqcVeJpf9EESWGs1VRgUIc2
 ZoeLfmguK/jK9zJCIriY5tZfhYLnyoZqmwFLJk/ib+FyPNpCQWtMvlSXWz4Pfq3dSDUClQ
 Al/NnQ1K8K6Wb2OZttad+U6dXIbzx48=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-B1I9xvWeMJSyYt5hxpipmw-1; Wed, 24 Jun 2020 07:30:38 -0400
X-MC-Unique: B1I9xvWeMJSyYt5hxpipmw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6555C1005513;
 Wed, 24 Jun 2020 11:30:37 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-67.ams2.redhat.com
 [10.36.112.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1D2BF512FE;
 Wed, 24 Jun 2020 11:30:37 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 02C4431E32; Wed, 24 Jun 2020 13:30:27 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 10/20] audio: deprecate -soundhw hda
Date: Wed, 24 Jun 2020 13:30:16 +0200
Message-Id: <20200624113026.13343-11-kraxel@redhat.com>
In-Reply-To: <20200624113026.13343-1-kraxel@redhat.com>
References: <20200624113026.13343-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 03:27:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-ppc@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add deprecation message to the audio init function.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/audio/intel-hda.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/audio/intel-hda.c b/hw/audio/intel-hda.c
index f673b8317a84..f6cea49686d7 100644
--- a/hw/audio/intel-hda.c
+++ b/hw/audio/intel-hda.c
@@ -25,6 +25,7 @@
 #include "qemu/bitops.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
+#include "qemu/error-report.h"
 #include "hw/audio/soundhw.h"
 #include "intel-hda.h"
 #include "migration/vmstate.h"
@@ -1307,6 +1308,8 @@ static int intel_hda_and_codec_init(PCIBus *bus)
     BusState *hdabus;
     DeviceState *codec;
 
+    warn_report("'-soundhw hda' is deprecated, "
+                "please use '-device intel-hda -device hda-duplex' instead");
     controller = DEVICE(pci_create_simple(bus, -1, "intel-hda"));
     hdabus = QLIST_FIRST(&controller->child_bus);
     codec = qdev_new("hda-duplex");
-- 
2.18.4


