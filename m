Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F94723BD23
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Aug 2020 17:21:34 +0200 (CEST)
Received: from localhost ([::1]:44520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k2ykv-0005oA-IJ
	for lists+qemu-devel@lfdr.de; Tue, 04 Aug 2020 11:21:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k2ykA-0005J9-KV
 for qemu-devel@nongnu.org; Tue, 04 Aug 2020 11:20:46 -0400
Received: from indium.canonical.com ([91.189.90.7]:58316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k2yk6-0005kx-PS
 for qemu-devel@nongnu.org; Tue, 04 Aug 2020 11:20:46 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1k2yk4-0000SX-JO
 for <qemu-devel@nongnu.org>; Tue, 04 Aug 2020 15:20:40 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 9047D2E80DB
 for <qemu-devel@nongnu.org>; Tue,  4 Aug 2020 15:20:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2020 15:15:30 -0000
From: Greg Kurz <1890290@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: nested powerpc
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: gkurz sathnaga
X-Launchpad-Bug-Reporter: Satheesh Rajendran (sathnaga)
X-Launchpad-Bug-Modifier: Greg Kurz (gkurz)
References: <159655059319.10948.7356744312155765003.malonedeb@chaenomeles.canonical.com>
Message-Id: <159655413055.2711.8974618740991284654.malone@gac.canonical.com>
Subject: [Bug 1890290] Re: PowerPC L2(nested virt) kvm guest fails to boot
 with ic-mode=dual, kernel-irqchip=on - `KVM is too old to support ic-mode=dual,
 kernel-irqchip=on`
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="a24057fea7e4c6a98c0220d5f878da0f3c783699";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: da501866457ea7242de86dd8a8accf2c29c957c2
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/04 08:50:53
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1890290 <1890290@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is currently expected because the L2 KVM guest uses the historical
KVM XICS device (not the XICS-on-XIVE one) and this can be only created
once during the VM lifetime for the moment.

This is a limitation in KVM, that can be addressed in several ways:
1) change the historical KVM XICS device to implement the release() method =
instead of destroy(), so that userspace can close() and re-create the devic=
e multiple times during the VM lifetime, as we have already done in KVM XIV=
E and KVM XICS-on-XIVE for powernv
2) have the KVM XICS-on-XIVE device to work under pseries

I already have a tentative patch for 1) and I guess 2) would be part of
a more global work to supporting nested KVM XIVE.

But it is definitely not an issue in QEMU.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1890290

Title:
  PowerPC L2(nested virt) kvm guest fails to boot with ic-mode=3Ddual
  ,kernel-irqchip=3Don - `KVM is too old to support ic-mode=3Ddual,kernel-
  irqchip=3Don`

Status in QEMU:
  New

Bug description:
  Env:
  HW: Power 9 DD2.3
  Host L0: 5.8.0-rc5-g8ba4ffcd8
  Qemu: 5.0.50 (v5.0.0-533-gdebe78ce14)
  Libvirt: 6.4.0
  L1: 5.8.0-rc5-ge9919e11e
  qemu_version': '5.0.50 (v5.1.0-rc2-dirty)
  libvirt_version': '6.4.0'
  L2: 5.8.0-rc7-g6ba1b005f

  =

  1. boot a L2 KVM guest with `ic-mode=3Ddual,kernel-irqchip=3Don`

  /usr/bin/virt-install --connect=3Dqemu:///system --hvm --accelerate --nam=
e 'vm1' --machine pseries --memory=3D8192 --vcpu=3D8,maxvcpus=3D8,sockets=
=3D1,cores=3D2,t
  hreads=3D4 --import --nographics --serial pty --memballoon model=3Dvirtio=
 --disk path=3D/home/tests/data/avocado-vt/images/f31-ppc64le.qcow2,bus=3Dv=
irtio,size=3D10,format=3Dqcow2 --network
  =3Dbridge=3Dvirbr0,model=3Dvirtio,mac=3D52:54:00:e6:fe:f6 --mac=3D52:54:0=
0:e6:fe:f6 --boot emulator=3D/usr/share/avocado-plugins-vt/bin/qemu,kernel=
=3D/tmp/linux/vmlinux,kernel_args=3D"root=3D/de
  v/vda2 rw console=3Dtty0 console=3DttyS0,115200 init=3D/sbin/init initcal=
l_debug selinux=3D0" --noautoconsole --qemu-commandline=3D" -M pseries,ic-m=
ode=3Ddual,kernel-irqchip=3Don"

  =

  ERROR    internal error: process exited while connecting to monitor: 2020=
-08-04T11:12:53.304482Z qemu: KVM is too old to support ic-mode=3Ddual,kern=
el-irqchip=3Don


  =

  Qemu Log:
  ```
  /usr/share/avocado-plugins-vt/bin/qemu \
  -name guest=3Dvm1,debug-threads=3Don \
  -S \
  -object secret,id=3DmasterKey0,format=3Draw,file=3D/var/lib/libvirt/qemu/=
domain-5-vm1/master-key.aes \
  -machine pseries-5.1,accel=3Dkvm,usb=3Doff,dump-guest-core=3Doff \
  -cpu POWER9 \
  -m 8192 \
  -overcommit mem-lock=3Doff \
  -smp 8,sockets=3D1,dies=3D1,cores=3D2,threads=3D4 \
  -uuid 20a3351b-2776-4e75-9059-c070fe3dd44b \
  -display none \
  -no-user-config \
  -nodefaults \
  -chardev socket,id=3Dcharmonitor,fd=3D34,server,nowait \
  -mon chardev=3Dcharmonitor,id=3Dmonitor,mode=3Dcontrol \
  -rtc base=3Dutc \
  -no-shutdown \
  -boot strict=3Don \
  -kernel /tmp/linux/vmlinux \
  -append 'root=3D/dev/vda2 rw console=3Dtty0 console=3DttyS0,115200 init=
=3D/sbin/init initcall_debug selinux=3D0' \
  -device qemu-xhci,p2=3D15,p3=3D15,id=3Dusb,bus=3Dpci.0,addr=3D0x2 \
  -device virtio-serial-pci,id=3Dvirtio-serial0,bus=3Dpci.0,addr=3D0x3 \
  -blockdev '{"driver":"file","filename":"/home/tests/data/avocado-vt/image=
s/f31-ppc64le.qcow2","node-name":"libvirt-1-storage","auto-read-only":true,=
"discard":"unmap"}' \
  -blockdev '{"node-name":"libvirt-1-format","read-only":false,"driver":"qc=
ow2","file":"libvirt-1-storage","backing":null}' \
  -device virtio-blk-pci,bus=3Dpci.0,addr=3D0x4,drive=3Dlibvirt-1-format,id=
=3Dvirtio-disk0,bootindex=3D1 \
  -netdev tap,fd=3D37,id=3Dhostnet0,vhost=3Don,vhostfd=3D38 \
  -device virtio-net-pci,netdev=3Dhostnet0,id=3Dnet0,mac=3D52:54:00:e6:fe:f=
6,bus=3Dpci.0,addr=3D0x1 \
  -chardev pty,id=3Dcharserial0 \
  -device spapr-vty,chardev=3Dcharserial0,id=3Dserial0,reg=3D0x30000000 \
  -chardev socket,id=3Dcharchannel0,fd=3D39,server,nowait \
  -device virtserialport,bus=3Dvirtio-serial0.0,nr=3D1,chardev=3Dcharchanne=
l0,id=3Dchannel0,name=3Dorg.qemu.guest_agent.0 \
  -device virtio-balloon-pci,id=3Dballoon0,bus=3Dpci.0,addr=3D0x5 \
  -M pseries,ic-mode=3Ddual,kernel-irqchip=3Don \
  -msg timestamp=3Don
  2020-08-04 11:12:53.169+0000: Domain id=3D5 is tainted: custom-argv
  2020-08-04 11:12:53.179+0000: 11120: info : libvirt version: 6.4.0, packa=
ge: 1.fc31 (Unknown, 2020-06-02-05:09:40, ltc-wspoon4.aus.stglabs.ibm.com)
  2020-08-04 11:12:53.179+0000: 11120: info : hostname: atest-guest
  2020-08-04 11:12:53.179+0000: 11120: info : virObjectUnref:347 : OBJECT_U=
NREF: obj=3D0x7fff0c117c40
  char device redirected to /dev/pts/0 (label charserial0)
  2020-08-04T11:12:53.304482Z qemu: KVM is too old to support ic-mode=3Ddua=
l,kernel-irqchip=3Don
  2020-08-04 11:12:53.694+0000: shutting down, reason=3Dfailed
  ```

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1890290/+subscriptions

