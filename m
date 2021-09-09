Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D46E5404895
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 12:38:33 +0200 (CEST)
Received: from localhost ([::1]:52024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOHRv-0003uM-VP
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 06:38:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mOHNb-00037G-Mp
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 06:34:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mOHNa-0002zw-6t
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 06:34:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631183641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nvh/cZGPWcsWthM5PmY0X5hm0ltlTZ94U+LQczMd7kY=;
 b=SX6sssU4X/fanLf4aYLWXdjiijWPlUFAWIAyqxGSh85nbZj4KhyZfYtIfQTVHwlfkZeKfq
 95ca1NzhHh38vxCI6l21oJzFHyMh/7p97lIuVKWe6xuj8lRoP/J0ezrhq6RV942S4YurHx
 EhapAvc4eKIRt3tXXUWvo8514ybfAWo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525--JrM6JlqMkKVtE4yQwx_qg-1; Thu, 09 Sep 2021 06:33:57 -0400
X-MC-Unique: -JrM6JlqMkKVtE4yQwx_qg-1
Received: by mail-wr1-f69.google.com with SMTP id
 d10-20020adffbca000000b00157bc86d94eso361493wrs.20
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 03:33:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nvh/cZGPWcsWthM5PmY0X5hm0ltlTZ94U+LQczMd7kY=;
 b=2C5e6ZrzAeAtFEyHyMBjoTm4s8ughtfPHdY/s+HOoZYeIb54j79qHSfYiytxs4wIrT
 kFKCr8ZenTjgbepkeEuRJXXOVFecD+5NTVbvND0ReEmNHQtzFKydldp3O7ovrgc1cVc1
 Gsmq7o/Fl2C9hkEYNrE5zJEI5DXkzQj+FlIBM5bDHKQIYQ03SmzR16U9YCJ42WwTm6fa
 Y/BAm0WLMqbUdKycMpEnyoI5Erjniz68dxKcfE8mFZ0C+auaxYMEu45StedPoIXwvEUG
 P9F74/D+dJ1tpddUoU6TuqxyEPaFF6UHEe9xDvnJ31S5g8IxZwd8VdZnxv0KvL78GnuE
 UNZg==
X-Gm-Message-State: AOAM533hKOXQitWRDXWTY1VPF2RyFCm9Fev1p5wahIQZqezpdalrJX1f
 PoWh0DYAdh0dbb+W24hwUvhEZSsgcqwLGXPadLQOC8YgOFQUQfwNubfXA4PadmCt/fD8IjA+3LP
 HN7hoTOs/Xqp6x+FMvATjJvWgJzFWrHSs5psPSZpK4wLTfZqCa8Jmf/PG1gKfZ3tRB/8=
X-Received: by 2002:a7b:ce93:: with SMTP id q19mr2172637wmj.195.1631183636497; 
 Thu, 09 Sep 2021 03:33:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQl9WwKms+3Jw/ckwC3lSSgEtVHDeDZBk4XTJN0Cwx3jNrdeEkWmWBWdyPPOmtCCLRqtXkkA==
X-Received: by 2002:a7b:ce93:: with SMTP id q19mr2172619wmj.195.1631183636321; 
 Thu, 09 Sep 2021 03:33:56 -0700 (PDT)
Received: from localhost (static-201-64-63-95.ipcom.comunitel.net.
 [95.63.64.201])
 by smtp.gmail.com with ESMTPSA id t14sm1336953wrw.59.2021.09.09.03.33.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 03:33:56 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 7/7] migration: allow enabling mutilfd for specific protocol
 only
Date: Thu,  9 Sep 2021 12:33:46 +0200
Message-Id: <20210909103346.1990-8-quintela@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210909103346.1990-1-quintela@redhat.com>
References: <20210909103346.1990-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Li Zhijian <lizhijian@cn.fujitsu.com>

To: <quintela@redhat.com>, <dgilbert@redhat.com>, <qemu-devel@nongnu.org>
CC: Li Zhijian <lizhijian@cn.fujitsu.com>
Date: Sat, 31 Jul 2021 22:05:52 +0800 (5 weeks, 4 days, 17 hours ago)

And change the default to true so that in '-incoming defer' case, user is able
to change multifd capability.

Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration.c | 8 ++++++++
 migration/multifd.c   | 2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/migration/migration.c b/migration/migration.c
index 10e7616a48..77f9a3cfd3 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1237,6 +1237,14 @@ static bool migrate_caps_check(bool *cap_list,
         }
     }
 
+    /* incoming side only */
+    if (runstate_check(RUN_STATE_INMIGRATE) &&
+        !migrate_multifd_is_allowed() &&
+        cap_list[MIGRATION_CAPABILITY_MULTIFD]) {
+        error_setg(errp, "multifd is not supported by current protocol");
+        return false;
+    }
+
     return true;
 }
 
diff --git a/migration/multifd.c b/migration/multifd.c
index 283f672bf0..7c9deb1921 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -868,7 +868,7 @@ cleanup:
     multifd_new_send_channel_cleanup(p, sioc, local_err);
 }
 
-static bool migrate_allow_multifd;
+static bool migrate_allow_multifd = true;
 void migrate_protocol_allow_multifd(bool allow)
 {
     migrate_allow_multifd = allow;
-- 
2.31.1


