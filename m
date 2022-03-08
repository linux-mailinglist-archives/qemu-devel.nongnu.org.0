Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9002B4D0DD9
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 03:08:01 +0100 (CET)
Received: from localhost ([::1]:45560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRPGa-0005Zj-Lt
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 21:08:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nROu8-0000D7-0s
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 20:44:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nROu6-0006QN-2U
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 20:44:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646703885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7p7pFOdgSqGhud7GsIP/QghHbL0OwMTKZyDUpnqoPrk=;
 b=eWCkDca2huFoI1bKrMIxoUfwG+RiR1WBqzRZRxsucQ9dCcJoV10extTsDkyuTGwNRpIE9Q
 ni9PID2S8yQPJB4hNVH2WZz3fl/mx9XnEre5CqYqsQ3bq/PZIuxCnpvLi2gfCpRtlpZ+0S
 fadwM6y8KT4HkpqELdfcN2asX1qg0Dc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-53-u3cpwcaTPnCO6858HwMNlg-1; Mon, 07 Mar 2022 20:44:42 -0500
X-MC-Unique: u3cpwcaTPnCO6858HwMNlg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5AEF12F35;
 Tue,  8 Mar 2022 01:44:41 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 928BE5E480;
 Tue,  8 Mar 2022 01:44:40 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/15] qemu-io: Allow larger write zeroes under no fallback
Date: Mon,  7 Mar 2022 19:44:19 -0600
Message-Id: <20220308014419.3056549-16-eblake@redhat.com>
In-Reply-To: <20220308014419.3056549-1-eblake@redhat.com>
References: <20220308014419.3056549-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When writing zeroes can fall back to a slow write, permitting an
overly large request can become an amplification denial of service
attack in triggering a large amount of work from a small request.  But
the whole point of the no fallback flag is to quickly determine if
writing an entire device to zero can be done quickly (such as when it
is already known that the device started with zero contents); in those
cases, artificially capping things at 2G in qemu-io itself doesn't
help us.

Signed-off-by: Eric Blake <eblake@redhat.com>
Message-Id: <20211203231539.3900865-4-eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 qemu-io-cmds.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
index 954955c12fb9..45a957093369 100644
--- a/qemu-io-cmds.c
+++ b/qemu-io-cmds.c
@@ -603,10 +603,6 @@ static int do_co_pwrite_zeroes(BlockBackend *blk, int64_t offset,
         .done   = false,
     };

-    if (bytes > INT_MAX) {
-        return -ERANGE;
-    }
-
     co = qemu_coroutine_create(co_pwrite_zeroes_entry, &data);
     bdrv_coroutine_enter(blk_bs(blk), co);
     while (!data.done) {
@@ -1160,8 +1156,9 @@ static int write_f(BlockBackend *blk, int argc, char **argv)
     if (count < 0) {
         print_cvtnum_err(count, argv[optind]);
         return count;
-    } else if (count > BDRV_REQUEST_MAX_BYTES) {
-        printf("length cannot exceed %" PRIu64 ", given %s\n",
+    } else if (count > BDRV_REQUEST_MAX_BYTES &&
+               !(flags & BDRV_REQ_NO_FALLBACK)) {
+        printf("length cannot exceed %" PRIu64 " without -n, given %s\n",
                (uint64_t)BDRV_REQUEST_MAX_BYTES, argv[optind]);
         return -EINVAL;
     }
-- 
2.35.1


