Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3089064BEA6
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 22:41:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Czm-0000QN-QO; Tue, 13 Dec 2022 16:39:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fasano@mit.edu>) id 1p5CzZ-0000I2-OL
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:39:14 -0500
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fasano@mit.edu>) id 1p5CzX-0007fa-6v
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:39:13 -0500
Received: from panda194.. ([18.4.85.108]) (authenticated bits=0)
 (User authenticated as fasano@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 2BDLcaP7030603
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Dec 2022 16:38:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
 t=1670967531; bh=r+FNo7P7InQddtmCHLn6F7XEA+Md0fRgnWXGFCYk4Xc=;
 h=From:To:Cc:Subject:Date;
 b=gbRv/Jkpf86KAhE/O37RFa5XECINEkx8UHYq3W9jAiudVEzP3xlsEUgLlP5R54Pg3
 zOz1NnqMRLfkfzndanYwjTLfK4ztgQaTo4DXVWvg6FsUhy0XbuL2VC5eI/cqJAAfkd
 yba4r01slA6U3gv1R7pAO0NHGxAiZm/XGV8gSH31ACci+9tYSDmK6vHMsIqK0WNODx
 BY8Imx5Pn5ImUDsrX2f14RTMZ7zOmrnSpLID63p0fSL6XT2AKuZYWijGAlu1nIlaFg
 ummgs3V6LBWQb6Jh9RmYD/9bIBqAHDYfCLoGVtzYSnU5pj7XVoENTKA+noS7/RuTXQ
 0yKK4EJxEedtw==
From: Andrew Fasano <fasano@mit.edu>
To: qemu-devel@nongnu.org
Cc: elysia.witham@ll.mit.edu, alex.bennee@linaro.org, erdnaxe@crans.org,
 ma.mandourr@gmail.com, Andrew Fasano <fasano@mit.edu>
Subject: [PATCH 0/8] Inter-plugin interactions with QPP 
Date: Tue, 13 Dec 2022 16:37:49 -0500
Message-Id: <20221213213757.4123265-1-fasano@mit.edu>
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

Hello,

This is a series of patches expanding the TCG plugin system to add what we're
calling the "QEMU Plugin-to-Plugin (QPP)" interface that allows for
interactions between TCG plugins. This is a follow up to the Sept 1 2022 RFC
"Support interactions between TCG plugins." The goal of this interface is to
enable plugins to expand on other plugins and reduce code duplication. This
patch series includes documentation, tests and commented code, but a
high-level summary is below along with a discussion of the current
implementation, how it would affect plugin developers, and a summary of the
changes since the original RFC.

**Summary**
The QPP interface allows two types of interactions between plugins:
1) Exported functions: A plugin may wish to allow other plugins to call
one of the functions it has defined. To do this, the plugin must mark
the function definition as publicly visible with the QEMU_PLUGIN_EXPORT
macro and place a definition in an included header file using the
QPP_FUN_PROTOTYPE macro. Other plugins can then include this header and
call the exported function by combining the name of the target plugin
with the name of the exported function and "_qpp" at the end.
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
interactions between plugins. We are a part of the PANDA team and have
seen how the ability for plugins to interact with other plugins reduces
code duplication and enables the creation of many useful plugins.

**Implementation Overview**
These patches increment the TCG plugin version from 1 to 2 and require
plugins of v2 or greater to specify a plugin name. During plugin load, an
error is raised if two plugins are loaded that use the same name.
Using these unique names, plugins can import functions from other
plugins and register local functions to be run on callback events
managed by other plugins. To accomplish this, these patches add
the following functions to the core plugin code:
 - qemu_plugin_import_function: this is used by the QPP_FUN_PROTOTYPE
   macro to find and resolve the handle of the function to be
   imported given the target plugin name and function name.
 - qemu_plugin_create_callback: this can be called by plugins to
   create a new callback using the unique plugin id and the callback
   name.
 - qemu_plugin_run_callback: this is called by plugins to define when
   registered callback functions get run for the named callback and
   specify the args that are passed to those functions.
 - qemu_plugin_reg_callback: this can be used by plugins to register
   functions on another plugin's defined callback.
 - qemu_plugin_unreg_callback: this removes a previously registered
   function from the callback's list of registered functions if it
   exists there.

The QPP implementation is mostly contained within the api, but we
did add a helpful macro for qemu_plugin_import_function inside a
header file plugin-qpp.h called QPP_FUN_PROTOTYPE. This macro
must be used after defining the qemu_plugin_name variable (would
love to change this part of the design if anyone has better ideas).

The QPP_FUN_PROTOYPE macro enables a plugin to expose a function
it defines to other plugins. This macro enables a plugin to provide a single
header file that both defines the exported functions for the plugin
that provides them as well as providing a definition and auto-resolving the
function pointers for other plugins that wish to call them. This macro is used
in a header file that is included by both the plugin that defines a function as
well as plugins that wish to use the function. This prototype creates a
constructor function that runs on plugin load. If the target plugin
name differs from the value of the current plugin name, this function
will use qemu_plugin_import_function to resolve the target function in
that plugin. If this fails, it will print a warning and abort.

Finally, these patches include a pair of test plugins, qpp_srv and
qpp_client. The former provides a trivial QPP callback which simply runs
when the plugin is unloaded as well as two functions to add and subtract
integers. The latter of these plugins registers a function to run
on this callback and uses the two exported functions. These plugins are
found in tests/plugin_qpp and have been integrated into the make check-tcg
tests.

**Changes Since the 9/1/22 RFC**
Based on the feedback we received from Alex, we changed our design to use
the QEMU plugin APIs instead of allowing plugins to directly dlopen and
interact with one another.
We bumped the QPP version number and mandated that developers specify a unique
name for each plugin instead of using the source filenames as the plugin names.
We moved our pair of example plugins to the tests directory and configured
them to be run and tested as part of the check-tcg tests.

**Next steps**
We are working on building some more useful example plugins that builds on this
API. Pending feedback on this patch series, we would be happy to either merge
these API changes on their own or hold off until such these example plugins
are ready.

We have developed some plugins already, but our initial examples depend on
some poorly-written APIs we've added to access guest registers and memory.
Those APIs aren't ready for upstreaming yet, which is why we aren't including
those patches and example plugins in this patch series. However the code is
available in our tree if anyone is interested:
  - Register accessing: https://github.com/panda-re/qemu/commit/b97c5a56edd0ba3b5f6ab16bf531ac1f7abaac04
  - Memory accessing: https://github.com/panda-re/qemu/commit/dba9d1ceffeeeddf2b5232d64ca97147a4f5a3a5

Using the QPP system from this patch series and the ability to access guest
registers and memory, we developed have a set of three of plugins that provide
OS introspection, syscall detection, and logging such that on every system
call in a Linux guest we can record the system call number and
information on the current running process. These generate output like:
  Syscall at pc 7f0b815478cd: number 3: Process 'init', pid 211, ppid 1
  Syscall at pc 7fff775feb58: number 228: Process 'systemd-udevd', pid 137, ppid 1

As our register and memory access APIs aren't yet ready to merge, we
haven't included these plugins as a part of this patch series, but their
code is also available in our tree:
  - Linux OS Introspection: https://github.com/panda-re/qemu/blob/ppp_beta_with_plugins/contrib/plugins/osi_linux/
  - Syscall detection: https://github.com/panda-re/qemu/blob/ppp_beta_with_plugins/contrib/plugins/syscalls.c
  - Syscall logging with process details: https://github.com/panda-re/qemu/blob/ppp_beta_with_plugins/contrib/plugins/syscalls_logger.c

We plan to explore integrating this with qemu's existing user-mode syscall
tracing system and would love to eventually merge these plugins if there's
interest and the necessary APIs (QPP + register/memory access) become
available.

We welcome any feedback for this patch series and the next steps we're
interested in pursuing.
Thank you,
Andrew Fasano & Elysia Witham

Elysia Witham (8):
  docs/devel: describe QPP API
  plugins: version 2, require unique plugin names
  plugins: add id_to_plugin_name
  plugins: add core API functions for QPP callbacks
  plugins: implement QPP callbacks
  plugins: implement QPP import function
  include/qemu: added macro for QPP import function
  tests: build and run QPP tests

 docs/devel/tcg-plugins.rst                |  91 ++++++++++++++-
 include/qemu/plugin-qpp.h                 |  54 +++++++++
 include/qemu/qemu-plugin.h                |  68 ++++++++++-
 plugins/api.c                             | 132 ++++++++++++++++++++++
 plugins/core.c                            |  47 ++++++++
 plugins/loader.c                          |  61 +++++++++-
 plugins/plugin.h                          |  24 ++++
 plugins/qemu-plugins.symbols              |   5 +
 tests/Makefile.include                    |   2 +-
 tests/meson.build                         |   1 +
 tests/plugin/bb.c                         |   1 +
 tests/plugin/empty.c                      |   1 +
 tests/plugin/insn.c                       |   1 +
 tests/plugin/mem.c                        |   1 +
 tests/plugin/syscall.c                    |   1 +
 tests/plugin_qpp/meson.build              |   7 ++
 tests/plugin_qpp/qpp_client.c             |  32 ++++++
 tests/plugin_qpp/qpp_srv.c                |  37 ++++++
 tests/plugin_qpp/qpp_srv.h                |  12 ++
 tests/tcg/Makefile.target                 |  29 +++++
 tests/tcg/aarch64/Makefile.softmmu-target |   2 +
 tests/tcg/arm/Makefile.softmmu-target     |   1 +
 tests/tcg/arm/Makefile.target             |   2 +
 tests/tcg/multiarch/Makefile.target       |   2 +
 24 files changed, 605 insertions(+), 9 deletions(-)
 create mode 100644 include/qemu/plugin-qpp.h
 create mode 100644 tests/plugin_qpp/meson.build
 create mode 100644 tests/plugin_qpp/qpp_client.c
 create mode 100644 tests/plugin_qpp/qpp_srv.c
 create mode 100644 tests/plugin_qpp/qpp_srv.h

-- 
2.34.1


