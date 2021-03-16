Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3CE33E047
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 22:17:40 +0100 (CET)
Received: from localhost ([::1]:40170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMH4N-00077g-Ka
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 17:17:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMH2S-0005MV-Sw
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 17:15:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMH2O-0003RF-Rn
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 17:15:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615929334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=67zBzfkIo5L/bwMEaMJBHCpJXPcQGerfjRKK+h2MoZw=;
 b=iSeNDJuo0SCneUmcInBgXngQYn+Bk9HUxssoOd6lBE0BMRqfMryzua46ORu6zXPG9AA/ay
 6poNXj66yK5hgq/ljgUavCXFXvEYY93sHZ4Ag2I0BC6fMSAGmpgNxMIRiPu2ppqntN9OjQ
 wc1g9ngf7eaKMLvDEa50a/EQIIAo8vA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-xeO_EIazNU-d_wXZKIyj9w-1; Tue, 16 Mar 2021 17:15:32 -0400
X-MC-Unique: xeO_EIazNU-d_wXZKIyj9w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98BD7108BD06
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 21:15:31 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 679A150329
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 21:15:31 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/16] Fuzzing + bugfix patches for QEMU 6.0 soft freeze
Date: Tue, 16 Mar 2021 17:15:15 -0400
Message-Id: <20210316211531.1649909-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 6e31b3a5c34c6e5be7ef60773e607f189eaa15f3:

  Merge remote-tracking branch 'remotes/jasowang/tags/net-pull-request' into staging (2021-03-16 10:53:47 +0000)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 8b858f9998a9d59a9a7188f2c5c6ffb99eff6115:

  qemu-timer: allow freeing a NULL timer (2021-03-16 14:30:30 -0400)

----------------------------------------------------------------
* add --enable/--disable-libgio to configure (Denis)
* small fixes (Pavel, myself)
* fuzzing update (Alexander)

----------------------------------------------------------------
Alexander Bulekov (8):
      fuzz: fix the pro100 generic-fuzzer config
      fuzz: don't leave orphan llvm-symbolizers around
      fuzz: add a script to build reproducers
      fuzz: add instructions for building reproducers
      fuzz: add a am53c974 generic-fuzzer config
      memory: add a sparse memory device for fuzzing
      fuzz: configure a sparse-mem device, by default
      fuzz: move some DMA hooks

Denis Plotnikov (1):
      configure: add option to explicitly enable/disable libgio

Paolo Bonzini (3):
      Revert "accel: kvm: Add aligment assert for kvm_log_clear_one_slot"
      scsi: fix sense code for EREMOTEIO
      qemu-timer: allow freeing a NULL timer

Pavel Dovgalyuk (1):
      hw/i8254: fix vmstate load

Philippe Mathieu-Daudé (3):
      tests/qtest: Only run fuzz-megasas-test if megasas device is available
      tests/qtest: Only run fuzz-virtio-scsi when virtio-scsi is available
      MAINTAINERS: Cover fuzzer reproducer tests within 'Device Fuzzing'

 MAINTAINERS                             |   4 +
 accel/kvm/kvm-all.c                     |   7 --
 configure                               |  60 +++++++-----
 docs/devel/fuzzing.rst                  |  56 +++++++++++
 hw/mem/meson.build                      |   1 +
 hw/mem/sparse-mem.c                     | 151 ++++++++++++++++++++++++++++++
 hw/timer/i8254.c                        |   2 +-
 include/hw/mem/sparse-mem.h             |  19 ++++
 include/qemu/timer.h                    |   6 +-
 scripts/oss-fuzz/output_reproducer.py   | 160 ++++++++++++++++++++++++++++++++
 scsi/utils.c                            |   4 +-
 softmmu/memory.c                        |   1 -
 softmmu/physmem.c                       |   2 +-
 tests/qtest/fuzz-megasas-test.c         |  49 ++++++++++
 tests/qtest/fuzz-test.c                 |  76 ---------------
 tests/qtest/fuzz-virtio-scsi-test.c     |  75 +++++++++++++++
 tests/qtest/fuzz/generic_fuzz.c         |  29 +++++-
 tests/qtest/fuzz/generic_fuzz_configs.h |   8 +-
 tests/qtest/meson.build                 |   5 +-
 19 files changed, 599 insertions(+), 116 deletions(-)
 create mode 100644 hw/mem/sparse-mem.c
 create mode 100644 include/hw/mem/sparse-mem.h
 create mode 100755 scripts/oss-fuzz/output_reproducer.py
 create mode 100644 tests/qtest/fuzz-megasas-test.c
 create mode 100644 tests/qtest/fuzz-virtio-scsi-test.c
-- 
2.26.2


