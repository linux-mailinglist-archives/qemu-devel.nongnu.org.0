Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E55D2FA867
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 19:13:15 +0100 (CET)
Received: from localhost ([::1]:54782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Z1d-0006HR-TX
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 13:13:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1Yzx-0005Fr-Mj
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 13:11:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1Yzr-0007Of-VE
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 13:11:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610993482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GzkIFWP7/yMjtaA8FaqnhmJiJIC//oZTSupTc1NCRVs=;
 b=KltLzN5HYvq9IpA9eL+XNif1QWFRJrMmx5QDUii9u04vUO+8Wu3DFiUPZFD4/3wHasv/hZ
 qWqQPkrxqycYAqhf4RZXjBONRSRWjIEPuqT2yeviGf2hCWksX3Vbd3VAzBAlZ71X5t2j8M
 M+O36b8UlCIuPNIBT0LeHrZONSjWCvo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-Esg9CoFZMIOW1moolAXagA-1; Mon, 18 Jan 2021 13:11:20 -0500
X-MC-Unique: Esg9CoFZMIOW1moolAXagA-1
Received: by mail-ed1-f71.google.com with SMTP id a24so2903290eda.14
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 10:11:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GzkIFWP7/yMjtaA8FaqnhmJiJIC//oZTSupTc1NCRVs=;
 b=ssLrwdoVK/vmaKWIrJLGnbWToMOBs81rlczfSj8abp3F98VAUs7khOjLNJxPZUWbCx
 fwaRq7SawNLKu2y9ujM856gqySM/BnDMkSv0xKxNikMFY61Zr/6U2tCH0vWKxHy8AAgT
 Mpj5nJ7qQlj9XJvaZhSHWfkRYI1q7VSP/ju80l+4zg3AP/BVa2yCk2LLkPSV2HKiRw2j
 VoFYqTrXjp0aGPZJECpXg49xSdG6KS4ScunQUvK1L9rt7zv70z0Gv0Ouk8xvoKrLH5Fi
 Y5nFdbOT8Hwn0bA7/cckIMuzwkLZgYK2zEcS1JgFcBfhdXrBy9h99NKYd1HRIN8tH7HX
 EDBQ==
X-Gm-Message-State: AOAM5332TdoEO3v/ElXeaJfo2Krk9AnQFYz7Uytrni1hOqwxB8a42KtP
 0QMmw1EG4XffoI9ub9PiOoEka/ietEXtRMKxBEo7P71UMPz6E56yrASqpSZ6NrLgsYaaDaQy9ZQ
 ontUmAw+H7UKbxWqa0QsQGg3Le2SrXpfHxntFVkEdtR6TbRk/N+OC/ixeyqcmL2kZ
X-Received: by 2002:a17:906:87c3:: with SMTP id
 zb3mr612847ejb.244.1610993478633; 
 Mon, 18 Jan 2021 10:11:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzk7TicbShaOxQpKr3LynDdCUOfbE6ZLbwBOoEPW3Zzy/OGjqslwh6Q6qXr+cIgjfXcAwqFDA==
X-Received: by 2002:a17:906:87c3:: with SMTP id
 zb3mr612826ejb.244.1610993478377; 
 Mon, 18 Jan 2021 10:11:18 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id hs18sm9685149ejc.45.2021.01.18.10.11.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jan 2021 10:11:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/usb/hcd-xhci: Fix extraneous format-truncation error on
 32-bit hosts
Date: Mon, 18 Jan 2021 19:11:15 +0100
Message-Id: <20210118181115.313742-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Daniel=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
 hw/usb/hcd-xhci.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/usb/hcd-xhci.h b/hw/usb/hcd-xhci.h
index 02ebd764509..7bba361f3bb 100644
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
2.26.2


