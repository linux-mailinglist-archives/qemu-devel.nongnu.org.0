Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C792B0CEC
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 19:46:21 +0100 (CET)
Received: from localhost ([::1]:35498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdHbw-0003nn-Lf
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 13:46:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kdHUq-0003C7-On
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 13:39:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kdHUo-0006bi-VL
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 13:39:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605206338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=44aOo1Hs4295NOX01ACaymULxAgiOQSYTEKlmJit1as=;
 b=cP6UMimYtsukC4b2bgsZ0/ObS6TSjBuJ/2s9iFmO3W8ig5+gMrNJXahcbP4cDw70S4rJ1m
 NCnHahE94wt+pYNk7NPNL5+uV7hQndGJ6sxHpTq8qcJOO8jurhtw8A5hbM+UtBX+Hr39Ea
 SG7vGG6SF5OChflTF4OBObmdIHO5vpM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-o8sxG84sOr6sX95ed8v7WA-1; Thu, 12 Nov 2020 13:38:54 -0500
X-MC-Unique: o8sxG84sOr6sX95ed8v7WA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EEA4E101F00C;
 Thu, 12 Nov 2020 18:38:52 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-60.ams2.redhat.com
 [10.36.115.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F037C5D9E4;
 Thu, 12 Nov 2020 18:38:50 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, kuhn.chenqun@huawei.com, zhengchuan@huawei.com,
 lihaotian9@huawei.com, longpeng2@huawei.com, liangpeng10@huawei.com,
 philmd@redhat.com, liuzhiqiang26@huawei.com
Subject: [PULL 11/11] virtiofsd: check whether strdup lo.source return NULL in
 main func
Date: Thu, 12 Nov 2020 18:37:58 +0000
Message-Id: <20201112183758.203176-12-dgilbert@redhat.com>
In-Reply-To: <20201112183758.203176-1-dgilbert@redhat.com>
References: <20201112183758.203176-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 00:52:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: stefanha@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Haotian Li <lihaotian9@huawei.com>

In main func, strdup lo.source may fail. So check whether strdup
lo.source return NULL before using it.

Signed-off-by: Haotian Li <lihaotian9@huawei.com>
Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Message-Id: <f1e48ca8-d6de-d901-63c8-4f4024bda518@huawei.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 9545a0d174..97485b22b4 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -3517,6 +3517,10 @@ int main(int argc, char *argv[])
         }
     } else {
         lo.source = strdup("/");
+        if (!lo.source) {
+            fuse_log(FUSE_LOG_ERR, "failed to strdup source\n");
+            goto err_out1;
+        }
     }
 
     if (lo.xattrmap) {
-- 
2.28.0


