Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC2A272495
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Sep 2020 15:06:59 +0200 (CEST)
Received: from localhost ([::1]:45116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKLX0-0007CL-9m
	for lists+qemu-devel@lfdr.de; Mon, 21 Sep 2020 09:06:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1kKLUu-00055f-Dl
 for qemu-devel@nongnu.org; Mon, 21 Sep 2020 09:04:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1kKLUs-0006dN-1n
 for qemu-devel@nongnu.org; Mon, 21 Sep 2020 09:04:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600693485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DCMVMyqRvjufVUsx514y3peZmXtQpzBU5Zn/XBDL3tA=;
 b=aO/AzHkchnExRz2B1VhGAdXj/mK2d3Efk2w2T560MC4u46sflQYASZltBrE92pdz6Neydo
 PcTNC+ak/bJcVshZoSiooy17IjY5ZBjatbIbODRyswwIQtIepwUNKeKHVXV3uk0RHQGdgj
 QZwX72qXZCtrhn9uNejpmJ8ZGOWcMOo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-QmyNPsCiP9SlLeIsOQXiYA-1; Mon, 21 Sep 2020 09:04:38 -0400
X-MC-Unique: QmyNPsCiP9SlLeIsOQXiYA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 498D11040C54
 for <qemu-devel@nongnu.org>; Mon, 21 Sep 2020 13:04:33 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-113-15.ams2.redhat.com [10.36.113.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C0294805F2;
 Mon, 21 Sep 2020 13:04:07 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] vhost-vdpa: add trace functions in vhost-vdpa.c
Date: Mon, 21 Sep 2020 15:04:04 +0200
Message-Id: <20200921130406.941363-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/21 01:43:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.455,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add trace events functions in vdpa functions.=0D
=0D
Modify qemu_hexdump() to be able to dump the vdpa config=0D
in trace logs in hexadecimal form.=0D
=0D
v2: fix problems reported by checkpatch (TAB, missing 0x and 80+ line)=0D
    added Stefan Acked-by=0D
=0D
Laurent Vivier (2):=0D
  util/hexdump: introduce qemu_hexdump_line()=0D
  vhost-vdpa: add trace-events=0D
=0D
 hw/virtio/trace-events | 29 ++++++++++++++=0D
 hw/virtio/vhost-vdpa.c | 86 +++++++++++++++++++++++++++++++++++++++---=0D
 include/qemu-common.h  |  8 ++++=0D
 util/hexdump.c         | 54 ++++++++++++++++----------=0D
 4 files changed, 152 insertions(+), 25 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


