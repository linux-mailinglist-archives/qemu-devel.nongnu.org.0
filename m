Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D2428A626
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Oct 2020 09:37:16 +0200 (CEST)
Received: from localhost ([::1]:41448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kRVut-0008Ds-7N
	for lists+qemu-devel@lfdr.de; Sun, 11 Oct 2020 03:37:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kRVsz-0006Dn-QJ
 for qemu-devel@nongnu.org; Sun, 11 Oct 2020 03:35:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kRVsu-0003Gl-00
 for qemu-devel@nongnu.org; Sun, 11 Oct 2020 03:35:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602401711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2jndvphJf6bhjIWF1IlqwE7u2yBn/WmGzn8tICZ1U2c=;
 b=C8Kkiu/l7ZtSSUbcMeZZM97zAS/qbwrOP6YqXVSUer/CWQEChkSkqEguSthz6KDH/CEbJl
 ekWgIR2z/WkRxgYWBEMmuXb1OuBG7am7cBi6ExFfX62j9TUlT02vZXIVfw50+f/Swqin2S
 L/p0uUNP+7KIVZIVLX7t6kCVng97Kjo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-kdPdQbPQM7OFWogbdncHig-1; Sun, 11 Oct 2020 03:35:09 -0400
X-MC-Unique: kdPdQbPQM7OFWogbdncHig-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4412B10054FF;
 Sun, 11 Oct 2020 07:35:08 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 137985D9CC;
 Sun, 11 Oct 2020 07:35:08 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 25B9C112CE16; Sun, 11 Oct 2020 09:35:05 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 6/7] qom: Add user_creatable_print_help_from_qdict()
Date: Sun, 11 Oct 2020 09:35:04 +0200
Message-Id: <20201011073505.1185335-7-armbru@redhat.com>
In-Reply-To: <20201011073505.1185335-1-armbru@redhat.com>
References: <20201011073505.1185335-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/11 02:10:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kevin Wolf <kwolf@redhat.com>

This adds a function that, given a QDict of non-help options, prints
help for user creatable objects.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
---
 include/qom/object_interfaces.h | 21 ++++++++++++++++++---
 qom/object_interfaces.c         |  9 +++++++++
 2 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/include/qom/object_interfaces.h b/include/qom/object_interfaces.h
index f118fb516b..07d5cc8832 100644
--- a/include/qom/object_interfaces.h
+++ b/include/qom/object_interfaces.h
@@ -154,13 +154,28 @@ int user_creatable_add_opts_foreach(void *opaque,
  * @type: the QOM type to be added
  * @opts: options to create
  *
- * Prints help if requested in @opts.
+ * Prints help if requested in @type or @opts. Note that if @type is neither
+ * "help"/"?" nor a valid user creatable type, no help will be printed
+ * regardless of @opts.
  *
- * Returns: true if @opts contained a help option and help was printed, false
- * if no help option was found.
+ * Returns: true if a help option was found and help was printed, false
+ * otherwise.
  */
 bool user_creatable_print_help(const char *type, QemuOpts *opts);
 
+/**
+ * user_creatable_print_help_from_qdict:
+ * @args: options to create
+ *
+ * Prints help considering the other options given in @args (if "qom-type" is
+ * given and valid, print properties for the type, otherwise print valid types)
+ *
+ * In contrast to user_creatable_print_help(), this function can't return that
+ * no help was requested. It should only be called if we know that help is
+ * requested and it will always print some help.
+ */
+void user_creatable_print_help_from_qdict(QDict *args);
+
 /**
  * user_creatable_del:
  * @id: the unique ID for the object
diff --git a/qom/object_interfaces.c b/qom/object_interfaces.c
index 3fd1da157e..ed896fe764 100644
--- a/qom/object_interfaces.c
+++ b/qom/object_interfaces.c
@@ -279,6 +279,15 @@ bool user_creatable_print_help(const char *type, QemuOpts *opts)
     return false;
 }
 
+void user_creatable_print_help_from_qdict(QDict *args)
+{
+    const char *type = qdict_get_try_str(args, "qom-type");
+
+    if (!type || !user_creatable_print_type_properites(type)) {
+        user_creatable_print_types();
+    }
+}
+
 bool user_creatable_del(const char *id, Error **errp)
 {
     Object *container;
-- 
2.26.2


