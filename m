Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 004FE210ECB
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jul 2020 17:13:44 +0200 (CEST)
Received: from localhost ([::1]:46390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqeQi-0007lm-2K
	for lists+qemu-devel@lfdr.de; Wed, 01 Jul 2020 11:13:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jqeI3-0003PO-4R
 for qemu-devel@nongnu.org; Wed, 01 Jul 2020 11:04:47 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:47083
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jqeHu-0001Cf-Sq
 for qemu-devel@nongnu.org; Wed, 01 Jul 2020 11:04:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593615878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=txA6ymslC0XGGHRxaY/MDpC3WtP0iexbWYFTR8TsxKs=;
 b=TqhinUgMzNqAAuNOmdRsPzoyVqViaJzm2wHr5HAQe6UVPKHPb3utGMFsGimdVz9p1f7AYt
 NwOMzPeSKgWJSORYuP8t+iXqoPV/4M2mNpT7ZDqvr5eVdkhgHdbhzOqUyRo9AN6LgwAWyB
 R3wpMG6DYQi5K4XQE1ZeW202Fdc9GWI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-Pya_WMblMr-ifRLL38541Q-1; Wed, 01 Jul 2020 11:04:35 -0400
X-MC-Unique: Pya_WMblMr-ifRLL38541Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92FF11937FDD;
 Wed,  1 Jul 2020 15:04:34 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-62.ams2.redhat.com
 [10.36.112.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A70C60BE1;
 Wed,  1 Jul 2020 15:04:31 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id AF87D31E8E; Wed,  1 Jul 2020 17:04:25 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/13] ati-vga: Do not assert on error
Date: Wed,  1 Jul 2020 17:04:23 +0200
Message-Id: <20200701150425.13739-12-kraxel@redhat.com>
In-Reply-To: <20200701150425.13739-1-kraxel@redhat.com>
References: <20200701150425.13739-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/01 00:56:58
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
Cc: qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

Do not abort on unsupported value just print log and continue. While
display will likely be broken this prevents malicious guest to crash
QEMU causing denial of service.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-id: 0c13dab5d8e3b7e7479c3edbf53aeac8c09de6de.1592737958.git.balaton@eik.bme.hu
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/ati.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/ati.c b/hw/display/ati.c
index 245130d52f33..95fc443cac83 100644
--- a/hw/display/ati.c
+++ b/hw/display/ati.c
@@ -86,8 +86,8 @@ static void ati_vga_switch_mode(ATIVGAState *s)
                 break;
             default:
                 qemu_log_mask(LOG_UNIMP, "Unsupported bpp value\n");
+                return;
             }
-            assert(bpp != 0);
             DPRINTF("Switching to %dx%d %d %d @ %x\n", h, v, stride, bpp, offs);
             vbe_ioport_write_index(&s->vga, 0, VBE_DISPI_INDEX_ENABLE);
             vbe_ioport_write_data(&s->vga, 0, VBE_DISPI_DISABLED);
-- 
2.18.4


