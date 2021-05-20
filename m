Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5644038AAA2
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 13:14:40 +0200 (CEST)
Received: from localhost ([::1]:45978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljgdT-0007R8-DE
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 07:14:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljgYV-0007jS-0Y
 for qemu-devel@nongnu.org; Thu, 20 May 2021 07:09:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljgYT-0004NN-5B
 for qemu-devel@nongnu.org; Thu, 20 May 2021 07:09:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621508968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9HmbSl5d9pXpS90PMMdxl3LY29W1LC7gy3N9ueCnGUQ=;
 b=DH0QLfxnyZvINS3SlQmnJ4TxUGSQTmtIk0pQzAbLaZDsWr6ComOse9mqTI0AJS7ZOfdDYI
 Z4W4YHBDRanVlTt+VqE/hsQPhfTSyerTvtAbmq3Z1JueJvkC4IVecovhKVbzwoQtGiL5xA
 06V3PkNmAjuGtK6UyqqvJzYwy7m9hOQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-3lDD5V2SMWym14gmOXmPrQ-1; Thu, 20 May 2021 07:09:27 -0400
X-MC-Unique: 3lDD5V2SMWym14gmOXmPrQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 c13-20020a5d6ccd0000b029010ec741b84bso8490350wrc.23
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 04:09:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9HmbSl5d9pXpS90PMMdxl3LY29W1LC7gy3N9ueCnGUQ=;
 b=I0Kxa33h94b8TEMekyF/CAC7WpJS6WpRB/7yTMEqi5LhekC1kU8Ll029Xv+V6F4Is1
 iWDaQXraY8BxwFJlpL7AOPgcOm3qQmzqehE1lxKMNPBdk+LsJRzt6OcEJDRiS83CLwm/
 XVX03RTmPOE2+iwcZKavDV1FA0FAMznXqyUgo429puo2nHi1B3+7lGTkHg8/l36wjqVN
 hA62gtDXzfzmLPbKADUTqoFAzqAU6a0B44x9uNphkhdrNf/vGOZ+jWCE6BsxCSuZtDF5
 Pdi8dz8jwxSa/IU86l4rwGPZqDHkQYRyJRiKkTAPe+KGR4YkrrlfAaG1SxW5XPPa215j
 sNPw==
X-Gm-Message-State: AOAM530fh1qqbOfghqUyzh9lhQK1bKJ/Per41/ujGpWmBZCIh0ZP2yEt
 vsH835DsrI80EraI2bw9npyn20eduAL72KKhfk2wA4ARp99+I9Lg+EhGSO0JTPPU6TXWPvXHrnh
 1mXemVSrtjPxhyB/+Er5RCM9Yw35ffhKc4Gy/cb1QYhM1ZTg9lotLtY9BoXMaSucp
X-Received: by 2002:a5d:618f:: with SMTP id j15mr3609400wru.273.1621508965741; 
 Thu, 20 May 2021 04:09:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwF78sliMDmoM7ECbddjDeFmNWk084x1Wis7UM7Ge+KC0HrAOaH0g2rhGB7Pc0mdz7II5eGLw==
X-Received: by 2002:a5d:618f:: with SMTP id j15mr3609358wru.273.1621508965371; 
 Thu, 20 May 2021 04:09:25 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id m7sm2773621wrv.35.2021.05.20.04.09.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 04:09:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 01/12] exec/memory_ldst: Use correct type sizes
Date: Thu, 20 May 2021 13:09:08 +0200
Message-Id: <20210520110919.2483190-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210520110919.2483190-1-philmd@redhat.com>
References: <20210520110919.2483190-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>,
 Bibo Mao <maobibo@loongson.cn>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use uint8_t for (unsigned) byte, and uint16_t for (unsigned)
16-bit word.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/exec/memory_ldst.h.inc | 16 ++++++++--------
 memory_ldst.c.inc              | 20 ++++++++++----------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/include/exec/memory_ldst.h.inc b/include/exec/memory_ldst.h.inc
index 46e6c220d35..7c3a641f7ed 100644
--- a/include/exec/memory_ldst.h.inc
+++ b/include/exec/memory_ldst.h.inc
@@ -20,7 +20,7 @@
  */
 
 #ifdef TARGET_ENDIANNESS
-extern uint32_t glue(address_space_lduw, SUFFIX)(ARG1_DECL,
+extern uint16_t glue(address_space_lduw, SUFFIX)(ARG1_DECL,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result);
 extern uint32_t glue(address_space_ldl, SUFFIX)(ARG1_DECL,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result);
@@ -29,17 +29,17 @@ extern uint64_t glue(address_space_ldq, SUFFIX)(ARG1_DECL,
 extern void glue(address_space_stl_notdirty, SUFFIX)(ARG1_DECL,
     hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result);
 extern void glue(address_space_stw, SUFFIX)(ARG1_DECL,
-    hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result);
+    hwaddr addr, uint16_t val, MemTxAttrs attrs, MemTxResult *result);
 extern void glue(address_space_stl, SUFFIX)(ARG1_DECL,
     hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result);
 extern void glue(address_space_stq, SUFFIX)(ARG1_DECL,
     hwaddr addr, uint64_t val, MemTxAttrs attrs, MemTxResult *result);
 #else
-extern uint32_t glue(address_space_ldub, SUFFIX)(ARG1_DECL,
+extern uint8_t glue(address_space_ldub, SUFFIX)(ARG1_DECL,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result);
-extern uint32_t glue(address_space_lduw_le, SUFFIX)(ARG1_DECL,
+extern uint16_t glue(address_space_lduw_le, SUFFIX)(ARG1_DECL,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result);
-extern uint32_t glue(address_space_lduw_be, SUFFIX)(ARG1_DECL,
+extern uint16_t glue(address_space_lduw_be, SUFFIX)(ARG1_DECL,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result);
 extern uint32_t glue(address_space_ldl_le, SUFFIX)(ARG1_DECL,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result);
@@ -50,11 +50,11 @@ extern uint64_t glue(address_space_ldq_le, SUFFIX)(ARG1_DECL,
 extern uint64_t glue(address_space_ldq_be, SUFFIX)(ARG1_DECL,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result);
 extern void glue(address_space_stb, SUFFIX)(ARG1_DECL,
-    hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result);
+    hwaddr addr, uint8_t val, MemTxAttrs attrs, MemTxResult *result);
 extern void glue(address_space_stw_le, SUFFIX)(ARG1_DECL,
-    hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result);
+    hwaddr addr, uint16_t val, MemTxAttrs attrs, MemTxResult *result);
 extern void glue(address_space_stw_be, SUFFIX)(ARG1_DECL,
-    hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result);
+    hwaddr addr, uint16_t val, MemTxAttrs attrs, MemTxResult *result);
 extern void glue(address_space_stl_le, SUFFIX)(ARG1_DECL,
     hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result);
 extern void glue(address_space_stl_be, SUFFIX)(ARG1_DECL,
diff --git a/memory_ldst.c.inc b/memory_ldst.c.inc
index b56e9619674..84b868f2946 100644
--- a/memory_ldst.c.inc
+++ b/memory_ldst.c.inc
@@ -157,7 +157,7 @@ uint64_t glue(address_space_ldq_be, SUFFIX)(ARG1_DECL,
                                                     DEVICE_BIG_ENDIAN);
 }
 
-uint32_t glue(address_space_ldub, SUFFIX)(ARG1_DECL,
+uint8_t glue(address_space_ldub, SUFFIX)(ARG1_DECL,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result)
 {
     uint8_t *ptr;
@@ -193,7 +193,7 @@ uint32_t glue(address_space_ldub, SUFFIX)(ARG1_DECL,
 }
 
 /* warning: addr must be aligned */
-static inline uint32_t glue(address_space_lduw_internal, SUFFIX)(ARG1_DECL,
+static inline uint16_t glue(address_space_lduw_internal, SUFFIX)(ARG1_DECL,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result,
     enum device_endian endian)
 {
@@ -240,21 +240,21 @@ static inline uint32_t glue(address_space_lduw_internal, SUFFIX)(ARG1_DECL,
     return val;
 }
 
-uint32_t glue(address_space_lduw, SUFFIX)(ARG1_DECL,
+uint16_t glue(address_space_lduw, SUFFIX)(ARG1_DECL,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result)
 {
     return glue(address_space_lduw_internal, SUFFIX)(ARG1, addr, attrs, result,
                                                      DEVICE_NATIVE_ENDIAN);
 }
 
-uint32_t glue(address_space_lduw_le, SUFFIX)(ARG1_DECL,
+uint16_t glue(address_space_lduw_le, SUFFIX)(ARG1_DECL,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result)
 {
     return glue(address_space_lduw_internal, SUFFIX)(ARG1, addr, attrs, result,
                                                      DEVICE_LITTLE_ENDIAN);
 }
 
-uint32_t glue(address_space_lduw_be, SUFFIX)(ARG1_DECL,
+uint16_t glue(address_space_lduw_be, SUFFIX)(ARG1_DECL,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result)
 {
     return glue(address_space_lduw_internal, SUFFIX)(ARG1, addr, attrs, result,
@@ -366,7 +366,7 @@ void glue(address_space_stl_be, SUFFIX)(ARG1_DECL,
 }
 
 void glue(address_space_stb, SUFFIX)(ARG1_DECL,
-    hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result)
+    hwaddr addr, uint8_t val, MemTxAttrs attrs, MemTxResult *result)
 {
     uint8_t *ptr;
     MemoryRegion *mr;
@@ -398,7 +398,7 @@ void glue(address_space_stb, SUFFIX)(ARG1_DECL,
 
 /* warning: addr must be aligned */
 static inline void glue(address_space_stw_internal, SUFFIX)(ARG1_DECL,
-    hwaddr addr, uint32_t val, MemTxAttrs attrs,
+    hwaddr addr, uint16_t val, MemTxAttrs attrs,
     MemTxResult *result, enum device_endian endian)
 {
     uint8_t *ptr;
@@ -441,21 +441,21 @@ static inline void glue(address_space_stw_internal, SUFFIX)(ARG1_DECL,
 }
 
 void glue(address_space_stw, SUFFIX)(ARG1_DECL,
-    hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result)
+    hwaddr addr, uint16_t val, MemTxAttrs attrs, MemTxResult *result)
 {
     glue(address_space_stw_internal, SUFFIX)(ARG1, addr, val, attrs, result,
                                              DEVICE_NATIVE_ENDIAN);
 }
 
 void glue(address_space_stw_le, SUFFIX)(ARG1_DECL,
-    hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result)
+    hwaddr addr, uint16_t val, MemTxAttrs attrs, MemTxResult *result)
 {
     glue(address_space_stw_internal, SUFFIX)(ARG1, addr, val, attrs, result,
                                              DEVICE_LITTLE_ENDIAN);
 }
 
 void glue(address_space_stw_be, SUFFIX)(ARG1_DECL,
-    hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result)
+    hwaddr addr, uint16_t val, MemTxAttrs attrs, MemTxResult *result)
 {
     glue(address_space_stw_internal, SUFFIX)(ARG1, addr, val, attrs, result,
                                DEVICE_BIG_ENDIAN);
-- 
2.26.3


