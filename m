Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2925FBD91
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 00:01:41 +0200 (CEST)
Received: from localhost ([::1]:57808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiNJk-0002aU-KP
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 18:01:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oiNER-0001ae-NU
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 17:56:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oiNEN-0003UV-Gz
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 17:56:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665525366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1BBvt7GyaeaSk78u8ZaaoxGYE7eohdBbynVfXfB+oxE=;
 b=Bb9ojVsz4fRudGRpJ6BvCqiY9zbPaadKah32Q0kbntFH2cUdL42Ci1m3XxM9eQX3R8G55m
 L9cX2OD1F3/GMg/wcdG/0dE7Dhep7VI1CM+RkThs3VmP3Ehu96PEYt8m/HRpUcgBmluIlz
 /Ig4bhn+0funNSbo0PHaakS1lBPA6bA=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-408-ZJuormZ9N3uS9OaTIVArNg-1; Tue, 11 Oct 2022 17:56:05 -0400
X-MC-Unique: ZJuormZ9N3uS9OaTIVArNg-1
Received: by mail-qt1-f200.google.com with SMTP id
 e24-20020ac84918000000b0039878b3c676so5677257qtq.6
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 14:56:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1BBvt7GyaeaSk78u8ZaaoxGYE7eohdBbynVfXfB+oxE=;
 b=M+T7YmUTLnye+5xCvQo+/0BnieubhjK8B31GChdKUKwCh8960TWZRNMD1dyRi10gjW
 PUOMuEzognNVsHVWXZG5PasENvxIIB8aBkXeoQN3iic6bge6YIHz5rbdAlbyVx1sx/8l
 s3qYzaEGBJF43jXaShDUTTKSwscvlQX2KhU/JvkkR3mG4lGZ6ey8BRmDM8hOMgMVw8O/
 Gyn8k1joPRE/O25w3qSpBAp0HWp0HjT5yT7FIPC9zRQtyCqOfaV0JzAABtvX9G1i41NW
 ZYjW082yn2D4xN6hVbJ6XwJTlLgh3sN1FZ9s7zff0juf7fKsClhSDX3jZ1JpsUOcGTYt
 VuEg==
X-Gm-Message-State: ACrzQf0kxt/TWvyvQ6s0EeXziOmtl3u6csJ0dzuhm/V9yzmbVt1lNH2+
 p2gkAYdvKkmrp3ens9mHKHfHSfTvNgh0FtKklM0xe1wiAwJk3h37HtaydvIgdqqg0+ntACkg1m4
 ZDiPIYXtw3jeOpgr50Jn7GlSbdlQCqS4/mCH0h4AhuUrArKtSwLulud98bFcRG+D9
X-Received: by 2002:a05:622a:5ce:b0:39a:17a2:ecb0 with SMTP id
 d14-20020a05622a05ce00b0039a17a2ecb0mr10611986qtb.160.1665525364434; 
 Tue, 11 Oct 2022 14:56:04 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4mZacYGfa6wgfiXxpHdrFqxHBfVnmGxWR7XzhYiEapmgHOI+eApzbcvbrJxa26wEWNOraorg==
X-Received: by 2002:a05:622a:5ce:b0:39a:17a2:ecb0 with SMTP id
 d14-20020a05622a05ce00b0039a17a2ecb0mr10611965qtb.160.1665525364152; 
 Tue, 11 Oct 2022 14:56:04 -0700 (PDT)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a05620a430a00b006ce7cd81359sm13863230qko.110.2022.10.11.14.56.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 14:56:03 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, ani@anisinha.ca,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>
Subject: [PATCH v2 02/15] migration: Add postcopy_preempt_active()
Date: Tue, 11 Oct 2022 17:55:46 -0400
Message-Id: <20221011215559.602584-3-peterx@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221011215559.602584-1-peterx@redhat.com>
References: <20221011215559.602584-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the helper to show that postcopy preempt enabled, meanwhile active.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/ram.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index cfeb571800..7aaa843a21 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -162,6 +162,11 @@ out:
     return ret;
 }
 
+static bool postcopy_preempt_active(void)
+{
+    return migrate_postcopy_preempt() && migration_in_postcopy();
+}
+
 bool ramblock_is_ignored(RAMBlock *block)
 {
     return !qemu_ram_is_migratable(block) ||
@@ -2433,7 +2438,7 @@ static void postcopy_preempt_choose_channel(RAMState *rs, PageSearchStatus *pss)
 /* We need to make sure rs->f always points to the default channel elsewhere */
 static void postcopy_preempt_reset_channel(RAMState *rs)
 {
-    if (migrate_postcopy_preempt() && migration_in_postcopy()) {
+    if (postcopy_preempt_active()) {
         rs->postcopy_channel = RAM_CHANNEL_PRECOPY;
         rs->f = migrate_get_current()->to_dst_file;
         trace_postcopy_preempt_reset_channel();
@@ -2471,7 +2476,7 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
         return 0;
     }
 
-    if (migrate_postcopy_preempt() && migration_in_postcopy()) {
+    if (postcopy_preempt_active()) {
         postcopy_preempt_choose_channel(rs, pss);
     }
 
-- 
2.37.3


