Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D74E44330ED
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 10:16:02 +0200 (CEST)
Received: from localhost ([::1]:44644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mckHx-0008Mp-VL
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 04:16:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mck3p-0001bV-PQ
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 04:01:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mck3l-0001Tb-S9
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 04:01:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634630479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=esMyf9ZLxyAOcjKRTaK1huDYYHr0ic0O2faqCwFtCL0=;
 b=jR5edC9qsfmeu9Lq/Tr4WVcTSAxOj/3+QA8BPRaD939VWDWh2QxJ6/nFDLoEcT2lbKtk5l
 9iCBR/o5zfl/bDGgx1L5Jx3jP0sLuFXAC40zt0Ybbj8XQefAgMf7waIQUcHOrIifBNi461
 01/ShoCkl0hQfFcfVVTNtxgpNlJlmSU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-uIJR-jNsNWyzmLFkPbLB5g-1; Tue, 19 Oct 2021 04:01:16 -0400
X-MC-Unique: uIJR-jNsNWyzmLFkPbLB5g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E31E180FCA7;
 Tue, 19 Oct 2021 08:01:15 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EF35518352;
 Tue, 19 Oct 2021 08:00:38 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, mst@redhat.com,
 imammedo@redhat.com, richard.henderson@linaro.org, philmd@redhat.com,
 peter.maydell@linaro.org, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, ardb@kernel.org, drjones@redhat.com
Subject: [PATCH v5 0/3] hw/arm/virt_acpi_build: Generate DBG2 table
Date: Tue, 19 Oct 2021 10:00:34 +0200
Message-Id: <20211019080037.930641-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: gshan@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series generates the ACPI DBG2 table along with machvirt.

The DBG2 specification can be found at
https://docs.microsoft.com/en-us/windows-hardware/drivers/bringup/acpi-debug-port-table.

DBG2 is mandated by ARM SBBR since its v1.0 release (the rationale
behind is Windows requires it on all systems).

The DBG2 is used to describe a debug port, used by the kernel debugger.

The series can be found at:
https://github.com/eauger/qemu.git
branch: dbg2_v5

History:

v4 -> v5:
- added Drew and Igor's R-b on patch 2.

v3 -> v4:
- fix revision in header (0)
- added Michael's R-b
- address 2 minor style issues (Drew, Igor)

v2 -> v3:
- addressed all comments from Igor on v2:
  patches 2/3 swapped
  style adjustments in "hw/arm/virt_acpi_build: Generate DBG2 table"
  + more precision on spec references

v1 -> v2:
- rebase on top of Igor's series and use acpi_init_table/acpi_table_composed
  and build_append_int_noprefix()


Eric Auger (3):
  tests/acpi: Add void table for virt/DBG2 bios-tables-test
  hw/arm/virt_acpi_build: Generate DBG2 table
  bios-tables-test: Generate reference table for virt/DBG2

 hw/arm/virt-acpi-build.c  |  63 +++++++++++++++++++++++++++++++++++++-
 tests/data/acpi/virt/DBG2 | Bin 0 -> 87 bytes
 2 files changed, 62 insertions(+), 1 deletion(-)
 create mode 100644 tests/data/acpi/virt/DBG2

-- 
2.26.3


