Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B297D261610
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Sep 2020 19:02:18 +0200 (CEST)
Received: from localhost ([::1]:59264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFh0b-00006U-OI
	for lists+qemu-devel@lfdr.de; Tue, 08 Sep 2020 13:02:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kFgzJ-0007Y5-4O
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 13:00:57 -0400
Received: from indium.canonical.com ([91.189.90.7]:36558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kFgzF-0005Co-OX
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 13:00:56 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kFgzD-00011t-CH
 for <qemu-devel@nongnu.org>; Tue, 08 Sep 2020 17:00:51 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5B1BB2E80E7
 for <qemu-devel@nongnu.org>; Tue,  8 Sep 2020 17:00:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2020 16:54:25 -0000
From: Derek Su <1894818@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dereksu lukey3332
X-Launchpad-Bug-Reporter: Derek Su (dereksu)
X-Launchpad-Bug-Modifier: Derek Su (dereksu)
References: <159955977855.17769.18273034994411209537.malonedeb@soybean.canonical.com>
Message-Id: <159958406662.18648.8227102836668449842.malone@soybean.canonical.com>
Subject: [Bug 1894818] Re: COLO's guest VNC client hang after failover
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="90a5703803d95539bdb5c0b289b1675630569e1e"; Instance="production"
X-Launchpad-Hash: 3a4b51782f7253b3ed433ea2ec65344c2b26c732
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 11:30:40
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1894818 <1894818@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Lukas

After fixing the misuse of AWD.
There is still a high probability of the VNC/RDP client hangs after PVM die=
d and SVM takeover.

Here are the steps.

1. Start PVM script
```
imagefolder=3D"/mnt/nfs2/vms"
  =

 qemu-system-x86_64 -enable-kvm -cpu qemu64,+kvmclock -m 4096 -smp 2 -qmp s=
tdio \                   =

   -device piix3-usb-uhci -device usb-tablet -name primary \
   -device virtio-net-pci,id=3De0,netdev=3Dhn0 \
   -netdev tap,id=3Dhn0,br=3Dbr0,vhost=3Doff,helper=3D/usr/local/libexec/qe=
mu-bridge-helper \
   -chardev socket,id=3Dmirror0,host=3D0.0.0.0,port=3D9003,server,nowait \
   -chardev socket,id=3Dcompare1,host=3D0.0.0.0,port=3D9004,server,wait \
   -chardev socket,id=3Dcompare0,host=3D127.0.0.1,port=3D9001,server,nowait=
 \
   -chardev socket,id=3Dcompare0-0,host=3D127.0.0.1,port=3D9001 \
   -chardev socket,id=3Dcompare_out,host=3D127.0.0.1,port=3D9005,server,now=
ait \
   -chardev socket,id=3Dcompare_out0,host=3D127.0.0.1,port=3D9005 \
   -object filter-mirror,id=3Dm0,netdev=3Dhn0,queue=3Dtx,outdev=3Dmirror0 \
   -object filter-redirector,netdev=3Dhn0,id=3Dredire0,queue=3Drx,indev=3Dc=
ompare_out \
   -object filter-redirector,netdev=3Dhn0,id=3Dredire1,queue=3Drx,outdev=3D=
compare0 \
   -object iothread,id=3Diothread1 \
   -object colo-compare,id=3Dcomp0,primary_in=3Dcompare0-0,secondary_in=3Dc=
ompare1,\
outdev=3Dcompare_out0,iothread=3Diothread1 \
   -drive if=3Dide,id=3Dcolo-disk0,driver=3Dquorum,read-pattern=3Dfifo,vote=
-threshold=3D1,\
children.0.file.filename=3D$imagefolder/primary.qcow2,children.0.driver=3Dq=
cow2 -vnc :0 -S
```

2. Start SVM script
```
#!/bin/bash
  =

imagefolder=3D"/mnt/nfs2/vms"
primary_ip=3D127.0.0.1

qemu-img create -f qcow2 $imagefolder/secondary-active.qcow2 100G
qemu-img create -f qcow2 $imagefolder/secondary-hidden.qcow2 100G

qemu-system-x86_64 -enable-kvm -cpu qemu64,+kvmclock -m 4096 -smp 2 -qmp st=
dio \
-device piix3-usb-uhci -device usb-tablet -name secondary \
-device virtio-net-pci,id=3De0,netdev=3Dhn0 \                              =
                             =

-netdev tap,id=3Dhn0,br=3Dbr0,vhost=3Doff,helper=3D/usr/local/libexec/qemu-=
bridge-helper \
-chardev socket,id=3Dred0,host=3D$primary_ip,port=3D9003,reconnect=3D1 \
-chardev socket,id=3Dred1,host=3D$primary_ip,port=3D9004,reconnect=3D1 \
-object filter-redirector,id=3Df1,netdev=3Dhn0,queue=3Dtx,indev=3Dred0 \
-object filter-redirector,id=3Df2,netdev=3Dhn0,queue=3Drx,outdev=3Dred1 \
-object filter-rewriter,id=3Drew0,netdev=3Dhn0,queue=3Dall \
-drive if=3Dnone,id=3Dparent0,file.filename=3D$imagefolder/secondary.qcow2,=
driver=3Dqcow2 \
-drive if=3Dnone,id=3Dchilds0,driver=3Dreplication,mode=3Dsecondary,file.dr=
iver=3Dqcow2,\
top-id=3Dcolo-disk0,file.file.filename=3D$imagefolder/secondary-active.qcow=
2,\
file.backing.driver=3Dqcow2,file.backing.file.filename=3D$imagefolder/secon=
dary-hidden.qcow2,\
file.backing.backing=3Dparent0 \
-drive if=3Dide,id=3Dcolo-disk0,driver=3Dquorum,read-pattern=3Dfifo,vote-th=
reshold=3D1,children.0=3Dchilds0 \
-vnc :1 \
-incoming tcp:0.0.0.0:9998
```

3. On Secondary VM's QEMU monitor, issue command
{'execute':'qmp_capabilities'}
{'execute': 'nbd-server-start', 'arguments': {'addr': {'type': 'inet', 'dat=
a': {'host': '0.0.0.0', 'port': '9999'} } } }
{'execute': 'nbd-server-add', 'arguments': {'device': 'parent0', 'writable'=
: true } }

4. On Primary VM's QEMU monitor, issue command:
{'execute':'qmp_capabilities'}
{'execute': 'human-monitor-command', 'arguments': {'command-line': 'drive_a=
dd -n buddy driver=3Dreplication,mode=3Dprimary,file.driver=3Dnbd,file.host=
=3D127.0.0.2,file.port=3D9999,file.export=3Dparent0,node-name=3Dreplication=
0'}}
{'execute': 'x-blockdev-change', 'arguments':{'parent': 'colo-disk0', 'node=
': 'replication0' } }
{'execute': 'migrate-set-capabilities', 'arguments': {'capabilities': [ {'c=
apability': 'x-colo', 'state': true } ] } }
{'execute': 'migrate', 'arguments': {'uri': 'tcp:127.0.0.2:9998' } }

5. kill PVM

6. On SVM, issues
```
{'execute': 'nbd-server-stop'}
{'execute': 'x-colo-lost-heartbeat'}

{'execute': 'object-del', 'arguments':{ 'id': 'f2' } }
{'execute': 'object-del', 'arguments':{ 'id': 'f1' } }
{'execute': 'chardev-remove', 'arguments':{ 'id': 'red1' } }
{'execute': 'chardev-remove', 'arguments':{ 'id': 'red0' } }
```

I use "-device virtio-net-pci" here, but after replacing with "-device rtl8=
139",
the behavior seems normal.
Is "-device virtio-net-pci" available in COLO?

Thanks.

Regards,
Derek

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1894818

Title:
  COLO's guest VNC client hang after failover

Status in QEMU:
  Invalid

Bug description:
  Hello,

  After setting up COLO's primary and secondary VMs,
  I installed the vncserver and xrdp (apt install tightvncserver xrdp) insi=
de the VM.

  I access the VM from another PC via VNC/RDP client, and everything is OK.
  Then, kill the primary VM and issue the failover commands.

  The expected result is that the VNC/RDP client can reconnect and
  resume automatically after failover. (I've confirmed the VNC/RDP
  client can reconnect automatically.)

  But in my test, the VNC client's screen hangs and cannot be recovered
  no longer. I need to restart VNC client by myself.

  BTW, it works well after killing SVM.

  Here is my QEMU networking device
  ```
  -device virtio-net-pci,id=3De0,netdev=3Dhn0 \
  -netdev tap,id=3Dhn0,br=3Dbr0,vhost=3Doff,helper=3D/usr/local/libexec/qem=
u-bridge-helper \
  ```

  Thanks.

  Regards,
  Derek

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1894818/+subscriptions

