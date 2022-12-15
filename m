Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE26F64E3C2
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 23:26:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5wex-0007RH-Ub; Thu, 15 Dec 2022 17:24:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p5wev-0007Qj-DM
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 17:24:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p5wet-0001wh-JV
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 17:24:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671143094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=wzLJlESUcTWTu0JvlgQRTkOijKxU1qaInOkRe2IPPMA=;
 b=Fzegc+GpQfpZFlqnYMQDNbteeqa44RBo3lcXkK7qUyAhtbmDlRzeYVSFRXGpeQBSKXY79+
 zCjPjHwPtx31t9nuL80Cj7qNHm16GTqtOPiEBQT7XSKpeYsyQkllrLYk0gwX1IGcWhnRSv
 ON7m0HK+kO53yPYpvUx7oAhan5ViyiY=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-671-jHuzCpnlM3GXSbBNUU_YMQ-1; Thu, 15 Dec 2022 17:24:53 -0500
X-MC-Unique: jHuzCpnlM3GXSbBNUU_YMQ-1
Received: by mail-qv1-f70.google.com with SMTP id
 w2-20020a0562140b2200b004d66d74f93cso330207qvj.15
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 14:24:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wzLJlESUcTWTu0JvlgQRTkOijKxU1qaInOkRe2IPPMA=;
 b=ueT6czZPPWmD0VXLG7Ah7rKKJEWnbqsjDiK9TMGJOCWreNbB2Q0/XXGHjMpFOIWiuJ
 g+wtuLz36O9VOLBh21ynC6kid9XDRHyCeyDF/c1kyE3J1eJ/6cMPrzr1T5QbIZnMPPgI
 oJJuSfHN20nQWrXAfkJjGpcuqTtMW6NFbRIEzkuOzVE1hpXUkyJU+HGm0a7CSzM6Y0cr
 QF2HLlB0KaoTrF4Vrp+b8Qc7KE2heAz6QCgR8ZBeBUAkMLsFnCk+Fx0xUPKVTKL13pdL
 VO6l/bFd4w0S0cJ8sASrqQSAXKYVrfACwvcrWWZHuvsj13N6tocxsCLkgOZctQAe9Snf
 fGnA==
X-Gm-Message-State: ANoB5pkdOEphX5aq2HDSzcCZdkPMLnGC40SMLS4qLUYQRozjnOnkN7aN
 RVP6GLGf3b9UIQHfFQ0VBXnd9tKHjHtSyWWRML4xUnRrag6KErXDv6ZrY/gVY2VAgdnlJnp6giM
 6ZuhGZNEDOWYWhd5xJE0uu53cLFkMieOL+wFG8DldwWLz7OB/+/RZ8R4E39nSickD
X-Received: by 2002:ac8:6743:0:b0:3a8:313f:ec66 with SMTP id
 n3-20020ac86743000000b003a8313fec66mr7646509qtp.58.1671143091542; 
 Thu, 15 Dec 2022 14:24:51 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7uDGVib1JtvXjAByoJgcXV6Vr3L86qAV5nmspU5UFvLpdBX4vy0O7kYPd3BPiSYje8ccb7Xg==
X-Received: by 2002:ac8:6743:0:b0:3a8:313f:ec66 with SMTP id
 n3-20020ac86743000000b003a8313fec66mr7646489qtp.58.1671143091297; 
 Thu, 15 Dec 2022 14:24:51 -0800 (PST)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-45-70-31-26-132.dsl.bell.ca. [70.31.26.132])
 by smtp.gmail.com with ESMTPSA id
 195-20020a370ccc000000b006fec1c0754csm118081qkm.87.2022.12.15.14.24.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 14:24:49 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com
Subject: [PATCH] migration: Show downtime during postcopy phase
Date: Thu, 15 Dec 2022 17:24:48 -0500
Message-Id: <20221215222448.1893656-1-peterx@redhat.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The downtime should be displayed during postcopy phase because the
switchover phase is done.  OTOH it's weird to show "expected downtime"
which can confuse what does that mean if the switchover has already
happened anyway.

This is a slight ABI change on QMP, but I assume it shouldn't affect
anyone.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 64f74534e2..993782598f 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1077,20 +1077,30 @@ bool migration_is_running(int state)
     }
 }
 
+static bool migrate_show_downtime(MigrationState *s)
+{
+    return (s->state == MIGRATION_STATUS_COMPLETED) || migration_in_postcopy();
+}
+
 static void populate_time_info(MigrationInfo *info, MigrationState *s)
 {
     info->has_status = true;
     info->has_setup_time = true;
     info->setup_time = s->setup_time;
+
     if (s->state == MIGRATION_STATUS_COMPLETED) {
         info->has_total_time = true;
         info->total_time = s->total_time;
-        info->has_downtime = true;
-        info->downtime = s->downtime;
     } else {
         info->has_total_time = true;
         info->total_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME) -
                            s->start_time;
+    }
+
+    if (migrate_show_downtime(s)) {
+        info->has_downtime = true;
+        info->downtime = s->downtime;
+    } else {
         info->has_expected_downtime = true;
         info->expected_downtime = s->expected_downtime;
     }
-- 
2.37.3


