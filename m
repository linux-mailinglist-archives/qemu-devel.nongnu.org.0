Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2962524DDD1
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Aug 2020 19:25:01 +0200 (CEST)
Received: from localhost ([::1]:60902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k9Ami-0005gL-6r
	for lists+qemu-devel@lfdr.de; Fri, 21 Aug 2020 13:25:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1k9AjI-0000oA-3J
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 13:21:28 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:52494
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1k9AjG-0008QR-F8
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 13:21:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598030485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/QuZfkY3yvVKyRzZi+LIvn6MXCpAkfpRrgdaJOhA/vE=;
 b=BgvGLgtb/febPY+2YUeOXA/IN6vxpHQAeju/cmDWLgkYtsciHsDlSHdcB8cNqpOp9Pysec
 zrt3byj8o2nof6O5De/+nAOLLZ4JI6jf4US1ahIuF41TlIOGAwG0lmv2dpxUyG99czIoDn
 nFrq+Xe/ytuE0UPrRgFFO3XA1RpTM4A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-j13wBqvsMrWuk0WCPZ2G-w-1; Fri, 21 Aug 2020 13:21:22 -0400
X-MC-Unique: j13wBqvsMrWuk0WCPZ2G-w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8036C1074655;
 Fri, 21 Aug 2020 17:21:21 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.36.110.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8371560CD0;
 Fri, 21 Aug 2020 17:21:19 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 5/6] util: give a specific error message when O_DIRECT
 doesn't work
Date: Fri, 21 Aug 2020 18:21:04 +0100
Message-Id: <20200821172105.608752-6-berrange@redhat.com>
In-Reply-To: <20200821172105.608752-1-berrange@redhat.com>
References: <20200821172105.608752-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/21 05:15:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A common error scenario is to tell QEMU to use O_DIRECT in combination
with a filesystem that doesn't support it. To aid users to diagnosing
their mistake we want to provide a clear error message when this happens.

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 util/osdep.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/util/osdep.c b/util/osdep.c
index a4956fbf6b..6c24985f7a 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -345,6 +345,19 @@ qemu_open_internal(const char *name, int flags, mode_t mode, Error **errp)
 
     if (ret == -1) {
         const char *action = flags & O_CREAT ? "create" : "open";
+#ifdef O_DIRECT
+        if (errno == EINVAL && (flags & O_DIRECT)) {
+            ret = open(name, flags & ~O_DIRECT, mode);
+            if (ret != -1) {
+                close(ret);
+                error_setg(errp, "Could not %s '%s' flags 0x%x: "
+                           "filesystem does not support O_DIRECT",
+                           action, name, flags);
+                errno = EINVAL; /* close() clobbered earlier errno */
+                return -1;
+            }
+        }
+#endif /* O_DIRECT */
         error_setg_errno(errp, errno, "Could not %s '%s' flags 0x%x",
                          action, name, flags);
     }
-- 
2.26.2


