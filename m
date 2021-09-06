Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC5C401B42
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 14:36:48 +0200 (CEST)
Received: from localhost ([::1]:35048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNDri-0008BP-Ro
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 08:36:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mNDp4-0006JG-TE
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 08:34:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mNDn6-0001zN-KJ
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 08:34:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630931520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Rebwq+TaL6L3PI4fjkctNuYRh6Lr7aG5IFVlXwn6YEw=;
 b=M2W7mfzMp4op71A905T7TC5lh+GQf1WfrcbpUflV7kZd5kVSZTdOnb0weFlT0tTrejP9qA
 an1ZC8E806fqdsu1Cm2SwfopjgD83dioacik8kC8unHiIefJsBAFJQTUMG0vlehon5QsSK
 znXN1GcQTjIfsJrjsgCAN2ZjRw/2GNQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-_F_19pjCNpOt-cSv1cCnjw-1; Mon, 06 Sep 2021 08:31:56 -0400
X-MC-Unique: _F_19pjCNpOt-cSv1cCnjw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1E74835E00;
 Mon,  6 Sep 2021 12:31:55 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.194.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1CDF86608B;
 Mon,  6 Sep 2021 12:31:44 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, mst@redhat.com,
 imammedo@redhat.com, philmd@redhat.com, peter.maydell@linaro.org,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 ardb@kernel.org, drjones@redhat.com
Subject: [PATCH v2 0/3] hw/arm/virt_acpi_build: Generate DBG2 table
Date: Mon,  6 Sep 2021 14:31:36 +0200
Message-Id: <20210906123139.93593-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
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
It applies on top of Igor's
[PATCH v2 00/35] acpi: refactor error prone build_header() and
packed structures usage in ACPI tables

The DBG2 specification can be found at
https://docs.microsoft.com/en-us/windows-hardware/drivers/bringup/acpi-debug-port-table.

DBG2 is mandated by ARM SBBR since its v1.0 release (the rationale
behind is Windows requires it on all systems).

The DBG2 is used to describe a debug port, used by the kernel debugger.

This series and its dependency can be found at
https://github.com/eauger/qemu.git
branch: dbg2-v2-igor-v2-fix

History:
v1 -> v2:
- rebase on top of Igor's series and use acpi_init_table/acpi_table_composed
  and build_append_int_noprefix()

Eric Auger (3):
  tests/acpi: Add void table for virt/DBG2 bios-tables-test
  bios-tables-test: Generate reference table for virt/DBG2
  hw/arm/virt_acpi_build: Generate DBG2 table

 hw/arm/virt-acpi-build.c  |  64 +++++++++++++++++++++++++++++++++++++-
 tests/data/acpi/virt/DBG2 | Bin 0 -> 87 bytes
 2 files changed, 63 insertions(+), 1 deletion(-)
 create mode 100644 tests/data/acpi/virt/DBG2

-- 
2.26.3


