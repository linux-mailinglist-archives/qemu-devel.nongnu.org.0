Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2504331467
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 18:19:25 +0100 (CET)
Received: from localhost ([::1]:54108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJJXQ-0003rB-Qv
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 12:19:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lJJBm-0004el-GU
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:57:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lJJBf-00006r-Dw
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:56:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615222614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kKC+TrTt90R6cKk0TkKVIXqMP1xZ6HoVtnrCMm19AdA=;
 b=a37Xn5hw2wjfw7ZhXAoKr0jlMzjqVKBl8sneqo2Cl/gx8WzabXLAdtt+L2/AdG7B3vS36l
 9uw9ve3bvGqto9y8K7O8a43Axmty5jnUa0zCd9DeslcRUBAXgxZuJVQl9C6jB8+dXu0uce
 m9KcG1tRvSmgVQ2qc6UyYEkmhIGlStA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-LhACl_FgPLy7L9s_G2V4gg-1; Mon, 08 Mar 2021 11:56:51 -0500
X-MC-Unique: LhACl_FgPLy7L9s_G2V4gg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E8CC57;
 Mon,  8 Mar 2021 16:56:50 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-100.ams2.redhat.com [10.36.112.100])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E5DDE5D9DB;
 Mon,  8 Mar 2021 16:56:40 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 19/30] qom: Make "object" QemuOptsList optional
Date: Mon,  8 Mar 2021 17:54:29 +0100
Message-Id: <20210308165440.386489-20-kwolf@redhat.com>
In-Reply-To: <20210308165440.386489-1-kwolf@redhat.com>
References: <20210308165440.386489-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, jasowang@redhat.com, armbru@redhat.com,
 mreitz@redhat.com, kraxel@redhat.com, pbonzini@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This code is going away anyway, but for a few more commits, we'll be in
a state where some binaries still use QemuOpts and others don't. If the
"object" QemuOptsList doesn't even exist, we don't have to remove (or
fail to remove, and therefore abort) a user creatable object from it.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
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


