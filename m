Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEA231D0C0
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 20:14:13 +0100 (CET)
Received: from localhost ([::1]:39816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC5nY-000443-Cx
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 14:14:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lC5k7-0002WP-73
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 14:10:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lC5k5-0004OZ-A4
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 14:10:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613502635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WWYy93O3RS9PX1NfzYkxPn46Pne4StICz8VI+mq16nE=;
 b=c5LI4EgLBQtw6v3mQa+rA2k1MIqcibM1bW1Z4gdf8Li91r5vQUoxzA0BISi2mNp8My56wi
 KpNRcsOOv63rG3K8vX3Xgy0eXRffgA+/yNjA7ibVtkM/eprKzv1JmcNTfEdosHoGkiPHox
 iyzxV57vHlRX/OhkwtKY3L/RzQK8d6s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-6sWCKKKnOR6NlZ2IrSJLSw-1; Tue, 16 Feb 2021 14:10:32 -0500
X-MC-Unique: 6sWCKKKnOR6NlZ2IrSJLSw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9193107ACE4;
 Tue, 16 Feb 2021 19:10:30 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-215.ams2.redhat.com
 [10.36.112.215])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 72BCD5C1B4;
 Tue, 16 Feb 2021 19:10:28 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/10] qemu-options: always use key=on|off syntax for bool
 option docs
Date: Tue, 16 Feb 2021 19:10:17 +0000
Message-Id: <20210216191027.595031-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In discussing the proposal to deprecate the short form bool options=0D
without a value, it was pointed out that the docs mostly use the=0D
short form:=0D
=0D
  https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg05018.html=0D
=0D
This series converts all usage of the short form into the canonical=0D
key=3Don|off boolean syntax. As we can see, there was quite alot in=0D
the docs using the various short forms. Not sure if I got all of=0D
them since identifying them is quite hard.=0D
=0D
Daniel P. Berrang=C3=A9 (10):=0D
  gdbstub: use preferred boolean option syntax=0D
  qemu-options: update to show preferred boolean syntax for -chardev=0D
  qemu-options: update to show preferred boolean syntax for -spice=0D
  qemu-options: update to show preferred boolean syntax for -netdev=0D
  qemu-options: update to show preferred boolean syntax for -incoming=0D
  qemu-options: update to show preferred boolean syntax for -vnc=0D
  docs: update to show preferred boolean syntax for -chardev=0D
  docs: update to show preferred boolean syntax for -vnc=0D
  docs: update to show preferred boolean syntax for -cpu=0D
  target/i386: update to show preferred boolean syntax for -cpu=0D
=0D
 docs/COLO-FT.txt                       |  12 +--=0D
 docs/ccid.txt                          |   6 +-=0D
 docs/colo-proxy.txt                    |  16 +--=0D
 docs/devel/writing-qmp-commands.txt    |   2 +-=0D
 docs/interop/firmware.json             |   2 +-=0D
 docs/interop/live-block-operations.rst |   4 +-=0D
 docs/interop/qmp-intro.txt             |   4 +-=0D
 docs/system/cpu-hotplug.rst            |   2 +-=0D
 docs/system/cpu-models-x86.rst.inc     |   4 +-=0D
 docs/system/s390x/3270.rst             |   2 +-=0D
 docs/system/target-avr.rst             |   2 +-=0D
 docs/system/vnc-security.rst           |   8 +-=0D
 docs/tools/qemu-storage-daemon.rst     |   4 +-=0D
 gdbstub.c                              |   2 +-=0D
 qemu-options.hx                        | 131 +++++++++++++------------=0D
 scripts/qmp/qemu-ga-client             |   2 +-=0D
 target/i386/cpu.c                      |   2 +-=0D
 tests/qtest/test-x86-cpuid-compat.c    |  52 +++++-----=0D
 tests/test-char.c                      |   4 +-=0D
 19 files changed, 132 insertions(+), 129 deletions(-)=0D
=0D
--=20=0D
2.29.2=0D
=0D


