Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AA021290C
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jul 2020 18:10:01 +0200 (CEST)
Received: from localhost ([::1]:46234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jr1mi-0000EJ-TO
	for lists+qemu-devel@lfdr.de; Thu, 02 Jul 2020 12:10:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jr1U5-0000r4-8M
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 11:50:45 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:41672
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jr1Tf-0004tX-Rv
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 11:50:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593705012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Psc2/qtFuObz4HxWFph7CzkwSzBHiFg3VdLcX7BaxxI=;
 b=Uc8luZ744cYnDPnZiOlCU7BQrPn7rlNxbuhjssD+fUI5CqfS7b5Wstacqmrer3hbmC681o
 hOPM8LoaqU8nVLQlH9rDN1muuOTFYYeo8woZgz3o5DVZa4nBayqzZn5vedlYrhDojVwPz/
 kGfmUG0uv2dbIR4XBxfNTgojpQEJNt0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-P-X83vPFMamJaMZmMAaZvQ-1; Thu, 02 Jul 2020 11:50:09 -0400
X-MC-Unique: P-X83vPFMamJaMZmMAaZvQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 141DF107ACF7;
 Thu,  2 Jul 2020 15:50:08 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D62AF6116D;
 Thu,  2 Jul 2020 15:50:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A238C1138538; Thu,  2 Jul 2020 17:50:00 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/44] qemu-option: Factor out helper opt_create()
Date: Thu,  2 Jul 2020 17:49:26 +0200
Message-Id: <20200702155000.3455325-11-armbru@redhat.com>
In-Reply-To: <20200702155000.3455325-1-armbru@redhat.com>
References: <20200702155000.3455325-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 03:23:40
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

There is just one use so far.  The next commit will add more.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 util/qemu-option.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/util/qemu-option.c b/util/qemu-option.c
index e7b540a21b..1023fe7527 100644
--- a/util/qemu-option.c
+++ b/util/qemu-option.c
@@ -499,6 +499,23 @@ int qemu_opt_unset(QemuOpts *opts, const char *name)
     }
 }
 
+static QemuOpt *opt_create(QemuOpts *opts, const char *name, char *value,
+                           bool prepend)
+{
+    QemuOpt *opt = g_malloc0(sizeof(*opt));
+
+    opt->name = g_strdup(name);
+    opt->str = value;
+    opt->opts = opts;
+    if (prepend) {
+        QTAILQ_INSERT_HEAD(&opts->head, opt, next);
+    } else {
+        QTAILQ_INSERT_TAIL(&opts->head, opt, next);
+    }
+
+    return opt;
+}
+
 static void opt_set(QemuOpts *opts, const char *name, char *value,
                     bool prepend, bool *help_wanted, Error **errp)
 {
@@ -516,16 +533,8 @@ static void opt_set(QemuOpts *opts, const char *name, char *value,
         return;
     }
 
-    opt = g_malloc0(sizeof(*opt));
-    opt->name = g_strdup(name);
-    opt->opts = opts;
-    if (prepend) {
-        QTAILQ_INSERT_HEAD(&opts->head, opt, next);
-    } else {
-        QTAILQ_INSERT_TAIL(&opts->head, opt, next);
-    }
+    opt = opt_create(opts, name, value, prepend);
     opt->desc = desc;
-    opt->str = value;
     qemu_opt_parse(opt, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
-- 
2.26.2


