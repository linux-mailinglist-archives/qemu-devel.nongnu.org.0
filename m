Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFD445B684
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 09:26:37 +0100 (CET)
Received: from localhost ([::1]:41702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpnbw-0008Q9-3c
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 03:26:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mpnSe-0001NV-GX
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 03:17:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mpnSb-0008Uh-EH
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 03:16:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637741814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fvwI20JB+80xzWAKjAWU9MXEJRcSpG/XWeV+rljX8gM=;
 b=TRlNjmfHcQylqNCbgeUT1FK9JxE9M01Ke6QEfgblOMHZTMWWCpAABeQ6WqjecpA75JyT2K
 pXVcsLIsPjAxY2nF+aT4rVo0Y2Jytja2r+bEr/sF42hfMIWkpTaffqw5+qFmtWc/fX3G5j
 +2DaYU4/pqtx0K00hsS1diEXLd6WWKs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-124-sQclieCZMTCX-Q1BR1BTtw-1; Wed, 24 Nov 2021 03:16:50 -0500
X-MC-Unique: sQclieCZMTCX-Q1BR1BTtw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86CD285B665;
 Wed, 24 Nov 2021 08:16:49 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 93C6B19C46;
 Wed, 24 Nov 2021 08:16:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1051C180084B; Wed, 24 Nov 2021 09:16:37 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] microvm: use MachineState->dumpdtb
Date: Wed, 24 Nov 2021 09:16:37 +0100
Message-Id: <20211124081637.525180-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There already is a machine property to dump the device tree for
debugging purposes, and the helper function qemu_fdt_dumpdtb()
implementing the dumping.  Make microvm use it for consistency.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/i386/microvm-dt.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/hw/i386/microvm-dt.c b/hw/i386/microvm-dt.c
index 875ba9196394..e6f5a90209c5 100644
--- a/hw/i386/microvm-dt.c
+++ b/hw/i386/microvm-dt.c
@@ -330,12 +330,5 @@ void dt_setup_microvm(MicrovmMachineState *mms)
     fprintf(stderr, "%s: add etc/fdt to fw_cfg\n", __func__);
     fw_cfg_add_file(x86ms->fw_cfg, "etc/fdt", mms->fdt, size);
 
-    if (debug) {
-        fprintf(stderr, "%s: writing microvm.fdt\n", __func__);
-        g_file_set_contents("microvm.fdt", mms->fdt, size, NULL);
-        int ret = system("dtc -I dtb -O dts microvm.fdt");
-        if (ret != 0) {
-            fprintf(stderr, "%s: oops, dtc not installed?\n", __func__);
-        }
-    }
+    qemu_fdt_dumpdtb(mms->fdt, size);
 }
-- 
2.33.1


