Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D0C2192A4
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jul 2020 23:40:22 +0200 (CEST)
Received: from localhost ([::1]:38922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtHnh-0000ZG-HL
	for lists+qemu-devel@lfdr.de; Wed, 08 Jul 2020 17:40:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jtHc6-0000ZU-W8
 for qemu-devel@nongnu.org; Wed, 08 Jul 2020 17:28:23 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:33298
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jtHc3-0002A0-V8
 for qemu-devel@nongnu.org; Wed, 08 Jul 2020 17:28:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594243699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j6waQIv+9cgJl2a9MXsxDuDPDfNIMK4eanc8qBBuKeI=;
 b=DmuY19GZ7OTYiHqN+ezBnzu3Q8WAdGWSBWJq6qranN8R5Yxu4/X7XLad2tDpR580TgHMSv
 QYwTkU5ZVWuxbzmBRzbVJmMTWdBhQu+kE93GZIFkuJL/z77cLkhNkGahMsWYV2IjoiVYaX
 rTwPu+2m+RYxvoIZAPaDDWnBIFa/YuA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205--rss5cH5NAyoynckNcL9jw-1; Tue, 07 Jul 2020 17:25:21 -0400
X-MC-Unique: -rss5cH5NAyoynckNcL9jw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48DDF18FE861;
 Tue,  7 Jul 2020 21:25:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ADEE9797E1;
 Tue,  7 Jul 2020 21:25:19 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C366010C4AEB; Tue,  7 Jul 2020 23:25:04 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 46/53] error: New macro ERRP_GUARD()
Date: Tue,  7 Jul 2020 23:24:56 +0200
Message-Id: <20200707212503.1495927-47-armbru@redhat.com>
In-Reply-To: <20200707212503.1495927-1-armbru@redhat.com>
References: <20200707212503.1495927-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 17:25:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Greg Kurz <groug@kaod.org>, Paul Durrant <paul@xen.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Introduce a new ERRP_GUARD() macro, to be used at start of functions
with an errp OUT parameter.

It has three goals:

1. Fix issue with error_fatal and error_prepend/error_append_hint: the
user can't see this additional information, because exit() happens in
error_setg earlier than information is added. [Reported by Greg Kurz]

2. Fix issue with error_abort and error_propagate: when we wrap
error_abort by local_err+error_propagate, the resulting coredump will
refer to error_propagate and not to the place where error happened.
(the macro itself doesn't fix the issue, but it allows us to [3.] drop
the local_err+error_propagate pattern, which will definitely fix the
issue) [Reported by Kevin Wolf]

3. Drop local_err+error_propagate pattern, which is used to workaround
void functions with errp parameter, when caller wants to know resulting
status. (Note: actually these functions could be merely updated to
return int error code).

To achieve these goals, later patches will add invocations
of this macro at the start of functions with either use
error_prepend/error_append_hint (solving 1) or which use
local_err+error_propagate to check errors, switching those
functions to use *errp instead (solving 2 and 3).

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Paul Durrant <paul@xen.org>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Eric Blake <eblake@redhat.com>
[Merge comments properly with recent commit "error: Document Error API
usage rules", and edit for clarity.  Put ERRP_AUTO_PROPAGATE() before
its helpers, and touch up style.  Tweak commit message.]
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20200707165037.1026246-2-armbru@redhat.com>
[Rename ERRP_AUTO_PROPAGATE() to ERRP_GUARD(), tweak commit message
again]
---
 include/qapi/error.h | 158 +++++++++++++++++++++++++++++++++++++------
 1 file changed, 139 insertions(+), 19 deletions(-)

diff --git a/include/qapi/error.h b/include/qapi/error.h
index 2c189abb04..85df875a3a 100644
--- a/include/qapi/error.h
+++ b/include/qapi/error.h
@@ -30,6 +30,10 @@
  *   job.  Since the value of @errp is about handling the error, the
  *   function should not examine it.
  *
+ * - The function may pass @errp to functions it calls to pass on
+ *   their errors to its caller.  If it dereferences @errp to check
+ *   for errors, it must use ERRP_GUARD().
+ *
  * - On success, the function should not touch *errp.  On failure, it
  *   should set a new error, e.g. with error_setg(errp, ...), or
  *   propagate an existing one, e.g. with error_propagate(errp, ...).
@@ -45,15 +49,17 @@
  * = Creating errors =
  *
  * Create an error:
- *     error_setg(&err, "situation normal, all fouled up");
+ *     error_setg(errp, "situation normal, all fouled up");
+ * where @errp points to the location to receive the error.
  *
  * Create an error and add additional explanation:
- *     error_setg(&err, "invalid quark");
- *     error_append_hint(&err, "Valid quarks are up, down, strange, "
+ *     error_setg(errp, "invalid quark");
+ *     error_append_hint(errp, "Valid quarks are up, down, strange, "
  *                       "charm, top, bottom.\n");
+ * This may require use of ERRP_GUARD(); more on that below.
  *
  * Do *not* contract this to
- *     error_setg(&err, "invalid quark\n" // WRONG!
+ *     error_setg(errp, "invalid quark\n" // WRONG!
  *                "Valid quarks are up, down, strange, charm, top, bottom.");
  *
  * = Reporting and destroying errors =
@@ -107,18 +113,6 @@
  * Errors get passed to the caller through the conventional @errp
  * parameter.
  *
- * Pass an existing error to the caller:
- *     error_propagate(errp, err);
- * where Error **errp is a parameter, by convention the last one.
- *
- * Pass an existing error to the caller with the message modified:
- *     error_propagate_prepend(errp, err,
- *                             "Could not frobnicate '%s': ", name);
- * This is more concise than
- *     error_propagate(errp, err); // don't do this
- *     error_prepend(errp, "Could not frobnicate '%s': ", name);
- * and works even when @errp is &error_fatal.
- *
  * Create a new error and pass it to the caller:
  *     error_setg(errp, "situation normal, all fouled up");
  *
@@ -129,18 +123,26 @@
  *         handle the error...
  *     }
  * - when it does not, say because it is a void function:
+ *     ERRP_GUARD();
+ *     foo(arg, errp);
+ *     if (*errp) {
+ *         handle the error...
+ *     }
+ * More on ERRP_GUARD() below.
+ *
+ * Code predating ERRP_GUARD() still exists, and looks like this:
  *     Error *err = NULL;
  *     foo(arg, &err);
  *     if (err) {
  *         handle the error...
- *         error_propagate(errp, err);
+ *         error_propagate(errp, err); // deprecated
  *     }
- * Do *not* "optimize" this to
+ * Avoid in new code.  Do *not* "optimize" it to
  *     foo(arg, errp);
  *     if (*errp) { // WRONG!
  *         handle the error...
  *     }
- * because errp may be NULL!
+ * because errp may be NULL without the ERRP_GUARD() guard.
  *
  * But when all you do with the error is pass it on, please use
  *     foo(arg, errp);
@@ -160,6 +162,19 @@
  *         handle the error...
  *     }
  *
+ * Pass an existing error to the caller:
+ *     error_propagate(errp, err);
+ * This is rarely needed.  When @err is a local variable, use of
+ * ERRP_GUARD() commonly results in more readable code.
+ *
+ * Pass an existing error to the caller with the message modified:
+ *     error_propagate_prepend(errp, err,
+ *                             "Could not frobnicate '%s': ", name);
+ * This is more concise than
+ *     error_propagate(errp, err); // don't do this
+ *     error_prepend(errp, "Could not frobnicate '%s': ", name);
+ * and works even when @errp is &error_fatal.
+ *
  * Receive and accumulate multiple errors (first one wins):
  *     Error *err = NULL, *local_err = NULL;
  *     foo(arg, &err);
@@ -187,6 +202,69 @@
  *         error_setg(&err, ...); // WRONG!
  *     }
  * because this may pass a non-null err to error_setg().
+ *
+ * = Why, when and how to use ERRP_GUARD() =
+ *
+ * Without ERRP_GUARD(), use of the @errp parameter is restricted:
+ * - It must not be dereferenced, because it may be null.
+ * - It should not be passed to error_prepend() or
+ *   error_append_hint(), because that doesn't work with &error_fatal.
+ * ERRP_GUARD() lifts these restrictions.
+ *
+ * To use ERRP_GUARD(), add it right at the beginning of the function.
+ * @errp can then be used without worrying about the argument being
+ * NULL or &error_fatal.
+ *
+ * Using it when it's not needed is safe, but please avoid cluttering
+ * the source with useless code.
+ *
+ * = Converting to ERRP_GUARD() =
+ *
+ * To convert a function to use ERRP_GUARD():
+ *
+ * 0. If the Error ** parameter is not named @errp, rename it to
+ *    @errp.
+ *
+ * 1. Add an ERRP_GUARD() invocation, by convention right at the
+ *    beginning of the function.  This makes @errp safe to use.
+ *
+ * 2. Replace &err by errp, and err by *errp.  Delete local variable
+ *    @err.
+ *
+ * 3. Delete error_propagate(errp, *errp), replace
+ *    error_propagate_prepend(errp, *errp, ...) by error_prepend(errp, ...)
+ *
+ * 4. Ensure @errp is valid at return: when you destroy *errp, set
+ *    errp = NULL.
+ *
+ * Example:
+ *
+ *     bool fn(..., Error **errp)
+ *     {
+ *         Error *err = NULL;
+ *
+ *         foo(arg, &err);
+ *         if (err) {
+ *             handle the error...
+ *             error_propagate(errp, err);
+ *             return false;
+ *         }
+ *         ...
+ *     }
+ *
+ * becomes
+ *
+ *     bool fn(..., Error **errp)
+ *     {
+ *         ERRP_GUARD();
+ *
+ *         foo(arg, errp);
+ *         if (*errp) {
+ *             handle the error...
+ *             return false;
+ *         }
+ *         ...
+ *     }
  */
 
 #ifndef ERROR_H
@@ -287,6 +365,7 @@ void error_setg_win32_internal(Error **errp,
  * the error object.
  * Else, move the error object from @local_err to *@dst_errp.
  * On return, @local_err is invalid.
+ * Please use ERRP_GUARD() instead when possible.
  * Please don't error_propagate(&error_fatal, ...), use
  * error_report_err() and exit(), because that's more obvious.
  */
@@ -298,6 +377,7 @@ void error_propagate(Error **dst_errp, Error *local_err);
  * Behaves like
  *     error_prepend(&local_err, fmt, ...);
  *     error_propagate(dst_errp, local_err);
+ * Please use ERRP_GUARD() and error_prepend() instead when possible.
  */
 void error_propagate_prepend(Error **dst_errp, Error *local_err,
                              const char *fmt, ...);
@@ -395,6 +475,46 @@ void error_set_internal(Error **errp,
                         ErrorClass err_class, const char *fmt, ...)
     GCC_FMT_ATTR(6, 7);
 
+/*
+ * Make @errp parameter easier to use regardless of argument value
+ *
+ * This macro is for use right at the beginning of a function that
+ * takes an Error **errp parameter to pass errors to its caller.  The
+ * parameter must be named @errp.
+ *
+ * It must be used when the function dereferences @errp or passes
+ * @errp to error_prepend(), error_vprepend(), or error_append_hint().
+ * It is safe to use even when it's not needed, but please avoid
+ * cluttering the source with useless code.
+ *
+ * If @errp is NULL or &error_fatal, rewrite it to point to a local
+ * Error variable, which will be automatically propagated to the
+ * original @errp on function exit.
+ *
+ * Note: &error_abort is not rewritten, because that would move the
+ * abort from the place where the error is created to the place where
+ * it's propagated.
+ */
+#define ERRP_GUARD()                                            \
+    g_auto(ErrorPropagator) _auto_errp_prop = {.errp = errp};   \
+    do {                                                        \
+        if (!errp || errp == &error_fatal) {                    \
+            errp = &_auto_errp_prop.local_err;                  \
+        }                                                       \
+    } while (0)
+
+typedef struct ErrorPropagator {
+    Error *local_err;
+    Error **errp;
+} ErrorPropagator;
+
+static inline void error_propagator_cleanup(ErrorPropagator *prop)
+{
+    error_propagate(prop->errp, prop->local_err);
+}
+
+G_DEFINE_AUTO_CLEANUP_CLEAR_FUNC(ErrorPropagator, error_propagator_cleanup);
+
 /*
  * Special error destination to abort on error.
  * See error_setg() and error_propagate() for details.
-- 
2.26.2


