Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C893D2193FB
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jul 2020 01:03:00 +0200 (CEST)
Received: from localhost ([::1]:51052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtJ5f-0008OL-Tp
	for lists+qemu-devel@lfdr.de; Wed, 08 Jul 2020 19:02:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1jtIpw-0001sN-G4
 for qemu-devel@nongnu.org; Wed, 08 Jul 2020 18:46:44 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:32169
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1jtIpu-0004SM-47
 for qemu-devel@nongnu.org; Wed, 08 Jul 2020 18:46:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594248400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=c21gzZM4SEQJIM8rVcxiVmksYzojO+Ev7lGfeqEXypg=;
 b=V56AhjCsHsD+AV7mxja0GKz7N8mtf6eQxVTUfWnHctqvA/wykFexYb5whzOXZLdYQqKOBH
 TTKGGt9UJVEmyonazvO5pJ1zKhFh6n6D/YunChZmikvi8+rmadLrINEk3scRnU6nDnd1/y
 kpY7Y3VMQXxc9Rsnaw2QALD6T6t5JIQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-PK_6pGIPPL2bUL3zQzP4mg-1; Wed, 08 Jul 2020 18:46:38 -0400
X-MC-Unique: PK_6pGIPPL2bUL3zQzP4mg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C65D71005504;
 Wed,  8 Jul 2020 22:46:37 +0000 (UTC)
Received: from localhost.com (unknown [10.40.192.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 97D5510016E8;
 Wed,  8 Jul 2020 22:46:30 +0000 (UTC)
From: Julia Suvorova <jusual@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 0/5] Use ACPI PCI hot-plug for q35
Date: Thu,  9 Jul 2020 00:46:10 +0200
Message-Id: <20200708224615.114077-1-jusual@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jusual@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=jusual@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 17:25:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_FAKE_HELO_DOTCOM=1.189, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>, Julia Suvorova <jusual@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PCIe native hot-plug has numerous problems with racing events and unpredictable
guest behaviour (Windows). Switching to ACPI hot-plug for now.

Tested on RHEL 8 and Windows 2019.

pxb-pcie is not yet supported.

Julia Suvorova (5):
  hw/acpi/pcihp: Introduce find_host()
  hw/acpi/ich9: Trace ich9_gpe_readb()/writeb()
  hw/i386/acpi-build: Add ACPI PCI hot-plug methods to q35
  hw/i386/acpi-build: Turn off support of PCIe native hot-plug and SHPC
    in _OSC
  hw/acpi/ich9: Enable ACPI PCI hot-plug

 hw/i386/acpi-build.h   |  2 ++
 include/hw/acpi/ich9.h |  3 +++
 hw/acpi/ich9.c         | 52 +++++++++++++++++++++++++++++++++++++++++-
 hw/acpi/pcihp.c        | 16 ++++++++++++-
 hw/i386/acpi-build.c   | 34 +++++++++++++++++----------
 hw/i386/pc.c           |  4 +++-
 hw/acpi/trace-events   |  4 ++++
 7 files changed, 100 insertions(+), 15 deletions(-)

-- 
2.25.4


