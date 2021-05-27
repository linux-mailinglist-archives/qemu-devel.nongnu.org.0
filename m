Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F313930EE
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 16:30:21 +0200 (CEST)
Received: from localhost ([::1]:47036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmH1g-0000j5-GI
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 10:30:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lmGwT-000853-OT
 for qemu-devel@nongnu.org; Thu, 27 May 2021 10:24:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lmGwS-0004pl-4T
 for qemu-devel@nongnu.org; Thu, 27 May 2021 10:24:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622125495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3Y0Ewjajw+kfrLoPlpe9S8MT/fRQyJvS61wf8vVT4xo=;
 b=QzkVLViTY2L3cUHKt0y4uaCZb0p1rNe2zVUJs6Ei588i9pX0EKMoDlowHmLEHP9HN/O5yh
 w3t8U1nb+6tngTVT/FsvIOOaKajc+GWSBNJmHQ6Qj/iN052AejSwxRrmO5Tmo99Cx5whgq
 QI5YA6K03LuEnj7mxmfyhbGs6QW8WCg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-6DeODLQ_OuqoIHtOhDhSgw-1; Thu, 27 May 2021 10:24:45 -0400
X-MC-Unique: 6DeODLQ_OuqoIHtOhDhSgw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC395100960E;
 Thu, 27 May 2021 14:24:44 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-84.ams2.redhat.com
 [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F2EA5C701;
 Thu, 27 May 2021 14:24:34 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 64AE61800845; Thu, 27 May 2021 16:23:41 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/23] hw/display/qxl: Set pci rom address aligned with page
 size
Date: Thu, 27 May 2021 16:23:26 +0200
Message-Id: <20210527142340.1352791-10-kraxel@redhat.com>
In-Reply-To: <20210527142340.1352791-1-kraxel@redhat.com>
References: <20210527142340.1352791-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 maobibo <maobibo@loongson.cn>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: maobibo <maobibo@loongson.cn>

On some MIPS system, page size is 16K, and qxl vga device can
be used for VM in kvm mode. Qxl pci rom size is set 8K fixed,
smaller than 16K page size on host system, it fails to be
added into memslots in kvm mode where memory_size and GPA
are required to align with page size.

This patch fixes this issue.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
Message-Id: <1621340448-31617-1-git-send-email-maobibo@loongson.cn>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/qxl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/qxl.c b/hw/display/qxl.c
index 2ba75637ec30..6e1f8ff1b2a7 100644
--- a/hw/display/qxl.c
+++ b/hw/display/qxl.c
@@ -321,7 +321,7 @@ static ram_addr_t qxl_rom_size(void)
 #define QXL_ROM_SZ 8192
 
     QEMU_BUILD_BUG_ON(QXL_REQUIRED_SZ > QXL_ROM_SZ);
-    return QXL_ROM_SZ;
+    return QEMU_ALIGN_UP(QXL_REQUIRED_SZ, qemu_real_host_page_size);
 }
 
 static void init_qxl_rom(PCIQXLDevice *d)
-- 
2.31.1


