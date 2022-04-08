Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 699414F8D2D
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 06:55:43 +0200 (CEST)
Received: from localhost ([::1]:52798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncges-0006UW-Go
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 00:55:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ncgcF-0004YK-5z
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 00:52:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ncgcD-0000vL-1h
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 00:52:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649393576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+9DcIpcWwr2lRr5tD7gpX78GxBXEZ7BwAFMi4YFIHrQ=;
 b=HWcUO5mXXsDs4cSdVekgUbOZEG0o0h0LojtYNfQyzWHNhqqQ82Z1qF7UkBNig8Uk89h0fV
 vU7eS2XwFXGu4vlIQEadgGJsVlBlUYwHMFCWGfQp9I5hmJ9+Need/7z8ncsH62HfmlQAyM
 7sp9mvlU2cGIbLWI3xWSxE6MWFngL0U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-367-NTYfp8z7Mi6jQkIgT2kLWQ-1; Fri, 08 Apr 2022 00:52:54 -0400
X-MC-Unique: NTYfp8z7Mi6jQkIgT2kLWQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 89EA0800B28
 for <qemu-devel@nongnu.org>; Fri,  8 Apr 2022 04:52:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 54BBE40CF8EA;
 Fri,  8 Apr 2022 04:52:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BD3F91800623; Fri,  8 Apr 2022 06:52:52 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/2] display/qxl-render: fix race condition in qxl_cursor
 (CVE-2021-4207)
Date: Fri,  8 Apr 2022 06:52:51 +0200
Message-Id: <20220408045252.2375896-2-kraxel@redhat.com>
In-Reply-To: <20220408045252.2375896-1-kraxel@redhat.com>
References: <20220408045252.2375896-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mauro Matteo Cascella <mcascell@redhat.com>

Avoid fetching 'width' and 'height' a second time to prevent possible
race condition. Refer to security advisory
https://starlabs.sg/advisories/22-4207/ for more information.

Fixes: CVE-2021-4207
Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220407081106.343235-1-mcascell@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/qxl-render.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/qxl-render.c b/hw/display/qxl-render.c
index d28849b12176..237ed293baae 100644
--- a/hw/display/qxl-render.c
+++ b/hw/display/qxl-render.c
@@ -266,7 +266,7 @@ static QEMUCursor *qxl_cursor(PCIQXLDevice *qxl, QXLCursor *cursor,
         }
         break;
     case SPICE_CURSOR_TYPE_ALPHA:
-        size = sizeof(uint32_t) * cursor->header.width * cursor->header.height;
+        size = sizeof(uint32_t) * c->width * c->height;
         qxl_unpack_chunks(c->data, size, qxl, &cursor->chunk, group_id);
         if (qxl->debug > 2) {
             cursor_print_ascii_art(c, "qxl/alpha");
-- 
2.35.1


