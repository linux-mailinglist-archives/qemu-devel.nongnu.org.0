Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB3F3767BF
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 17:13:57 +0200 (CEST)
Received: from localhost ([::1]:37882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf2Au-0008Pd-63
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 11:13:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lf29D-0006vE-R4
 for qemu-devel@nongnu.org; Fri, 07 May 2021 11:12:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lf29C-0001kZ-At
 for qemu-devel@nongnu.org; Fri, 07 May 2021 11:12:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620400328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sndvpNBq0S3byPe6Cp4nMD6mnPnRjLT4cV0HU8ZEFyc=;
 b=gAaJcJiiGATHdG1ovIOtAPkEmxf250aniiIS6tUnuslbGfzUeSA3YkpvbHRoQgGITsNlgQ
 N24ldrnlsCRRGG0dnpupZaiZ/TjbaxyT+1a3HoghDNGKIJwfi/yjQ6MBXHDXU4iCJLjR1N
 bZPcb2IIazLFLXUp5xX1nphnDzSXbaQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-TElBM3ipNKKPV3qvPupwXQ-1; Fri, 07 May 2021 11:12:07 -0400
X-MC-Unique: TElBM3ipNKKPV3qvPupwXQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 562751006C80;
 Fri,  7 May 2021 15:12:06 +0000 (UTC)
Received: from localhost.localdomain (ovpn-113-137.ams2.redhat.com
 [10.36.113.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE9D75D9CC;
 Fri,  7 May 2021 15:12:04 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 0/5] blkdebug: fix racing condition when iterating on
Date: Fri,  7 May 2021 17:11:58 +0200
Message-Id: <20210507151203.39643-1-eesposit@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
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

Patch 5 is somewhat independent of the others, it adds a lock to
protect rules and suspended_reqs; right now everything works because
it's protected by the AioContext lock.
This is a preparation for the current proposal of removing the AioContext
lock and instead using smaller granularity locks to allow multiple
iothread execution in the same block device.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
v1 -> v2
* Change commit message of patch 4 and cover letter

Emanuele Giuseppe Esposito (5):
  blkdebug: refactor removal of a suspended request
  blkdebug: move post-resume handling to resume_req_by_tag
  blkdebug: track all actions
  blkdebug: do not suspend in the middle of QLIST_FOREACH_SAFE
  blkdebug: protect rules and suspended_reqs with a lock

 block/blkdebug.c | 113 +++++++++++++++++++++++++++++++++--------------
 1 file changed, 79 insertions(+), 34 deletions(-)

-- 
2.30.2


