Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A08AD313FB3
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 20:57:45 +0100 (CET)
Received: from localhost ([::1]:42272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9CfI-0002Mq-Gq
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 14:57:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l96jJ-000322-Gw
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:37:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l96jH-0004vL-Je
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:37:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612791437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3XQQ/iNw6DWA4sEWnrtxWrsRKcl5PtPMQIrISTUOLwU=;
 b=OEYZeFXo3yxdIXPlxi423qHnKHjZ8yDRaMZrCWnFG2kNbm3pRBbEZtgqsgsMY048YZpvcq
 mnWlAfH9FHfe6ebf4FCjI/lrPYmFJQbozUwxtXhx6/7sTeO/zGS0Z4TjQ80c2riC1zSTkP
 bWIA/m1GEXCLcO49ObFnraVVMa1+tQ4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-115-5JgGuZSFNxOaHrK7gAaBgQ-1; Mon, 08 Feb 2021 08:37:14 -0500
X-MC-Unique: 5JgGuZSFNxOaHrK7gAaBgQ-1
Received: by mail-wr1-f72.google.com with SMTP id x12so13071097wrw.21
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 05:37:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZYJMGgTfI7JMSzI2b8l0MrXsed8mmQYRU8Telx0Qd/Q=;
 b=diVhLwX9S9qzjx0x5k883bGqsbVHSr31z0XUC4UZClVvAxpJBtT51/kKErU3VvIFaB
 nJ9DO+EfmO+kh9yRKkJAM1RJaJ8YB1LiThl7x/Go01yG0oxpcQDz0Q0mgKSawSZOsBE6
 T8Fkq2PAcWCtv6k9RA9uB4WzGm0Wp8vPeWJl8CIZS5qgAgRXbbc0s+GHvp3UlY2qlu4K
 RWNh+i327Ik3rPxeFO+1rKLhV64Jlu9cFZp6ia9+VF32xtTx3ZUV1ow+SRh2zIVPA5Ww
 duJtXZhK+KF6Ac40uGi3jrtSJs+0XPJCm6IGRDpqgADo1zeGJDKpVrBbPg0FPD8g2xZn
 w+vg==
X-Gm-Message-State: AOAM532QKpyZJmktibrD/GPGETwTLK/7NTfQbgEd8Mvn1GxeK4o0Kqad
 WnjVUSUbHVQGxuygJRaOuMl4eojpYG7Zxit8JkUtsgODKhOitjOOoxm1mu7o2763IzBaCf1j/I8
 V0u48EFZEM+8c7BCwpjS+LTJFE0lWgWklaBmfCvfefQ8VXGjLpyh9cdzflcPRDkB8
X-Received: by 2002:adf:dcc8:: with SMTP id x8mr19994692wrm.234.1612791433582; 
 Mon, 08 Feb 2021 05:37:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyZAQ2LKCYVGpDi1Vo2kC/vQSB8iAv3ZXN9ThlkjbHRL8a5ycFGGZ1/pJHhvJJyH72q2zY/Lg==
X-Received: by 2002:adf:dcc8:: with SMTP id x8mr19994672wrm.234.1612791433277; 
 Mon, 08 Feb 2021 05:37:13 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id h14sm21825063wmq.45.2021.02.08.05.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 05:37:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/18] Integration testing patches for 2021-02-08
Date: Mon,  8 Feb 2021 14:36:53 +0100
Message-Id: <20210208133711.2596075-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 5b19cb63d9dfda41b412373b8c9fe14641bcab60=
:=0D
=0D
  Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210205' =
into staging (2021-02-05 22:59:12 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/philmd/qemu.git tags/integration-testing-20210208=0D
=0D
for you to fetch changes up to fce8a00839564bf620b6c2957ed924197e54a127:=0D
=0D
  Acceptance Tests: remove unnecessary tag from documentation example (2021=
-02-08 14:31:03 +0100)=0D
=0D
----------------------------------------------------------------=0D
Integration testing patches=0D
=0D
Tests added:=0D
- Armbian 20.08 on Orange Pi PC (Philippe)=0D
- MPC8544ds machine (Thomas)=0D
- Virtex-ml507 ppc machine (Thomas)=0D
- Re-enable the microblaze test (Thomas)=0D
=0D
Various fixes and documentation improvements from Cleber.=0D
----------------------------------------------------------------=0D
=0D
Cleber Rosa (9):=0D
  tests/acceptance/boot_linux: fix typo on cloudinit error message=0D
  tests/acceptance/boot_linux: rename misleading cloudinit method=0D
  tests/acceptance/virtiofs_submounts: use workdir property=0D
  tests/acceptance/virtiofs_submounts: do not ask for ssh key password=0D
  tests/acceptance/virtiofs_submounts: use a virtio-net device instead=0D
  tests/acceptance/virtiofs_submounts: standardize port as integer=0D
  tests/acceptance/virtiofs_submounts: required space between IP and=0D
    port=0D
  Acceptance tests: clarify ssh connection failure reason=0D
  Acceptance Tests: remove unnecessary tag from documentation example=0D
=0D
Philippe Mathieu-Daud=C3=A9 (4):=0D
  tests/acceptance: Extract tesseract_available() helper in new=0D
    namespace=0D
  tests/acceptance: Introduce tesseract_ocr() helper=0D
  tests/acceptance: Extract do_test_arm_orangepi_armbian_uboot() method=0D
  tests/acceptance: Test U-Boot/Linux from Armbian 20.08 on Orange Pi PC=0D
=0D
Thomas Huth (5):=0D
  tests/acceptance: Move the pseries test to a separate file=0D
  tests/acceptance: Test the mpc8544ds machine=0D
  tests/acceptance: Add a test for the virtex-ml507 ppc machine=0D
  tests/acceptance: Increase the timeout in the replay tests=0D
  tests/acceptance: Re-enable the microblaze test=0D
=0D
 docs/devel/testing.rst                    |  3 -=0D
 MAINTAINERS                               |  2 +=0D
 tests/acceptance/boot_linux.py            | 14 ++--=0D
 tests/acceptance/boot_linux_console.py    | 98 +++++++++++------------=0D
 tests/acceptance/linux_ssh_mips_malta.py  |  2 +-=0D
 tests/acceptance/machine_m68k_nextcube.py | 44 ++--------=0D
 tests/acceptance/machine_microblaze.py    | 35 ++++++++=0D
 tests/acceptance/machine_ppc.py           | 69 ++++++++++++++++=0D
 tests/acceptance/replay_kernel.py         |  2 +-=0D
 tests/acceptance/tesseract_utils.py       | 46 +++++++++++=0D
 tests/acceptance/virtiofs_submounts.py    | 21 +++--=0D
 11 files changed, 227 insertions(+), 109 deletions(-)=0D
 create mode 100644 tests/acceptance/machine_microblaze.py=0D
 create mode 100644 tests/acceptance/machine_ppc.py=0D
 create mode 100644 tests/acceptance/tesseract_utils.py=0D
=0D
--=20=0D
2.26.2=0D
=0D


