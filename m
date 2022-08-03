Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0739588EFC
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 16:57:30 +0200 (CEST)
Received: from localhost ([::1]:55054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJFoP-00047S-A4
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 10:57:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=207aa399e=bchalios@amazon.es>)
 id 1oJEdw-0005Ip-13
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 09:42:36 -0400
Received: from smtp-fw-9102.amazon.com ([207.171.184.29]:41459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=207aa399e=bchalios@amazon.es>)
 id 1oJEdt-00047U-L0
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 09:42:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.es; i=@amazon.es; q=dns/txt; s=amazon201209;
 t=1659534153; x=1691070153;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=84psbJj3d8XwJtc6pvu/oa4oKWKQsJTqiXYLBx106aE=;
 b=mOLOfq09aKrmZUxidUFFuU+C+4XHs7J3XJNmHyH8WBlXAAXtpDtoz8kN
 ZB9px6AClWi0vYEMRopLLRcmFu82Wr0vbWmbpUC5DVbH/+VdedwMMOT3c
 oMqFZDQiwcanl4M5kJljrwfUAZDruOiiSq6gmlRUV6RPOOLhiDN7qMiOU M=;
X-IronPort-AV: E=Sophos;i="5.93,214,1654560000"; d="scan'208";a="244973580"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 email-inbound-relay-iad-1d-35b1f9a2.us-east-1.amazon.com) ([10.25.36.210])
 by smtp-border-fw-9102.sea19.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2022 13:42:15 +0000
Received: from EX13D37EUA003.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
 by email-inbound-relay-iad-1d-35b1f9a2.us-east-1.amazon.com (Postfix) with
 ESMTPS id 34A33203A4F; Wed,  3 Aug 2022 13:42:13 +0000 (UTC)
Received: from f4d4887fdcfb.ant.amazon.com (10.43.162.227) by
 EX13D37EUA003.ant.amazon.com (10.43.165.7) with Microsoft SMTP Server (TLS)
 id 15.0.1497.36; Wed, 3 Aug 2022 13:42:09 +0000
From: <bchalios@amazon.es>
To: <qemu-devel@nongnu.org>
CC: <bchalios@amazon.es>, <ani@anisinha.ca>, <mst@redhat.com>,
 <imammedo@redhat.com>, <dwmw@amazon.co.uk>, <graf@amazon.de>,
 <xmarcalx@amazon.co.uk>
Subject: [PATCH 0/2] vmgenid: add generation counter
Date: Wed, 3 Aug 2022 15:41:45 +0200
Message-ID: <20220803134147.31073-1-bchalios@amazon.es>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
MIME-Version: 1.0
X-Originating-IP: [10.43.162.227]
X-ClientProxiedBy: EX13D41UWC002.ant.amazon.com (10.43.162.127) To
 EX13D37EUA003.ant.amazon.com (10.43.165.7)
Precedence: Bulk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.171.184.29;
 envelope-from=prvs=207aa399e=bchalios@amazon.es; helo=smtp-fw-9102.amazon.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 03 Aug 2022 10:54:38 -0400
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Babis Chalios <bchalios@amazon.es>

VM generation ID exposes a GUID inside the VM which changes every time a
VM restore is happening. Typically, this GUID is used by the guest
kernel to re-seed its internal PRNG. As a result, this value cannot be
exposed in guest user-space as a notification mechanism for VM restore
events.

This patch set extends vmgenid to introduce a 32 bits generation counter
whose purpose is to be used as a VM restore notification mechanism for
the guest user-space.

It is true that such a counter could be implemented entirely by the
guest kernel, but this would rely on the vmgenid ACPI notification to
trigger the counter update, which is inherently racy. Exposing this
through the monitor allows the updated value to be in-place before
resuming the vcpus, so interested user-space code can (atomically)
observe the update without relying on the ACPI notification.

Babis Chalios (2):
  vmgenid: make device data size configurable
  vmgenid: add generation counter

 docs/specs/vmgenid.txt    | 101 ++++++++++++++++++--------
 hw/acpi/vmgenid.c         | 145 +++++++++++++++++++++++++++++++-------
 include/hw/acpi/vmgenid.h |  23 ++++--
 3 files changed, 204 insertions(+), 65 deletions(-)

-- 
2.37.1

Amazon Spain Services sociedad limitada unipersonal, Calle Ramirez de Prado 5, 28045 Madrid. Registro Mercantil de Madrid . Tomo 22458 . Folio 102 . Hoja M-401234 . CIF B84570936


