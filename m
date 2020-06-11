Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1226C1F6378
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jun 2020 10:24:56 +0200 (CEST)
Received: from localhost ([::1]:40212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjIW7-0000Zl-4E
	for lists+qemu-devel@lfdr.de; Thu, 11 Jun 2020 04:24:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jjITX-0004qc-53
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 04:22:15 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:50883
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jjITW-0006qx-5R
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 04:22:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591863733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=tfXOLUUQ4Kr2jyNo1AqC75oEoYOyN5+p6zR3YQ+Uk9I=;
 b=CkvxwB23NAEkD4M5L97/B34d/wwJr0hHy61gK3nkJrCCpRye3ZOTUYNjnjHCRrX9Q3Rnir
 7U5j0kyl0z46bxhalPG6xVTkkJc6g2ccblBpudXF6w6cj9Gvpa82MRmGVvrYxAujcfPOtM
 +7BBQlrKoYYLFaj1GxHEbPdS8KFMMC0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-n3tb-ZhsMAa7JoHvNvfNmw-1; Thu, 11 Jun 2020 04:22:08 -0400
X-MC-Unique: n3tb-ZhsMAa7JoHvNvfNmw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 867228015CB
 for <qemu-devel@nongnu.org>; Thu, 11 Jun 2020 08:22:07 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9EEAB7F4FE;
 Thu, 11 Jun 2020 08:22:01 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3A0CA17516; Thu, 11 Jun 2020 10:22:00 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/7] usb: build usb-redir as module
Date: Thu, 11 Jun 2020 10:21:56 +0200
Message-Id: <20200611082200.26331-5-kraxel@redhat.com>
In-Reply-To: <20200611082200.26331-1-kraxel@redhat.com>
References: <20200611082200.26331-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/11 03:29:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: dinechin@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Drops libusbredirparser.so dependency from core qemu.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/core/qdev.c       | 1 +
 hw/usb/Makefile.objs | 9 ++++++---
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 0388efe2190b..676707e64191 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -158,6 +158,7 @@ static struct {
 } const hwmodules[] = {
     { .type = "ccid-card-passthru",    .mod = "usb-smartcard"         },
     { .type = "ccid-card-emulated",    .mod = "usb-smartcard"         },
+    { .type = "usb-redir",             .mod = "usb-redirect"          },
 };
 
 static bool qdev_module_loaded_all;
diff --git a/hw/usb/Makefile.objs b/hw/usb/Makefile.objs
index 3c5b3d4fadd3..3bb8dd53421a 100644
--- a/hw/usb/Makefile.objs
+++ b/hw/usb/Makefile.objs
@@ -43,9 +43,12 @@ endif
 
 # usb redirection
 ifeq ($(CONFIG_USB),y)
-common-obj-$(CONFIG_USB_REDIR) += redirect.o quirks.o
-redirect.o-cflags = $(USB_REDIR_CFLAGS)
-redirect.o-libs = $(USB_REDIR_LIBS)
+ifeq ($(CONFIG_USB-REDIR),y)
+common-obj-m += redirect.mo
+redirect.mo-objs = redirect.o quirks.o
+redirect.mo-cflags = $(USB_REDIR_CFLAGS)
+redirect.mo-libs = $(USB_REDIR_LIBS)
+endif
 endif
 
 # usb pass-through
-- 
2.18.4


