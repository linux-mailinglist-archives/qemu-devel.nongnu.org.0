Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0E34BED49
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 23:37:27 +0100 (CET)
Received: from localhost ([::1]:52630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMHJ8-0002EA-GI
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 17:37:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nMHGB-0007na-De
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 17:34:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nMHG8-00086V-EZ
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 17:34:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645482859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=X9pF3fnTbubUIhXiS0TOIDFpNvoSFcCxgUvIu4vrtds=;
 b=g390DaXEGqweE0D4/sx8NOsqSLhex2zfyFU8jwb3uDEAlyr2doExCa9/O6FUCIxNW7K087
 kNLgyrl0UAeeoeQEiGHdssK/49MxYgvq/1mlVmAC6uoFsHwL2cFUasRXGsFhamx1AxzIA7
 DIVxOE/+F5PJ79kBlL1sKWc1tG3d26I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-532-uhQXD9IvN06_XJ9QXdn-IQ-1; Mon, 21 Feb 2022 17:34:18 -0500
X-MC-Unique: uhQXD9IvN06_XJ9QXdn-IQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BAA62F4C;
 Mon, 21 Feb 2022 22:34:17 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2C2BD1038AAF;
 Mon, 21 Feb 2022 22:34:14 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/18] iotests: add detailed tracebacks to qemu_img()
 failures
Date: Mon, 21 Feb 2022 17:33:55 -0500
Message-Id: <20220221223413.2123003-1-jsnow@redhat.com>
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, Eric Blake <eblake@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series does two things:=0D
=0D
(1) Adds more detailed information to terminal output when qemu-img=0D
    crashes or returns with a non-zero exit code=0D
=0D
(2) Ensures that every last call to qemu-img made in the iotest test=0D
    suite either returns a zero, *or* has its output logged.=0D
=0D
This is accomplished by:=0D
=0D
- Adding a new subprocess.CalledProcessError exception type that's more=0D
  verbose than the standard, built-in one=0D
=0D
- Rewriting the qemu_img() function to utilize that new Exception=0D
=0D
- Modifying every last iotest helper that invokes qemu-img to use=0D
  qemu_img() or a derivative thereof.=0D
=0D
This patchset was inspired by Thomas Huth noticing that iotest 065 would=0D
crash in a way that was largely silent, except for async QMP traces when=0D
the VM failed to start. The root cause in that case is that iotest 065=0D
did not tolerate zstd support being compiled out of QEMU, so the=0D
qemu-img command fails - silently. (And subsequent test actions would=0D
then explode nastily with confusing or misleading error messages.)=0D
=0D
So, broadly, I rewrote qemu_img() to be a lot stricter by default, and=0D
then rebased every other helper function that called into the qemu-img=0D
process to use qemu_img().=0D
=0D
RFC:=0D
=0D
- 'enboxify()' text decoration does not support unicode too well. I=0D
  think it's important to have some text decoration, but I haven't=0D
  gotten around to making it smarter. I might remove it for something=0D
  simpler to avoid having to learn more about unicode.=0D
=0D
- At this point, every last qemu-img call is audited, but I did not=0D
  extend the same treatment to qemu-io, qemu-nbd, etc. I intend to,=0D
  later. Eventually, I plan to offer something like 'qemu_tool()' as a=0D
  replacement for 'qemu_tool_pipe_and_status()', and qemu_img() will=0D
  become a thin wrapper around qemu_tool().=0D
=0D
V2:=0D
 - Ensure *all* calls to qemu-img go through qemu_img()=0D
 - Raise VerboseProcessError on negative return code,=0D
   even when check=3DFalse=0D
 - Check logging status for logged variants and revert to=0D
   Exceptions when logging is off!=0D
=0D
John Snow (18):=0D
  python/utils: add enboxify() text decoration utility=0D
  iotests: add VerboseProcessError=0D
  iotests: Remove explicit checks for qemu_img() =3D=3D 0=0D
  iotests: make qemu_img raise on non-zero rc by default=0D
  iotests: fortify compare_images() against crashes=0D
  iotests: add qemu_img_json()=0D
  iotests: use qemu_img_json() when applicable=0D
  iotests: add qemu_img_info()=0D
  iotests: remove-bitmap-from-backing: use qemu_img_info()=0D
  iotests: add qemu_img_map() function=0D
  iotests: change supports_quorum to use qemu_img=0D
  iotests: replace unchecked calls to qemu_img_pipe()=0D
  iotests: remove external calls to qemu_img_pipe()=0D
  iotests: move has_working_luks onto qemu_img()=0D
  iotests: remove qemu_img_log('create', ...) calls=0D
  iotests: remove qemu_img_pipe()=0D
  iotests: make qemu_img_log() check log level=0D
  iotests: reimplement img_info_log in terms of qemu_img_log=0D
=0D
 python/qemu/utils/__init__.py                 |  58 +++++=0D
 tests/qemu-iotests/041                        |   5 +-=0D
 tests/qemu-iotests/065                        |   7 +-=0D
 tests/qemu-iotests/149                        |   8 +-=0D
 tests/qemu-iotests/163                        |   9 +-=0D
 tests/qemu-iotests/194                        |   4 +-=0D
 tests/qemu-iotests/202                        |   4 +-=0D
 tests/qemu-iotests/203                        |   4 +-=0D
 tests/qemu-iotests/211                        |   6 +-=0D
 tests/qemu-iotests/216                        |   6 +-=0D
 tests/qemu-iotests/218                        |   2 +-=0D
 tests/qemu-iotests/224                        |  11 +-=0D
 tests/qemu-iotests/228                        |  12 +-=0D
 tests/qemu-iotests/234                        |   4 +-=0D
 tests/qemu-iotests/237                        |   3 +-=0D
 tests/qemu-iotests/237.out                    |   3 -=0D
 tests/qemu-iotests/242                        |   5 +-=0D
 tests/qemu-iotests/255                        |   8 +-=0D
 tests/qemu-iotests/255.out                    |   4 -=0D
 tests/qemu-iotests/257                        |  11 +-=0D
 tests/qemu-iotests/258                        |   4 +-=0D
 tests/qemu-iotests/262                        |   2 +-=0D
 tests/qemu-iotests/274                        |  17 +-=0D
 tests/qemu-iotests/274.out                    |  29 ---=0D
 tests/qemu-iotests/280                        |   2 +-=0D
 tests/qemu-iotests/280.out                    |   1 -=0D
 tests/qemu-iotests/296                        |  13 +-=0D
 tests/qemu-iotests/303                        |   2 +-=0D
 tests/qemu-iotests/310                        |  14 +-=0D
 tests/qemu-iotests/iotests.py                 | 217 ++++++++++++++----=0D
 tests/qemu-iotests/tests/block-status-cache   |  14 +-=0D
 tests/qemu-iotests/tests/image-fleecing       |   4 +-=0D
 .../tests/mirror-ready-cancel-error           |   6 +-=0D
 tests/qemu-iotests/tests/mirror-top-perms     |   3 +-=0D
 .../qemu-iotests/tests/parallels-read-bitmap  |   6 +-=0D
 .../tests/remove-bitmap-from-backing          |  14 +-=0D
 .../qemu-iotests/tests/stream-error-on-reset  |   4 +-=0D
 37 files changed, 334 insertions(+), 192 deletions(-)=0D
=0D
--=20=0D
2.34.1=0D
=0D


