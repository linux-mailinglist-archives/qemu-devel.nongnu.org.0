Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF864F7939
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 10:15:12 +0200 (CEST)
Received: from localhost ([::1]:40980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncNIM-0001Zz-Vp
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 04:15:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1ncNEZ-0000kh-91
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 04:11:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1ncNEW-0000CD-Aw
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 04:11:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649319070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mA0f+Fz0lfkMvDaAT3J/7EYMK1R0oqUHYMp9kWalNNw=;
 b=CEQPpMk9fqwij2ZfKEK8NklUR0t+1+GtCTkUBd7TVVXyssLWM3eIhoJxVDXI4QNtz5F0Ca
 MMtGJ3yfspLAA+zfowhsuPgKkYe/xTNO+nGIlt/QQjkCRcEWkiNxLGIluoHNOBBMTBZXNU
 8As8m89Gv2bV02ldyUslopjG53mP+ks=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-bJ-KOQz9Ow6JEcIIscEjnw-1; Thu, 07 Apr 2022 04:11:10 -0400
X-MC-Unique: bJ-KOQz9Ow6JEcIIscEjnw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E889C85A5BC
 for <qemu-devel@nongnu.org>; Thu,  7 Apr 2022 08:11:09 +0000 (UTC)
Received: from f35-work.redhat.com (unknown [10.39.194.126])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 42D37C27E9A;
 Thu,  7 Apr 2022 08:11:09 +0000 (UTC)
From: Mauro Matteo Cascella <mcascell@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] display/qxl-render: fix race condition in qxl_cursor
 (CVE-2021-4207)
Date: Thu,  7 Apr 2022 10:11:06 +0200
Message-Id: <20220407081106.343235-1-mcascell@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mcascell@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mcascell@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: mcascell@redhat.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avoid fetching 'width' and 'height' a second time to prevent possible
race condition. Refer to security advisory
https://starlabs.sg/advisories/22-4207/ for more information.

Fixes: CVE-2021-4207
Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
---
v2:
- fix CVE id (CVE-2021-4207 instead of CVE-2022-4207)

 hw/display/qxl-render.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/qxl-render.c b/hw/display/qxl-render.c
index d28849b121..237ed293ba 100644
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


