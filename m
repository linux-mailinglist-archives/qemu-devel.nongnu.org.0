Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 715BD3A87E8
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 19:43:11 +0200 (CEST)
Received: from localhost ([::1]:36494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltD5i-00022r-Eq
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 13:43:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ltD3R-000853-G1
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 13:40:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ltD3P-0003OP-Oe
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 13:40:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623778843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EHyfWTD77Q9mqWshdelwCncF365bW5DaK4djyvfG97k=;
 b=VbtFfgZZxCGkvfD5RQ7gWXR3K5bSkZOOeFbZScWgMx/Aw24rJbGuLwvZ4ztdshpHeurRXs
 t08zG/i/Y7PbjrFo9OYXLXc40MfYlWnObI5kof9dyOa5bTISYPjcU+vFfs3F489RRIUu1x
 oxrovKbkAKBe4/PlpaabSFQU/uHz+VM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-fzuU1I_oPNWfP4eJouONWQ-1; Tue, 15 Jun 2021 13:40:42 -0400
X-MC-Unique: fzuU1I_oPNWfP4eJouONWQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19A5F1937FC1;
 Tue, 15 Jun 2021 17:40:41 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D2EB460853;
 Tue, 15 Jun 2021 17:40:27 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DAC4618003AA; Tue, 15 Jun 2021 19:40:25 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/3] vga: Allow writing VBE_DISPI_ID5 to ID register
Date: Tue, 15 Jun 2021 19:40:23 +0200
Message-Id: <20210615174025.3409518-2-kraxel@redhat.com>
In-Reply-To: <20210615174025.3409518-1-kraxel@redhat.com>
References: <20210615174025.3409518-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Dennis=20W=C3=B6lfing?= <denniswoelfing@gmx.de>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Dennis Wölfing <denniswoelfing@gmx.de>

The highest VBE_DISPI_INDEX_ID version supported by QEMU is
VBE_DISPI_ID5. But currently QEMU only allows writing values up to
VBE_DISPI_ID4 to the VBE_DISPI_INDEX_ID register.

As a result of this when a lower version is written to this register and
later VBE_DISPI_ID5 is written back, reads from the register will
continue to report the lower version.

Indeed SeaBIOS is doing that during VGA initialization which causes
guests to always read VBE_DISPI_ID0 instead of the correct version.

Signed-off-by: Dennis Wölfing <denniswoelfing@gmx.de>
Message-Id: <20210607115303.228659-1-denniswoelfing@gmx.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/vga.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/display/vga.c b/hw/display/vga.c
index 28a90e30d0cf..9d1f66af402e 100644
--- a/hw/display/vga.c
+++ b/hw/display/vga.c
@@ -752,7 +752,8 @@ void vbe_ioport_write_data(void *opaque, uint32_t addr, uint32_t val)
                 val == VBE_DISPI_ID1 ||
                 val == VBE_DISPI_ID2 ||
                 val == VBE_DISPI_ID3 ||
-                val == VBE_DISPI_ID4) {
+                val == VBE_DISPI_ID4 ||
+                val == VBE_DISPI_ID5) {
                 s->vbe_regs[s->vbe_index] = val;
             }
             break;
-- 
2.31.1


