Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BBA6E10F7
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 17:21:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmyk5-00062R-IR; Thu, 13 Apr 2023 11:20:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1pmyk2-0005xY-9l
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 11:20:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1pmyjz-0007xy-Ri
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 11:20:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681399201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=T9tJ9VFksQJ411qePkKjbDpFcnajDHb+3P7v1ozolqE=;
 b=h1V6LPVz6NLJYH5Jw/K7fuViNMYefNS51ltBSyXqJOoZH1J4Rx6WGIZv8Qvv6IyYG82rJB
 p2YsE2IAoRmQAR5Zf3hgpFZlIjH9A+AsxYEfuRLS+OdM4u81u40c2nLgoijc0gkyFUE4tU
 n6ptNnxai6mbdeZ0r/t8GUymvmZseLE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-212-malkM9EOMVax_SrTp13IcQ-1; Thu, 13 Apr 2023 11:19:59 -0400
X-MC-Unique: malkM9EOMVax_SrTp13IcQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9CA9D886463;
 Thu, 13 Apr 2023 15:19:59 +0000 (UTC)
Received: from toolbox.redhat.com (unknown [10.33.36.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ED784C16028;
 Thu, 13 Apr 2023 15:19:57 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eric Blake <eblake@redhat.com>, Sergio Lopez <slp@redhat.com>
Subject: [PATCH v3 0/6] Implement virtio-multitouch and enable GTK3 to use it
Date: Thu, 13 Apr 2023 17:21:14 +0200
Message-Id: <20230413152120.53967-1-slp@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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

Since v2:
- Fix InputMultitouchEvent doc in qapi/ui.json (Marc-André).
- Use warn_report() instead of fprintf() in gtk.c (Marc-André).
- Rebase and collect R-b.

Since v1:
- Split 0002 patch to implement ui, virtio-input-hid and virtio-input-pci
  changes in different patches (Marc-André).
- Fix versioning in qapi/ui.json (Marc-André).
- Print a warning if touch->sequence >= INPUT_EVENT_SLOTS_MAX (Marc-André).
- Only send SYN_REPORT once, if needed (Marc-André).
- Rebase and collect R-b.

Sergio Lopez (6):
  virtio-input: generalize virtio_input_key_config()
  ui: add the infrastructure to support MT events
  virtio-input: add a virtio-mulitouch device
  virtio-input-pci: add virtio-multitouch-pci
  ui: add helpers for virtio-multitouch events
  ui/gtk: enable backend to send multi-touch events

 hw/input/virtio-input-hid.c      | 156 +++++++++++++++++++++++++++----
 hw/virtio/virtio-input-pci.c     |  25 ++++-
 include/hw/virtio/virtio-input.h |   9 +-
 include/ui/input.h               |   8 ++
 qapi/ui.json                     |  46 ++++++++-
 replay/replay-input.c            |  18 ++++
 ui/gtk.c                         |  92 ++++++++++++++++++
 ui/input.c                       |  42 +++++++++
 ui/trace-events                  |   1 +
 9 files changed, 366 insertions(+), 31 deletions(-)

-- 
2.38.1


