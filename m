Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8806FB7E7
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 22:05:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw75l-0006Gs-MU; Mon, 08 May 2023 16:04:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pw75O-0006EX-Sw
 for qemu-devel@nongnu.org; Mon, 08 May 2023 16:03:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pw75N-0007Jb-2t
 for qemu-devel@nongnu.org; Mon, 08 May 2023 16:03:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683576231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=whyBs5mAysxv+XUkFP6xBPNl40iBrpCDWkGw73gqdQM=;
 b=IsEsEMDzK16zmn1NXR2ut2yFoRi5NSKyXzqcbiH3GZ5rHMVlfuKtNVkVVRalnuuEhAmuHS
 YSzsJeWpGTuJ9pBVHiWd6S7dIsVFA8mgfcVr0VgLyVGJ1YgNoJeLr+KSctgxH9/MEsur8y
 jADyajiB7XT5gEp+iLiZqPOuaKSLDXI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-3cZGzyyFPEmBmCyftquVQQ-1; Mon, 08 May 2023 16:03:49 -0400
X-MC-Unique: 3cZGzyyFPEmBmCyftquVQQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 32FE11C0519E;
 Mon,  8 May 2023 20:03:49 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 680161121314;
 Mon,  8 May 2023 20:03:48 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: hreitz@redhat.com, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH 07/11] numa: Check for qemu_strtosz_MiB error
Date: Mon,  8 May 2023 15:03:39 -0500
Message-Id: <20230508200343.791450-8-eblake@redhat.com>
In-Reply-To: <20230508200343.791450-1-eblake@redhat.com>
References: <20230508200343.791450-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

As shown in the previous commit, qemu_strtosz_MiB sometimes leaves the
result value untoutched (we have to audit further to learn that in
that case, the QAPI generator says that visit_type_NumaOptions() will
have zero-initialized it), and sometimes leaves it with the value of a
partial parse before -EINVAL occurs because of trailing garbage.
Rather than blindly treating any string the user may throw at us as
valid, we should check for parse failures.

Fiuxes: cc001888 ("numa: fixup parsed NumaNodeOptions earlier", v2.11.0)
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 hw/core/numa.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/hw/core/numa.c b/hw/core/numa.c
index d8d36b16d80..f08956ddb0f 100644
--- a/hw/core/numa.c
+++ b/hw/core/numa.c
@@ -531,10 +531,17 @@ static int parse_numa(void *opaque, QemuOpts *opts, Error **errp)
     /* Fix up legacy suffix-less format */
     if ((object->type == NUMA_OPTIONS_TYPE_NODE) && object->u.node.has_mem) {
         const char *mem_str = qemu_opt_get(opts, "mem");
-        qemu_strtosz_MiB(mem_str, NULL, &object->u.node.mem);
+        int ret = qemu_strtosz_MiB(mem_str, NULL, &object->u.node.mem);
+
+        if (ret < 0) {
+            error_setg_errno(&err, -ret, "could not parse memory size '%s'",
+                             mem_str);
+        }
     }

-    set_numa_options(ms, object, &err);
+    if (!err) {
+        set_numa_options(ms, object, &err);
+    }

     qapi_free_NumaOptions(object);
     if (err) {
-- 
2.40.1


