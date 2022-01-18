Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 741164929FB
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 17:02:53 +0100 (CET)
Received: from localhost ([::1]:50030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9qwd-0003Mt-Vx
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 11:02:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1n9qWc-0001f8-Tv
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 10:35:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1n9qWZ-0003Kp-Ux
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 10:35:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642520154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zNafKdhj1wLex5i+yLHt8Fk4/aCANVIpwsCcz5PJptM=;
 b=bsHcdkczuxGusZ8xU0m9jKLEwLX0fyF+23sfk5wJILRzXGDc9zz/xSPSMRaRM7tkBRif0g
 zMpG5BwgEdqEOsK43TynDDeJl1ygcIuDUssNikapuf7KTWJiE8gQXiDUSPsszaOSvnRSMi
 3oF7sHPF0RHnOFoHcpnZECVFLocJiwI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-573-Bd3b73gyPEyq02Wj6eMQUQ-1; Tue, 18 Jan 2022 10:35:50 -0500
X-MC-Unique: Bd3b73gyPEyq02Wj6eMQUQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D42810C4CFA;
 Tue, 18 Jan 2022 15:33:45 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.194.124])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 711BBB0D43;
 Tue, 18 Jan 2022 15:33:08 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com,
 stefanb@linux.vnet.ibm.com, qemu-devel@nongnu.org,
 alex.williamson@redhat.com
Subject: [PATCH v2 0/2] TPM-CRB: Remove spurious error report when used with
 VFIO
Date: Tue, 18 Jan 2022 16:33:04 +0100
Message-Id: <20220118153306.282681-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: cohuck@redhat.com, david@gibson.dropbear.id.au
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
https://github.com/eauger/qemu/tree/tpm-crb-ram-device-v2

History:
v1 -> v2:
- added tpm_crb_unrealize (dared to keep Stefan's T-b though)

Eric Auger (2):
  tpm: CRB: Use ram_device for "tpm-crb-cmd" region
  hw/vfio/common: Silence ram device offset alignment error traces

 hw/tpm/meson.build   |  2 +-
 hw/tpm/tpm_crb.c     | 22 ++++++++++++++++++++--
 hw/vfio/common.c     | 15 ++++++++++++++-
 hw/vfio/trace-events |  1 +
 4 files changed, 36 insertions(+), 4 deletions(-)

-- 
2.26.3


