Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D45EE2943B7
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Oct 2020 22:08:04 +0200 (CEST)
Received: from localhost ([::1]:48592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUxvP-0008C2-S6
	for lists+qemu-devel@lfdr.de; Tue, 20 Oct 2020 16:08:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kUxqS-0003aw-Kw
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 16:02:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kUxqQ-0004GR-Ru
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 16:02:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603224170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n8mHDeDRsTUv7pxbT0E8gSpiWvDaPbFM5BAPd/ZB9jM=;
 b=BBofDfDd8ncRlncAYZDE2kXnLYqOI6qD9JwS7Ppyc9zHDrBDCEXeevMdQfBVuqOxWlOdp1
 fBlanB1oBwMjJQkoQ1CZ9wSQRwMwUYOFn/Nu6NrNXjsCleSl+YHjMRpisZh6CkqZA4Q2Ne
 LBzPkIOffuJ8XVC6sU6rUkDGO/NYBJ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-OJkWGt4wMZ2tyNpoSaHyBw-1; Tue, 20 Oct 2020 16:02:46 -0400
X-MC-Unique: OJkWGt4wMZ2tyNpoSaHyBw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 050B31006C91;
 Tue, 20 Oct 2020 20:02:45 +0000 (UTC)
Received: from scv.redhat.com (ovpn-115-172.rdu2.redhat.com [10.10.115.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 19CBA1002C0C;
 Tue, 20 Oct 2020 20:02:44 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] ide: run diagnostic after SRST
Date: Tue, 20 Oct 2020 16:02:40 -0400
Message-Id: <20201020200242.1497705-2-jsnow@redhat.com>
In-Reply-To: <20201020200242.1497705-1-jsnow@redhat.com>
References: <20201020200242.1497705-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/20 01:15:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: John Snow <jsnow@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Software reset (SRST) should cause the diagnostic command to be run. Make an
explicit call to that routine.

Reported-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Fixes: 55adb3c45620c31f29978f209e2a44a08d34e2da
Fixes: https://bugs.launchpad.net/bugs/1900155
Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: John Snow <jsnow@redhat.com>
---
 hw/ide/core.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/ide/core.c b/hw/ide/core.c
index 693b352d5e..84e887d426 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -2254,10 +2254,8 @@ static void ide_perform_srst(IDEState *s)
     /* Cancel PIO callback, reset registers/signature, etc */
     ide_reset(s);
 
-    if (s->drive_kind == IDE_CD) {
-        /* ATAPI drives do not set READY or SEEK */
-        s->status = 0x00;
-    }
+    /* perform diagnostic */
+    cmd_exec_dev_diagnostic(s, WIN_DIAGNOSE);
 }
 
 static void ide_bus_perform_srst(void *opaque)
-- 
2.26.2


