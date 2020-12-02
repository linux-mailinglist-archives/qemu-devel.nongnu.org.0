Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 283DC2CB9AD
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 10:50:22 +0100 (CET)
Received: from localhost ([::1]:39264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkOmD-0006rI-5Q
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 04:50:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkO3Y-0003M8-TI
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:04:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkO3V-0004aw-J7
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:04:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606899848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mJx4oSZ2lIqrX9yMtd+/IFkSWw+c8ZJke8PmhTZiQls=;
 b=Bjgqh+xVYSpHW4fn8+I4ELd6QEZCwXyPBWYcpQDKojAyV4AKNRZK8f29MWedwez93MaYvl
 7nJaGAPY9PSGwICA7LLFVugbGu83yRUpa64dZU9F006J7GPbDdCNat6T72hLqp6BpmMqXT
 UShAwvWYyprjvqa+jSmnyTUGYdHx0xY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-73-Bl1ZbnNkMOyY6cdRSZ9e4w-1; Wed, 02 Dec 2020 04:04:06 -0500
X-MC-Unique: Bl1ZbnNkMOyY6cdRSZ9e4w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C477E10B4D50;
 Wed,  2 Dec 2020 09:03:38 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 446325B6A2;
 Wed,  2 Dec 2020 09:03:38 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/28] qemu-option: clean up id vs. list->merge_lists
Date: Wed,  2 Dec 2020 04:02:40 -0500
Message-Id: <20201202090305.4129317-4-pbonzini@redhat.com>
In-Reply-To: <20201202090305.4129317-1-pbonzini@redhat.com>
References: <20201202090305.4129317-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: kwolf@redhat.com, imammedo@redhat.com, armbru@redhat.com,
 qemu-block@nongnu.org
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

qemu_boot_opts ("-boot")
	QTAILQ_FIRST(&qemu_find_opts("bootopts")->head)

qemu_name_opts ("-name")
	qemu_opts_foreach->parse_name
	parse_name does not use id

qemu_mem_opts ("-m")
	qemu_find_opts_singleton("memory")

qemu_icount_opts ("-icount")
	qemu_opts_foreach->do_configuree_icount
	do_configure_icount->icount_configure
	icount_configure does not use id

qemu_smp_opts ("-smp")
	qemu_opts_find(qemu_find_opts("smp-opts"), NULL)

qemu_spice_opts ("-spice")
	QTAILQ_FIRST(&qemu_spice_opts.head)

i.e. they don't need an id.  Sometimes its presence is ignored
(e.g. when using qemu_opts_foreach), sometimes all the options
with the id are skipped, sometimes only the first option on the
command line is considered.  With this patch we just forbid id
on merge-lists QemuOptsLists; if the command line still works,
it has the same semantics as before.

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



