Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EB64DD17F
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 00:52:56 +0100 (CET)
Received: from localhost ([::1]:47326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUzvL-0004hU-6U
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 19:52:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nUzsL-0001fE-Su
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 19:49:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nUzsI-0005eM-7u
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 19:49:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647560984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=16udmqim3b6YJ7mbRRANtlBc2z6MU8K/H+DJKgAKeec=;
 b=PL3ENbyt7PAMpQlg33YYMYgsAiKztHwPYGz1S/OoR9OoN91Nz8ELyS2PBH7Um/oaRJE4BX
 gc8JTeyLpra6B5eXA2bBVnT7rlGsX6ACQ+2+JumwRGV3GMCHn3mvgDwBigRS3Pdb8DHGaf
 iGedNgmOpCOWpuvFEGCdGCJLeTGZ2eY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-xQcj8DHyOv-dW6KA9Aw_-w-1; Thu, 17 Mar 2022 19:49:42 -0400
X-MC-Unique: xQcj8DHyOv-dW6KA9Aw_-w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 98883801585;
 Thu, 17 Mar 2022 23:49:42 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.32.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A1A33112C08E;
 Thu, 17 Mar 2022 23:49:37 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/18] iotests: add enhanced debugging info to qemu-img
 failures
Date: Thu, 17 Mar 2022 19:49:19 -0400
Message-Id: <20220317234937.569525-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hiya!=0D
=0D
This series effectively replaces qemu_img_pipe_and_status() with a=0D
rewritten function named qemu_img() that raises an exception on non-zero=0D
return code by default. By the end of the series, every last invocation=0D
of the qemu-img binary ultimately goes through qemu_img().=0D
=0D
The exception that this function raises includes stdout/stderr output=0D
when the traceback is printed in a a little decorated text box so that=0D
it stands out from the jargony Python traceback readout.=0D
=0D
(You can test what this looks like for yourself, or at least you could,=0D
by disabling ztsd support and then running qcow2 iotest 065.)=0D
=0D
Negative tests are still possible in two ways:=0D
=0D
- Passing check=3DFalse to qemu_img, qemu_img_log, or img_info_log=0D
- Catching and handling the CalledProcessError exception at the callsite.=
=0D
=0D
Here's a summary of the changes to help you update any tests you may=0D
have in flight:=0D
=0D
qemu_img()                   =3D> qemu_img().returncode=0D
qemu_img_pipe()              =3D> qemu_img().stdout=0D
qemu_img_pipe_and_status()   =3D> qemu_img()=0D
json.loads(qemu_img_pipe())) =3D> qemu_img_json()=0D
qemu_img_log()               =3D> qemu_img_log()=0D
=0D
v4:=0D
=0D
- Combine both series into one big series again.=0D
=0D
002/18:[0007] [FC] 'python/utils: add VerboseProcessError'=0D
  Added a comment and a temporary var to explain the=0D
  "elif stderr is not None" thing.=0D
  (Kept R-Bs because I live dangerously.)=0D
=0D
006/18:[0014] [FC] 'iotests: add qemu_img_json()'=0D
  Made this wayyyy less stupid. Thanks Hanna.=0D
=0D
010/18:[0010] [FC] 'iotests: add qemu_img_map() function'=0D
  Fixed test output for 211.=0D
=0D
018/18:[down] 'iotests: make qemu_img_log and img_info_log raise on error'=
=0D
  New, enforce a good return code by default for *all*=0D
  qemu-img calls, logged or not.=0D
=0D
John Snow (18):=0D
  python/utils: add add_visual_margin() text decoration utility=0D
  python/utils: add VerboseProcessError=0D
  iotests: Remove explicit checks for qemu_img() =3D=3D 0=0D
  iotests: make qemu_img raise on non-zero rc by default=0D
  iotests: fortify compare_images() against crashes=0D
  iotests: add qemu_img_json()=0D
  iotests: use qemu_img_json() when applicable=0D
  iotests: add qemu_img_info()=0D
  iotests/remove-bitmap-from-backing: use qemu_img_info()=0D
  iotests: add qemu_img_map() function=0D
  iotests: change supports_quorum to use qemu_img=0D
  iotests: replace unchecked calls to qemu_img_pipe()=0D
  iotests/149: Remove qemu_img_pipe() call=0D
  iotests: remove remaining calls to qemu_img_pipe()=0D
  iotests: use qemu_img() in has_working_luks()=0D
  iotests: replace qemu_img_log('create', ...) calls=0D
  iotests: remove qemu_img_pipe_and_status()=0D
  iotests: make qemu_img_log and img_info_log raise on error=0D
=0D
 python/qemu/utils/__init__.py                 | 117 ++++++++++++=0D
 tests/qemu-iotests/041                        |   5 +-=0D
 tests/qemu-iotests/065                        |   7 +-=0D
 tests/qemu-iotests/149                        |   7 +-=0D
 tests/qemu-iotests/149.out                    |  21 ---=0D
 tests/qemu-iotests/163                        |   9 +-=0D
 tests/qemu-iotests/194                        |   4 +-=0D
 tests/qemu-iotests/202                        |   4 +-=0D
 tests/qemu-iotests/203                        |   4 +-=0D
 tests/qemu-iotests/211                        |   6 +-=0D
 tests/qemu-iotests/211.out                    |  10 +-=0D
 tests/qemu-iotests/216                        |   6 +-=0D
 tests/qemu-iotests/218                        |   2 +-=0D
 tests/qemu-iotests/224                        |  11 +-=0D
 tests/qemu-iotests/228                        |  12 +-=0D
 tests/qemu-iotests/234                        |   4 +-=0D
 tests/qemu-iotests/237                        |   3 +-=0D
 tests/qemu-iotests/237.out                    |   3 -=0D
 tests/qemu-iotests/242                        |   7 +-=0D
 tests/qemu-iotests/255                        |   8 +-=0D
 tests/qemu-iotests/255.out                    |   4 -=0D
 tests/qemu-iotests/257                        |  11 +-=0D
 tests/qemu-iotests/258                        |   4 +-=0D
 tests/qemu-iotests/262                        |   2 +-=0D
 tests/qemu-iotests/266                        |   2 +-=0D
 tests/qemu-iotests/274                        |  17 +-=0D
 tests/qemu-iotests/274.out                    |  29 ---=0D
 tests/qemu-iotests/280                        |   2 +-=0D
 tests/qemu-iotests/280.out                    |   1 -=0D
 tests/qemu-iotests/296                        |  12 +-=0D
 tests/qemu-iotests/303                        |   2 +-=0D
 tests/qemu-iotests/310                        |  13 +-=0D
 tests/qemu-iotests/iotests.py                 | 169 +++++++++++++-----=0D
 tests/qemu-iotests/tests/block-status-cache   |  14 +-=0D
 .../qemu-iotests/tests/graph-changes-while-io |   7 +-=0D
 tests/qemu-iotests/tests/image-fleecing       |  10 +-=0D
 .../tests/mirror-ready-cancel-error           |   6 +-=0D
 tests/qemu-iotests/tests/mirror-top-perms     |   3 +-=0D
 .../qemu-iotests/tests/parallels-read-bitmap  |   6 +-=0D
 .../tests/remove-bitmap-from-backing          |  14 +-=0D
 .../qemu-iotests/tests/stream-error-on-reset  |   4 +-=0D
 41 files changed, 353 insertions(+), 229 deletions(-)=0D
=0D
--=20=0D
2.34.1=0D
=0D


