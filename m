Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4650B4CDDB3
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 21:01:50 +0100 (CET)
Received: from localhost ([::1]:38106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQE7Z-0002wg-AF
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 15:01:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nQDuG-0008Hc-Uz
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 14:48:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nQDuE-0005vC-23
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 14:48:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646423281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OHcLFSysrrLA1OJAnfXf2eY4UUKHr5GLLQb8ddAwMP0=;
 b=XqMkH8t+gIf2gOkDgWJn7EynfRd1cjbmkiRJIyiwv76La69CgOgmoVx9DyCfark9s1ZUQ4
 MPal/TNS8vSw8vrIKSL3EzsPAviYrYjEUKe2KcuNec41+Ek4xyRDAbk79Y8x3JgSvmGFJQ
 uxwGgwH+DESUkE8fxz/Q16opgV/BFPE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-435-JkywVjHyNpCisbqYjyY46g-1; Fri, 04 Mar 2022 14:47:59 -0500
X-MC-Unique: JkywVjHyNpCisbqYjyY46g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01C8C51DC;
 Fri,  4 Mar 2022 19:47:58 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.35.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0FA5C5DF21;
 Fri,  4 Mar 2022 19:47:46 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/5] iotests: add enhanced debugging info to qemu-img
 failures
Date: Fri,  4 Mar 2022 14:47:41 -0500
Message-Id: <20220304194746.486226-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 Eric Blake <eblake@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

V2:=0D
 - Rebase on top of kwolf's latest PR.=0D
 - Adjust tests/graph-changes-while-io in patch 3/5=0D
 - Drop eblake's r-b on 3/5.=0D
=0D
This is secretly V4ish of a series I started in response to Thomas=0D
Huth's encountering a failure in qemu-img because of missing zstd=0D
support. This series changes the qemu_img() function in iotests.py to=0D
one that raises an Exception on non-zero return code by default.=0D
=0D
Alongside this, the Exception object itself is also augmented so that it=0D
prints the stdout/stderr logs to screen if the exception goes unhandled=0D
so that failure cases are very obvious and easy to spot in the middle of=0D
python tracebacks.=0D
=0D
(Test this out yourself: Disable zstd support and then run qcow2 iotest=0D
065 before and after this patchset. It makes a real difference!)=0D
=0D
NOTE: I have another 13-ish patches that go the rest of the way and=0D
ensure that *every* call to qemu-img goes through this new qemu_img()=0D
function, but for the sake of doing the most good in the shortest amount=0D
of time, I am sending just the first 5 patches, and the rest will be=0D
sent later. I think this is a very good series to get in before freeze=0D
so that we have it during the heavy testing season.=0D
=0D
John Snow (5):=0D
  python/utils: add add_visual_margin() text decoration utility=0D
  python/utils: add VerboseProcessError=0D
  iotests: Remove explicit checks for qemu_img() =3D=3D 0=0D
  iotests: make qemu_img raise on non-zero rc by default=0D
  iotests: fortify compare_images() against crashes=0D
=0D
 python/qemu/utils/__init__.py                 | 114 ++++++++++++++++++=0D
 tests/qemu-iotests/163                        |   9 +-=0D
 tests/qemu-iotests/216                        |   6 +-=0D
 tests/qemu-iotests/218                        |   2 +-=0D
 tests/qemu-iotests/224                        |  11 +-=0D
 tests/qemu-iotests/228                        |  12 +-=0D
 tests/qemu-iotests/257                        |  11 +-=0D
 tests/qemu-iotests/258                        |   4 +-=0D
 tests/qemu-iotests/310                        |  14 +--=0D
 tests/qemu-iotests/iotests.py                 |  71 +++++++++--=0D
 tests/qemu-iotests/tests/block-status-cache   |   3 +-=0D
 .../qemu-iotests/tests/graph-changes-while-io |   7 +-=0D
 tests/qemu-iotests/tests/image-fleecing       |   4 +-=0D
 .../tests/mirror-ready-cancel-error           |   6 +-=0D
 tests/qemu-iotests/tests/mirror-top-perms     |   3 +-=0D
 .../tests/remove-bitmap-from-backing          |   8 +-=0D
 .../qemu-iotests/tests/stream-error-on-reset  |   4 +-=0D
 17 files changed, 224 insertions(+), 65 deletions(-)=0D
=0D
--=20=0D
2.34.1=0D
=0D


