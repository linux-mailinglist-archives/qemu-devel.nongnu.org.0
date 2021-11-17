Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D711454BC7
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 18:17:01 +0100 (CET)
Received: from localhost ([::1]:52692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnOYO-0002YI-9n
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 12:17:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mnOKc-00058c-PD
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 12:02:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mnOKW-00047X-1k
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 12:02:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637168556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ljdKOjW/ZKgGTibqw1nZyHLepsKFcxA5MJ1LcglKDbc=;
 b=C0KH+4iubad/nesT2QEB3bZ4/5MFGOCLER/MgHzHarZX16MRydmOpRI6VNeFOVGujUAaU+
 VWaOYa2MMdtanAncOabdCnM3GeVOjw5x2s6JQ44Bi0BiT3hzavMiEp4JSBAhufZYOqqMLB
 //P3tOPGrePSFhMJbYPTmRNK+5n1vio=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-538-WYoFnGVOM7SyGRkU3HOxmg-1; Wed, 17 Nov 2021 12:02:33 -0500
X-MC-Unique: WYoFnGVOM7SyGRkU3HOxmg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9701804142;
 Wed, 17 Nov 2021 17:02:32 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-146.phx2.redhat.com [10.3.114.146])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5F6EE1F452;
 Wed, 17 Nov 2021 17:02:32 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 0/2] NBD 6.2-rc fixes
Date: Wed, 17 Nov 2021 11:02:28 -0600
Message-Id: <20211117170230.1128262-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: vsementsov@virtuozzo.com, rjones@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Back in September, Rich proposed a patch to silence an EPIPE message
from qemu-nbd when used with Unix sockets:
https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg03359.html

But investigating that further, I found that we had a different
message with TCP sockets, and that we regressed in qemu 6.0 with
regards to the message we print due to the use of uninitialized
memory.  Fixing the uninitialized memory use happens to also silence
the message that Rich was seeing, but without needing to special-case
EPIPE.

I also noticed that even though commit 2800637a and friends made the
block layer support 64-bit zero/trim, we are still manually splitting
3G requests in the NBD driver.  Patch 2 fixes that, although I'm less
certain whether it counts as 6.2-rc material since it is merely a
minor performance tweak to a feature new to 6.2, rather than a
regression fix.

Eric Blake (2):
  nbd/server: Don't complain on certain client disconnects
  nbd/server: Simplify zero and trim

 nbd/server.c | 30 ++++++++----------------------
 1 file changed, 8 insertions(+), 22 deletions(-)

-- 
2.33.1


