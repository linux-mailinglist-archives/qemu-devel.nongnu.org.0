Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E51B2FC478
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 00:09:47 +0100 (CET)
Received: from localhost ([::1]:41146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l208A-0002sp-Lf
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 18:09:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l206N-0002FU-Rg
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 18:07:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l206J-0003Gn-50
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 18:07:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611097669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XCZoejSh5YOZ5CKCyW47XmI6/hcuZilCs4H8IDyQ9x8=;
 b=M2Q5m0u5RL9PH9/oeKsHsI8tR2TpzNjIgYSXY3c/2nNTQrhAI4HSMcztjl6zWZf89JIrCz
 rEAT8t4qWyXl4UCDqtXbOcwok36Rx3KDI9GKZJk0/G8ydY3WX8J/o//Ezm5abh1xuSJLuP
 XlsAOgrQiqnSZU5nXavJwpbBguYvc84=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-DKHM_ZQ5Nty0Js4d8thipg-1; Tue, 19 Jan 2021 18:07:47 -0500
X-MC-Unique: DKHM_ZQ5Nty0Js4d8thipg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE0F0107ACE3
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 23:07:46 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-116.phx2.redhat.com [10.3.113.116])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AEB465D6AD;
 Tue, 19 Jan 2021 23:07:43 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] usb: Fix clang build
Date: Tue, 19 Jan 2021 17:07:41 -0600
Message-Id: <20210119230741.810007-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

../hw/usb/dev-uas.c:157:31: error: field 'status' with variable sized type 'uas_iu' not at the end of a struct or class is a GNU extension [-Werror,-Wgnu-variable-sized-type-not-at-end]
    uas_iu                    status;
                              ^

Fix this by specifying a size for the add_cdb member; and at present,
the code does not actually use that field other than for the size
chosen for the packed uas_iu_command struct, and the choice of one
byte does not change the size of the uas_iu union.

Signed-off-by: Eric Blake <eblake@redhat.com>
---

I'm not sure why none of our CI tools pick up this particular clang
build failure; I hit it on Fedora 33 when configuring to build the
entire tree with clang.

 hw/usb/dev-uas.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/usb/dev-uas.c b/hw/usb/dev-uas.c
index cec071d96c49..904d6ffa2938 100644
--- a/hw/usb/dev-uas.c
+++ b/hw/usb/dev-uas.c
@@ -70,7 +70,7 @@ typedef struct {
     uint8_t    reserved_2;
     uint64_t   lun;
     uint8_t    cdb[16];
-    uint8_t    add_cdb[];
+    uint8_t    add_cdb[1];
 } QEMU_PACKED  uas_iu_command;

 typedef struct {
-- 
2.30.0


