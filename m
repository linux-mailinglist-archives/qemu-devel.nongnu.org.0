Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF31B3A5E6A
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 10:32:09 +0200 (CEST)
Received: from localhost ([::1]:45982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsi0t-0004jM-TP
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 04:32:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lshyX-0002HJ-FM
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:29:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lshyU-0005nu-UW
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:29:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623659378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gKdPfoWe4aFt2af46WN/oDroSsaqSGaKcdne26c7v7k=;
 b=IMXG3P4fA5/4Ak/QR39S6XdvQUKFEIcRsexeJ3aU2UbwogouJRd4DBuQZh+61ymDYZFeYC
 NhpO/NGi7cXy0FInBNzjZtNZVpfARjI0CaW7V4XpYy45+6fRCrwuGiKLblzYkYF24lomWV
 KNobMcsETBHC2yBYv5tL/qabVyTxrI0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465-pYC96hoPNka4vOyMSFQsuw-1; Mon, 14 Jun 2021 04:29:36 -0400
X-MC-Unique: pYC96hoPNka4vOyMSFQsuw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0E39100CF6A;
 Mon, 14 Jun 2021 08:29:35 +0000 (UTC)
Received: from localhost.localdomain (ovpn-113-49.ams2.redhat.com
 [10.36.113.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 74F5A5D9D3;
 Mon, 14 Jun 2021 08:29:33 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v5 0/6] blkdebug: fix racing condition when iterating on
Date: Mon, 14 Jun 2021 10:29:25 +0200
Message-Id: <20210614082931.24925-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When qemu_coroutine_enter is executed in a loop
(even QEMU_FOREACH_SAFE), the new routine can modify the list,
for example removing an element, causing problem when control
is given back to the caller that continues iterating on the same list. 

Patch 1 solves the issue in blkdebug_debug_resume by restarting
the list walk after every coroutine_enter if list has to be fully iterated.
Patches 2,3,4 aim to fix blkdebug_debug_event by gathering
all actions that the rules make in a counter and invoking 
the respective coroutine_yeld only after processing all requests.

Patch 5-6 are somewhat independent of the others, patch 5 removes the need
of new_state field, and patch 6 adds a lock to
protect rules and suspended_reqs; right now everything works because
it's protected by the AioContext lock.
This is a preparation for the current proposal of removing the AioContext
lock and instead using smaller granularity locks to allow multiple
iothread execution in the same block device.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
v5:
* Add comment in patch 1 to explain why we don't need _SAFE in for loop
* Move the state update (s->state = new_state) in patch 5, to maintain
  the same existing effect in all patches

Emanuele Giuseppe Esposito (6):
  blkdebug: refactor removal of a suspended request
  blkdebug: move post-resume handling to resume_req_by_tag
  blkdebug: track all actions
  blkdebug: do not suspend in the middle of QLIST_FOREACH_SAFE
  block/blkdebug: remove new_state field and instead use a local
    variable
  blkdebug: protect rules and suspended_reqs with a lock

 block/blkdebug.c | 136 ++++++++++++++++++++++++++++++++---------------
 1 file changed, 92 insertions(+), 44 deletions(-)

-- 
2.31.1


