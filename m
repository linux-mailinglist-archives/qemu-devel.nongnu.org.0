Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C154F689C
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 20:13:14 +0200 (CEST)
Received: from localhost ([::1]:42380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncA9Z-00005Z-Bv
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 14:13:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1ncA5F-0000RF-Ji
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 14:08:45 -0400
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130]:41906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1ncA5B-0001yk-4J
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 14:08:45 -0400
Received: by mail-lf1-x130.google.com with SMTP id p15so5475206lfk.8
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 11:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WA+1U5ZC+5q6mIi4Y/XXKldn5dP6kA8bCtL1n9+8Ttw=;
 b=GZZ4RaD8IBz7RiF16tGghcfpUj8fyo6aZ0mePV96nhx8rcpmRl5Cc9uHls57DWkuJD
 RfpdUIE24Zob9CzRWY3vB0GljGipB6ZaZx1DYigxjpfbBtGm26BlPMIx/NO8uU6cuOYk
 zxXyxBO3Nxh95E4Nrju0L/N6PRE15FNlo/TttjMQ3IGm6001kFtGObDwIM5XeLXptyJN
 AECdsJnktIA5MRsJmOz3znzwqL2jMSXPaWfVrzQ45ICgwnRuFiqYT8sFj2+smx4+jmZs
 s7RewFRDQ1yWMj0VI2Jm+BYSL0NfgHyTugpFoDd8H8Kldj2qTqMuO+lQc2z6deKursrP
 EGLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WA+1U5ZC+5q6mIi4Y/XXKldn5dP6kA8bCtL1n9+8Ttw=;
 b=RwGW0RxD9dfSnLcpUdgC1Yy4xBVa2c2brskT5/u9J2Y00At0UUdzOimvacXKxidtJ+
 XRokx0oXD32uQp+zj3WlpfCMRbZ88BufTAdR80NHqa3cGIl96uUf2VpM+BTma0YNYnwm
 LpEzl6O18S61wTFyCQCY+ni9gf+TW5rLTrx3ZAjaIapeVQMguAZj3nYWewjQxGlNGl2n
 4j4tg3O4KoAmcA9kz9FrUCXSRbANpSmHlaJ4INhF229aHXa4ZNRAaxMwv3hHkLyMxf4I
 pZ4ZUHnRzBrbEtBCYFf25Z+ZDqOoF+cYWYKIXzxeuL/eFOyT5K/5Eq9vgskeUKWRoU34
 9gcA==
X-Gm-Message-State: AOAM530E/tGjSc0FOlIfyANaPdU76+uuHZwobJ5KcI6L5/WW1kb2K4G4
 KYxoYCNawRBm0QILBQ9vpqpSZw==
X-Google-Smtp-Source: ABdhPJwxijL1aHDD4E/WlcMdazmVi0lYjZxqhA1EXNUJru5ZHiFGq+REfJO+FHTLjmuL2xhQuh3csg==
X-Received: by 2002:a05:6512:3f97:b0:44a:f67d:7d8 with SMTP id
 x23-20020a0565123f9700b0044af67d07d8mr6468555lfa.81.1649268519488; 
 Wed, 06 Apr 2022 11:08:39 -0700 (PDT)
Received: from fedora.. ([185.215.60.161]) by smtp.gmail.com with ESMTPSA id
 a20-20020a194f54000000b0044a9afab7e7sm1904321lfk.290.2022.04.06.11.08.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 11:08:39 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v3 7/7] iotests: copy-before-write: add cases for cbw-timeout
 option
Date: Wed,  6 Apr 2022 21:08:01 +0300
Message-Id: <20220406180801.374844-8-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220406180801.374844-1-vsementsov@openvz.org>
References: <20220406180801.374844-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lf1-x130.google.com
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
 tests/qemu-iotests/tests/copy-before-write    | 78 +++++++++++++++++++
 .../qemu-iotests/tests/copy-before-write.out  |  4 +-
 2 files changed, 80 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/tests/copy-before-write b/tests/qemu-iotests/tests/copy-before-write
index a32608f597..5c90b8cd50 100755
--- a/tests/qemu-iotests/tests/copy-before-write
+++ b/tests/qemu-iotests/tests/copy-before-write
@@ -122,6 +122,84 @@ read 1048576/1048576 bytes at offset 0
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
+        result = self.vm.hmp_qemu_io('cbw', 'write 0 512K')
+        self.assert_qmp(result, 'return', '')
+
+        # We need second write to trigger throttling
+        result = self.vm.hmp_qemu_io('cbw', 'write 512K 512K')
+        self.assert_qmp(result, 'return', '')
+
+        result = self.vm.hmp_qemu_io('access', 'read 0 1M')
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


