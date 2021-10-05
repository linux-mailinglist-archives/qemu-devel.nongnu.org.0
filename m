Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E50C44220FD
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 10:40:36 +0200 (CEST)
Received: from localhost ([::1]:43442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXg04-0001ED-0k
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 04:40:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mXfyP-0008DZ-Ou
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 04:38:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mXfyL-00038H-Np
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 04:38:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633423128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xT4hT8LIFK9GF71gsYPVEFz61itjAmLS4OfPdurpPoQ=;
 b=CWLavrGixXihqf947aSOoH7d9yOgE2sp/JcySyEuRUugFuuLSJDQIaEvKLGQcawMFHns7a
 wKn/dEYLT85G/6Ph+ch0QaZUU9tswt1rNqifdPkw/GCceJe1zQujUew0WrIKIfW48syyIc
 cbY2cwpWQmFzGyQYCbeGHHUx8WXe+bw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-bGUoymUXO7iLj4fJubc19g-1; Tue, 05 Oct 2021 04:38:46 -0400
X-MC-Unique: bGUoymUXO7iLj4fJubc19g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 672DA18125C9;
 Tue,  5 Oct 2021 08:38:45 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6167F9AA20;
 Tue,  5 Oct 2021 08:38:08 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, imammedo@redhat.com,
 philmd@redhat.com, peter.maydell@linaro.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, drjones@redhat.com
Subject: [PATCH v2 0/3] hw/arm/virt_acpi_build: Upgrate the IORT table up to
 revision E.b
Date: Tue,  5 Oct 2021 10:38:02 +0200
Message-Id: <20211005083805.493456-1-eric.auger@redhat.com>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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
branch: igor_acpi_refactoring_v4_dbg2_v3_rmr_v2

History:
v1 -> v2:
- fix Revision value in ITS and SMMUv3 nodes (Phil)
- Increment an identifier (Phil)


Eric Auger (3):
  tests/acpi: Get prepared for IORT E.b revision upgrade
  hw/arm/virt-acpi-build: IORT upgrade up to revision E.b
  tests/acpi: Generate reference blob for IORT rev E.b

 hw/arm/virt-acpi-build.c          |  48 ++++++++++++++++++------------
 tests/data/acpi/virt/IORT         | Bin 124 -> 128 bytes
 tests/data/acpi/virt/IORT.memhp   | Bin 124 -> 128 bytes
 tests/data/acpi/virt/IORT.numamem | Bin 124 -> 128 bytes
 tests/data/acpi/virt/IORT.pxb     | Bin 124 -> 128 bytes
 5 files changed, 29 insertions(+), 19 deletions(-)

-- 
2.26.3


