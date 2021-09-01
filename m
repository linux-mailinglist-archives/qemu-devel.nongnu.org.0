Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3EEA3FDFD7
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 18:26:39 +0200 (CEST)
Received: from localhost ([::1]:52882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLT4Q-00053r-RV
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 12:26:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLS0R-0007ap-Aa
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:18:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLS0P-0004gW-IZ
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:18:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630509504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tspisZhwzbcfzPPQAd6r/tRYq6tD7ae8dAkawdhz9Qs=;
 b=dDjsT8s8BZiIqtjRgK6XlS390C52gBaYC7EwmsT8nMfsLqKRGfjMcG9Ddk2plEYj+A2DBD
 QVYhvT3w7n3DCwfK3AosoWnVywpHGEmfzTFGB5lKeBl5mu8KiWsbZf4FYzaEKUzn9FtjXT
 /5kybb/aPBtFhpFHKUN/mwCl15epv/c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-fDkZJgGlNxW2RIPmvbKrNg-1; Wed, 01 Sep 2021 11:18:21 -0400
X-MC-Unique: fDkZJgGlNxW2RIPmvbKrNg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 06D1F87D545;
 Wed,  1 Sep 2021 15:18:20 +0000 (UTC)
Received: from localhost (unknown [10.39.193.250])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DB485C25A;
 Wed,  1 Sep 2021 15:18:19 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 55/56] block/export/fuse.c: fix fuse-lseek on uclibc or musl
Date: Wed,  1 Sep 2021 17:16:18 +0200
Message-Id: <20210901151619.689075-56-hreitz@redhat.com>
In-Reply-To: <20210901151619.689075-1-hreitz@redhat.com>
References: <20210901151619.689075-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.392, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Include linux/fs.h to avoid the following build failure on uclibc or
musl raised since version 6.0.0:

../block/export/fuse.c: In function 'fuse_lseek':
../block/export/fuse.c:641:19: error: 'SEEK_HOLE' undeclared (first use in this function)
  641 |     if (whence != SEEK_HOLE && whence != SEEK_DATA) {
      |                   ^~~~~~~~~
../block/export/fuse.c:641:19: note: each undeclared identifier is reported only once for each function it appears in
../block/export/fuse.c:641:42: error: 'SEEK_DATA' undeclared (first use in this function); did you mean 'SEEK_SET'?
  641 |     if (whence != SEEK_HOLE && whence != SEEK_DATA) {
      |                                          ^~~~~~~~~
      |                                          SEEK_SET

Fixes:
 - http://autobuild.buildroot.org/results/33c90ebf04997f4d3557cfa66abc9cf9a3076137

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-Id: <20210827220301.272887-1-fontaine.fabrice@gmail.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block/export/fuse.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/block/export/fuse.c b/block/export/fuse.c
index fc7b07d2b5..2e3bf8270b 100644
--- a/block/export/fuse.c
+++ b/block/export/fuse.c
@@ -31,6 +31,9 @@
 #include <fuse.h>
 #include <fuse_lowlevel.h>
 
+#ifdef __linux__
+#include <linux/fs.h>
+#endif
 
 /* Prevent overly long bounce buffer allocations */
 #define FUSE_MAX_BOUNCE_BYTES (MIN(BDRV_REQUEST_MAX_BYTES, 64 * 1024 * 1024))
-- 
2.31.1


