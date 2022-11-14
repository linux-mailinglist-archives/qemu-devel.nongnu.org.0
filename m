Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 694CD628DF8
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 01:08:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouidt-0001t2-Sl; Mon, 14 Nov 2022 18:13:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouidn-0001eb-DU
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:13:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouiJJ-000361-2K
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 17:52:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668466332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=seDiZqQnIf3SgjsUnP5k3NnNxv90qCNsxvo5UmDgIhI=;
 b=EycBA16d0Ew6929JuhLg4EPZo0+AiYemPmj8tuXfN0i+2ADj8HEYF2MVRLgeaupouzIUbV
 I2s4rgh5K5aHgyVhNrm2NQGpoJZSrtkHymbTkEjMa8QBlQOgP7rbcS93HgA/LN27ceAN0E
 5ujX3rLraZThcqFVuZCoFbOF2GWKQ9Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-25-HbXOJNWKNHa6t5LeGSZ_Mg-1; Mon, 14 Nov 2022 17:52:08 -0500
X-MC-Unique: HbXOJNWKNHa6t5LeGSZ_Mg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B5E5387B2A0;
 Mon, 14 Nov 2022 22:52:07 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5037C40E9787;
 Mon, 14 Nov 2022 22:52:07 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Cc: qemu-devel@nongnu.org,
	qemu-block@nongnu.org,
	nbd@other.debian.org
Subject: [libnbd PATCH v2 10/23] api: Add [aio_]nbd_block_status_64
Date: Mon, 14 Nov 2022 16:51:45 -0600
Message-Id: <20221114225158.2186742-11-eblake@redhat.com>
In-Reply-To: <20221114225158.2186742-1-eblake@redhat.com>
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
 <20221114225158.2186742-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Overcome the inherent 32-bit limitation of our existing
nbd_block_status command by adding a 64-bit variant.  The command sent
to the server does not change, but the user's callback is now handed
64-bit information regardless of whether the server replies with 32-
or 64-bit extents.

Unit tests prove that the new API works in each of C, Python, OCaml,
and Go bindings.  We can also get rid of the temporary hack added to
appease the compiler in an earlier patch.
---
 docs/libnbd.pod                           |  18 +--
 sh/nbdsh.pod                              |   2 +-
 generator/API.ml                          | 144 +++++++++++++++++++---
 generator/OCaml.ml                        |   1 -
 generator/Python.ml                       |   1 -
 lib/rw.c                                  |  48 ++++++--
 python/t/465-block-status-64.py           |  56 +++++++++
 ocaml/tests/Makefile.am                   |   1 +
 ocaml/tests/test_465_block_status_64.ml   |  58 +++++++++
 tests/meta-base-allocation.c              | 111 +++++++++++++++--
 fuzzing/libnbd-fuzz-wrapper.c             |  22 +++-
 golang/Makefile.am                        |   1 +
 golang/libnbd_465_block_status_64_test.go | 119 ++++++++++++++++++
 13 files changed, 534 insertions(+), 48 deletions(-)
 create mode 100644 python/t/465-block-status-64.py
 create mode 100644 ocaml/tests/test_465_block_status_64.ml
 create mode 100644 golang/libnbd_465_block_status_64_test.go

diff --git a/docs/libnbd.pod b/docs/libnbd.pod
index 170fc1fa..b57cfa46 100644
--- a/docs/libnbd.pod
+++ b/docs/libnbd.pod
@@ -661,14 +661,14 @@ In order to utilize block status, the client must call
 L<nbd_add_meta_context(3)> prior to connecting, for each meta context
 in which it is interested, then check L<nbd_can_meta_context(3)> after
 connection to see which contexts the server actually supports.  If a
-context is supported, the client can then use L<nbd_block_status(3)>
-with a callback function that will receive an array of 32-bit integer
-pairs describing consecutive extents within a context.  In each pair,
-the first integer is the length of the extent, the second is a bitmask
-description of that extent (for the "base:allocation" context, the
-bitmask may include C<LIBNBD_STATE_HOLE> for unallocated portions of
-the file, and/or C<LIBNBD_STATE_ZERO> for portions of the file known
-to read as zero).
+context is supported, the client can then use
+L<nbd_block_status_64(3)> with a callback function that will receive
+an array of structs describing consecutive extents within a context.
+Each struct gives the length of the extent, then a bitmask description
+of that extent (for the "base:allocation" context, the bitmask may
+include C<LIBNBD_STATE_HOLE> for unallocated portions of the file,
+and/or C<LIBNBD_STATE_ZERO> for portions of the file known to read as
+zero).

 There is a full example of requesting meta context and using block
 status available at
@@ -917,7 +917,7 @@ will tie up resources until L<nbd_close(3)> is eventually reached).
 =head2 Callbacks with C<int *error> parameter

 Some of the high-level commands (L<nbd_pread_structured(3)>,
-L<nbd_block_status(3)>) involve the use of a callback function invoked
+L<nbd_block_status_64(3)>) involve the use of a callback function invoked
 by the state machine at appropriate points in the server's reply
 before the overall command is complete.  These callback functions,
 along with all of the completion callbacks, include a parameter
diff --git a/sh/nbdsh.pod b/sh/nbdsh.pod
index 4d14118c..666a31b6 100644
--- a/sh/nbdsh.pod
+++ b/sh/nbdsh.pod
@@ -59,7 +59,7 @@ Display brief command line help and exit.
 =item B<--base-allocation>

 Request the use of the "base:allocation" meta context, which is the
-most common context used with L<nbd_block_status(3)>.  This is
+most common context used with L<nbd_block_status_64(3)>.  This is
 equivalent to calling
 S<C<h.set_meta_context(nbd.CONTEXT_BASE_ALLOCATION)>> in the shell
 prior to connecting, and works even when combined with C<--uri> (while
diff --git a/generator/API.ml b/generator/API.ml
index 85509867..aeee41fb 100644
--- a/generator/API.ml
+++ b/generator/API.ml
@@ -1565,7 +1565,7 @@   "add_meta_context", {
 During connection libnbd can negotiate zero or more metadata
 contexts with the server.  Metadata contexts are features (such
 as C<\"base:allocation\">) which describe information returned
-by the L<nbd_block_status(3)> command (for C<\"base:allocation\">
+by the L<nbd_block_status_64(3)> command (for C<\"base:allocation\">
 this is whether blocks of data are allocated, zero or sparse).

 This call adds one metadata context to the list to be negotiated.
@@ -1592,7 +1592,7 @@   "add_meta_context", {
 Other metadata contexts are server-specific, but include
 C<\"qemu:dirty-bitmap:...\"> and C<\"qemu:allocation-depth\"> for
 qemu-nbd (see qemu-nbd I<-B> and I<-A> options).";
-    see_also = [Link "block_status"; Link "can_meta_context";
+    see_also = [Link "block_status_64"; Link "can_meta_context";
                 Link "get_nr_meta_contexts"; Link "get_meta_context";
                 Link "clear_meta_contexts"];
   };
@@ -1605,14 +1605,14 @@   "get_nr_meta_contexts", {
 During connection libnbd can negotiate zero or more metadata
 contexts with the server.  Metadata contexts are features (such
 as C<\"base:allocation\">) which describe information returned
-by the L<nbd_block_status(3)> command (for C<\"base:allocation\">
+by the L<nbd_block_status_64(3)> command (for C<\"base:allocation\">
 this is whether blocks of data are allocated, zero or sparse).

 This command returns how many meta contexts have been added to
 the list to request from the server via L<nbd_add_meta_context(3)>.
 The server is not obligated to honor all of the requests; to see
 what it actually supports, see L<nbd_can_meta_context(3)>.";
-    see_also = [Link "block_status"; Link "can_meta_context";
+    see_also = [Link "block_status_64"; Link "can_meta_context";
                 Link "add_meta_context"; Link "get_meta_context";
                 Link "clear_meta_contexts"];
   };
@@ -1625,13 +1625,13 @@   "get_meta_context", {
 During connection libnbd can negotiate zero or more metadata
 contexts with the server.  Metadata contexts are features (such
 as C<\"base:allocation\">) which describe information returned
-by the L<nbd_block_status(3)> command (for C<\"base:allocation\">
+by the L<nbd_block_status_64(3)> command (for C<\"base:allocation\">
 this is whether blocks of data are allocated, zero or sparse).

 This command returns the i'th meta context request, as added by
 L<nbd_add_meta_context(3)>, and bounded by
 L<nbd_get_nr_meta_contexts(3)>.";
-    see_also = [Link "block_status"; Link "can_meta_context";
+    see_also = [Link "block_status_64"; Link "can_meta_context";
                 Link "add_meta_context"; Link "get_nr_meta_contexts";
                 Link "clear_meta_contexts"];
   };
@@ -1645,7 +1645,7 @@   "clear_meta_contexts", {
 During connection libnbd can negotiate zero or more metadata
 contexts with the server.  Metadata contexts are features (such
 as C<\"base:allocation\">) which describe information returned
-by the L<nbd_block_status(3)> command (for C<\"base:allocation\">
+by the L<nbd_block_status_64(3)> command (for C<\"base:allocation\">
 this is whether blocks of data are allocated, zero or sparse).

 This command resets the list of meta contexts to request back to
@@ -1654,7 +1654,7 @@   "clear_meta_contexts", {
 negotiation mode is selected (see L<nbd_set_opt_mode(3)>), for
 altering the list of attempted contexts between subsequent export
 queries.";
-    see_also = [Link "block_status"; Link "can_meta_context";
+    see_also = [Link "block_status_64"; Link "can_meta_context";
                 Link "add_meta_context"; Link "get_nr_meta_contexts";
                 Link "get_meta_context"; Link "set_opt_mode"];
   };
@@ -2233,7 +2233,7 @@   "can_meta_context", {
 ^ non_blocking_test_call_description;
     see_also = [SectionLink "Flag calls"; Link "opt_info";
                 Link "add_meta_context";
-                Link "block_status"; Link "aio_block_status";
+                Link "block_status_64"; Link "aio_block_status_64";
                 Link "set_request_meta_context"; Link "opt_set_meta_context"];
   };

@@ -2664,7 +2664,7 @@   "block_status", {
     optargs = [ OFlags ("flags", cmd_flags, Some ["REQ_ONE"]) ];
     ret = RErr;
     permitted_states = [ Connected ];
-    shortdesc = "send block status command to the NBD server";
+    shortdesc = "send block status command to the NBD server, with 32-bit callback";
     longdesc = "\
 Issue the block status command to the NBD server.  If
 supported by the server, this causes metadata context
@@ -2679,7 +2679,15 @@   "block_status", {
 The NBD protocol does not yet have a way for a client to learn if
 the server will enforce an even smaller maximum block status size,
 although a future extension may add a constraint visible in
-L<nbd_get_block_size(3)>.
+L<nbd_get_block_size(3)>.  Furthermore, this function is inherently
+limited to 32-bit values.  If the server replies with a larger
+extent, the length of that extent will be truncated to just
+below 32 bits and any further extents from the server will be
+ignored.  If the server replies with a status value larger than
+32 bits (only possible when extended headers are in use), the
+callback function will be passed an C<EOVERFLOW> error.  To get
+the full extent information from a server that supports 64-bit
+extents, you must use L<nbd_block_status_64(3)>.

 Depending on which metadata contexts were enabled before
 connecting (see L<nbd_add_meta_context(3)>) and which are
@@ -2699,7 +2707,7 @@   "block_status", {
 array is an array of pairs of integers with the first entry in each
 pair being the length (in bytes) of the block and the second entry
 being a status/flags field which is specific to the metadata context.
-(The number of pairs passed to the function is C<nr_entries/2>.)  The
+The number of pairs passed to the function is C<nr_entries/2>.  The
 NBD protocol document in the section about
 C<NBD_REPLY_TYPE_BLOCK_STATUS> describes the meaning of this array;
 for contexts known to libnbd, B<E<lt>libnbd.hE<gt>> contains constants
@@ -2723,10 +2731,79 @@   "block_status", {
 does not exceed C<count> bytes; however, libnbd does not
 validate that the server obeyed the flag."
 ^ strict_call_description;
-    see_also = [Link "add_meta_context"; Link "can_meta_context";
+    see_also = [Link "block_status_64";
+                Link "add_meta_context"; Link "can_meta_context";
                 Link "aio_block_status"; Link "set_strict_mode"];
   };

+  "block_status_64", {
+    default_call with
+    args = [ UInt64 "count"; UInt64 "offset"; Closure extent64_closure ];
+    optargs = [ OFlags ("flags", cmd_flags, Some ["REQ_ONE"]) ];
+    ret = RErr;
+    permitted_states = [ Connected ];
+    shortdesc = "send block status command to the NBD server, with 64-bit callback";
+    longdesc = "\
+Issue the block status command to the NBD server.  If
+supported by the server, this causes metadata context
+information about blocks beginning from the specified
+offset to be returned. The C<count> parameter is a hint: the
+server may choose to return less status, or the final block
+may extend beyond the requested range. If multiple contexts
+are supported, the number of blocks and cumulative length
+of those blocks need not be identical between contexts.
+
+Note that not all servers can support a C<count> of 4GiB or larger.
+The NBD protocol does not yet have a way for a client to learn if
+the server will enforce an even smaller maximum block status size,
+although a future extension may add a constraint visible in
+L<nbd_get_block_size(3)>.
+
+Depending on which metadata contexts were enabled before
+connecting (see L<nbd_add_meta_context(3)>) and which are
+supported by the server (see L<nbd_can_meta_context(3)>) this call
+returns information about extents by calling back to the
+C<extent64> function.  The callback cannot call C<nbd_*> APIs on the
+same handle since it holds the handle lock and will
+cause a deadlock.  If the callback returns C<-1>, and no earlier
+error has been detected, then the overall block status command
+will fail with any non-zero value stored into the callback's
+C<error> parameter (with a default of C<EPROTO>); but any further
+contexts will still invoke the callback.
+
+The C<extent64> function is called once per type of metadata available,
+with the C<user_data> passed to this function.  The C<metacontext>
+parameter is a string such as C<\"base:allocation\">.  The C<entries>
+array is an array of B<nbd_extent> structs, containing length (in bytes)
+of the block and a status/flags field which is specific to the metadata
+context.  The number of array entries passed to the function is
+C<nr_entries>.  The NBD protocol document in the section about
+C<NBD_REPLY_TYPE_BLOCK_STATUS> describes the meaning of this array;
+for contexts known to libnbd, B<E<lt>libnbd.hE<gt>> contains constants
+beginning with C<LIBNBD_STATE_> that may help decipher the values.
+On entry to the callback, the C<error> parameter contains the errno
+value of any previously detected error.
+
+It is possible for the extent function to be called
+more times than you expect (if the server is buggy),
+so always check the C<metacontext> field to ensure you
+are receiving the data you expect.  It is also possible
+that the extent function is not called at all, even for
+metadata contexts that you requested.  This indicates
+either that the server doesn't support the context
+or for some other reason cannot return the data.
+
+The C<flags> parameter may be C<0> for no flags, or may contain
+C<LIBNBD_CMD_FLAG_REQ_ONE> meaning that the server should
+return only one extent per metadata context where that extent
+does not exceed C<count> bytes; however, libnbd does not
+validate that the server obeyed the flag."
+^ strict_call_description;
+    see_also = [Link "block_status";
+                Link "add_meta_context"; Link "can_meta_context";
+                Link "aio_block_status_64"; Link "set_strict_mode"];
+  };
+
   "poll", {
     default_call with
     args = [ Int "timeout" ]; ret = RInt;
@@ -3321,7 +3398,7 @@   "aio_block_status", {
                 OFlags ("flags", cmd_flags, Some ["REQ_ONE"]) ];
     ret = RCookie;
     permitted_states = [ Connected ];
-    shortdesc = "send block status command to the NBD server";
+    shortdesc = "send block status command to the NBD server, with 32-bit callback";
     longdesc = "\
 Send the block status command to the NBD server.

@@ -3329,13 +3406,48 @@   "aio_block_status", {
 Or supply the optional C<completion_callback> which will be invoked
 as described in L<libnbd(3)/Completion callbacks>.

-Other parameters behave as documented in L<nbd_block_status(3)>."
+Other parameters behave as documented in L<nbd_block_status(3)>.
+
+This function is inherently limited to 32-bit values.  If the
+server replies with a larger extent, the length of that extent
+will be truncated to just below 32 bits and any further extents
+from the server will be ignored.  If the server replies with a
+status value larger than 32 bits (only possible when extended
+headers are in use), the callback function will be passed an
+C<EOVERFLOW> error.  To get the full extent information from a
+server that supports 64-bit extents, you must use
+L<nbd_aio_block_status_64(3)>.
+"
 ^ strict_call_description;
     see_also = [SectionLink "Issuing asynchronous commands";
+                Link "aio_block_status_64";
                 Link "can_meta_context"; Link "block_status";
                 Link "set_strict_mode"];
   };

+  "aio_block_status_64", {
+    default_call with
+    args = [ UInt64 "count"; UInt64 "offset"; Closure extent64_closure ];
+    optargs = [ OClosure completion_closure;
+                OFlags ("flags", cmd_flags, Some ["REQ_ONE"]) ];
+    ret = RCookie;
+    permitted_states = [ Connected ];
+    shortdesc = "send block status command to the NBD server, with 64-bit callback";
+    longdesc = "\
+Send the block status command to the NBD server.
+
+To check if the command completed, call L<nbd_aio_command_completed(3)>.
+Or supply the optional C<completion_callback> which will be invoked
+as described in L<libnbd(3)/Completion callbacks>.
+
+Other parameters behave as documented in L<nbd_block_status_64(3)>."
+^ strict_call_description;
+    see_also = [SectionLink "Issuing asynchronous commands";
+                Link "aio_block_status";
+                Link "can_meta_context"; Link "block_status_64";
+                Link "set_strict_mode"];
+  };
+
   "aio_get_fd", {
     default_call with
     args = []; ret = RFd;
@@ -3858,6 +3970,8 @@ let first_version =
   "aio_opt_structured_reply", (1, 16);
   "opt_starttls", (1, 16);
   "aio_opt_starttls", (1, 16);
+  "block_status_64", (1, 16);
+  "aio_block_status_64", (1, 16);

   (* These calls are proposed for a future version of libnbd, but
    * have not been added to any released version so far.
diff --git a/generator/OCaml.ml b/generator/OCaml.ml
index 66dc6cad..360a75a9 100644
--- a/generator/OCaml.ml
+++ b/generator/OCaml.ml
@@ -583,7 +583,6 @@ let
   pr "}\n";
   pr "\n";
   pr "static int\n";
-  pr "__attribute__((unused)) /* XXX temporary hack */\n";
   pr "%s_wrapper " cbname;
   C.print_cbarg_list ~wrap:true cbargs;
   pr "\n";
diff --git a/generator/Python.ml b/generator/Python.ml
index 980fdcea..482cdbda 100644
--- a/generator/Python.ml
+++ b/generator/Python.ml
@@ -153,7 +153,6 @@ let
 let print_python_closure_wrapper { cbname; cbargs } =
   pr "/* Wrapper for %s callback. */\n" cbname;
   pr "static int\n";
-  pr "__attribute__((unused)) /* XXX temporary hack */\n";
   pr "%s_wrapper " cbname;
   C.print_cbarg_list ~wrap:true cbargs;
   pr "\n";
diff --git a/lib/rw.c b/lib/rw.c
index 6212bf4c..26533836 100644
--- a/lib/rw.c
+++ b/lib/rw.c
@@ -205,7 +205,7 @@ nbd_unlocked_zero (struct nbd_handle *h,
   return wait_for_command (h, cookie);
 }

-/* Issue a block status command and wait for the reply. */
+/* Issue a block status command and wait for the reply, 32-bit callback. */
 int
 nbd_unlocked_block_status (struct nbd_handle *h,
                            uint64_t count, uint64_t offset,
@@ -223,6 +223,25 @@ nbd_unlocked_block_status (struct nbd_handle *h,
   return wait_for_command (h, cookie);
 }

+/* Issue a block status command and wait for the reply, 64-bit callback. */
+int
+nbd_unlocked_block_status_64 (struct nbd_handle *h,
+                              uint64_t count, uint64_t offset,
+                              nbd_extent64_callback *extent64,
+                              uint32_t flags)
+{
+  int64_t cookie;
+  nbd_completion_callback c = NBD_NULL_COMPLETION;
+
+  cookie = nbd_unlocked_aio_block_status_64 (h, count, offset, extent64, &c,
+                                             flags);
+  if (cookie == -1)
+    return -1;
+
+  assert (CALLBACK_IS_NULL (*extent64));
+  return wait_for_command (h, cookie);
+}
+
 /* count_err represents the errno to return if bounds check fail */
 int64_t
 nbd_internal_command_common (struct nbd_handle *h,
@@ -543,10 +562,10 @@ nbd_unlocked_aio_block_status (struct nbd_handle *h,
                                uint32_t flags)
 {
   nbd_extent_callback *shim = malloc (sizeof *shim);
-  struct command_cb cb = { .fn.extent.callback = nbd_convert_extent,
-                           .fn.extent.user_data = shim,
-                           .fn.extent.free = nbd_convert_extent_free,
-                           .completion = *completion };
+  nbd_extent64_callback wrapper = { .callback = nbd_convert_extent,
+                                    .user_data = shim,
+                                    .free = nbd_convert_extent_free, };
+  int ret;

   if (shim == NULL) {
     set_error (errno, "malloc");
@@ -555,10 +574,25 @@ nbd_unlocked_aio_block_status (struct nbd_handle *h,
   *shim = *extent;
   SET_CALLBACK_TO_NULL (*extent);

+  ret = nbd_unlocked_aio_block_status_64 (h, count, offset, &wrapper,
+                                          completion, flags);
+  FREE_CALLBACK (wrapper);
+  return ret;
+}
+
+int64_t
+nbd_unlocked_aio_block_status_64 (struct nbd_handle *h,
+                                  uint64_t count, uint64_t offset,
+                                  nbd_extent64_callback *extent64,
+                                  nbd_completion_callback *completion,
+                                  uint32_t flags)
+{
+  struct command_cb cb = { .fn.extent = *extent64,
+                           .completion = *completion };
+
   if (h->strict & LIBNBD_STRICT_COMMANDS) {
     if (!h->structured_replies) {
       set_error (ENOTSUP, "server does not support structured replies");
-      FREE_CALLBACK (cb.fn.extent);
       return -1;
     }

@@ -566,11 +600,11 @@ nbd_unlocked_aio_block_status (struct nbd_handle *h,
       set_error (ENOTSUP, "did not negotiate any metadata contexts, "
                  "either you did not call nbd_add_meta_context before "
                  "connecting or the server does not support it");
-      FREE_CALLBACK (cb.fn.extent);
       return -1;
     }
   }

+  SET_CALLBACK_TO_NULL (*extent64);
   SET_CALLBACK_TO_NULL (*completion);
   return nbd_internal_command_common (h, flags, NBD_CMD_BLOCK_STATUS, offset,
                                       count, EINVAL, NULL, &cb);
diff --git a/python/t/465-block-status-64.py b/python/t/465-block-status-64.py
new file mode 100644
index 00000000..6fba9c3e
--- /dev/null
+++ b/python/t/465-block-status-64.py
@@ -0,0 +1,56 @@
+# libnbd Python bindings
+# Copyright (C) 2010-2022 Red Hat Inc.
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program; if not, write to the Free Software
+# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+
+import os
+
+import nbd
+
+script = "%s/../tests/meta-base-allocation.sh" % os.getenv("srcdir", ".")
+
+h = nbd.NBD()
+h.add_meta_context("base:allocation")
+h.connect_command(["nbdkit", "-s", "--exit-with-parent", "-v", "sh", script])
+
+entries = []
+
+
+def f(user_data, metacontext, offset, e, err):
+    global entries
+    assert user_data == 42
+    assert err.value == 0
+    if metacontext != "base:allocation":
+        return
+    entries = e
+
+
+h.block_status_64(65536, 0, lambda *args: f(42, *args))
+print("entries = %r" % entries)
+assert entries == [(8192, 0),
+                   (8192, 1),
+                   (16384, 3),
+                   (16384, 2),
+                   (16384, 0)]
+
+h.block_status_64(1024, 32256, lambda *args: f(42, *args))
+print("entries = %r" % entries)
+assert entries == [(512, 3),
+                   (16384, 2)]
+
+h.block_status_64(1024, 32256, lambda *args: f(42, *args),
+                  nbd.CMD_FLAG_REQ_ONE)
+print("entries = %r" % entries)
+assert entries == [(512, 3)]
diff --git a/ocaml/tests/Makefile.am b/ocaml/tests/Makefile.am
index 2cd36eb0..fbd53ac9 100644
--- a/ocaml/tests/Makefile.am
+++ b/ocaml/tests/Makefile.am
@@ -39,6 +39,7 @@ ML_TESTS = \
 	test_405_pread_structured.ml \
 	test_410_pwrite.ml \
 	test_460_block_status.ml \
+	test_465_block_status_64.ml \
 	test_500_aio_pread.ml \
 	test_505_aio_pread_structured_callback.ml \
 	test_510_aio_pwrite.ml \
diff --git a/ocaml/tests/test_465_block_status_64.ml b/ocaml/tests/test_465_block_status_64.ml
new file mode 100644
index 00000000..2f36a692
--- /dev/null
+++ b/ocaml/tests/test_465_block_status_64.ml
@@ -0,0 +1,58 @@
+(* hey emacs, this is OCaml code: -*- tuareg -*- *)
+(* libnbd OCaml test case
+ * Copyright (C) 2013-2022 Red Hat Inc.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, write to the Free Software
+ * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+ *)
+
+open Printf
+
+let script =
+  try
+    let srcdir = Sys.getenv "srcdir" in
+    sprintf "%s/../../tests/meta-base-allocation.sh" srcdir
+  with
+    Not_found -> failwith "error: srcdir is not defined"
+
+let entries = ref [||]
+let f user_data metacontext offset e err =
+  assert (user_data = 42);
+  assert (!err = 0);
+  if metacontext = "base:allocation" then
+    entries := e;
+  0
+
+let () =
+  let nbd = NBD.create () in
+  NBD.add_meta_context nbd "base:allocation";
+  NBD.connect_command nbd ["nbdkit"; "-s"; "--exit-with-parent"; "-v";
+                           "sh"; script];
+
+  NBD.block_status_64 nbd 65536_L 0_L (f 42);
+  assert (!entries = [|  8192_L, 0_L;
+                         8192_L, 1_L;
+                        16384_L, 3_L;
+                        16384_L, 2_L;
+                        16384_L, 0_L |]);
+
+  NBD.block_status_64 nbd 1024_L 32256_L (f 42);
+  assert (!entries = [|   512_L, 3_L;
+                        16384_L, 2_L |]);
+
+  let flags = let open NBD.CMD_FLAG in [REQ_ONE] in
+  NBD.block_status_64 nbd 1024_L 32256_L (f 42) ~flags;
+  assert (!entries = [|   512_L, 3_L |])
+
+let () = Gc.compact ()
diff --git a/tests/meta-base-allocation.c b/tests/meta-base-allocation.c
index 401c0c88..c8f14929 100644
--- a/tests/meta-base-allocation.c
+++ b/tests/meta-base-allocation.c
@@ -1,5 +1,5 @@
 /* NBD client library in userspace
- * Copyright (C) 2013-2020 Red Hat Inc.
+ * Copyright (C) 2013-2022 Red Hat Inc.
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
@@ -32,10 +32,13 @@

 #define BOGUS_CONTEXT "x-libnbd:nosuch"

-static int check_extent (void *data,
-                         const char *metacontext,
-                         uint64_t offset,
-                         uint32_t *entries, size_t nr_entries, int *error);
+static int check_extent32 (void *data, const char *metacontext,
+                           uint64_t offset,
+                           uint32_t *entries, size_t nr_entries, int *error);
+
+static int check_extent64 (void *data, const char *metacontext,
+                           uint64_t offset,
+                           nbd_extent *entries, size_t nr_entries, int *error);

 int
 main (int argc, char *argv[])
@@ -149,27 +152,51 @@ main (int argc, char *argv[])
   /* Read the block status. */
   id = 1;
   if (nbd_block_status (nbd, 65536, 0,
-                        (nbd_extent_callback) { .callback = check_extent, .user_data = &id },
+                        (nbd_extent_callback) { .callback = check_extent32,
+                                                .user_data = &id },
                         0) == -1) {
     fprintf (stderr, "%s\n", nbd_get_error ());
     exit (EXIT_FAILURE);
   }
+  if (nbd_block_status_64 (nbd, 65536, 0,
+                           (nbd_extent64_callback) { .callback = check_extent64,
+                                                     .user_data = &id },
+                           0) == -1) {
+    fprintf (stderr, "%s\n", nbd_get_error ());
+    exit (EXIT_FAILURE);
+  }

   id = 2;
   if (nbd_block_status (nbd, 1024, 32768-512,
-                        (nbd_extent_callback) { .callback = check_extent, .user_data = &id },
+                        (nbd_extent_callback) { .callback = check_extent32,
+                                                .user_data = &id },
                         0) == -1) {
     fprintf (stderr, "%s\n", nbd_get_error ());
     exit (EXIT_FAILURE);
   }
+  if (nbd_block_status_64 (nbd, 1024, 32768-512,
+                           (nbd_extent64_callback) { .callback = check_extent64,
+                                                     .user_data = &id },
+                           0) == -1) {
+    fprintf (stderr, "%s\n", nbd_get_error ());
+    exit (EXIT_FAILURE);
+  }

   id = 3;
   if (nbd_block_status (nbd, 1024, 32768-512,
-                        (nbd_extent_callback) { .callback = check_extent, .user_data = &id },
+                        (nbd_extent_callback) { .callback = check_extent32,
+                                                .user_data = &id },
                         LIBNBD_CMD_FLAG_REQ_ONE) == -1) {
     fprintf (stderr, "%s\n", nbd_get_error ());
     exit (EXIT_FAILURE);
   }
+  if (nbd_block_status_64 (nbd, 1024, 32768-512,
+                           (nbd_extent64_callback) { .callback = check_extent64,
+                                                     .user_data = &id },
+                           LIBNBD_CMD_FLAG_REQ_ONE) == -1) {
+    fprintf (stderr, "%s\n", nbd_get_error ());
+    exit (EXIT_FAILURE);
+  }

   if (nbd_shutdown (nbd, 0) == -1) {
     fprintf (stderr, "%s\n", nbd_get_error ());
@@ -181,10 +208,8 @@ main (int argc, char *argv[])
 }

 static int
-check_extent (void *data,
-              const char *metacontext,
-              uint64_t offset,
-              uint32_t *entries, size_t nr_entries, int *error)
+check_extent32 (void *data, const char *metacontext, uint64_t offset,
+                uint32_t *entries, size_t nr_entries, int *error)
 {
   size_t i;
   int id;
@@ -238,3 +263,65 @@ check_extent (void *data,

   return 0;
 }
+
+static int
+check_extent64 (void *data, const char *metacontext, uint64_t offset,
+                nbd_extent *entries, size_t nr_entries, int *error)
+{
+  size_t i;
+  int id;
+
+  id = * (int *)data;
+
+  printf ("extent: id=%d, metacontext=%s, offset=%" PRIu64 ", "
+          "nr_entries=%zu, error=%d\n",
+          id, metacontext, offset, nr_entries, *error);
+
+  assert (*error == 0);
+  if (strcmp (metacontext, LIBNBD_CONTEXT_BASE_ALLOCATION) == 0) {
+    for (i = 0; i < nr_entries; i++) {
+      printf ("\t%zu\tlength=%" PRIu64 ", status=%" PRIu64 "\n",
+              i, entries[i].length, entries[i].flags);
+    }
+    fflush (stdout);
+
+    switch (id) {
+    case 1:
+      assert (nr_entries == 5);
+      assert (entries[0].length == 8192);
+      assert (entries[0].flags == 0);
+      assert (entries[1].length == 8192);
+      assert (entries[1].flags == LIBNBD_STATE_HOLE);
+      assert (entries[2].length == 16384);
+      assert (entries[2].flags == (LIBNBD_STATE_HOLE|LIBNBD_STATE_ZERO));
+      assert (entries[3].length == 16384);
+      assert (entries[3].flags == LIBNBD_STATE_ZERO);
+      assert (entries[4].length == 16384);
+      assert (entries[4].flags == 0);
+      break;
+
+    case 2:
+      assert (nr_entries == 2);
+      assert (entries[0].length == 512);
+      assert (entries[0].flags == (LIBNBD_STATE_HOLE|LIBNBD_STATE_ZERO));
+      assert (entries[1].length == 16384);
+      assert (entries[1].flags == LIBNBD_STATE_ZERO);
+      break;
+
+    case 3:
+      assert (nr_entries == 1);
+      assert (entries[0].length == 512);
+      assert (entries[0].flags == (LIBNBD_STATE_HOLE|LIBNBD_STATE_ZERO));
+      break;
+
+    default:
+      abort ();
+    }
+
+  }
+  else
+    fprintf (stderr, "warning: ignored unexpected meta context %s\n",
+             metacontext);
+
+  return 0;
+}
diff --git a/fuzzing/libnbd-fuzz-wrapper.c b/fuzzing/libnbd-fuzz-wrapper.c
index d8cb7cb0..e7cf7fe9 100644
--- a/fuzzing/libnbd-fuzz-wrapper.c
+++ b/fuzzing/libnbd-fuzz-wrapper.c
@@ -1,5 +1,5 @@
 /* NBD client library in userspace
- * Copyright (C) 2013-2019 Red Hat Inc.
+ * Copyright (C) 2013-2022 Red Hat Inc.
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
@@ -165,6 +165,17 @@ extent_callback (void *user_data,
   return 0;
 }

+/* Block status (extents64) callback, does nothing. */
+static int
+extent64_callback (void *user_data,
+                   const char *metacontext,
+                   uint64_t offset, nbd_extent *entries,
+                   size_t nr_entries, int *error)
+{
+  //fprintf (stderr, "extent64 called, nr_entries = %zu\n", nr_entries);
+  return 0;
+}
+
 /* This is the client (parent process) running libnbd. */
 static char buf[512];
 static char prbuf[65536];
@@ -213,7 +224,7 @@ client (int sock)
                         },
                         0);

-  /* Test block status. */
+  /* Test both sizes of block status. */
   nbd_block_status (nbd, length, 0,
                     (nbd_extent_callback) {
                       .callback = extent_callback,
@@ -221,6 +232,13 @@ client (int sock)
                       .free = NULL
                     },
                     0);
+  nbd_block_status_64 (nbd, length, 0,
+                       (nbd_extent64_callback) {
+                         .callback = extent64_callback,
+                         .user_data = NULL,
+                         .free = NULL
+                       },
+                       0);

   nbd_shutdown (nbd, 0);
 }
diff --git a/golang/Makefile.am b/golang/Makefile.am
index 0808a639..d342b51c 100644
--- a/golang/Makefile.am
+++ b/golang/Makefile.am
@@ -43,6 +43,7 @@ source_files = \
 	libnbd_405_pread_structured_test.go \
 	libnbd_410_pwrite_test.go \
 	libnbd_460_block_status_test.go \
+	libnbd_465_block_status_64_test.go \
 	libnbd_500_aio_pread_test.go \
 	libnbd_510_aio_pwrite_test.go \
 	libnbd_590_aio_copy_test.go \
diff --git a/golang/libnbd_465_block_status_64_test.go b/golang/libnbd_465_block_status_64_test.go
new file mode 100644
index 00000000..066cccbf
--- /dev/null
+++ b/golang/libnbd_465_block_status_64_test.go
@@ -0,0 +1,119 @@
+/* libnbd golang tests
+ * Copyright (C) 2013-2022 Red Hat Inc.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, write to the Free Software
+ * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+ */
+
+package libnbd
+
+import (
+	"fmt"
+	"os"
+	"strings"
+	"testing"
+)
+
+var entries64 []LibnbdExtent
+
+func mcf64(metacontext string, offset uint64, e []LibnbdExtent, error *int) int {
+	if *error != 0 {
+		panic("expected *error == 0")
+	}
+	if metacontext == "base:allocation" {
+		entries64 = e
+	}
+	return 0
+}
+
+// Seriously WTF?
+func mc64_compare(a1 []LibnbdExtent, a2 []LibnbdExtent) bool {
+	if len(a1) != len(a2) {
+		return false
+	}
+	for i := 0; i < len(a1); i++ {
+		if a1[i] != a2[i] {
+			return false
+		}
+	}
+	return true
+}
+
+func mc64_to_string(a []LibnbdExtent) string {
+	ss := make([]string, len(a))
+	for i := 0; i < len(a); i++ {
+		ss[i] = fmt.Sprintf("%#v", a[i])
+	}
+	return strings.Join(ss, ", ")
+}
+
+func Test465BlockStatus64(t *testing.T) {
+	srcdir := os.Getenv("abs_top_srcdir")
+	script := srcdir + "/tests/meta-base-allocation.sh"
+
+	h, err := Create()
+	if err != nil {
+		t.Fatalf("could not create handle: %s", err)
+	}
+	defer h.Close()
+
+	err = h.AddMetaContext("base:allocation")
+	if err != nil {
+		t.Fatalf("%s", err)
+	}
+	err = h.ConnectCommand([]string{
+		"nbdkit", "-s", "--exit-with-parent", "-v",
+		"sh", script,
+	})
+	if err != nil {
+		t.Fatalf("%s", err)
+	}
+
+	err = h.BlockStatus64(65536, 0, mcf64, nil)
+	if err != nil {
+		t.Fatalf("%s", err)
+	}
+	if !mc64_compare(entries64, []LibnbdExtent{
+		{8192, 0},
+		{8192, 1},
+		{16384, 3},
+		{16384, 2},
+		{16384, 0},
+	}) {
+		t.Fatalf("unexpected entries (1): %s", mc64_to_string(entries64))
+	}
+
+	err = h.BlockStatus64(1024, 32256, mcf64, nil)
+	if err != nil {
+		t.Fatalf("%s", err)
+	}
+	if !mc64_compare(entries64, []LibnbdExtent{
+		{512, 3},
+		{16384, 2},
+	}) {
+		t.Fatalf("unexpected entries (2): %s", mc64_to_string(entries64))
+	}
+
+	var optargs BlockStatus64Optargs
+	optargs.FlagsSet = true
+	optargs.Flags = CMD_FLAG_REQ_ONE
+	err = h.BlockStatus64(1024, 32256, mcf64, &optargs)
+	if err != nil {
+		t.Fatalf("%s", err)
+	}
+	if !mc64_compare(entries64, []LibnbdExtent{{512, 3}}) {
+		t.Fatalf("unexpected entries (3): %s", mc64_to_string(entries64))
+	}
+
+}
-- 
2.38.1


