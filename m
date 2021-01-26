Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 117D530376D
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 08:45:02 +0100 (CET)
Received: from localhost ([::1]:52740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4J24-00085H-LS
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 02:45:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1l4J0F-0006qg-CX
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 02:43:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1l4J0D-0001fR-DN
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 02:43:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611646984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=osTmZ4aMmDtsHIY+XzjajP1S/QvpZKzwr0eONuj2iyQ=;
 b=Osl67EPtYGmIVwkXc6Q/jx7rMbZlosPSw+Jr8Vis0ov+wtlHE1CYqjEU7dxJo1jHwZEhQ0
 kgwyoBm6+oUUDoBj43hgdiIYEMDzaxy301yO7mwj52iAnH+k6HGCz7OBNruYI8eblEoFKV
 wECgZNjteXetDS8XsJERXmUYnPEHOQ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-OkJjA7TTN7mHFvPxW8qLzw-1; Tue, 26 Jan 2021 02:43:02 -0500
X-MC-Unique: OkJjA7TTN7mHFvPxW8qLzw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86B5F1922028
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 07:43:01 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-12-115.pek2.redhat.com [10.72.12.115])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 016F75D74E;
 Tue, 26 Jan 2021 07:42:56 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH v3 0/5] vhost-vdpa: add support for configure interrupt
Date: Tue, 26 Jan 2021 15:42:49 +0800
Message-Id: <20210126074254.3225-1-lulu@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: lulu@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These code are all tested in vp-vdpa (support configure interrupt)
vdpa_sim (not support configure interrupt)

test in virtio-pci bus and virtio-mmio bus


change in v2:
Add support fot virtio-mmio bus
active the notifier wihle the backend support configure intterrput
misc fixes form v1

change in v3
fix the coding style problems 

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


