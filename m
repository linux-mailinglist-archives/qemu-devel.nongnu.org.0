Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3404A489CE9
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 16:57:19 +0100 (CET)
Received: from localhost ([::1]:33552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6x2s-0004AO-BG
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 10:57:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n6x1g-0003H2-5s
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 10:56:04 -0500
Received: from [2a00:1450:4864:20::434] (port=39907
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n6x1e-0004Za-AN
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 10:56:03 -0500
Received: by mail-wr1-x434.google.com with SMTP id s1so27655565wra.6
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 07:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=Ut0Bi21fChTUVZq3FQPCa3N4cx2Pd/OqJt7hPo1smJE=;
 b=TleBtiZbkcgqPhHLBTUf4i/gPVc+62MMwYZ8IMt5QEvEyybulUpIzmUnoUQVIYo70b
 ysRjGloo1RkvtB+KtxgKCgtq1W18mh9xq0p6u9g5gT3d5jKEVmYhqx35HLM35mMTYfNL
 QzJazWLiGwGLkAQpMWsfW5v7Sv9U4OgNjEy2k+yzsioWFJl1Xu6uhnqAp7cOjmxbJ+R+
 IEtSBonWI5nAAE5Ks+eTpK2enJoXY+wTVSQmu+QYun2XBxOa38aOd1ou7Pz0ABNQGXkl
 d/uQJWrSN4GkPnUYqEjcaG7ME//4gdjWWgNL8jAlNo9Pa4CwiJnqFuo0ZGxBxCWT/D31
 0nTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Ut0Bi21fChTUVZq3FQPCa3N4cx2Pd/OqJt7hPo1smJE=;
 b=qmEyxMkIgQ0Hv2d5hPNkDUvf/Xov0j8AqbsCm13sh0EUpzhJEKQF8MWzCzZKG9aZt+
 EMk4gBi6V1V60LW6IyHmEaPmGchrAWUUGzdLVjRmqjfBckJ3GZdJCmrD+a1aMhM3wiec
 X+ia/Pz9VPauBR1AjjhE3H7UrBLDDorjzqAYQLM9TPOp2Zqu1jBic1T13+jO4gr2mOR4
 d/yRtjbRze0rGzfrytbd+ctTjdWwJgugwgelmf7Ol47gnFmTh0wuKfYXr51ipKgQaP2Z
 iihhDDmZVi7Es+ytQVshSasgBE7PIu29GQsJW7NhqdyCCOYFcrPN4hjzYWjt4M1tHvKn
 Kbpg==
X-Gm-Message-State: AOAM533VeP9tk4Oy3IPVM9dsympOKOEsXmm7lfrilO1Qapftf/S94odN
 IglnPst3xBp2g99KpXJWBb4yTgqCDUqGx9YwjYuuj1c2QLQu7g==
X-Google-Smtp-Source: ABdhPJwQMjcHJBJD47z/i1hK3TGMNLQIKS8WgeHfzgRBVaM+zOUwAYUqEV+lwSYDLxzBHLDZ2V2d0S3tj0um3EIyGQw=
X-Received: by 2002:a5d:5182:: with SMTP id k2mr213124wrv.319.1641830160528;
 Mon, 10 Jan 2022 07:56:00 -0800 (PST)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Jan 2022 15:55:49 +0000
Message-ID: <CAFEAcA-UKdcTROB7e3jO1qe=WCbuHRuX5WN7HZF2CcdMsmAt=g@mail.gmail.com>
Subject: iotest 040, 041, intermittent failure in netbsd VM
To: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just saw this failure of iotests in a netbsd VM (the in-tree
tests/vm stuff). Pretty sure it's an intermittent as the
pulreq being tested has nothing io or block related.


  TEST   iotest-qcow2: 036
  TEST   iotest-qcow2: 037
  TEST   iotest-qcow2: 038 [not run]
  TEST   iotest-qcow2: 039 [not run]
  TEST   iotest-qcow2: 040 [fail]
QEMU          --
"/home/qemu/qemu-test.MPWquy/build/tests/qemu-iotests/../../qemu-system-aarch64"
-nodefaults -display none -accel qtest -machine
virt
QEMU_IMG      --
"/home/qemu/qemu-test.MPWquy/build/tests/qemu-iotests/../../qemu-img"
QEMU_IO       --
"/home/qemu/qemu-test.MPWquy/build/tests/qemu-iotests/../../qemu-io"
--cache writeback --aio threads -f qcow2
QEMU_NBD      --
"/home/qemu/qemu-test.MPWquy/build/tests/qemu-iotests/../../qemu-nbd"
IMGFMT        -- qcow2
IMGPROTO      -- file
PLATFORM      -- NetBSD/amd64 localhost 9.2
TEST_DIR      -- /home/qemu/qemu-test.MPWquy/build/tests/qemu-iotests/scratch
SOCK_DIR      -- /tmp/tmpuniuicbi
GDB_OPTIONS   --
VALGRIND_QEMU --
PRINT_QEMU_OUTPUT --

--- /home/qemu/qemu-test.MPWquy/src/tests/qemu-iotests/040.out
fcntl(): Invalid argument
+++ 040.out.bad
@@ -1,5 +1,30 @@
-.................................................................
+............................................................ERROR:qemu.aqmp.qmp_client.qemu-7648:Failed
to establish connection: concurrent.futures._base.CancelledError
+E....
+======================================================================
+ERROR: test_top_is_default_active (__main__.TestSingleDrive)
+----------------------------------------------------------------------
+Traceback (most recent call last):
+  File "/home/qemu/qemu-test.MPWquy/src/tests/qemu-iotests/040", line
94, in setUp
+    self.vm.launch()
+  File "/home/qemu/qemu-test.MPWquy/src/python/qemu/machine/machine.py",
line 399, in launch
+    self._launch()
+  File "/home/qemu/qemu-test.MPWquy/src/python/qemu/machine/machine.py",
line 434, in _launch
+    self._post_launch()
+  File "/home/qemu/qemu-test.MPWquy/src/python/qemu/machine/qtest.py",
line 147, in _post_launch
+    super()._post_launch()
+  File "/home/qemu/qemu-test.MPWquy/src/python/qemu/machine/machine.py",
line 340, in _post_launch
+    self._qmp.accept(self._qmp_timer)
+  File "/home/qemu/qemu-test.MPWquy/src/python/qemu/aqmp/legacy.py",
line 69, in accept
+    timeout
+  File "/home/qemu/qemu-test.MPWquy/src/python/qemu/aqmp/legacy.py",
line 42, in _sync
+    asyncio.wait_for(future, timeout=timeout)
+  File "/usr/pkg/lib/python3.7/asyncio/base_events.py", line 587, in
run_until_complete
+    return future.result()
+  File "/usr/pkg/lib/python3.7/asyncio/tasks.py", line 449, in wait_for
+    raise futures.TimeoutError()
+concurrent.futures._base.TimeoutError
+
 ----------------------------------------------------------------------
 Ran 65 tests

-OK
+FAILED (errors=1)
  TEST   iotest-qcow2: 041 [fail]
QEMU          --
"/home/qemu/qemu-test.MPWquy/build/tests/qemu-iotests/../../qemu-system-aarch64"
-nodefaults -display none -accel qtest -machine virt
QEMU_IMG      --
"/home/qemu/qemu-test.MPWquy/build/tests/qemu-iotests/../../qemu-img"
QEMU_IO       --
"/home/qemu/qemu-test.MPWquy/build/tests/qemu-iotests/../../qemu-io"
--cache writeback --aio threads -f qcow2
QEMU_NBD      --
"/home/qemu/qemu-test.MPWquy/build/tests/qemu-iotests/../../qemu-nbd"
IMGFMT        -- qcow2
IMGPROTO      -- file
PLATFORM      -- NetBSD/amd64 localhost 9.2
TEST_DIR      -- /home/qemu/qemu-test.MPWquy/build/tests/qemu-iotests/scratch
SOCK_DIR      -- /tmp/tmpuniuicbi
GDB_OPTIONS   --
VALGRIND_QEMU --
PRINT_QEMU_OUTPUT --

--- /home/qemu/qemu-test.MPWquy/src/tests/qemu-iotests/041.out
+++ 041.out.bad
@@ -1,5 +1,32 @@
-...........................................................................................................
+..........................................ERROR:qemu.aqmp.qmp_client.qemu-15252:Failed
to establish connection: concurrent.futures._base.CancelledError
+E................................................................
+======================================================================
+ERROR: test_small_buffer (__main__.TestSingleBlockdev)
+----------------------------------------------------------------------
+Traceback (most recent call last):
+  File "/home/qemu/qemu-test.MPWquy/src/tests/qemu-iotests/041", line
233, in setUp
+    TestSingleDrive.setUp(self)
+  File "/home/qemu/qemu-test.MPWquy/src/tests/qemu-iotests/041", line
54, in setUp
+    self.vm.launch()
+  File "/home/qemu/qemu-test.MPWquy/src/python/qemu/machine/machine.py",
line 399, in launch
+    self._launch()
+  File "/home/qemu/qemu-test.MPWquy/src/python/qemu/machine/machine.py",
line 434, in _launch
+    self._post_launch()
+  File "/home/qemu/qemu-test.MPWquy/src/python/qemu/machine/qtest.py",
line 147, in _post_launch
+    super()._post_launch()
+  File "/home/qemu/qemu-test.MPWquy/src/python/qemu/machine/machine.py",
line 340, in _post_launch
+    self._qmp.accept(self._qmp_timer)
+  File "/home/qemu/qemu-test.MPWquy/src/python/qemu/aqmp/legacy.py",
line 69, in accept
+    timeout
+  File "/home/qemu/qemu-test.MPWquy/src/python/qemu/aqmp/legacy.py",
line 42, in _sync
+    asyncio.wait_for(future, timeout=timeout)
+  File "/usr/pkg/lib/python3.7/asyncio/base_events.py", line 587, in
run_until_complete
+    return future.result()
+  File "/usr/pkg/lib/python3.7/asyncio/tasks.py", line 449, in wait_for
+    raise futures.TimeoutError()
+concurrent.futures._base.TimeoutError
+
 ----------------------------------------------------------------------
 Ran 107 tests

-OK
+FAILED (errors=1)
  TEST   iotest-qcow2: 042
  TEST   iotest-qcow2: 043
[...]
Not run: 005 013 018 019 024 034 038 039 048 060 061 074 079 080 086
097 099 108 114 137 138 140 141 150 154 161 172 176 179 181 184 186
192 203 220 226 229 244 249 251 252 265 267 271 287 290 292 313
nbd-qemu-allocation
Failures: 040 041
Failed 2 of 74 iotests


Does it look familiar ?

-- PMM

