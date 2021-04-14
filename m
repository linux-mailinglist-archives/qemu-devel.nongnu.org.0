Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE1F35FEB8
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 02:02:37 +0200 (CEST)
Received: from localhost ([::1]:47072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWpSt-000507-MW
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 20:02:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lWpS1-0004Ze-HW
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 20:01:41 -0400
Received: from indium.canonical.com ([91.189.90.7]:37470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lWpRy-0005ut-Q8
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 20:01:41 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lWpRw-0006HK-7g
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 00:01:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 2DCA12E8162
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 00:01:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Apr 2021 23:49:13 -0000
From: Cleber Rosa <1922611@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Committed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: acceptance sparc test
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: cleber-gnu mark-cave-ayland philmd
X-Launchpad-Bug-Reporter: Cleber Rosa (cleber-gnu)
X-Launchpad-Bug-Modifier: Cleber Rosa (cleber-gnu)
References: <161766836712.29624.11290531043933796860.malonedeb@gac.canonical.com>
Message-Id: <161844415407.18765.16328908728832319661.malone@wampee.canonical.com>
Subject: [Bug 1922611] Re: Acceptance Tests: migration fails on sparc target
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="929bdb49da44562d032228b8f93c5c598dae8678"; Instance="production"
X-Launchpad-Hash: 6cd6a38803d2aa34b70e7a863a5776f14118bdbc
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1922611 <1922611@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I can confirm this bug has been fixed.  Relevant test output:

VM launch command: './qemu-system-sparc -display none -vga none -chardev so=
cket,id=3Dmon,path=3D/tmp/avo_qemu_sock_g0w15g26/qemu-1672256-monitor.sock =
-mon chardev=3Dmon,mode=3Dcontrol -incoming tcp:localhost:53800 -nodefaults'
>>> {'execute': 'qmp_capabilities'}
<<< {'return': {}}
VM launch command: './qemu-system-sparc -display none -vga none -chardev so=
cket,id=3Dmon,path=3D/tmp/avo_qemu_sock_ajodgya5/qemu-1672256-monitor.sock =
-mon chardev=3Dmon,mode=3Dcontrol -nodefaults'
>>> {'execute': 'qmp_capabilities'}
<<< {'return': {}}
>>> {'execute': 'migrate', 'arguments': {'uri': 'tcp:localhost:53800'}}
<<< {'return': {}}
>>> {'execute': 'query-migrate'}
<<< {'return': {'blocked': False, 'status': 'setup'}}
>>> {'execute': 'query-migrate'}
<<< {'timestamp': {'seconds': 1618444112, 'microseconds': 790928}, 'event':=
 'STOP'}
<<< {'return': {'blocked': False, 'status': 'completed', 'setup-time': 1, '=
downtime': 1, 'total-time': 17, 'ram': {'total': 135274496, 'postcopy-reque=
sts': 0, 'dirty-sync-count': 2, 'multifd-bytes': 0, 'pages-per-second': 0, =
'page-size': 4096, 'remaining': 0, 'mbps': 282.253, 'transferred': 528415, =
'duplicate': 33170, 'dirty-pages-rate': 0, 'skipped': 0, 'normal-bytes': 22=
9376, 'normal': 56}}}
>>> {'execute': 'query-migrate'}
<<< {'timestamp': {'seconds': 1618444112, 'microseconds': 792061}, 'event':=
 'RESUME'}
<<< {'return': {'blocked': False, 'status': 'completed'}}
>>> {'execute': 'query-migrate'}
<<< {'return': {'blocked': False, 'status': 'completed', 'setup-time': 1, '=
downtime': 1, 'total-time': 17, 'ram': {'total': 135274496, 'postcopy-reque=
sts': 0, 'dirty-sync-count': 2, 'multifd-bytes': 0, 'pages-per-second': 0, =
'page-size': 4096, 'remaining': 0, 'mbps': 282.253, 'transferred': 528415, =
'duplicate': 33170, 'dirty-pages-rate': 0, 'skipped': 0, 'normal-bytes': 22=
9376, 'normal': 56}}}
>>> {'execute': 'query-migrate'}
<<< {'return': {'blocked': False, 'status': 'completed'}}
>>> {'execute': 'query-status'}
<<< {'return': {'status': 'running', 'singlestep': False, 'running': True}}
>>> {'execute': 'query-status'}
<<< {'return': {'status': 'postmigrate', 'singlestep': False, 'running': Fa=
lse}}
>>> {'execute': 'quit'}
<<< {'return': {}}
>>> {'execute': 'quit'}
<<< {'return': {}}
DATA (filename=3Doutput.expected) =3D> NOT FOUND (data sources: variant, te=
st, file)
DATA (filename=3Dstdout.expected) =3D> NOT FOUND (data sources: variant, te=
st, file)
DATA (filename=3Dstderr.expected) =3D> NOT FOUND (data sources: variant, te=
st, file)
PASS 1-tests/acceptance/migration.py:Migration.test_migration_with_tcp_loca=
lhost

** Changed in: qemu
       Status: New =3D> Fix Committed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1922611

Title:
  Acceptance Tests: migration fails on sparc target

Status in QEMU:
  Fix Committed

Bug description:
  QEMU fails migration when using a sparc target.

  This cab be verified/reproduced with the
  `tests/acceptance/migration.py` test.  Running it with:

   $ make check-venv
   $ ./tests/venv/bin/avocado --show=3Dtest run -p qemu_bin=3D./qemu-system=
-sparc tests/acceptance/migration.py:Migration.test_migration_with_tcp_loca=
lhost

  Right after a QMP `query-migrate` is executed, communication with the
  monitor is lost:

  >>> {'execute': 'query-migrate'}
  <<< {'timestamp': {'seconds': 1617667984, 'microseconds': 330282}, 'event=
': 'STOP'}
  <<< {'return': {'blocked': False, 'status': 'completed', 'setup-time': 0,=
 'downtime': 1, 'total-time': 15, 'ram': {'total': 135274496, 'postcopy-req=
uests': 0, 'dirty-sync-count': 2, 'multifd-bytes': 0, 'pages-per-second': 0=
, 'page-size': 4096, 'remaining': 0, 'mbps': 301.2234666666667, 'transferre=
d': 528703, 'duplicate': 33202, 'dirty-pages-rate': 0, 'skipped': 0, 'norma=
l-bytes': 229376, 'normal': 56}}}
  >>> {'execute': 'query-migrate'}

  Reproduced traceback from: /var/lib/users/cleber/build/qemu/tests/venv/li=
b64/python3.7/site-packages/avocado/core/test.py:756
  Traceback (most recent call last):
    File "/var/lib/users/cleber/build/qemu/tests/acceptance/migration.py", =
line 80, in test_migration_with_tcp_localhost
      self.do_migrate(dest_uri)
    File "/var/lib/users/cleber/build/qemu/tests/acceptance/migration.py", =
line 69, in do_migrate
      self.assert_migration(source_vm, dest_vm)
    File "/var/lib/users/cleber/build/qemu/tests/acceptance/migration.py", =
line 41, in assert_migration
      args=3D(dst_vm,))
    File "/var/lib/users/cleber/build/qemu/tests/venv/lib64/python3.7/site-=
packages/avocado/utils/wait.py", line 34, in wait_for
      output =3D func(*args, **kwargs)
    File "/var/lib/users/cleber/build/qemu/tests/acceptance/migration.py", =
line 31, in migration_finished
      return vm.command('query-migrate')['status'] in ('completed', 'failed=
')
    File "/home/cleber/src/qemu/python/qemu/machine.py", line 572, in comma=
nd
      return self._qmp.command(cmd, **qmp_args)
    File "/home/cleber/src/qemu/python/qemu/qmp.py", line 284, in command
      ret =3D self.cmd(cmd, kwds)
    File "/home/cleber/src/qemu/python/qemu/qmp.py", line 278, in cmd
      return self.cmd_obj(qmp_cmd)
    File "/home/cleber/src/qemu/python/qemu/qmp.py", line 256, in cmd_obj
      self.__sock.sendall(json.dumps(qmp_cmd).encode('utf-8'))
  BrokenPipeError: [Errno 32] Broken pipe =


  The qemu-system-sparc binary outputs:

   qemu-system-sparc: warning: nic lance.0 has no peer
   qemu-system-sparc: Missing section footer for sysbusespscsi
   qemu-system-sparc: load of migration failed: Invalid argument

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1922611/+subscriptions

