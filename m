Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8AD57B600
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 13:56:57 +0200 (CEST)
Received: from localhost ([::1]:45022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE8K0-00085v-EC
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 07:56:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oE7kd-0005GB-V9
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 07:20:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oE7kZ-0000UZ-Qw
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 07:20:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658316017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GX2aH48vw2z6gVz8M8ZthDWrr/cLpdZZMPap+r4UavQ=;
 b=Q7yr+aT0HT9XWTi2TC7hBerWZ0oEDCR2bIeHietR43guNV/EhjPkSE+zHmywHrit8/ZWiq
 baCv6d7EgTzpW7wbGewJvAPKbTzY0i4YyBQEFChYsKaY56jTeXez6VDFyYEMQBHh3d3iJm
 FdKmApPlbkrET6E54iMZxCRVoGTTKAo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-324-qI4imAdVPO657KkG_MQZAg-1; Wed, 20 Jul 2022 07:20:07 -0400
X-MC-Unique: qI4imAdVPO657KkG_MQZAg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2890538164C1;
 Wed, 20 Jul 2022 11:20:07 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.158])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 311792166B26;
 Wed, 20 Jul 2022 11:20:06 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, leobras@redhat.com, quintela@redhat.com,
 berrange@redhat.com, peterx@redhat.com, iii@linux.ibm.com,
 huangy81@chinatelecom.cn
Subject: [PULL 29/30] migration: Avoid false-positive on non-supported
 scenarios for zero-copy-send
Date: Wed, 20 Jul 2022 12:19:25 +0100
Message-Id: <20220720111926.107055-30-dgilbert@redhat.com>
In-Reply-To: <20220720111926.107055-1-dgilbert@redhat.com>
References: <20220720111926.107055-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Leonardo Bras <leobras@redhat.com>

Migration with zero-copy-send currently has it's limitations, as it can't
be used with TLS nor any kind of compression. In such scenarios, it should
output errors during parameter / capability setting.

But currently there are some ways of setting this not-supported scenarios
without printing the error message:

!) For 'compression' capability, it works by enabling it together with
zero-copy-send. This happens because the validity test for zero-copy uses
the helper unction migrate_use_compression(), which check for compression
presence in s->enabled_capabilities[MIGRATION_CAPABILITY_COMPRESS].

The point here is: the validity test happens before the capability gets
enabled. If all of them get enabled together, this test will not return
error.

In order to fix that, replace migrate_use_compression() by directly testing
the cap_list parameter migrate_caps_check().

2) For features enabled by parameters such as TLS & 'multifd_compression',
there was also a possibility of setting non-supported scenarios: setting
zero-copy-send first, then setting the unsupported parameter.

In order to fix that, also add a check for parameters conflicting with
zero-copy-send on migrate_params_check().

3) XBZRLE is also a compression capability, so it makes sense to also add
it to the list of capabilities which are not supported with zero-copy-send.

Fixes: 1abaec9a1b2c ("migration: Change zero_copy_send from migration parameter to migration capability")
Signed-off-by: Leonardo Bras <leobras@redhat.com>
Message-Id: <20220719122345.253713-1-leobras@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/migration.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/migration/migration.c b/migration/migration.c
index 15ae48b209..e03f698a3c 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1306,7 +1306,9 @@ static bool migrate_caps_check(bool *cap_list,
 #ifdef CONFIG_LINUX
     if (cap_list[MIGRATION_CAPABILITY_ZERO_COPY_SEND] &&
         (!cap_list[MIGRATION_CAPABILITY_MULTIFD] ||
-         migrate_use_compression() ||
+         cap_list[MIGRATION_CAPABILITY_COMPRESS] ||
+         cap_list[MIGRATION_CAPABILITY_XBZRLE] ||
+         migrate_multifd_compression() ||
          migrate_use_tls())) {
         error_setg(errp,
                    "Zero copy only available for non-compressed non-TLS multifd migration");
@@ -1550,6 +1552,17 @@ static bool migrate_params_check(MigrationParameters *params, Error **errp)
         error_prepend(errp, "Invalid mapping given for block-bitmap-mapping: ");
         return false;
     }
+
+#ifdef CONFIG_LINUX
+    if (migrate_use_zero_copy_send() &&
+        ((params->has_multifd_compression && params->multifd_compression) ||
+         (params->has_tls_creds && params->tls_creds && *params->tls_creds))) {
+        error_setg(errp,
+                   "Zero copy only available for non-compressed non-TLS multifd migration");
+        return false;
+    }
+#endif
+
     return true;
 }
 
-- 
2.36.1


