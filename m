Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D8335A361
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 18:30:07 +0200 (CEST)
Received: from localhost ([::1]:40956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUu1G-0001Ub-PK
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 12:30:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lUtns-0007jb-HY
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 12:16:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lUtnl-0003NS-Jb
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 12:16:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617984968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Sj4e2NEIvxuDraAfQXbZsFPZEpqZRgCntMne31n7VM=;
 b=G7mRrxg5WgXpFsqDRWuZrO8asTa0PKomWvZgQEI0CVCveP2l6SyFphk2MLc5NQFwlTEKZc
 m1uhBASOhQZf+zb1wR2BHQ2410VlNX2BJlnlEhz0S7XkJcgkdtYcKvnzUfq0xLXePifEEh
 xywB25Ti8zBOSW8RSbbwzkEQ48tqu80=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-OogYZ0-JN7eBd0ZiHc0Kcw-1; Fri, 09 Apr 2021 12:16:06 -0400
X-MC-Unique: OogYZ0-JN7eBd0ZiHc0Kcw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91982107ACC7;
 Fri,  9 Apr 2021 16:16:05 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-63.ams2.redhat.com [10.36.115.63])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9CA385D6A1;
 Fri,  9 Apr 2021 16:16:04 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 06/10] hw/block/fdc: Fix 'fallback' property on sysbus floppy
 disk controllers
Date: Fri,  9 Apr 2021 18:15:44 +0200
Message-Id: <20210409161548.341297-7-kwolf@redhat.com>
In-Reply-To: <20210409161548.341297-1-kwolf@redhat.com>
References: <20210409161548.341297-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Setting the 'fallback' property corrupts the QOM instance state
(FDCtrlSysBus) because it accesses an incorrect offset (it uses
the offset of the FDCtrlISABus state).

Cc: qemu-stable@nongnu.org
Fixes: a73275dd6fc ("fdc: Add fallback option")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210407133742.1680424-1-f4bug@amsat.org>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 hw/block/fdc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/block/fdc.c b/hw/block/fdc.c
index 82afda7f3a..a825c2acba 100644
--- a/hw/block/fdc.c
+++ b/hw/block/fdc.c
@@ -2893,7 +2893,7 @@ static Property sysbus_fdc_properties[] = {
     DEFINE_PROP_SIGNED("fdtypeB", FDCtrlSysBus, state.qdev_for_drives[1].type,
                         FLOPPY_DRIVE_TYPE_AUTO, qdev_prop_fdc_drive_type,
                         FloppyDriveType),
-    DEFINE_PROP_SIGNED("fallback", FDCtrlISABus, state.fallback,
+    DEFINE_PROP_SIGNED("fallback", FDCtrlSysBus, state.fallback,
                         FLOPPY_DRIVE_TYPE_144, qdev_prop_fdc_drive_type,
                         FloppyDriveType),
     DEFINE_PROP_END_OF_LIST(),
@@ -2918,7 +2918,7 @@ static Property sun4m_fdc_properties[] = {
     DEFINE_PROP_SIGNED("fdtype", FDCtrlSysBus, state.qdev_for_drives[0].type,
                         FLOPPY_DRIVE_TYPE_AUTO, qdev_prop_fdc_drive_type,
                         FloppyDriveType),
-    DEFINE_PROP_SIGNED("fallback", FDCtrlISABus, state.fallback,
+    DEFINE_PROP_SIGNED("fallback", FDCtrlSysBus, state.fallback,
                         FLOPPY_DRIVE_TYPE_144, qdev_prop_fdc_drive_type,
                         FloppyDriveType),
     DEFINE_PROP_END_OF_LIST(),
-- 
2.30.2


