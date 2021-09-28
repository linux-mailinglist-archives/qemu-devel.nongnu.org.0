Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B658B41B513
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 19:23:38 +0200 (CEST)
Received: from localhost ([::1]:56746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVGpN-0001WP-Ll
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 13:23:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mVGnh-0008FA-DK
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 13:21:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mVGne-0002Kg-78
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 13:21:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632849708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kmIP1g4WQFFYGPAH0Lp51JKJBAV532ZKLGzeJpfgPh8=;
 b=SnDEkX8hSRK7qI8gF/tbEadGcNPg014vXTk+CRMx+H2j2nK3znQZ3VI9KbNXbL9GcAOLfX
 fNzvjnXaF4se5X5DbJ0Xbq0s41soyu1Sza/sK9evmLL50toPsXO6S0w/VtnNIH0Jp7x+BN
 gw7FltABms+cHzPgA6dyy2+ULzTivWU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-50-zIh_ERtGOx2FqQma0KHW5g-1; Tue, 28 Sep 2021 13:21:46 -0400
X-MC-Unique: zIh_ERtGOx2FqQma0KHW5g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 579BD1006AA2;
 Tue, 28 Sep 2021 17:21:45 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.194.179])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 756025C1C5;
 Tue, 28 Sep 2021 17:21:40 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, imammedo@redhat.com,
 jean-philippe@linaro.org, peter.maydell@linaro.org,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 drjones@redhat.com
Subject: [PATCH 0/3] hw/arm/virt_acpi_build: Upgrate the IORT table up to
 revision E.b
Date: Tue, 28 Sep 2021 19:21:30 +0200
Message-Id: <20210928172133.79665-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
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
Cc: philmd@redhat.com, gshan@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series upgrades the ACPI IORT table up to the E.b
specification revision. One of the goal of this upgrade
is to allow the addition of RMR nodes along with the SMMUv3.

It applies on top of Igor's
[PATCH v4 00/35] acpi: refactor error prone build_header() and
packed structures usage in ACPI tables

The latest IORT specification (ARM DEN 0049E.b) can be found at
IO Remapping Table - Platform Design Document
https://developer.arm.com/documentation/den0049/latest/

This series and its dependency can be found at
https://github.com/eauger/qemu.git
branch: igor_acpi_refactoring_v4_dbg2_v3_rmr_v1

Eric Auger (3):
  tests/acpi: Get prepared for IORT E.b revision upgrade
  hw/arm/virt-acpi-build: IORT upgrade up to revision E.b
  tests/acpi: Generate reference blob for IORT rev E.b

 hw/arm/virt-acpi-build.c          |  47 ++++++++++++++++++------------
 tests/data/acpi/virt/IORT         | Bin 124 -> 128 bytes
 tests/data/acpi/virt/IORT.memhp   | Bin 124 -> 128 bytes
 tests/data/acpi/virt/IORT.numamem | Bin 124 -> 128 bytes
 tests/data/acpi/virt/IORT.pxb     | Bin 124 -> 128 bytes
 5 files changed, 28 insertions(+), 19 deletions(-)

-- 
2.26.3


