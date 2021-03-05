Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1BE32E21E
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 07:28:29 +0100 (CET)
Received: from localhost ([::1]:41682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI3wp-0004tn-Pz
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 01:28:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lI3vG-0003mJ-Jk
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 01:26:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lI3vE-0005Rh-S4
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 01:26:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614925608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=B9OI7PXsH/cGVlnkYYWLf40hzVn+RKlv7C5LbdP6/3w=;
 b=gbimOLbArs2KhoBeI/yWLaP2Taxc+sTNi5k5FZWRN0qNMTH6kWrAYtQ+0TKEEw9Xh1eUx1
 096LEDsLS7JP83he/6VKDmckCy/sl6ddF9Nn5tu5ybFVC+vdfIlyodtQVywrnFbaB+tGfY
 hPt9gk1kVPZF6uFzkyKQAKnCSh9cPEU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-wz3iVuscM620IZkPDggFwQ-1; Fri, 05 Mar 2021 01:26:44 -0500
X-MC-Unique: wz3iVuscM620IZkPDggFwQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48AC11823E24;
 Fri,  5 Mar 2021 06:26:43 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-165.pek2.redhat.com
 [10.72.12.165])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C6E2760C5F;
 Fri,  5 Mar 2021 06:26:40 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-security@nongnu.org
Subject: [PATCH V4 00/10] Detect reentrant RX casued by loopback
Date: Fri,  5 Mar 2021 14:26:28 +0800
Message-Id: <20210305062638.6749-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: alxndr@bu.edu, Jason Wang <jasowang@redhat.com>, philmd@redhat.com,
 ppandit@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi All:

Followed by commit 22dc8663d9 ("net: forbid the reentrant RX"), we
still need to fix the issues casued by loopback mode where the NIC
usually it via calling nc->info->receive() directly.

The fix is to introduce new network helper and check the
queue->delivering.

This series addresses CVE-2021-3416.

Thanks

Changes since V3:
- clarify CVE number in the commit log
- ident fix

Changes since V2:
- add more fixes from Alexander

Changes since V1:

- Fix dp8393x compiling
- Add rtl8139 fix
- Tweak the commit log
- Silent patchew warning

Alexander Bulekov (4):
  rtl8139: switch to use qemu_receive_packet() for loopback
  pcnet: switch to use qemu_receive_packet() for loopback
  cadence_gem: switch to use qemu_receive_packet() for loopback
  lan9118: switch to use qemu_receive_packet() for loopback

Jason Wang (6):
  net: introduce qemu_receive_packet()
  e1000: switch to use qemu_receive_packet() for loopback
  dp8393x: switch to use qemu_receive_packet() for loopback packet
  msf2-mac: switch to use qemu_receive_packet() for loopback
  sungem: switch to use qemu_receive_packet() for loopback
  tx_pkt: switch to use qemu_receive_packet_iov() for loopback

 hw/net/cadence_gem.c |  4 ++--
 hw/net/dp8393x.c     |  2 +-
 hw/net/e1000.c       |  2 +-
 hw/net/lan9118.c     |  2 +-
 hw/net/msf2-emac.c   |  2 +-
 hw/net/net_tx_pkt.c  |  2 +-
 hw/net/pcnet.c       |  2 +-
 hw/net/rtl8139.c     |  2 +-
 hw/net/sungem.c      |  2 +-
 include/net/net.h    |  5 +++++
 include/net/queue.h  |  8 ++++++++
 net/net.c            | 38 +++++++++++++++++++++++++++++++-------
 net/queue.c          | 22 ++++++++++++++++++++++
 13 files changed, 76 insertions(+), 17 deletions(-)

-- 
2.24.3 (Apple Git-128)


