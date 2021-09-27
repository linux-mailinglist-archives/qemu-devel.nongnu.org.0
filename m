Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE91F419A4D
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 19:06:43 +0200 (CEST)
Received: from localhost ([::1]:53888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUu5P-0004t1-HM
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 13:06:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUu1T-00029S-Hg
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:02:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUu1R-0002cG-Sa
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:02:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632762153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=J5My7W4sdWybLD32tMCW6EssCWnKmHyDdkVUo17vIgU=;
 b=dwshd5rXP7lOjd6DLegihUC94uJVyOvM9lEAknXGHxwlc+bgWNL1hf3oZL/2bgvrDSN7ZO
 x26M9rjsISNHgEbR4ofHnSKTssn94sfhtxADE3zL6wmYI0vRskEulyHg6W/zZ+LbK9KIc9
 gW4XC81WQWBTiMvdskrV+8+QFsVaTrA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-NWPB8SkLNee5SW8qSDMVAw-1; Mon, 27 Sep 2021 13:02:30 -0400
X-MC-Unique: NWPB8SkLNee5SW8qSDMVAw-1
Received: by mail-wm1-f69.google.com with SMTP id
 200-20020a1c00d1000000b0030b3dce20e1so460775wma.0
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 10:02:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ky6DvSYWbVIdT8hs4eZM97u94FiNMf/WJcrOC4CUdYE=;
 b=wGhWyLigfq4T470q2tJhyHC9X56ENWi+YZbNYxNjaOZ4Ibm80X2CNKUDFYpYy4JZPN
 SR1xYD8PEPUJGUQ9BFWtzKIoOPlVixlYiMEVdAujkgI/+Q7wA+wUKrZy9lqQyCIdscTl
 mLQTiUvnbBlQ2X5YU7Lx3eC0QXYz7sM2HagUkCgWHf3EnGO+udAXCKBoVN2GZcvoeI6z
 CFHuXtiif69yPAVGFREWB99KJuBgmE9dG5f3sQND8Bz217+Z0IolWWR5qtbWfDP7mCX/
 VJfPMpanIjtk6gYfTLWyOHVj3Dmyx3NjXsIREnG51/wcS9cwX4P0okT9l0yF2mNhtZvX
 kxxQ==
X-Gm-Message-State: AOAM532JAosgSxAtxHp5ALLEu4ahXwr4uJLnolKyd9PMIxtha1XQ1UBV
 Y8oL5XFAC4YgH61SeQokyDGqgCYDenB+PVZa8/Soofr7qGeExtLnitMNcvfZMNi4KFY09HyxhDo
 TizZYiBbzibaJmoZF/PnDBGZK6tJ4l2SrIYXs+IJjQwklhtzv6aLaeVTzT8u+AMra
X-Received: by 2002:adf:f64d:: with SMTP id x13mr1078318wrp.360.1632762148838; 
 Mon, 27 Sep 2021 10:02:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrAggN3nOrYe94x2Z017uhx5nYwI7a78vLUYEAnxlO+CU4Y2jMGSObjWaiVeCmsJvzH90BJw==
X-Received: by 2002:adf:f64d:: with SMTP id x13mr1078285wrp.360.1632762148544; 
 Mon, 27 Sep 2021 10:02:28 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id d2sm16946558wrc.32.2021.09.27.10.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 10:02:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/21] Integration testing patches for 2021-09-27
Date: Mon, 27 Sep 2021 19:02:06 +0200
Message-Id: <20210927170227.2014482-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
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
for you to fetch changes up to 6fdd5530d12c5b21cc05e7f44db95f6544bc3c17:=0D
=0D
  tests/acceptance/ppc_prep_40p.py: clean up unused import (2021-09-27 18:5=
5:46 +0200)=0D
=0D
----------------------------------------------------------------=0D
Integration testing patches=0D
=0D
- More Linux kernel record/replay tests (Pavel Dovgalyuk)=0D
- Various fixes (Willian Rampazzo, Cleber Rosa)=0D
- Split machine_ppc.py per machine (David Gibson)=0D
- Add AVOCADO_TESTS command line environment variable (Willian Rampazzo)=0D
=0D
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
 tests/acceptance/boot_xen.py              |   1 -=0D
 tests/acceptance/machine_ppc.py           |  69 -------------=0D
 tests/acceptance/ppc_mpc8544ds.py         |  32 ++++++=0D
 tests/acceptance/ppc_prep_40p.py          |   5 +-=0D
 tests/acceptance/ppc_pseries.py           |  35 +++++++=0D
 tests/acceptance/ppc_virtex_ml507.py      |  34 +++++++=0D
 tests/acceptance/replay_kernel.py         |  54 ++++++++++=0D
 tests/acceptance/replay_linux.py          | 116 ++++++++++++++++++++++=0D
 tests/acceptance/vnc.py                   |   2 +-=0D
 13 files changed, 374 insertions(+), 98 deletions(-)=0D
 delete mode 100644 tests/acceptance/machine_ppc.py=0D
 create mode 100644 tests/acceptance/ppc_mpc8544ds.py=0D
 create mode 100644 tests/acceptance/ppc_pseries.py=0D
 create mode 100644 tests/acceptance/ppc_virtex_ml507.py=0D
 create mode 100644 tests/acceptance/replay_linux.py=0D
=0D
--=20=0D
2.31.1=0D
=0D


