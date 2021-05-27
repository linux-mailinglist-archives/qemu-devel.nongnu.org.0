Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6163930F8
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 16:35:21 +0200 (CEST)
Received: from localhost ([::1]:34412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmH6V-0002nC-4V
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 10:35:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lmGwG-0007DA-3M
 for qemu-devel@nongnu.org; Thu, 27 May 2021 10:24:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lmGwE-0004du-4f
 for qemu-devel@nongnu.org; Thu, 27 May 2021 10:24:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622125481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pOaFZ/OYeiyZ1qgfdSMKyv8V7Hnnlwig2DS1ADn0zY0=;
 b=ifb6db2yWvM/7UPilTo/guCvclXuCy7FThSjTadFRxL0PhA9nZMG5KlTaKAlF672JCFKDl
 PvakjM9CZvhV9Ybf87qxSgn09HS2rKxrAYRQMDow51hlbfCfCfseREPdk0CJiCtY1Pg/0W
 EW8mbyuI++b4p1iakA7ATT21VYdwlg8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-a9UT1JKJOiqehDndjE-VIw-1; Thu, 27 May 2021 10:24:38 -0400
X-MC-Unique: a9UT1JKJOiqehDndjE-VIw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A6B44180FD61;
 Thu, 27 May 2021 14:24:37 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-84.ams2.redhat.com
 [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6BA462BFE4;
 Thu, 27 May 2021 14:24:37 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 809041800847; Thu, 27 May 2021 16:23:41 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/23] headers: Add udmabuf.h
Date: Thu, 27 May 2021 16:23:28 +0200
Message-Id: <20210527142340.1352791-12-kraxel@redhat.com>
In-Reply-To: <20210527142340.1352791-1-kraxel@redhat.com>
References: <20210527142340.1352791-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vivek Kasireddy <vivek.kasireddy@intel.com>

This adds udmabuf header to standard headers so that the
relevant udmabuf objects can be accessed in subsequent
patches.

Based-on-patch-by: Gerd Hoffmann <kraxel@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
Message-Id: <20210526231429.1045476-3-vivek.kasireddy@intel.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/standard-headers/linux/udmabuf.h | 32 ++++++++++++++++++++++++
 scripts/update-linux-headers.sh          |  3 +++
 2 files changed, 35 insertions(+)
 create mode 100644 include/standard-headers/linux/udmabuf.h

diff --git a/include/standard-headers/linux/udmabuf.h b/include/standard-headers/linux/udmabuf.h
new file mode 100644
index 000000000000..e19eb5b5ce75
--- /dev/null
+++ b/include/standard-headers/linux/udmabuf.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+#ifndef _LINUX_UDMABUF_H
+#define _LINUX_UDMABUF_H
+
+#include "standard-headers/linux/types.h"
+
+#define UDMABUF_FLAGS_CLOEXEC	0x01
+
+struct udmabuf_create {
+	uint32_t memfd;
+	uint32_t flags;
+	uint64_t offset;
+	uint64_t size;
+};
+
+struct udmabuf_create_item {
+	uint32_t memfd;
+	uint32_t __pad;
+	uint64_t offset;
+	uint64_t size;
+};
+
+struct udmabuf_create_list {
+	uint32_t flags;
+	uint32_t count;
+	struct udmabuf_create_item list[];
+};
+
+#define UDMABUF_CREATE       _IOW('u', 0x42, struct udmabuf_create)
+#define UDMABUF_CREATE_LIST  _IOW('u', 0x43, struct udmabuf_create_list)
+
+#endif /* _LINUX_UDMABUF_H */
diff --git a/scripts/update-linux-headers.sh b/scripts/update-linux-headers.sh
index 1050e361694f..fea4d6eb655f 100755
--- a/scripts/update-linux-headers.sh
+++ b/scripts/update-linux-headers.sh
@@ -34,6 +34,7 @@ cp_portable() {
     if
         grep '#include' "$f" | grep -v -e 'linux/virtio' \
                                      -e 'linux/types' \
+                                     -e 'linux/ioctl' \
                                      -e 'stdint' \
                                      -e 'linux/if_ether' \
                                      -e 'input-event-codes' \
@@ -66,6 +67,7 @@ cp_portable() {
         -e 's/__BITS_PER_LONG/HOST_LONG_BITS/' \
         -e '/\"drm.h\"/d' \
         -e '/sys\/ioctl.h/d' \
+        -e '/linux\/ioctl.h/d' \
         -e 's/SW_MAX/SW_MAX_/' \
         -e 's/atomic_t/int/' \
         -e 's/__kernel_long_t/long/' \
@@ -190,6 +192,7 @@ for i in "$tmpdir"/include/linux/*virtio*.h \
          "$tmpdir/include/linux/fuse.h" \
          "$tmpdir/include/linux/input.h" \
          "$tmpdir/include/linux/input-event-codes.h" \
+         "$tmpdir/include/linux/udmabuf.h" \
          "$tmpdir/include/linux/pci_regs.h" \
          "$tmpdir/include/linux/ethtool.h" \
          "$tmpdir/include/linux/const.h" \
-- 
2.31.1


