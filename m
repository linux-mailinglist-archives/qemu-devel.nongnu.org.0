Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1391CAC28
	for <lists+qemu-devel@lfdr.de>; Fri,  8 May 2020 14:51:46 +0200 (CEST)
Received: from localhost ([::1]:58640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jX2Th-0006VK-Ex
	for lists+qemu-devel@lfdr.de; Fri, 08 May 2020 08:51:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jX2KU-0000Be-Ed
 for qemu-devel@nongnu.org; Fri, 08 May 2020 08:42:14 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:21817
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jX2KN-000869-Ii
 for qemu-devel@nongnu.org; Fri, 08 May 2020 08:42:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588941726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+CxTJcdLUVWj5Wybblu9Gx5OEIzan5qW+8m1lJRkdx4=;
 b=KKsq4blBiNygf9cYMIWA3BSvsTf5beukDiqaYuyr2Ud81twAdRCoHfZ8RP/Hec8y3q6Y3t
 cZ3BNw7WouU8s49OX/ws6Jr7aaQSshze81Qb7AlrRkbsQhTB8rvzVHMjELXlxI9fJ/a2sM
 dgJMprLJNa3gJpWo48tCrckCXha76nM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-_Ad1PUY0NiGBhvsLhRp-tQ-1; Fri, 08 May 2020 08:42:04 -0400
X-MC-Unique: _Ad1PUY0NiGBhvsLhRp-tQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5555A100CCC1;
 Fri,  8 May 2020 12:42:03 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-113-190.ams2.redhat.com
 [10.36.113.190])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 540B819167;
 Fri,  8 May 2020 12:42:02 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 16/30] iotests/283: Use consistent size for source and target
Date: Fri,  8 May 2020 14:41:21 +0200
Message-Id: <20200508124135.252565-17-kwolf@redhat.com>
In-Reply-To: <20200508124135.252565-1-kwolf@redhat.com>
References: <20200508124135.252565-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/08 01:34:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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

The test case forgot to specify the null-co size for the target node.
When adding a check to backup that both sizes match, this would fail
because of the size mismatch and not the behaviour that the test really
wanted to test.

Fixes: a541fcc27c98b96da187c7d4573f3270f3ddd283
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20200430142755.315494-2-kwolf@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/283     | 6 +++++-
 tests/qemu-iotests/283.out | 2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/283 b/tests/qemu-iotests/283
index e17b953333..383797ed62 100644
--- a/tests/qemu-iotests/283
+++ b/tests/qemu-iotests/283
@@ -74,7 +74,11 @@ to check that crash is fixed :)
 vm =3D iotests.VM()
 vm.launch()
=20
-vm.qmp_log('blockdev-add', **{'node-name': 'target', 'driver': 'null-co'})
+vm.qmp_log('blockdev-add', **{
+    'node-name': 'target',
+    'driver': 'null-co',
+    'size': size,
+})
=20
 vm.qmp_log('blockdev-add', **{
     'node-name': 'source',
diff --git a/tests/qemu-iotests/283.out b/tests/qemu-iotests/283.out
index daaf5828c1..d8cff22cc1 100644
--- a/tests/qemu-iotests/283.out
+++ b/tests/qemu-iotests/283.out
@@ -1,4 +1,4 @@
-{"execute": "blockdev-add", "arguments": {"driver": "null-co", "node-name"=
: "target"}}
+{"execute": "blockdev-add", "arguments": {"driver": "null-co", "node-name"=
: "target", "size": 1048576}}
 {"return": {}}
 {"execute": "blockdev-add", "arguments": {"driver": "blkdebug", "image": {=
"driver": "null-co", "node-name": "base", "size": 1048576}, "node-name": "s=
ource"}}
 {"return": {}}
--=20
2.25.3


