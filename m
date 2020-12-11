Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D62F32D7CF3
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 18:35:02 +0100 (CET)
Received: from localhost ([::1]:41932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knmJp-0002bW-Od
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 12:35:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1knlv7-0004IQ-S1
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:09:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1knlua-0002HQ-4X
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:09:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607706535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l8azbxIqqkGL8GaTE59z7gRuMvfFxzCwcURPOIxUO40=;
 b=De0ffz70DaM5nBYkI+m4XCrRw4xrYd0wcoSGUMSrqrRKauggXOxaaNOoVnqfGrd2ICCqUt
 C4sXpUijrQl6TB/Dimrg2QdBB44fN1C0PKBirx3eQSdVoGo/LfLyfbpmCb/jegksdXxTHT
 PQRpqEDo88Ir6qEiMw9na6Hca/yQQnA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-178-0sP3k8JlMbG7-jVzEkscoA-1; Fri, 11 Dec 2020 12:08:53 -0500
X-MC-Unique: 0sP3k8JlMbG7-jVzEkscoA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1FB96107ACE3;
 Fri, 11 Dec 2020 17:08:52 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-231.ams2.redhat.com [10.36.114.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1EDF75D6A8;
 Fri, 11 Dec 2020 17:08:50 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 25/34] file-posix: check the use_lock before setting the file
 lock
Date: Fri, 11 Dec 2020 18:08:03 +0100
Message-Id: <20201211170812.228643-26-kwolf@redhat.com>
In-Reply-To: <20201211170812.228643-1-kwolf@redhat.com>
References: <20201211170812.228643-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Li Feng <fengli@smartx.com>

The scenario is that when accessing a volume on an NFS filesystem
without supporting the file lock,  Qemu will complain "Failed to lock
byte 100", even when setting the file.locking = off.

We should do file lock related operations only when the file.locking is
enabled, otherwise, the syscall of 'fcntl' will return non-zero.

Signed-off-by: Li Feng <fengli@smartx.com>
Message-Id: <1607341446-85506-1-git-send-email-fengli@smartx.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/file-posix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index d5fd1dbcd2..806764f7e3 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -3104,7 +3104,7 @@ static int raw_check_perm(BlockDriverState *bs, uint64_t perm, uint64_t shared,
     }
 
     /* Copy locks to the new fd */
-    if (s->perm_change_fd) {
+    if (s->perm_change_fd && s->use_lock) {
         ret = raw_apply_lock_bytes(NULL, s->perm_change_fd, perm, ~shared,
                                    false, errp);
         if (ret < 0) {
-- 
2.29.2


