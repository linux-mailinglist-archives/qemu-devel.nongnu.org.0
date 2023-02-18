Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B2D69BAF4
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Feb 2023 17:23:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pTPyh-0002u2-GO; Sat, 18 Feb 2023 11:22:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1pTPyf-0002tj-FA
 for qemu-devel@nongnu.org; Sat, 18 Feb 2023 11:22:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1pTPyd-0002SZ-Kj
 for qemu-devel@nongnu.org; Sat, 18 Feb 2023 11:22:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676737338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rmWmNwKxRTxA/l7+NiTvieIWUsWRO9cm30QuXfx33mY=;
 b=YJnrsfSTMIWGWBcMscIu9FVdAPD4zaeu9SGxxa8ig5OLrZGn6VMrtqaOHNUKadwt66lfad
 7rXkLWjnRRi+B5nNteBP7bwQuWsEBwdBAZI+n1Abwo2Z6CjC7Y+uRpbIagj5c/tjWaj6H1
 6Zq7k06pCXGHeJvq8Te+06ymrT8C/ss=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-541-6LgoHLv2Ovy57yTn56J4kg-1; Sat, 18 Feb 2023 11:21:11 -0500
X-MC-Unique: 6LgoHLv2Ovy57yTn56J4kg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ECCA71C04328;
 Sat, 18 Feb 2023 16:21:10 +0000 (UTC)
Received: from toolbox.redhat.com (unknown [10.33.36.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 819981731B;
 Sat, 18 Feb 2023 16:21:09 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: qemu-devel@nongnu.org
Cc: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, Sergio Lopez <slp@redhat.com>
Subject: [PATCH 0/4] Implement virtio-multitouch and enable GTK3 to use it
Date: Sat, 18 Feb 2023 17:22:12 +0100
Message-Id: <20230218162216.46944-1-slp@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=slp@redhat.com;
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

This series adds a virtio-multitouch device to the family of devices emulated
by virtio-input implementing the Multi-touch protocol as descripted here:

https://www.kernel.org/doc/html/latest/input/multi-touch-protocol.html?highlight=multi+touch

It also extends the GTK UI backend to be able to receive multi-touch events
and transpose them to a guest, so the latter can recognize them as gestures
when appropriate.

An example of this in action can be seen here:

 https://fosstodon.org/@slp/109545849296546767

Sergio Lopez (4):
  virtio-input: generalize virtio_input_key_config()
  virtio-input: add a virtio-mulitouch device
  ui: add helpers for virtio-multitouch events
  ui/gtk: enable backend to send multi-touch events

 hw/input/virtio-input-hid.c      | 161 +++++++++++++++++++++++++++----
 hw/virtio/virtio-input-pci.c     |  25 ++++-
 include/hw/virtio/virtio-input.h |   9 +-
 include/ui/input.h               |   8 ++
 qapi/ui.json                     |  45 ++++++++-
 replay/replay-input.c            |  18 ++++
 ui/gtk.c                         |  84 ++++++++++++++++
 ui/input.c                       |  42 ++++++++
 ui/trace-events                  |   1 +
 9 files changed, 362 insertions(+), 31 deletions(-)

-- 
2.38.1


