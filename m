Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CFC398469
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 10:42:28 +0200 (CEST)
Received: from localhost ([::1]:53246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loMSJ-0007hA-3t
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 04:42:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1loMRE-00065E-E1
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 04:41:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1loMRB-0003aw-AQ
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 04:41:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622623276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lyW0xdVilPCbjfh9nQ5WoXdesK357LfiX0QZwrOCbyY=;
 b=QOrk2qMMYy7nTOI1gIN2ILssyV3qMzbvMMm2qxiDjqp/9EVm+ICQlasHyf1Fc6EYF/ck9Y
 fjLH4Whd6fTHYRWtx5jIAfsmIHQKIB/v76inhp/n0LHp6FriQtFJiAwQY+MQTaUac5qyut
 Bi2fvyP0HG1ALCRIy9mCLbfhk2oGXfw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-qJAy3d6dMXqoqkn4MDNo4g-1; Wed, 02 Jun 2021 04:41:14 -0400
X-MC-Unique: qJAy3d6dMXqoqkn4MDNo4g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D36E1107ACCD;
 Wed,  2 Jun 2021 08:41:13 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-208.pek2.redhat.com
 [10.72.12.208])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A3A3E5C648;
 Wed,  2 Jun 2021 08:41:08 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH V2 0/2] vhost-vDPA: vq notification map support
Date: Wed,  2 Jun 2021 16:41:04 +0800
Message-Id: <20210602084106.43186-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: si-wei.liu@oracle.com, elic@nvidia.com, lingshan.zhu@intel.com,
 Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi All:

This series tries to implement doorbell mapping support for
vhost-vDPA. Tested with virtio-pci vDPA driver.

Please review.

Changes since V1:
- use dev->vq_index to calculate the virtqueue index
- remove the unused host_notifier_set

Jason Wang (2):
  vhost-vdpa: skip ram device from the IOTLB mapping
  vhost-vdpa: map virtqueue notification area if possible

 hw/virtio/vhost-vdpa.c         | 97 ++++++++++++++++++++++++++++++----
 include/hw/virtio/vhost-vdpa.h |  6 +++
 2 files changed, 93 insertions(+), 10 deletions(-)

-- 
2.25.1


