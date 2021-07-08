Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C8E3C19BC
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 21:23:05 +0200 (CEST)
Received: from localhost ([::1]:57798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Zc0-0001Ag-UT
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 15:23:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m1ZMl-0000E1-Qx
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:07:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m1ZMX-0003x5-I7
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:07:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625771222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JJwQBaEqPe/S8oFhJKkD4BqzmaMWBTRJJMPC5Q0UEuk=;
 b=CspCWdgbn9JjLE7VcDRm/udfGCSIZxWIiKm8Ytpsrulwk7ryhXwJ+F/1plW6e47lqB5OUb
 CX8uFyBadQu8PO4x1LwYeerwQr0x6frTAbMYGu7dQNroJoPaOtdQKJcVGh5rc1nvX4x85J
 OHcFsJORNUPGn02hcI/3zIh61VNktjo=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-ySh8I9C9MmuxLdoG8WPGow-1; Thu, 08 Jul 2021 15:07:01 -0400
X-MC-Unique: ySh8I9C9MmuxLdoG8WPGow-1
Received: by mail-qv1-f69.google.com with SMTP id
 eo5-20020ad459450000b02902d60d0f0744so1763522qvb.2
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 12:07:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JJwQBaEqPe/S8oFhJKkD4BqzmaMWBTRJJMPC5Q0UEuk=;
 b=oI1avNYPxylX2DSFomrj6tgyDf+d1Ny3T6xRMWYXHcVlQrbdU8DCoJHwpUPhmIPjQa
 xTBmvUJFZgOQzcmCsq4Q9njWiOG4QVYlQpZClHb0cJdHX1t8rQByXFDpCcbHygPbT4/e
 GblaA6SLgEvy4EGTTVryzN7d2D/3jpVMp22lgfvU0jFMZjlwWzaqfH1K1tmhNfITE+ls
 X+arh8iqzYWoV1EIOA2pZdwj5whFz3kv+hwN8ejJ9x/nu4uGrVW2+4D+V2XHWeD/m7g/
 GLExUUFTqQerBI7qp/0j7p/HwDO3RhtZj6Zt0hzx5OLIho+gjH8HUz5SuVMysE0MnNvk
 Lsog==
X-Gm-Message-State: AOAM530ypPlwYXkvtokq4ILt7HiehjLqyNufp2EYxk6a2B92GFEOzYmE
 otGsVWdL1rF+gZWxeHt7/+hqfgoALA/TPj7t8ATRxmT2ScJm9OghcSxesdSb2fS4iQCRCPqz2Cg
 hBg3Ykh0h49NrzPSmSokbEjf5+EDkArsm6mFP1/4TlcLuJ8Pq0PXsl+c4HKnXndX7
X-Received: by 2002:a0c:d605:: with SMTP id c5mr31753184qvj.7.1625771220626;
 Thu, 08 Jul 2021 12:07:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwVEvDnVhxPLDF3lUqLj/Qu0dmXfXhy3AexNw8ydrvgyf/ueTGTtpvK9CcNYRbnKhDGg7eKhw==
X-Received: by 2002:a0c:d605:: with SMTP id c5mr31753164qvj.7.1625771220429;
 Thu, 08 Jul 2021 12:07:00 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id v15sm1430976qkp.96.2021.07.08.12.06.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 12:06:59 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] migration: Don't do migrate cleanup if during postcopy
 resume
Date: Thu,  8 Jul 2021 15:06:52 -0400
Message-Id: <20210708190653.252961-3-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708190653.252961-1-peterx@redhat.com>
References: <20210708190653.252961-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: Lukas Straub <lukasstraub2@web.de>, Juan Quintela <quintela@redhat.com>,
 Li Xiaohui <xiaohli@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Below process could crash qemu with postcopy recovery:

  1. (hmp) migrate -d ..
  2. (hmp) migrate_start_postcopy
  3. [network down, postcopy paused]
  4. (hmp) migrate -r $WRONG_PORT
     when try the recover on an invalid $WRONG_PORT, cleanup_bh will be cleared
  5. (hmp) migrate -r $RIGHT_PORT
     [qemu crash on assert(cleanup_bh)]

The thing is we shouldn't cleanup if it's postcopy resume; the error is set
mostly because the channel is wrong, so we return directly waiting for the user
to retry.

migrate_fd_cleanup() should only be called when migration is cancelled or
completed.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/migration/migration.c b/migration/migration.c
index 8786104c9a..bb1edf862a 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3975,7 +3975,18 @@ void migrate_fd_connect(MigrationState *s, Error *error_in)
     }
     if (error_in) {
         migrate_fd_error(s, error_in);
-        migrate_fd_cleanup(s);
+        if (resume) {
+            /*
+             * Don't do cleanup for resume if channel is invalid, but only dump
+             * the error.  We wait for another channel connect from the user.
+             * The error_report still gives HMP user a hint on what failed.
+             * It's normally done in migrate_fd_cleanup(), but call it here
+             * explicitly.
+             */
+            error_report_err(error_copy(s->error));
+        } else {
+            migrate_fd_cleanup(s);
+        }
         return;
     }
 
-- 
2.31.1


