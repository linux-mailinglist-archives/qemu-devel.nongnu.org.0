Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC7B2C6057
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 08:09:30 +0100 (CET)
Received: from localhost ([::1]:43972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiXsn-0005bp-IY
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 02:09:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kiXqn-00047Z-6E
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 02:07:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kiXql-0003fJ-9i
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 02:07:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606460842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AYi4hulj/fYV7TsiulqOS6W4dyYmiBqD9vAVquJIigw=;
 b=LtZPzzo2HyDOdGGRQdP/hhQMg6Mbgup7qi1/TOQWuTGf9KSHRh8oP8nn4OG0xEGvNZvbnr
 8qjLewCnrLs6w/G1pm+EMSsn+K9EVl0b1V0ChiidK3PEavzY5KYewm6Gchk1tzEBGiltDh
 7B6fG3tUql+AnK7aEIhsgGfP20EU4Gg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-LChoev2_OIGMVLWZS56-Zg-1; Fri, 27 Nov 2020 02:07:19 -0500
X-MC-Unique: LChoev2_OIGMVLWZS56-Zg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F79A427F3
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 07:07:18 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7D8C360861;
 Fri, 27 Nov 2020 07:07:11 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8FA54A1EE; Fri, 27 Nov 2020 08:07:10 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/1] qxl: fix segfault
Date: Fri, 27 Nov 2020 08:07:10 +0100
Message-Id: <20201127070710.8851-2-kraxel@redhat.com>
In-Reply-To: <20201127070710.8851-1-kraxel@redhat.com>
References: <20201127070710.8851-1-kraxel@redhat.com>
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
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add missing sanity check.
Reproducer: run qemu with "-device qxl" but without "-spice ..."

Fixes: 0d9b90ce5c73 ("console: make QMP/HMP screendump run in coroutine")
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-id: 20201124122936.30588-1-kraxel@redhat.com
---
 ui/console.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/ui/console.c b/ui/console.c
index e07d2c380df7..53dee8e26b17 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -264,7 +264,9 @@ static void gui_setup_refresh(DisplayState *ds)
 
 void graphic_hw_update_done(QemuConsole *con)
 {
-    qemu_co_queue_restart_all(&con->dump_queue);
+    if (con) {
+        qemu_co_queue_restart_all(&con->dump_queue);
+    }
 }
 
 void graphic_hw_update(QemuConsole *con)
-- 
2.27.0


