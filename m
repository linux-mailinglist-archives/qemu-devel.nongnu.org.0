Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A089A50A406
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 17:26:06 +0200 (CEST)
Received: from localhost ([::1]:60870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhYh3-0002c2-Oh
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 11:26:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nhYXV-0003Nf-9j
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:16:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nhYXP-0005mT-L4
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:16:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650554167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pwuEgcRktwwExu5MJhSZZLINFhmagfgwJaOuprPGgaA=;
 b=RMsWV8wohb+iT/4O33lhWy3wp+dS8/ztdjEssO08l4tzOU5KeWVsnKICrhORmK9wNpzjSq
 cIiG7xahUuADyI0DNFAnJqNimfy7QLO+61Cc/3CYsQOAaNRQorQZdlHkN6sclKpll1lHfr
 8pT+UPurngwgGJBnk+/UOPLzFUm6VAg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-3-H2BsQJsnMF-VnFdzKobAtg-1; Thu, 21 Apr 2022 11:16:03 -0400
X-MC-Unique: H2BsQJsnMF-VnFdzKobAtg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 48F013811F2E;
 Thu, 21 Apr 2022 15:16:03 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CD5F640D016A;
 Thu, 21 Apr 2022 15:16:02 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/17] iotests/mirror-top-perms: switch to AQMP
Date: Thu, 21 Apr 2022 11:15:46 -0400
Message-Id: <20220421151600.984189-4-jsnow@redhat.com>
In-Reply-To: <20220421151600.984189-1-jsnow@redhat.com>
References: <20220421151600.984189-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We don't have to maintain compatibility with both QMP libraries anymore,
so we can just remove the old exception. While we're here, take
advantage of the extra fields present in the VMLaunchFailure exception
that machine.py now raises.

(Note: I'm leaving the logging suppression here unchanged. I had
suggested previously we use filters to scrub the PID out of the logging
information so it could just be diffed as part of the iotest output, but
that meant *always* scrubbing PID from logger output, which defeated the
point of even offering that information in the output to begin with.

Ultimately, I decided it's fine to just suppress the logger temporarily.)

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Acked-by: Hanna Reitz <hreitz@redhat.com>
Message-id: 20220321203315.909411-4-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/tests/mirror-top-perms | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/tests/qemu-iotests/tests/mirror-top-perms b/tests/qemu-iotests/tests/mirror-top-perms
index 6ac8d5efccb..a9f275cd7f2 100755
--- a/tests/qemu-iotests/tests/mirror-top-perms
+++ b/tests/qemu-iotests/tests/mirror-top-perms
@@ -22,7 +22,6 @@
 import os
 
 from qemu.machine import machine
-from qemu.qmp import QMPConnectError
 
 import iotests
 from iotests import change_log_level, qemu_img
@@ -98,15 +97,13 @@ class TestMirrorTopPerms(iotests.QMPTestCase):
         self.vm_b.add_blockdev(f'file,node-name=drive0,filename={source}')
         self.vm_b.add_device('virtio-blk,drive=drive0,share-rw=on')
         try:
-            # Silence AQMP errors temporarily.
-            # TODO: Remove this and just allow the errors to be logged when
-            # AQMP fully replaces QMP.
+            # Silence AQMP logging errors temporarily.
             with change_log_level('qemu.aqmp'):
                 self.vm_b.launch()
                 print('ERROR: VM B launched successfully, '
                       'this should not have happened')
-        except (QMPConnectError, machine.VMLaunchFailure):
-            assert 'Is another process using the image' in self.vm_b.get_log()
+        except machine.VMLaunchFailure as exc:
+            assert 'Is another process using the image' in exc.output
 
         result = self.vm.qmp('block-job-cancel',
                              device='mirror')
-- 
2.34.1


