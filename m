Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D00B66F5444
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:15:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8aC-0004QY-TB; Wed, 03 May 2023 05:15:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1pu8a9-00041V-Ip
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:15:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1pu8a7-0007QR-79
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:15:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683105326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=oo17B0IxrLILyzykMeHKsS4rxcZEeZx6eK4GSGK2Xvo=;
 b=GGJDe171tcd8i4VZxFUCZzgf8aDY2hBfiniQx5WgRn3A0RDBHK1Z44J1JRNGTKPUA83xsy
 luztzxqlmSy6Nb3OcmTbs66Qwh3Q1/ERunslAutIO5cXdQcjxTp/IhfQd/EZND5Jwz03Pl
 MOBl3plJ380ywJARdksUoVWJdRRYThQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-427-Z6203Y4DNfWbIEto-eUxKw-1; Wed, 03 May 2023 05:13:42 -0400
X-MC-Unique: Z6203Y4DNfWbIEto-eUxKw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3D0E5A0F385
 for <qemu-devel@nongnu.org>; Wed,  3 May 2023 09:13:42 +0000 (UTC)
Received: from server.redhat.com (ovpn-12-29.pek2.redhat.com [10.72.12.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 48E5E492C13;
 Wed,  3 May 2023 09:13:39 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com, mst@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org
Subject: [RFC 0/7] vhost-vdpa: add support for iommufd
Date: Wed,  3 May 2023 17:13:30 +0800
Message-Id: <20230503091337.2130631-1-lulu@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi All
There is the RFC to support the IOMMUFD in vdpa device
any comments are welcome
Thanks
Cindy

Cindy Lu (7):
  vhost: introduce new UAPI to support IOMMUFD
  qapi: support iommufd in vdpa
  virtio : add a ptr for vdpa_iommufd in VirtIODevice
  net/vhost-vdpa: Add the check for iommufd
  vhost-vdpa: Add the iommufd support in the map/unmap function
  vhost-vdpa: init iommufd function in vhost_vdpa start
  vhost-vdpa-iommufd: Add iommufd support for vdpa

 hw/virtio/meson.build          |   2 +-
 hw/virtio/vhost-vdpa-iommufd.c | 240 +++++++++++++++++++++++++++++++++
 hw/virtio/vhost-vdpa.c         |  74 +++++++++-
 include/hw/virtio/vhost-vdpa.h |  47 +++++++
 include/hw/virtio/virtio.h     |   5 +
 linux-headers/linux/vhost.h    |  72 ++++++++++
 net/vhost-vdpa.c               |  31 +++--
 qapi/net.json                  |   1 +
 8 files changed, 451 insertions(+), 21 deletions(-)
 create mode 100644 hw/virtio/vhost-vdpa-iommufd.c

-- 
2.34.3


