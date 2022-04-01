Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9854EEABE
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 11:52:41 +0200 (CEST)
Received: from localhost ([::1]:36088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naDxQ-0002Cw-JH
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 05:52:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1naDRY-0000Hg-Ed
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 05:19:46 -0400
Received: from [2a00:1450:4864:20::135] (port=40617
 helo=mail-lf1-x135.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1naDRV-0006th-3S
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 05:19:43 -0400
Received: by mail-lf1-x135.google.com with SMTP id t25so3729009lfg.7
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 02:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sZ60no0T2SKpnDHqmzl+ewaJt3tOk+gpxGjhzlf+0KQ=;
 b=E4j1SfdZ2wOiqH5Plh3yZ7AhtNvwZim3t6aOc7iviTaY1RFSnMmg1YtKRwShjuT2Tx
 5Dk9xGU9UvfeZQPfOU5e09LA77sSuB/tO0rtCNNkQEoTizGleHwPYe/577QBf+DvMEFR
 VekTyChweOrSy3NX4MYbgRbEBeT+gpBBCJRr32gsVsPNSqbRyijrPKqV4moIef/SYm6C
 nkXvLCYE4hASKXZGgkWQliw+5pa2l7bx6o86OWWLN7wK3rqy/+28ji741F7G4aGQ8apA
 k8kxFW9/D8PQ6NLfyo9i//dPhM4G4uzEuqKKhVmwOqkGsE7uINsGdC9kR6qsra5Amcve
 +YRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sZ60no0T2SKpnDHqmzl+ewaJt3tOk+gpxGjhzlf+0KQ=;
 b=BjqlH2ejOO99otRrESlWl5JSSes/y2Spmp78dxDbKmt9t7dtVU7bOaGQzTA2N5tMlz
 HieAmGZ/KI4QsjZkq1GciEC4T25nY2UA+xvMoqgf/UGxsZB2mbxYttgyxjvPuNdiT3Uf
 wOHo+/nZdqM4l9a/U6kuapzGhPyk+p++Ugh77tOwGA4NBRMpcx1WIb9h2nysaNjBaZIg
 KFGq7e5SraCYgifFwxSWjDAak66jBfSriZRIo3CpcZ1ziN6AiHpwstjhzwnIRxvzXYLR
 DDxYUbm3ymO6Gv9z4DZMH++y+Y5PbcPjfQT2/W216a9ATz8s1L16cXSzAPN7ntLDgZoG
 9RMA==
X-Gm-Message-State: AOAM531Co3FkrALksKQnJ7fKFrzAktS6AY7tK9xjrCVDubgluWluEVho
 TziEXVQ5OQN+jqCYHvHFZsRAYQ==
X-Google-Smtp-Source: ABdhPJyppJ++G5a/ZJL04IqjPCV0aoukubLys5Or6ssZ4Chk+AG/ED1vLRvpZdUXI3ffe3FLWkLPMA==
X-Received: by 2002:a05:6512:6c5:b0:44a:2642:b77d with SMTP id
 u5-20020a05651206c500b0044a2642b77dmr13656883lff.616.1648804778998; 
 Fri, 01 Apr 2022 02:19:38 -0700 (PDT)
Received: from fedora.. ([185.215.60.153]) by smtp.gmail.com with ESMTPSA id
 d16-20020a2eb050000000b002461d8f365bsm155135ljl.38.2022.04.01.02.19.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 02:19:38 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v2 7/7] iotests: copy-before-write: add cases for cbw-timeout
 option
Date: Fri,  1 Apr 2022 12:19:20 +0300
Message-Id: <20220401091920.287612-8-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401091920.287612-1-vsementsov@openvz.org>
References: <20220401091920.287612-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::135
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lf1-x135.google.com
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
index a32608f597..265299957c 100755
--- a/tests/qemu-iotests/tests/copy-before-write
+++ b/tests/qemu-iotests/tests/copy-before-write
@@ -122,6 +122,84 @@ read 1048576/1048576 bytes at offset 0
 1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 """)
 
+    def do_cbw_timeout(self, on_cbw_error):
+        result = self.vm.qmp('object-add', {
+            'qom-type': 'throttle-group',
+            'id': 'group0',
+            'limits': {'bps-write': 1}
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


