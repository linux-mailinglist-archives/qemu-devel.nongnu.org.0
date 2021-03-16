Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D670833DED0
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 21:31:31 +0100 (CET)
Received: from localhost ([::1]:53458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMGLi-0003Cr-QB
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 16:31:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lMGKR-0002fb-TQ
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 16:30:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lMGKO-0006ss-RK
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 16:30:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615926606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+MxMKqR3E/nD/0hw/+dUARAYSR2Yyyz1JnMl3jXtRl0=;
 b=WsswrQL6+jTnoJUzqHLSI6JZeD/5T52+XHMw/8zBySkMMQTje5mMyEa4qxGn2+RnQbIFLP
 i/EODjO2lbEfcttB5rNh91uCgj1akKcNF1N4YhH7LG/0ZfsW1xXPbg77VSjh6jg1iYddI7
 xKNhvdp82ATz/J2Ic/aTsFSmhKDaTJg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-9mUBMvQJOja2kjUJhmVvaw-1; Tue, 16 Mar 2021 16:30:04 -0400
X-MC-Unique: 9mUBMvQJOja2kjUJhmVvaw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 907B981746A;
 Tue, 16 Mar 2021 20:30:03 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D255C10023B0;
 Tue, 16 Mar 2021 20:29:58 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.0] x86:acpi:piix4: reinitialize PM1.CNT on reset
Date: Tue, 16 Mar 2021 16:29:56 -0400
Message-Id: <20210316202956.3041128-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: isaku.yamahata@intel.com, berrange@redhat.com, mst@redhat.com,
 f4bug@amsat.org, reinoud@NetBSD.org, pbonzini@redhat.com,
 isaku.yamahata@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 6be8cf56bc8b made sure that SCI is enabled in PM1.CNT
on reset in acpi_only mode by modifying acpi_pm1_cnt_reset() and
that worked for q35 as expected.

The function was introduced by commit
  eaba51c573a (acpi, acpi_piix, vt82c686: factor out PM1_CNT logic)
that forgot to actually call it at piix4 reset time and as result
SCI_EN wasn't set as was expected by 6be8cf56bc8b in acpi_only mode.

So Windows crashes when it notices that SCI_EN is not set and FADT is
not providing information about how to enable it anymore.
Reproducer:
   qemu-system-x86_64 -enable-kvm -M pc-i440fx-6.0,smm=off -cdrom any_windows_10x64.iso

Fix it by calling acpi_pm1_cnt_reset() at piix4 reset time.

Fixes: 6be8cf56bc8b (acpi/core: always set SCI_EN when SMM isn't supported)
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: isaku.yamahata@intel.com
CC: mst@redhat.com
CC: reinoud@NetBSD.org
CC: isaku.yamahata@gmail.com
CC: berrange@redhat.com
CC: pbonzini@redhat.com
CC: f4bug@amsat.org
---
 hw/acpi/piix4.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 1efc0ded9f..7cab438015 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -325,6 +325,7 @@ static void piix4_pm_reset(DeviceState *dev)
         /* Mark SMM as already inited (until KVM supports SMM). */
         pci_conf[0x5B] = 0x02;
     }
+    acpi_pm1_cnt_reset(&s->ar);
     pm_io_space_update(s);
     acpi_pcihp_reset(&s->acpi_pci_hotplug, !s->use_acpi_root_pci_hotplug);
 }
-- 
2.27.0


