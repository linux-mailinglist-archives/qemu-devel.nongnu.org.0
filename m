Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D465A4F2A6E
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 12:56:07 +0200 (CEST)
Received: from localhost ([::1]:45238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbgr0-0001Ta-BI
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 06:56:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1nbgWx-00024P-EE
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 06:35:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1nbgWq-0000Eq-97
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 06:35:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649154911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=47ewJs8quyFFhN+9svZIjCXIKOn2Q5HE6bg6HKFg+RA=;
 b=cRPMSITs8A3DJXacLV7IkWk9AFl2GWFO8HQi+qSw7UpU5nEoz2JidG3iCefx8UnLJod6Ej
 8tElC6/BpOOnl8f4Cfzgsy5Nb4Hsd9MHlRPOCZStBy+lCXTb2m2wz3V9Q2QQILVMi8+JME
 YIGZYyrg0t3FQRYqk5fdFpXEfJ5CDQ4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-ys5hNhMOMsmEujqgj_6-iw-1; Tue, 05 Apr 2022 06:35:10 -0400
X-MC-Unique: ys5hNhMOMsmEujqgj_6-iw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 03EF485A5BC
 for <qemu-devel@nongnu.org>; Tue,  5 Apr 2022 10:35:10 +0000 (UTC)
Received: from f35-work.redhat.com (unknown [10.39.194.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BC981415125;
 Tue,  5 Apr 2022 10:35:09 +0000 (UTC)
From: Mauro Matteo Cascella <mcascell@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] display/qxl-render: fix race condition in qxl_cursor
 (CVE-2022-4207)
Date: Tue,  5 Apr 2022 12:35:05 +0200
Message-Id: <20220405103505.106034-1-mcascell@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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

Fixes: CVE-2022-4207
Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
---
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


