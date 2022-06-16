Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9285954E36E
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 16:30:40 +0200 (CEST)
Received: from localhost ([::1]:42210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1qW7-0002Q6-JP
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 10:30:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o1qSh-00073Z-1L
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 10:27:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o1qSe-0008HX-Ve
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 10:27:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655389624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EgUccb+zEmq3ftmNdrMOdyrQC5NgxY4N9eRBs3lxWdA=;
 b=bi6gaujPrWeJpGaJXm+5S6ZmgY5wYCfg5tZrjPbr57Z/0+kMpE2W0CC2Nq/z6sv+yFRJCD
 gOj1CB+gMK0aaPRYzsKjOrs9RXf3e6SAM18TxV/+AFMDUm0WsnRpcsFh1FPGrrAPfvTy9q
 CHxynkeEr7vUKjne1YI0t5kkIsngmrE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-169-9tGX11SvOaaOogJf_b7Lpw-1; Thu, 16 Jun 2022 10:27:01 -0400
X-MC-Unique: 9tGX11SvOaaOogJf_b7Lpw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BFB2F3833283;
 Thu, 16 Jun 2022 14:27:00 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 118602026985;
 Thu, 16 Jun 2022 14:27:00 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 John Snow <jsnow@redhat.com>
Subject: [PATCH v2 00/10] Improve reliability of VM tests
Date: Thu, 16 Jun 2022 10:26:49 -0400
Message-Id: <20220616142659.3184115-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch series attempts to improve the reliability of several of the=0D
VM test targets. In particular, both CentOS 8 tests are non-functional=0D
because CentOS 8 was EOL at the beginning of this calendar year, with=0D
repositories and mirrors going offline.=0D
=0D
Notably, I also remove the ubuntu.i386 test because we no longer support=0D
Ubuntu 18.04 nor do we have explicit need of an i386 build test.=0D
=0D
After this series, I am able to successfully run every VM target on an=0D
x86_64 host, except:=0D
=0D
- ubuntu.aarch64: Hangs often during testing, see below.=0D
- centos.aarch64: Hangs often during testing, see below.=0D
- haiku.x86_64: Build failures not addressed by this series, see=0D
  https://lists.gnu.org/archive/html/qemu-devel/2022-06/msg02103.html=0D
=0D
The unit tests that I see fail most often are:=0D
=0D
- qom-test: ENOMEM with default config and many cores=0D
- test-hmp: ENOMEM with default config and many cores=0D
- virtio-net-failover: Seems to like to hang on openbsd=0D
- migration-test: Tends to hang under aarch64 tcg=0D
=0D
Increasing the default memory (patch 10) has seemingly helped both=0D
reliability *and* reduced race conditions quite a bit, both on my=0D
12-thread intel laptop and on my 32-thread AMD 5950x desktop.=0D
=0D
Due to how long it takes to run these tests, though, I can't claim=0D
perfect reliability. The flakiness of virtio-net-failover and=0D
migration-test is something that probably still needs to be addressed,=0D
but it's outside of my expertise and time budget at present to pursue=0D
it.=0D
=0D
Future work (next version? next series?);=0D
=0D
- Try to get centos.aarch64 working reliably under TCG=0D
- Upgrade ubuntu.aarch64 to 20.04 after fixing centos.aarch64=0D
- Fix the Haiku build test, if possible.=0D
- Ensure I can reliably run and pass "make vm-build-all".=0D
  (Remove VMs from this recipe if necessary.)=0D
=0D
John Snow (10):=0D
  tests/qemu-iotests: hotfix for 307, 223 output=0D
  tests/qemu-iotests: skip 108 when FUSE is not loaded=0D
  qga: treat get-guest-fsinfo as "best effort"=0D
  tests/vm: use 'cp' instead of 'ln' for temporary vm images=0D
  tests/vm: switch CentOS 8 to CentOS 8 Stream=0D
  tests/vm: switch centos.aarch64 to CentOS 8 Stream=0D
  tests/vm: update sha256sum for ubuntu.aarch64=0D
  tests/vm: remove ubuntu.i386 VM test=0D
  tests/vm: remove duplicate 'centos' VM test=0D
  tests/vm: add 512MB extra memory per core=0D
=0D
 qga/commands-posix.c       |   8 +-=0D
 tests/qemu-iotests/108     |   5 ++=0D
 tests/qemu-iotests/223.out |   4 +-=0D
 tests/qemu-iotests/307.out |   4 +-=0D
 tests/vm/Makefile.include  |   5 +-=0D
 tests/vm/basevm.py         |   6 ++=0D
 tests/vm/centos            |   8 +-=0D
 tests/vm/centos.aarch64    | 174 +++++--------------------------------=0D
 tests/vm/ubuntu.aarch64    |   8 +-=0D
 tests/vm/ubuntu.i386       |  40 ---------=0D
 10 files changed, 58 insertions(+), 204 deletions(-)=0D
 delete mode 100755 tests/vm/ubuntu.i386=0D
=0D
-- =0D
2.34.3=0D
=0D


