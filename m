Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA9F29AD93
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Oct 2020 14:41:33 +0100 (CET)
Received: from localhost ([::1]:32800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXPEC-0000zJ-J5
	for lists+qemu-devel@lfdr.de; Tue, 27 Oct 2020 09:41:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kXP9O-0004FF-PJ
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 09:36:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kXP9M-0001HF-K1
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 09:36:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603805791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FRSaQBMLBhUwDJ3iMbMAWrjt28HjzxsIxrLzvEBEz4s=;
 b=Xut/IGyYJ15IyYCI94mPDOPzbzaJtvAPqffeHDjCxKJr/6T4+mpHzI2Xv7fx/YP+mXXTa5
 GPj/WPhZVbflR3ECTLSe+0eVvKfiE14ZiLF+61XcaQEBfxwiquWGwNCVq6JJON/IVm0BQY
 aoe2qPPWtCJZQyyeVQw5C6gFpcQkG+8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-1KyocUv4PRS9vb0gjI_8Xw-1; Tue, 27 Oct 2020 09:36:29 -0400
X-MC-Unique: 1KyocUv4PRS9vb0gjI_8Xw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E907664089
 for <qemu-devel@nongnu.org>; Tue, 27 Oct 2020 13:36:28 +0000 (UTC)
Received: from localhost (unknown [10.36.110.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9470A55781;
 Tue, 27 Oct 2020 13:36:18 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/3] coroutine: let CoQueue wake up outside a coroutine
Date: Tue, 27 Oct 2020 17:36:00 +0400
Message-Id: <20201027133602.3038018-2-marcandre.lureau@redhat.com>
In-Reply-To: <20201027133602.3038018-1-marcandre.lureau@redhat.com>
References: <20201027133602.3038018-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/27 01:06:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, kraxel@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The assert() was added in commit b681a1c73e15 ("block: Repair the
throttling code."), when the qemu_co_queue_do_restart() function
required to be running in a coroutine. It was later made unnecessary in
commit a9d9235567e7 ("coroutine-lock: reschedule coroutine on the
AioContext it was running on").

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
---
 util/qemu-coroutine-lock.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/util/qemu-coroutine-lock.c b/util/qemu-coroutine-lock.c
index 36927b5f88..5816bf8900 100644
--- a/util/qemu-coroutine-lock.c
+++ b/util/qemu-coroutine-lock.c
@@ -85,15 +85,13 @@ static bool qemu_co_queue_do_restart(CoQueue *queue, bool single)
     return true;
 }
 
-bool coroutine_fn qemu_co_queue_next(CoQueue *queue)
+bool qemu_co_queue_next(CoQueue *queue)
 {
-    assert(qemu_in_coroutine());
     return qemu_co_queue_do_restart(queue, true);
 }
 
-void coroutine_fn qemu_co_queue_restart_all(CoQueue *queue)
+void qemu_co_queue_restart_all(CoQueue *queue)
 {
-    assert(qemu_in_coroutine());
     qemu_co_queue_do_restart(queue, false);
 }
 
-- 
2.29.0


