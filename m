Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB4B69B28
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jul 2019 21:10:30 +0200 (CEST)
Received: from localhost ([::1]:41998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hn6Mn-0002Ad-CC
	for lists+qemu-devel@lfdr.de; Mon, 15 Jul 2019 15:10:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39389)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <marcandre.lureau@redhat.com>) id 1hn6Mb-0001ed-4s
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 15:10:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1hn6MZ-0002b5-Qx
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 15:10:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46462)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1hn6MZ-0002Zn-Iq
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 15:10:15 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DD4F43082A9A;
 Mon, 15 Jul 2019 19:10:13 +0000 (UTC)
Received: from localhost (ovpn-112-18.ams2.redhat.com [10.36.112.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 25E3C600C1;
 Mon, 15 Jul 2019 19:10:04 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 15 Jul 2019 23:09:41 +0400
Message-Id: <20190715191001.1188-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Mon, 15 Jul 2019 19:10:13 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v5 00/20] monitor: add asynchronous command type
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
Cc: Markus Armbruster <armbru@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

HMP and QMP commands are handled synchronously in qemu today. But
there are benefits allowing the command handler to re-enter the main
loop if the command cannot be handled synchronously, or if it is
long-lasting. Some bugs such as rhbz#1230527 are difficult to solve
without it.

The common solution is to use a pair of command+event in this case.
But this approach has a number of issues:
- you can't "fix" an existing command: you need a new API, and ad-hoc
  documentation for that command+signal association, and old/broken
  command deprecation
- since the reply event is broadcasted and 'id' is used for matching the
  request, it may conflict with other clients request 'id' space
- it is arguably less efficient and elegant (weird API, useless return
  in most cases, broadcast reply, no cancelling on disconnect etc)

The following series implements an async command solution instead. By
introducing a session context and a command return handler, it can:
- defer the return, allowing the mainloop to reenter
- return only to the caller (instead of broadcast events for reply)
- optionnally allow cancellation when the client is gone
- track on-going qapi command(s) per client/session

and without introduction of new QMP APIs or client visible change.

Existing qemu commands can be gradually replaced by async:true
variants when needed, while carefully reviewing the concurrency
aspects. The async:true commands marshaller helpers are splitted in
half, the calling and return functions. The command is called with a
QmpReturn context, that can return immediately or later, using the
generated return helper, which allows for a step-by-step conversion.

The screendump command is converted to an async:true version to solve
rhbz#1230527. The command shows basic cancellation (this could be
extended if needed). It could be further improved to do asynchronous
IO writes as well.

v5:
- rebased

v4:
- rebased, mostly adapting to new OOB code
  (there was not much feedback in v3 for the async command part,
   but preliminary patches got merged!)
- drop the RFC status

v3:
- complete rework, dropping the asynchronous commands visibility from
  the protocol side entirely (until there is a real need for it)
- rebased, with a few preliminary cleanup patches
- teach asynchronous commands to HMP

v2:
- documentation fixes and improvements
- fix calling async commands sync without id
- fix bad hmp monitor assert
- add a few extra asserts
- add async with no-id failure and screendump test

Marc-Andr=C3=A9 Lureau (20):
  qmp: constify QmpCommand and list
  json-lexer: make it safe to call destroy multiple times
  qmp: add QmpSession
  QmpSession: add a return callback
  QmpSession: add json parser and use it in qga
  monitor: use qmp session to parse json feed
  qga: simplify dispatch_return_cb
  QmpSession: introduce QmpReturn
  qmp: simplify qmp_return_error()
  QmpSession: keep a queue of pending commands
  QmpSession: return orderly
  qmp: introduce asynchronous command type
  scripts: learn 'async' qapi commands
  qmp: add qmp_return_is_cancelled()
  monitor: add qmp_return_get_monitor()
  console: add graphic_hw_update_done()
  console: make screendump asynchronous
  monitor: start making qmp_human_monitor_command() asynchronous
  monitor: teach HMP about asynchronous commands
  hmp: call the asynchronous QMP screendump to fix outdated/glitches

 hmp-commands.hx                         |   3 +-
 hw/display/qxl-render.c                 |   9 +-
 hw/display/qxl.c                        |   1 +
 include/monitor/monitor.h               |   3 +
 include/qapi/qmp/dispatch.h             |  89 +++++++++-
 include/qapi/qmp/json-parser.h          |   7 +-
 include/ui/console.h                    |   4 +
 monitor/hmp-cmds.c                      |   6 +-
 monitor/hmp.c                           | 110 +++++++++++-
 monitor/misc.c                          |  46 +----
 monitor/monitor-internal.h              |  12 +-
 monitor/monitor.c                       |   2 +-
 monitor/qmp.c                           |  79 ++++-----
 qapi/misc.json                          |   3 +-
 qapi/qmp-dispatch.c                     | 214 +++++++++++++++++++-----
 qapi/qmp-registry.c                     |  33 +++-
 qapi/ui.json                            |   3 +-
 qga/commands.c                          |   2 +-
 qga/main.c                              |  51 ++----
 qobject/json-lexer.c                    |   5 +-
 qobject/json-streamer.c                 |   3 +-
 scripts/qapi/commands.py                | 151 ++++++++++++++---
 scripts/qapi/common.py                  |  15 +-
 scripts/qapi/doc.py                     |   3 +-
 scripts/qapi/introspect.py              |   3 +-
 tests/qapi-schema/qapi-schema-test.json |   5 +
 tests/qapi-schema/qapi-schema-test.out  |   8 +
 tests/qapi-schema/test-qapi.py          |   8 +-
 tests/test-qmp-cmds.c                   | 206 +++++++++++++++++++----
 ui/console.c                            | 100 +++++++++--
 30 files changed, 908 insertions(+), 276 deletions(-)

--=20
2.22.0.428.g6d5b264208


