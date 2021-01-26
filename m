Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BADB303710
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 08:07:33 +0100 (CET)
Received: from localhost ([::1]:33604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4IRo-000331-By
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 02:07:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1l4IOc-0001SX-Pa
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 02:04:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1l4IOX-0006AQ-06
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 02:04:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611644648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cXnUBMfmrlyjxHd8sWG7jitTXEqnKlp1Rg9+Oy1kTGg=;
 b=GQj/k0U/8B93PdA8r18xWiH5Of6reH1elUF9Flc4uIk2jCNmXKae3PsvrPxalytchN86e6
 giAru1Kvz5Xk4L2Hz36r2011e8fgPWdpcFD/+ThTJunH60yZGbdctsfrT3HO1YfVrZuLGd
 E9kfV2HfkDjtrntdS4zwvk+Al+8KPlo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-S4LBz4zBOKKQTyDZ8I2u6A-1; Tue, 26 Jan 2021 02:04:06 -0500
X-MC-Unique: S4LBz4zBOKKQTyDZ8I2u6A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66008107ACF6
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 07:04:05 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-12-115.pek2.redhat.com [10.72.12.115])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D464A1F0;
 Tue, 26 Jan 2021 07:04:00 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH v2 0/5] vhost-vdpa: add support for configure interrupt
Date: Tue, 26 Jan 2021 15:03:46 +0800
Message-Id: <20210126070351.28575-1-lulu@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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

These code are all tested in vp-vdpa (support configure interrupt)
vdpa_sim (not support configure interrupt)

change in v2:
Add support for virtio-mmio bus
Active the notifier while the backend support configure interrupt
Misc fixes form v1

Cindy Lu (5):
  virtio: add support for configure interrupt
  vhost_net: enable configure interrupt when vhost_net start
  virtio-pci: add support for configure interrupt
  virtio-mmio: add support for configure interrupt
  vhost-vdpa: add callback function for configure interrupt

 hw/net/vhost_net.c                | 19 ++++++-
 hw/virtio/trace-events            |  2 +
 hw/virtio/vhost-vdpa.c            | 37 ++++++++++++-
 hw/virtio/virtio-mmio.c           | 16 ++++++
 hw/virtio/virtio-pci.c            | 92 +++++++++++++++++++++++++------
 hw/virtio/virtio.c                | 26 +++++++++
 include/hw/virtio/vhost-backend.h |  4 ++
 include/hw/virtio/virtio-bus.h    |  2 +
 include/hw/virtio/virtio.h        |  6 ++
 9 files changed, 185 insertions(+), 19 deletions(-)

-- 
2.21.3


