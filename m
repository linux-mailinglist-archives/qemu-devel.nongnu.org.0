Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B16207982
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 18:50:38 +0200 (CEST)
Received: from localhost ([::1]:36034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jo8bd-0005NX-Qs
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 12:50:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jo8VJ-0003HJ-8U
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 12:44:05 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:30111
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jo8V9-000558-Az
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 12:44:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593017033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3Sh0UAY1+Hr4CyavGL5vHaBvy5U4c3TrBNo8FN91rFE=;
 b=VlMTnisL8MS7RFbOKnq9yZpDrLGIKM+LlzdCfQaLC4bUUH6ij7PWcOjO5Ac1JG3wH/iJnu
 Ldkhbc5glwhpIqbLg8dmhw5odxQ3pmDVblwf41hY1BNM+fSdSx/44UjOYT0mois99oKOh6
 0I5NpztbRBH/y/VsRK2KtnHRbbBTZEg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-UM1UQfI_OIyGk9wsuP1Ksg-1; Wed, 24 Jun 2020 12:43:50 -0400
X-MC-Unique: UM1UQfI_OIyGk9wsuP1Ksg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36CBE8015F6;
 Wed, 24 Jun 2020 16:43:49 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EF60B1A90F;
 Wed, 24 Jun 2020 16:43:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 11C95113847A; Wed, 24 Jun 2020 18:43:45 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/46] qemu-option: Simplify around find_default_by_name()
Date: Wed, 24 Jun 2020 18:43:11 +0200
Message-Id: <20200624164344.3778251-14-armbru@redhat.com>
In-Reply-To: <20200624164344.3778251-1-armbru@redhat.com>
References: <20200624164344.3778251-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 02:33:25
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
---
 util/qemu-option.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/util/qemu-option.c b/util/qemu-option.c
index ddcf3072c5..d9293814b4 100644
--- a/util/qemu-option.c
+++ b/util/qemu-option.c
@@ -286,11 +286,9 @@ const char *qemu_opt_get(QemuOpts *opts, const char *name)
     opt = qemu_opt_find(opts, name);
     if (!opt) {
         def_val = find_default_by_name(opts, name);
-        if (def_val) {
-            return def_val;
-        }
+        return def_val;
     }
-    return opt ? opt->str : NULL;
+    return opt->str;
 }
 
 void qemu_opt_iter_init(QemuOptsIter *iter, QemuOpts *opts, const char *name)
@@ -320,7 +318,7 @@ char *qemu_opt_get_del(QemuOpts *opts, const char *name)
 {
     QemuOpt *opt;
     const char *def_val;
-    char *str = NULL;
+    char *str;
 
     if (opts == NULL) {
         return NULL;
@@ -329,10 +327,7 @@ char *qemu_opt_get_del(QemuOpts *opts, const char *name)
     opt = qemu_opt_find(opts, name);
     if (!opt) {
         def_val = find_default_by_name(opts, name);
-        if (def_val) {
-            str = g_strdup(def_val);
-        }
-        return str;
+        return g_strdup(def_val);
     }
     str = opt->str;
     opt->str = NULL;
-- 
2.26.2


