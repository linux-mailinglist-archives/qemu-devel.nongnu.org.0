Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D22073385EE
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 07:34:37 +0100 (CET)
Received: from localhost ([::1]:39040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKbNc-0005jF-Qc
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 01:34:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lKbMA-0004hU-PA
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 01:33:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lKbM9-0007dp-79
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 01:33:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615530783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6J1Kiw6ROMSNeML1vGWmaHFhVrFg3NTh++dREyzWA5o=;
 b=hXZhiqK/ThLKkHfw0gLf92nR4QrTPuO0qYayZlErArsSiMdE94wD+KvU7tMoYZJvLxPXSG
 19O/JY6NQD02qKUUyuzbmfQMjvrl5ySZB7S/5vxSa1MWSyQSe88LFKB/qo7zxCDuSwpwar
 f/7tzbx4QVupbh98M8QUyYA/5xl639U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-HYQaQedBPw-WFQvM5udwwA-1; Fri, 12 Mar 2021 01:33:02 -0500
X-MC-Unique: HYQaQedBPw-WFQvM5udwwA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BCA2481746B;
 Fri, 12 Mar 2021 06:33:00 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C89FC1001281;
 Fri, 12 Mar 2021 06:32:59 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] fdc: fix floppy boot for Red Hat Linux 5.2
Date: Fri, 12 Mar 2021 01:32:59 -0500
Message-Id: <20210312063259.1721939-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The image size indicates it's an 81 track floppy disk image, which we
don't have a listing for in the geometry table. When you force the drive
type to 1.44MB, it guesses the reasonably close 18/80. When the drive
type is allowed to auto-detect or set to 2.88, it guesses a very
incorrect geometry.

auto, 144 and 288 drive types get the right geometry with the new entry
in the table.

Reported-by: Michael Tokarev <mjt@tls.msk.ru>
Signed-off-by: John Snow <jsnow@redhat.com>
---
 hw/block/fdc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/block/fdc.c b/hw/block/fdc.c
index 198940e737..b2f26ba587 100644
--- a/hw/block/fdc.c
+++ b/hw/block/fdc.c
@@ -122,6 +122,7 @@ static const FDFormat fd_formats[] = {
     /* First entry is default format */
     /* 1.44 MB 3"1/2 floppy disks */
     { FLOPPY_DRIVE_TYPE_144, 18, 80, 1, FDRIVE_RATE_500K, }, /* 3.5" 2880 */
+    { FLOPPY_DRIVE_TYPE_144, 18, 81, 1, FDRIVE_RATE_500K, },
     { FLOPPY_DRIVE_TYPE_144, 20, 80, 1, FDRIVE_RATE_500K, }, /* 3.5" 3200 */
     { FLOPPY_DRIVE_TYPE_144, 21, 80, 1, FDRIVE_RATE_500K, },
     { FLOPPY_DRIVE_TYPE_144, 21, 82, 1, FDRIVE_RATE_500K, },
-- 
2.29.2


