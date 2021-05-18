Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D46BA387CDF
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 17:50:45 +0200 (CEST)
Received: from localhost ([::1]:60662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj1zY-0003jy-S4
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 11:50:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lj1qh-000101-1Z
 for qemu-devel@nongnu.org; Tue, 18 May 2021 11:41:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lj1qe-0007Oi-9b
 for qemu-devel@nongnu.org; Tue, 18 May 2021 11:41:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621352491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=43vNoQO6grH4MkSSW/tNt26aVpHvhL/3pAIxOBZf714=;
 b=LiHZ2NQW1suiS1nw6XG6k6y+87SRYZpWjM9uw6KUT5iTz0V+3hYGadjMe8FVX7yU58MzzG
 GT8jTWs0DtsDogvMuzJ2xj2hyKs2LZk8O8jk9mqVBmMwDfqN5SApBHXP9bv8kjJyGP3tQO
 RAEsYqjPx8zV6KmkFE/rKXvB5JmXZZs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-Pd2lPYdHMHWDkO5i2mgx1g-1; Tue, 18 May 2021 11:41:29 -0400
X-MC-Unique: Pd2lPYdHMHWDkO5i2mgx1g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6FAC1034B56;
 Tue, 18 May 2021 15:41:01 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6CC8434810;
 Tue, 18 May 2021 15:41:01 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] vl: plug -object back into -readconfig
Date: Tue, 18 May 2021 11:40:59 -0400
Message-Id: <20210518154059.3002446-3-pbonzini@redhat.com>
In-Reply-To: <20210518154014.2999326-1-pbonzini@redhat.com>
References: <20210518154014.2999326-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, armbru@redhat.com, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit bc2f4fcb1d ("qom: move user_creatable_add_opts logic to vl.c
and QAPIfy it", 2021-03-19) switched the creation of objects from
qemu_opts_foreach to a bespoke QTAILQ in preparation for supporting JSON
syntax in -object.

Unfortunately in doing so it lost support for [object] stanzas in
configuration files and also for "-set object.ID.KEY=VAL".  The latter
is hard to re-establish and probably best solved by deprecating -set.
This patch uses the infrastructure introduced by the previous two
patches in order to parse QOM objects correctly from configuration
files.

Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>
Cc: qemu-stable@nongnu.org
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/vl.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 90e491cc0c..a8abf8e740 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1708,9 +1708,15 @@ static void object_option_foreach_add(bool (*type_opt_predicate)(const char *))
     }
 }
 
+static void object_option_add_visitor(Visitor *v)
+{
+    ObjectOption *opt = g_new0(ObjectOption, 1);
+    visit_type_ObjectOptions(v, NULL, &opt->opts, &error_fatal);
+    QTAILQ_INSERT_TAIL(&object_opts, opt, next);
+}
+
 static void object_option_parse(const char *optarg)
 {
-    ObjectOption *opt;
     QemuOpts *opts;
     const char *type;
     Visitor *v;
@@ -1738,11 +1744,8 @@ static void object_option_parse(const char *optarg)
         v = opts_visitor_new(opts);
     }
 
-    opt = g_new0(ObjectOption, 1);
-    visit_type_ObjectOptions(v, NULL, &opt->opts, &error_fatal);
+    object_option_add_visitor(v);
     visit_free(v);
-
-    QTAILQ_INSERT_TAIL(&object_opts, opt, next);
 }
 
 /*
@@ -2122,12 +2125,21 @@ static int global_init_func(void *opaque, QemuOpts *opts, Error **errp)
  */
 static bool is_qemuopts_group(const char *group)
 {
+    if (g_str_equal(group, "object")) {
+        return false;
+    }
     return true;
 }
 
 static void qemu_record_config_group(const char *group, QDict *dict, bool from_json, Error **errp)
 {
-    abort();
+    if (g_str_equal(group, "object")) {
+        Visitor *v = qobject_input_visitor_new_keyval(QOBJECT(dict));
+        object_option_add_visitor(v);
+        visit_free(v);
+    } else {
+        abort();
+    }
 }
 
 /*
-- 
2.27.0


