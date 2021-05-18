Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 993AF3875B4
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 11:50:52 +0200 (CEST)
Received: from localhost ([::1]:41610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liwNH-0006Ro-EF
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 05:50:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1liwDy-0002HM-8q
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:41:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1liwDv-0007tx-CW
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:41:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621330870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=jfgyIEhnnmbAcUhYULfi8YfeRc/0cLR+h24cPPO1H7I=;
 b=BJhpozvGDHydcfT+Wx9x0jyLQaprYgg5fU4oH2pyzfndBkwJG/GpJ2K2JTfEEaaygp4TCu
 OWjiQCitagPuGK/SEXpNC36n5eMmkM5cz4Ba9C0qGknZ62iTakrMouRdsc9DKdVNQHjhzA
 +/ygZ7bcBKKUwaRvSVM/G+oZnjC/1V8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-IjEf3UW7NVOjFul-hPqPwg-1; Tue, 18 May 2021 05:41:07 -0400
X-MC-Unique: IjEf3UW7NVOjFul-hPqPwg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2DAA180FD64;
 Tue, 18 May 2021 09:41:06 +0000 (UTC)
Received: from localhost.localdomain (ovpn-114-236.ams2.redhat.com
 [10.36.114.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 322D12ED60;
 Tue, 18 May 2021 09:40:59 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 0/5] block-copy: make helper APIs thread safe
Date: Tue, 18 May 2021 11:40:53 +0200
Message-Id: <20210518094058.25952-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This serie of patches bring thread safety to the smaller APIs used by
block-copy, namely ratelimit, progressmeter, co-shared-resource
and aiotask.
The end goal is to reduce the usage of AioContexlock in block-copy,
by introducing smaller granularity locks thus on making the block layer
thread safe. 

This serie depends on Paolo's coroutine_sleep API.

What's missing for block-copy to be fully thread-safe is fixing
the CoSleep API to allow cross-thread sleep and wakeup.
Paolo is working on it and will post the patches once his new
CoSleep API is accepted.

Patches 1-3 work on ratelimit (they are also based on the first
ratelimit patch sent by Paolo), 4 covers progressmeter and
5 co-shared-resources.

Based-on: <20210503112550.478521-1-pbonzini@redhat.com>
Based-on: <20210413125533.217440-1-pbonzini@redhat.com>
Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
v1 -> v2:
* Implement progressmeter as a separate .c file (was just an header),
  but keep the struct public, to avoid heap allocations [Vladimir, Paolo]
* Drop for now the Aiopool patches of v2 [Paolo, Stefan]

Emanuele Giuseppe Esposito (2):
  progressmeter: protect with a mutex
  co-shared-resource: protect with a mutex

Paolo Bonzini (3):
  ratelimit: treat zero speed as unlimited
  block-copy: let ratelimit handle a speed of 0
  blockjob: let ratelimit handle a speed of 0

 block/block-copy.c                | 28 ++++++--------
 block/meson.build                 |  1 +
 block/progress_meter.c            | 64 +++++++++++++++++++++++++++++++
 blockjob.c                        | 46 +++++++++++++---------
 include/qemu/co-shared-resource.h |  4 +-
 include/qemu/progress_meter.h     | 34 ++++++++--------
 include/qemu/ratelimit.h          | 12 +++++-
 job-qmp.c                         |  8 +++-
 job.c                             |  3 ++
 qemu-img.c                        |  9 +++--
 util/qemu-co-shared-resource.c    | 27 ++++++++++---
 11 files changed, 171 insertions(+), 65 deletions(-)
 create mode 100644 block/progress_meter.c

-- 
2.30.2


