Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06ACC207220
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 13:32:36 +0200 (CEST)
Received: from localhost ([::1]:45064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jo3dr-0005q7-0Y
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 07:32:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jo3c3-000427-0W
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 07:30:43 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:25276
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jo3c0-0007wd-Bo
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 07:30:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592998238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=aUmNFbIXzW+FARDDjstRWvJGE3nO05f5pN6W6sv/f+M=;
 b=fAHjd305oOUM7tILpGB+3dlypAy69zz6na075aEtxuuGF7UR6OWFTUorBysTaSAaXAGo7r
 sVd0J8dsS1vI+WeSmkaoTVR7RyxaSlqIVAhap6b/UfEQDS5nxeODVLF7yi4oQr63eOjOiR
 j95jsyVAW19hup4HJh1upqHmOIW+Umk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300--uYbKsL4MBSQLcS2xI7xXw-1; Wed, 24 Jun 2020 07:30:37 -0400
X-MC-Unique: -uYbKsL4MBSQLcS2xI7xXw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C599818A8236;
 Wed, 24 Jun 2020 11:30:35 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-67.ams2.redhat.com
 [10.36.112.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 725116106A;
 Wed, 24 Jun 2020 11:30:27 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 97B5616E18; Wed, 24 Jun 2020 13:30:26 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/20] audio: deprecate -soundhw
Date: Wed, 24 Jun 2020 13:30:06 +0200
Message-Id: <20200624113026.13343-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 03:27:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: qemu-ppc@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v2:
 - use g_assert_not_reached() for stubs.
 - add deprecation notice.

v3:
 - rebase to latest master.
 - adapt to armbru's device initialization changes.

v4:
 - reorder patches, drop temporary -global setup,
   go straight to -machine pcspk-audiodev= instead.
 - update error messages and documentation accordingly.

Gerd Hoffmann (20):
  stubs: add isa_create_simple
  stubs: add pci_create_simple
  audio: add deprecated_register_soundhw
  audio: deprecate -soundhw ac97
  audio: deprecate -soundhw es1370
  audio: deprecate -soundhw adlib
  audio: deprecate -soundhw cs4231a
  audio: deprecate -soundhw gus
  audio: deprecate -soundhw sb16
  audio: deprecate -soundhw hda
  pc_basic_device_init: pass PCMachineState
  pc_basic_device_init: drop has_pit arg
  pc_basic_device_init: drop no_vmport arg
  softmmu: initialize spice and audio earlier
  audio: rework pcspk_init()
  audio: create pcspk device early
  audio: deprecate -soundhw pcspk
  audio: add soundhw deprecation notice
  pcspk: update docs/system/target-i386-desc.rst.inc
  audio: set default value for pcspk.iobase property

 include/hw/audio/pcspk.h             | 12 ++----------
 include/hw/audio/soundhw.h           |  2 ++
 include/hw/i386/pc.h                 |  6 +++---
 hw/audio/ac97.c                      |  9 ++-------
 hw/audio/adlib.c                     |  8 +-------
 hw/audio/cs4231a.c                   |  8 +-------
 hw/audio/es1370.c                    |  9 ++-------
 hw/audio/gus.c                       |  8 +-------
 hw/audio/intel-hda.c                 |  3 +++
 hw/audio/pcspk.c                     | 26 ++++++++++++++++++++++----
 hw/audio/sb16.c                      |  9 ++-------
 hw/audio/soundhw.c                   | 24 +++++++++++++++++++++++-
 hw/i386/pc.c                         | 14 ++++++++------
 hw/i386/pc_piix.c                    |  3 +--
 hw/i386/pc_q35.c                     |  3 +--
 hw/isa/i82378.c                      |  2 +-
 qdev-monitor.c                       |  2 ++
 softmmu/vl.c                         | 12 ++++++------
 stubs/isa-bus.c                      |  7 +++++++
 stubs/pci-bus.c                      |  7 +++++++
 docs/system/deprecated.rst           |  9 +++++++++
 docs/system/target-i386-desc.rst.inc | 13 ++++++++++++-
 stubs/Makefile.objs                  |  2 ++
 23 files changed, 120 insertions(+), 78 deletions(-)
 create mode 100644 stubs/isa-bus.c
 create mode 100644 stubs/pci-bus.c

-- 
2.18.4


