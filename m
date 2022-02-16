Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 599FB4B80DA
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 07:58:01 +0100 (CET)
Received: from localhost ([::1]:58412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKEGG-00084l-EN
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 01:58:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nKDov-0004aP-GX
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:29:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nKDot-0006I3-5Q
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:29:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644992979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=deZsk0norkQ4tHx9KvEcVkficttUycqp3/knKJfuBkc=;
 b=AH1d8/FUXudJNHdvtvUKdl7mbF9bsn+yGwe3P4vTnumKaQ7hPGOLftpGY57tmQowY/nI4D
 eXzAvMSMjoWYVuDuNkw65NamV2YIvpnjpVvsrBzdpago47uqlCEJ/vrH5PsHbLcgQq7yeB
 XUWITnfY5u5qms5VZl4Us7CDaxi1a/Q=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-146-jQpEUNVGPpulyRF4QhRA1w-1; Wed, 16 Feb 2022 01:29:38 -0500
X-MC-Unique: jQpEUNVGPpulyRF4QhRA1w-1
Received: by mail-pj1-f72.google.com with SMTP id
 a15-20020a17090ad80f00b001b8a1e1da50so941741pjv.6
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 22:29:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=deZsk0norkQ4tHx9KvEcVkficttUycqp3/knKJfuBkc=;
 b=jlbbMUUcQZQPT4ErBnyKhmk8tSrfdFssHNZPHd6N9cjmUBaWZk/pslCR2sckSMAzBH
 szWZJb5Tq1dSpHSLR6DdyGQl/bPjcH+1naQ6RLIS2anhVXqQ540xoiMZZAaUrVH9F8Tc
 q5PCeKSe/LcVnGvWxH33US9XkyA7HDhy+Sd+3ocH+C6yaOgj3+UW32LjlqQrRvyEuUO+
 0piq5H71RmFWTfBZbJ3X8fZWKAWDO0vc8I/nac+SqmefmTwJ5m6yWKZnMp8DkGTcfnTn
 F50CgSZw/Q33k/WJrMmb6zKqw5Tzhsv4lpiSs50JYqkWP3+1NrsYtFDcR+hJVxlr0jJ0
 W7KQ==
X-Gm-Message-State: AOAM530p120h0Dpo0oW1kmnQIqFxgy2/Ifi/aDr4Y/2WlyG1Q3TiSd+X
 BqWZbXx80yi+gRkR08jtuK1ChId9reTeYaFamX8ELcYpmT1/lg6wu50MesL6tluTMGWH6+woIRo
 brw7ctZMMWJyTeMQ4wI+nRuxU+OZbJHNqcAH+JlhqzuiaSMdh+PWVSZ8XwvkBA3Tj
X-Received: by 2002:aa7:88d4:0:b0:4cc:ecd4:de1d with SMTP id
 k20-20020aa788d4000000b004ccecd4de1dmr1551951pff.63.1644992977222; 
 Tue, 15 Feb 2022 22:29:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJycKDNu+Xacinh/zbJdTY6EUHcdTAVDz1cHex/n+okQPrCFt3hxEejCz0SSMrAfzqNRBJom/g==
X-Received: by 2002:aa7:88d4:0:b0:4cc:ecd4:de1d with SMTP id
 k20-20020aa788d4000000b004ccecd4de1dmr1551920pff.63.1644992976575; 
 Tue, 15 Feb 2022 22:29:36 -0800 (PST)
Received: from localhost.localdomain ([64.64.123.81])
 by smtp.gmail.com with ESMTPSA id 17sm42104657pfl.175.2022.02.15.22.29.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Feb 2022 22:29:36 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/20] migration: Enlarge postcopy recovery to capture !-EIO
 too
Date: Wed, 16 Feb 2022 14:27:59 +0800
Message-Id: <20220216062809.57179-11-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220216062809.57179-1-peterx@redhat.com>
References: <20220216062809.57179-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We used to have quite a few places making sure -EIO happened and that's the
only way to trigger postcopy recovery.  That's based on the assumption that
we'll only return -EIO for channel issues.

It'll work in 99.99% cases but logically that won't cover some corner cases.
One example is e.g. ram_block_from_stream() could fail with an interrupted
network, then -EINVAL will be returned instead of -EIO.

I remembered Dave Gilbert pointed that out before, but somehow this is
overlooked.  Neither did I encounter anything outside the -EIO error.

However we'd better touch that up before it triggers a rare VM data loss during
live migrating.

To cover as much those cases as possible, remove the -EIO restriction on
triggering the postcopy recovery, because even if it's not a channel failure,
we can't do anything better than halting QEMU anyway - the corpse of the
process may even be used by a good hand to dig out useful memory regions, or
the admin could simply kill the process later on.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c    | 4 ++--
 migration/postcopy-ram.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 6e4cc9cc87..67520d3105 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2877,7 +2877,7 @@ retry:
 out:
     res = qemu_file_get_error(rp);
     if (res) {
-        if (res == -EIO && migration_in_postcopy()) {
+        if (res && migration_in_postcopy()) {
             /*
              * Maybe there is something we can do: it looks like a
              * network down issue, and we pause for a recovery.
@@ -3478,7 +3478,7 @@ static MigThrError migration_detect_error(MigrationState *s)
         error_free(local_error);
     }
 
-    if (state == MIGRATION_STATUS_POSTCOPY_ACTIVE && ret == -EIO) {
+    if (state == MIGRATION_STATUS_POSTCOPY_ACTIVE && ret) {
         /*
          * For postcopy, we allow the network to be down for a
          * while. After that, it can be continued by a
diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index d3ec22e6de..6be510fea4 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -1038,7 +1038,7 @@ retry:
                                         msg.arg.pagefault.address);
             if (ret) {
                 /* May be network failure, try to wait for recovery */
-                if (ret == -EIO && postcopy_pause_fault_thread(mis)) {
+                if (postcopy_pause_fault_thread(mis)) {
                     /* We got reconnected somehow, try to continue */
                     goto retry;
                 } else {
-- 
2.32.0


