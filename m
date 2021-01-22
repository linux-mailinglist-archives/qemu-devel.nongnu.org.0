Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1B7300A24
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 18:51:07 +0100 (CET)
Received: from localhost ([::1]:48068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l30aQ-00058v-Ra
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 12:51:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l30YS-0003Lk-2f
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 12:49:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l30YO-0004es-2G
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 12:49:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611337738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6z+4q2SdC+4C58JFkyW8FKESFLNToADHL3M9abPRL44=;
 b=LUij0kbdihdvsehc2jDTrVOQ4+xsJr98RZUbJ9iUK8IcI+/8uDRM82bKP5xsJoNMpDoaZj
 UqpJTUKjtY8vJm4MVFZun6HCIQ/3CErTBN+7MS50Qalx4oQIjVZytVrboI4vC77rpMLkaV
 sFrpIHwYBPLGafdFfCyXEUKkhHir1qg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-FunRT4XjNUyxEOYh348zng-1; Fri, 22 Jan 2021 12:48:56 -0500
X-MC-Unique: FunRT4XjNUyxEOYh348zng-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33B5E1005D4E;
 Fri, 22 Jan 2021 17:48:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9226F6EF59;
 Fri, 22 Jan 2021 17:48:51 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2BA2D180038D; Fri, 22 Jan 2021 18:48:50 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/8] hw/usb/hcd-xhci: Fix extraneous format-truncation error on
 32-bit hosts
Date: Fri, 22 Jan 2021 18:48:45 +0100
Message-Id: <20210122174849.3936119-5-kraxel@redhat.com>
In-Reply-To: <20210122174849.3936119-1-kraxel@redhat.com>
References: <20210122174849.3936119-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

For some reason the assert() added in commit ccb799313a5
("hw/usb: avoid format truncation warning when formatting
port name") does not fix when building with GCC 10.

KISS and expand the buffer by 4 bytes to silent the following
error when using GCC 10.2.1 on Fedora 33:

  hw/usb/hcd-xhci.c: In function 'usb_xhci_realize':
  hw/usb/hcd-xhci.c:3309:54: error: '%d' directive output may be truncated writing between 1 and 8 bytes into a region of size 5 [-Werror=format-truncation=]
   3309 |             snprintf(port->name, sizeof(port->name), "usb2 port #%d", i+1);
        |                                                      ^~~~~~~~~~~~~~~
  hw/usb/hcd-xhci.c:3309:54: note: directive argument in the range [1, 89478486]
  In file included from /usr/include/stdio.h:866,
                   from include/qemu/osdep.h:85,
                   from hw/usb/hcd-xhci.c:22:
  /usr/include/bits/stdio2.h:70:10: note: '__builtin___snprintf_chk' output between 13 and 20 bytes into a destination of size 16
     70 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
        |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     71 |        __bos (__s), __fmt, __va_arg_pack ());
        |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  hw/usb/hcd-xhci.c:3323:54: error: '%d' directive output may be truncated writing between 1 and 8 bytes into a region of size 5 [-Werror=format-truncation=]
   3323 |             snprintf(port->name, sizeof(port->name), "usb3 port #%d", i+1);
        |                                                      ^~~~~~~~~~~~~~~
  hw/usb/hcd-xhci.c:3323:54: note: directive argument in the range [1, 89478486]
  In file included from /usr/include/stdio.h:866,
                   from include/qemu/osdep.h:85,
                   from hw/usb/hcd-xhci.c:22:
  /usr/include/bits/stdio2.h:70:10: note: '__builtin___snprintf_chk' output between 13 and 20 bytes into a destination of size 16
     70 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
        |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     71 |        __bos (__s), __fmt, __va_arg_pack ());
        |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  cc1: all warnings being treated as errors

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210118181115.313742-1-philmd@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/hcd-xhci.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/usb/hcd-xhci.h b/hw/usb/hcd-xhci.h
index 02ebd764509a..7bba361f3bbd 100644
--- a/hw/usb/hcd-xhci.h
+++ b/hw/usb/hcd-xhci.h
@@ -128,7 +128,7 @@ typedef struct XHCIPort {
     uint32_t portnr;
     USBPort  *uport;
     uint32_t speedmask;
-    char name[16];
+    char name[20];
     MemoryRegion mem;
 } XHCIPort;
 
-- 
2.29.2


