Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 289633B8CCF
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 06:15:01 +0200 (CEST)
Received: from localhost ([::1]:40430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyo6N-0002Pv-Nj
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 00:14:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lyo4w-0008C8-2x
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 00:13:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lyo4t-0000ZW-0H
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 00:13:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625112804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cL7i5NZP5Udpu6OSOAfTtxf6q96tQZUE6D8xT1Aw7gA=;
 b=eAh860alSmV+5R3FZo19gqcxTD2+dMs1mZVbziDT5A6wbyztBojiBYOjbi7CX7iNETINm8
 Dny2LxoKilLh4A7a10xAW0PHwmeSc1cxI4POiM3878i6jsInF7j7CCZyxleVIxVSBXVMgk
 27KGNJwXRiQWacs27dQo7+m0hhu8wOA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-dPA2qvbqOxaMs4kS41rrHA-1; Thu, 01 Jul 2021 00:13:22 -0400
X-MC-Unique: dPA2qvbqOxaMs4kS41rrHA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A04D280415A;
 Thu,  1 Jul 2021 04:13:21 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-71.rdu2.redhat.com [10.10.118.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B712604CC;
 Thu,  1 Jul 2021 04:13:14 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/20] python: introduce Asynchronous QMP package
Date: Thu,  1 Jul 2021 00:12:53 -0400
Message-Id: <20210701041313.1696009-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Eric Blake <eblake@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Niteesh G . S ." <niteesh.gs@gmail.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GitLab: https://gitlab.com/jsnow/qemu/-/commits/python-async-qmp-aqmp=0D
CI: https://gitlab.com/jsnow/qemu/-/pipelines/330003554=0D
Docs: https://people.redhat.com/~jsnow/sphinx/html/qemu.aqmp.html=0D
Based-on: <20210701020921.1679468-1-jsnow@redhat.com>=0D
          [PULL 00/15] Python patches=0D
=0D
Hi!=0D
=0D
This patch series adds an Asynchronous QMP package to the Python=0D
library. It offers a few improvements over the previous library:=0D
=0D
- out-of-band support=0D
- true asynchronous event support=0D
- avoids undocumented interfaces abusing non-blocking sockets=0D
=0D
This library serves as the basis for a new qmp-shell program that will=0D
offer improved reconnection support, true asynchronous display of=0D
events, VM and job status update notifiers, and so on.=0D
=0D
My intent is to eventually publish this library directly to PyPI as a=0D
standalone package. I would like to phase out our usage of the old QMP=0D
library over time; eventually replacing it entirely with this one.=0D
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
The core machinery is split between the AsyncProtocol and QMP=0D
classes. AsyncProtocol provides the generic machinery, while QMP=0D
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
the upper and lower half of the event loop. The queue mechanisms between=0D
both dashes serve as the intermediaries between the upper and lower=0D
half.=0D
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
Ugly Bits=0D
=3D=3D=3D=3D=3D=3D=3D=3D=3D=0D
=0D
- MultiException is ... wonky. I am still working out how to avoid needing =
it.=0D
  See patch 04/20 for details here, or see=0D
  https://people.redhat.com/~jsnow/sphinx/html/qemu.aqmp.error.html=0D
=0D
  Patch 06/20 also goes into details of the ugliness; see=0D
  AsyncProtocol._results or view the same information here:=0D
  https://people.redhat.com/~jsnow/sphinx/html/_modules/qemu/aqmp/protocol.=
html#AsyncProtocol._results=0D
=0D
- There are quite a few lingering questions I have over the design of the=
=0D
  EventListener subsystem; I wrote about those ugly bits in excruciating de=
tail=0D
  in patch 14/20.=0D
=0D
  You can view them formatted nicely here:=0D
  https://people.redhat.com/~jsnow/sphinx/html/qemu.aqmp.events.html#experi=
mental-interfaces-design-issues=0D
=0D
Patch Layout=0D
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0D
=0D
Patches 1-2 are tiny pylint configuration changes.=0D
Patches 3-5 begin to check in Async QMP components, they are small.=0D
Patches 6-11 add a generic async message-based protocol class,=0D
             AsyncProto. They are split as small as I could=0D
             reasonably split them.=0D
Patches 12-14 check in more QMP-specific components.=0D
Patches 15-18 add qmp_protocol.py, the new 'QMP' class. They're split as=0D
              far down as I could, I hope they're easy to review.=0D
Patches 19-20 add a few finishing touches, they are small patches.=0D
=0D
Future Work=0D
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0D
=0D
These items are in progress:=0D
=0D
- A Synchronous QMP wrapper that allows this library to be easily used=0D
  from non-async code; this will also allow me to prove it works well by=0D
  demoing its replacement throughout iotests.=0D
=0D
- A QMP server class; to facilitate writing of unit tests.=0D
=0D
- Unit tests. Real unit tests.=0D
=0D
If you made it this far in the cover letter, congrats :)=0D
=0D
John Snow (20):=0D
  python/pylint: Add exception for TypeVar names ('T')=0D
  python/pylint: disable too-many-function-args=0D
  python/aqmp: add asynchronous QMP (AQMP) subpackage=0D
  python/aqmp: add error classes=0D
  python/aqmp: add asyncio compatibility wrappers=0D
  python/aqmp: add generic async message-based protocol support=0D
  python/aqmp: add runstate state machine to AsyncProtocol=0D
  python/aqmp: add logging to AsyncProtocol=0D
  python/aqmp: add AsyncProtocol.accept() method=0D
  python/aqmp: add _cb_inbound and _cb_inbound logging hooks=0D
  python/aqmp: add AsyncProtocol._readline() method=0D
  python/aqmp: add QMP Message format=0D
  python/aqmp: add well-known QMP object models=0D
  python/aqmp: add QMP event support=0D
  python/aqmp: add QMP protocol support=0D
  python/aqmp: Add message routing to QMP protocol=0D
  python/aqmp: add execute() interfaces=0D
  python/aqmp: add _raw() execution interface=0D
  python/aqmp: add asyncio_run compatibility wrapper=0D
  python/aqmp: add scary message=0D
=0D
 python/qemu/aqmp/__init__.py     |  61 +++=0D
 python/qemu/aqmp/error.py        |  97 ++++=0D
 python/qemu/aqmp/events.py       | 878 +++++++++++++++++++++++++++++++=0D
 python/qemu/aqmp/message.py      | 207 ++++++++=0D
 python/qemu/aqmp/models.py       | 133 +++++=0D
 python/qemu/aqmp/protocol.py     | 851 ++++++++++++++++++++++++++++++=0D
 python/qemu/aqmp/py.typed        |   0=0D
 python/qemu/aqmp/qmp_protocol.py | 565 ++++++++++++++++++++=0D
 python/qemu/aqmp/util.py         | 183 +++++++=0D
 python/setup.cfg                 |   4 +-=0D
 10 files changed, 2978 insertions(+), 1 deletion(-)=0D
 create mode 100644 python/qemu/aqmp/__init__.py=0D
 create mode 100644 python/qemu/aqmp/error.py=0D
 create mode 100644 python/qemu/aqmp/events.py=0D
 create mode 100644 python/qemu/aqmp/message.py=0D
 create mode 100644 python/qemu/aqmp/models.py=0D
 create mode 100644 python/qemu/aqmp/protocol.py=0D
 create mode 100644 python/qemu/aqmp/py.typed=0D
 create mode 100644 python/qemu/aqmp/qmp_protocol.py=0D
 create mode 100644 python/qemu/aqmp/util.py=0D
=0D
--=20=0D
2.31.1=0D
=0D


