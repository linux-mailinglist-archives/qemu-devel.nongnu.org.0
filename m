Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3AB6AE10B
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 14:47:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZXeR-0000Pm-RS; Tue, 07 Mar 2023 08:46:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pZXeP-0000P7-Dj
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 08:46:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pZXeM-0006mC-70
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 08:46:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678196801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=W25gsiAZTv46K/qWyVTuM0ZKdgOwwr2gwSjPjYN7X74=;
 b=i0qZUo1nTx6usEYyTHpRXYjFZ4pnIa0XKL9qjANwbbk+McIdmQ3GTUBMagZRe4kV5B0nDL
 oGSya7+p0g7jRIMi/ggy8/sNh6+zz7NH7zCg1ZQUeVec631T4aeOw6LcK0niLWct/vxMRW
 DTVTZabUK3YTOR9skESPd5sIbBrPUKc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-29-S69cLu6iMUSRdQXzR6CqXA-1; Tue, 07 Mar 2023 08:46:39 -0500
X-MC-Unique: S69cLu6iMUSRdQXzR6CqXA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 66210196EF89;
 Tue,  7 Mar 2023 13:46:39 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE31D4010E7B;
 Tue,  7 Mar 2023 13:46:38 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v2 00/13] Final tests,
 s390x and misc updates before the soft freeze
Date: Tue,  7 Mar 2023 14:46:31 +0100
Message-Id: <20230307134631.571908-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

 Hi Peter!

The following changes since commit c29a2f40cd5d1fdad4632b48343cd968db041a44:

  Merge tag 'pull-target-arm-20230306' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2023-03-07 09:58:43 +0000)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2023-03-07

for you to fetch changes up to 7687cd2b99454bd289c8854eec2653cb855cad67:

  pc-bios/s390-ccw: Update s390-ccw.img with the list-directed IPL fix (2023-03-07 14:30:43 +0100)

----------------------------------------------------------------
* Refine the distro support policy
* Deprecate 32-bit x86 and arm hosts for system emulation
* Check bison version to be >= 3.0
* Compile vnc test only if vnc is really enabled
* Check docs/config/ich9-ehci-uhci.cfg via the readconfig-test
* s390x: Add support for list-directed IPL from ECKD DASD

----------------------------------------------------------------

v2: Dropped the readconfig patches that caused trouble in the CI

Jared Rossi (1):
      pc-bios: Add support for List-Directed IPL from ECKD DASD

Juan Quintela (1):
      test: Check vnc enable before compiling vnc test

Matheus Tavares Bernardino (1):
      Hexagon (meson.build): define min bison version

Thomas Huth (10):
      docs/about/build-platforms: Refine the distro support policy
      include/hw/i386: Clean up includes in x86.h
      docs/about/deprecated: Deprecate 32-bit x86 hosts for system emulation
      gitlab-ci.d/crossbuilds: Drop the i386 system emulation job
      docs/about/deprecated: Deprecate 32-bit arm hosts for system emulation
      gitlab-ci.d/crossbuilds: Drop the 32-bit arm system emulation jobs
      tests/qtest/readconfig: Rework test_object_rng_resp into a generic function
      tests/qtest/readconfig: Test docs/config/ich9-ehci-uhci.cfg
      docs/config: Set the "kvm" accelerator via "[accel]" section
      pc-bios/s390-ccw: Update s390-ccw.img with the list-directed IPL fix

 docs/about/build-platforms.rst       |   3 +-
 docs/about/deprecated.rst            |  20 +++++
 docs/config/mach-virt-graphical.cfg  |   4 +-
 docs/config/mach-virt-serial.cfg     |   4 +-
 docs/config/q35-emulated.cfg         |   2 +
 docs/config/q35-virtio-graphical.cfg |   2 +
 docs/config/q35-virtio-serial.cfg    |   2 +
 configure                            |   1 +
 include/hw/i386/x86.h                |   2 -
 pc-bios/s390-ccw/bootmap.h           |  30 ++++++-
 pc-bios/s390-ccw/bootmap.c           | 157 +++++++++++++++++++++++++++--------
 tests/qtest/readconfig-test.c        |  36 ++++++--
 .gitlab-ci.d/crossbuilds.yml         |  24 ------
 pc-bios/s390-ccw.img                 | Bin 42608 -> 42608 bytes
 target/hexagon/meson.build           |   2 +-
 tests/qtest/meson.build              |  10 ++-
 16 files changed, 219 insertions(+), 80 deletions(-)


