Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C29B32128C0
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jul 2020 17:55:04 +0200 (CEST)
Received: from localhost ([::1]:46972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jr1YF-0006xb-Nr
	for lists+qemu-devel@lfdr.de; Thu, 02 Jul 2020 11:55:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jr1Th-0008IK-0k
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 11:50:21 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:35597
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jr1TX-0004qc-UX
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 11:50:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593705010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=anqLy2GztNn/2Nq6AiIlwpA3jES1aqZTdMhm8FjZwm4=;
 b=hE0K5CDeXa+I17jw7PlQSD6lHRoWU/cL3ubZSeMv/YF4BUzmbEhE70XR9cUeXL7J8iEMrP
 Fc59+/QCxtUJWh/odJD32BpZSGNGOXOZK6emeteeqVYl4gcahlDbuw7TNmKKS+yLAAYHCX
 ch1GsmIcsfyXWy9badqkl8meM3IWf0Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-5ST091-aOzyraWLc20YOgw-1; Thu, 02 Jul 2020 11:50:08 -0400
X-MC-Unique: 5ST091-aOzyraWLc20YOgw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4BCE818FE872;
 Thu,  2 Jul 2020 15:50:07 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DDF173FF7;
 Thu,  2 Jul 2020 15:50:05 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BCD2911358CC; Thu,  2 Jul 2020 17:50:00 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/44] hmp: Eliminate a variable in
 hmp_migrate_set_parameter()
Date: Thu,  2 Jul 2020 17:49:31 +0200
Message-Id: <20200702155000.3455325-16-armbru@redhat.com>
In-Reply-To: <20200702155000.3455325-1-armbru@redhat.com>
References: <20200702155000.3455325-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 03:42:59
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, vsementsov@virtuozzo.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 monitor/hmp-cmds.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 2b0b58a336..d7810cb564 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1247,7 +1247,6 @@ void hmp_migrate_set_parameter(Monitor *mon, const QDict *qdict)
     MigrateSetParameters *p = g_new0(MigrateSetParameters, 1);
     uint64_t valuebw = 0;
     uint64_t cache_size;
-    MultiFDCompression compress_type;
     Error *err = NULL;
     int val, ret;
 
@@ -1343,11 +1342,8 @@ void hmp_migrate_set_parameter(Monitor *mon, const QDict *qdict)
         break;
     case MIGRATION_PARAMETER_MULTIFD_COMPRESSION:
         p->has_multifd_compression = true;
-        visit_type_MultiFDCompression(v, param, &compress_type, &err);
-        if (err) {
-            break;
-        }
-        p->multifd_compression = compress_type;
+        visit_type_MultiFDCompression(v, param, &p->multifd_compression,
+                                      &err);
         break;
     case MIGRATION_PARAMETER_MULTIFD_ZLIB_LEVEL:
         p->has_multifd_zlib_level = true;
-- 
2.26.2


