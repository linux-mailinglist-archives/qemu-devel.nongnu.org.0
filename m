Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B0B345AB8
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 10:24:21 +0100 (CET)
Received: from localhost ([::1]:39886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOdGu-0002vA-DM
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 05:24:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lOdF1-0001CR-48
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 05:22:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lOdEx-0007dA-HK
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 05:22:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616491338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r0oVr/rM7RJv5A3CifIrEcvYBzjsvAODfHfp6kFSKfg=;
 b=fqNr5VJhXR4ztDuXiVCJvuE8mNzg1EjjE7wB2KZTc+QrWwxowJ/DxZVGAFSo9qA3qLdgJS
 ba0V8NRq8Lxqx4/5YTtofFuTQc0S9YXzgRrIxiLeTmivfkng38XTlH73O+gocvi3g4tMLs
 L8bhQTIxIoTwLSRGGFzhlqzIoeXKgYo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-PJZ6UzV7Mgu1hOxyvVmHHw-1; Tue, 23 Mar 2021 05:22:15 -0400
X-MC-Unique: PJZ6UzV7Mgu1hOxyvVmHHw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E40CB81622
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 09:22:14 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-113-239.ams2.redhat.com
 [10.36.113.239])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0A9BF9CA0;
 Tue, 23 Mar 2021 09:22:13 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] optionrom: add memcmp() implementation
Date: Tue, 23 Mar 2021 10:22:10 +0100
Message-Id: <20210323092211.44597-2-sgarzare@redhat.com>
In-Reply-To: <20210323092211.44597-1-sgarzare@redhat.com>
References: <20210323092211.44597-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=sgarzare@redhat.com;
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Provide memcmp() implementation that can be used by optionroms.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 pc-bios/optionrom/optrom.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/pc-bios/optionrom/optrom.h b/pc-bios/optionrom/optrom.h
index 357819259a..b98436e413 100644
--- a/pc-bios/optionrom/optrom.h
+++ b/pc-bios/optionrom/optrom.h
@@ -25,6 +25,7 @@
 #define OPTROM_H
 
 #include <stdint.h>
+#include <stddef.h>
 #include "../../include/standard-headers/linux/qemu_fw_cfg.h"
 
 #define barrier() asm("" : : : "memory")
@@ -107,4 +108,18 @@ static inline uint32_t be32_to_cpu(uint32_t x)
     return bswap32(x);
 }
 
+static inline int memcmp(const void *str1, const void *str2, size_t count)
+{
+    const unsigned char *c1 = str1, *c2 = str2;
+    int ret = 0;
+
+    while (count--) {
+        ret = *c1++ - *c2++;
+        if (ret) {
+            break;
+        }
+    }
+
+    return ret;
+}
 #endif /* OPTROM_H */
-- 
2.30.2


