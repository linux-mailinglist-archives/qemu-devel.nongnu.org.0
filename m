Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 100946648F2
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 19:16:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFIkI-00087q-7d; Tue, 10 Jan 2023 12:49:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFIkG-00087N-QE
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 12:49:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFIkE-0003wa-OV
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 12:49:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673372946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/2nvrlOnT30x56ns1M+sXtBJjG6eOeN3cCwpQKmXG/8=;
 b=aGxwELQmt1Fr4QxLxgXRX4MrW7k2ITQ409njcNNVQ5ca1BCka3X77vD08Bs5zV5OyOq/UO
 nFI3cZINdSHWAb6diuJiuYFN8Q8p7ScLnS+stFysEkTS7cYZII2LkNEVJtqpjJz/VNSbNq
 tzvhYqH4d1HJs9zAGnRjc7TpcOX3z10=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-57-zbC3VmdTN1GJHIDUe5zrIg-1; Tue, 10 Jan 2023 12:49:02 -0500
X-MC-Unique: zbC3VmdTN1GJHIDUe5zrIg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 17ABF1C426A6;
 Tue, 10 Jan 2023 17:49:02 +0000 (UTC)
Received: from virtlab420.virt.lab.eng.bos.redhat.com
 (virtlab420.virt.lab.eng.bos.redhat.com [10.19.152.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D56F7492C14;
 Tue, 10 Jan 2023 17:49:01 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 1/2] Revert "linux-user: add more compat ioctl definitions"
Date: Tue, 10 Jan 2023 12:49:00 -0500
Message-Id: <20230110174901.2580297-2-berrange@redhat.com>
In-Reply-To: <20230110174901.2580297-1-berrange@redhat.com>
References: <20230110174901.2580297-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This reverts commit c5495f4ecb0cdaaf2e9dddeb48f1689cdb520ca0.

glibc has fixed (in 2.36.9000-40-g774058d729) the problem
that caused a clash when both sys/mount.h annd linux/mount.h
are included, and backported this to the 2.36 stable release
too:

  https://sourceware.org/glibc/wiki/Release/2.36#Usage_of_.3Clinux.2Fmount.h.3E_and_.3Csys.2Fmount.h.3E

It is saner for QEMU to remove the workaround it applied for
glibc 2.36 and expect distros to ship the 2.36 maint release
with the fix. This avoids needing to add a further workaround
to QEMU to deal with the fact that linux/brtfs.h now also pulls
in linux/mount.h via linux/fs.h since Linux 6.1

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 linux-user/syscall.c | 25 -------------------------
 1 file changed, 25 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 1f8c10f8ef..9c1e9555e1 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -111,31 +111,6 @@
 #define FS_IOC32_SETFLAGS              _IOW('f', 2, int)
 #define FS_IOC32_GETVERSION            _IOR('v', 1, int)
 #define FS_IOC32_SETVERSION            _IOW('v', 2, int)
-
-#define BLKGETSIZE64 _IOR(0x12,114,size_t)
-#define BLKDISCARD _IO(0x12,119)
-#define BLKIOMIN _IO(0x12,120)
-#define BLKIOOPT _IO(0x12,121)
-#define BLKALIGNOFF _IO(0x12,122)
-#define BLKPBSZGET _IO(0x12,123)
-#define BLKDISCARDZEROES _IO(0x12,124)
-#define BLKSECDISCARD _IO(0x12,125)
-#define BLKROTATIONAL _IO(0x12,126)
-#define BLKZEROOUT _IO(0x12,127)
-
-#define FIBMAP     _IO(0x00,1)
-#define FIGETBSZ   _IO(0x00,2)
-
-struct file_clone_range {
-        __s64 src_fd;
-        __u64 src_offset;
-        __u64 src_length;
-        __u64 dest_offset;
-};
-
-#define FICLONE         _IOW(0x94, 9, int)
-#define FICLONERANGE    _IOW(0x94, 13, struct file_clone_range)
-
 #else
 #include <linux/fs.h>
 #endif
-- 
2.38.1


