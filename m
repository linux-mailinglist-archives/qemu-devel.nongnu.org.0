Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E4931054D
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 08:01:00 +0100 (CET)
Received: from localhost ([::1]:46908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7v6x-0006F3-Gw
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 02:00:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l7v2r-000121-3m
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 01:56:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l7v2n-00014h-0S
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 01:56:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612508199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CUzrok0od2UniBYVQjVvxJRYbTpXZi0LWg4Ts0Ns92I=;
 b=TDvwlfkLwNPIdxh7+dOs1UqEXvKVdWIzn3V09KeO3h/d1kIqsnFP+m+1QC9O01A6MHL4ys
 etP0cgssw12hxy6O/bCaQBL225G16XuZxyOduOBfg/gLNAii2a3yXpIc3hS3Z2bWPnEtgi
 mysDkA53VDzzyQHxvI9tGC5pfr7+o+U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-unoTkJOaNeidshzDHlV1Cw-1; Fri, 05 Feb 2021 01:56:38 -0500
X-MC-Unique: unoTkJOaNeidshzDHlV1Cw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 263D280196C
 for <qemu-devel@nongnu.org>; Fri,  5 Feb 2021 06:56:37 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-108.ams2.redhat.com
 [10.36.113.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F5CC60C9B;
 Fri,  5 Feb 2021 06:56:21 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7AE7D18003A0; Fri,  5 Feb 2021 07:56:20 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/24] qxl: set qxl.ssd.dcl.con on secondary devices
Date: Fri,  5 Feb 2021 07:55:58 +0100
Message-Id: <20210205065620.1726554-3-kraxel@redhat.com>
In-Reply-To: <20210205065620.1726554-1-kraxel@redhat.com>
References: <20210205065620.1726554-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

On secondary QXL devices, the console is only set on qxl.vga.con. But
graphic_hw_update_done() is called with qxl.ssd.dcl.con.

Like for primary QXL devices, set qxl.sdd.dcl.con = qxl.vga.con.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20210201201422.446552-2-marcandre.lureau@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/qxl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/display/qxl.c b/hw/display/qxl.c
index 874bb8ad9e30..6784d32920c5 100644
--- a/hw/display/qxl.c
+++ b/hw/display/qxl.c
@@ -2266,6 +2266,7 @@ static void qxl_realize_secondary(PCIDevice *dev, Error **errp)
                            qxl->vga.vram_size, &error_fatal);
     qxl->vga.vram_ptr = memory_region_get_ram_ptr(&qxl->vga.vram);
     qxl->vga.con = graphic_console_init(DEVICE(dev), 0, &qxl_ops, qxl);
+    qxl->ssd.dcl.con = qxl->vga.con;
     qxl->id = qemu_console_get_index(qxl->vga.con); /* == channel_id */
 
     qxl_realize_common(qxl, errp);
-- 
2.29.2


