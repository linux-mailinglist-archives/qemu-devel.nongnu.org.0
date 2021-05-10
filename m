Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A2F377EE2
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 11:03:09 +0200 (CEST)
Received: from localhost ([::1]:51222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg1oh-0005yB-1R
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 05:03:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lg1lb-0003Al-Qe
 for qemu-devel@nongnu.org; Mon, 10 May 2021 04:59:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lg1lY-0005cH-Rc
 for qemu-devel@nongnu.org; Mon, 10 May 2021 04:59:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620637192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=raIE54VZxVBOTKQq9Gl6U8FS8oEtlBb6Seet9Y0SmXY=;
 b=c+vOV9xDmjqyWQPxHbVoiW/8Ak401VK3ViHMZVtiEvElXUnxgZHe78MeLNXCY2sgabRq0z
 pCzeTo9YAOnop1VGX19K5e2JPhWGpifwRdfAyHzpWwP8ufflD1aGonECvNAq26BxbnSbIS
 r9VDrH4GrzON5DfS4Y9Xv4nTDG+AaLc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-600-zEBxZjeiN_WA_TEXu7W8aQ-1; Mon, 10 May 2021 04:59:49 -0400
X-MC-Unique: zEBxZjeiN_WA_TEXu7W8aQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD55F195D560;
 Mon, 10 May 2021 08:59:48 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-113-184.ams2.redhat.com
 [10.36.113.184])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2EA386294D;
 Mon, 10 May 2021 08:59:42 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 0/6] block-copy: make helper APIs thread safe
Date: Mon, 10 May 2021 10:59:35 +0200
Message-Id: <20210510085941.22769-1-eesposit@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This serie of patches bring thread safety to the smaller APIs used by
block-copy, namely ratelimit, progressmeter, co-shared-resource
and aiotask.
The end goal is to reduce the usage of the global
AioContexlock in block-copy, by introducing smaller granularity
locks thus on making the block layer thread safe. 

This serie depends on Paolo's coroutine_sleep API.

What's missing for block-copy to be fully thread-safe is fixing
the CoSleep API to allow cross-thread sleep and wakeup.
Paolo is working on it and will post the patches once his new
CoSleep API is accepted.

Patches 1-3 work on ratelimit (they are also based on the first
ratelimit patch sent by Paolo), 4 covers progressmeter,
5 co-shared-resources and 6 aiopool.

Based-on: <20210503112550.478521-1-pbonzini@redhat.com> [coroutine_sleep]
Based-on: <20210413125533.217440-1-pbonzini@redhat.com> [ratelimit]
Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
v1 -> v2:
* More field categorized as IN/State/OUT in the various struct
* Fix a couple of places where I missed locks [Vladimir, Paolo]

Emanuele Giuseppe Esposito (3):
  progressmeter: protect with a mutex
  co-shared-resource: protect with a mutex
  aiopool: protect with a mutex

Paolo Bonzini (3):
  ratelimit: treat zero speed as unlimited
  block-copy: let ratelimit handle a speed of 0
  blockjob: let ratelimit handle a speed of 0

 block/aio_task.c               | 63 ++++++++++++++++++++--------------
 block/block-copy.c             | 28 ++++++---------
 blockjob.c                     | 45 +++++++++++++++---------
 include/block/aio_task.h       |  2 +-
 include/qemu/progress_meter.h  | 31 +++++++++++++++++
 include/qemu/ratelimit.h       | 12 +++++--
 job-qmp.c                      |  8 +++--
 job.c                          |  3 ++
 qemu-img.c                     |  9 +++--
 util/qemu-co-shared-resource.c | 26 +++++++++++---
 10 files changed, 155 insertions(+), 72 deletions(-)

-- 
2.30.2


