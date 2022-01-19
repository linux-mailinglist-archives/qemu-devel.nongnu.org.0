Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0D74936ED
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 10:13:01 +0100 (CET)
Received: from localhost ([::1]:37662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA71X-0002Ve-SG
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 04:12:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nA63O-0007Vg-Vm
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 03:10:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nA63E-0001P8-3i
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 03:10:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642579836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pofGhg+WExSJvEPG5CZzSLd7oFU6LQnPy1cjEzM5ecA=;
 b=YKkdjRFh1vAk+YRFqbRk4WsRSUDc9PivUvujBcnTyXUjPtroRgUS5ZReXysbiWukV4ZnQh
 lRPHmYgOiyuPIPVKUHrZA7iWD5JVO9EE/vxLavf8Fko6LcCSvAoE4lzDBogHIegthESCqV
 st/unJ4n2XKKwcet9JG3Ho6RB4R8MhY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-437-BVCKtXXgOnKu25v5sFsBPw-1; Wed, 19 Jan 2022 03:10:35 -0500
X-MC-Unique: BVCKtXXgOnKu25v5sFsBPw-1
Received: by mail-wm1-f72.google.com with SMTP id
 s190-20020a1ca9c7000000b00347c6c39d9aso1332147wme.5
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 00:10:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pofGhg+WExSJvEPG5CZzSLd7oFU6LQnPy1cjEzM5ecA=;
 b=BydlyQiS5qFR/1yOGB2iFyGB+nNS1RO5MTo0K0EKlaBigF1vwK4qx2duEklvUcb/gb
 4YTrJzRxIGiut5wP8I4zE1H0Nj2uUFsPJUiwxtvH1U3otVNQQTO5NHbyL+HzyAmn9Vlc
 n5wSNQ93GNetl6ktrlP3qyFEbdbN10IpUX8xhBEQskCexSkzKUe+BTCdRXp5+3dx7X/y
 8qdH8ciKqJ1hAHYQskiS1YvS0IEUxqRS6ehNtJFCFWX2W851E25SSzVp3H756QRxObmL
 dAMIApzu1fD2FM4Ju+1AUNfJuz4hTIT8FfExK6/pHlys8EiWD3eBjok18W3349CgdpYU
 S5Vw==
X-Gm-Message-State: AOAM531tTxSS1AdePfLiQZ2cLnmjAiDoClJjbfdiROBq0XM+iowuLwqV
 23gQhjXbA5Rv6sqib+tBCOGGvTP4SHnmBCcXNCdXvWB95LscI+DaJ0u/Fv+aVgQFTf/8ft+2r5k
 G0PA5ZiB2k7TQqN/6hoOhJeeLRjJmR8Q5fdK3crBjgkHvlS8n98MWSGVPKzMWj4y+
X-Received: by 2002:adf:fd4e:: with SMTP id h14mr1842784wrs.404.1642579834013; 
 Wed, 19 Jan 2022 00:10:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzr479xY7XIvPHCGyHtzDZZymn0aLPVUIljMhbw/pdWZ1iI9i3ot28lFgwSwYxxQisYNd4x+A==
X-Received: by 2002:adf:fd4e:: with SMTP id h14mr1842757wrs.404.1642579833705; 
 Wed, 19 Jan 2022 00:10:33 -0800 (PST)
Received: from localhost.localdomain ([85.203.46.175])
 by smtp.gmail.com with ESMTPSA id a20sm4351606wmb.27.2022.01.19.00.10.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 19 Jan 2022 00:10:33 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 13/15] migration: Add postcopy-preempt capability
Date: Wed, 19 Jan 2022 16:09:27 +0800
Message-Id: <20220119080929.39485-14-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220119080929.39485-1-peterx@redhat.com>
References: <20220119080929.39485-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Firstly, postcopy already preempts precopy due to the fact that we do
unqueue_page() first before looking into dirty bits.

However that's not enough, e.g., when there're host huge page enabled, when
sending a precopy huge page, a postcopy request needs to wait until the whole
huge page that is sending to finish.  That could introduce quite some delay,
the bigger the huge page is the larger delay it'll bring.

This patch adds a new capability to allow postcopy requests to preempt existing
precopy page during sending a huge page, so that postcopy requests can be
serviced even faster.

Meanwhile to send it even faster, bypass the precopy stream by providing a
standalone postcopy socket for sending requested pages.

Since the new behavior will not be compatible with the old behavior, this will
not be the default, it's enabled only when the new capability is set on both
src/dst QEMUs.

This patch only adds the capability itself, the logic will be added in follow
up patches.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c | 23 +++++++++++++++++++++++
 migration/migration.h |  1 +
 qapi/migration.json   |  8 +++++++-
 3 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/migration/migration.c b/migration/migration.c
index 15a48b548a..84a8fbd80d 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1227,6 +1227,11 @@ static bool migrate_caps_check(bool *cap_list,
             error_setg(errp, "Postcopy is not compatible with ignore-shared");
             return false;
         }
+
+        if (cap_list[MIGRATION_CAPABILITY_MULTIFD]) {
+            error_setg(errp, "Multifd is not supported in postcopy");
+            return false;
+        }
     }
 
     if (cap_list[MIGRATION_CAPABILITY_BACKGROUND_SNAPSHOT]) {
@@ -1270,6 +1275,13 @@ static bool migrate_caps_check(bool *cap_list,
         return false;
     }
 
+    if (cap_list[MIGRATION_CAPABILITY_POSTCOPY_PREEMPT]) {
+        if (!cap_list[MIGRATION_CAPABILITY_POSTCOPY_RAM]) {
+            error_setg(errp, "Postcopy preempt requires postcopy-ram");
+            return false;
+        }
+    }
+
     return true;
 }
 
@@ -2623,6 +2635,15 @@ bool migrate_background_snapshot(void)
     return s->enabled_capabilities[MIGRATION_CAPABILITY_BACKGROUND_SNAPSHOT];
 }
 
+bool migrate_postcopy_preempt(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return s->enabled_capabilities[MIGRATION_CAPABILITY_POSTCOPY_PREEMPT];
+}
+
 /* migration thread support */
 /*
  * Something bad happened to the RP stream, mark an error
@@ -4239,6 +4260,8 @@ static Property migration_properties[] = {
     DEFINE_PROP_MIG_CAP("x-compress", MIGRATION_CAPABILITY_COMPRESS),
     DEFINE_PROP_MIG_CAP("x-events", MIGRATION_CAPABILITY_EVENTS),
     DEFINE_PROP_MIG_CAP("x-postcopy-ram", MIGRATION_CAPABILITY_POSTCOPY_RAM),
+    DEFINE_PROP_MIG_CAP("x-postcopy-preempt",
+                        MIGRATION_CAPABILITY_POSTCOPY_PREEMPT),
     DEFINE_PROP_MIG_CAP("x-colo", MIGRATION_CAPABILITY_X_COLO),
     DEFINE_PROP_MIG_CAP("x-release-ram", MIGRATION_CAPABILITY_RELEASE_RAM),
     DEFINE_PROP_MIG_CAP("x-block", MIGRATION_CAPABILITY_BLOCK),
diff --git a/migration/migration.h b/migration/migration.h
index d0c0902ec9..9d39ccfcf5 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -391,6 +391,7 @@ int migrate_decompress_threads(void);
 bool migrate_use_events(void);
 bool migrate_postcopy_blocktime(void);
 bool migrate_background_snapshot(void);
+bool migrate_postcopy_preempt(void);
 
 /* Sending on the return path - generic and then for each message type */
 void migrate_send_rp_shut(MigrationIncomingState *mis,
diff --git a/qapi/migration.json b/qapi/migration.json
index bbfd48cf0b..f00b365bd5 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -452,6 +452,12 @@
 #                       procedure starts. The VM RAM is saved with running VM.
 #                       (since 6.0)
 #
+# @postcopy-preempt: If enabled, the migration process will allow postcopy
+#                    requests to preempt precopy stream, so postcopy requests
+#                    will be handled faster.  This is a performance feature and
+#                    should not affect the correctness of postcopy migration.
+#                    (since 7.0)
+#
 # Features:
 # @unstable: Members @x-colo and @x-ignore-shared are experimental.
 #
@@ -465,7 +471,7 @@
            'block', 'return-path', 'pause-before-switchover', 'multifd',
            'dirty-bitmaps', 'postcopy-blocktime', 'late-block-activate',
            { 'name': 'x-ignore-shared', 'features': [ 'unstable' ] },
-           'validate-uuid', 'background-snapshot'] }
+           'validate-uuid', 'background-snapshot', 'postcopy-preempt'] }
 
 ##
 # @MigrationCapabilityStatus:
-- 
2.32.0


