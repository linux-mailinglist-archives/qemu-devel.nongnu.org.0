Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 770792CB7DC
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 09:58:11 +0100 (CET)
Received: from localhost ([::1]:36606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkNxi-000390-Gp
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 03:58:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkND0-0003SQ-St
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCO-0003kY-Vo
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3S5eYUz053L8Fm4YpxHeWkW2wUEcEivPHnhalqFN8I4=;
 b=iTWn1HwOqI9pPhEuzdoVlva2BHSPHrBnddS6ntcAGWrspfCz8/06HSgwz16/N51Shcn0tD
 0AGBKCN8puysecjLNmPlgb92fFXine60Ao3YqwgJ+nEqgFDtaHm9QGlCo2TuWrhRGm8ja8
 4gEHXixFwXNRltCC0RcwGsR4UJACCok=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-kLSNb66DMNGmunSCJNptyg-1; Wed, 02 Dec 2020 03:09:13 -0500
X-MC-Unique: kLSNb66DMNGmunSCJNptyg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B029E803652
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:12 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 74B9910013BD
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:12 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 061/113] qemu-option: restrict qemu_opts_set to merge-lists
 QemuOpts
Date: Wed,  2 Dec 2020 03:07:57 -0500
Message-Id: <20201202080849.4125477-62-pbonzini@redhat.com>
In-Reply-To: <20201202080849.4125477-1-pbonzini@redhat.com>
References: <20201202080849.4125477-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu_opts_set is used to create default network backends and to
parse sugar options -kernel, -initrd, -append, -bios and -dtb.
These are very different uses:

I would *expect* a function named qemu_opts_set to set an option in a
merge-lists QemuOptsList, such as -kernel, and possibly to set an option
in a non-merge-lists QemuOptsList with non-NULL id, similar to -set.

However, it wouldn't *work* to use qemu_opts_set for the latter
because qemu_opts_set uses fail_if_exists==1. So, for non-merge-lists
QemuOptsList and non-NULL id, the semantics of qemu_opts_set (fail if the
(QemuOptsList, id) pair already exists) are debatable.

On the other hand, I would not expect qemu_opts_set to create a
non-merge-lists QemuOpts with a single option; which it does, though.
For this case of non-merge-lists QemuOptsList and NULL id, qemu_opts_set
hardly adds value over qemu_opts_parse.  It does skip some parsing and
unescaping, but that's not needed when creating default network
backends.

So qemu_opts_set has warty behavior for non-merge-lists QemuOptsList
if id is non-NULL, and it's mostly pointless if id is NULL.  My
solution to keeping the API as simple as possible is to limit
qemu_opts_set to merge-lists QemuOptsList.  For them, it's useful (we
don't want comma-unescaping for -kernel) *and* has sane semantics.
Network backend creation is switched to qemu_opts_parse.

qemu_opts_set is now only used on merge-lists QemuOptsList... except
in the testcase, which is changed to use a merge-list QemuOptsList.

With this change we can also remove the id parameter.  With the
parameter always NULL, we know that qemu_opts_create cannot fail
and can pass &error_abort to it.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/option.h  |  3 +--
 softmmu/vl.c           | 19 +++++++------------
 tests/test-qemu-opts.c | 20 +++++++++++++++++---
 util/qemu-option.c     |  9 +++------
 4 files changed, 28 insertions(+), 23 deletions(-)

diff --git a/include/qemu/option.h b/include/qemu/option.h
index ac69352e0e..f73e0dc7d9 100644
--- a/include/qemu/option.h
+++ b/include/qemu/option.h
@@ -119,8 +119,7 @@ QemuOpts *qemu_opts_create(QemuOptsList *list, const char *id,
                            int fail_if_exists, Error **errp);
 void qemu_opts_reset(QemuOptsList *list);
 void qemu_opts_loc_restore(QemuOpts *opts);
-bool qemu_opts_set(QemuOptsList *list, const char *id,
-                   const char *name, const char *value, Error **errp);
+bool qemu_opts_set(QemuOptsList *list, const char *name, const char *value, Error **errp);
 const char *qemu_opts_id(QemuOpts *opts);
 void qemu_opts_set_id(QemuOpts *opts, char *id);
 void qemu_opts_del(QemuOpts *opts);
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 85b23d51be..5571f9ff75 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3388,20 +3388,16 @@ void qemu_init(int argc, char **argv, char **envp)
                 }
                 break;
             case QEMU_OPTION_kernel:
-                qemu_opts_set(qemu_find_opts("machine"), NULL, "kernel", optarg,
-                              &error_abort);
+                qemu_opts_set(qemu_find_opts("machine"), "kernel", optarg, &error_abort);
                 break;
             case QEMU_OPTION_initrd:
-                qemu_opts_set(qemu_find_opts("machine"), NULL, "initrd", optarg,
-                              &error_abort);
+                qemu_opts_set(qemu_find_opts("machine"), "initrd", optarg, &error_abort);
                 break;
             case QEMU_OPTION_append:
-                qemu_opts_set(qemu_find_opts("machine"), NULL, "append", optarg,
-                              &error_abort);
+                qemu_opts_set(qemu_find_opts("machine"), "append", optarg, &error_abort);
                 break;
             case QEMU_OPTION_dtb:
-                qemu_opts_set(qemu_find_opts("machine"), NULL, "dtb", optarg,
-                              &error_abort);
+                qemu_opts_set(qemu_find_opts("machine"), "dtb", optarg, &error_abort);
                 break;
             case QEMU_OPTION_cdrom:
                 drive_add(IF_DEFAULT, 2, optarg, CDROM_OPTS);
@@ -3511,8 +3507,7 @@ void qemu_init(int argc, char **argv, char **envp)
                 }
                 break;
             case QEMU_OPTION_bios:
-                qemu_opts_set(qemu_find_opts("machine"), NULL, "firmware", optarg,
-                              &error_abort);
+                qemu_opts_set(qemu_find_opts("machine"), "firmware", optarg, &error_abort);
                 break;
             case QEMU_OPTION_singlestep:
                 singlestep = 1;
@@ -4395,9 +4390,9 @@ void qemu_init(int argc, char **argv, char **envp)
 
     if (default_net) {
         QemuOptsList *net = qemu_find_opts("net");
-        qemu_opts_set(net, NULL, "type", "nic", &error_abort);
+        qemu_opts_parse(net, "nic", true, &error_abort);
 #ifdef CONFIG_SLIRP
-        qemu_opts_set(net, NULL, "type", "user", &error_abort);
+        qemu_opts_parse(net, "user", true, &error_abort);
 #endif
     }
 
diff --git a/tests/test-qemu-opts.c b/tests/test-qemu-opts.c
index 297ffe79dd..2aab831d10 100644
--- a/tests/test-qemu-opts.c
+++ b/tests/test-qemu-opts.c
@@ -84,11 +84,25 @@ static QemuOptsList opts_list_03 = {
     },
 };
 
+static QemuOptsList opts_list_04 = {
+    .name = "opts_list_04",
+    .head = QTAILQ_HEAD_INITIALIZER(opts_list_04.head),
+    .merge_lists = true,
+    .desc = {
+        {
+            .name = "str3",
+            .type = QEMU_OPT_STRING,
+        },
+        { /* end of list */ }
+    },
+};
+
 static void register_opts(void)
 {
     qemu_add_opts(&opts_list_01);
     qemu_add_opts(&opts_list_02);
     qemu_add_opts(&opts_list_03);
+    qemu_add_opts(&opts_list_04);
 }
 
 static void test_find_unknown_opts(void)
@@ -402,17 +416,17 @@ static void test_qemu_opts_set(void)
     QemuOpts *opts;
     const char *opt;
 
-    list = qemu_find_opts("opts_list_01");
+    list = qemu_find_opts("opts_list_04");
     g_assert(list != NULL);
     g_assert(QTAILQ_EMPTY(&list->head));
-    g_assert_cmpstr(list->name, ==, "opts_list_01");
+    g_assert_cmpstr(list->name, ==, "opts_list_04");
 
     /* should not find anything at this point */
     opts = qemu_opts_find(list, NULL);
     g_assert(opts == NULL);
 
     /* implicitly create opts and set str3 value */
-    qemu_opts_set(list, NULL, "str3", "value", &error_abort);
+    qemu_opts_set(list, "str3", "value", &error_abort);
     g_assert(!QTAILQ_EMPTY(&list->head));
 
     /* get the just created opts */
diff --git a/util/qemu-option.c b/util/qemu-option.c
index acefbc23fa..25792159ba 100644
--- a/util/qemu-option.c
+++ b/util/qemu-option.c
@@ -670,15 +670,12 @@ void qemu_opts_loc_restore(QemuOpts *opts)
     loc_restore(&opts->loc);
 }
 
-bool qemu_opts_set(QemuOptsList *list, const char *id,
-                   const char *name, const char *value, Error **errp)
+bool qemu_opts_set(QemuOptsList *list, const char *name, const char *value, Error **errp)
 {
     QemuOpts *opts;
 
-    opts = qemu_opts_create(list, id, 1, errp);
-    if (!opts) {
-        return false;
-    }
+    assert(list->merge_lists);
+    opts = qemu_opts_create(list, NULL, 0, &error_abort);
     return qemu_opt_set(opts, name, value, errp);
 }
 
-- 
2.26.2



