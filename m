Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7427B211049
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jul 2020 18:10:00 +0200 (CEST)
Received: from localhost ([::1]:55100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqfJ9-0002VC-F5
	for lists+qemu-devel@lfdr.de; Wed, 01 Jul 2020 12:09:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jqfEd-00038U-Nk
 for qemu-devel@nongnu.org; Wed, 01 Jul 2020 12:05:19 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:55498
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jqfEb-00056P-Th
 for qemu-devel@nongnu.org; Wed, 01 Jul 2020 12:05:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593619517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EBRZ4ykElK7nIEuV/uDE8NVjBVx9zR5aZxGytpuZlNo=;
 b=T+/RLLEhUCdyygnpdZmylU882C8O4naAb2kYYi0N6rYkK2Fzz5INofiORStXqN47Tvbmlj
 dgSxDbP6Zpoxtr+IxEU7FJ+celUk0LTN9A6B+C8GQUpI4u22zNmYvFuLYpQRtWaCsqK+Ua
 h4f75pRHiwYawCp9hhZ8U2suSkGeSBU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-4FF2aosnPKKgN38fG926qA-1; Wed, 01 Jul 2020 12:05:15 -0400
X-MC-Unique: 4FF2aosnPKKgN38fG926qA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D32F12E523;
 Wed,  1 Jul 2020 16:05:14 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.36.110.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DF4492B4CE;
 Wed,  1 Jul 2020 16:05:12 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] util: validate whether O_DIRECT is supported after failure
Date: Wed,  1 Jul 2020 17:05:07 +0100
Message-Id: <20200701160509.1523847-2-berrange@redhat.com>
In-Reply-To: <20200701160509.1523847-1-berrange@redhat.com>
References: <20200701160509.1523847-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/01 00:56:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, P J P <ppandit@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently we suggest that a filesystem may not support O_DIRECT after
seeing an EINVAL. Other things can cause EINVAL though, so it is better
to do an explicit check, and then report a definitive error message.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 util/osdep.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/util/osdep.c b/util/osdep.c
index 4829c07ff6..4bdbe81cec 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -342,8 +342,17 @@ int qemu_open(const char *name, int flags, ...)
 
 #ifdef O_DIRECT
     if (ret == -1 && errno == EINVAL && (flags & O_DIRECT)) {
-        error_report("file system may not support O_DIRECT");
-        errno = EINVAL; /* in case it was clobbered */
+        int newflags = flags & ~O_DIRECT;
+# ifdef O_CLOEXEC
+        ret = open(name, newflags | O_CLOEXEC, mode);
+# else
+        ret = open(name, newflags, mode);
+# endif
+        if (ret != -1) {
+            close(ret);
+            error_report("file system does not support O_DIRECT");
+            errno = EINVAL;
+        }
     }
 #endif /* O_DIRECT */
 
-- 
2.26.2


