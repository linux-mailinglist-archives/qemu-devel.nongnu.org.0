Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D76513B287A
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 09:22:48 +0200 (CEST)
Received: from localhost ([::1]:40690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwJhH-0006It-TD
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 03:22:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lwJfU-00043b-BD
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 03:20:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lwJfR-0001Xi-Vu
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 03:20:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624519252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ooOT2pXHbsOYMAk8suXWOJDaGb0YJWlruZ2VIoV88ik=;
 b=e1A1O2GI61hcdBdYcWt7YTzji4JkXWA1XpiXPvnjKQmYrMjYKxQxjlLGAqSA/mnUuyp+rR
 ZDnb/flApJhk3gvAwGyeSSwTH9knAgqm/DYnoIUbRIIBlAuqjjbi+UNAa9xTQ36JG3Sk9R
 gswx4Inn5qBFr2tNsR7WqDAf0U2TzGs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-BacjD8YaOzS3hrvO7G2U8A-1; Thu, 24 Jun 2021 03:20:51 -0400
X-MC-Unique: BacjD8YaOzS3hrvO7G2U8A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F145C1084F5A;
 Thu, 24 Jun 2021 07:20:49 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-113-3.ams2.redhat.com
 [10.36.113.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5F3F75C1BB;
 Thu, 24 Jun 2021 07:20:44 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v5 0/5] block-copy: protect block-copy internal structures
Date: Thu, 24 Jun 2021 09:20:38 +0200
Message-Id: <20210624072043.180494-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

This serie of patches aims to reduce the usage of the
AioContexlock in block-copy, by introducing smaller granularity
locks thus on making the block layer thread safe. 

This serie depends on my previous serie that brings thread safety
to the smaller API used by block-copy, like ratelimit, progressmeter
abd co-shared-resource.

What's missing for block-copy to be fully thread-safe is fixing
the CoSleep API to allow cross-thread sleep and wakeup.
Paolo is working on it.

Patch 1 provides a small refactoring, patch 2 introduces the 
.method field in BlockCopyState, to be used instead of .use_copy_range,
.copy_size and .zeros.
Patch 3 provide a refactoring in preparation to
the lock added in patch 4 on BlockCopyTask, BlockCopyCallState and
BlockCopyState. Patch 5 uses load_acquire/store_release to make sure
BlockCopyCallState OUT fields are updated before finished is set to
true. 

Based-on: <20210518094058.25952-1-eesposit@redhat.com>
Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
v5:
* Squash patch 3 (improve comments) with patch 5 (add CoMutex).
* Better comments in block-copy, drop IN/OUT/State categories
* Remove some load_acquire in patch 6, replace them with atomic reads


Emanuele Giuseppe Esposito (4):
  block-copy: small refactor in block_copy_task_entry and
    block_copy_common
  block-copy: move progress_set_remaining in block_copy_task_end
  block-copy: add CoMutex lock
  block-copy: atomic .cancelled and .finished fields in
    BlockCopyCallState

Paolo Bonzini (1):
  block-copy: streamline choice of copy_range vs. read/write

 include/block/block-copy.h |   2 +
 block/block-copy.c         | 368 +++++++++++++++++++++++--------------
 2 files changed, 231 insertions(+), 139 deletions(-)

-- 
2.31.1


