Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CED07301617
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 15:55:02 +0100 (CET)
Received: from localhost ([::1]:37932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3KJZ-0008NP-Qv
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 09:55:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3JxS-00043Q-1B
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 09:32:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3JxO-0005wO-CI
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 09:32:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611412325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tE6mNBUrLnFek+GesOz3T9vICrJR3c0/jVNEum8AOtI=;
 b=GiiVOBTX9ZgS6Z6/TRfpoD/m0gxp5ZJoZbqel7JxMSxcVBHNLxuHxj2jv+WsooVEeeyN12
 gccGeiqj/48X5i8AQd288cEF73r74SAxQQV8eIL4SJcXn465aVzFDbHHDh43NyqPlZL+Sc
 Wv94+r2uNChyFTKPw3cYvB3tJry0AT4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-uB4DkzjQMXWenqnZat0krQ-1; Sat, 23 Jan 2021 09:32:02 -0500
X-MC-Unique: uB4DkzjQMXWenqnZat0krQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B5A9E74F
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 14:32:01 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 579805D9CC;
 Sat, 23 Jan 2021 14:32:01 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 29/31] qemu-option: clean up id vs. list->merge_lists
Date: Sat, 23 Jan 2021 09:31:26 -0500
Message-Id: <20210123143128.1167797-30-pbonzini@redhat.com>
In-Reply-To: <20210123143128.1167797-1-pbonzini@redhat.com>
References: <20210123143128.1167797-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.165,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Looking at all merge-lists QemuOptsList, here is how they access their
QemuOpts:

reopen_opts in qemu-io-cmds.c ("qemu-img reopen -o")
	qemu_opts_find(&reopen_opts, NULL)

empty_opts in qemu-io.c ("qemu-io open -o")
	qemu_opts_find(&empty_opts, NULL)

qemu_rtc_opts ("-rtc")
	qemu_find_opts_singleton("rtc")

qemu_machine_opts ("-M")
	qemu_find_opts_singleton("machine")

qemu_action_opts ("-name")
	qemu_opts_foreach->process_runstate_actions

qemu_boot_opts ("-boot")
	in hw/nvram/fw_cfg.c and hw/s390x/ipl.c:
	  QTAILQ_FIRST(&qemu_find_opts("bootopts")->head)
	in softmmu/vl.c:
	  qemu_opts_find(qemu_find_opts("boot-opts"), NULL)

qemu_name_opts ("-name")
	qemu_opts_foreach->parse_name
	parse_name does not use id

qemu_mem_opts ("-m")
	qemu_find_opts_singleton("memory")

qemu_icount_opts ("-icount")
	qemu_opts_foreach->do_configure_icount
	do_configure_icount->icount_configure
	icount_configure does not use id

qemu_smp_opts ("-smp")
	qemu_opts_find(qemu_find_opts("smp-opts"), NULL)

qemu_spice_opts ("-spice")
	QTAILQ_FIRST(&qemu_spice_opts.head)

i.e. they don't need an id.  Sometimes its presence is ignored
(e.g. when using qemu_opts_foreach), sometimes all the options
with the id are skipped, sometimes only the first option on the
command line is considered.  -boot does two different things
depending on who's looking at the options.

With this patch we just forbid id on merge-lists QemuOptsLists; if the
command line still works, it has the same semantics as before.

qemu_opts_create's fail_if_exists parameter is now unnecessary:

- it is unused if id is NULL

- opts_parse only passes false if reached from qemu_opts_set_defaults,
in which case this patch enforces that id must be NULL

- other callers that can pass a non-NULL id always set it to true

Assert that it is true in the only case where "fail_if_exists" matters,
i.e. "id && !lists->merge_lists".  This means that if an id is present,
duplicates are always forbidden, which was already the status quo.

Discounting the case that aborts as it's not user-controlled (it's
"just" a matter of inspecting qemu_opts_create callers), the paths
through qemu_opts_create can be summarized as:

- merge_lists = true: singleton opts with NULL id; non-NULL id fails

- merge_lists = false: always return new opts; non-NULL id fails if dup

Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/qemu-option.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/util/qemu-option.c b/util/qemu-option.c
index c88e159f18..91f4120ce1 100644
--- a/util/qemu-option.c
+++ b/util/qemu-option.c
@@ -619,7 +619,17 @@ QemuOpts *qemu_opts_create(QemuOptsList *list, const char *id,
 {
     QemuOpts *opts = NULL;
 
-    if (id) {
+    if (list->merge_lists) {
+        if (id) {
+            error_setg(errp, QERR_INVALID_PARAMETER, "id");
+            return NULL;
+        }
+        opts = qemu_opts_find(list, NULL);
+        if (opts) {
+            return opts;
+        }
+    } else if (id) {
+        assert(fail_if_exists);
         if (!id_wellformed(id)) {
             error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "id",
                        "an identifier");
@@ -629,17 +639,8 @@ QemuOpts *qemu_opts_create(QemuOptsList *list, const char *id,
         }
         opts = qemu_opts_find(list, id);
         if (opts != NULL) {
-            if (fail_if_exists && !list->merge_lists) {
-                error_setg(errp, "Duplicate ID '%s' for %s", id, list->name);
-                return NULL;
-            } else {
-                return opts;
-            }
-        }
-    } else if (list->merge_lists) {
-        opts = qemu_opts_find(list, NULL);
-        if (opts) {
-            return opts;
+            error_setg(errp, "Duplicate ID '%s' for %s", id, list->name);
+            return NULL;
         }
     }
     opts = g_malloc0(sizeof(*opts));
@@ -893,7 +894,7 @@ static QemuOpts *opts_parse(QemuOptsList *list, const char *params,
      * (if unlikely) future misuse:
      */
     assert(!defaults || list->merge_lists);
-    opts = qemu_opts_create(list, id, !defaults, errp);
+    opts = qemu_opts_create(list, id, !list->merge_lists, errp);
     g_free(id);
     if (opts == NULL) {
         return NULL;
-- 
2.26.2



