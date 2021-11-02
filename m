Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9864432A4
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 17:22:42 +0100 (CET)
Received: from localhost ([::1]:39208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhwYc-0002am-3v
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 12:22:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mhwIX-0007da-9H
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:06:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mhwIT-0004JH-1T
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:06:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635869160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iXVp068Ouu4UfsP1gMxM4FDJpS9mhZDmj1LYgFnn+Uc=;
 b=UJ7SVrXVFY32bXWaPl/zuvfnlVN+vqcHZoaaBs4K66vzpt4Bd928QPKtmpQnM/oegd8UJ+
 On30vG8XNLpQdDaTFer+THbbsTDkT3ZZe3ngOYBYbj8z/h2rV9Z2q2DWfPekR6B3wuRfio
 8TL7bzPOoYg7QRm0xsCCHPMY89LEKlE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-ELfnH_vIOWiN50FJS2qEvQ-1; Tue, 02 Nov 2021 12:05:53 -0400
X-MC-Unique: ELfnH_vIOWiN50FJS2qEvQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4D7419200C0;
 Tue,  2 Nov 2021 16:05:51 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A9F69ADCD;
 Tue,  2 Nov 2021 16:05:50 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 05/12] block/export/fuse.c: fix musl build
Date: Tue,  2 Nov 2021 17:05:21 +0100
Message-Id: <20211102160528.206766-6-kwolf@redhat.com>
In-Reply-To: <20211102160528.206766-1-kwolf@redhat.com>
References: <20211102160528.206766-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Include linux/falloc.h if CONFIG_FALLOCATE_ZERO_RANGE is defined to fix
https://gitlab.com/qemu-project/qemu/-/commit/50482fda98bd62e072c30b7ea73c985c4e9d9bbb
and avoid the following build failure on musl:

../block/export/fuse.c: In function 'fuse_fallocate':
../block/export/fuse.c:643:21: error: 'FALLOC_FL_ZERO_RANGE' undeclared (first use in this function)
  643 |     else if (mode & FALLOC_FL_ZERO_RANGE) {
      |                     ^~~~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/be24433a429fda681fb66698160132c1c99bc53b

Fixes: 50482fda98b ("block/export/fuse.c: fix musl build")
Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-Id: <20211022095209.1319671-1-fontaine.fabrice@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/export/fuse.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/block/export/fuse.c b/block/export/fuse.c
index 2e3bf8270b..823c126d23 100644
--- a/block/export/fuse.c
+++ b/block/export/fuse.c
@@ -31,6 +31,10 @@
 #include <fuse.h>
 #include <fuse_lowlevel.h>
 
+#if defined(CONFIG_FALLOCATE_ZERO_RANGE)
+#include <linux/falloc.h>
+#endif
+
 #ifdef __linux__
 #include <linux/fs.h>
 #endif
-- 
2.31.1


