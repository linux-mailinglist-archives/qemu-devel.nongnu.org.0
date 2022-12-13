Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2F864BE9E
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 22:41:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Czm-0000Nt-7O; Tue, 13 Dec 2022 16:39:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fasano@mit.edu>) id 1p5Cza-0000I5-6b
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:39:14 -0500
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fasano@mit.edu>) id 1p5CzX-0007fj-JD
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:39:13 -0500
Received: from panda194.. ([18.4.85.108]) (authenticated bits=0)
 (User authenticated as fasano@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 2BDLcaP8030603
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Dec 2022 16:39:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
 t=1670967543; bh=qhmHsNmAxlc9cgZSHsaFvxxQAkUFKHHtR2wF32S33cU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=LJuy556R0K7ZVisHDE4AFZ1HpKCxWhDfhINd5ytr/I4D19jqTldCyYO/oJJPs1Dne
 jRfaZ0bFTRuafpF/dGMFmxSRMCW4gbbTHdKz9RY2JlCjBLlKJQ7WKagjJ1ULIBGrBx
 VgBoB1pT2G3h8JRTdWf6CQFEQwQVzqAvMPxwAKZen29JzvFgYsUwEJSIDDgi9SqY0r
 kxxPYEey8AQHomPFdJlaez9TQ8lSZVLUi4WMwxsay5ZFu1+mPTMWlNYlgABV5oKFq+
 X90GiSNgu7z3ACeG/1BLXRQ/h7uHvU7a7a+z22IXRWicNBYjpJXM1wePoCu6vIQOKO
 c6ae/kv0K94fQ==
From: Andrew Fasano <fasano@mit.edu>
To: qemu-devel@nongnu.org
Cc: elysia.witham@ll.mit.edu, alex.bennee@linaro.org, erdnaxe@crans.org,
 ma.mandourr@gmail.com, Andrew Fasano <fasano@mit.edu>
Subject: [PATCH 1/8] docs/devel: describe QPP API
Date: Tue, 13 Dec 2022 16:37:50 -0500
Message-Id: <20221213213757.4123265-2-fasano@mit.edu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221213213757.4123265-1-fasano@mit.edu>
References: <20221213213757.4123265-1-fasano@mit.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=18.9.28.11; envelope-from=fasano@mit.edu;
 helo=outgoing.mit.edu
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

From: Elysia Witham <elysia.witham@ll.mit.edu>

The new QPP API allows plugin-to-plugin interaction for creating
and using callbacks as well as importing and exporting functions.
The new test plugins qpp_srv and qpp_client demonstrate how
plugins use the new API.

Signed-off-by: Elysia Witham <elysia.witham@ll.mit.edu>
Signed-off-by: Andrew Fasano <fasano@mit.edu>
---
 docs/devel/tcg-plugins.rst | 91 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 90 insertions(+), 1 deletion(-)

diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index 9740a70406..70ac09b96b 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -281,6 +281,14 @@ run::
   160          1      0
   135          1      0
 
+- tests/plugins/qpp_srv.c & tests/plugins/qpp_client.c
+
+These plugins demonstrate QPP interactions. The qpp_srv plugin defines
+a few exported functions and its own callback which are then imported and
+used by the qpp_client plugin. The qpp_client plugin registers its own
+function to run on qpp_srv's defined callback. The tests for these plugins
+are modified as both plugins must be loaded in order to work.
+
 - contrib/plugins/hotblocks.c
 
 The hotblocks plugin allows you to examine the where hot paths of
@@ -573,6 +581,88 @@ The plugin has a number of arguments, all of them are optional:
   configuration arguments implies ``l2=on``.
   (default: N = 2097152 (2MB), B = 64, A = 16)
 
+Plugin-to-Plugin Interactions
+-----------------------------
+
+Plugins may interact with other plugins through the QEMU Plugin-to-Plugin
+("QPP") API by including ``<plugin-qpp.h>`` in addition to ``<qemu_plugin.h>``.
+This API supports direct function calls between plugins. An inter-plugin
+callback system is supported within the core code as long as
+``qemu_plugin_version >= 2``.
+
+Plugin names
+~~~~~~~~~~~~
+Plugin names must be exported as ``qemu_plugin_name`` to use the QPP API in the same way
+``qemu_plugin_version`` is exported. This name can then be used by other plugins
+to import functions and use callbacks belonging to that plugin.
+
+Plugin dependencies
+~~~~~~~~~~~~~~~~~~~
+For a plugin to use another plugin's functions or callbacks it must declare that
+dependency through exporting ``qemu_plugin_uses`` which is a string array containing
+names of plugins used by that plugin. Those plugins must be loaded first. Note that this
+array must be null terminated, e.g. ``{plugin_a, NULL}``.
+
+QPP function calls
+~~~~~~~~~~~~~~~~~~
+When a plugin (e.g., ``plugin_a``) wishes to make some of its functions (e.g.,
+``func_1``) available to other plugins, it must:
+
+1. Mark the function definition with the ``QEMU_PLUGIN_EXPORT`` macro. For
+example : ``QEMU_PLUGIN_EXPORT int func_1(int x) {...}``
+2. Provide prototypes for exported functions in a header file using the macro
+``QPP_FUN_PROTOTYPE`` with arguments of the plugin's name, the function's
+return type, the function's name, and any arguments the function takes. For
+example: ``QPP_FUN_PROTOTYPE(my_plugin, int, do_add, int);``.
+3. Import this header from the plugin.
+
+When other plugins wish to use the functions exported by ``plugin_a``, they
+must:
+
+1. Import the header file with the function prototype(s).
+2. Call the function when desired by combining the target plugin name, an
+   underscore, and the target function name with ``_qpp`` on the end,
+   e.g., ``plugin_a_func_1_qpp()``.
+
+QPP callbacks
+~~~~~~~~~~~~~
+
+The QPP API also allows a plugin to define callback events and for other plugins
+to request to be notified whenever these events happens. The plugin that defines
+the callback is responsible for triggering the callback when it so wishes. Other
+plugins that wish to be notified on these events must define a function of an
+appropriate type and register it to run on this event.
+In particular, these plugins must:
+
+
+When a plugin (e.g., ``plugin_a``) wishes to define a callback (an event that
+other plugins can request to be notified about), it must:
+
+1. Define the callback using the ``qemu_plugin_create_callback`` function which
+   takes two arguments: the unique ``qemu_plugin_id_t id`` and the callback name.
+2. Call ``qemu_plugin_run_callback`` at appropriate places in the code to call registered
+   callback functions. It takes four arguments: the unique ``qemu_plugin_id_t id``,
+   the callback name, and the callback arguments which are standardized to be
+   ``gpointer evdata, gpointer udata``. The callback arguments point to two structs
+   which are defined by the plugin and can vary based on the use case of the callback.
+
+When other plugins wish to register a function to run on such an event, they
+must:
+
+1. Define a function that matches the ``cb_func_t`` type:
+   ``typedef void (*cb_func_t) (gpointer evdata, gpointer udata)``.
+2. Register this function to be run on the plugin defined callback using
+   ``qemu_plugin_reg_callback``. This function takes three arguments: the name of the
+   plugin which defines the callback, the callback name, and a ``cb_func_t`` function
+   pointer.
+
+When other plugins wish to unregister a function which is registered to run on a plugin
+defined event callback, they must:
+
+1. Call ``qemu_plugin_unreg_callback``. This function takes the same arguments as
+   ``qemu_plugin_reg_callback``. It will return true if it successfully finds and
+   unregisters the function.
+
 API
 ---
 
@@ -581,4 +671,3 @@ The following API is generated from the inline documentation in
 include the full kernel-doc annotations.
 
 .. kernel-doc:: include/qemu/qemu-plugin.h
-
-- 
2.34.1


