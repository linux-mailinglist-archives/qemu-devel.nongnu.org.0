Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 163964B7A7C
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 23:33:31 +0100 (CET)
Received: from localhost ([::1]:39354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK6O2-00016k-6N
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 17:33:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nK60Q-0003sI-EP
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 17:09:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nK60M-0006Ka-59
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 17:09:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644962941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DTRpA/ppGhUFavydcyM2vZn5uJnVQBZZ/m3IQC2wWVM=;
 b=ewLmbj/6qls7z1Hl2HUtfV8jsc7XaRnRmMmqaLLmq8C6ddMnZo11fv4a8Oftcux/j3AzJw
 OTIRXKc0rKQozYgi8rsr1eM527tbiIQTIq7S15qodx+fXXNVrr/rZD3vZudYwJ3fTECif7
 K2Ymhhj+C/ScaPXv32kkbpxyflFs5wo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-322-6Fb3FtwcMmiY04TIpzcZKA-1; Tue, 15 Feb 2022 17:08:58 -0500
X-MC-Unique: 6Fb3FtwcMmiY04TIpzcZKA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7340483DD24;
 Tue, 15 Feb 2022 22:08:57 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 42E601059A7A;
 Tue, 15 Feb 2022 22:08:54 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] iotests: add detailed tracebacks to qemu_img() failures
Date: Tue, 15 Feb 2022 17:08:49 -0500
Message-Id: <20220215220853.4179173-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It came to my attention via th_huth that iotest 065 would crash in a way=0D
that was largely silent, except for the async QMP traces. The real cause=0D
turns out to be that iotest 065 does not support ztsd being compiled out=0D
of the build, so the qemu-img command fails ... silently.=0D
(And then everything after it explodes nastily.)=0D
=0D
Almost every user of iotests.qemu_img() does not check the return code,=0D
a few assert it to be zero, and exactly one user asserts it to be=0D
non-zero. qemu_img() is already throwing away process output, too, so no=0D
callers are using that information, either.=0D
=0D
Therefore: add an Exception to qemu_img(), with some zazz.=0D
=0D
RFC: I didn't attempt to clean up the other dozen function helpers we=0D
have. It's possible we can unify and consolidate cases a bit, but I=0D
wanted to test the waters with a smaller...ish incision first. qemu_io=0D
and qemu_nbd are candidates for this treatment, and using the same=0D
terminal decorations for the VMLaunchError in machine.py is also worth=0D
looking into.=0D
=0D
To see this in action, you could configure your QEMU to omit zstd=0D
support and then run ./check -qcow2 065. It'd look something like below:=0D
=0D
After:=0D
=0D
065   fail       [16:26:17] [16:26:18]   0.3s   (last: 0.4s)  failed, exit =
status 1=0D
--- /home/jsnow/src/qemu/tests/qemu-iotests/065.out=0D
+++ 065.out.bad=0D
@@ -1,5 +1,64 @@=0D
-........=0D
+....EEE.=0D
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0D
+ERROR: test_qmp (__main__.TestQCow3LazyQMP)=0D
+----------------------------------------------------------------------=0D
+Traceback (most recent call last):=0D
+  File "/home/jsnow/src/qemu/tests/qemu-iotests/065", line 74, in setUp=0D
+    self.TestImageInfoSpecific.setUp(self)=0D
+  File "/home/jsnow/src/qemu/tests/qemu-iotests/065", line 38, in setUp=0D
+    qemu_img('create', '-f', iotests.imgfmt, '-o', self.img_options,=0D
+  File "/home/jsnow/src/qemu/tests/qemu-iotests/iotests.py", line 289, in =
qemu_img=0D
+    raise VerboseProcessError(=0D
+iotests.VerboseProcessError: Command '['/home/jsnow/src/qemu/bin/git/tests=
/qemu-iotests/../../qemu-img', 'create', '-f', 'qcow2', '-o', 'compat=3D1.1=
,lazy_refcounts=3Don,compression_type=3Dzstd', '/home/jsnow/src/qemu/bin/gi=
t/tests/qemu-iotests/scratch/test.img', '128K']' returned non-zero exit sta=
tus 1.=0D
+  =E2=94=8F=E2=94=81 output =E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=93=0D
+  =E2=94=83 Formatting                                                    =
             =E2=94=83=0D
+  =E2=94=83 '/home/jsnow/src/qemu/bin/git/tests/qemu-iotests/scratch/test.=
img',        =E2=94=83=0D
+  =E2=94=83 fmt=3Dqcow2 cluster_size=3D65536 extended_l2=3Doff compression=
_type=3Dzstd         =E2=94=83=0D
+  =E2=94=83 size=3D131072 compat=3D1.1 lazy_refcounts=3Don refcount_bits=
=3D16                  =E2=94=83=0D
+  =E2=94=83 qemu-img:                                                     =
             =E2=94=83=0D
+  =E2=94=83 /home/jsnow/src/qemu/bin/git/tests/qemu-iotests/scratch/test.i=
mg:          =E2=94=83=0D
+  =E2=94=83 Parameter 'compression-type' does not accept value 'zstd'     =
             =E2=94=83=0D
+  =E2=94=97=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=9B=0D
+=0D
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0D
+ERROR: test_human (__main__.TestQCow3NotLazy)=0D
+----------------------------------------------------------------------=0D
+Traceback (most recent call last):=0D
+  File "/home/jsnow/src/qemu/tests/qemu-iotests/065", line 38, in setUp=0D
+    qemu_img('create', '-f', iotests.imgfmt, '-o', self.img_options,=0D
+  File "/home/jsnow/src/qemu/tests/qemu-iotests/iotests.py", line 289, in =
qemu_img=0D
+    raise VerboseProcessError(=0D
+iotests.VerboseProcessError: Command '['/home/jsnow/src/qemu/bin/git/tests=
/qemu-iotests/../../qemu-img', 'create', '-f', 'qcow2', '-o', 'compat=3D1.1=
,lazy_refcounts=3Doff,compression_type=3Dzstd', '/home/jsnow/src/qemu/bin/g=
it/tests/qemu-iotests/scratch/test.img', '128K']' returned non-zero exit st=
atus 1.=0D
+  =E2=94=8F=E2=94=81 output =E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=93=0D
+  =E2=94=83 Formatting                                                    =
             =E2=94=83=0D
+  =E2=94=83 '/home/jsnow/src/qemu/bin/git/tests/qemu-iotests/scratch/test.=
img',        =E2=94=83=0D
+  =E2=94=83 fmt=3Dqcow2 cluster_size=3D65536 extended_l2=3Doff compression=
_type=3Dzstd         =E2=94=83=0D
+  =E2=94=83 size=3D131072 compat=3D1.1 lazy_refcounts=3Doff refcount_bits=
=3D16                 =E2=94=83=0D
+  =E2=94=83 qemu-img:                                                     =
             =E2=94=83=0D
+  =E2=94=83 /home/jsnow/src/qemu/bin/git/tests/qemu-iotests/scratch/test.i=
mg:          =E2=94=83=0D
+  =E2=94=83 Parameter 'compression-type' does not accept value 'zstd'     =
             =E2=94=83=0D
+  =E2=94=97=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=9B=0D
+=0D
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0D
+ERROR: test_json (__main__.TestQCow3NotLazy)=0D
+----------------------------------------------------------------------=0D
+Traceback (most recent call last):=0D
+  File "/home/jsnow/src/qemu/tests/qemu-iotests/065", line 38, in setUp=0D
+    qemu_img('create', '-f', iotests.imgfmt, '-o', self.img_options,=0D
+  File "/home/jsnow/src/qemu/tests/qemu-iotests/iotests.py", line 289, in =
qemu_img=0D
+    raise VerboseProcessError(=0D
+iotests.VerboseProcessError: Command '['/home/jsnow/src/qemu/bin/git/tests=
/qemu-iotests/../../qemu-img', 'create', '-f', 'qcow2', '-o', 'compat=3D1.1=
,lazy_refcounts=3Doff,compression_type=3Dzstd', '/home/jsnow/src/qemu/bin/g=
it/tests/qemu-iotests/scratch/test.img', '128K']' returned non-zero exit st=
atus 1.=0D
+  =E2=94=8F=E2=94=81 output =E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=93=0D
+  =E2=94=83 Formatting                                                    =
             =E2=94=83=0D
+  =E2=94=83 '/home/jsnow/src/qemu/bin/git/tests/qemu-iotests/scratch/test.=
img',        =E2=94=83=0D
+  =E2=94=83 fmt=3Dqcow2 cluster_size=3D65536 extended_l2=3Doff compression=
_type=3Dzstd         =E2=94=83=0D
+  =E2=94=83 size=3D131072 compat=3D1.1 lazy_refcounts=3Doff refcount_bits=
=3D16                 =E2=94=83=0D
+  =E2=94=83 qemu-img:                                                     =
             =E2=94=83=0D
+  =E2=94=83 /home/jsnow/src/qemu/bin/git/tests/qemu-iotests/scratch/test.i=
mg:          =E2=94=83=0D
+  =E2=94=83 Parameter 'compression-type' does not accept value 'zstd'     =
             =E2=94=83=0D
+  =E2=94=97=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=9B=0D
+=0D
 ----------------------------------------------------------------------=0D
 Ran 8 tests=0D
=0D
-OK=0D
+FAILED (errors=3D3)=0D
Failures: 065=0D
Failed 1 of 1 iotests=0D
=0D
Before:=0D
=0D
065   fail       [16:24:37] [16:24:37]   0.3s   (last: 0.4s)  failed, exit =
status 1=0D
--- /home/jsnow/src/qemu/tests/qemu-iotests/065.out=0D
+++ 065.out.bad=0D
@@ -1,5 +1,102 @@=0D
-........=0D
+....ERROR:qemu.aqmp.qmp_client.qemu-4002852:Failed to receive Greeting: EO=
FError=0D
+ERROR:qemu.aqmp.qmp_client.qemu-4002852:Failed to establish session: EOFEr=
ror=0D
+EEEEE.=0D
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0D
+ERROR: test_qmp (__main__.TestQCow3LazyQMP)=0D
+----------------------------------------------------------------------=0D
+Traceback (most recent call last):=0D
+  File "/home/jsnow/src/qemu/python/qemu/aqmp/protocol.py", line 379, in _=
new_session=0D
+    await self._establish_session()=0D
+  File "/home/jsnow/src/qemu/python/qemu/aqmp/qmp_client.py", line 250, in=
 _establish_session=0D
+    self._greeting =3D await self._get_greeting()=0D
+  File "/home/jsnow/src/qemu/python/qemu/aqmp/qmp_client.py", line 270, in=
 _get_greeting=0D
+    msg =3D await self._recv()=0D
+  File "/home/jsnow/src/qemu/python/qemu/aqmp/protocol.py", line 909, in _=
recv=0D
+    message =3D await self._do_recv()=0D
+  File "/home/jsnow/src/qemu/python/qemu/aqmp/qmp_client.py", line 402, in=
 _do_recv=0D
+    msg_bytes =3D await self._readline()=0D
+  File "/home/jsnow/src/qemu/python/qemu/aqmp/protocol.py", line 877, in _=
readline=0D
+    raise EOFError=0D
+EOFError=0D
+=0D
+The above exception was the direct cause of the following exception:=0D
+=0D
+Traceback (most recent call last):=0D
+  File "/home/jsnow/src/qemu/python/qemu/machine/machine.py", line 428, in=
 launch=0D
+    self._launch()=0D
+  File "/home/jsnow/src/qemu/python/qemu/machine/machine.py", line 467, in=
 _launch=0D
+    self._post_launch()=0D
+  File "/home/jsnow/src/qemu/python/qemu/machine/qtest.py", line 147, in _=
post_launch=0D
+    super()._post_launch()=0D
+  File "/home/jsnow/src/qemu/python/qemu/machine/machine.py", line 369, in=
 _post_launch=0D
+    self._qmp.accept(self._qmp_timer)=0D
+  File "/home/jsnow/src/qemu/python/qemu/aqmp/legacy.py", line 93, in acce=
pt=0D
+    self._sync(=0D
+  File "/home/jsnow/src/qemu/python/qemu/aqmp/legacy.py", line 67, in _syn=
c=0D
+    return self._aloop.run_until_complete(=0D
+  File "/usr/lib64/python3.9/asyncio/base_events.py", line 642, in run_unt=
il_complete=0D
+    return future.result()=0D
+  File "/usr/lib64/python3.9/asyncio/tasks.py", line 479, in wait_for=0D
+    return fut.result()=0D
+  File "/home/jsnow/src/qemu/python/qemu/aqmp/protocol.py", line 282, in a=
ccept=0D
+    await self._new_session(address, ssl, accept=3DTrue)=0D
+  File "/home/jsnow/src/qemu/python/qemu/aqmp/protocol.py", line 398, in _=
new_session=0D
+    raise ConnectError(emsg, err) from err=0D
+qemu.aqmp.protocol.ConnectError: Failed to establish session: EOFError=0D
+=0D
+The above exception was the direct cause of the following exception:=0D
+=0D
+Traceback (most recent call last):=0D
+  File "/home/jsnow/src/qemu/tests/qemu-iotests/065", line 76, in setUp=0D
+    self.vm.launch()=0D
+  File "/home/jsnow/src/qemu/python/qemu/machine/machine.py", line 441, in=
 launch=0D
+    raise VMLaunchFailure(=0D
+qemu.machine.machine.VMLaunchFailure: ConnectError: Failed to establish se=
ssion: EOFError=0D
+=09Exit code: 1=0D
+=09Command: /home/jsnow/src/qemu/bin/git/tests/qemu-iotests/../../qemu-sys=
tem-x86_64 -display none -vga none -chardev socket,id=3Dmon,path=3D/tmp/tmp=
96jl1ds7/qemu-4002852-monitor.sock -mon chardev=3Dmon,mode=3Dcontrol -qtest=
 unix:path=3D/tmp/tmp96jl1ds7/qemu-4002852-qtest.sock -accel qtest -nodefau=
lts -display none -accel qtest -drive if=3Dvirtio,id=3Ddrive0,file=3D/home/=
jsnow/src/qemu/bin/git/tests/qemu-iotests/scratch/test.img,format=3Dqcow2,c=
ache=3Dwriteback,aio=3Dthreads,lazy-refcounts=3Doff=0D
+=09Output: qemu-system-x86_64: -drive if=3Dvirtio,id=3Ddrive0,file=3D/home=
/jsnow/src/qemu/bin/git/tests/qemu-iotests/scratch/test.img,format=3Dqcow2,=
cache=3Dwriteback,aio=3Dthreads,lazy-refcounts=3Doff: Could not open '/home=
/jsnow/src/qemu/bin/git/tests/qemu-iotests/scratch/test.img': No such file =
or directory=0D
+=0D
+=0D
+=0D
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0D
+ERROR: test_human (__main__.TestQCow3NotLazy)=0D
+----------------------------------------------------------------------=0D
+Traceback (most recent call last):=0D
+  File "/home/jsnow/src/qemu/tests/qemu-iotests/065", line 59, in test_hum=
an=0D
+    data =3D data[(data.index('Format specific information:') + 1)=0D
+ValueError: 'Format specific information:' is not in list=0D
+=0D
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0D
+ERROR: test_human (__main__.TestQCow3NotLazy)=0D
+----------------------------------------------------------------------=0D
+Traceback (most recent call last):=0D
+  File "/home/jsnow/src/qemu/tests/qemu-iotests/065", line 42, in tearDown=
=0D
+    os.remove(test_img)=0D
+FileNotFoundError: [Errno 2] No such file or directory: '/home/jsnow/src/q=
emu/bin/git/tests/qemu-iotests/scratch/test.img'=0D
+=0D
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0D
+ERROR: test_json (__main__.TestQCow3NotLazy)=0D
+----------------------------------------------------------------------=0D
+Traceback (most recent call last):=0D
+  File "/home/jsnow/src/qemu/tests/qemu-iotests/065", line 52, in test_jso=
n=0D
+    data =3D json.loads(qemu_img_pipe('info', '--output=3Djson', test_img)=
)=0D
+  File "/usr/lib64/python3.9/json/__init__.py", line 346, in loads=0D
+    return _default_decoder.decode(s)=0D
+  File "/usr/lib64/python3.9/json/decoder.py", line 337, in decode=0D
+    obj, end =3D self.raw_decode(s, idx=3D_w(s, 0).end())=0D
+  File "/usr/lib64/python3.9/json/decoder.py", line 355, in raw_decode=0D
+    raise JSONDecodeError("Expecting value", s, err.value) from None=0D
+json.decoder.JSONDecodeError: Expecting value: line 1 column 1 (char 0)=0D
+=0D
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0D
+ERROR: test_json (__main__.TestQCow3NotLazy)=0D
+----------------------------------------------------------------------=0D
+Traceback (most recent call last):=0D
+  File "/home/jsnow/src/qemu/tests/qemu-iotests/065", line 42, in tearDown=
=0D
+    os.remove(test_img)=0D
+FileNotFoundError: [Errno 2] No such file or directory: '/home/jsnow/src/q=
emu/bin/git/tests/qemu-iotests/scratch/test.img'=0D
+=0D
 ----------------------------------------------------------------------=0D
 Ran 8 tests=0D
=0D
-OK=0D
+FAILED (errors=3D5)=0D
Failures: 065=0D
Failed 1 of 1 iotests=0D
=0D
John Snow (4):=0D
  python/utils: add enboxify() text decoration utility=0D
  iotests: add VerboseProcessError=0D
  iotests: Remove explicit checks for qemu_img() =3D=3D 0=0D
  iotests: make qemu_img raise on non-zero rc by default=0D
=0D
 python/qemu/utils/__init__.py                 | 58 +++++++++++++=0D
 tests/qemu-iotests/163                        |  9 +-=0D
 tests/qemu-iotests/216                        |  6 +-=0D
 tests/qemu-iotests/218                        |  2 +-=0D
 tests/qemu-iotests/224                        | 11 ++-=0D
 tests/qemu-iotests/228                        | 12 +--=0D
 tests/qemu-iotests/257                        | 11 +--=0D
 tests/qemu-iotests/258                        |  4 +-=0D
 tests/qemu-iotests/310                        | 14 +--=0D
 tests/qemu-iotests/iotests.py                 | 87 +++++++++++++++++--=0D
 tests/qemu-iotests/tests/block-status-cache   |  3 +-=0D
 tests/qemu-iotests/tests/image-fleecing       |  4 +-=0D
 .../tests/mirror-ready-cancel-error           |  6 +-=0D
 tests/qemu-iotests/tests/mirror-top-perms     |  3 +-=0D
 .../tests/remove-bitmap-from-backing          |  8 +-=0D
 .../qemu-iotests/tests/stream-error-on-reset  |  4 +-=0D
 16 files changed, 185 insertions(+), 57 deletions(-)=0D
=0D
--=20=0D
2.34.1=0D
=0D


