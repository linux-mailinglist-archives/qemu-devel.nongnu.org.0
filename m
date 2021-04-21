Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 156A0367043
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 18:36:08 +0200 (CEST)
Received: from localhost ([::1]:54420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZFpf-00085P-Ng
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 12:36:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lZFnM-00078I-EU
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 12:33:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lZFnI-0006Pi-A9
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 12:33:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619022819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VSIuEXmIp80QvrzulISkiZOlwuDy5dhJlGFcFk464pg=;
 b=LjvPStZQid6Iz7cEHMhiJ25fpayh2h+yGxVHvaW/4mJLLjJTtNVCgP0QAX0TLrWhtb+1yR
 Fm2JnK2jbtR1Xu28y96wGWY7SIbAZctsKT0DaKS3t0xIy2+hMlNGvI2FLBOYD1mtPcU6Tf
 Vg126EJzHNZJJAEFGTNYOJp6cUkIGZk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-D9UVllyQOV2HxCpaEq2Hhw-1; Wed, 21 Apr 2021 12:33:37 -0400
X-MC-Unique: D9UVllyQOV2HxCpaEq2Hhw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A449807918;
 Wed, 21 Apr 2021 16:33:36 +0000 (UTC)
Received: from thuth.com (ovpn-112-207.ams2.redhat.com [10.36.112.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 23A10189B6;
 Wed, 21 Apr 2021 16:33:34 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
Subject: [PATCH] pc-bios/s390-ccw/bootmap: Silence compiler warning from Clang
Date: Wed, 21 Apr 2021 18:33:31 +0200
Message-Id: <20210421163331.358178-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When compiling the s390-ccw bios with Clang, the compiler complains:

 pc-bios/s390-ccw/bootmap.c:302:9: warning: logical not is only applied
  to the left hand side of this comparison [-Wlogical-not-parentheses]
    if (!mbr->dev_type == DEV_TYPE_ECKD) {
        ^              ~~

The code works (more or less by accident), since dev_type can only be
0 or 1, but it's better of course to use the intended != operator here
instead.

Fixes: 5dc739f343 ("Allow booting in case the first virtio-blk disk is bad")
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 pc-bios/s390-ccw/bootmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/pc-bios/s390-ccw/bootmap.c b/pc-bios/s390-ccw/bootmap.c
index 44df7d16af..e4b2e5a1b0 100644
--- a/pc-bios/s390-ccw/bootmap.c
+++ b/pc-bios/s390-ccw/bootmap.c
@@ -299,7 +299,7 @@ static void ipl_eckd_cdl(void)
         sclp_print("Bad block size in zIPL section of IPL2 record.\n");
         return;
     }
-    if (!mbr->dev_type == DEV_TYPE_ECKD) {
+    if (mbr->dev_type != DEV_TYPE_ECKD) {
         sclp_print("Non-ECKD device type in zIPL section of IPL2 record.\n");
         return;
     }
-- 
2.27.0


