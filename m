Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5F51211B1
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Dec 2019 18:24:45 +0100 (CET)
Received: from localhost ([::1]:57393 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1igu6u-0007gV-7m
	for lists+qemu-devel@lfdr.de; Mon, 16 Dec 2019 12:24:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46239)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1igtie-0001lT-C2
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 11:59:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1igtic-0008PC-U6
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 11:59:40 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:40473
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1igtic-0008NZ-OB
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 11:59:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576515578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9PTG+YbePueMrlvxE+3+yA5BA2oiSbsZCKQA0N93vtU=;
 b=cchjfDf9ApylMdF8sBuxaSbItOeMiSnNqKUfXVc3DZmK9X2BddnKCRc58/XBV4yYgwtZUQ
 Qmpui+YyXAA8cTLWOpb4SIyamdSdaca5cDmkdCMxnRDXbFG5VcTPgUE4D5cOjhR2Ekhmo/
 1u5MqBx1Znf297D35AXiYyGSFyZ35zA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-0qietaDqNEW0AV3tpbWx2g-1; Mon, 16 Dec 2019 11:59:34 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA6DFA89A04
 for <qemu-devel@nongnu.org>; Mon, 16 Dec 2019 16:59:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-42.ams2.redhat.com
 [10.36.116.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 449AC620A9;
 Mon, 16 Dec 2019 16:59:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CE66B11386A7; Mon, 16 Dec 2019 17:59:31 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: Extraneous nesting in QAPI schema
Date: Mon, 16 Dec 2019 17:59:31 +0100
Message-ID: <87r214qk98.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: 0qietaDqNEW0AV3tpbWx2g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Kevin Wolf <kwolf@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extra nesting is merely another set of braces in QMP.  It's bloody
annoying in QAPIfied CLI using dotted keys syntax.  Example:

QMP command

    {"execute": "chardev-add",
     "arguments": {
         "id": "char0",
         "backend": {
             "type": "socket",
             "data": {
                 "addr": {
                     "type": "inet",
                     "data": {
                         "host": "0.0.0.0",
                         "port": "2445"}},
                 "wait": false,
                 "telnet": false,
                 "server": true}}}}

becomes dotted keys

    --chardev id=3Dchar0,\
    backend.type=3Dsocket,\
    backend.data.addr.type=3Dinet,\
    backend.data.addr.data.host=3D0.0.0.0,\
    backend.data.addr.data.port=3D2445,\
    backend.data.wait=3Doff,\
    backend.data.telnet=3Doff,\
    backend.data.server=3Don

In our actual CLI, it's

    -chardev id=3Dchar0,\
    backend=3Dsocket,\
    host=3D0.0.0.0,\
    port=3D2445,\
    wait=3Doff,\
    telnet=3Doff,\
    server=3Don

The flattened syntax is provided by custom code.

Custom code doesn't scale.  One of the hurdles for CLI QAPIfication.

Kevin suggested to investigate a more generic flattening solutions.

Of course, flattening is only possible as long as there are no name
clashes.

Let's start with trying to understand the sources of extra nesting.

The obvious source of nesting is struct members of struct or union type.
The example above has two: backend and backend.data.addr.

This kind of nesting can sometimes be avoided by making the member
(struct) type a base type of the containing type.  Possible when we can
arrange the base types into a single chain.  In the example above, we'd
make the implicit argument type of chardev-add explicit, then replace
member 'backend': 'ChardevBackend' by 'base': 'ChardevBackend'.

A more general solution would be adding "unboxed" members to the schema
language.  A member that is normally a JSON object on the wire would
instead have its JSON object members "spliced in".  Worth the trouble?
Not sure.

Special case: &rest arguments.  Example 1: object-add argument @props:

    {"execute": "object-add",
     "arguments": {
         "qom-type": "memory-backend-file",
         "id": "shmmem-shmem0",
         "props": {"mem-path": "/dev/shm/my_shmem0",
                   "size":4194304,
                   "share":true}}}

Example 2:

    {"execute": "device_add",
     "arguments": {
         "driver": "virtio-scsi-pci",
         "bus": "pci.0",
         "id": "virtio_scsi_pci2",
         "addr": "0xb"}}

object-add wraps the properties in an object.  Device_add doesn't, but
it needs to bypass the generated marshaller with 'gen': false.  We could
add support for &rest arguments to the schema language.  Worth the
trouble?  Not sure.

Another source is "simple" unions.  Both backend and backend.data.addr
are actually "simple" unions, giving rise to backend.data and
backend.data.addr.data.

We wouldn't use "simple" unions today.  With "flat" unions, we'd avoid
the .data.

How widespread are "simple" unions today?  Let's have a look.  Five
occur as command arguments:

* ChardevBackend

  Used for command chardev-add and chardev-change argument @backend.

* SocketAddressLegacy

  Used for command nbd-server-start argument @addr, and in command
  chardev-add and chardev-change argument @backend.

* TransactionAction

  Used for command transaction argument @actions.

* KeyValue

  Used for command send-key argument @keys, and in InputEvent (next
  item)

* InputEvent

  Used for command input-send-event argument @events.

Six commands: chardev-add, chardev-change, nbd-server-start,
transaction, send-key, input-send-event.  Could be worse.

Flattening could be done in at least two ways.  One, replace the nested
commands by flat ones, deprecate.  Two, make the existing commands
accept both nested and flat, deprecate use of nested.  Two is more
difficult.

Name clashes could prevent the flattening.  I haven't checked for them.

Three more "simple" unions appear to occur only in results:

* ImageInfoSpecific

  Occurs in value of commands query-named-block-nodes and query-block.

* MemoryDeviceInfo

  Occurs in value of command query-memory-devices.

* TpmTypeOptions

  Occurs in value of command query-tpm.

There, the only way to get rid of nesting is replace & deprecate.

I'd love to eliminate "simple" unions from the schema language.
Possible because any "simple" union can also be expressed as a flat
union.


