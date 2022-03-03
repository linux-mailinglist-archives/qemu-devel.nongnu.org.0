Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D3F4CB560
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 04:19:26 +0100 (CET)
Received: from localhost ([::1]:44816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPbzx-0006Kg-Bv
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 22:19:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nPbtB-0007Ue-W2
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 22:12:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nPbt8-0003dE-HT
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 22:12:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646277141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2/mZmVzWIP7KHK/fgzCmeeY2iqLmkgT+xBc7nsDvvn8=;
 b=Cjejj9kQHneP4gggVggXMmlGU3JXlPyJ8E44eqCFEGF687TU3PfuKPyKDTcmlqJOSnGOI6
 13irh0+/+qcJhFkLlrOveIq7tsdkO5X80Cvf5Oc1HMh7g3QopynUanmsuyS+t7h6pNJeCu
 x9mBBx8jRzr5nGlop/sc6u7W23DI7s4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-363-XKwgS_MVPdOVVJU60brcaw-1; Wed, 02 Mar 2022 22:12:18 -0500
X-MC-Unique: XKwgS_MVPdOVVJU60brcaw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B288E8070F0;
 Thu,  3 Mar 2022 03:12:16 +0000 (UTC)
Received: from gshan.redhat.com (ovpn-13-119.pek2.redhat.com [10.72.13.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5037C1006854;
 Thu,  3 Mar 2022 03:12:04 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v2 0/3] hw/arm/virt: Fix CPU's default NUMA node ID
Date: Thu,  3 Mar 2022 11:11:49 +0800
Message-Id: <20220303031152.145960-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, zhenyzha@redhat.com, wangyanan55@huawei.com,
 shan.gavin@gmail.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When the CPU-to-NUMA association isn't provided by user, the default NUMA
node ID for the specific CPU is returned from virt_get_default_cpu_node_id().
Unfortunately, the default NUMA node ID breaks socket boundary and leads to
the broken CPU topology warning message in Linux guest. This series intends
to fix the issue.

PATCH[1/3]: Fixes the broken CPU topology by considering the socket boundary
            when the default NUMA node ID is calculated.
PATCH[2/3]: Use the existing CPU topology to build PPTT table. However, the
            cluster ID has to be calculated dynamically because there is no
            corresponding information in CPU instance properties.
PATCH[3/3]: Take thread ID as the ACPI processor ID in MDAT and SRAT tables.

Changelog
=========
v2:
   * Populate the CPU topology in virt_possible_cpu_arch_ids() so that it
     can be reused in virt_get_default_cpu_node_id()                          (Igor)
   * Added PATCH[2/3] to use the existing CPU topology when PPTT table
     is built                                                                 (Igor)
   * Added PATCH[3/3] to take thread ID as ACPI processor ID in MADT and
     SRAT table                                                               (Gavin)

Gavin Shan (3):
  hw/arm/virt: Fix CPU's default NUMA node ID
  hw/acpi/aml-build: Use existing CPU topology to build PPTT table
  hw/arm/virt: Unify ACPI processor ID in MADT and SRAT table

 hw/acpi/aml-build.c      | 106 ++++++++++++++++++++++++++++++---------
 hw/arm/virt-acpi-build.c |  12 +++--
 hw/arm/virt.c            |  17 ++++++-
 3 files changed, 107 insertions(+), 28 deletions(-)

-- 
2.23.0


