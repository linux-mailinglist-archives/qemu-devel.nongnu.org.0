Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2789662E257
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 17:57:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oviBO-0005oG-RV; Thu, 17 Nov 2022 11:56:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oviBK-0005nR-Jx
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 11:56:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oviBI-0007kx-UK
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 11:56:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668704163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nP5m9L17G85QMMIi9xZRbcIh20uXHffvhLnPwT5Mh18=;
 b=D8SxX1jUrjLVeveaGIKksRDBgFyByQfmxn4TDlnRdWuwmyVLbpn+PHmwC4NgsK/dt9W8xI
 wjhFPf4TQV7FiWNzvbDbxm1/f68v4Hwptd5myboFfPkdngbI+VGBLCiTqg0RpT5DsKqJMV
 2BkSLOjOanhn+Aqg8+WXryFJR31wNPs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-424-CAtRjoOQPZO2RBbLxNee5A-1; Thu, 17 Nov 2022 11:55:59 -0500
X-MC-Unique: CAtRjoOQPZO2RBbLxNee5A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1BD823C11EA2;
 Thu, 17 Nov 2022 16:55:59 +0000 (UTC)
Received: from localhost (unknown [10.39.193.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A73E40C6EC3;
 Thu, 17 Nov 2022 16:55:58 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Tobias Fiebig <tobias+git@fiebig.nl>, Jason Wang <jasowang@redhat.com>,
 qemu-stable@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH for-7.2 v3 0/3] rtl8139: honor large send MSS value
Date: Thu, 17 Nov 2022 11:55:51 -0500
Message-Id: <20221117165554.1773409-1-stefanha@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

v3:
- Add Patch 1 to avoid clobbering tx descriptor bits
- Add Patch 2 to avoid confusing tx command modes
- Exclude IP and TCP headers from large send MSS value

The rtl8139 large send offload currently does not honor the MSS value provided
by the driver. This is a problem especially when the MTU is small because IP
fragmentation occurs and leads to poor performance.

These patches make use of the large send MSS value.

I have done basic testing by running the following Python code inside the
guest:

  import socket
  s = socket.socket()
  s.connect(('10.0.2.2', 1234))
  buf = b'A' * 4096
  s.send(buf)

The device sees a 4150 byte tx descriptor that results in the transmission of 3
Ethernet frames with sizes of 1514, 1514, and 1230 bytes when the large send
MSS value is 1460 bytes.

Stefan Hajnoczi (3):
  rtl8139: avoid clobbering tx descriptor bits
  rtl8139: keep Tx command mode 0 and 1 separate
  rtl8139: honor large send MSS value

 hw/net/rtl8139.c | 47 ++++++++++++++++++++++++-----------------------
 1 file changed, 24 insertions(+), 23 deletions(-)

-- 
2.38.1


