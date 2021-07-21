Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DE03D0660
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 03:24:53 +0200 (CEST)
Received: from localhost ([::1]:50576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m60yi-0000AD-4Q
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 21:24:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m60vh-0003XC-JT
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 21:21:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m60vg-0003xt-7c
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 21:21:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626830503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QEO0J4VbDosoPPk5+zbdTMFuLUHP31LeVL2Un5IaqQA=;
 b=HIM30ueJXnPU5hVQ+wDWOzQKW+KSlkQJGkMQ6D8FEgPC2JvGEP3cCIFD5rth2sYrIaKsLT
 822bppNx27lmA6TmLkyTeV6rrB17FVUgGgu4bVaPGgzxxTMQAOVIKmOlEVrRReIiO3BIKj
 fJwDL399kd9G3B+FYe82aLPgBz7VEi8=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-K8EgZpWgPculY_j4uvC5WA-1; Tue, 20 Jul 2021 21:21:42 -0400
X-MC-Unique: K8EgZpWgPculY_j4uvC5WA-1
Received: by mail-qv1-f69.google.com with SMTP id
 jo25-20020a0562145019b0290300a4fa83d8so329757qvb.23
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 18:21:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QEO0J4VbDosoPPk5+zbdTMFuLUHP31LeVL2Un5IaqQA=;
 b=l9s5c5n6E/AlhVTC2TOOKf9dHFb8Kb3FtDvcLB3sUXHUHgPCOjQinHYLO7oVhiTVwO
 UqvnJI/pPdQytbXgoB3R5UpKzTjULGmVHUo2m60IBg3vBaqzkURyfBWBza+1suPj6PMq
 GoT2kTqHnECbxHPdTThGVHaXhCzFJX00u//xFhzST42uNrXJEy+sV62DIjG6SMUimqGC
 BfY/XeK8DbVRL0wi2LbUh86YNBeEbny23LFm8nXCskMmWgqFLzYMdoBwyjGyYzwz+kBQ
 E+Rnd2msgPI17WvCz3Y7HdlpIlpp+pNdJ4HYqaDKLb7EzY80GBdliTZioULeNDVehQj5
 vK6Q==
X-Gm-Message-State: AOAM532MvC3vMPHC2YKI3/MsaQ4g34n3/uvgm4m8irCOrTZH5U3JGUYv
 llCLLNK1wTL68yOoWZyY+O1jn/f8WH6riK55pQnBEd7pwdSY2r+SyeWaL0Ed0l/6oOCK3/GuUZ4
 hPctfRTAXksMCesEJsUW/zHNRNf7f+dtC8RqpeIk7ya/+ufQWVhic29kbTtKecHnD
X-Received: by 2002:a0c:df85:: with SMTP id w5mr33877191qvl.24.1626830501034; 
 Tue, 20 Jul 2021 18:21:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1bFqJRj3pEEP5kWfxpnDvB6YZoHUHjy1yOp6/+kLvLIhkzq6fmwj3Aoaa33DrIHNQOhl5SQ==
X-Received: by 2002:a0c:df85:: with SMTP id w5mr33877164qvl.24.1626830500762; 
 Tue, 20 Jul 2021 18:21:40 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id t26sm8399469qtc.44.2021.07.20.18.21.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 18:21:40 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/5] migration: Shutdown src in
 await_return_path_close_on_source()
Date: Tue, 20 Jul 2021 21:21:31 -0400
Message-Id: <20210721012134.792845-3-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210721012134.792845-1-peterx@redhat.com>
References: <20210721012134.792845-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Lukas Straub <lukasstraub2@web.de>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have a logic in await_return_path_close_on_source() that we will explicitly
shutdown the socket when migration encounters errors.  However it could be racy
because from_dst_file could have been reset right after checking it but before
passing it to qemu_file_shutdown() by the rp_thread.

Fix it by shutdown() on the src file instead.  Since they must be a pair of
qemu files, shutdown on either of them will work the same.

Since at it, drop the check for from_dst_file directly, which makes the
behavior even more predictable.

Reported-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 21b94f75a3..4f48cde796 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2882,12 +2882,15 @@ static int await_return_path_close_on_source(MigrationState *ms)
      * rp_thread will exit, however if there's an error we need to cause
      * it to exit.
      */
-    if (qemu_file_get_error(ms->to_dst_file) && ms->rp_state.from_dst_file) {
+    if (qemu_file_get_error(ms->to_dst_file)) {
         /*
          * shutdown(2), if we have it, will cause it to unblock if it's stuck
-         * waiting for the destination.
+         * waiting for the destination.  We do shutdown on to_dst_file should
+         * also shutdown the from_dst_file as they're in a pair. We explicilty
+         * don't operate on from_dst_file because it's potentially racy
+         * (rp_thread could have reset it in parallel).
          */
-        qemu_file_shutdown(ms->rp_state.from_dst_file);
+        qemu_file_shutdown(ms->to_dst_file);
         mark_source_rp_bad(ms);
     }
     trace_await_return_path_close_on_source_joining();
-- 
2.31.1


