Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0DD2079A4
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 18:55:46 +0200 (CEST)
Received: from localhost ([::1]:56460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jo8gb-0006Ds-3Q
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 12:55:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jo8VN-0003W1-IN
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 12:44:09 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:22882
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jo8VB-00056E-6R
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 12:44:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593017034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zH34zgMpegMl42K06K+C/gWszx2iMgiSY6U+axlkSV0=;
 b=I5oF3ZgLURMqDrrpCG5ZGlpMBCQR59oiiSnidaKt+dLgamN0MFINxL1C0RmaLUBnFs3T1c
 d5/ratpEQjktTcV/d4/Q7wDAnDftU4tsonTpX7dsN87OBs/fKH9dvrLCp5IqbICcIOtdaH
 r4i7eizAqH8lTxevwEQmKYquYdCYupo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-U9FnKZ_wP1GzXtALRcfqIA-1; Wed, 24 Jun 2020 12:43:53 -0400
X-MC-Unique: U9FnKZ_wP1GzXtALRcfqIA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 16D94804003;
 Wed, 24 Jun 2020 16:43:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D906F7CADB;
 Wed, 24 Jun 2020 16:43:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 62CE11138490; Wed, 24 Jun 2020 18:43:45 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 35/46] qom: Use return values to check for error where that's
 simpler
Date: Wed, 24 Jun 2020 18:43:33 +0200
Message-Id: <20200624164344.3778251-36-armbru@redhat.com>
In-Reply-To: <20200624164344.3778251-1-armbru@redhat.com>
References: <20200624164344.3778251-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 03:27:53
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
Cc: peter.maydell@linaro.org, vsementsov@virtuozzo.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When using the Error object to check for error, we need to receive it
into a local variable, then propagate() it to @errp.

Using the return value permits allows receiving it straight to @errp.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qom/object.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/qom/object.c b/qom/object.c
index f6e9f0e413..326a8de91e 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -549,8 +549,7 @@ void object_initialize_child_with_propsv(Object *parentobj,
     object_initialize(childobj, size, type);
     obj = OBJECT(childobj);
 
-    object_set_propv(obj, &local_err, vargs);
-    if (local_err) {
+    if (object_set_propv(obj, errp, vargs) < 0) {
         goto out;
     }
 
@@ -743,7 +742,7 @@ Object *object_new_with_propv(const char *typename,
     }
     obj = object_new_with_type(klass->type);
 
-    if (object_set_propv(obj, &local_err, vargs) < 0) {
+    if (object_set_propv(obj, errp, vargs) < 0) {
         goto error;
     }
 
@@ -1771,12 +1770,11 @@ static void object_set_link_property(Object *obj, Visitor *v,
     }
 
     if (strcmp(path, "") != 0) {
-        new_target = object_resolve_link(obj, name, path, &local_err);
+        new_target = object_resolve_link(obj, name, path, errp);
     }
 
     g_free(path);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    if (!new_target) {
         return;
     }
 
-- 
2.26.2


