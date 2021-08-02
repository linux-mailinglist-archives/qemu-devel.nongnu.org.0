Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3827E3DDD65
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 18:17:58 +0200 (CEST)
Received: from localhost ([::1]:39580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAadZ-0003oZ-6y
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 12:17:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mAabV-0000xN-2n
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 12:15:52 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:35336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mAabS-0006qA-LL
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 12:15:48 -0400
Received: by mail-ej1-x62f.google.com with SMTP id o5so31781069ejy.2
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 09:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wTjOAVjdtymwz9rd5aA6ONu5k4R7mM2ueQUxv/s95TM=;
 b=UCMg7c/Wa5cq/JaS0xrPZRhKaq5W79m57kOaSkn40L2pR/AlR/i7yhjd2rpzCgzl44
 Az8qY0CAFl7IpZo3K9q/rellwM9RpgXY8Jn8f4AEBuHZOYvPXkgg5yEfzUHvUQ1yKObX
 z32KVUzefawugAL7sh+VOtF9rgSi0ZVE35JERim4Uvs2auRMUuex2PugiU2B/z7vMeQJ
 xCIWuAd0QssHhxza0ZCPpeN5EherRNURDvLHz7T2I8BPu9R3InHqBWb2LDl8PSDJ2nsq
 LxRF8QUUgOphhmQ5JU35+0dJZ9EYBql9i/A3blgaRErxJfDgINELBMycaYsYWL6XRm6B
 VMZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wTjOAVjdtymwz9rd5aA6ONu5k4R7mM2ueQUxv/s95TM=;
 b=mvU6W1ttG43Qkx82pLqmKikxzHaQihqMjF7wyQeYNmg4HJO73k8cxlmfTQunosU7um
 c3YeY1gymSly4rq7+YODeMr6pfOknYGupo5Kc7qs51mVBGVFIAbC0f2+x5WdsWxbhUQ4
 iJx5R3FWg2E9OcKWWu9gUCUYOZVQZoS6fKCYhVktUHulNpBOwqOYwuPBzHmhLE+7A8qW
 2L1i+xQLruQ3xd8OrDsukSM4HHw3ZwMLlRfR6ji0sAmNRgwiDFkUEbdkiFYs3WryAOeX
 o+PvQZtkBpPvm0gudU9MAQwQncRek6gDufwY34mY6QGgzttjwjnGZ0DrA8nvGcbHJRFG
 OD2g==
X-Gm-Message-State: AOAM531YtRkGiJG3U0Q2eZWPjEGjIQCtMZtVC28cXz9vgDmtrMEFDdN4
 v4f5BM1N0bFGc+LdR1clALNggxWfVKDTNg==
X-Google-Smtp-Source: ABdhPJyEuNCkXq8vu1a8+7fZjUpIX+/lPvxr7PZL+X6HkBT9Lu1gQ38BQAPM3BmYlMjcPwkD/CjRlA==
X-Received: by 2002:a17:906:a3d8:: with SMTP id
 ca24mr16565445ejb.533.1627920945372; 
 Mon, 02 Aug 2021 09:15:45 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id f15sm4835144ejb.125.2021.08.02.09.15.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 09:15:45 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/8] coverity-model: update address_space_read/write models
Date: Mon,  2 Aug 2021 18:15:37 +0200
Message-Id: <20210802161542.381976-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210802161542.381976-1-pbonzini@redhat.com>
References: <20210802161542.381976-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use void * for consistency with the actual function; provide a model
for MemoryRegionCache functions and for address_space_rw.  These
let Coverity understand the bounds of the data that various functions
read and write even at very high levels of inlining (e.g. pci_dma_read).

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/coverity-scan/model.c | 48 ++++++++++++++++++++++++++++++++---
 1 file changed, 45 insertions(+), 3 deletions(-)

diff --git a/scripts/coverity-scan/model.c b/scripts/coverity-scan/model.c
index 2c0346ff25..e1bdf0ad84 100644
--- a/scripts/coverity-scan/model.c
+++ b/scripts/coverity-scan/model.c
@@ -45,9 +45,10 @@ typedef struct va_list_str *va_list;
 /* exec.c */
 
 typedef struct AddressSpace AddressSpace;
+typedef struct MemoryRegionCache MemoryRegionCache;
 typedef uint64_t hwaddr;
 typedef uint32_t MemTxResult;
-typedef uint64_t MemTxAttrs;
+typedef struct MemTxAttrs {} MemTxAttrs;
 
 static void __bufwrite(uint8_t *buf, ssize_t len)
 {
@@ -67,9 +68,40 @@ static void __bufread(uint8_t *buf, ssize_t len)
     int last = buf[len-1];
 }
 
+MemTxResult address_space_read_cached(MemoryRegionCache *cache, hwaddr addr,
+                                      MemTxAttrs attrs,
+                                      void *buf, int len)
+{
+    MemTxResult result;
+    // TODO: investigate impact of treating reads as producing
+    // tainted data, with __coverity_tainted_data_argument__(buf).
+    __bufwrite(buf, len);
+    return result;
+}
+
+MemTxResult address_space_write_cached(MemoryRegionCache *cache, hwaddr addr,
+                                MemTxAttrs attrs,
+                                const void *buf, int len)
+{
+    MemTxResult result;
+    __bufread(buf, len);
+    return result;
+}
+
+MemTxResult address_space_rw_cached(MemoryRegionCache *cache, hwaddr addr,
+                                    MemTxAttrs attrs,
+                                    void *buf, int len, bool is_write)
+{
+    if (is_write) {
+        return address_space_write_cached(cache, addr, attrs, buf, len);
+    } else {
+        return address_space_read_cached(cache, addr, attrs, buf, len);
+    }
+}
+
 MemTxResult address_space_read(AddressSpace *as, hwaddr addr,
                                MemTxAttrs attrs,
-                               uint8_t *buf, int len)
+                               void *buf, int len)
 {
     MemTxResult result;
     // TODO: investigate impact of treating reads as producing
@@ -80,13 +112,23 @@ MemTxResult address_space_read(AddressSpace *as, hwaddr addr,
 
 MemTxResult address_space_write(AddressSpace *as, hwaddr addr,
                                 MemTxAttrs attrs,
-                                const uint8_t *buf, int len)
+                                const void *buf, int len)
 {
     MemTxResult result;
     __bufread(buf, len);
     return result;
 }
 
+MemTxResult address_space_rw(AddressSpace *as, hwaddr addr,
+                             MemTxAttrs attrs,
+                             void *buf, int len, bool is_write)
+{
+    if (is_write) {
+        return address_space_write(as, addr, attrs, buf, len);
+    } else {
+        return address_space_read(as, addr, attrs, buf, len);
+    }
+}
 
 /* Tainting */
 
-- 
2.31.1



