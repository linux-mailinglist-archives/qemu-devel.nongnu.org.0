Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DFF2B7DDF
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 13:53:25 +0100 (CET)
Received: from localhost ([::1]:42642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfMxg-00018D-HJ
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 07:53:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kfMtp-0005zq-Bm
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 07:49:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kfMtn-0006Pc-Jo
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 07:49:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605703762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QgGQttnHeh+zDfd8ZBUlXW36Kmz2AWJVHsTXkjoZkoc=;
 b=hKCzXgXCNNsRVk7nxnWAyCUIRn2SueHnSTBFG4bV+xXV4GVyoUdx8mbSdsn15uEtUMFsjO
 tCvGZiW0BYJjjXs8KWQnqPfDSgnLBdTClBHcUTtV2daiBcnH1sDCVZqUQdTT8mzOMJJxFa
 CxYANBl2NZmuETPAX55j5bOW6OTBXNg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-7Vo8GhYKOOiLLWu8FAJnJg-1; Wed, 18 Nov 2020 07:49:21 -0500
X-MC-Unique: 7Vo8GhYKOOiLLWu8FAJnJg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 31B9F6D249
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 12:49:20 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-41.ams2.redhat.com
 [10.36.115.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 25B645D9CA;
 Wed, 18 Nov 2020 12:49:18 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/4] authz-pam: Check that 'service' property is set
Date: Wed, 18 Nov 2020 12:49:10 +0000
Message-Id: <20201118124911.282735-4-berrange@redhat.com>
In-Reply-To: <20201118124911.282735-1-berrange@redhat.com>
References: <20201118124911.282735-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 00:38:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kevin Wolf <kwolf@redhat.com>

If the 'service' property is not set, we'll call pam_start() with a NULL
pointer for the service name. This fails and leaves a message like this
in the syslog:

qemu-storage-daemon[294015]: PAM pam_start: invalid argument: service == NULL

Make specifying the property mandatory and catch the error already
during the creation of the object.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 authz/pamacct.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/authz/pamacct.c b/authz/pamacct.c
index e67195f7be..c862d9ff39 100644
--- a/authz/pamacct.c
+++ b/authz/pamacct.c
@@ -84,6 +84,12 @@ qauthz_pam_prop_get_service(Object *obj,
 static void
 qauthz_pam_complete(UserCreatable *uc, Error **errp)
 {
+    QAuthZPAM *pauthz = QAUTHZ_PAM(uc);
+
+    if (!pauthz->service) {
+        error_setg(errp, "The 'service' property must be set");
+        return;
+    }
 }
 
 
-- 
2.28.0


