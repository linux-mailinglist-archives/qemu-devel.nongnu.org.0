Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF8F68070D
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 09:10:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMPEt-0000QP-Tl; Mon, 30 Jan 2023 03:10:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMPEr-0000Ls-L2
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 03:10:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMPEp-00023M-QJ
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 03:10:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675066203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=oG5oYyOevwip1isRyXIRWUB7ODYUNpFylwK7qAz4r3k=;
 b=UAKG5RK7of14aK855GYRdBXWCzyNxbUt8d3apq8UWLRU+TZPHUmpjwXDFy0wh//5cBkzi9
 DckDOlWAZuMozJ2V3KC7rAmbtJJPrQKmYfcex8Oiwx6DNfN7ey6RWO1SlWBlrSl/pRCiOH
 8X7dn+7qvOvLipkD2qELIW8q7MASXE4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-36-aropfcdWOO-mOZxjjMagSQ-1; Mon, 30 Jan 2023 03:09:59 -0500
X-MC-Unique: aropfcdWOO-mOZxjjMagSQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BFA423C025B2;
 Mon, 30 Jan 2023 08:09:58 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0888A40C2064;
 Mon, 30 Jan 2023 08:09:56 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Eric Blake <eblake@redhat.com>
Subject: [PATCH v2 00/11] Multifd zero page support
Date: Mon, 30 Jan 2023 09:09:45 +0100
Message-Id: <20230130080956.3047-1-quintela@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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

Based on top of my next branch.
- Rebased on top of latest upstream
- Redo a lot of the packet accounting
  still not completely perfect, but much better than what is upstream

Still working continuing on that.

Please review.

[v2]
- rebased on top of latest upstream
- lots of minor fixes
- start support for atomic counters
  * we need to move ram_limit_used/max to migration.c
  * that means fixing rdma.c
  * and test-vmstate.

So I am donig that right now.

Juan Quintela (11):
  migration: Update atomic stats out of the mutex
  migration: Make multifd_bytes atomic
  multifd: We already account for this packet on the multifd thread
  multifd: Count the number of bytes sent correctly
  migration: Make ram_save_target_page() a pointer
  multifd: Make flags field thread local
  multifd: Prepare to send a packet without the mutex held
  multifd: Add capability to enable/disable zero_page
  multifd: Support for zero pages transmission
  multifd: Zero pages transmission
  So we use multifd to transmit zero pages.

 qapi/migration.json    |   8 ++-
 migration/migration.h  |   1 +
 migration/multifd.h    |  36 ++++++++++--
 migration/ram.h        |   1 +
 hw/core/machine.c      |   1 +
 migration/migration.c  |  16 +++++-
 migration/multifd.c    | 123 +++++++++++++++++++++++++++++++----------
 migration/ram.c        |  51 +++++++++++++++--
 migration/trace-events |   8 +--
 9 files changed, 197 insertions(+), 48 deletions(-)

-- 
2.39.1


