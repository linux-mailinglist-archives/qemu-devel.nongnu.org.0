Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACC5663E44
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 11:32:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFBKX-0002Oq-5c; Tue, 10 Jan 2023 04:54:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFBKT-0002Nt-R0
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 04:54:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFBKS-0002fV-Bq
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 04:54:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673344439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ezc2iJ8OavHedCZFUbrXgpAf5yZPqXymyYjQAx+wPyM=;
 b=CMiFZN5cGXknD4FE47ozjnWwSvPQyMh2ebDMV0VnwFtf+cGpYe0zMclKK3gSuglqp23evC
 1Zcd6uVUwnZUxzy6xcxUE4TrtP9x4HKeh4x3+s6I08f/1W3fqQfcVDcYMgTcGDdb40kiII
 yYNhfWzUxwYi4Boo8QI9m2LuwR3ofDk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-360-crBzIJlQMeaUs0KoWzzdww-1; Tue, 10 Jan 2023 04:53:56 -0500
X-MC-Unique: crBzIJlQMeaUs0KoWzzdww-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D666F3C38FEE;
 Tue, 10 Jan 2023 09:53:55 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.108])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B4A1B4085720;
 Tue, 10 Jan 2023 09:53:53 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Michael S Tsirkin <mst@redhat.com>,
 qemu-devel@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v6 0/4] Make the mc146818 RTC device target independent
Date: Tue, 10 Jan 2023 10:53:47 +0100
Message-Id: <20230110095351.611724-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The basic idea of this patch set is to change hw/rtc/mc146818rtc.c into
target independent code so that the file only has to be compiled once
instead of multiple times (and that it can be used in a qemu-system-all
binary once we get there).

The first patch extracts some functions from the APIC code that will be
required for linking when the mc146818rtc becomes target-independent.

The second patch adds a new way for checking whether the "driftfix=slew"
policy is available or not (since the corresponding #ifdefs in the
mc146818rtc code will be removed).

The third patch then removes the "#ifdef TARGET" switches and turns
the mc146818rtc code into a target-independent file.

The fourth patch just fixes a small cosmetic nit that I discovered along
the way: On systems without mc146818, the "-rtc driftfix=slew" simply
got ignored silently. We should at least emit a warning in this case.

Changes since last iteration:
- Dropped the approach of using a new "slew-tick-policy-available"
  property that needs to be set by the machine code (and thus dropped
  the clean-up patches from Bernhard from this series since they are
  no longer required here now)
- Use a new check in hw/core/qdev-properties-system.c instead
  (see the second patch)

Thomas Huth (4):
  hw/intc: Extract the IRQ counting functions into a separate file
  hw/core/qdev-properties-system: Allow the 'slew' policy only on x86
  hw/rtc/mc146818rtc: Make the mc146818 RTC device target independent
  softmmu/rtc: Emit warning when using driftfix=slew on systems without
    mc146818

 include/hw/i386/apic.h           |  2 --
 include/hw/i386/apic_internal.h  |  1 -
 include/hw/intc/kvm_irqcount.h   | 10 +++++++
 include/hw/rtc/mc146818rtc.h     |  1 +
 hw/core/qdev-properties-system.c | 28 +++++++++++++++++-
 hw/i386/kvm/i8259.c              |  4 +--
 hw/i386/kvm/ioapic.c             |  4 +--
 hw/intc/apic.c                   |  3 +-
 hw/intc/apic_common.c            | 30 ++-----------------
 hw/intc/kvm_irqcount.c           | 49 ++++++++++++++++++++++++++++++++
 hw/rtc/mc146818rtc.c             | 20 ++-----------
 softmmu/rtc.c                    |  6 +++-
 hw/intc/meson.build              |  6 ++++
 hw/intc/trace-events             |  9 +++---
 hw/rtc/meson.build               |  3 +-
 15 files changed, 115 insertions(+), 61 deletions(-)
 create mode 100644 include/hw/intc/kvm_irqcount.h
 create mode 100644 hw/intc/kvm_irqcount.c

-- 
2.31.1


