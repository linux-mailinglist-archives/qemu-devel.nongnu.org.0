Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4043C555588
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 22:54:12 +0200 (CEST)
Received: from localhost ([::1]:54962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o47MZ-0002Er-B4
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 16:54:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o47IJ-0002iq-3r
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 16:49:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o47IH-0004Hg-Ht
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 16:49:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655930985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3btWgwqdjZi9Z7WYTcj4UpiN3YkzVWNlwPq6/1+kKWg=;
 b=A3IxJ4lVpEnLDDaNsmAPAJ4dUEi5hgiDkRdSqUpWapVQMfIf69fx9P55JKvH+Ck3ZWFntw
 fG5yBy2of9W4ZDNxOEF29tQQB973hM8kvIn5OmTgu2F9khgZT+H61VPOpmlE812yniSh7R
 R7as3afWgFG5U5FYY6FIdVhlMEmi++M=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-327-BHpkWfhXOkeDw2zYupgAAA-1; Wed, 22 Jun 2022 16:49:43 -0400
X-MC-Unique: BHpkWfhXOkeDw2zYupgAAA-1
Received: by mail-io1-f70.google.com with SMTP id
 n20-20020a6b7214000000b00669cae33d00so9773789ioc.17
 for <qemu-devel@nongnu.org>; Wed, 22 Jun 2022 13:49:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3btWgwqdjZi9Z7WYTcj4UpiN3YkzVWNlwPq6/1+kKWg=;
 b=GiFrAr8g5pYMddG+YQH7Kqt1MoRqb32uyvTCXlBsUKDmZpwwmyLQcCN5Hg45MhpsHB
 V3L3V3KXv/aqSOc9hM9x5d4dCZ+PLI1oyhPO88KpZzEH/7YQTIOineYllo7DESaqiJXr
 DUnf3Iku24+yuRKSaXF7w4bvVmuThFUBDZdVWnay8/qZzMsjYmHX542eNzhfAykV2B4w
 /5oVViMtS7LErzgimp9Avx5aBWfF0qJDX6QHJaM/OszW3GBfPnVwDuIWx0S1yewoByHJ
 djHVnRH6fAbfdoUblGIXi0k9AtrfbX9IBhqmRBpUxyG+auKtQhrBQZAUfukOubW2KsjA
 zzlw==
X-Gm-Message-State: AJIora/xcbriK8AmaIhvEWvAZzcX+l919xCsca9DRc5+k2PqUA0zZcHd
 XGdi38kDosiDXlO4sOeL/yYyBtkdBramoJHetxF7lCR6jfN99K1FOAdIW+DCbz89I4InITG0JF4
 PDcHz4M2eP5ibLESynmB2B7JlbUPP2hVJVsVtt6otU5tl8dX/pAlR1CUonrNzQc7m
X-Received: by 2002:a05:6e02:1aa7:b0:2d3:dce1:400c with SMTP id
 l7-20020a056e021aa700b002d3dce1400cmr3128375ilv.94.1655930982641; 
 Wed, 22 Jun 2022 13:49:42 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s5lfyQUw92SD1KbTgfl+niAM+ywsToUfUNmgCthH/Cda1zGAqo22ILsqlXSMbyRbQUSf7xYg==
X-Received: by 2002:a05:6e02:1aa7:b0:2d3:dce1:400c with SMTP id
 l7-20020a056e021aa700b002d3dce1400cmr3128358ilv.94.1655930982352; 
 Wed, 22 Jun 2022 13:49:42 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 b44-20020a0295af000000b0032b3a7817a7sm8920323jai.107.2022.06.22.13.49.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 22 Jun 2022 13:49:41 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Daniel P . Berrange" <berrange@redhat.com>, peterx@redhat.com,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: [PATCH v8 07/15] migration: Add property x-postcopy-preempt-break-huge
Date: Wed, 22 Jun 2022 16:49:12 -0400
Message-Id: <20220622204920.79061-8-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220622204920.79061-1-peterx@redhat.com>
References: <20220622204920.79061-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a property field that can conditionally disable the "break sending huge
page" behavior in postcopy preemption.  By default it's enabled.

It should only be used for debugging purposes, and we should never remove
the "x-" prefix.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Manish Mishra <manish.mishra@nutanix.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c | 2 ++
 migration/migration.h | 7 +++++++
 migration/ram.c       | 7 +++++++
 3 files changed, 16 insertions(+)

diff --git a/migration/migration.c b/migration/migration.c
index 5d113bd5cc..e10f0400ef 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -4362,6 +4362,8 @@ static Property migration_properties[] = {
     DEFINE_PROP_SIZE("announce-step", MigrationState,
                       parameters.announce_step,
                       DEFAULT_MIGRATE_ANNOUNCE_STEP),
+    DEFINE_PROP_BOOL("x-postcopy-preempt-break-huge", MigrationState,
+                      postcopy_preempt_break_huge, true),
 
     /* Migration capabilities */
     DEFINE_PROP_MIG_CAP("x-xbzrle", MIGRATION_CAPABILITY_XBZRLE),
diff --git a/migration/migration.h b/migration/migration.h
index ae4ffd3454..cdad8aceaa 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -340,6 +340,13 @@ struct MigrationState {
     bool send_configuration;
     /* Whether we send section footer during migration */
     bool send_section_footer;
+    /*
+     * Whether we allow break sending huge pages when postcopy preempt is
+     * enabled.  When disabled, we won't interrupt precopy within sending a
+     * host huge page, which is the old behavior of vanilla postcopy.
+     * NOTE: this parameter is ignored if postcopy preempt is not enabled.
+     */
+    bool postcopy_preempt_break_huge;
 
     /* Needed by postcopy-pause state */
     QemuSemaphore postcopy_pause_sem;
diff --git a/migration/ram.c b/migration/ram.c
index 65b08c4edb..7cbe9c310d 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2266,11 +2266,18 @@ static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss)
 
 static bool postcopy_needs_preempt(RAMState *rs, PageSearchStatus *pss)
 {
+    MigrationState *ms = migrate_get_current();
+
     /* Not enabled eager preempt?  Then never do that. */
     if (!migrate_postcopy_preempt()) {
         return false;
     }
 
+    /* If the user explicitly disabled breaking of huge page, skip */
+    if (!ms->postcopy_preempt_break_huge) {
+        return false;
+    }
+
     /* If the ramblock we're sending is a small page?  Never bother. */
     if (qemu_ram_pagesize(pss->block) == TARGET_PAGE_SIZE) {
         return false;
-- 
2.32.0


