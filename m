Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1103D297730
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Oct 2020 20:44:38 +0200 (CEST)
Received: from localhost ([::1]:40812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kW23E-0001O1-5Z
	for lists+qemu-devel@lfdr.de; Fri, 23 Oct 2020 14:44:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kW1wQ-0001F6-9l
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 14:37:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kW1wO-0001ZX-PI
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 14:37:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603478248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0ZWHO8lnYqjXhmLQR3u+URDIFyA7joePLezAj3PXrWE=;
 b=Zi96peHRy/6ywmM40/e8GsY6JTWRIWiYMHXaTfSlpSQcCAkD0WvQNZcR1Huzkx8PDWD6xo
 MUDq7BOA3EhpJ3RRARVrGU7ZhKZV9qWO8dk90u0QvIZ/af4vr27/K3slrGyTAVT4wLnnjD
 eUOkSIIWXoRYp+WCAqZ/mkCeW4U8M5Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-EC4HqDwFMamP-FGkhyCPMA-1; Fri, 23 Oct 2020 14:37:24 -0400
X-MC-Unique: EC4HqDwFMamP-FGkhyCPMA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2EC1310866A8;
 Fri, 23 Oct 2020 18:37:23 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-7.phx2.redhat.com [10.3.113.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A63FA60BFA;
 Fri, 23 Oct 2020 18:37:22 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 08/12] nbd: Refactor counting of metadata contexts
Date: Fri, 23 Oct 2020 13:36:48 -0500
Message-Id: <20201023183652.478921-9-eblake@redhat.com>
In-Reply-To: <20201023183652.478921-1-eblake@redhat.com>
References: <20201023183652.478921-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/23 01:44:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, stefanha@redhat.com,
 qemu-block@nongnu.org, rjones@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rather than open-code the count of negotiated contexts at several
sites, embed it directly into the struct.

Signed-off-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 nbd/server.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/nbd/server.c b/nbd/server.c
index 05a8154975a1..27d943529409 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -106,8 +106,7 @@ static QTAILQ_HEAD(, NBDExport) exports = QTAILQ_HEAD_INITIALIZER(exports);
  * NBD_OPT_LIST_META_CONTEXT. */
 typedef struct NBDExportMetaContexts {
     NBDExport *exp;
-    bool valid; /* means that negotiation of the option finished without
-                   errors */
+    size_t count; /* number of negotiated contexts */
     bool base_allocation; /* export base:allocation context (block status) */
     bool allocation_depth; /* export qemu:allocation-depth */
     bool bitmap; /* export qemu:dirty-bitmap:<export bitmap name> */
@@ -448,7 +447,9 @@ static int nbd_negotiate_handle_list(NBDClient *client, Error **errp)

 static void nbd_check_meta_export(NBDClient *client)
 {
-    client->export_meta.valid &= client->exp == client->export_meta.exp;
+    if (client->exp != client->export_meta.exp) {
+        client->export_meta.count = 0;
+    }
 }

 /* Send a reply to NBD_OPT_EXPORT_NAME.
@@ -956,6 +957,7 @@ static int nbd_negotiate_meta_queries(NBDClient *client,
     NBDExportMetaContexts local_meta;
     uint32_t nb_queries;
     int i;
+    size_t count = 0;

     if (!client->structured_reply) {
         return nbd_opt_invalid(client, errp,
@@ -1013,6 +1015,7 @@ static int nbd_negotiate_meta_queries(NBDClient *client,
         if (ret < 0) {
             return ret;
         }
+        count++;
     }

     if (meta->allocation_depth) {
@@ -1022,6 +1025,7 @@ static int nbd_negotiate_meta_queries(NBDClient *client,
         if (ret < 0) {
             return ret;
         }
+        count++;
     }

     if (meta->bitmap) {
@@ -1035,11 +1039,12 @@ static int nbd_negotiate_meta_queries(NBDClient *client,
         if (ret < 0) {
             return ret;
         }
+        count++;
     }

     ret = nbd_negotiate_send_rep(client, NBD_REP_ACK, errp);
     if (ret == 0) {
-        meta->valid = true;
+        meta->count = count;
     }

     return ret;
@@ -2400,15 +2405,9 @@ static coroutine_fn int nbd_handle_request(NBDClient *client,
             return nbd_send_generic_reply(client, request->handle, -EINVAL,
                                           "need non-zero length", errp);
         }
-        if (client->export_meta.valid &&
-            (client->export_meta.base_allocation ||
-             client->export_meta.allocation_depth ||
-             client->export_meta.bitmap))
-        {
+        if (client->export_meta.count) {
             bool dont_fragment = request->flags & NBD_CMD_FLAG_REQ_ONE;
-            int contexts_remaining = client->export_meta.base_allocation +
-                client->export_meta.allocation_depth +
-                client->export_meta.bitmap;
+            int contexts_remaining = client->export_meta.count;

             if (client->export_meta.base_allocation) {
                 ret = nbd_co_send_block_status(client, request->handle,
-- 
2.29.0


