Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B454194F6
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 15:21:13 +0200 (CEST)
Received: from localhost ([::1]:46944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUqZE-0006Wy-RG
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 09:21:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mUqLb-0003Mn-Gv
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 09:07:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mUqLU-0003nF-Qe
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 09:07:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632748019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JiaFssF/uVu0RqB0XoXhPcX1IsaomE6B83n6l8GCUgI=;
 b=gO2fn4a1z6cWIfG3ZoXoQM60sYlB05heEU3Trq+p7zGIVFoZ4ITRp9Ywg+1Jy4CqJexAPN
 GOZ+smbBfgwuH5+D5cRamDBgFB83Ws+a8ia/vNaFkvZnS+RfOpA3H3EdDboP31axLZP1Y+
 3SRREHUul5g8K7rAUhPxIb1itM0qC7A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-foDousQOPI6OMmrp4MyGug-1; Mon, 27 Sep 2021 09:06:57 -0400
X-MC-Unique: foDousQOPI6OMmrp4MyGug-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69991802921;
 Mon, 27 Sep 2021 13:06:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ECE58100164A;
 Mon, 27 Sep 2021 13:06:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A9F4411380B0; Mon, 27 Sep 2021 15:06:47 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 15/25] tests/qapi-schema: Wean off UserDefListUnion
Date: Mon, 27 Sep 2021 15:06:37 +0200
Message-Id: <20210927130647.1271533-16-armbru@redhat.com>
In-Reply-To: <20210927130647.1271533-1-armbru@redhat.com>
References: <20210927130647.1271533-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Command boxed-union uses simple union UserDefListUnion to cover
unions.  Use UserDefFlatUnion instead.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210917143134.412106-16-armbru@redhat.com>
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


