Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BFC3A9F0A
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 17:26:59 +0200 (CEST)
Received: from localhost ([::1]:50904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltXRS-0003yE-PP
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 11:26:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ltXPk-0001li-Qc
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 11:25:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ltXPh-0007Jv-Oh
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 11:25:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623857108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ox/T2kCNuvAEHUwqAjmOAFRkuRloPjM6t6ZJw9ALjyI=;
 b=PVnbxmSNabq20jJsHCq5OtRnHg0ErMytQSMEcKO9BlzFTLT8F1bxQbp3wohnxG8zBM8E9D
 YvqD5PuddP4RR+NgJc0/d5RwshtLp4Se5ijt2XVx9siwWbTUkhTdBjO1BaiwzaFWxh0sft
 Ioa1VniY7NPbYQ4gK4/nmVqQBXO9+PI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-1ZhmvT12OQO8ylWken6bgA-1; Wed, 16 Jun 2021 11:25:06 -0400
X-MC-Unique: 1ZhmvT12OQO8ylWken6bgA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 800F4818401
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 15:25:05 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ABBAA5C1D0;
 Wed, 16 Jun 2021 15:24:57 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC 0/3] qtest: pick tests that require KVM at runtime
Date: Wed, 16 Jun 2021 11:24:52 -0400
Message-Id: <20210616152455.1270264-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: lvivier@redhat.com, thuth@redhat.com, philmd@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Sometimes it's necessary to execute a test that depends on KVM,
however qtest is not aware if tested QEMU binary supports KVM
on the host it the test is executed.

For an example:
 test q35 machine with intel_iommu
 This test will run only is KVM is available and fail
 to start QEMU if it fallsback to TCG, thus failing whole test.
 So if test is executed in VM where nested KVM is not enabled
 or on other than x86 host, it will break 'make check-qtest'

Series adds a lightweight qtest_has_kvm() check, which abuses
build system and should help to avoid running KVM only tests
on hosts that do not support it.

PS:
there is an alternative 'query-accels' QMP command proposal
https://patchwork.kernel.org/project/qemu-devel/patch/20210503211020.894589-3-philmd@redhat.com/
which I think is more robust compared to qtest_has_kvm() and
could be extended to take into account machine type.
But it's more complex and what I dislike about it most,
it requires execution of 'probing' QEMU instance to find
execute 'query-accels' QMP command, which is rather resource
consuming. So I'd use query-accels approach only when it's
the only possible option to minimize load on CI systems.

Igor Mammedov (2):
  tests: acpi: q35: test for x2APIC entries in SRAT
  tests: acpi: update expected tables blobs

root (1):
  tests: qtest: add qtest_has_kvm() to check if tested bynary supports
    KVM

 tests/qtest/libqos/libqtest.h    |   7 +++++++
 meson.build                      |   1 +
 tests/data/acpi/q35/APIC.numamem | Bin 0 -> 2686 bytes
 tests/data/acpi/q35/DSDT.numamem | Bin 7865 -> 35222 bytes
 tests/data/acpi/q35/FACP.numamem | Bin 0 -> 244 bytes
 tests/data/acpi/q35/SRAT.numamem | Bin 224 -> 5080 bytes
 tests/qtest/bios-tables-test.c   |  10 +++++++---
 tests/qtest/libqtest.c           |  20 ++++++++++++++++++++
 8 files changed, 35 insertions(+), 3 deletions(-)
 create mode 100644 tests/data/acpi/q35/APIC.numamem
 create mode 100644 tests/data/acpi/q35/FACP.numamem

-- 
2.27.0


