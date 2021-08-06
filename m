Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A893E30E5
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 23:20:23 +0200 (CEST)
Received: from localhost ([::1]:57820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC7GQ-0002IQ-TY
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 17:20:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mC79S-0002gG-7X
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 17:13:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mC79P-0004ss-MT
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 17:13:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628284387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CeG8k63FenJdr7zgWUqqU98P2FwL+xytPYUF0ImaGIc=;
 b=YNVQMkoSEFKkCNKfkmZJloCDmGqsofJ6qglks4jasNyf0YXbhJd3gbqdbtfDI6bWjjmiXI
 0XpLkX4+Oz7sKnK/av5rbxJvNN+l7pB8OFuKjUB17L3e1Ha3oMbZeMrfDwOe/oThWW5M0W
 LBYrY2WEHK7jKWQtsFYwdXE/ugs1n+I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-6cXLgDWZMoeHPwV6c6AYGQ-1; Fri, 06 Aug 2021 17:13:02 -0400
X-MC-Unique: 6cXLgDWZMoeHPwV6c6AYGQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F8561800D41;
 Fri,  6 Aug 2021 21:13:01 +0000 (UTC)
Received: from localhost (unknown [10.22.11.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 29EC95D6AD;
 Fri,  6 Aug 2021 21:13:01 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 09/12] npcm7xx_otp: Use DECLARE_CLASS_CHECKERS
Date: Fri,  6 Aug 2021 17:11:24 -0400
Message-Id: <20210806211127.646908-10-ehabkost@redhat.com>
In-Reply-To: <20210806211127.646908-1-ehabkost@redhat.com>
References: <20210806211127.646908-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Havard Skinnemoen <hskinnemoen@google.com>, Tyrone Ting <kfting@nuvoton.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use DECLARE_CLASS_CHECKERS instead of defining the
NPCM7XX_OTP_CLASS and NPCM7XX_OTP_GET_CLASS macros manually.

These changes had to be done manually because the typedef and the
existing macro definitions were in different files.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: Havard Skinnemoen <hskinnemoen@google.com>
Cc: Tyrone Ting <kfting@nuvoton.com>
Cc: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
---
 include/hw/nvram/npcm7xx_otp.h | 5 +++--
 hw/nvram/npcm7xx_otp.c         | 5 -----
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/include/hw/nvram/npcm7xx_otp.h b/include/hw/nvram/npcm7xx_otp.h
index 4cfc6577e87..0a3ebb091d5 100644
--- a/include/hw/nvram/npcm7xx_otp.h
+++ b/include/hw/nvram/npcm7xx_otp.h
@@ -60,12 +60,13 @@ typedef struct NPCM7xxOTPState NPCM7xxOTPState;
 #define TYPE_NPCM7XX_OTP "npcm7xx-otp"
 DECLARE_INSTANCE_CHECKER(NPCM7xxOTPState, NPCM7XX_OTP,
                          TYPE_NPCM7XX_OTP)
+typedef struct NPCM7xxOTPClass NPCM7xxOTPClass;
+DECLARE_CLASS_CHECKERS(NPCM7xxOTPClass, NPCM7XX_OTP,
+                       TYPE_NPCM7XX_OTP)
 
 #define TYPE_NPCM7XX_KEY_STORAGE "npcm7xx-key-storage"
 #define TYPE_NPCM7XX_FUSE_ARRAY "npcm7xx-fuse-array"
 
-typedef struct NPCM7xxOTPClass NPCM7xxOTPClass;
-
 /**
  * npcm7xx_otp_array_write - ECC encode and write data to OTP array.
  * @s: OTP module.
diff --git a/hw/nvram/npcm7xx_otp.c b/hw/nvram/npcm7xx_otp.c
index 52b9482419e..61085c5228b 100644
--- a/hw/nvram/npcm7xx_otp.c
+++ b/hw/nvram/npcm7xx_otp.c
@@ -73,11 +73,6 @@ struct NPCM7xxOTPClass {
     const MemoryRegionOps *mmio_ops;
 };
 
-#define NPCM7XX_OTP_CLASS(klass) \
-    OBJECT_CLASS_CHECK(NPCM7xxOTPClass, (klass), TYPE_NPCM7XX_OTP)
-#define NPCM7XX_OTP_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(NPCM7xxOTPClass, (obj), TYPE_NPCM7XX_OTP)
-
 static uint8_t ecc_encode_nibble(uint8_t n)
 {
     uint8_t result = n;
-- 
2.31.1


