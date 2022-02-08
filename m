Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A4D4ADD56
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 16:47:27 +0100 (CET)
Received: from localhost ([::1]:36578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHSiE-0007zy-UI
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 10:47:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nHQiV-0002DD-6L
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 08:39:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nHQiS-0005UJ-L1
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 08:39:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644327571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6QhtmobnvxyyPAnWSSX1GKmh/XmnBU17JcwocaYEvtU=;
 b=GKoCngrOiutPJVqI0veXpdcwOIYfUBxRtkkICYENG8m+9C+gLxHkEWZuLR2RYtcL/x6dV+
 bxl3bpOz1FAH3xmdEeJ+5phd9E1khVw6MFhaSjUVq/M5x0PR3WFzFi5u+XPdYNMZy2odLZ
 kW0KAKf2A1l5QBtmrybsA24HioE97AI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-u3cf0wsgPhSS6_9C7Ded7Q-1; Tue, 08 Feb 2022 08:39:28 -0500
X-MC-Unique: u3cf0wsgPhSS6_9C7Ded7Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0F66190A7A1;
 Tue,  8 Feb 2022 13:39:26 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.195.249])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 89D8A708F4;
 Tue,  8 Feb 2022 13:38:47 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com,
 stefanb@linux.vnet.ibm.com, qemu-devel@nongnu.org,
 alex.williamson@redhat.com
Subject: [PATCH v4 0/2] TPM-CRB: Remove spurious error report when used with
 VFIO
Date: Tue,  8 Feb 2022 14:38:40 +0100
Message-Id: <20220208133842.112017-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: quintela@redhat.com, cohuck@redhat.com, f4bug@amsat.org,
 dgilbert@redhat.com, imammedo@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series aims at removing a spurious error message we get when
launching a guest with a TPM-CRB device and VFIO-PCI devices.

The CRB command buffer currently is a RAM MemoryRegion and given
its base address alignment, it causes an error report on
vfio_listener_region_add(). This series proposes to use a ram-device
region instead which helps in better assessing the dma map error
failure on VFIO side.

Best Regards

Eric

This series can be found at:
https://github.com/eauger/qemu/tree/tpm-crb-ram-device-v4

History:
v3 -> v4:
- Use PRIxPTR
- call vmstate_unregister_ram

v2 -> v3: respin by Philippe to remove meson changes

v1 -> v2:
- added tpm_crb_unrealize (dared to keep Stefan's T-b though)


Eric Auger (2):
  tpm: CRB: Use ram_device for "tpm-crb-cmd" region
  hw/vfio/common: Silence ram device offset alignment error traces

 hw/tpm/tpm_crb.c     | 23 +++++++++++++++++++++--
 hw/vfio/common.c     | 15 ++++++++++++++-
 hw/vfio/trace-events |  1 +
 3 files changed, 36 insertions(+), 3 deletions(-)

-- 
2.26.3


