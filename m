Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 676BE2B15D1
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 07:26:16 +0100 (CET)
Received: from localhost ([::1]:49386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdSXH-0008Rm-FF
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 01:26:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kdSVD-00073f-8j
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 01:24:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kdSVA-00059G-PI
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 01:24:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605248643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aTb81/Lh7q1vAUezGh9u1kyYiK34oKEX/gFX1rXJ2mY=;
 b=Lav+AMKFv/uPG9yzSy/5X+0KfiSkd5hgkA8IpwMK/+X7PwSqnc7tEMKeDc9wwPhfXvSEQz
 jjrUfltCJFBw3sXsuIvRzKxwo3JT5dE2ANIEebDgy3dqDv0M29uzXADOGIwR29xmPzqJQP
 9Hg30zy86VRUFNMJAKv7JSwxnfNItmk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-bD0dRGVXNKSfnVb46LzQOA-1; Fri, 13 Nov 2020 01:24:01 -0500
X-MC-Unique: bD0dRGVXNKSfnVb46LzQOA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 667CB80475F
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 06:24:00 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3545119C66;
 Fri, 13 Nov 2020 06:24:00 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A385411386A3; Fri, 13 Nov 2020 07:23:58 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] authz-list-file: Fix file read error handling
Date: Fri, 13 Nov 2020 07:23:57 +0100
Message-Id: <20201113062358.2563662-2-armbru@redhat.com>
In-Reply-To: <20201113062358.2563662-1-armbru@redhat.com>
References: <20201113062358.2563662-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 16:09:27
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
Cc: berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
2.26.2


