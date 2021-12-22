Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6ED647D3DA
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 15:43:11 +0100 (CET)
Received: from localhost ([::1]:35448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n02pi-00007l-5V
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 09:43:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1n02nl-0007LB-7f
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 09:41:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1n02ne-0007gr-Sh
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 09:41:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640184060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Gc5l7rkugf+dIaQI+NLbtiyl4hba5/satBgMc0X1jBE=;
 b=hRzI8pXnzQ2WDz3CydkJW/rayUJR6JALvWyossQNwE0Qzxxv4yDgO4tTtVZvhM6GA2o4ym
 Xa3FvaUN2EYLXNBmkCRSPe1CI4oijx2KBinBLXgm9M0mweFg74zVQAcyyfg8rRVsJkLGh+
 82P+VswrQX7IOQFHkpAru4dHeujeJzE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-hfEFZZYXOJyTznBcPSJiPw-1; Wed, 22 Dec 2021 09:40:59 -0500
X-MC-Unique: hfEFZZYXOJyTznBcPSJiPw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB2A0801ADB
 for <qemu-devel@nongnu.org>; Wed, 22 Dec 2021 14:40:58 +0000 (UTC)
Received: from localhost (unknown [10.39.208.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 887E87317A;
 Wed, 22 Dec 2021 14:40:36 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH] ui/dbus: fix buffer-overflow detected by ASAN
Date: Wed, 22 Dec 2021 18:40:32 +0400
Message-Id: <20211222144032.443424-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

On the last added dbus patch, I left a tiny BO:

==441487==ERROR: AddressSanitizer: heap-buffer-overflow on address 0x611000025a70 at pc 0x7f0817bb764c bp 0x7ffde672ae60 sp 0x7ffde672ae58
WRITE of size 8 at 0x611000025a70 thread T0
    #0 0x7f0817bb764b in dbus_vc_class_init ../ui/dbus.c:401

A cookie for ASAN! not you C :)

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/dbus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/ui/dbus.c b/ui/dbus.c
index b2c1c9fb522c..0074424c1fed 100644
--- a/ui/dbus.c
+++ b/ui/dbus.c
@@ -405,6 +405,7 @@ dbus_vc_class_init(ObjectClass *oc, void *data)
 static const TypeInfo dbus_vc_type_info = {
     .name = TYPE_CHARDEV_VC,
     .parent = TYPE_CHARDEV_DBUS,
+    .class_size = sizeof(DBusVCClass),
     .class_init = dbus_vc_class_init,
 };
 
-- 
2.34.1.8.g35151cf07204


