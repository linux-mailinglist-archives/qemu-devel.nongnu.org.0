Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2465D5AA167
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 23:16:21 +0200 (CEST)
Received: from localhost ([::1]:48218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTrXv-0007CI-U6
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 17:16:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fasano@mit.edu>) id 1oTp0f-0000SO-TP
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:33:50 -0400
Received: from outgoing-auth-1.mit.edu ([18.9.28.11]:49505
 helo=outgoing.mit.edu)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fasano@mit.edu>) id 1oTp0d-0001xv-EA
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:33:49 -0400
Received: from panda194.. ([18.4.85.108]) (authenticated bits=0)
 (User authenticated as fasano@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 281IRv2e010380
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 1 Sep 2022 14:28:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
 t=1662056883; bh=L8A4yVeMOnRbKftlYMAEbAjqfK9va0YzMXqrb/b/pmo=;
 h=From:To:Cc:Subject:Date;
 b=FAZ8chKuZ/OTQAsmUgOANWM+kuAFiXwKQqGC/pJ2Hx4QafQImSvC4CW7FfgQI8MF9
 3IfFJtgaCN6fmCEcRH2ZYB2op+KGSuENkWCZeP6L7e7ADFaM9gqypz53AycdkjWxyo
 EM545H2lF0Fsbt5MN586djKiwrcf3gpC/p1lXziPvZPd3om7h8l6xPk2gmH/Jhy/Uy
 Qh5YKhDrQaS8bvN2GOA7gQTp/2E5kaFsWAYJCTlaPC/MSnm9qKNYjMO1ePtmo4Exwa
 wBkt9/F1h6rBbyG0CHMfEhvYBWKcgifW7FnR+0MdfvpMgGgnMSBGpapx8ehlqqu1wG
 jMTXNxPX9cGCg==
From: Andrew Fasano <fasano@mit.edu>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, erdnaxe@crans.org, ma.mandourr@gmail.com,
 Andrew Fasano <fasano@mit.edu>
Subject: [RFC 0/4] Support interactions between TCG plugins
Date: Thu,  1 Sep 2022 14:27:30 -0400
Message-Id: <20220901182734.2987337-1-fasano@mit.edu>
X-Mailer: git-send-email 2.34.1
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
X-Mailman-Approved-At: Thu, 01 Sep 2022 17:11:40 -0400
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

Hello,

I'm requesting comments on the following series of patches expanding the
TCG plugin system to add the "QEMU Plugin-to-Plugin (QPP)" interface
that allows for interactions between TCG plugins. The goal of this
interface is to enable plugins to expand on other plugins and reduce
code duplication. This patch series includes documentation and
significant comments, but a high-level summary is below along with a
discussion of the current implementation as well as the benefits and
drawbacks of these changes.

**Summary**

The QPP interface allows two types of interactions between plugins:

1) Exported functions: A plugin may wish to allow other plugins to call
one of the functions it has defined. To do this, the plugin must mark
the function definition as publicly visible with the QEMU_PLUGIN_EXPORT
macro and place a definition in an included header file using the
QPP_FUN_PROTOTYPE macro. Other plugins can then include this header and
call the exported function by combining the name of the target plugin
with the name of the exported function.

For example, consider a hypothetical plugin that collects a list of
cache misses. This plugin could export two functions using the QPP
interface: one to allow another plugin to query this list and another
to empty the list. This would enable the development of another plugin
that examines guest CPU state to identify process changes and reports
the cache misses per process. With the QPP interface, this second plugin
would not need to duplicate any logic from the first.

2) Callbacks: Multiple plugins may wish to take some action when some
event of interest occurs inside a running guest. To support modularity
and reduce code duplication, the QPP callback system allows this logic
to be contained in single plugin that detects whenever a given event
occurs and exposes a callback with a given name. Another plugin can then
request to have one of its own functions run whenever this event occurs.
Additional plugins could also use this same callback to run additional
logic whenever this event occurs.

For example, consider (again) a hypothetical plugin that detects when
the current guest process changes by analyzing the guest CPU state. This
plugin could define a callback named "on_process_change" and trigger
this callback event whenever it detects a process change. Other plugins
could then be developed that take various actions on process changes by
registering internal functions to run on this event.

These patches and examples are inspired by the PANDA project
(https://panda.re and https://github.com/panda-re/panda), a fork of QEMU
modified to support dynamic program analysis and reverse engineering.
PANDA also includes a large plugin system with a similar interface for
interactions between plugins. I'm one of the maintainers of PANDA
and have seen how the ability for plugins to interact with
other plugins reduces code duplication and enables the creation of many
useful plugins.


**Implementation Overview**

These patches modify the TCG plugin build system to define the 
preprocessor variable CURRENT_PLUGIN to the name of the current plugin
based off its filename. This can be useful for plugin developers in
general and is used internally in the QPP implementation to determine
if an exported plugin function is defined in the current plugin or
in another.

These patches also add the function qemu_plugin_name_to_handle to the 
core plugin API which uses the new internal function is_plugin_named.
The ability for plugins to get a handle to another plugin is necessary
for the inter-plugin interactions described below.

The QPP implementation is contained inside a header file plugin-qpp.h
that adds the macros QPP_CREATE_CB, QPP_RUN_CB, QPP_REG_CB,
QPP_REMOVE_CB, and QPP_FUN_PROTOTYPE. The first 4 of these are related
to the callback system and the last one is for exported functions.

The QPP_CREATE_CB macro is used by a plugin that wishes to create a
callback with a given name. The macro will create an array of function
pointers for every function that has been registered to run on this
callback event. Other plugins can register a local function
with this callback (i.e., add it to this list of function pointers)
or remove a previously-registered function using QPP_REG_CB or
QPP_REMOVE_CB, respectively. When a plugin wishes to run all the
registered callback functions for a given callback, it uses the
QPP_RUN_CB macro.

The QPP_FUN_PROTOYPE macro enables a plugin to expose a function
it defines to other plugins. This macro is used in a header file that
is included by both the plugin that defines a function as well as
plugins that wish to use the function. This prototype creates a 
constructor function that runs on plugin load. If the target plugin
name differs from the value of CURRENT_PLUGIN, this function
will use qemu_plugin_name_to_handle to get a handle to the target
plugin and use g_module_symbol to resolve the target function in
that plugin. If this fails, it will print a warning and abort.

Finally, these patches include an example pair of plugins, qpp_srv and
qpp_client. The former provides a trivial QPP callback which simply runs
when the plugin is unloaded as well as two functions to add and subtract
integers. The latter of these plugins registers a function to run
on this callback and uses the two exported functions.


**Request for Comments**

This is my first time proposing any patches to QEMU and these are some
non-trivial changes, so I wanted to ask for feedback as opposed to just
sending these as a patch. I hope that others agree that there's value
in supporting interactions between plugins (particularly inter-plugin
callbacks), but I know there are many ways this could be implemented
and I'm sure there are ways this could be improved.

My goal in this design was to keep the process of creating and using
callbacks and exported functions as easy as possible for plugin
developers. I'm open to redesigning this interface in
a completely different way if that would be necessary to get it merged.

Although the example plugins I've included for now are trivial, if this
interface is merged I'd be willing to develop some more plugins that
build atop it.  One of these could be something like the "syscalls2"
plugin in PANDA which analyzes guest code and provides distinct
callbacks for when a guest runs a system call:
https://github.com/panda-re/panda/blob/dev/panda/plugins/syscalls2.
Another could be something like the "callstack_isntr" plugin in PANDA
which manages a shadow stack, provides callbacks on function calls and
returns and also provides exported functions to get the current
callstack:
https://github.com/panda-re/panda/tree/dev/panda/plugins/callstack_instr


I see a handful of potential issues that I'll highlight below:
1) Unstable APIs: these inter-plugin interactions do not specify API
   versions. If the behavior of a callback or exported function
   changes without the type signature changing, it may lead to subtle
   errors in other (unchanged) plugins that were using these functions.

   If the signature of a plugin's callback or exported function, 
   changes, build time errors would be raised and necessary
   changes could be made to in-tree plugins. However, out-of-tree
   plugins would break.

2) Checkpatch.pl objects to some of these changes. Most importantly,
   it takes issue with QPP_FUN_PROTOTYPE introducing multiple
   statements outside of a do while loop. I believe the logic in this
   macro cannot be wrapped in such a way as it is defining variables
   that must be available outside of the scope of the macro (in
   particular, these variables must be used by other QPP macros later).

   Given that this logic is contained in a plugin instead of the main
   QEMU binary, I'm hoping there's some leeway with this error, but
   if it needs to be changed, I could split the logic into 5 distinct
   macros that a plugin developer would then run in order. Or perhaps
   someone here can suggest a better design.

   Additional, I believe the script is raising a number of false
   positive errors for the indentation of the multi-line macros, e.g.,
   "suspect code indent for conditional statements (4, 6)" for
   QPP_RUN_CB. If I'm wrong about this, I'm happy to adjust the
   indentation. If it is an issue with the script, I could open a bug
   report if that would help.

3) Decentralized interactions. This approach allows plugins to directly
   interact with other plugins. An alternative design could register
   exported functions and callbacks with the core plugin logic in 
   the main QEMU object and have all the interactions go through there.
   Would a centralized design where plugins send requests through
   the core plugin logic in the QEMU binary be better that allowing
   direct interactions between the shared objects built for the plugins?

Does it seem like an interface like this would be worth merging? If so,
I'd welcome any and all suggestions on how to improve these changes.

Thank you,
Andrew Fasano

Andrew Fasano (4):
  docs/tcg-plugins: describe QPP API
  tcg/plugins: Automatically define CURRENT_PLUGIN
  tcg/plugins: Support for inter-plugin interactions
  tcg/plugins: Add example pair of QPP plugins

 contrib/plugins/Makefile     |   4 +-
 contrib/plugins/qpp_client.c |  42 ++++++
 contrib/plugins/qpp_client.h |   1 +
 contrib/plugins/qpp_srv.c    |  33 +++++
 contrib/plugins/qpp_srv.h    |  17 +++
 docs/devel/tcg-plugins.rst   |  76 +++++++++++
 include/qemu/plugin-qpp.h    | 252 +++++++++++++++++++++++++++++++++++
 plugins/core.c               |  11 ++
 plugins/loader.c             |  24 ++++
 plugins/plugin.h             |   5 +
 plugins/qemu-plugins.symbols |   1 +
 11 files changed, 465 insertions(+), 1 deletion(-)
 create mode 100644 contrib/plugins/qpp_client.c
 create mode 100644 contrib/plugins/qpp_client.h
 create mode 100644 contrib/plugins/qpp_srv.c
 create mode 100644 contrib/plugins/qpp_srv.h
 create mode 100644 include/qemu/plugin-qpp.h

-- 
2.34.1


