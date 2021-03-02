Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C4D32964B
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 06:57:47 +0100 (CET)
Received: from localhost ([::1]:49448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGy2U-0004RC-7m
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 00:57:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lGy06-0002kt-QT
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 00:55:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lGy02-0001bn-1a
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 00:55:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614664512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cn2KP0HQL+TyI7k2t75zqpbJnq/6Qkfrvd3KWbSqLqw=;
 b=T/BF+t/ZKM4fpchQ81L27qmUqzXz9kdk//LbX+r0IQrvUHLz8pzmTISzg5h75Ag+xmZlZ/
 Lm9KsXMeGMaejU0TzGxXxuSO5qBAwFCVy+sEyiWrm4QRUCmnHsTmuaapnKh6BUtQ0Ho1mg
 LnW3O0GQRFpVxdgIOCcypChWmLSBQVo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-6CkQy-hlOgO048Y2bpKXgA-1; Tue, 02 Mar 2021 00:55:07 -0500
X-MC-Unique: 6CkQy-hlOgO048Y2bpKXgA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98FB5801965;
 Tue,  2 Mar 2021 05:55:06 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-133.pek2.redhat.com
 [10.72.12.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F205C5C224;
 Tue,  2 Mar 2021 05:55:03 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V3 00/10] Detect reentrant RX casued by loopback
Date: Tue,  2 Mar 2021 13:54:49 +0800
Message-Id: <20210302055500.51954-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
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
 qemu-security@nongnu.org, ppandit@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi All:

Followed by commit 22dc8663d9 ("net: forbid the reentrant RX"), we
still need to fix the issues casued by loopback mode where the NIC
usually it via calling nc->info->receive() directly.

The fix is to introduce new network helper and check the
queue->delivering.

Thanks

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

 hw/net/cadence_gem.c |  2 +-
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
 13 files changed, 75 insertions(+), 16 deletions(-)

-- 
2.24.3 (Apple Git-128)


