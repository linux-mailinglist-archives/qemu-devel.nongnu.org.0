Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 505BE432F4D
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 09:24:22 +0200 (CEST)
Received: from localhost ([::1]:41700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcjTx-0005EU-BQ
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 03:24:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mcjLy-00031u-Qb
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 03:16:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mcjLw-0004wr-P1
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 03:16:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634627764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1+Vke/DKqMJiOINHIcmDhCeagUoC/h2zRobooVAE83Y=;
 b=NiSYRCMv9v56HmruKMJdYorUNa56GWZt0UtQUU8Vo3uCvRnwD8Qm7ajzEPB81ndPfwIzUl
 Fr1cYJ7ccQow3kDC77n2SD3vmkfrssc9xUGB/1+N31hmfqxtC61Rd0kq5PkQbEhASRzkOw
 naU0cGnUX1NgNXWoyxKbUJHroKfXvvA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-lVDN_yCJNJKSbOdEx1npPA-1; Tue, 19 Oct 2021 03:16:00 -0400
X-MC-Unique: lVDN_yCJNJKSbOdEx1npPA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0D1718414A0
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 07:15:59 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.193.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E166260657;
 Tue, 19 Oct 2021 07:15:33 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] failover: fix a regression introduced by JSON'ification
 of -device
Date: Tue, 19 Oct 2021 09:15:30 +0200
Message-Id: <20211019071532.682717-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin's series "qdev: Add JSON -device" has introduced a regression=0D
in failover by removing the QemuOpts parameter.=0D
=0D
This series fixes that (see PATCH 1) and also makes some cleanup=0D
in the hide_device function caller to remove the failover specific=0D
code from qdev_device_add_from_qdict() and clarify the fact that=0D
a primary device must have an id.=0D
=0D
Laurent Vivier (2):=0D
  failover: fix a regression introduced by JSON'ification of -device=0D
  qdev/qbus: remove failover specific code=0D
=0D
 hw/net/virtio-net.c    | 36 +++++++++++++++++++++++++++++-------=0D
 softmmu/qdev-monitor.c | 18 ++++++------------=0D
 2 files changed, 35 insertions(+), 19 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


