Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF4B398AFD
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 15:48:04 +0200 (CEST)
Received: from localhost ([::1]:42504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loRE3-0002Zg-Rv
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 09:48:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1loRBs-0007zY-9b
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 09:45:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1loRBq-0006xS-K2
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 09:45:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622641546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aV5Y+AO5qhZqScvILJScJW8VzGXWQYW6qK3ZL2yvZY0=;
 b=ESEogEzj0kmRqKFHQ8G16rnpfqrMwYh1tTP6zs6ZURomDDA62Gt90a2qannrZ0Zf9o2Vb/
 LobK9gctt3HNMlMdRj1Pk5jxGC+9BIKjTpKACy6WKL+ZNgGYqb1605sm+yPF9FfqV+P4iF
 USXBeeV2BwatSHYKSyLCnPs5kdvrxWk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-HwtnQihgNl6X74NYRzYiow-1; Wed, 02 Jun 2021 09:45:42 -0400
X-MC-Unique: HwtnQihgNl6X74NYRzYiow-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4EBC31009630;
 Wed,  2 Jun 2021 13:45:37 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-240.ams2.redhat.com [10.36.114.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 57F408C95E;
 Wed,  2 Jun 2021 13:45:36 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 02/20] qemu-io-cmds: assert that we don't have .perm requested
 in no-blk case
Date: Wed,  2 Jun 2021 15:45:11 +0200
Message-Id: <20210602134529.231756-3-kwolf@redhat.com>
In-Reply-To: <20210602134529.231756-1-kwolf@redhat.com>
References: <20210602134529.231756-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Coverity thinks blk may be NULL. It's a false-positive, as described in
a new comment.

Fixes: Coverity CID 1453194
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210519090532.3753-1-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qemu-io-cmds.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
index 998b67186d..e8d862a426 100644
--- a/qemu-io-cmds.c
+++ b/qemu-io-cmds.c
@@ -92,9 +92,19 @@ static int command(BlockBackend *blk, const cmdinfo_t *ct, int argc,
         return -EINVAL;
     }
 
-    /* Request additional permissions if necessary for this command. The caller
+    /*
+     * Request additional permissions if necessary for this command. The caller
      * is responsible for restoring the original permissions afterwards if this
-     * is what it wants. */
+     * is what it wants.
+     *
+     * Coverity thinks that blk may be NULL in the following if condition. It's
+     * not so: in init_check_command() we fail if blk is NULL for command with
+     * both CMD_FLAG_GLOBAL and CMD_NOFILE_OK flags unset. And in
+     * qemuio_add_command() we assert that command with non-zero .perm field
+     * doesn't set this flags. So, the following assertion is to silence
+     * Coverity:
+     */
+    assert(blk || !ct->perm);
     if (ct->perm && blk_is_available(blk)) {
         uint64_t orig_perm, orig_shared_perm;
         blk_get_perm(blk, &orig_perm, &orig_shared_perm);
-- 
2.30.2


