Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CED026C07F
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Sep 2020 11:28:01 +0200 (CEST)
Received: from localhost ([::1]:54574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kITjM-0001aU-1S
	for lists+qemu-devel@lfdr.de; Wed, 16 Sep 2020 05:28:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kITi3-0008Qw-Bb
 for qemu-devel@nongnu.org; Wed, 16 Sep 2020 05:26:40 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:41911
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kIThy-0005Ek-3t
 for qemu-devel@nongnu.org; Wed, 16 Sep 2020 05:26:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600248393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=laiMxBnbrXek0x1hKtXsrTfwRyRnabZI2SEozHp4dbk=;
 b=FtcOKGOmzXMXnINJGV2Z2Wrr9DwKG3GYxmGWVrj6CUUqJHEB5+8AnTm0JnztCo9cVr78H/
 mMA8zQgrD/VTxD4RC1cDTXAbFInPpuQ69nFsKyhcQFqfzCLkTXcLthBwaSnlXxD5mitegs
 U7CWobZNFnvkSVW9kERGL45ZOvfuLU8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-zAZzza9oONWTHmXsS66RwQ-1; Wed, 16 Sep 2020 05:26:28 -0400
X-MC-Unique: zAZzza9oONWTHmXsS66RwQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D51D10060EC;
 Wed, 16 Sep 2020 09:26:27 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F00845DE4A;
 Wed, 16 Sep 2020 09:26:22 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH v3 0/5] hw/arm/virt: Introduce kvm-steal-time
Date: Wed, 16 Sep 2020 11:26:15 +0200
Message-Id: <20200916092620.19161-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/16 00:53:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Previous posting:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg727588.html

v3:
  - Rebased: 5.2 machine type and kvm32 drop now included
  - Switched to using new KVM cap that has been merged upstream
  - Picked up some r-b's and some of Eric's comments from v2

KVM supports the ability to publish the amount of time that VCPUs
were runnable, but not running due to other host threads running
instead, to the guest. The guest scheduler may use that information
when making decisions and the guest may expose it to its userspace
(Linux publishes this information in /proc/stat). This feature is
called "steal time" as it represents the amount of time stolen from
a guest by scheduling out its VCPUs. To enable this feature KVM
userspace must provide a memory region that will be used to publish
the information to the guest. The memory region is typical migratable
region. The GPA of the region is given to KVM through a VCPU device
ioctl interface. This feature is only available for 64-bit guests
per the Arm PVTIME specification (DEN0057A).

This series provides the QEMU support of this feature. It will
be enabled by default for 5.2 machine types and later, but may
be disabled with a new CPU property "kvm-steal-time".

Thanks,
drew


Andrew Jones (5):
  target/arm/kvm: Make uncalled stubs explicitly unreachable
  hw/arm/virt: Move post cpu realize check into its own function
  hw/arm/virt: Move kvm pmu setup to virt_cpu_post_init
  DO NOT MERGE: HACK: Add steal time KVM cap to kvm.h
  hw/arm/virt: Implement kvm-steal-time

 docs/system/arm/cpu-features.rst |  11 ++++
 hw/arm/virt.c                    | 110 ++++++++++++++++++++++---------
 include/hw/arm/virt.h            |   5 ++
 linux-headers/linux/kvm.h        |   1 +
 target/arm/cpu.c                 |   8 +++
 target/arm/cpu.h                 |   4 ++
 target/arm/kvm.c                 |  16 +++++
 target/arm/kvm64.c               |  64 ++++++++++++++++--
 target/arm/kvm_arm.h             |  94 ++++++++++++++++++++------
 target/arm/monitor.c             |   2 +-
 tests/qtest/arm-cpu-features.c   |  25 +++++--
 11 files changed, 281 insertions(+), 59 deletions(-)

-- 
2.26.2


