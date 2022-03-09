Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 859634D2649
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 04:56:06 +0100 (CET)
Received: from localhost ([::1]:49136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRnQj-00052g-8B
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 22:56:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nRnP8-0002D9-Kh
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 22:54:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nRnP6-0002sR-BS
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 22:54:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646798063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=IK5Wl9iJWuRwkmlSPBLCrau0b7A1vPVG+Cb+m2NvaYw=;
 b=d8v5bcP7otSXlirXWCUqZF3KV6scAq6x+1SCISwLvMAZP3V1gKF7tz7vnPC8UZb0cyed5B
 u+4AfwXMayUyCJYMiVyIyddt3KoUhnREEd0ZllaBaEIRWiLjoloV0S99iSJ1Xr88UqNMWw
 F0gfum4hrAHJHqXOMNIRgP7vUoAejHo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-M5ABm1STObKsfykm5mD_PA-1; Tue, 08 Mar 2022 22:54:20 -0500
X-MC-Unique: M5ABm1STObKsfykm5mD_PA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 830E91006AA5;
 Wed,  9 Mar 2022 03:54:19 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.233])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 87A0A6C180;
 Wed,  9 Mar 2022 03:54:08 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/14] iotests: ensure all qemu-img calls are either checked
 or logged
Date: Tue,  8 Mar 2022 22:53:53 -0500
Message-Id: <20220309035407.1848654-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based-On: 20220308015728.1269649-1-jsnow@redhat.com=0D
=0D
Hi, this series ensures all calls to qemu-img ultimately go through=0D
qemu_img(). After the previous series, qemu_img() is a function that=0D
defaults to raising a VerboseProcessError exception when qemu-img=0D
returns a non-zero exit code.=0D
=0D
After this series, all qemu-img invocations from the iotests suite are=0D
guaranteed to go through either qemu_img_log(), which allows non-zero=0D
exit codes (but logs its output), or qemu_img().=0D
=0D
Some callsites manually disable the error checking with check=3DFalse,=0D
which is a good visual reminder directly at the callsite that additional=0D
verification must be performed. The callsites utilizing this are very=0D
few and far between.=0D
=0D
The VerboseProcessError exception will print the command line, return=0D
code, and all console output to the terminal if it goes unhandled. In=0D
effect, all non-logging calls to qemu-img are now guaranteed to print=0D
detailed failure information to the terminal on any unanticipated=0D
behavior.=0D
=0D
(Even logging calls will still raise this exception if the exit code was=0D
negative, so you get all of the same failure output whenever qemu-img=0D
crashes *anywhere* in iotests now.)=0D
=0D
As a result of this change, some of the helpers change. Here's a summary=0D
of the changes between the last series and this one:=0D
=0D
qemu_img()                   =3D> qemu_img().returncode=0D
qemu_img_pipe()              =3D> qemu_img().stdout=0D
qemu_img_pipe_and_status()   =3D> qemu_img()=0D
json.loads(qemu_img_pipe())) =3D> qemu_img_json()=0D
qemu_img_log()               =3D> qemu_img_log()=0D
=0D
John Snow (14):=0D
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
  iotests: make qemu_img_log() check log level=0D
  iotests: make img_info_log() call qemu_img_log()=0D
=0D
 tests/qemu-iotests/041                        |   5 +-=0D
 tests/qemu-iotests/065                        |   7 +-=0D
 tests/qemu-iotests/149                        |   7 +-=0D
 tests/qemu-iotests/149.out                    |  21 ---=0D
 tests/qemu-iotests/194                        |   4 +-=0D
 tests/qemu-iotests/202                        |   4 +-=0D
 tests/qemu-iotests/203                        |   4 +-=0D
 tests/qemu-iotests/211                        |   6 +-=0D
 tests/qemu-iotests/234                        |   4 +-=0D
 tests/qemu-iotests/237                        |   3 +-=0D
 tests/qemu-iotests/237.out                    |   3 -=0D
 tests/qemu-iotests/242                        |   5 +-=0D
 tests/qemu-iotests/255                        |   8 +-=0D
 tests/qemu-iotests/255.out                    |   4 -=0D
 tests/qemu-iotests/262                        |   2 +-=0D
 tests/qemu-iotests/274                        |  17 ++-=0D
 tests/qemu-iotests/274.out                    |  29 ----=0D
 tests/qemu-iotests/280                        |   2 +-=0D
 tests/qemu-iotests/280.out                    |   1 -=0D
 tests/qemu-iotests/296                        |  12 +-=0D
 tests/qemu-iotests/303                        |   2 +-=0D
 tests/qemu-iotests/iotests.py                 | 134 +++++++++++++-----=0D
 tests/qemu-iotests/tests/block-status-cache   |  11 +-=0D
 .../qemu-iotests/tests/parallels-read-bitmap  |   6 +-=0D
 .../tests/remove-bitmap-from-backing          |   6 +-=0D
 25 files changed, 150 insertions(+), 157 deletions(-)=0D
=0D
--=20=0D
2.34.1=0D
=0D


