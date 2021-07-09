Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFD43C23D6
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 14:58:21 +0200 (CEST)
Received: from localhost ([::1]:33536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1q5E-0008RE-Ea
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 08:58:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m1pyR-0003Tf-UM
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 08:51:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m1pyO-0003Qd-F1
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 08:51:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625835075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vSzy661+2yNC34ynY1F3VDoKlcm3D97ZpmR91au8Izk=;
 b=OV99/MFhGcEI1Z7XDEu4n8r+jnoCBTrkjSVpfnqpYPLZHV9GQtDymTUBxaJHTL+libTg6Z
 yjWMkhjHECNxhk75r5sj7MqoPfvemMTHUKrmNHRF19U9z5kqWYS6gRznztKak8+5Xn1gpt
 VxW+UiRsC62FGLzSRoMjEB1+l+R/iq4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-H7GPe5akMlO9alRprpJMfA-1; Fri, 09 Jul 2021 08:51:14 -0400
X-MC-Unique: H7GPe5akMlO9alRprpJMfA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38B4E948;
 Fri,  9 Jul 2021 12:51:13 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-113-203.ams2.redhat.com [10.36.113.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F28DD60843;
 Fri,  9 Jul 2021 12:51:11 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 09/28] util/uri: do not check argument of uri_free()
Date: Fri,  9 Jul 2021 14:50:16 +0200
Message-Id: <20210709125035.191321-10-kwolf@redhat.com>
In-Reply-To: <20210709125035.191321-1-kwolf@redhat.com>
References: <20210709125035.191321-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Heinrich Schuchardt <xypron.glpk@gmx.de>

uri_free() checks if its argument is NULL in uri_clean() and g_free().
There is no need to check the argument before the call.

Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
Message-Id: <20210629063602.4239-1-xypron.glpk@gmx.de>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard W.M. Jones <rjones@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/nfs.c |  4 +---
 block/ssh.c |  4 +---
 util/uri.c  | 22 ++++++----------------
 3 files changed, 8 insertions(+), 22 deletions(-)

diff --git a/block/nfs.c b/block/nfs.c
index 7dff64f489..9aeaefb364 100644
--- a/block/nfs.c
+++ b/block/nfs.c
@@ -147,9 +147,7 @@ out:
     if (qp) {
         query_params_free(qp);
     }
-    if (uri) {
-        uri_free(uri);
-    }
+    uri_free(uri);
     return ret;
 }
 
diff --git a/block/ssh.c b/block/ssh.c
index d008caf059..e0fbb4934b 100644
--- a/block/ssh.c
+++ b/block/ssh.c
@@ -237,9 +237,7 @@ static int parse_uri(const char *filename, QDict *options, Error **errp)
     return 0;
 
  err:
-    if (uri) {
-      uri_free(uri);
-    }
+    uri_free(uri);
     return -EINVAL;
 }
 
diff --git a/util/uri.c b/util/uri.c
index 8bdef84120..ff72c6005f 100644
--- a/util/uri.c
+++ b/util/uri.c
@@ -1340,7 +1340,7 @@ static void uri_clean(URI *uri)
 
 /**
  * uri_free:
- * @uri:  pointer to an URI
+ * @uri:  pointer to an URI, NULL is ignored
  *
  * Free up the URI struct
  */
@@ -1939,15 +1939,9 @@ step_7:
     val = uri_to_string(res);
 
 done:
-    if (ref != NULL) {
-        uri_free(ref);
-    }
-    if (bas != NULL) {
-        uri_free(bas);
-    }
-    if (res != NULL) {
-        uri_free(res);
-    }
+    uri_free(ref);
+    uri_free(bas);
+    uri_free(res);
     return val;
 }
 
@@ -2190,12 +2184,8 @@ done:
     if (remove_path != 0) {
         ref->path = NULL;
     }
-    if (ref != NULL) {
-        uri_free(ref);
-    }
-    if (bas != NULL) {
-        uri_free(bas);
-    }
+    uri_free(ref);
+    uri_free(bas);
 
     return val;
 }
-- 
2.31.1


