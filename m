Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3369D40FA3C
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 16:34:09 +0200 (CEST)
Received: from localhost ([::1]:56074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mREwJ-0006wt-Vu
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 10:34:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mREu3-00046F-S3
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 10:31:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mREty-0000E5-8s
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 10:31:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631889101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PBtCI98zkv8zGJLxW8NBq11F5IIFNtv9vfSfw3CW3g4=;
 b=gNCpGQK1rvRztfxCfe3h5ANBTo96Dws2pDu/n7hz/CTLQl2WQOXEUkEiHlL1GAY9uNZZQH
 KtHe8q0BS1GRPllFU+8rWMUhDnprHakWn4ST0DLCqmK5nPdDF/tWuyNZQYCkrkGCLKeaDP
 ISKCmkoMoJfmTiDQDDIVbVYgWvgaIS8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-zdQQ365ENvmDN64bnKi_AQ-1; Fri, 17 Sep 2021 10:31:40 -0400
X-MC-Unique: zdQQ365ENvmDN64bnKi_AQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D6948145EF;
 Fri, 17 Sep 2021 14:31:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F61560C25;
 Fri, 17 Sep 2021 14:31:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8A09611380B0; Fri, 17 Sep 2021 16:31:34 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/23] tests/qapi-schema: Wean off UserDefListUnion
Date: Fri, 17 Sep 2021 16:31:26 +0200
Message-Id: <20210917143134.412106-16-armbru@redhat.com>
In-Reply-To: <20210917143134.412106-1-armbru@redhat.com>
References: <20210917143134.412106-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: jsnow@redhat.com, michael.roth@amd.com, eblake@redhat.com,
 marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Command boxed-union uses simple union UserDefListUnion to cover
unions.  Use UserDefFlatUnion instead.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 tests/unit/test-qmp-cmds.c              | 2 +-
 tests/qapi-schema/qapi-schema-test.json | 2 +-
 tests/qapi-schema/qapi-schema-test.out  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/unit/test-qmp-cmds.c b/tests/unit/test-qmp-cmds.c
index 83efa39720..83c9ef5b7c 100644
--- a/tests/unit/test-qmp-cmds.c
+++ b/tests/unit/test-qmp-cmds.c
@@ -119,7 +119,7 @@ void qmp_boxed_struct(UserDefZero *arg, Error **errp)
 {
 }
 
-void qmp_boxed_union(UserDefListUnion *arg, Error **errp)
+void qmp_boxed_union(UserDefFlatUnion *arg, Error **errp)
 {
 }
 
diff --git a/tests/qapi-schema/qapi-schema-test.json b/tests/qapi-schema/qapi-schema-test.json
index b2d795cb19..a4b4405f94 100644
--- a/tests/qapi-schema/qapi-schema-test.json
+++ b/tests/qapi-schema/qapi-schema-test.json
@@ -175,7 +175,7 @@
   'returns': 'int' }
 { 'command': 'guest-sync', 'data': { 'arg': 'any' }, 'returns': 'any' }
 { 'command': 'boxed-struct', 'boxed': true, 'data': 'UserDefZero' }
-{ 'command': 'boxed-union', 'data': 'UserDefListUnion', 'boxed': true }
+{ 'command': 'boxed-union', 'data': 'UserDefFlatUnion', 'boxed': true }
 { 'command': 'boxed-empty', 'boxed': true, 'data': 'Empty1' }
 
 # Smoke test on out-of-band and allow-preconfig-test
diff --git a/tests/qapi-schema/qapi-schema-test.out b/tests/qapi-schema/qapi-schema-test.out
index 7a488c1d06..f120f10616 100644
--- a/tests/qapi-schema/qapi-schema-test.out
+++ b/tests/qapi-schema/qapi-schema-test.out
@@ -232,7 +232,7 @@ command guest-sync q_obj_guest-sync-arg -> any
     gen=True success_response=True boxed=False oob=False preconfig=False
 command boxed-struct UserDefZero -> None
     gen=True success_response=True boxed=True oob=False preconfig=False
-command boxed-union UserDefListUnion -> None
+command boxed-union UserDefFlatUnion -> None
     gen=True success_response=True boxed=True oob=False preconfig=False
 command boxed-empty Empty1 -> None
     gen=True success_response=True boxed=True oob=False preconfig=False
-- 
2.31.1


