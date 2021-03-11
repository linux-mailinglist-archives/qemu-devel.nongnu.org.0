Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0844E3377C8
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 16:34:16 +0100 (CET)
Received: from localhost ([::1]:46934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKNKJ-0004Dx-1U
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 10:34:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lKMcn-0005m3-3i
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:49:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lKMca-0003Ee-7h
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:49:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615474142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e1ex1fs0AwXeZTzGur9cVlqC0FBJ1BS3hiT2D/ck2g0=;
 b=O38jmZQw1pVSLImX33hvZGYvmlSslEehkcFFJhgB4E+EpAvQXYQ9+u8WnSTWR5Uq5BeQDE
 XVXK+WhUSeR6Hsy/N5u6zUp35ivQD3GDZJ8UuFkiRf3QwDGV2iIPfmAzWGJ5Ec7Q38yUQb
 sduzbO/fLPC3eijyOnxLlt2Ry4whNzE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-iRR1-KVINOifePh_eeqUTw-1; Thu, 11 Mar 2021 09:49:01 -0500
X-MC-Unique: iRR1-KVINOifePh_eeqUTw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F02F5107ACCA;
 Thu, 11 Mar 2021 14:48:59 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-112.ams2.redhat.com [10.36.114.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D3DD65D9F2;
 Thu, 11 Mar 2021 14:48:58 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 29/38] qom: Make "object" QemuOptsList optional
Date: Thu, 11 Mar 2021 15:48:02 +0100
Message-Id: <20210311144811.313451-30-kwolf@redhat.com>
In-Reply-To: <20210311144811.313451-1-kwolf@redhat.com>
References: <20210311144811.313451-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This code is going away anyway, but for a few more commits, we'll be in
a state where some binaries still use QemuOpts and others don't. If the
"object" QemuOptsList doesn't even exist, we don't have to remove (or
fail to remove, and therefore abort) a user creatable object from it.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Acked-by: Peter Krempa <pkrempa@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 qom/object_interfaces.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/qom/object_interfaces.c b/qom/object_interfaces.c
index 7661270b98..d4df2334b7 100644
--- a/qom/object_interfaces.c
+++ b/qom/object_interfaces.c
@@ -299,6 +299,7 @@ void user_creatable_print_help_from_qdict(QDict *args)
 
 bool user_creatable_del(const char *id, Error **errp)
 {
+    QemuOptsList *opts_list;
     Object *container;
     Object *obj;
 
@@ -318,8 +319,10 @@ bool user_creatable_del(const char *id, Error **errp)
      * if object was defined on the command-line, remove its corresponding
      * option group entry
      */
-    qemu_opts_del(qemu_opts_find(qemu_find_opts_err("object", &error_abort),
-                                 id));
+    opts_list = qemu_find_opts_err("object", NULL);
+    if (opts_list) {
+        qemu_opts_del(qemu_opts_find(opts_list, id));
+    }
 
     object_unparent(obj);
     return true;
-- 
2.29.2


