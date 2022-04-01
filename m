Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C0B4EF1D8
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 16:42:11 +0200 (CEST)
Received: from localhost ([::1]:54968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naITa-0002uQ-4V
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 10:42:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1naIRO-0008Ro-FV
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 10:39:54 -0400
Received: from [2a00:1450:4864:20::136] (port=42878
 helo=mail-lf1-x136.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1naIRM-0002FO-3N
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 10:39:54 -0400
Received: by mail-lf1-x136.google.com with SMTP id d5so5276370lfj.9
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 07:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v71l9IEEyzPNkB32INDqS9IbXr/Aq0Utaio+hwoSp5M=;
 b=WJbIyR+j55bzUsgHcgXExahF8US2PnxYueOgYJeAYgO/D/8oqMJbEMNOUXOIQKOs18
 AX2VuNAcFCfugTohZPLvvXZv0cp9LLbyTY/gQ1lKnv+ROp4MlloBdwNyhinbPf1S43p1
 L+Ndfxg+/gceS2Suz0n2z62YyUps11peRZgAFcgfj9dkmsBxFb7FPsK8ad3ThhbmdnW0
 rwRc1G03QBFhN7inbrET92YEsZ/tBFA6VPRSyx9z23ayr/peitrD8xCEGVTN9iw192Jz
 7cSYHhgPFwvJJ332WA5pv2QuyBTQOCRBA+7vGq2mddWLoJ55j4kBUbslD0/oZkMbNj5Q
 0pzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v71l9IEEyzPNkB32INDqS9IbXr/Aq0Utaio+hwoSp5M=;
 b=HFzqWhf9kDPYi3aVZE+wOoce22bTXcd7si6GgZdwIi8P+XT2DvgMt4qZRxgU9ov7OB
 QKye+RXfOdRqlmdW1NRvLk4sUBUDiko/gcabVukYq7e4dyEqm+B4ERwubJsibEVUoKXU
 BO9JqDkUkti18LfTTWvSy5UhF22bzN9IYHJ5h+PAIFR9kUppgATmsl/xMKIcNalJLXg+
 VcMJ2vyxO0wN+q/9DnVSVA0VM+xZJ12iqoP58e4rAmWexfI0pB/9yv+lpCCsy9QEvxEc
 JeolbILbe0ltkwkjA0xALzotMfAUDHB02LxDwjrCPRYk5x3o+PBdXVa8XsV6B4fcHw7X
 fFLw==
X-Gm-Message-State: AOAM530pMKaOiyb8lya8oZMm+JaXiG5lHQ7vKVDYJCqTTb5CN2o52UDM
 xElqX4beRlzVUZmlDhRLF8wsiUsR0lzJmw==
X-Google-Smtp-Source: ABdhPJwnAGYhlUelOqMNoDLkyLftx4e+DtAwWvQQhkZiHdioXNyDwKVfzDJmP1kUQLUiqFez5R3zJw==
X-Received: by 2002:a05:6512:3e04:b0:44a:4808:2a4a with SMTP id
 i4-20020a0565123e0400b0044a48082a4amr14309725lfv.188.1648823990429; 
 Fri, 01 Apr 2022 07:39:50 -0700 (PDT)
Received: from fedora.. ([185.215.60.153]) by smtp.gmail.com with ESMTPSA id
 y3-20020a2eb003000000b0024afe02da7asm215554ljk.22.2022.04.01.07.39.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 07:39:50 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 3/3] avocado/vnc: add test_change_listen
Date: Fri,  1 Apr 2022 17:39:36 +0300
Message-Id: <20220401143936.356460-4-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401143936.356460-1-vsementsov@openvz.org>
References: <20220401143936.356460-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::136
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lf1-x136.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: v.sementsov-og@mail.ru, berrange@redhat.com, bleal@redhat.com,
 armbru@redhat.com, wainersm@redhat.com, f4bug@amsat.org, vsementsov@openvz.org,
 kraxel@redhat.com, crosa@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add simple test-case for new display-update qmp command.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/avocado/vnc.py | 63 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/tests/avocado/vnc.py b/tests/avocado/vnc.py
index 096432988f..187fd3febc 100644
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


