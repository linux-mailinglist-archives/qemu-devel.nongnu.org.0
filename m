Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B362511CA5
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 19:35:15 +0200 (CEST)
Received: from localhost ([::1]:39760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njlZK-0003zI-6W
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 13:35:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1njlUR-0004YC-LE
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 13:30:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1njlUO-0002Yz-Bf
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 13:30:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651080607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PrGCZVM389hjCQzgZPb8u6IS3jwWK0ndVF5vnCevEXQ=;
 b=jKf9ddq4exk95VtYz/+ZFKskg/nr0eor9y7D6p8jkw/uBm8Gd+tqyDc9zFV7OCI4bAL52+
 c5iiOFLVbaeq7dqyILaaAHIlkmBZJx7wleog18VXjV4QbhKavLRswbQACABI2Za9YcTAyq
 rkg6Wcky/4rkzAECcbVqQAHZFi2UsMs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-sDPU8Sb9MrWpcIFDS7qAIA-1; Wed, 27 Apr 2022 13:30:03 -0400
X-MC-Unique: sDPU8Sb9MrWpcIFDS7qAIA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 840A31C08548;
 Wed, 27 Apr 2022 17:30:02 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E9FA014A5065;
 Wed, 27 Apr 2022 17:30:01 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 819801800D5F; Wed, 27 Apr 2022 19:29:52 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 6/9] avocado/vnc: add test_change_listen
Date: Wed, 27 Apr 2022 19:29:49 +0200
Message-Id: <20220427172952.2986839-7-kraxel@redhat.com>
In-Reply-To: <20220427172952.2986839-1-kraxel@redhat.com>
References: <20220427172952.2986839-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>

Add simple test-case for new display-update qmp command.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220401143936.356460-4-vsementsov@openvz.org>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 tests/avocado/vnc.py | 63 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/tests/avocado/vnc.py b/tests/avocado/vnc.py
index 096432988fbb..187fd3febca4 100644
--- a/tests/avocado/vnc.py
+++ b/tests/avocado/vnc.py
@@ -8,9 +8,48 @@
 # This work is licensed under the terms of the GNU GPL, version 2 or
 # later.  See the COPYING file in the top-level directory.
 
+import socket
+from typing import List
+
 from avocado_qemu import QemuSystemTest
 
 
+VNC_ADDR = '127.0.0.1'
+VNC_PORT_START = 32768
+VNC_PORT_END = VNC_PORT_START + 1024
+
+
+def check_bind(port: int) -> bool:
+    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as sock:
+        try:
+            sock.bind((VNC_ADDR, port))
+        except OSError:
+            return False
+
+    return True
+
+
+def check_connect(port: int) -> bool:
+    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as sock:
+        try:
+            sock.connect((VNC_ADDR, port))
+        except ConnectionRefusedError:
+            return False
+
+    return True
+
+
+def find_free_ports(count: int) -> List[int]:
+    result = []
+    for port in range(VNC_PORT_START, VNC_PORT_END):
+        if check_bind(port):
+            result.append(port)
+            if len(result) >= count:
+                break
+    assert len(result) == count
+    return result
+
+
 class Vnc(QemuSystemTest):
     """
     :avocado: tags=vnc,quick
@@ -51,3 +90,27 @@ def test_change_password(self):
         set_password_response = self.vm.qmp('change-vnc-password',
                                             password='new_password')
         self.assertEqual(set_password_response['return'], {})
+
+    def test_change_listen(self):
+        a, b, c = find_free_ports(3)
+        self.assertFalse(check_connect(a))
+        self.assertFalse(check_connect(b))
+        self.assertFalse(check_connect(c))
+
+        self.vm.add_args('-nodefaults', '-S', '-vnc', f'{VNC_ADDR}:{a - 5900}')
+        self.vm.launch()
+        self.assertEqual(self.vm.qmp('query-vnc')['return']['service'], str(a))
+        self.assertTrue(check_connect(a))
+        self.assertFalse(check_connect(b))
+        self.assertFalse(check_connect(c))
+
+        res = self.vm.qmp('display-update', type='vnc',
+                          addresses=[{'type': 'inet', 'host': VNC_ADDR,
+                                      'port': str(b)},
+                                     {'type': 'inet', 'host': VNC_ADDR,
+                                      'port': str(c)}])
+        self.assertEqual(res['return'], {})
+        self.assertEqual(self.vm.qmp('query-vnc')['return']['service'], str(b))
+        self.assertFalse(check_connect(a))
+        self.assertTrue(check_connect(b))
+        self.assertTrue(check_connect(c))
-- 
2.35.1


