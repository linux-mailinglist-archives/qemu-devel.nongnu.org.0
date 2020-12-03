Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 102942CD471
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 12:19:52 +0100 (CET)
Received: from localhost ([::1]:33536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkmeN-0008HO-5i
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 06:19:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kkmTB-00039F-94
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 06:08:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kkmT8-0006d8-Jl
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 06:08:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606993693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0Eb/zbQs9oz6VWwiiAaAR/ROTotDtA67JLxituG/22w=;
 b=EudDcGeCyaaVkZlVZC3oqbsbXkdBIaPbHG8NBcelINi8/7i6dEgpXPwgcVjWIYvM3m/2K3
 DYbeC2tyqyaN6Mb2GJYlt9PAfTTS+NmYBccmdxzSUBI/mvDPuzOFqmKp2JWetCkYyaGSiz
 aHZDyw5iczpcHErYl3TX+26O3hcLvAU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-rIT1fhQrNKmVrV4s5bqm9w-1; Thu, 03 Dec 2020 06:08:12 -0500
X-MC-Unique: rIT1fhQrNKmVrV4s5bqm9w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53A5F107AD9A
 for <qemu-devel@nongnu.org>; Thu,  3 Dec 2020 11:08:11 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1B8931A838;
 Thu,  3 Dec 2020 11:08:11 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5FA119DA1; Thu,  3 Dec 2020 12:08:06 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 9/9] qxl: add ui_info callback
Date: Thu,  3 Dec 2020 12:08:05 +0100
Message-Id: <20201203110806.13556-10-kraxel@redhat.com>
In-Reply-To: <20201203110806.13556-1-kraxel@redhat.com>
References: <20201203110806.13556-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This makes qxl respond to user interface window resizes
when not using spice, so it works with gtk and vnc too.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/qxl.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/hw/display/qxl.c b/hw/display/qxl.c
index 431c1070967a..e1df95c3e8a9 100644
--- a/hw/display/qxl.c
+++ b/hw/display/qxl.c
@@ -1177,8 +1177,35 @@ static const QXLInterface qxl_interface = {
     .client_monitors_config = interface_client_monitors_config,
 };
 
+static int qxl_ui_info(void *opaque, uint32_t idx, QemuUIInfo *info)
+{
+    PCIQXLDevice *qxl = opaque;
+    VDAgentMonitorsConfig *cfg;
+    size_t size;
+
+    if (using_spice) {
+        /* spice agent will handle display resize */
+        return -1;
+    }
+    if (idx > 0) {
+        /* supporting only single head for now */
+        return -1;
+    }
+
+    /* go fake a spice agent message */
+    size = sizeof(VDAgentMonitorsConfig) + sizeof(VDAgentMonConfig);
+    cfg = g_malloc0(size);
+    cfg->num_of_monitors = 1;
+    cfg->monitors[0].width = info->width;
+    cfg->monitors[0].height = info->height;
+    interface_client_monitors_config(&qxl->ssd.qxl, cfg);
+    g_free(cfg);
+    return 0;
+}
+
 static const GraphicHwOps qxl_ops = {
     .gfx_update  = qxl_hw_update,
+    .ui_info     = qxl_ui_info,
     .gfx_update_async = true,
 };
 
-- 
2.27.0


