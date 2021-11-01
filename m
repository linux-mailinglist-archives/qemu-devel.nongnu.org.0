Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D299044203C
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 19:44:19 +0100 (CET)
Received: from localhost ([::1]:50756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhcI6-00083e-Vq
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 14:44:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mhbGB-00069x-EF
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:38:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mhbG9-0004u5-La
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:38:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635788293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BnywYymkfvQbwW9WfZ/X0bSZkpmKwupdobXI+tiVyVQ=;
 b=Mj8QpyVNipAaQFBgzsB+n0xjDa6oJ7rDVu+9eLI/aDAqp3MTXqFRlitEYdhEYk4HvD31p9
 E6P+dZZbYX/GXElLYz0hxTF4kEnXHfs1kYAvZzgemlZQhcNSQRNAMopKjDeAeOIffWTW13
 hgW43UEkGnXdhYiDVNCDRMNOf0feiUw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-SKEfSxySMr6dTIDiMWQWFg-1; Mon, 01 Nov 2021 13:38:09 -0400
X-MC-Unique: SKEfSxySMr6dTIDiMWQWFg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5CD46802682;
 Mon,  1 Nov 2021 17:38:07 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E161019C79;
 Mon,  1 Nov 2021 17:37:47 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/22] iotests/300: avoid abnormal shutdown race condition
Date: Mon,  1 Nov 2021 13:30:04 -0400
Message-Id: <20211101173006.656673-21-jsnow@redhat.com>
In-Reply-To: <20211101173006.656673-1-jsnow@redhat.com>
References: <20211101173006.656673-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Wait for the destination VM to close itself instead of racing to shut it
down first, which produces different error log messages from AQMP
depending on precisely when we tried to shut it down.

(For example: We may try to issue 'quit' immediately prior to the target
VM closing its QMP socket, which will cause an ECONNRESET error to be
logged. Waiting for the VM to exit itself avoids the race on shutdown
behavior.)

Reported-by: Hanna Reitz <hreitz@redhat.com>
Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-id: 20211026175612.4127598-7-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/300 | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/tests/qemu-iotests/300 b/tests/qemu-iotests/300
index 10f9f2a8da6..dbd28384ec3 100755
--- a/tests/qemu-iotests/300
+++ b/tests/qemu-iotests/300
@@ -24,8 +24,6 @@ import random
 import re
 from typing import Dict, List, Optional
 
-from qemu.machine import machine
-
 import iotests
 
 
@@ -461,12 +459,11 @@ class TestBlockBitmapMappingErrors(TestDirtyBitmapMigration):
                       f"'{self.src_node_name}': Name is longer than 255 bytes",
                       log)
 
-        # Expect abnormal shutdown of the destination VM because of
-        # the failed migration
-        try:
-            self.vm_b.shutdown()
-        except machine.AbnormalShutdown:
-            pass
+        # Destination VM will terminate w/ error of its own accord
+        # due to the failed migration.
+        self.vm_b.wait()
+        rc = self.vm_b.exitcode()
+        assert rc is not None and rc > 0
 
     def test_aliased_bitmap_name_too_long(self) -> None:
         # Longer than the maximum for bitmap names
-- 
2.31.1


