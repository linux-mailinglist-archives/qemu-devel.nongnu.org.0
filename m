Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D85F932370D
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 06:56:20 +0100 (CET)
Received: from localhost ([::1]:50436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEn9n-00036j-Qg
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 00:56:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lEn7j-0001Yi-PW
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 00:54:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lEn7i-0003qG-A7
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 00:54:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614146049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LWQBYpqHeqPKZXPtrrDMpX3vpjQmFCAgiD8xPTWwcRY=;
 b=I7nElcUAgjlePHRytx/IN3AxK795AOiF6ZuElDMqNQG5MjbliLZh0+1nTVGl8s+zvNeaod
 oA+I7W0OlFD8dUlGgENdrUoA24HgJB/8mpWwisr3PCeOjF9eoeZebir8vdD7Kj2ziCGmd+
 qkUp3779dHwHV3QFTWex3PeDtyD+oTs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-yAX1tSFdOHSK1AUuiFYQbQ-1; Wed, 24 Feb 2021 00:54:07 -0500
X-MC-Unique: yAX1tSFdOHSK1AUuiFYQbQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81AC21020C20
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 05:54:06 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-13-164.pek2.redhat.com [10.72.13.164])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2923B6061F;
 Wed, 24 Feb 2021 05:54:03 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: jasowang@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH 0/6] Detect reentrant RX casue by loopback
Date: Wed, 24 Feb 2021 13:53:55 +0800
Message-Id: <20210224055401.492407-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: ppandit@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi All:

Followed by commit 22dc8663d9 ("net: forbid the reentrant RX"), we
still need to fix the issues casued by loopback mode where the NIC
usually it via calling nc->info->receive() directly.

The fix is to introduce new network helper and check the
queue->delivering.

Thanks

Jason Wang (6):
  net: introduce qemu_receive_packet()
  e1000: switch to use qemu_receive_packet() for loopback
  dp8393x: switch to use qemu_receive_packet() for loopback packet
  msf2-mac: switch to use qemu_receive_packet() for loopback
  sungem: switch to use qemu_receive_packet() for loopback
  tx_pkt: switch to use qemu_receive_packet_iov() for loopback

 hw/net/dp8393x.c    |  2 +-
 hw/net/e1000.c      |  2 +-
 hw/net/msf2-emac.c  |  2 +-
 hw/net/net_tx_pkt.c |  2 +-
 hw/net/sungem.c     |  2 +-
 include/net/net.h   |  5 +++++
 include/net/queue.h |  8 ++++++++
 net/net.c           | 38 +++++++++++++++++++++++++++++++-------
 net/queue.c         | 22 ++++++++++++++++++++++
 9 files changed, 71 insertions(+), 12 deletions(-)

-- 
2.25.1


