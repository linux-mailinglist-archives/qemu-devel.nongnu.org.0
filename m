Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B42A216DFB
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jul 2020 15:44:21 +0200 (CEST)
Received: from localhost ([::1]:48016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsntU-0000Yu-4P
	for lists+qemu-devel@lfdr.de; Tue, 07 Jul 2020 09:44:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jsns7-00070A-Qz
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 09:42:55 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:34511
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jsns6-0004bt-Ae
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 09:42:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594129373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=lNfHrf/4zGKicBY5F9a1m8s+sgFe0y8Cq+RRcG0z6Bc=;
 b=M9i7thMN1xjZjxT83CYeJR95PfRxQ1rPkPGq+Rwg33aZ2wDHqw7/5ooLX/JClP/f5J/oVJ
 xowW9o0e+gxMSueDMNyOjQ6ppLjCKXGZdUdpgvijL6xbxD46e7RdzqInZ7r2zjQWsEu7vR
 hYjlhHQwa5neM7rBqj5m0Lw2akPr+gI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-8QYteG6LOnCmd_hKFvKGEQ-1; Tue, 07 Jul 2020 09:42:49 -0400
X-MC-Unique: 8QYteG6LOnCmd_hKFvKGEQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4821EE01
 for <qemu-devel@nongnu.org>; Tue,  7 Jul 2020 13:42:48 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-200.ams2.redhat.com
 [10.36.112.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4615A19D7C;
 Tue,  7 Jul 2020 13:42:37 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id EA30E31F51; Tue,  7 Jul 2020 15:42:29 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/10] usb: build usb-redir as module
Date: Tue,  7 Jul 2020 15:42:25 +0200
Message-Id: <20200707134229.9773-7-kraxel@redhat.com>
In-Reply-To: <20200707134229.9773-1-kraxel@redhat.com>
References: <20200707134229.9773-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 00:31:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Drops libusbredirparser.so dependency from core qemu.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Message-id: 20200624131045.14512-7-kraxel@redhat.com
---
 util/module.c        | 1 +
 hw/usb/Makefile.objs | 9 ++++++---
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/util/module.c b/util/module.c
index 89da9a3cce05..e3226165e91c 100644
--- a/util/module.c
+++ b/util/module.c
@@ -263,6 +263,7 @@ static struct {
 } const qom_modules[] = {
     { "ccid-card-passthru",    "hw-", "usb-smartcard"         },
     { "ccid-card-emulated",    "hw-", "usb-smartcard"         },
+    { "usb-redir",             "hw-", "usb-redirect"          },
 };
 
 static bool module_loaded_qom_all;
diff --git a/hw/usb/Makefile.objs b/hw/usb/Makefile.objs
index 3c5b3d4fadd3..e342ff59fab0 100644
--- a/hw/usb/Makefile.objs
+++ b/hw/usb/Makefile.objs
@@ -43,9 +43,12 @@ endif
 
 # usb redirection
 ifeq ($(CONFIG_USB),y)
-common-obj-$(CONFIG_USB_REDIR) += redirect.o quirks.o
-redirect.o-cflags = $(USB_REDIR_CFLAGS)
-redirect.o-libs = $(USB_REDIR_LIBS)
+ifeq ($(CONFIG_USB_REDIR),y)
+common-obj-m += redirect.mo
+redirect.mo-objs = redirect.o quirks.o
+redirect.mo-cflags = $(USB_REDIR_CFLAGS)
+redirect.mo-libs = $(USB_REDIR_LIBS)
+endif
 endif
 
 # usb pass-through
-- 
2.18.4


