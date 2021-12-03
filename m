Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A37C4680D3
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Dec 2021 00:44:08 +0100 (CET)
Received: from localhost ([::1]:42768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtIDn-0004p2-CW
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 18:44:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1mtI4f-0006Bx-9W
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 18:34:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1mtI4c-0001or-7w
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 18:34:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638574477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lIhV5K1u2wvXnKxE9a1/GDmXrykKf0FSebfksfskNA0=;
 b=i+ynqhFFrcGLRJXHnIH300HEiwDCTdX71cIffNi0JPs4xMa0rW93J/r+lvcsV9fNhARY7L
 siRKPWSfe2BxAQJPAZ7HqXaQRtSCtrCjaBsdjbeZ2hUETnlJcAO277+Ftkig/x7KvjWA+0
 6OP1gXWYQNCCGmBLHDU+oHcn5gw0bAg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-169-Yg0FrP4mMhSQtBSjAXPesg-1; Fri, 03 Dec 2021 18:34:34 -0500
X-MC-Unique: Yg0FrP4mMhSQtBSjAXPesg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 317231030C20;
 Fri,  3 Dec 2021 23:34:33 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-43.bne.redhat.com [10.64.54.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D16BF60843;
 Fri,  3 Dec 2021 23:34:27 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v3 1/2] virtio-mem: Correct default THP size for ARM64
Date: Sat,  4 Dec 2021 07:34:03 +0800
Message-Id: <20211203233404.37313-2-gshan@redhat.com>
In-Reply-To: <20211203233404.37313-1-gshan@redhat.com>
References: <20211203233404.37313-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, david@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, eric.auger@redhat.com,
 shan.gavin@gmail.com, Jonathan.Cameron@huawei.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The default block size is same as to the THP size, which is either
retrieved from "/sys/kernel/mm/transparent_hugepage/hpage_pmd_size"
or hardcoded to 2MB. There are flaws in both mechanisms and this
intends to fix them up.

  * When "/sys/kernel/mm/transparent_hugepage/hpage_pmd_size" is
    used to getting the THP size, 32MB and 512MB are valid values
    when we have 16KB and 64KB page size on ARM64.

  * When the hardcoded THP size is used, 2MB, 32MB and 512MB are
    valid values when we have 4KB, 16KB and 64KB page sizes on
    ARM64.

Co-developed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
---
 hw/virtio/virtio-mem.c | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index d5a578142b..b20595a496 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -38,14 +38,25 @@
  */
 #define VIRTIO_MEM_MIN_BLOCK_SIZE ((uint32_t)(1 * MiB))
 
-#if defined(__x86_64__) || defined(__arm__) || defined(__aarch64__) || \
-    defined(__powerpc64__)
-#define VIRTIO_MEM_DEFAULT_THP_SIZE ((uint32_t)(2 * MiB))
-#else
-        /* fallback to 1 MiB (e.g., the THP size on s390x) */
-#define VIRTIO_MEM_DEFAULT_THP_SIZE VIRTIO_MEM_MIN_BLOCK_SIZE
+static uint32_t virtio_mem_default_thp_size(void)
+{
+    uint32_t default_thp_size = VIRTIO_MEM_MIN_BLOCK_SIZE;
+
+#if defined(__x86_64__) || defined(__arm__) || defined(__powerpc64__)
+    default_thp_size = 2 * MiB;
+#elif defined(__aarch64__)
+    if (qemu_real_host_page_size == 4 * KiB) {
+        default_thp_size = 2 * MiB;
+    } else if (qemu_real_host_page_size == 16 * KiB) {
+        default_thp_size = 32 * MiB;
+    } else if (qemu_real_host_page_size == 64 * KiB) {
+        default_thp_size = 512 * MiB;
+    }
 #endif
 
+    return default_thp_size;
+}
+
 /*
  * We want to have a reasonable default block size such that
  * 1. We avoid splitting THPs when unplugging memory, which degrades
@@ -78,11 +89,8 @@ static uint32_t virtio_mem_thp_size(void)
     if (g_file_get_contents(HPAGE_PMD_SIZE_PATH, &content, NULL, NULL) &&
         !qemu_strtou64(content, &endptr, 0, &tmp) &&
         (!endptr || *endptr == '\n')) {
-        /*
-         * Sanity-check the value, if it's too big (e.g., aarch64 with 64k base
-         * pages) or weird, fallback to something smaller.
-         */
-        if (!tmp || !is_power_of_2(tmp) || tmp > 16 * MiB) {
+        /* Sanity-check the value and fallback to something reasonable. */
+        if (!tmp || !is_power_of_2(tmp)) {
             warn_report("Read unsupported THP size: %" PRIx64, tmp);
         } else {
             thp_size = tmp;
@@ -90,7 +98,7 @@ static uint32_t virtio_mem_thp_size(void)
     }
 
     if (!thp_size) {
-        thp_size = VIRTIO_MEM_DEFAULT_THP_SIZE;
+        thp_size = virtio_mem_default_thp_size();
         warn_report("Could not detect THP size, falling back to %" PRIx64
                     "  MiB.", thp_size / MiB);
     }
-- 
2.23.0


