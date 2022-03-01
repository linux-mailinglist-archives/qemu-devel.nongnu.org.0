Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F054C876D
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 10:09:37 +0100 (CET)
Received: from localhost ([::1]:45458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOyVi-0005Ju-Ro
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 04:09:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nOy3G-0004Ae-6I
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 03:40:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nOy3D-0008AG-Vj
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 03:40:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646124007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pXE1AeYTmM/PzAdQpdkXZXkqq6LdQ92xhjUt8UsD2ME=;
 b=WCtfTuiFWm0ir+oa+Ahl9PnDAFW1Zb+NMmctwQhysP3rpDc/7bgVBzJUR4CiCiLNlCOS1H
 FDFncYByInRsWgjozn9snJI3InDqsukJ9D2YrEEEFx7HUlgjs6JMlW3JXznKcl4puItcPP
 FePsYYvg5/t8xD76h92UAKtC0MNP+Gg=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-R8dhXbwnPwGi-q_PXqkDKg-1; Tue, 01 Mar 2022 03:40:06 -0500
X-MC-Unique: R8dhXbwnPwGi-q_PXqkDKg-1
Received: by mail-pf1-f199.google.com with SMTP id
 y28-20020aa793dc000000b004e160274e3eso9354935pff.18
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 00:40:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pXE1AeYTmM/PzAdQpdkXZXkqq6LdQ92xhjUt8UsD2ME=;
 b=yI0kml3YMWFb0iuOyk02yXmiGw/Uerlleuc4IHaH/yLbjyyxniIgpgMEWjPrekAJdr
 H9NIPmUzxmyIs8jnsqE5qgIsXQAjBFY2SfHQx485pHt8VMIkjoqmq0gMNdCXPh3OErk6
 RLVqtjC4wxXBHGSumraP1fwLdZ8Ce3mk00ua8pYZ9/zU5TC3XHyRKY6SlAdAyZdSIr4e
 cRUOztp0B/YalccLTbA7Oztl2fCT33Qhzhu0J1U89i2E0bloazIJipNCFiAwBAUE7Pwu
 KLEWUio8mXNjD8PxiAB2ydutjTb+oEpU3jSHiWDxKALWRrvxSyBpEunQ4mSkdTDlq+7F
 ADQw==
X-Gm-Message-State: AOAM531PMcl2a91J9WoXZOB/2davws8EUzLVyC9qJiMllhMFYz56ObPU
 2/VPGrzmkCeiUrbcxYNQxn0sPr3Ue81E3x8T0N77xi2c6Ga8ZeVE+Fc9wI/ynseZgVKBHkZEWhX
 JwgWI2wD7/KHKM/KdaPybrdoeUwEWdfNl7owGY8aMWlK4XkOZjDvqZiEz+DC7Qq64
X-Received: by 2002:a17:90b:3145:b0:1bc:5855:f94d with SMTP id
 ip5-20020a17090b314500b001bc5855f94dmr20785248pjb.55.1646124005359; 
 Tue, 01 Mar 2022 00:40:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwXKBaLRpHuO7IDwdNyjtOJiibux/w8EtgqGs5ICi3m7nAgLrgdvlVs0F2pQvm7FqJXkx1Qng==
X-Received: by 2002:a17:90b:3145:b0:1bc:5855:f94d with SMTP id
 ip5-20020a17090b314500b001bc5855f94dmr20785219pjb.55.1646124004994; 
 Tue, 01 Mar 2022 00:40:04 -0800 (PST)
Received: from localhost.localdomain ([94.177.118.144])
 by smtp.gmail.com with ESMTPSA id
 l1-20020a17090aec0100b001bc6d8bb27dsm1439987pjy.37.2022.03.01.00.40.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 01 Mar 2022 00:40:04 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/25] migration: postcopy_pause_fault_thread() never fails
Date: Tue,  1 Mar 2022 16:39:11 +0800
Message-Id: <20220301083925.33483-12-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220301083925.33483-1-peterx@redhat.com>
References: <20220301083925.33483-1-peterx@redhat.com>
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per the title, remove the return code and simplify the callers as the errors
will never be triggered.  No functional change intended.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/postcopy-ram.c | 25 ++++---------------------
 1 file changed, 4 insertions(+), 21 deletions(-)

diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index b0d12d5053..32c52f4b1d 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -891,15 +891,11 @@ static void mark_postcopy_blocktime_end(uintptr_t addr)
                                       affected_cpu);
 }
 
-static bool postcopy_pause_fault_thread(MigrationIncomingState *mis)
+static void postcopy_pause_fault_thread(MigrationIncomingState *mis)
 {
     trace_postcopy_pause_fault_thread();
-
     qemu_sem_wait(&mis->postcopy_pause_sem_fault);
-
     trace_postcopy_pause_fault_thread_continued();
-
-    return true;
 }
 
 /*
@@ -959,13 +955,7 @@ static void *postcopy_ram_fault_thread(void *opaque)
              * broken already using the event. We should hold until
              * the channel is rebuilt.
              */
-            if (postcopy_pause_fault_thread(mis)) {
-                /* Continue to read the userfaultfd */
-            } else {
-                error_report("%s: paused but don't allow to continue",
-                             __func__);
-                break;
-            }
+            postcopy_pause_fault_thread(mis);
         }
 
         if (pfd[1].revents) {
@@ -1039,15 +1029,8 @@ retry:
                                         msg.arg.pagefault.address);
             if (ret) {
                 /* May be network failure, try to wait for recovery */
-                if (postcopy_pause_fault_thread(mis)) {
-                    /* We got reconnected somehow, try to continue */
-                    goto retry;
-                } else {
-                    /* This is a unavoidable fault */
-                    error_report("%s: postcopy_request_page() get %d",
-                                 __func__, ret);
-                    break;
-                }
+                postcopy_pause_fault_thread(mis);
+                goto retry;
             }
         }
 
-- 
2.32.0


