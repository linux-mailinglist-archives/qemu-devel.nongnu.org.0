Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AB2419D29
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 19:43:02 +0200 (CEST)
Received: from localhost ([::1]:45172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUueb-0006k1-M8
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 13:43:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUuOi-0006Ct-4B
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:26:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUuOg-0005OY-2H
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:26:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632763593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zRhQQ1LgzXHR7FQYs/4sjmgz81m9HbbB30Dwiqhigz8=;
 b=LPU1oFth3BPSajtvhyyo9hP+Vi3DjuB/YwEfp9B+QnBsVcOoc7N3NihZTheU2oMfJ7UtQC
 mlV+cJCflNjz42hAyId7A4UvxQEw2pHbsxlWMIC9icWyrssZrIoIvAlJpIgIzVw61pfYPB
 DNCUXW7DBAzqMIXZ7hdjZY2P3AGo0UA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-wSAr_tQfMOeTda4k7_zLBw-1; Mon, 27 Sep 2021 13:26:31 -0400
X-MC-Unique: wSAr_tQfMOeTda4k7_zLBw-1
Received: by mail-wm1-f69.google.com with SMTP id
 m2-20020a05600c3b0200b0030cd1310631so203573wms.7
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 10:26:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MCwnE1jsL0WquKMzDlE9S1hPVJ8/NcMEfoT0tPys+o4=;
 b=TZh6tFwlZOAPehZjG4Dy/vztiFxv0VOL1i5CvFVRseup9BkL0U2lmoZWUDKe/V7QsX
 lv40th5vCavCQcDwPbXNHnXLe4usFupQhb0qmae2BiK7WqGsrGj6SO6jXxuOXMqtPfhL
 MUdXDC3HcKIi6SrRQkOaOo9vi6JJ6hj5Ma7rF0AJWDTiFY87cclz1HVHK6arT6EL5/zr
 1zodGPYqpQJUEQsRchoe9dxZHBu5YrIlW14IYg/vNQvyZVyWaa4DUk2Lx8KlEyLmWX6X
 XHSbobFer1tbTxEey4wMiJzE8+xnFHS5/ylwmaFFNKXD/7l098VOanPZO7RHmTkaqULG
 ug7g==
X-Gm-Message-State: AOAM533FLlRArTLdtP7SrOLC4OXYDpnXQTknpNuA6qOMcXgwVpM6XAFI
 QMFoNWsketCuBOypoaWNPn1ly8/HZQXjY+rQmSZ4OC3pHriHUTUuRcfoYhPMn7LoM3wk/ScYr4u
 w8TtC3PI4pIQcla8UJpTqy3lHMZ1F19zp27xxvUxnqNHcUm4rlkKtWkAbBWo2FwMQ
X-Received: by 2002:a1c:2c3:: with SMTP id 186mr204591wmc.195.1632763589722;
 Mon, 27 Sep 2021 10:26:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVzC0ioKFXmMaUxGGg7uelcgvEPGcpSCa5Zp9p1MXIoqaIoEymdkERzTwL5V/dZqIfcbMqdg==
X-Received: by 2002:a1c:2c3:: with SMTP id 186mr204549wmc.195.1632763589328;
 Mon, 27 Sep 2021 10:26:29 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id l25sm127692wmi.29.2021.09.27.10.26.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 10:26:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: 
Subject: [PULL v2 00/22] Integration testing patches for 2021-09-27
Date: Mon, 27 Sep 2021 19:26:25 +0200
Message-Id: <20210927172626.2026308-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit de8ed1055c2ce18c95f597eb10df360dcb534f99=
:=0D
=0D
  Merge remote-tracking branch 'remotes/armbru/tags/pull-qapi-2021-09-25-v2=
' into staging (2021-09-27 15:03:42 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://github.com/philmd/qemu.git tags/integration-testing-20210927=0D
=0D
for you to fetch changes up to 4c5fc0c5fc496c147adb15536e4ac808feccf2cf:=0D
=0D
  tests/acceptance: Test powernv machines (2021-09-27 19:21:37 +0200)=0D
=0D
----------------------------------------------------------------=0D
Integration testing patches=0D
=0D
- More Linux kernel record/replay tests (Pavel Dovgalyuk)=0D
- Various fixes (Willian Rampazzo, Cleber Rosa)=0D
- Split machine_ppc.py per machine (David Gibson)=0D
- Add AVOCADO_TESTS command line environment variable (Willian Rampazzo)=0D
- Test PowerPC PowerNV 8/9 machines (C=C3=A9dric Le Goater)=0D
=0D
v2:=0D
- Added missing test from C=C3=A9dric.=0D
----------------------------------------------------------------=0D
=0D
Cleber Rosa (6):=0D
  Acceptance Tests: add standard clean up at test tearDown()=0D
  Acceptance Tests: improve check-acceptance description=0D
  acceptance/tests/vnc.py: use explicit syntax for enabling passwords=0D
  tests/acceptance/boot_xen.py: removed unused import=0D
  tests/acceptance/ppc_prep_40p.py: NetBSD 7.1.2 location update=0D
  tests/acceptance/ppc_prep_40p.py: clean up unused import=0D
=0D
C=C3=A9dric Le Goater (1):=0D
  tests/acceptance: Test powernv machines=0D
=0D
David Gibson (1):=0D
  qemu: Split machine_ppc.py acceptance tests=0D
=0D
Pavel Dovgalyuk (5):=0D
  tests/acceptance: add replay kernel test for s390x=0D
  tests/acceptance: add replay kernel test for openrisc=0D
  tests/acceptance: add replay kernel test for nios2=0D
  tests/acceptance: add replay kernel test for alpha=0D
  tests/acceptance: Linux boot test for record/replay=0D
=0D
Willian Rampazzo (9):=0D
  Acceptance tests: add myself as a reviewer for the acceptance tests=0D
  avocado_qemu: standardize super() call following PEP3135=0D
  avocado_qemu: fix import module based on isort=0D
  avocado_qemu: tweak ssh connect method=0D
  avocado_qemu: explicitly return None to avoid R1710=0D
  avocado_qemu: fix inheritance order on LinuxTest class=0D
  tests/Makefile: allow control over tags during check-acceptance=0D
  docs/devel/testing: add instruction to run a single acceptance test=0D
  tests/Makefile: add AVOCADO_TESTS option to make check-acceptance=0D
=0D
 docs/devel/testing.rst                    |  69 +++++++++++++=0D
 MAINTAINERS                               |   6 +-=0D
 tests/Makefile.include                    |  19 +++-=0D
 tests/acceptance/avocado_qemu/__init__.py |  30 +++---=0D
 tests/acceptance/boot_linux_console.py    |  35 +++++++=0D
 tests/acceptance/boot_xen.py              |   1 -=0D
 tests/acceptance/machine_ppc.py           |  69 -------------=0D
 tests/acceptance/ppc_mpc8544ds.py         |  32 ++++++=0D
 tests/acceptance/ppc_prep_40p.py          |   5 +-=0D
 tests/acceptance/ppc_pseries.py           |  35 +++++++=0D
 tests/acceptance/ppc_virtex_ml507.py      |  34 +++++++=0D
 tests/acceptance/replay_kernel.py         |  54 ++++++++++=0D
 tests/acceptance/replay_linux.py          | 116 ++++++++++++++++++++++=0D
 tests/acceptance/vnc.py                   |   2 +-=0D
 14 files changed, 409 insertions(+), 98 deletions(-)=0D
 delete mode 100644 tests/acceptance/machine_ppc.py=0D
 create mode 100644 tests/acceptance/ppc_mpc8544ds.py=0D
 create mode 100644 tests/acceptance/ppc_pseries.py=0D
 create mode 100644 tests/acceptance/ppc_virtex_ml507.py=0D
 create mode 100644 tests/acceptance/replay_linux.py=0D
=0D
--=20=0D
2.31.1=0D
=0D


