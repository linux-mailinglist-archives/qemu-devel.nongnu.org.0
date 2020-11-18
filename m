Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE882B7DD7
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 13:51:09 +0100 (CET)
Received: from localhost ([::1]:37178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfMvU-0007DO-HD
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 07:51:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kfMtm-0005u9-Hc
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 07:49:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kfMtk-0006PE-QQ
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 07:49:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605703759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tfOO1kwUE2+NuqnaiEKk53P06+P0811o9aM9Ih4Rchc=;
 b=I6d0tOW7OMoNnG4szoNrN1pLEfc2kA75RVSIbJ5dsaMr2WmCilh6SnVxCMl3ohZbXWtb8W
 iKGRqTP3Vm1CpgzSD5NrjnyVTb1dxwEmVa82IEFpp87j+RtpWFFsYtlMuViwxwGqUXtZA4
 xsJMNfdZAXreGUx5PSvk/w0wXW76WuU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-0IXs15ZJNQGa7R9rp9wYpQ-1; Wed, 18 Nov 2020 07:49:18 -0500
X-MC-Unique: 0IXs15ZJNQGa7R9rp9wYpQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6AB5D1009459
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 12:49:17 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-41.ams2.redhat.com
 [10.36.115.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E4B015D9CA;
 Wed, 18 Nov 2020 12:49:13 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/4] authz-list-file: Fix file read error handling
Date: Wed, 18 Nov 2020 12:49:08 +0000
Message-Id: <20201118124911.282735-2-berrange@redhat.com>
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Markus Armbruster <armbru@redhat.com>

The Error ** argument must be NULL, &error_abort, &error_fatal, or a
pointer to a variable containing NULL.  Passing an argument of the
latter kind twice without clearing it in between is wrong: if the
first call sets an error, it no longer points to NULL for the second
call.

qauthz_list_file_complete() is wrong that way: it passes @errp to
qauthz_list_file_complete() without checking for failure.  If it runs
into another failure, it trips error_setv()'s assertion.  Reproducer:

    $ qemu-system-x86_64 -nodefaults -S -display none -object authz-list-file,id=authz0,filename=
    qemu-system-x86_64: ../util/error.c:59: error_setv: Assertion `*errp == NULL' failed.
    Aborted (core dumped)

Fix it to check for failure.

Fixes: 55d869846de802a16af1a50584c51737bd664387
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 authz/listfile.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/authz/listfile.c b/authz/listfile.c
index 24feac35ab..1421e674a4 100644
--- a/authz/listfile.c
+++ b/authz/listfile.c
@@ -128,6 +128,9 @@ qauthz_list_file_complete(UserCreatable *uc, Error **errp)
     }
 
     fauthz->list = qauthz_list_file_load(fauthz, errp);
+    if (!fauthz->list) {
+        return;
+    }
 
     if (!fauthz->refresh) {
         return;
-- 
2.28.0


