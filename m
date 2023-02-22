Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4EE69F6B7
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 15:39:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUqG2-0004I2-W4; Wed, 22 Feb 2023 09:38:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pUqFy-0004HO-E3
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 09:38:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pUqFu-0001Ee-OV
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 09:38:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677076681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IyMgEgsS8ZWrwTPqI4zuFDiG6fm8Va6b4gtWiE2/ZGs=;
 b=bJV2J+nyjygz+d5Am7+lwNet03D6iFNjzAGdJYbbZVvtRcrnXzopoms5t26d366z1PHM48
 8Z3LLAgytCEKsxE7af/x04WsE8h/k+fgEYYVSWAMXJiUf2iTsmnaZvNLHiTT4U1xT6f+OB
 NrM2aQ2zp46uF/9RCuTywP+aKlmYhPg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-258-HVLIBYgpPs6N-BBuMQA8-Q-1; Wed, 22 Feb 2023 09:38:00 -0500
X-MC-Unique: HVLIBYgpPs6N-BBuMQA8-Q-1
Received: by mail-ed1-f69.google.com with SMTP id
 c1-20020a0564021f8100b004acbe232c03so10750649edc.9
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 06:38:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IyMgEgsS8ZWrwTPqI4zuFDiG6fm8Va6b4gtWiE2/ZGs=;
 b=VrOFVikLRcuyk0LUOr9e+VpQja8MkN9VdRuOK7IDie/V0sTfzTxXjry0lQaNYkZG+9
 IhpHJI/a7eOdhKqU+OSPx0Eedq42MkZvOncsTb8PoeaWK5TP6O1LFA7TPuyWKsU3pbjf
 0B1GsXTQWBffu7uk55fBfV1agF/dHDX51QOko6t7SsmX/zkVtYK9dprcpuo4zyRjIf8/
 d3B11AZuW1vX+rSUYg5FamvZSmsHHhqMH+7BLZeNiX8CSFNsyvM3Xkwbey19xHUpGRUK
 4rJzfN3TGDVJXn0GI+ZWP0n08lOEBxIDoOL8cSBRJOAI03FvVGGQg3+0saD5v18rzRqT
 SqDg==
X-Gm-Message-State: AO0yUKVnwdf8NuEE4cpTHRFoJsueRVyRlaqwxvfAk70KlHJbTN0cUS1U
 g5XuhNlDMYyIKrjQ08Vxe94hpnUZAzsFBcg1Q114qR+sC7uHrvKPLLLfGX4/++HJoEcN3jkA6Mg
 XXiMm+1Gp8IcMNM6m4wwJVzt1GZHm1IcF7dOlgJc8nG00QQxo9DVncSEd7RiUReST/5ABWWMa
X-Received: by 2002:a05:6402:1348:b0:4ab:554:37e9 with SMTP id
 y8-20020a056402134800b004ab055437e9mr8189202edw.41.1677076679185; 
 Wed, 22 Feb 2023 06:37:59 -0800 (PST)
X-Google-Smtp-Source: AK7set95+Rd+j1m5FwCEMKHkA0yccJb2pHZNR/KnZbsB0uk83iDRE4+inQi+F+xcN3kYrz0u8+R4OA==
X-Received: by 2002:a05:6402:1348:b0:4ab:554:37e9 with SMTP id
 y8-20020a056402134800b004ab055437e9mr8189178edw.41.1677076678881; 
 Wed, 22 Feb 2023 06:37:58 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 x41-20020a50baac000000b004acbe8255f1sm2145757ede.86.2023.02.22.06.37.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 06:37:58 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: jsnow@redhat.com, peter.maydell@linaro.org, thuth@redhat.com,
 alex.bennee@linaro.org, armbru@redhat.com, berrange@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH 01/10] python: support pylint 2.16
Date: Wed, 22 Feb 2023 15:37:43 +0100
Message-Id: <20230222143752.466090-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230222143752.466090-1-pbonzini@redhat.com>
References: <20230222143752.466090-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: John Snow <jsnow@redhat.com>

Pylint 2.16 adds a few new checks that cause the optional check-tox CI
job to fail.

1. The superfluous-parens check seems to be a bit more aggressive,
2. broad-exception-raised is new; it discourages "raise Exception".

Fix these minor issues and turn the lights green.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Beraldo Leal <bleal@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 python/qemu/qmp/protocol.py                            | 2 +-
 python/qemu/qmp/qmp_client.py                          | 2 +-
 python/qemu/utils/qemu_ga_client.py                    | 6 +++---
 tests/qemu-iotests/iotests.py                          | 4 ++--
 tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test | 2 +-
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/python/qemu/qmp/protocol.py b/python/qemu/qmp/protocol.py
index 6d3d739daa76..22e60298d280 100644
--- a/python/qemu/qmp/protocol.py
+++ b/python/qemu/qmp/protocol.py
@@ -207,7 +207,7 @@ class AsyncProtocol(Generic[T]):
     logger = logging.getLogger(__name__)
 
     # Maximum allowable size of read buffer
-    _limit = (64 * 1024)
+    _limit = 64 * 1024
 
     # -------------------------
     # Section: Public interface
diff --git a/python/qemu/qmp/qmp_client.py b/python/qemu/qmp/qmp_client.py
index b5772e7f32b3..9d73ae6e7ada 100644
--- a/python/qemu/qmp/qmp_client.py
+++ b/python/qemu/qmp/qmp_client.py
@@ -198,7 +198,7 @@ async def run(self, address='/tmp/qemu.socket'):
     logger = logging.getLogger(__name__)
 
     # Read buffer limit; 10MB like libvirt default
-    _limit = (10 * 1024 * 1024)
+    _limit = 10 * 1024 * 1024
 
     # Type alias for pending execute() result items
     _PendingT = Union[Message, ExecInterruptedError]
diff --git a/python/qemu/utils/qemu_ga_client.py b/python/qemu/utils/qemu_ga_client.py
index 8c38a7ac9c0e..d8411bb2d0b5 100644
--- a/python/qemu/utils/qemu_ga_client.py
+++ b/python/qemu/utils/qemu_ga_client.py
@@ -155,7 +155,7 @@ def ping(self, timeout: Optional[float]) -> bool:
 
     def fsfreeze(self, cmd: str) -> object:
         if cmd not in ['status', 'freeze', 'thaw']:
-            raise Exception('Invalid command: ' + cmd)
+            raise ValueError('Invalid command: ' + cmd)
         # Can be int (freeze, thaw) or GuestFsfreezeStatus (status)
         return getattr(self.qga, 'fsfreeze' + '_' + cmd)()
 
@@ -167,7 +167,7 @@ def fstrim(self, minimum: int) -> Dict[str, object]:
 
     def suspend(self, mode: str) -> None:
         if mode not in ['disk', 'ram', 'hybrid']:
-            raise Exception('Invalid mode: ' + mode)
+            raise ValueError('Invalid mode: ' + mode)
 
         try:
             getattr(self.qga, 'suspend' + '_' + mode)()
@@ -178,7 +178,7 @@ def suspend(self, mode: str) -> None:
 
     def shutdown(self, mode: str = 'powerdown') -> None:
         if mode not in ['powerdown', 'halt', 'reboot']:
-            raise Exception('Invalid mode: ' + mode)
+            raise ValueError('Invalid mode: ' + mode)
 
         try:
             self.qga.shutdown(mode=mode)
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 94aeb3f3b200..3e82c634cfef 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -720,7 +720,7 @@ def __exit__(self, exc_type, value, traceback):
         signal.setitimer(signal.ITIMER_REAL, 0)
         return False
     def timeout(self, signum, frame):
-        raise Exception(self.errmsg)
+        raise TimeoutError(self.errmsg)
 
 def file_pattern(name):
     return "{0}-{1}".format(os.getpid(), name)
@@ -804,7 +804,7 @@ def remote_filename(path):
     elif imgproto == 'ssh':
         return "ssh://%s@127.0.0.1:22%s" % (os.environ.get('USER'), path)
     else:
-        raise Exception("Protocol %s not supported" % (imgproto))
+        raise ValueError("Protocol %s not supported" % (imgproto))
 
 class VM(qtest.QEMUQtestMachine):
     '''A QEMU VM'''
diff --git a/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test b/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
index fc9c4b4ef411..dda55fad2840 100755
--- a/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
+++ b/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
@@ -84,7 +84,7 @@ class TestDirtyBitmapPostcopyMigration(iotests.QMPTestCase):
                 e['vm'] = 'SRC'
             for e in self.vm_b_events:
                 e['vm'] = 'DST'
-            events = (self.vm_a_events + self.vm_b_events)
+            events = self.vm_a_events + self.vm_b_events
             events = [(e['timestamp']['seconds'],
                        e['timestamp']['microseconds'],
                        e['vm'],
-- 
2.39.1


