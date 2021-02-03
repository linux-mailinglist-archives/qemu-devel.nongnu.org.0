Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 053E430E1CF
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 19:04:49 +0100 (CET)
Received: from localhost ([::1]:53518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7MWF-0008Io-Vs
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 13:04:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l7MOe-0001qq-No
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 12:56:56 -0500
Received: from indium.canonical.com ([91.189.90.7]:48754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l7MOR-0000zb-UQ
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 12:56:55 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l7MOO-0003Vf-3t
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:56:40 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 2F8572E8241
 for <qemu-devel@nongnu.org>; Wed,  3 Feb 2021 17:56:32 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Feb 2021 16:18:13 -0000
From: melanie witt <1914282@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: kashyapc melwitt
X-Launchpad-Bug-Reporter: melanie witt (melwitt)
X-Launchpad-Bug-Modifier: melanie witt (melwitt)
References: <161229019609.3949.15746215383583949568.malonedeb@chaenomeles.canonical.com>
Message-Id: <161236909333.2846.14292902779560870233.malone@gac.canonical.com>
Subject: [Bug 1914282] Re: block copy job sometimes hangs on the last block
 for minutes
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3d7abcb776ec05aa0a89112accc21bf8b41dfc24"; Instance="production"
X-Launchpad-Hash: 072cc1519b8fd303499548adaf60193a3cad4876
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -64
X-Spam_score: -6.5
X-Spam_bar: ------
X-Spam_report: (-6.5 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, URIBL_SBL_A=0.1,
 WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1914282 <1914282@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

openstack nova, qemu, and libvirtd log excerpts

** Attachment added: "bug1914282_log_excerpts.txt"
   https://bugs.launchpad.net/qemu/+bug/1914282/+attachment/5459433/+files/=
bug1914282_log_excerpts.txt

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1914282

Title:
  block copy job sometimes hangs on the last block for minutes

Status in QEMU:
  New

Bug description:
  In openstack nova we use the block copy API to copy disks for volume
  swap requests. In our CI gate we observed that sometimes the block
  copy job progress will reach the last or next to last block and hang
  there for  minutes at a time, causing CI jobs to fail as jobs timeout.

  On the client (nova-compute) side, using the python bindings we see
  the following in the openstack nova logs:

  ---------------

  Jan 21 05:31:02.207785 ubuntu-focal-vexxhost-ca-ymq-1-0022641000 nova-
  compute[93823]: DEBUG nova.virt.libvirt.guest [None req-d6170fbb-e023
  -4cdb-93dc-a2e9ae9b0a56 tempest-TestVolumeSwap-1117975117 tempest-
  TestVolumeSwap-1117975117] COPY block job progress, current cursor: 0
  final cursor: 1073741824 {{(pid=3D93823) is_job_complete
  /opt/stack/nova/nova/virt/libvirt/guest.py:873}}

  Jan 21 05:31:55.688227 ubuntu-focal-vexxhost-ca-ymq-1-0022641000 nova-
  compute[93823]: DEBUG nova.virt.libvirt.guest [None req-d6170fbb-e023
  -4cdb-93dc-a2e9ae9b0a56 tempest-TestVolumeSwap-1117975117 tempest-
  TestVolumeSwap-1117975117] COPY block job progress, current cursor:
  1049624576 final cursor: 1073741824 {{(pid=3D93823) is_job_complete
  /opt/stack/nova/nova/virt/libvirt/guest.py:873}}

  [...]

  Jan 21 05:31:55.706698 ubuntu-focal-vexxhost-ca-ymq-1-0022641000 nova-
  compute[93823]: DEBUG nova.virt.libvirt.guest [None req-d6170fbb-e023
  -4cdb-93dc-a2e9ae9b0a56 tempest-TestVolumeSwap-1117975117 tempest-
  TestVolumeSwap-1117975117] COPY block job progress, current cursor:
  1049624576 final cursor: 1073741824 {{(pid=3D93823) is_job_complete
  /opt/stack/nova/nova/virt/libvirt/guest.py:873}}

  Jan 21 05:31:56.175248 ubuntu-focal-vexxhost-ca-ymq-1-0022641000 nova-
  compute[93823]: DEBUG nova.virt.libvirt.guest [None req-d6170fbb-e023
  -4cdb-93dc-a2e9ae9b0a56 tempest-TestVolumeSwap-1117975117 tempest-
  TestVolumeSwap-1117975117] COPY block job progress, current cursor:
  1073741823 final cursor: 1073741824 {{(pid=3D93823) is_job_complete
  /opt/stack/nova/nova/virt/libvirt/guest.py:873}}

  [...]

  ~2.5 minutes later, it's still going at current cursor: 1073741823
  final cursor: 1073741824

  Jan 21 05:34:30.952371 ubuntu-focal-vexxhost-ca-ymq-1-0022641000 nova-
  compute[93823]: DEBUG nova.virt.libvirt.guest [None req-d6170fbb-e023
  -4cdb-93dc-a2e9ae9b0a56 tempest-TestVolumeSwap-1117975117 tempest-
  TestVolumeSwap-1117975117] COPY block job progress, current cursor:
  1073741823 final cursor: 1073741824 {{(pid=3D93823) is_job_complete
  /opt/stack/nova/nova/virt/libvirt/guest.py:873}}

  then current cursor =3D=3D final cursor at 05:34:31.460595

  Jan 21 05:34:31.460595 ubuntu-focal-vexxhost-ca-ymq-1-0022641000 nova-
  compute[93823]: DEBUG nova.virt.libvirt.guest [None req-d6170fbb-e023
  -4cdb-93dc-a2e9ae9b0a56 tempest-TestVolumeSwap-1117975117 tempest-
  TestVolumeSwap-1117975117] COPY block job progress, current cursor:
  1073741824 final cursor: 1073741824 {{(pid=3D93823) is_job_complete
  /opt/stack/nova/nova/virt/libvirt/guest.py:873}}

  ---------------

  In this excerpt the cursor reaches the next to last block at Jan 21
  05:31:56.175248 and hangs there repeating status at the next to last
  block until Jan 21 05:34:30.952371 (~2.5 minutes) and then the job
  shows current cursor =3D=3D final cursor at Jan 21 05:34:31.460595.

  In the corresponding qemu log, we see the block copy job report being
  on the last block for minutes:

  ---------------

  021-01-21 05:31:02.206+0000: 60630: debug : qemuMonitorJSONIOProcessLine:=
220 : Line [{"return": [{"auto-finalize": true, "io-status": "ok", "device"=
: "copy-vdb-libvirt-5-format", "auto-dismiss": false, "busy": true, "len": =
1073741824, "offset": 0, "status": "running", "paused": false, "speed": 0, =
"ready": false, "type": "mirror"}], "id": "libvirt-501"}]
  2021-01-21 05:31:02.206+0000: 60630: info : qemuMonitorJSONIOProcessLine:=
239 : QEMU_MONITOR_RECV_REPLY: mon=3D0x7fd07813ec80 reply=3D{"return": [{"a=
uto-finalize": true, "io-status": "ok", "device": "copy-vdb-libvirt-5-forma=
t", "auto-dismiss": false, "busy": true, "len": 1073741824, "offset": 0, "s=
tatus": "running", "paused": false, "speed": 0, "ready": false, "type": "mi=
rror"}], "id": "libvirt-501"}

  [...]

  len =3D=3D offset at 05:31:56.174

  2021-01-21 05:31:56.174+0000: 60630: debug : qemuMonitorJSONIOProcessLine=
:220 : Line [{"return": [{"auto-finalize": true, "io-status": "ok", "device=
": "copy-vdb-libvirt-5-format", "auto-dismiss": false, "busy": true, "len":=
 1073741824, "offset": 1073741824, "status": "running", "paused": false, "s=
peed": 0, "ready": false, "type": "mirror"}], "id": "libvirt-581"}]
  2021-01-21 05:31:56.174+0000: 60630: info : qemuMonitorJSONIOProcessLine:=
239 : QEMU_MONITOR_RECV_REPLY: mon=3D0x7fd07813ec80 reply=3D{"return": [{"a=
uto-finalize": true, "io-status": "ok", "device": "copy-vdb-libvirt-5-forma=
t", "auto-dismiss": false, "busy": true, "len": 1073741824, "offset": 10737=
41824, "status": "running", "paused": false, "speed": 0, "ready": false, "t=
ype": "mirror"}], "id": "libvirt-581"}

  [...]

  ~2.5 minutes later, still len =3D=3D offset but it's still going

  2021-01-21 05:34:31.459+0000: 60630: debug : qemuMonitorJSONIOProcessLine=
:220 : Line [{"return": [{"auto-finalize": true, "io-status": "ok", "device=
": "copy-vdb-libvirt-5-format", "auto-dismiss": false, "busy": false, "len"=
: 1073741824, "offset": 1073741824, "status": "ready", "paused": false, "sp=
eed": 0, "ready": true, "type": "mirror"}], "id": "libvirt-855"}]
  2021-01-21 05:34:31.459+0000: 60630: info : qemuMonitorJSONIOProcessLine:=
239 : QEMU_MONITOR_RECV_REPLY: mon=3D0x7fd07813ec80 reply=3D{"return": [{"a=
uto-finalize": true, "io-status": "ok", "device": "copy-vdb-libvirt-5-forma=
t", "auto-dismiss": false, "busy": false, "len": 1073741824, "offset": 1073=
741824, "status": "ready", "paused": false, "speed": 0, "ready": true, "typ=
e": "mirror"}], "id": "libvirt-855"}

  and then the job finishes soon after

  2021-01-21 05:34:31.467+0000: 60630: debug :
  qemuProcessHandleJobStatusChange:1002 : job 'copy-vdb-
  libvirt-5-format'(domain: 0x7fd070075720,instance-00000013) state
  changed to 'waiting'(6)

  2021-01-21 05:34:31.467+0000: 60630: debug :
  qemuProcessHandleJobStatusChange:1002 : job 'copy-vdb-
  libvirt-5-format'(domain: 0x7fd070075720,instance-00000013) state
  changed to 'pending'(7)

  2021-01-21 05:34:31.467+0000: 60630: debug :
  qemuProcessHandleJobStatusChange:1002 : job 'copy-vdb-
  libvirt-5-format'(domain: 0x7fd070075720,instance-00000013) state
  changed to 'concluded'(9)

  2021-01-21 05:34:31.468+0000: 60630: debug :
  qemuProcessHandleJobStatusChange:1002 : job 'copy-vdb-
  libvirt-5-format'(domain: 0x7fd070075720,instance-00000013) state
  changed to 'null'(11)

  2021-01-21 05:34:31.468+0000: 60634: debug :
  qemuBlockJobProcessEventConcludedCopyPivot:1221 : copy job 'copy-vdb-
  libvirt-5-format' on VM 'instance-00000013' pivoted

  2021-01-21 05:34:32.292+0000: 60634: debug : qemuDomainObjEndJob:9746
  : Stopping job: modify (async=3Dnone vm=3D0x7fd070075720
  name=3Dinstance-00000013)

  ---------------

  Is this normal for a block copy job to hang on the last block like
  this for minutes at a time? Why doesn't the job close out once offset
  =3D=3D len?

  Thanks for any help you can offer.

  Additional log messages have been pasted here:

  https://pastebin.com/FQRu76Sn

  and for completeness, these logs were taken from the following
  openstack nova gate job:

  https://zuul.opendev.org/t/openstack/build/a078a17aa9924517b329cafc3f54fe=
d4

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1914282/+subscriptions

