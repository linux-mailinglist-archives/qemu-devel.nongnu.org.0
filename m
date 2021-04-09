Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 047163599CF
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 11:49:41 +0200 (CEST)
Received: from localhost ([::1]:44444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUnlk-00039l-4E
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 05:49:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lUngp-00084j-Ri
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 05:44:37 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:39517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lUngk-0006lu-Ph
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 05:44:34 -0400
Received: by mail-ej1-x634.google.com with SMTP id v6so6401257ejo.6
 for <qemu-devel@nongnu.org>; Fri, 09 Apr 2021 02:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=t3fjnnk6UHRsS0qD1HaZeXepXvJOay+lswgYq9NUuk8=;
 b=S6clzZl0dOiLfRjDSj2ZWgXpTXcBFGZAoOYUKSZBJ3+l9ko/yOv2Lhu0buNcZ0Kjkb
 mUvjXUhjKgrFgfqUMF5sbvuvqr7s0Qfli9cfJ5pZetVSNSvbhrpaUAK9sEhtlVvYyAap
 yKQHuDq5tf5Hxz1/P7IjonzkZP+pkEN4pVWAULu9X4W5qHVCXsi9HkbppKvpa6LIVISs
 6w540FlbgRE07Jw20D4oe5/PiXqX5Rk+JNASjEV9p1Gq71xlvdr/8ZqyF1q2s818pB9n
 6bCENj0lGpDmJfVWUChABUG24Rc0PxCDkDDl7jP7zsWGNMO3sxxvfymo+Ws4X6kZPFZe
 JPwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=t3fjnnk6UHRsS0qD1HaZeXepXvJOay+lswgYq9NUuk8=;
 b=rpFsYWQgOILiPmBe22exZYcOd7b2JUqYBpW0XPMaFi0E7MEf4ir9I3CL7uoVtGKI0/
 2S3yUQOIhFvDEDGgvNTJl7LogB+e2cebRr9JWzN9yIvxYviebMYum+LBZueOmMHDvw6W
 v/KGT75FYrZ92qpnyxHLDVxCz07zx+mgETmB06kUXP+Gq8Lj+5VAxB4LJ2tyxGLM8CQH
 7qZbal3wPzsNjBy5RK6hs1vXK8RTQeY/2qoORP3bSSMGsM34iWk9fEBMrfzDRJtiU0Ey
 zKGbAY/LsuWKSRrQv7KTtKyUy/Z8vozPgoSJ99xJaZYUcVJNWyjSQhVEVvx++0WD7UvL
 xtnA==
X-Gm-Message-State: AOAM5328/PfaT8K714jokDLMQ0Hrdotecy7mkJmjNeGw6uNJaOUrXZcz
 orFNG6JNjWrvtA3RSzRBuSNcH25rilbOHBYYThTrDlbT19+/F8GA
X-Google-Smtp-Source: ABdhPJzr0kw57e574h/ilk7XrSXOba5llSL1JwbOy4rdoBvWH3qDygOfT6BPvjHhW9avxSks29bLBmYytTpEhSXqspc=
X-Received: by 2002:a17:906:8a65:: with SMTP id
 hy5mr15571349ejc.250.1617961468287; 
 Fri, 09 Apr 2021 02:44:28 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 9 Apr 2021 10:43:47 +0100
Message-ID: <CAFEAcA_-ARyPM0gB2Y_FKdUp9DYRNbz1GFU1AzFE9UZgjWNazQ@mail.gmail.com>
Subject: iotests 041 intermittent failure (netbsd)
To: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just hit this (presumably intermittent) 041 failure running
the build-and-test on the tests/vm netbsd setup. Does it look
familiar to anybody?


  TEST   iotest-qcow2: 041 [fail]
QEMU          --
"/home/qemu/qemu-test.bx6kgg/build/tests/qemu-iotests/../../qemu-system-aarch64"
-nodefaults -display none -accel qtest -machine virt
QEMU_IMG      --
"/home/qemu/qemu-test.bx6kgg/build/tests/qemu-iotests/../../qemu-img"
QEMU_IO       --
"/home/qemu/qemu-test.bx6kgg/build/tests/qemu-iotests/../../qemu-io"
--cache writeback --aio threads -f qcow2
QEMU_NBD      --
"/home/qemu/qemu-test.bx6kgg/build/tests/qemu-iotests/../../qemu-nbd"
IMGFMT        -- qcow2
IMGPROTO      -- file
PLATFORM      -- NetBSD/amd64 localhost 9.1
TEST_DIR      -- /home/qemu/qemu-test.bx6kgg/build/tests/qemu-iotests/scratch
SOCK_DIR      -- /tmp/tmp5wf5bgkm
SOCKET_SCM_HELPER --
--- /home/qemu/qemu-test.bx6kgg/src/tests/qemu-iotests/041.out
+++ 041.out.bad
@@ -1,5 +1,29 @@
-...........................................................................................................
+..............................................................................E............................
+======================================================================
+ERROR: test_pause (__main__.TestSingleDrive)
+----------------------------------------------------------------------
+Traceback (most recent call last):
+  File "/home/qemu/qemu-test.bx6kgg/src/tests/qemu-iotests/041", line
111, in test_pause
+    self.pause_job('drive0')
+  File "/home/qemu/qemu-test.bx6kgg/src/tests/qemu-iotests/iotests.py",
line 1064, in pause_job
+    return self.pause_wait(job_id)
+  File "/home/qemu/qemu-test.bx6kgg/src/tests/qemu-iotests/iotests.py",
line 1050, in pause_wait
+    result = self.vm.qmp('query-block-jobs')
+  File "/home/qemu/qemu-test.bx6kgg/src/tests/qemu-iotests/../../python/qemu/machine.py",
line 560, in qmp
fcntl(): Invalid argument
+    return self._qmp.cmd(cmd, args=qmp_args)
+  File "/home/qemu/qemu-test.bx6kgg/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 278, in cmd
+    return self.cmd_obj(qmp_cmd)
+  File "/home/qemu/qemu-test.bx6kgg/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 257, in cmd_obj
+    resp = self.__json_read()
+  File "/home/qemu/qemu-test.bx6kgg/src/tests/qemu-iotests/../../python/qemu/qmp.py",
line 140, in __json_read
+    data = self.__sockfile.readline()
+  File "/usr/pkg/lib/python3.7/socket.py", line 589, in readinto
+    return self._sock.recv_into(b)
+  File "/home/qemu/qemu-test.bx6kgg/src/tests/qemu-iotests/iotests.py",
line 482, in timeout
+    raise Exception(self.errmsg)
+Exception: Timeout waiting for job to pause
+
 ----------------------------------------------------------------------
 Ran 107 tests

-OK
+FAILED (errors=1)


thanks
-- PMM

