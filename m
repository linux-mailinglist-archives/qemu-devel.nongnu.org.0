Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7005AA16E
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 23:20:09 +0200 (CEST)
Received: from localhost ([::1]:37628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTrba-0001MB-OD
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 17:20:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fasano@mit.edu>) id 1oTp0g-0000Sx-Dp
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:33:50 -0400
Received: from outgoing-auth-1.mit.edu ([18.9.28.11]:49492
 helo=outgoing.mit.edu)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fasano@mit.edu>) id 1oTp0d-0001xq-En
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:33:50 -0400
Received: from panda194.. ([18.4.85.108]) (authenticated bits=0)
 (User authenticated as fasano@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 281IRv2f010380
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 1 Sep 2022 14:28:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
 t=1662056895; bh=YEk48QzMX/JqwU4rcwOXSUQf0A3XbfORMVl4Dm6zpIs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=pH274Fdf7BzbafYzytRRKWniiXvXiduNPcfq7k+JXVXNZPe/mb2Vnb7f02JNdmrB+
 9ByGs79Fm0NPSyQu6us1aiNst0qfrxd9xmpMPpUq4NfjMQFfheEAFyw8p60QJ14+WM
 qGebMGy07xqbvbC22QiuAgDTT93VBxY816rWYeijFh7faG3d+rpVDgw8OTfsCaYl7p
 3TpGr5K38Uk0/QL/gCCDst63WpL/Uk4IwzhlAMr0psLfVBxA/huZ5V9kw+YiLHlJk3
 Dih7FhRueEy7RUUxoAivxyKheIU6CDRmg8+YW8EsZ7YJLPdibphCwa8LQSrPoK3Ckg
 5Zys5QllWylYA==
From: Andrew Fasano <fasano@mit.edu>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, erdnaxe@crans.org, ma.mandourr@gmail.com,
 Andrew Fasano <fasano@mit.edu>
Subject: [RFC 1/4] docs/tcg-plugins: describe QPP API
Date: Thu,  1 Sep 2022 14:27:31 -0400
Message-Id: <20220901182734.2987337-2-fasano@mit.edu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220901182734.2987337-1-fasano@mit.edu>
References: <20220901182734.2987337-1-fasano@mit.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=18.9.28.11; envelope-from=fasano@mit.edu;
 helo=outgoing.mit.edu
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 01 Sep 2022 17:11:41 -0400
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Describe how multiple TCG plugins can interact using the QEMU
Plugin-to-Plugin API (QPP) with both callbacks and direct
function calls.

Signed-off-by: Andrew Fasano <fasano@mit.edu>
---
 docs/devel/tcg-plugins.rst | 76 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index a7cc44aa20..7985572027 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -441,3 +441,79 @@ The plugin has a number of arguments, all of them are optional:
   associativity of the L2 cache, respectively. Setting any of the L2
   configuration arguments implies ``l2=on``.
   (default: N = 2097152 (2MB), B = 64, A = 16)
+
+Plugin-to-Plugin Interactions
+-----------------------------
+
+Plugins may interact with other plugins through the QEMU Plugin-to-Plugin
+("QPP") API by including ``qemu/plugin-qpp.h``. This API supports direct
+function calls between plugins as well as an inter-plugin callback system.
+This API allows for composition of plugins: plugins can make use of logic in
+other plugins without the need for code duplication.
+
+Plugin names
+~~~~~~~~~~~~
+Plugins are automatically given a name by removing the suffix from their
+filename.  These plugin names will be used during QPP interactions as
+described below.  A plugin can access its own name through the preprocessor
+variable ``CURRENT_PLUGIN``.
+
+QPP function calls
+~~~~~~~~~~~~~~~~~~
+When a plugin (e.g. ``plugin_a``) wishes to make some of its functions (e.g.
+``func_1``) available to other plugins, it must:
+
+1. Mark the function definition with the ``QEMU_PLUGIN_EXPORT`` macro. For
+example : ``QEMU_PLUGIN_EXPORT int func_1(int x) {...}``.
+2. Provide prototypes for exported functions in a header file (e.g.
+``plugin_a.h``) using the macro ``QPP_FUN_PROTOTYPE`` with arguments of the
+plugin's name, the function's return type, the function's name, and any
+arguments the function takes. For example:
+``QPP_FUN_PROTOTYPE(plugin_a, int, func_1, int);``.
+3. Import this header from the plugin.
+
+When other plugins wish to use the functions exported by ``plugin_a``, they
+must:
+
+1. Import the header file (e.g. ``plugin_a.h``) with the function prototype(s).
+2. Call the function when desired by combining the target plugin name, an
+   underscore, and the target function name, e.g. ``plugin_a_func_1()``.
+
+QPP callbacks
+~~~~~~~~~~~~~
+
+The QPP API also allows a plugin to define callback events and for other plugins
+to request to be notified whenever these events happens. The plugin that defines
+the callback is responsible for triggering the callback when it so wishes. Other
+plugins that wish to be notified on these events must define a function of an
+appropriate type and register it to run on this event.
+
+When a plugin (e.g. ``plugin_a``) wishes to define a callback (an event that
+other plugins can request to be notified about), it must:
+
+1. Define the callback using the ``QPP_CREATE_CB`` macro with a single argument
+   of the callback's name. For example: ``QPP_CREATE_CB(on_some_event);``.
+2. In a header file (e.g. ``plugin_a.h``) create a prototype for the callback
+   type with ``QPP_CB_PROTOTYPE`` with arguments of the callback's return type
+   (only ``void`` is currently supported), the name of the callback, and any
+   arguments the callback function will be called with. For example with a
+   callback named ``on_some_event`` that returns a void and takes an int and
+   a bool as an argument, you would use: ``QPP_CB_PROTOTYPE(void,
+   on_some_event, int, bool)``.
+3. Import this header from the plugin.
+4. When the plugin wishes to run any registered callback functions, it should
+   use the macro ``QPP_RUN_CB`` with the first argument set to the callback
+   name followed by the arguments as specified in the header. For example:
+   ``QPP_RUN_CB(on_some_event, 2, true);``.
+
+When other plugins wish to register a function to run on such an event, they
+must:
+
+1. Import the header file with the callback prototype(s) (e.g. ``plugin_a.h``)
+2. Define a function that matches the callback signature. For example:
+   ``void plugin_b_callback(int, bool) {...}``.
+3. Register this function to be run on the callback using the ``QPP_REG_CB``
+   macro with the first argument being the name of the plugin that provides the
+   callback (as a string), the second being the callback name, and the third as
+   the function that should be run. For example: ``QPP_REG_CB("plugin_a",
+   on_some_event, plugin_b_callback);``
-- 
2.34.1


