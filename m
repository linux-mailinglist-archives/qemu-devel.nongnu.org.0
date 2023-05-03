Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 992106F5480
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:21:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8fm-0004Pf-UN; Wed, 03 May 2023 05:21:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pu8fd-0004AN-4l
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:21:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pu8fb-0005qy-HM
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:21:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683105666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R9zdMBUUhuZOnLH8PpP9z/O215kBFpYpOoq9bDvgzfY=;
 b=QTjc3HZ5UmWBszj3eXZDnBt94n1edbJvJ2cGdbTUL15aEyBG2Q247hwizq7CClNeTtbWDr
 fxUDlXFT09scg+a6/C2jiBxU5G6S6vDyLYcWyytCe/DJyXXlAXU1dSpqqAjCt3F8/8SVhQ
 qOr//gsYnjN55cvsLQqd0sncScRimls=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-iu333yp5MeuTH6ZQ-KUlHw-1; Wed, 03 May 2023 05:21:05 -0400
X-MC-Unique: iu333yp5MeuTH6ZQ-KUlHw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5B12B18E0925;
 Wed,  3 May 2023 09:21:05 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1BD902166B26;
 Wed,  3 May 2023 09:21:05 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A4E191804A44; Wed,  3 May 2023 11:20:58 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: seabios@seabios.org
Cc: qemu-devel@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 5/6] qemu: log reservations in fw_cfg e820 table
Date: Wed,  3 May 2023 11:20:57 +0200
Message-Id: <20230503092058.486893-6-kraxel@redhat.com>
In-Reply-To: <20230503092058.486893-1-kraxel@redhat.com>
References: <20230503092058.486893-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

With loglevel 1 (same we use for RAM entries),
so it is included in the firmware log by default.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 src/fw/paravirt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/fw/paravirt.c b/src/fw/paravirt.c
index a84968661aee..2c9ed4c3f4d6 100644
--- a/src/fw/paravirt.c
+++ b/src/fw/paravirt.c
@@ -764,7 +764,7 @@ static int qemu_early_e820(void)
         switch (table.type) {
         case E820_RESERVED:
             e820_add(table.address, table.length, table.type);
-            dprintf(3, "qemu/e820: addr 0x%016llx len 0x%016llx [reserved]\n",
+            dprintf(1, "qemu/e820: addr 0x%016llx len 0x%016llx [reserved]\n",
                     table.address, table.length);
             break;
         case E820_RAM:
-- 
2.40.1


