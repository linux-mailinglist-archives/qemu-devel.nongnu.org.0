Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C8A2FA77A
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 18:28:13 +0100 (CET)
Received: from localhost ([::1]:35130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1YK4-0003aH-2W
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 12:28:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1XwB-0006fY-DF
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 12:03:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1Xw9-0007XD-99
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 12:03:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610989407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BjJm1HCMLbbZqIfMy+Wy6KgF85jtYSbpI+EcijPWuf4=;
 b=eZ04hdMtJRyJX5h5N6DHdzfB5g69XCpdnAAWlNIXWNiCNPWFPvUGr+LTO26RLR4TXFpfWL
 PQbMjOOAlVa09ihcG/1S8cqRP53sZu3WL0Qqj1HeQCHYV2boJZ4xjtDBEbReKLgEvkF4sd
 M9b95PPv27CyUUfEdOLK7D49hRR//Mg=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-dkcyw4rSNOOWuPwGm5QGPA-1; Mon, 18 Jan 2021 12:03:23 -0500
X-MC-Unique: dkcyw4rSNOOWuPwGm5QGPA-1
Received: by mail-ej1-f69.google.com with SMTP id f26so5371296ejy.9
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 09:03:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BjJm1HCMLbbZqIfMy+Wy6KgF85jtYSbpI+EcijPWuf4=;
 b=pf3Xo5M02Rmf2gIlOpat9AUJUQN4Dmn4g/hc5iOvTdjrsbQhGnsTxHU8SDoAoXJ5B5
 Y0p/LGjaFn4XyxOzFP9iCjoD8RERkEs80wBKduurrKg7gfUIlMvuSkfMmfm75RjunaPQ
 R08/grlemWieXIKfBRCjPqTkArHqr32qN9gK3OF3qUTqyL2R3GlSnIRDb9NusGp1HqP0
 MmaZ1Ku0ShPiWV1LWAD3yxhe4DxH4SBpAisDyuccTQkL2YtPtnUS6qP+RpUG3ekTE30p
 o0vGfwsN6bIPBIne8WnKbLYBxlwA7rOrD9E4i/MbqbHeUjAC+MP0a1OGaoS1JDlIbZzI
 9dgQ==
X-Gm-Message-State: AOAM530OFjE4LEqu6vLNOkZ9stau2m9RdVCX+2qBTAnC5IOSdhiO09J3
 q9PdmFtrrkg3kBNF8xKQJ+qMvC6lFGxauB7qaen6Zt3NfeWAR/oDjShvhuBf2b65Ykw0VImFI7N
 I3Ij8Czh4/dBOmVAIAwFb2fFefBwtexaj8v8xGvel6NoTMbCkAhm676CuT6FeP4ii
X-Received: by 2002:a17:906:9616:: with SMTP id
 s22mr432772ejx.270.1610989401981; 
 Mon, 18 Jan 2021 09:03:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwmkEnjjom0gmHD4h8sReDYhMDCrw2wBg3N/Vjpf0rxYpVT15NH56lTF0ZGrP+HH/3MrlXNBQ==
X-Received: by 2002:a17:906:9616:: with SMTP id
 s22mr432740ejx.270.1610989401664; 
 Mon, 18 Jan 2021 09:03:21 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id e21sm11024956edv.96.2021.01.18.09.03.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jan 2021 09:03:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 2/2] hw/usb/dev-uas: Report command additional adb length
 as unsupported
Date: Mon, 18 Jan 2021 18:03:08 +0100
Message-Id: <20210118170308.282442-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210118170308.282442-1-philmd@redhat.com>
References: <20210118170308.282442-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
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
Cc: Fam Zheng <fam@euphon.net>, Ed Maste <emaste@FreeBSD.org>,
 qemu-block@nongnu.org, "Gustavo A . R . Silva" <gustavo@embeddedor.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Daniele Buono <dbuono@linux.vnet.ibm.com>, Han Han <hhan@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are not ready to handle additional CDB data.

If a guest send a packet with such additional data,
report the command parameter as not supported.

We can then explicit there is nothing in this additional
buffer, by fixing its size to zero.

This fixes an error when building with Clang 11:

  usb/dev-uas.c:157:31: error: field 'status' with variable sized type 'uas_iu' not at the end of a struct or class is a GNU extension [-Werror,-Wgnu-variable-sized-type-not-at-end]
      uas_iu                    status;
                                ^

Reported-by: Daniele Buono <dbuono@linux.vnet.ibm.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Cc: Ed Maste <emaste@FreeBSD.org>
Cc: Han Han <hhan@redhat.com>
Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 hw/usb/dev-uas.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/usb/dev-uas.c b/hw/usb/dev-uas.c
index cec071d96c4..b6434ad4b9c 100644
--- a/hw/usb/dev-uas.c
+++ b/hw/usb/dev-uas.c
@@ -16,6 +16,7 @@
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
+#include "qemu/log.h"
 
 #include "hw/usb.h"
 #include "migration/vmstate.h"
@@ -70,7 +71,7 @@ typedef struct {
     uint8_t    reserved_2;
     uint64_t   lun;
     uint8_t    cdb[16];
-    uint8_t    add_cdb[];
+    uint8_t    add_cdb[0];      /* not supported by QEMU */
 } QEMU_PACKED  uas_iu_command;
 
 typedef struct {
@@ -700,6 +701,11 @@ static void usb_uas_command(UASDevice *uas, uas_iu *iu)
     uint32_t len;
     uint16_t tag = be16_to_cpu(iu->hdr.tag);
 
+    if (iu->command.add_cdb_length > 0) {
+        qemu_log_mask(LOG_UNIMP, "additional adb length not yet supported\n");
+        goto unsupported_len;
+    }
+
     if (uas_using_streams(uas) && tag > UAS_MAX_STREAMS) {
         goto invalid_tag;
     }
@@ -735,6 +741,10 @@ static void usb_uas_command(UASDevice *uas, uas_iu *iu)
     }
     return;
 
+unsupported_len:
+    usb_uas_queue_fake_sense(uas, tag, sense_code_INVALID_PARAM_VALUE);
+    return;
+
 invalid_tag:
     usb_uas_queue_fake_sense(uas, tag, sense_code_INVALID_TAG);
     return;
-- 
2.26.2


