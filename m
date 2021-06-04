Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CBC39B6C5
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 12:09:37 +0200 (CEST)
Received: from localhost ([::1]:48932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp6lj-0004rz-GB
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 06:09:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lp6k3-0002at-RT
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 06:07:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lp6k0-0003FQ-M5
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 06:07:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622801267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AMz4ZqWIQ65fbgOrfrbQFZpcOlDOPZJZAmxq/jrSmbU=;
 b=XxJXwCn1/2FKa3tpfQTO2Bp6ADwFd6XqghWe3hZv+wAoc0iSetacFJsYFgcSF/Z0vmjd7c
 WGgSBWqvD2Sg5QrwaseNg4o4jstDM5YKJQ+JoAuPN9lg0ItarnvpO5r/QFd0bX/H9TcoQ7
 R0lj8c/fdXtlvfbABap2itT/ZtbtxJI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-4ApKLeRaMWqnExyuBsZPmg-1; Fri, 04 Jun 2021 06:07:45 -0400
X-MC-Unique: 4ApKLeRaMWqnExyuBsZPmg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87670107ACCA;
 Fri,  4 Jun 2021 10:07:44 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-43.ams2.redhat.com
 [10.36.115.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6599F5D705;
 Fri,  4 Jun 2021 10:07:42 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 0/6] blkdebug: fix racing condition when iterating on
Date: Fri,  4 Jun 2021 12:07:35 +0200
Message-Id: <20210604100741.18966-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
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
v4:
* Patch 5 (new): get rid of new_state and instead use a local variable
* Patch 6: move the state update inside the same guard lock where the new
  one is decided, to have a single critical section and avoid use-before-update. 

Emanuele Giuseppe Esposito (6):
  blkdebug: refactor removal of a suspended request
  blkdebug: move post-resume handling to resume_req_by_tag
  blkdebug: track all actions
  blkdebug: do not suspend in the middle of QLIST_FOREACH_SAFE
  block/blkdebug: remove new_state field and instead use a local
    variable
  blkdebug: protect rules and suspended_reqs with a lock

 block/blkdebug.c | 128 +++++++++++++++++++++++++++++++----------------
 1 file changed, 84 insertions(+), 44 deletions(-)

-- 
2.30.2


