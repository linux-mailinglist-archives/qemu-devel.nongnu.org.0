Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3F32B6A5C
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 17:34:51 +0100 (CET)
Received: from localhost ([::1]:41420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf3wP-0005RC-VV
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 11:34:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kf3sq-0001xV-Ol
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:31:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kf3sn-0007rO-6t
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:31:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605630663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ssuHWS7kPIV/WOHKWRJNLm9yNstMn2HqKqKoaX2sOmo=;
 b=Wc/LfXDuxFeaiRQby/9A0FDDJ7jZJEum3FyHu0xt41cUCa7sVJSCAg/VBViun47LAZiWqj
 xVqDuRyRaR+65LlI8skkm7H4ddyytezGJCQ5q9R2SiQjhndXmpSKA8+HIjYmBw10xiuvu4
 dVusYBnTgyJev1jsWACq3sDhjp2Xp4g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-0IKK3quRPF6B0bXKFzWR4w-1; Tue, 17 Nov 2020 11:31:01 -0500
X-MC-Unique: 0IKK3quRPF6B0bXKFzWR4w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F1B81017DC6
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 16:31:00 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-113.ams2.redhat.com [10.36.114.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C42F16BF6B;
 Tue, 17 Nov 2020 16:30:59 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-5.2? 2/2] authz-simple: Check that 'identity' property is
 set
Date: Tue, 17 Nov 2020 17:30:45 +0100
Message-Id: <20201117163045.307451-3-kwolf@redhat.com>
In-Reply-To: <20201117163045.307451-1-kwolf@redhat.com>
References: <20201117163045.307451-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 01:18:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If the 'identify' property is not set, we'll pass a NULL pointer to
g_str_equal() and crash. Catch the error condition during the creation
of the object.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 authz/simple.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/authz/simple.c b/authz/simple.c
index 18db0355f4..0597dcd8ea 100644
--- a/authz/simple.c
+++ b/authz/simple.c
@@ -65,11 +65,25 @@ qauthz_simple_finalize(Object *obj)
 }
 
 
+static void
+qauthz_simple_complete(UserCreatable *uc, Error **errp)
+{
+    QAuthZSimple *sauthz = QAUTHZ_SIMPLE(uc);
+
+    if (!sauthz->identity) {
+        error_setg(errp, "The 'identity' property must be set");
+        return;
+    }
+}
+
+
 static void
 qauthz_simple_class_init(ObjectClass *oc, void *data)
 {
     QAuthZClass *authz = QAUTHZ_CLASS(oc);
+    UserCreatableClass *ucc = USER_CREATABLE_CLASS(oc);
 
+    ucc->complete = qauthz_simple_complete;
     authz->is_allowed = qauthz_simple_is_allowed;
 
     object_class_property_add_str(oc, "identity",
-- 
2.28.0


