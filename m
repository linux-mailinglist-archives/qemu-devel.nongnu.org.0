Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 988624F80DF
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 15:42:48 +0200 (CEST)
Received: from localhost ([::1]:59282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncSPN-000352-NB
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 09:42:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1ncSAs-00079U-HF
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 09:27:49 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a]:45956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1ncSAq-0007vA-6V
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 09:27:46 -0400
Received: by mail-lf1-x12a.google.com with SMTP id p10so9556497lfa.12
 for <qemu-devel@nongnu.org>; Thu, 07 Apr 2022 06:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FYIxNeNHMXR8pydlY9zqGvxumGRx1BcM9vCeYgEsKkk=;
 b=xjI3sJDifkkdfLVXg8G3PK041dbdc52Y22IWZnXZTQQ4gZNDDH4G/9ekUsquxPT6Ma
 n8dOJIEXzaolhn7lTYBkzcxRrOJY1yv85Sdcw9u04aB7zJf+x09NgutEFXtSjAqsN8eF
 m3/ARsQkkrZ1BUOqNqyklpoWdm/VhNTvvPd4uPBkZFgF185R5IXqaY4qcII7E2h5HVZS
 MhXeydkqaXZobT23wUgEoxqKmMX0myZHEdnZ0LL+26NDmVOgSPnRuE8zruHQxJ43rbmQ
 dEvaQ7QyS5I04PoFngDgy6aP7fl/59ocMBAJVvRoCxeHXMOexN3M/P4hOyv/66FMFuis
 aPFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FYIxNeNHMXR8pydlY9zqGvxumGRx1BcM9vCeYgEsKkk=;
 b=dMrBHaRHl1x4TTMO1RqoBU+ETbdCTqupA/qHErnmFFcJKYp7PDSYhMG37oGZ85Pusd
 KnFgpuPfNdZHA8NYAmwkT62pfIkzVZHtR0KRWDFGcoNiL60ihv+7Y6wznRxiFT2OcGou
 +DwwcdZNyQD9FFbgqUVAs9XfCg1mUjNsi0uqZ+kXG0fagfbMYxST4RQjL0vt7eOqt4T6
 21f0qkkq7YPn6n43O5JS9l9PDYbOD3t6vC9qOGyh2BCOpzUkN3bOHpaDuNwfjzmk/gw5
 ekuQF4O9KgbeGw40zCwdgSFybd1LPzAMWEPQG3q+A0NdNDmblVbblkYMrRTgGOqI1sX/
 ibww==
X-Gm-Message-State: AOAM531y03oXHwd/RCcFWWKKHOdU47nbaGuGSxgyFs1Fnz1BBdbeFaIm
 EF042pTTa9/yaFdOQzv+IaB2Dw==
X-Google-Smtp-Source: ABdhPJxbKswmJ/LxfWqpl+nzorkWictv7tt8kGF+6Q2vTxjXIPmG0XYKpWiSimgh92i8MDpnC+TyCw==
X-Received: by 2002:ac2:4e13:0:b0:44a:2d3e:e9ce with SMTP id
 e19-20020ac24e13000000b0044a2d3ee9cemr9229860lfr.602.1649338062659; 
 Thu, 07 Apr 2022 06:27:42 -0700 (PDT)
Received: from fedora.. ([185.215.60.161]) by smtp.gmail.com with ESMTPSA id
 o15-20020a2e90cf000000b0024b0437ed8asm1929271ljg.7.2022.04.07.06.27.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 06:27:42 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v4 7/7] iotests: copy-before-write: add cases for cbw-timeout
 option
Date: Thu,  7 Apr 2022 16:27:26 +0300
Message-Id: <20220407132726.85114-8-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220407132726.85114-1-vsementsov@openvz.org>
References: <20220407132726.85114-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lf1-x12a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, v.sementsov-og@mail.ru, jsnow@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, hreitz@redhat.com,
 vsementsov@openvz.org, stefanha@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add two simple test-cases: timeout failure with
break-snapshot-on-cbw-error behavior and similar with
break-guest-write-on-cbw-error behavior.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
---
 tests/qemu-iotests/tests/copy-before-write    | 81 +++++++++++++++++++
 .../qemu-iotests/tests/copy-before-write.out  |  4 +-
 2 files changed, 83 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/tests/copy-before-write b/tests/qemu-iotests/tests/copy-before-write
index 6c7638965e..f01f26f01c 100755
--- a/tests/qemu-iotests/tests/copy-before-write
+++ b/tests/qemu-iotests/tests/copy-before-write
@@ -126,6 +126,87 @@ read 1048576/1048576 bytes at offset 0
 1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 """)
 
+    def do_cbw_timeout(self, on_cbw_error):
+        result = self.vm.qmp('object-add', {
+            'qom-type': 'throttle-group',
+            'id': 'group0',
+            'limits': {'bps-write': 300 * 1024}
+        })
+        self.assert_qmp(result, 'return', {})
+
+        result = self.vm.qmp('blockdev-add', {
+            'node-name': 'cbw',
+            'driver': 'copy-before-write',
+            'on-cbw-error': on_cbw_error,
+            'cbw-timeout': 1,
+            'file': {
+                'driver': iotests.imgfmt,
+                'file': {
+                    'driver': 'file',
+                    'filename': source_img,
+                }
+            },
+            'target': {
+                'driver': 'throttle',
+                'throttle-group': 'group0',
+                'file': {
+                    'driver': 'qcow2',
+                    'file': {
+                        'driver': 'file',
+                        'filename': temp_img
+                    }
+                }
+            }
+        })
+        self.assert_qmp(result, 'return', {})
+
+        result = self.vm.qmp('blockdev-add', {
+            'node-name': 'access',
+            'driver': 'snapshot-access',
+            'file': 'cbw'
+        })
+        self.assert_qmp(result, 'return', {})
+
+        result = self.vm.qmp('human-monitor-command',
+                             command_line='qemu-io cbw "write 0 512K"')
+        self.assert_qmp(result, 'return', '')
+
+        # We need second write to trigger throttling
+        result = self.vm.qmp('human-monitor-command',
+                             command_line='qemu-io cbw "write 512K 512K"')
+        self.assert_qmp(result, 'return', '')
+
+        result = self.vm.qmp('human-monitor-command',
+                             command_line='qemu-io access "read 0 1M"')
+        self.assert_qmp(result, 'return', '')
+
+        self.vm.shutdown()
+        log = self.vm.get_log()
+        log = re.sub(r'^\[I \d+\.\d+\] OPENED\n', '', log)
+        log = re.sub(r'\[I \+\d+\.\d+\] CLOSED\n?$', '', log)
+        log = iotests.filter_qemu_io(log)
+        return log
+
+    def test_timeout_break_guest(self):
+        log = self.do_cbw_timeout('break-guest-write')
+        self.assertEqual(log, """\
+wrote 524288/524288 bytes at offset 0
+512 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+write failed: Connection timed out
+read 1048576/1048576 bytes at offset 0
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+""")
+
+    def test_timeout_break_snapshot(self):
+        log = self.do_cbw_timeout('break-snapshot')
+        self.assertEqual(log, """\
+wrote 524288/524288 bytes at offset 0
+512 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+wrote 524288/524288 bytes at offset 524288
+512 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read failed: Permission denied
+""")
+
 
 if __name__ == '__main__':
     iotests.main(supported_fmts=['qcow2'],
diff --git a/tests/qemu-iotests/tests/copy-before-write.out b/tests/qemu-iotests/tests/copy-before-write.out
index fbc63e62f8..89968f35d7 100644
--- a/tests/qemu-iotests/tests/copy-before-write.out
+++ b/tests/qemu-iotests/tests/copy-before-write.out
@@ -1,5 +1,5 @@
-..
+....
 ----------------------------------------------------------------------
-Ran 2 tests
+Ran 4 tests
 
 OK
-- 
2.35.1


