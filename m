Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EA03876B5
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 12:39:49 +0200 (CEST)
Received: from localhost ([::1]:34178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lix8e-0006fX-Nj
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 06:39:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1liwe7-0002Le-Mj
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:08:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1liwe1-0007bD-EY
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:08:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621332488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=C/6u4OdFpdkYI33KCbCWhJvtHyvXFdDyz7lgI+tfKL0=;
 b=SvUx26MFd0+soC8+50Rk0yBtKLbIrYipKhmVifqgayJ+MCmnkbT4N4yIzEc51IxMFLjJem
 uY/K/p+yFLkqMAnPiII78Sg6qNuBAaVew4XkY9bAEjYOkN42wXQ1EY3/BCgWiKVkhcZYa4
 Gi5MmSTxk/Zkj2VPav/NBmzdWyp0KZQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-uJoc8Iu3NYqYi4r-pbQbtA-1; Tue, 18 May 2021 06:08:06 -0400
X-MC-Unique: uJoc8Iu3NYqYi4r-pbQbtA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C50FB501F6;
 Tue, 18 May 2021 10:08:05 +0000 (UTC)
Received: from localhost.localdomain (ovpn-114-236.ams2.redhat.com
 [10.36.114.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2FF16687EC;
 Tue, 18 May 2021 10:07:58 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 0/7] block-copy: protect block-copy internal structures
Date: Tue, 18 May 2021 12:07:50 +0200
Message-Id: <20210518100757.31243-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

This serie of patches aims to reduce the usage of the global
AioContexlock in block-copy, by introducing smaller granularity
locks thus on making the block layer thread safe. 

This serie depends on Paolo's coroutine_sleep API and my previous
serie that brings thread safety to the smaller API used by block-copy,
like ratelimit, progressmeter abd co-shared-resource.

What's missing for block-copy to be fully thread-safe is fixing
the CoSleep API to allow cross-thread sleep and wakeup.
Paolo is working on it and will post the patches once his new
CoSleep API is accepted.

Patch 1 introduces the .method field instead of .use_copy_range
and .copy_size, so that it can be later used as atomic.
Patch 2-3 provide comments and refactoring in preparation to
the locks added in patch 4 on BlockCopyTask, patch 5-6 on
BlockCopyCallState and 7 BlockCopyState.

Based-on: <20210517100548.28806-1-pbonzini@redhat.com>
Based-on: <20210518094058.25952-1-eesposit@redhat.com>
Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
v1 -> v2:
* More field categorized as IN/State/OUT in the various struct, better
  documentation in the structs
* Fix a couple of places where I missed locks [Vladimir, Paolo]


Emanuele Giuseppe Esposito (6):
  block-copy: improve documentation of BlockCopyTask and BlockCopyState
    types and functions
  block-copy: move progress_set_remaining in block_copy_task_end
  block-copy: add a CoMutex to the BlockCopyTask list
  block-copy: add QemuMutex lock for BlockCopyCallState list
  block-copy: atomic .cancelled and .finished fields in
    BlockCopyCallState
  block-copy: protect BlockCopyState .method fields

Paolo Bonzini (1):
  block-copy: streamline choice of copy_range vs. read/write

 block/block-copy.c | 234 +++++++++++++++++++++++++++++----------------
 1 file changed, 150 insertions(+), 84 deletions(-)

-- 
2.30.2


