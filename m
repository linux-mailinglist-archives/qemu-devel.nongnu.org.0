Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3AF3DF4C9
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 20:34:32 +0200 (CEST)
Received: from localhost ([::1]:49794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAzFH-0004Sj-03
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 14:34:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mAzAt-0004JB-AN
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 14:29:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mAzAp-0005rd-AA
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 14:29:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628015393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Q9EC2zoy+V8X3gjx11JlYajwbStaHivHGrxsVVkzjAw=;
 b=T8jvoKKyVSlh9cN/rM7YyVUGaksq+DEjJgGevUM/5nwxcuvzsR+J0XMz47/lWm6STkDIY7
 31/j/PtNkFvOQvDQu5Bqu6O1w0qsK4cXOeqM6XcPgNUSP9R80e4ECvliA5y2i9brmwgt8I
 P+JhDM5tW0Z8u3C9dqhTgKpsjzZLQ0g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-DwLRuDWjPZeby0IOawA7WA-1; Tue, 03 Aug 2021 14:29:51 -0400
X-MC-Unique: DwLRuDWjPZeby0IOawA7WA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BBBD4802CBF;
 Tue,  3 Aug 2021 18:29:50 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F083860854;
 Tue,  3 Aug 2021 18:29:41 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/25] python: introduce Asynchronous QMP package
Date: Tue,  3 Aug 2021 14:29:16 -0400
Message-Id: <20210803182941.504537-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Willian Rampazzo <wrampazz@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Niteesh G . S ." <niteesh.gs@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GitLab: https://gitlab.com/jsnow/qemu/-/commits/python-async-qmp-aqmp=0D
CI: https://gitlab.com/jsnow/qemu/-/pipelines/347375602=0D
Docs: https://people.redhat.com/~jsnow/sphinx/html/qemu.aqmp.html=0D
=0D
Hi!=0D
=0D
This patch series adds an Asynchronous QMP package to the Python=0D
library. It offers a few improvements over the previous library:=0D
=0D
- out-of-band support=0D
- true asynchronous event support=0D
- avoids undocumented interfaces abusing non-blocking sockets=0D
- unit tests!=0D
- documentation!=0D
=0D
This library serves as the basis for a new qmp-shell program that will=0D
offer improved reconnection support, true asynchronous display of=0D
events, VM and job status update notifiers, and so on.=0D
=0D
My intent is to eventually publish this library directly to PyPI as a=0D
standalone package. I would like to phase out our usage of the old QMP=0D
library over time; eventually replacing it entirely with this=0D
one. (Since v2 of this series, I have authored a compatibility shim not=0D
included in this series that can be used to run all of iotests on this=0D
new library successfully with very minimal churn.)=0D
=0D
This series looks big by line count, but it's *mostly*=0D
docstrings. Seriously!=0D
=0D
This package has *no* external dependencies whatsoever.=0D
=0D
Notes & Design=0D
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0D
=0D
Here are some notes on the design of how the library works, to serve as=0D
a primer for review; however I also **highly recommend** browsing the=0D
generated Sphinx documentation for this series.=0D
=0D
Here's that link again:=0D
https://people.redhat.com/~jsnow/sphinx/html/qemu.aqmp.html=0D
=0D
The core machinery is split between the AsyncProtocol and QMPClient=0D
classes. AsyncProtocol provides the generic machinery, while QMPClient=0D
provides the QMP-specific details.=0D
=0D
The design uses two independent coroutines that act as the "bottom=0D
half", a writer task and a reader task. These tasks run for the duration=0D
of the connection and independently send and receive messages,=0D
respectively.=0D
=0D
A third task, disconnect, is scheduled asynchronously whenever an=0D
unrecoverable error occurs and facilitates coalescing of the other two=0D
tasks.=0D
=0D
This diagram for how execute() operates may be helpful for understanding=0D
how AsyncProtocol is laid out. The arrows indicate the direction of a=0D
QMP message; the long horizontal dash indicates the separation between=0D
the upper and lower halves of the event loop. The queue mechanisms=0D
between both dashes serve as the intermediaries between the upper and=0D
lower halves.=0D
=0D
                       +---------+=0D
                       | caller  |=0D
                       +---------+=0D
                           ^ |=0D
                           | v=0D
                       +---------+=0D
     +---------------> |execute()| -----------+=0D
     |                 +---------+            |=0D
     |                                        |=0D
[-----------------------------------------------------------]=0D
     |                                        |=0D
     |                                        v=0D
+----+------+    +----------------+    +------+-------+=0D
| ExecQueue |    | EventListeners |    |Outbound Queue|=0D
+----+------+    +----+-----------+    +------+-------+=0D
     ^                ^                       |=0D
     |                |                       |=0D
[-----------------------------------------------------------]=0D
     |                |                       |=0D
     |                |                       v=0D
  +--+----------------+---+       +-----------+-----------+=0D
  | Reader Task/Coroutine |       | Writer Task/Coroutine |=0D
  +-----------+-----------+       +-----------+-----------+=0D
              ^                               |=0D
              |                               v=0D
        +-----+------+                  +-----+------+=0D
        |StreamReader|                  |StreamWriter|=0D
        +------------+                  +------------+=0D
=0D
The caller will invoke execute(), which in turn will deposit a message=0D
in the outbound send queue. This will wake up the writer task, which=0D
well send the message over the wire.=0D
=0D
The execute() method will then yield to wait for a reply delivered to an=0D
execution queue created solely for that execute statement.=0D
=0D
When a message arrives, the Reader task will unblock and route the=0D
message either to the EventListener subsystem, or place it in the=0D
appropriate pending execution queue.=0D
=0D
Once a message is placed in the pending execution queue, execute() will=0D
unblock and the execution will conclude, returning the result of the RPC=0D
call to the caller.=0D
=0D
Patch Layout=0D
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0D
=0D
Patches 1-4   add tiny pre-requisites, utilities, etc.=0D
Patches 5-12  add a generic async message-based protocol class,=0D
              AsyncProtocol. They are split fairly small and should=0D
              be reasonably self-contained.=0D
Patches 13-15 check in more QMP-centric components.=0D
Patches 16-21 add qmp_client.py, with a new 'QMPClient()' class.=0D
              They're split into reasonably tiny pieces here.=0D
Patches 22-23 add a few finishing touches, they are small patches.=0D
Patches 24-25 adds unit tests. They're a little messy still, but=0D
              they've been quite helpful to me so far. Coverage of=0D
              protocol.py is at about ~86%.=0D
=0D
Future Work=0D
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0D
=0D
These items are in progress:=0D
=0D
- A synchronous QMP wrapper that allows this library to be easily used=0D
  from non-async code; this will also allow me to prove it works well by=0D
  demoing its replacement throughout iotests.=0D
=0D
  This work is feature-complete, but needs polish. All of iotests is now=0D
  passing with Async QMP and this Sync wrapper. This will be its own=0D
  follow-up series.=0D
=0D
- A QMP server class; to facilitate writing of unit tests. An early=0D
  version is done, but possibly not feature complete. More polish and=0D
  tests are warranted. This will be its own follow-up series.=0D
=0D
- More unit tests for qmp_client.py, qmp_server.py and other modules.=0D
=0D
Changelog=0D
=3D=3D=3D=3D=3D=3D=3D=3D=3D=0D
=0D
V3:=0D
=0D
- (02, 05) Typo fixes (Eric Blake)=0D
- (04) Rewrote the "wait_closed" compatibility function for Python 3.6;=0D
  the older version raised unwanted exceptions in error pathways.=0D
  (Niteesh)=0D
- (04, 05, 06, 08) Rewrote _bh_disconnect fairly substantially again;=0D
  the problem is that exceptions can surface during both flushing of the=0D
  stream and when waiting for the stream to close. These errors can be=0D
  new, primary causes of failure or secondary failures. Distinguishing=0D
  between them is tricky. The new disconnection method takes much=0D
  greater pains to ensure that even if Exceptions occur, disconnect=0D
  *will* complete. This adds robustness to cases exposed by iotests=0D
  where one or more endpoints might segfault or abort and cleanup can be=0D
  challenged.=0D
- (11) Fixed logging hook names (Niteesh)=0D
- (24, 25) Bumped avocado dependency to v90; It added support for async=0D
  test functions which made my prior workaround non-suitable. The=0D
  choices were to mandate <90 and keep the workarounds or mandate >=3D90=0D
  and drop the workarounds. I went with the latter.=0D
=0D
V2:=0D
=0D
Renamed classes/methods:=0D
=0D
- Renamed qmp_protocol.py to qmp_client.py=0D
- Renamed 'QMP' class to 'QMPClient'=0D
- Renamed _begin_new_session() to _establish_session()=0D
- Split _establish_connection() out from _new_session().=0D
- Removed _results() method=0D
=0D
Bugfixes:=0D
=0D
- Suppress duplicate Exceptions when attempting to drain the=0D
  StreamWriter=0D
- Delay initialization of asyncio.Queue and asyncio.Event variables to=0D
  _new_session or later -- they must not be created outside of the loop,=0D
  even if they are not async functions.=0D
- Rework runstate_changed events to guarantee visibility of events to=0D
  waiters=0D
- Improve connect()/accept() cleanup to work with=0D
  asyncio.CancelledError, asyncio.TimeoutError=0D
- No-argument form of Message() now succeeds properly.=0D
- flush utility will correctly yield when data is below the "high water=0D
  mark", giving the stream a chance to actually flush.=0D
- Increase read buffer size to accommodate query-qmp-schema (Thanks=0D
  Niteesh)=0D
=0D
Ugly bits from V1 removed:=0D
=0D
- Remove tertiary filtering from EventListener (for now), accompanying=0D
  documentation removed from events.py=0D
- Use asyncio.wait() instead of custom wait_task_done()=0D
- MultiException is removed in favor of just raising the first Exception=0D
  that occurs in the bottom half; other Exceptions if any are logged=0D
  instead.=0D
=0D
Improvements:=0D
=0D
- QMPClient now allows ID-less execution statements via the _raw()=0D
  interface.=0D
- Add tests that grant ~86% coverage of protocol.py to the avocado test=0D
  suite.=0D
- Removed 'force' parameter from _bh_disconnect; the disconnection=0D
  routine determines for itself if we are in the error pathway or not=0D
  instead now.  This removes any chance of duplicate calls to=0D
  _schedule_disconnect accidentally dropping the 'force' setting.=0D
=0D
Debugging/Testing changes:=0D
=0D
- Add debug: bool parameter to asyncio_run utility wrapper=0D
- Improve error messages for '@require' decorator=0D
- Add debugging message for state change events=0D
- Avoid flushing the StreamWriter if we don't have one (This=0D
  circumstance only arises in testing, but it's helpful.)=0D
- Improved __repr__ method for AsyncProtocol, and removed __str__=0D
  method.  enforcing eval(__repr__(x)) =3D=3D x does not make sense for=0D
  AsyncProtocol.=0D
- Misc logging message changes=0D
- Add a suite of fancy Task debugging utilities.=0D
- Most tracebacks now log at the DEBUG level instead of=0D
  CRITICAL/ERROR/WARNING; In those error cases, a one-line summary is=0D
  logged instead.=0D
=0D
Misc. aesthetic changes:=0D
=0D
- Misc docstring fixes, whitespace, etc.=0D
- Reordered the definition of some methods to try and keep similar=0D
  methods near each other (Moved _cleanup near _bh_disconnect in=0D
  QMPClient.)=0D
=0D
John Snow (25):=0D
  python/aqmp: add asynchronous QMP (AQMP) subpackage=0D
  python/aqmp: add error classes=0D
  python/pylint: Add exception for TypeVar names ('T')=0D
  python/aqmp: add asyncio compatibility wrappers=0D
  python/aqmp: add generic async message-based protocol support=0D
  python/aqmp: add runstate state machine to AsyncProtocol=0D
  python/aqmp: Add logging utility helpers=0D
  python/aqmp: add logging to AsyncProtocol=0D
  python/aqmp: add AsyncProtocol.accept() method=0D
  python/aqmp: add configurable read buffer limit=0D
  python/aqmp: add _cb_inbound and _cb_outbound logging hooks=0D
  python/aqmp: add AsyncProtocol._readline() method=0D
  python/aqmp: add QMP Message format=0D
  python/aqmp: add well-known QMP object models=0D
  python/aqmp: add QMP event support=0D
  python/pylint: disable too-many-function-args=0D
  python/aqmp: add QMP protocol support=0D
  python/pylint: disable no-member check=0D
  python/aqmp: Add message routing to QMP protocol=0D
  python/aqmp: add execute() interfaces=0D
  python/aqmp: add _raw() execution interface=0D
  python/aqmp: add asyncio_run compatibility wrapper=0D
  python/aqmp: add scary message=0D
  python: bump avocado to v90.0=0D
  python/aqmp: add AsyncProtocol unit tests=0D
=0D
 python/Pipfile.lock            |   8 +-=0D
 python/qemu/aqmp/__init__.py   |  59 +++=0D
 python/qemu/aqmp/error.py      |  50 ++=0D
 python/qemu/aqmp/events.py     | 706 ++++++++++++++++++++++++++=0D
 python/qemu/aqmp/message.py    | 209 ++++++++=0D
 python/qemu/aqmp/models.py     | 133 +++++=0D
 python/qemu/aqmp/protocol.py   | 902 +++++++++++++++++++++++++++++++++=0D
 python/qemu/aqmp/py.typed      |   0=0D
 python/qemu/aqmp/qmp_client.py | 621 +++++++++++++++++++++++=0D
 python/qemu/aqmp/util.py       | 217 ++++++++=0D
 python/setup.cfg               |   7 +-=0D
 python/tests/null_proto.py     |  70 +++=0D
 python/tests/protocol.py       | 535 +++++++++++++++++++=0D
 13 files changed, 3511 insertions(+), 6 deletions(-)=0D
 create mode 100644 python/qemu/aqmp/__init__.py=0D
 create mode 100644 python/qemu/aqmp/error.py=0D
 create mode 100644 python/qemu/aqmp/events.py=0D
 create mode 100644 python/qemu/aqmp/message.py=0D
 create mode 100644 python/qemu/aqmp/models.py=0D
 create mode 100644 python/qemu/aqmp/protocol.py=0D
 create mode 100644 python/qemu/aqmp/py.typed=0D
 create mode 100644 python/qemu/aqmp/qmp_client.py=0D
 create mode 100644 python/qemu/aqmp/util.py=0D
 create mode 100644 python/tests/null_proto.py=0D
 create mode 100644 python/tests/protocol.py=0D
=0D
--=20=0D
2.31.1=0D
=0D


