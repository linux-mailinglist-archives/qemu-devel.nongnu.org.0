Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9271165BC76
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 09:49:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCcyF-0001ai-5X; Tue, 03 Jan 2023 03:48:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pCcxx-0001a4-Ej
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 03:48:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pCcxv-0007W4-HD
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 03:48:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672735689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=lCEN2lclBRpsaywoPFnQwitttG1Ntc8Fo6YYIGiO+hE=;
 b=ecre1ytVHa/zYWSvqfROnSYMgekIyIn+QJD0tscwZe6oLGif9eqCc3Zk4fPP+FBjDpnb89
 0JDOFZXRxKpG4f/FigYUT9PIRSAaqoVQdnHIiu/IwZCP3lmqgkNmPopGN+1lw48jc3NG3q
 wADn+yMTxP3MdS9AZq+n8b/qGlyaxiQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-94-dL1-5sYDOj-jGas_nybV7Q-1; Tue, 03 Jan 2023 03:48:07 -0500
X-MC-Unique: dL1-5sYDOj-jGas_nybV7Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4C78A380673B;
 Tue,  3 Jan 2023 08:48:07 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C9714400D752;
 Tue,  3 Jan 2023 08:48:03 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Michael S Tsirkin <mst@redhat.com>,
 qemu-devel@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Subject: [PATCH 0/6] mc146818rtc related clean-ups and improvements
Date: Tue,  3 Jan 2023 09:47:55 +0100
Message-Id: <20230103084801.20437-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

This patch series is a follow-up of my previous patch
"[PATCH v4] hw/rtc/mc146818rtc: Make this rtc device target independent".
It has now been split into multiple patches to ease the review, and some
further patches have been added on top.

The basic idea is to change hw/rtc/mc146818rtc.c into target independent
code so that the file only has to be compiled once instead of multiple
times (and that it can be used in a qemu-system-all binary once we get
there).

First two patches are from Bernhard - clean-ups that will help to
make it easier to introduce a new "slew-tick-policy-available" property
later.

The third patch extracts some functions from the APIC code that will be
required for linking when the mc146818rtc becomes target-independent.

The fourth patch introduces the new "slew-tick-policy-available" property
that can be used to decide whether the slew-tick policy is available or
not once the "#ifdef TARGET..." stuff got removed.

The fifth patch then removes the "#ifdef TARGET" switches and turns
the mc146818rtc code into a target-independent file.

The sixth patch just fixes a small cosmetic nit that I discovered along
the way: On systems without mc146818, the "-rtc driftfix=slew" simply
got ignored silently. We should at least emit a warning in this case.

Bernhard Beschow (2):
  hw/i386/pc: Create RTC controllers in south bridges
  hw/i386/pc: No need for rtc_state to be an out-parameter

Thomas Huth (4):
  hw/intc: Extract the IRQ counting functions into a separate file
  hw/rtc/mc146818rtc: Add a property for the availability of the slew
    tick policy
  hw/rtc/mc146818rtc: Make the mc146818 RTC device target independent
  softmmu/rtc: Emit warning when using driftfix=slew on systems without
    mc146818

 include/hw/i386/apic.h          |  2 --
 include/hw/i386/apic_internal.h |  1 -
 include/hw/i386/ich9.h          |  2 ++
 include/hw/i386/pc.h            |  2 +-
 include/hw/intc/kvm_irqcount.h  | 10 +++++++
 include/hw/rtc/mc146818rtc.h    |  2 ++
 include/hw/southbridge/piix.h   |  3 ++
 hw/i386/kvm/i8259.c             |  4 +--
 hw/i386/kvm/ioapic.c            |  4 +--
 hw/i386/pc.c                    | 16 +++++++++--
 hw/i386/pc_piix.c               | 11 +++++++-
 hw/i386/pc_q35.c                |  3 +-
 hw/intc/apic.c                  |  3 +-
 hw/intc/apic_common.c           | 30 ++------------------
 hw/intc/kvm_irqcount.c          | 49 +++++++++++++++++++++++++++++++++
 hw/isa/lpc_ich9.c               |  9 ++++++
 hw/isa/piix3.c                  | 16 +++++++++++
 hw/rtc/mc146818rtc.c            | 33 ++++++++--------------
 softmmu/rtc.c                   |  6 +++-
 hw/intc/meson.build             |  6 ++++
 hw/intc/trace-events            |  9 +++---
 hw/isa/Kconfig                  |  2 ++
 hw/rtc/meson.build              |  3 +-
 23 files changed, 156 insertions(+), 70 deletions(-)
 create mode 100644 include/hw/intc/kvm_irqcount.h
 create mode 100644 hw/intc/kvm_irqcount.c

-- 
2.31.1


