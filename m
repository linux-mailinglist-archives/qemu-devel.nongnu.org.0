Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D617A6361CC
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 15:30:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxqkP-0005wl-Nc; Wed, 23 Nov 2022 09:29:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oxqkM-0005un-Es
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 09:29:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oxqkE-0007rp-Me
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 09:29:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669213733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3fwo2+7/sIak6WUZZIyi/ZLxQbM4Y0xpeLeo41+sARA=;
 b=he/eiumWdkgpdqIbq7zBAIEEHOYHgfz2N28wWbCNwInQRXVjW7Ox0ZbemDMvW6fSfNVcJr
 DHVX36TIOpYIPTnRM8iFu6QJiTskTEmO8Sj1OrrAQZCRWUO1HVMcPdenv48vTpb2BiKVWY
 hOtwIj6aBxgroaJdRW7mUPbMXIy9qJ4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-314-D2mfpdfUM7mo1rc6U7tsxA-1; Wed, 23 Nov 2022 09:28:52 -0500
X-MC-Unique: D2mfpdfUM7mo1rc6U7tsxA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 85B1138173D2
 for <qemu-devel@nongnu.org>; Wed, 23 Nov 2022 14:28:51 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DF65640C83BB;
 Wed, 23 Nov 2022 14:28:50 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PULL 3/3] tests/avocado: use new rootfs for orangepi test
Date: Wed, 23 Nov 2022 15:28:43 +0100
Message-Id: <20221123142843.346105-4-thuth@redhat.com>
In-Reply-To: <20221123142843.346105-1-thuth@redhat.com>
References: <20221123142843.346105-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

From: Alex Bennée <alex.bennee@linaro.org>

The old URL wasn't stable. I suspect the current URL will only be
stable for a few months so maybe we need another strategy for hosting
rootfs snapshots?

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20221118113309.1057790-1-alex.bennee@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/avocado/boot_linux_console.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index f3e6f44ae9..ec07c64291 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -793,8 +793,8 @@ def test_arm_orangepi_sd(self):
         dtb_path = '/usr/lib/linux-image-current-sunxi/sun8i-h3-orangepi-pc.dtb'
         dtb_path = self.extract_from_deb(deb_path, dtb_path)
         rootfs_url = ('http://storage.kernelci.org/images/rootfs/buildroot/'
-                      'kci-2019.02/armel/base/rootfs.ext2.xz')
-        rootfs_hash = '692510cb625efda31640d1de0a8d60e26040f061'
+                      'buildroot-baseline/20221116.0/armel/rootfs.ext2.xz')
+        rootfs_hash = 'fae32f337c7b87547b10f42599acf109da8b6d9a'
         rootfs_path_xz = self.fetch_asset(rootfs_url, asset_hash=rootfs_hash)
         rootfs_path = os.path.join(self.workdir, 'rootfs.cpio')
         archive.lzma_uncompress(rootfs_path_xz, rootfs_path)
-- 
2.31.1


