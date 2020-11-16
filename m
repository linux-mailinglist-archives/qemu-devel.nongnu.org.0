Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD8C2B4A97
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 17:20:25 +0100 (CET)
Received: from localhost ([::1]:54836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kehEu-0002Wx-82
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 11:20:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kehBX-0007h0-KB
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 11:16:59 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:41587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kehBR-00025i-AD
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 11:16:54 -0500
Received: by mail-ed1-x52a.google.com with SMTP id t9so19307305edq.8
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 08:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=Y+zGCOmIx8+ggmpkbTj2m1sSySdnAZWwk2aVeACcFwM=;
 b=fi3h5PFQUyFBRM19K6jAXF/yu0RPjK70i/VHkq3PBxSs+SYaM88Ikp4/RzReDRjGHe
 K/vD9SlD/mW27MYcmSQBUi0eLxGG+j6+Gh0Dy38E7ooOHwvnbGA10DdOpS44Ck1pSRVN
 PxYTaccXFg6oGALAftREYh2wqROJMRAPvcroS9mYhCTY305Ttl/b7dzGahVaPDI9kRGl
 hFdt1TJuD2XHIGCP5aaPD0pEyoYQhc76e9ayFrFhacvtjBBu3DjtWhgBnBbojAaRxsNH
 5GG31+a7nUOurs4RhfdrcHoGBncilQrvwHvQCyfzg/uxfnilRXPCyFcdZ45TbvqSqs3B
 jeyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=Y+zGCOmIx8+ggmpkbTj2m1sSySdnAZWwk2aVeACcFwM=;
 b=mUfE46A9zgoTnAf8vh38lE0TqsqTOhPtoa+14l2OBakakFef1Jo/3RmNruXGJQ9XYD
 hX+aQiWKHIGl5RasyVve6gGHoN1NPilFHTI6ru8PFzoABz53BmL3iBJ5ANCS7E0jX9JW
 zdb4JC9M6D43xIxw0TXcxzIRQS+8blYC7m526T8Kh0kP8GTlUdkDKMlsqEUj3b4HtO3J
 v4RUQJYmrFp8F2gJQGhAO9GCsidNvppMylRBUzdJQmctKSJ/0Aqq9IO3HBfA18H0wmD6
 /EHkLV5dCRUfOUqlqXZMOx9XMudJp8Cv/ObPNpWonCQ3RFBkmTqi+BZf00Mhd+H0E99L
 opow==
X-Gm-Message-State: AOAM530/hKIeBYbLXzhJkh/6EJewiOUKT47q0WtBz4NFYNrazUJGYtqz
 A9a9/r9AbpjAyn0B7arrAXX8px03oW2RjQ9+vx4lmy3y964rWA==
X-Google-Smtp-Source: ABdhPJy/gu+PWF/N6886z5Et4emuAhVpgi3HfDgR/mMttEyR2xKzo+NEzusbPEc0/H2IIltJAh5ltDf/6RszMrVxWtU=
X-Received: by 2002:a05:6402:b35:: with SMTP id
 bo21mr17355997edb.52.1605543406598; 
 Mon, 16 Nov 2020 08:16:46 -0800 (PST)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Nov 2020 16:16:35 +0000
Message-ID: <CAFEAcA8OqZe9MYmp=B023bTqatP-KcoGsh_vQ4OZ=a=jh09wcQ@mail.gmail.com>
Subject: iotest 030 still occasionally intermittently failing
To: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just saw this on a test run on the OpenBSD VM build-and-test,
so this test is still intermittently failing...


  TEST    iotest-qcow2: 030 [fail]
QEMU          --
"/home/qemu/qemu-test.h37iBt/build/tests/qemu-iotests/../../qemu-system-aar=
ch64"
-nodefaults -display none -accel qtest -machine virt
QEMU_IMG      --
"/home/qemu/qemu-test.h37iBt/build/tests/qemu-iotests/../../qemu-img"
QEMU_IO       --
"/home/qemu/qemu-test.h37iBt/build/tests/qemu-iotests/../../qemu-io"
--cache writeback --aio threads -f qcow2
QEMU_NBD      --
"/home/qemu/qemu-test.h37iBt/build/tests/qemu-iotests/../../qemu-nbd"
IMGFMT        -- qcow2 (compat=3D1.1)
IMGPROTO      -- file
PLATFORM      -- OpenBSD/amd64 openbsd 6.8
TEST_DIR      -- /home/qemu/qemu-test.h37iBt/build/tests/qemu-iotests/scrat=
ch
SOCK_DIR      -- /tmp/tmp.XpU6JjBMml
SOCKET_SCM_HELPER --

--- /home/qemu/qemu-test.h37iBt/src/tests/qemu-iotests/030.out  Mon
Nov 16 15:33:05 2020
+++ /home/qemu/qemu-test.h37iBt/build/tests/qemu-iotests/030.out.bad
 Mon Nov 16 16:03:42 2020
@@ -1,5 +1,47 @@
-...........................
+WARNING:qemu.machine:qemu received signal 6; command:
"/home/qemu/qemu-test.h37iBt/build/tests/qemu-iotests/../../qemu-system-aar=
ch64
-display none -vga none -chardev
socket,id=3Dmon,path=3D/tmp/tmp.XpU6JjBMml/qemu-42319-monitor.sock -mon
chardev=3Dmon,mode=3Dcontrol -qtest
unix:path=3D/tmp/tmp.XpU6JjBMml/qemu-42319-qtest.sock -accel qtest
-nodefaults -display none -accel qtest -machine virt -drive
if=3Dvirtio,id=3Ddrive0,file=3D/home/qemu/qemu-test.h37iBt/build/tests/qemu=
-iotests/scratch/img-8.img,format=3Dqcow2,cache=3Dwriteback,aio=3Dthreads,b=
acking.backing.backing.backing.backing.backing.backing.backing.node-name=3D=
node0,backing.backing.backing.backing.backing.backing.backing.node-name=3Dn=
ode1,backing.backing.backing.backing.backing.backing.node-name=3Dnode2,back=
ing.backing.backing.backing.backing.node-name=3Dnode3,backing.backing.backi=
ng.backing.node-name=3Dnode4,backing.backing.backing.node-name=3Dnode5,back=
ing.backing.node-name=3Dnode6,backing.node-name=3Dnode7,node-name=3Dnode8"
+............EE..............
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+ERROR: test_stream_commit_2 (__main__.TestParallelOps)
 ----------------------------------------------------------------------
+Traceback (most recent call last):
+  File "030", line 492, in test_stream_commit_2
+    self.assert_no_active_block_jobs()
+  File "/home/qemu/qemu-test.h37iBt/src/tests/qemu-iotests/iotests.py",
line 932, in assert_no_active_block_jobs
+    result =3D self.vm.qmp('query-block-jobs')
+  File "/home/qemu/qemu-test.h37iBt/src/tests/qemu-iotests/../../python/qe=
mu/machine.py",
line 559, in qmp
+    return self._qmp.cmd(cmd, args=3Dqmp_args)
+  File "/home/qemu/qemu-test.h37iBt/src/tests/qemu-iotests/../../python/qe=
mu/qmp.py",
line 278, in cmd
+    return self.cmd_obj(qmp_cmd)
+  File "/home/qemu/qemu-test.h37iBt/src/tests/qemu-iotests/../../python/qe=
mu/qmp.py",
line 259, in cmd_obj
+    raise QMPConnectError("Unexpected empty reply from server")
+qemu.qmp.QMPConnectError: Unexpected empty reply from server
+
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+ERROR: test_stream_commit_2 (__main__.TestParallelOps)
+----------------------------------------------------------------------
+Traceback (most recent call last):
+  File "/home/qemu/qemu-test.h37iBt/src/tests/qemu-iotests/../../python/qe=
mu/machine.py",
line 476, in _do_shutdown
+    self._soft_shutdown(timeout, has_quit)
+  File "/home/qemu/qemu-test.h37iBt/src/tests/qemu-iotests/../../python/qe=
mu/machine.py",
line 456, in _soft_shutdown
+    self._qmp.cmd('quit')
+  File "/home/qemu/qemu-test.h37iBt/src/tests/qemu-iotests/../../python/qe=
mu/qmp.py",
line 278, in cmd
+    return self.cmd_obj(qmp_cmd)
+  File "/home/qemu/qemu-test.h37iBt/src/tests/qemu-iotests/../../python/qe=
mu/qmp.py",
line 256, in cmd_obj
+    self.__sock.sendall(json.dumps(qmp_cmd).encode('utf-8'))
+BrokenPipeError: [Errno 32] Broken pipe
+
+The above exception was the direct cause of the following exception:
+
+Traceback (most recent call last):
+  File "030", line 226, in tearDown
+    self.vm.shutdown()
+  File "/home/qemu/qemu-test.h37iBt/src/tests/qemu-iotests/../../python/qe=
mu/machine.py",
line 506, in shutdown
+    self._do_shutdown(timeout, has_quit)
+  File "/home/qemu/qemu-test.h37iBt/src/tests/qemu-iotests/../../python/qe=
mu/machine.py",
line 479, in _do_shutdown
+    raise AbnormalShutdown("Could not perform graceful shutdown") \
+qemu.machine.AbnormalShutdown: Could not perform graceful shutdown
+
+----------------------------------------------------------------------
 Ran 27 tests

-OK
+FAILED (errors=3D2, skipped=3D1)

thanks
-- PMM

