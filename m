Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E171B2F4F1C
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 16:48:05 +0100 (CET)
Received: from localhost ([::1]:51074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kziNQ-0007TZ-V3
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 10:48:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1kziLO-0006QT-Rx
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 10:45:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1kziLN-00067O-Br
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 10:45:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610552754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fWAxbTKITLOVDureSGMLeqcDlTFDq6rJysEE/l07PMk=;
 b=frzcW89CqcxiIZa4tPDtKrb4LyMG/VIlnO4wEcshO/uDMV29Ot8F3UQkeiw2Esj/WrbxoU
 r5hMn/+iOvz8PV+YYkuwcBcKJx9ih0r3QB21QauTkTJxnWQ2jplKmWbgDdrRtb3GuT9SQV
 OMN0udI8epXz0W/WkiE3SaxTlAeMfzA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-6S35sCPUPg2rviTafF7bmA-1; Wed, 13 Jan 2021 10:45:52 -0500
X-MC-Unique: 6S35sCPUPg2rviTafF7bmA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE0E21922961
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 15:45:51 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-12-95.pek2.redhat.com [10.72.12.95])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5398C6F975;
 Wed, 13 Jan 2021 15:45:47 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com,
	qemu-devel@nongnu.org
Subject: =?UTF-8?Q?[PATCH_v1_0/4]_vhost-vdpa:_add_?=
 =?UTF-8?Q?support_for_configure_interrupt=C2=A0?=
Date: Wed, 13 Jan 2021 23:45:36 +0800
Message-Id: <20210113154540.24981-1-lulu@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: lulu@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add configure interrupt support in vdpa_vhost. qemu will use the irqfd
process to support this feature.

These code are all tested in vp-vdpa (support configure interrupt)
vdpa_sim (not support configure interrupt)


Cindy Lu (4):
  virtio:add support in configure interrupt
  virtio-pci:add support for configure interrupt
  vhost_net:enable configure interrupt when vhost_net start
  vhost-vdpa:add callback function for configure interrupt

 hw/net/vhost_net.c                | 19 ++++++-
 hw/virtio/trace-events            |  2 +
 hw/virtio/vhost-vdpa.c            | 29 +++++++++-
 hw/virtio/virtio-pci.c            | 93 +++++++++++++++++++++++++++++++
 hw/virtio/virtio.c                | 25 +++++++++
 include/hw/virtio/vhost-backend.h |  4 ++
 include/hw/virtio/virtio-bus.h    |  2 +
 include/hw/virtio/virtio.h        |  5 ++
 8 files changed, 177 insertions(+), 2 deletions(-)

-- 
2.21.3


