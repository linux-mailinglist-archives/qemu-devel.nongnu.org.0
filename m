Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 657C72192A6
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jul 2020 23:40:59 +0200 (CEST)
Received: from localhost ([::1]:41196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtHoI-0001UI-A4
	for lists+qemu-devel@lfdr.de; Wed, 08 Jul 2020 17:40:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jtHc8-0000bs-Pr
 for qemu-devel@nongnu.org; Wed, 08 Jul 2020 17:28:25 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:49584
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jtHc3-0002A2-UU
 for qemu-devel@nongnu.org; Wed, 08 Jul 2020 17:28:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594243699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MFGoPcdvsStgDsqkS97Y7W9HBtaXcAzL/f3ixYg+4ZA=;
 b=Z9eGO++XYboLyU1bwcyBaMgvInFTmXCsuFeI4cE6JeyG53z/BummLj3HUSmiyt0HuQ34K/
 RF7x4MoF6kQJM6JtbV5IVKrnDR1pG7Lf8yWnVA/U97C3mTX0FnzOCRd1r/j6Y6AHAzL40n
 xZdvx5zYrQ8IeIonayYHRMXr/f5+Ocs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-WYvBiU7ePlmKoOWdiTTATw-1; Tue, 07 Jul 2020 17:25:24 -0400
X-MC-Unique: WYvBiU7ePlmKoOWdiTTATw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73624107ACF3;
 Tue,  7 Jul 2020 21:25:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EACBB1A7D8;
 Tue,  7 Jul 2020 21:25:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C736510C4AEC; Tue,  7 Jul 2020 23:25:04 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 47/53] scripts: Coccinelle script to use ERRP_GUARD()
Date: Tue,  7 Jul 2020 23:24:57 +0200
Message-Id: <20200707212503.1495927-48-armbru@redhat.com>
In-Reply-To: <20200707212503.1495927-1-armbru@redhat.com>
References: <20200707212503.1495927-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Script adds ERRP_GUARD() macro invocations where appropriate and
does corresponding changes in code (look for details in
include/qapi/error.h)

Usage example:
spatch --sp-file scripts/coccinelle/errp-guard.cocci \
 --macro-file scripts/cocci-macro-file.h --in-place --no-show-diff \
 --max-width 80 FILES...

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20200707165037.1026246-3-armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
[ERRP_AUTO_PROPAGATE() renamed to ERRP_GUARD(), and
auto-propagated-errp.cocci to errp-guard.cocci]
---
 scripts/coccinelle/errp-guard.cocci | 336 ++++++++++++++++++++++++++++
 include/qapi/error.h                |   2 +
 MAINTAINERS                         |   1 +
 3 files changed, 339 insertions(+)
 create mode 100644 scripts/coccinelle/errp-guard.cocci

diff --git a/scripts/coccinelle/errp-guard.cocci b/scripts/coccinelle/errp-guard.cocci
new file mode 100644
index 0000000000..6e789acf2d
--- /dev/null
+++ b/scripts/coccinelle/errp-guard.cocci
@@ -0,0 +1,336 @@
+// Use ERRP_GUARD() (see include/qapi/error.h)
+//
+// Copyright (c) 2020 Virtuozzo International GmbH.
+//
+// This program is free software; you can redistribute it and/or
+// modify it under the terms of the GNU General Public License as
+// published by the Free Software Foundation; either version 2 of the
+// License, or (at your option) any later version.
+//
+// This program is distributed in the hope that it will be useful,
+// but WITHOUT ANY WARRANTY; without even the implied warranty of
+// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+// GNU General Public License for more details.
+//
+// You should have received a copy of the GNU General Public License
+// along with this program.  If not, see
+// <http://www.gnu.org/licenses/>.
+//
+// Usage example:
+// spatch --sp-file scripts/coccinelle/errp-guard.cocci \
+//  --macro-file scripts/cocci-macro-file.h --in-place \
+//  --no-show-diff --max-width 80 FILES...
+//
+// Note: --max-width 80 is needed because coccinelle default is less
+// than 80, and without this parameter coccinelle may reindent some
+// lines which fit into 80 characters but not to coccinelle default,
+// which in turn produces extra patch hunks for no reason.
+
+// Switch unusual Error ** parameter names to errp
+// (this is necessary to use ERRP_GUARD).
+//
+// Disable optional_qualifier to skip functions with
+// "Error *const *errp" parameter.
+//
+// Skip functions with "assert(_errp && *_errp)" statement, because
+// that signals unusual semantics, and the parameter name may well
+// serve a purpose. (like nbd_iter_channel_error()).
+//
+// Skip util/error.c to not touch, for example, error_propagate() and
+// error_propagate_prepend().
+@ depends on !(file in "util/error.c") disable optional_qualifier@
+identifier fn;
+identifier _errp != errp;
+@@
+
+ fn(...,
+-   Error **_errp
++   Error **errp
+    ,...)
+ {
+(
+     ... when != assert(_errp && *_errp)
+&
+     <...
+-    _errp
++    errp
+     ...>
+)
+ }
+
+// Add invocation of ERRP_GUARD() to errp-functions where // necessary
+//
+// Note, that without "when any" the final "..." does not mach
+// something matched by previous pattern, i.e. the rule will not match
+// double error_prepend in control flow like in
+// vfio_set_irq_signaling().
+//
+// Note, "exists" says that we want apply rule even if it does not
+// match on all possible control flows (otherwise, it will not match
+// standard pattern when error_propagate() call is in if branch).
+@ disable optional_qualifier exists@
+identifier fn, local_err;
+symbol errp;
+@@
+
+ fn(..., Error **errp, ...)
+ {
++   ERRP_GUARD();
+    ...  when != ERRP_GUARD();
+(
+(
+    error_append_hint(errp, ...);
+|
+    error_prepend(errp, ...);
+|
+    error_vprepend(errp, ...);
+)
+    ... when any
+|
+    Error *local_err = NULL;
+    ...
+(
+    error_propagate_prepend(errp, local_err, ...);
+|
+    error_propagate(errp, local_err);
+)
+    ...
+)
+ }
+
+// Warn when several Error * definitions are in the control flow.
+// This rule is not chained to rule1 and less restrictive, to cover more
+// functions to warn (even those we are not going to convert).
+//
+// Note, that even with one (or zero) Error * definition in the each
+// control flow we may have several (in total) Error * definitions in
+// the function. This case deserves attention too, but I don't see
+// simple way to match with help of coccinelle.
+@check1 disable optional_qualifier exists@
+identifier fn, _errp, local_err, local_err2;
+position p1, p2;
+@@
+
+ fn(..., Error **_errp, ...)
+ {
+     ...
+     Error *local_err = NULL;@p1
+     ... when any
+     Error *local_err2 = NULL;@p2
+     ... when any
+ }
+
+@ script:python @
+fn << check1.fn;
+p1 << check1.p1;
+p2 << check1.p2;
+@@
+
+print('Warning: function {} has several definitions of '
+      'Error * local variable: at {}:{} and then at {}:{}'.format(
+          fn, p1[0].file, p1[0].line, p2[0].file, p2[0].line))
+
+// Warn when several propagations are in the control flow.
+@check2 disable optional_qualifier exists@
+identifier fn, _errp;
+position p1, p2;
+@@
+
+ fn(..., Error **_errp, ...)
+ {
+     ...
+(
+     error_propagate_prepend(_errp, ...);@p1
+|
+     error_propagate(_errp, ...);@p1
+)
+     ...
+(
+     error_propagate_prepend(_errp, ...);@p2
+|
+     error_propagate(_errp, ...);@p2
+)
+     ... when any
+ }
+
+@ script:python @
+fn << check2.fn;
+p1 << check2.p1;
+p2 << check2.p2;
+@@
+
+print('Warning: function {} propagates to errp several times in '
+      'one control flow: at {}:{} and then at {}:{}'.format(
+          fn, p1[0].file, p1[0].line, p2[0].file, p2[0].line))
+
+// Match functions with propagation of local error to errp.
+// We want to refer these functions in several following rules, but I
+// don't know a proper way to inherit a function, not just its name
+// (to not match another functions with same name in following rules).
+// Not-proper way is as follows: rename errp parameter in functions
+// header and match it in following rules. Rename it back after all
+// transformations.
+//
+// The common case is a single definition of local_err with at most one
+// error_propagate_prepend() or error_propagate() on each control-flow
+// path. Functions with multiple definitions or propagates we want to
+// examine manually. Rules check1 and check2 emit warnings to guide us
+// to them.
+//
+// Note that we match not only this "common case", but any function,
+// which has the "common case" on at least one control-flow path.
+@rule1 disable optional_qualifier exists@
+identifier fn, local_err;
+symbol errp;
+@@
+
+ fn(..., Error **
+-    errp
++    ____
+    , ...)
+ {
+     ...
+     Error *local_err = NULL;
+     ...
+(
+     error_propagate_prepend(errp, local_err, ...);
+|
+     error_propagate(errp, local_err);
+)
+     ...
+ }
+
+// Convert special case with goto separately.
+// I tried merging this into the following rule the obvious way, but
+// it made Coccinelle hang on block.c
+//
+// Note interesting thing: if we don't do it here, and try to fixup
+// "out: }" things later after all transformations (the rule will be
+// the same, just without error_propagate() call), coccinelle fails to
+// match this "out: }".
+@ disable optional_qualifier@
+identifier rule1.fn, rule1.local_err, out;
+symbol errp;
+@@
+
+ fn(..., Error ** ____, ...)
+ {
+     <...
+-    goto out;
++    return;
+     ...>
+- out:
+-    error_propagate(errp, local_err);
+ }
+
+// Convert most of local_err related stuff.
+//
+// Note, that we inherit rule1.fn and rule1.local_err names, not
+// objects themselves. We may match something not related to the
+// pattern matched by rule1. For example, local_err may be defined with
+// the same name in different blocks inside one function, and in one
+// block follow the propagation pattern and in other block doesn't.
+//
+// Note also that errp-cleaning functions
+//   error_free_errp
+//   error_report_errp
+//   error_reportf_errp
+//   warn_report_errp
+//   warn_reportf_errp
+// are not yet implemented. They must call corresponding Error* -
+// freeing function and then set *errp to NULL, to avoid further
+// propagation to original errp (consider ERRP_GUARD in use).
+// For example, error_free_errp may look like this:
+//
+//    void error_free_errp(Error **errp)
+//    {
+//        error_free(*errp);
+//        *errp = NULL;
+//    }
+@ disable optional_qualifier exists@
+identifier rule1.fn, rule1.local_err;
+expression list args;
+symbol errp;
+@@
+
+ fn(..., Error ** ____, ...)
+ {
+     <...
+(
+-    Error *local_err = NULL;
+|
+
+// Convert error clearing functions
+(
+-    error_free(local_err);
++    error_free_errp(errp);
+|
+-    error_report_err(local_err);
++    error_report_errp(errp);
+|
+-    error_reportf_err(local_err, args);
++    error_reportf_errp(errp, args);
+|
+-    warn_report_err(local_err);
++    warn_report_errp(errp);
+|
+-    warn_reportf_err(local_err, args);
++    warn_reportf_errp(errp, args);
+)
+?-    local_err = NULL;
+
+|
+-    error_propagate_prepend(errp, local_err, args);
++    error_prepend(errp, args);
+|
+-    error_propagate(errp, local_err);
+|
+-    &local_err
++    errp
+)
+     ...>
+ }
+
+// Convert remaining local_err usage. For example, different kinds of
+// error checking in if conditionals. We can't merge this into
+// previous hunk, as this conflicts with other substitutions in it (at
+// least with "- local_err = NULL").
+@ disable optional_qualifier@
+identifier rule1.fn, rule1.local_err;
+symbol errp;
+@@
+
+ fn(..., Error ** ____, ...)
+ {
+     <...
+-    local_err
++    *errp
+     ...>
+ }
+
+// Always use the same pattern for checking error
+@ disable optional_qualifier@
+identifier rule1.fn;
+symbol errp;
+@@
+
+ fn(..., Error ** ____, ...)
+ {
+     <...
+-    *errp != NULL
++    *errp
+     ...>
+ }
+
+// Revert temporary ___ identifier.
+@ disable optional_qualifier@
+identifier rule1.fn;
+@@
+
+ fn(..., Error **
+-   ____
++   errp
+    , ...)
+ {
+     ...
+ }
diff --git a/include/qapi/error.h b/include/qapi/error.h
index 85df875a3a..7932594dce 100644
--- a/include/qapi/error.h
+++ b/include/qapi/error.h
@@ -265,6 +265,8 @@
  *         }
  *         ...
  *     }
+ *
+ * For mass-conversion, use scripts/coccinelle/errp-guard.cocci.
  */
 
 #ifndef ERROR_H
diff --git a/MAINTAINERS b/MAINTAINERS
index 42388f1de2..7953329d23 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2176,6 +2176,7 @@ F: scripts/coccinelle/error-use-after-free.cocci
 F: scripts/coccinelle/error_propagate_null.cocci
 F: scripts/coccinelle/remove_local_err.cocci
 F: scripts/coccinelle/use-error_fatal.cocci
+F: scripts/coccinelle/errp-guard.cocci
 
 GDB stub
 M: Alex Bennée <alex.bennee@linaro.org>
-- 
2.26.2


