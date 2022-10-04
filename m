Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 898785F3FFA
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 11:40:48 +0200 (CEST)
Received: from localhost ([::1]:59660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofePv-0007UU-M4
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 05:40:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ofeHg-0005JO-Ca
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 05:32:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ofeHc-000528-06
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 05:32:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664875931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0pdDLYVkVwdzHhw/TAtDZWzMdTQ5gNidDr00X3PpiF0=;
 b=Y6ZSITQD/7mQlCJziJbkW4Ob6gFNkSCd8GOZV/RYDieiURPX5GVSFds3FlJgNbUsAe99dV
 6Wdn6pYq/YKGIBOedc32LiSdljzWYGpire7ByfuM1D6RxM5TC+gkWr2v23nM8TGwiN1E/v
 Y5jCx2PH1JC9O6IyT28BDIJQwlu06ow=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-lgpy_HI1Pcq4NdqtrJLK8g-1; Tue, 04 Oct 2022 05:32:09 -0400
X-MC-Unique: lgpy_HI1Pcq4NdqtrJLK8g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 79E4629ABA3F;
 Tue,  4 Oct 2022 09:32:09 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7EF34492B04;
 Tue,  4 Oct 2022 09:32:08 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 1/4] linux-user: add more compat ioctl definitions
Date: Tue,  4 Oct 2022 10:32:03 +0100
Message-Id: <20221004093206.652431-2-berrange@redhat.com>
In-Reply-To: <20221004093206.652431-1-berrange@redhat.com>
References: <20221004093206.652431-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GLibc changes prevent us from including linux/fs.h anymore,
and we previously adjusted to this in

  commit 3cd3df2a9584e6f753bb62a0028bd67124ab5532
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Tue Aug 2 12:41:34 2022 -0400

    linux-user: fix compat with glibc >= 2.36 sys/mount.h

That change required adding compat ioctl definitions on the
QEMU side for any ioctls that we would otherwise obtain
from linux/fs.h.  This commit adds more that were initially
missed, due to their usage being conditionalized in QEMU.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 linux-user/syscall.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 2e954d8dbd..f6a15df69d 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -111,6 +111,31 @@
 #define FS_IOC32_SETFLAGS              _IOW('f', 2, int)
 #define FS_IOC32_GETVERSION            _IOR('v', 1, int)
 #define FS_IOC32_SETVERSION            _IOW('v', 2, int)
+
+#define BLKGETSIZE64 _IOR(0x12,114,size_t)
+#define BLKDISCARD _IO(0x12,119)
+#define BLKIOMIN _IO(0x12,120)
+#define BLKIOOPT _IO(0x12,121)
+#define BLKALIGNOFF _IO(0x12,122)
+#define BLKPBSZGET _IO(0x12,123)
+#define BLKDISCARDZEROES _IO(0x12,124)
+#define BLKSECDISCARD _IO(0x12,125)
+#define BLKROTATIONAL _IO(0x12,126)
+#define BLKZEROOUT _IO(0x12,127)
+
+#define FIBMAP     _IO(0x00,1)
+#define FIGETBSZ   _IO(0x00,2)
+
+struct file_clone_range {
+        __s64 src_fd;
+        __u64 src_offset;
+        __u64 src_length;
+        __u64 dest_offset;
+};
+
+#define FICLONE         _IOW(0x94, 9, int)
+#define FICLONERANGE    _IOW(0x94, 13, struct file_clone_range)
+
 #else
 #include <linux/fs.h>
 #endif
-- 
2.37.3


