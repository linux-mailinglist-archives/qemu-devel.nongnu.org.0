Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B3948785F
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 14:42:08 +0100 (CET)
Received: from localhost ([::1]:37378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5pVP-0000lk-DI
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 08:42:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n5pST-0007Qo-AY
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 08:39:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n5pSQ-0003ma-TI
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 08:39:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641562741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=totBQYvoHc08z47dM7svER7xPZjbFH67rj55UiVMlN4=;
 b=LVGKnVr62KdXNx808zFm0yr/xca50n6OJYT0v74nJx8z9BVS7Hp29k2aWQ9O0h9WnsnwNP
 laFpIEGGYpTwUC3pf2wUT6VIauhXO01mxkGRANuW0drefWhTDGeYE8b6EFOtWL7dZhR5d+
 MR80LAqCKfnQRSOLchtV+vpv8HNJKYQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-577-lxGmi70WOUmmxkL0JRHmhQ-1; Fri, 07 Jan 2022 08:38:51 -0500
X-MC-Unique: lxGmi70WOUmmxkL0JRHmhQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3150C10168F7;
 Fri,  7 Jan 2022 13:38:50 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C824B78A9C;
 Fri,  7 Jan 2022 13:38:47 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH] softmmu/device_tree: Silence compiler warning with
 --enable-sanitizers
Date: Fri,  7 Jan 2022 14:38:44 +0100
Message-Id: <20220107133844.145039-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
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
Cc: Yanan Wang <wangyanan55@huawei.com>, qemu-trivial@nongnu.org,
 Andrew Jones <drjones@redhat.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If I configure my build with --enable-sanitizers, my GCC (v8.5.0)
complains:

.../softmmu/device_tree.c: In function ‘qemu_fdt_add_path’:
.../softmmu/device_tree.c:560:18: error: ‘retval’ may be used uninitialized
 in this function [-Werror=maybe-uninitialized]
     int namelen, retval;
                  ^~~~~~

It's a false warning since the while loop is always executed at least
once (p has to be non-NULL, otherwise the derefence in the if-statement
earlier will crash). Thus let's switch to a do-while loop here instead
to make the compiler happy in all cases.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 softmmu/device_tree.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
index 3965c834ca..9e96f5ecd5 100644
--- a/softmmu/device_tree.c
+++ b/softmmu/device_tree.c
@@ -564,7 +564,7 @@ int qemu_fdt_add_path(void *fdt, const char *path)
         return -1;
     }
 
-    while (p) {
+    do {
         name = p + 1;
         p = strchr(name, '/');
         namelen = p != NULL ? p - name : strlen(name);
@@ -584,7 +584,7 @@ int qemu_fdt_add_path(void *fdt, const char *path)
         }
 
         parent = retval;
-    }
+    } while (p);
 
     return retval;
 }
-- 
2.27.0


