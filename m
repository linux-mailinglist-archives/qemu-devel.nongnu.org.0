Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4A72C40F0
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 14:13:59 +0100 (CET)
Received: from localhost ([::1]:38964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khucO-00063T-Lj
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 08:13:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1khuZj-0004wY-3e
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 08:11:11 -0500
Received: from indium.canonical.com ([91.189.90.7]:38608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1khuZX-0003gf-Qc
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 08:11:10 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1khuZV-0006o2-Oc
 for <qemu-devel@nongnu.org>; Wed, 25 Nov 2020 13:10:57 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id B6DA62E813A
 for <qemu-devel@nongnu.org>; Wed, 25 Nov 2020 13:10:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2020 13:00:10 -0000
From: Thomas Huth <1842038@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dimsmain stefanha
X-Launchpad-Bug-Reporter: Dmitriy (dimsmain)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <156715467564.28583.4532580571142689623.malonedeb@chaenomeles.canonical.com>
Message-Id: <160630921155.27098.16802706077174444827.launchpad@chaenomeles.canonical.com>
Subject: [Bug 1842038] Re: qemu 4.0/4.1 segfault on live migrate with
 virtio-scsi iothread
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3bd564e52ed9790394c5663a77af1e834fc2d372"; Instance="production"
X-Launchpad-Hash: c1e0793ccc902c9fe4a1f66c03d2368fa17a89f6
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
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
Reply-To: Bug 1842038 <1842038@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: New =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1842038

Title:
  qemu 4.0/4.1 segfault on live migrate with virtio-scsi iothread

Status in QEMU:
  Fix Released

Bug description:
  [root@kvm-nvme5 qemu]# uname -a
  Linux kvm-nvme5 4.14.35-1902.4.8.el7uek.x86_64 #2 SMP Sun Aug 4 22:25:18 =
GMT 2019 x86_64 x86_64 x86_64 GNU/Linux

  [root@kvm-nvme5 qemu]# qemu-system-x86_64 --version
  QEMU emulator version 4.1.0 (qemu-4.1.0-1.el7)
  Copyright (c) 2003-2019 Fabrice Bellard and the QEMU Project developers

  [root@kvm-nvme5 qemu]# libvirtd --version
  libvirtd (libvirt) 5.6.0

  when migrate =

  MIGR_OPTS=3D"--live --copy-storage-all --verbose --persistent --undefines=
ource"
  virsh migrate $MIGR_OPTS p12345 qemu+ssh://$SERV/system

  we got segfault if we have option <driver iothread=3D'1'/> in config for
  virtio-scsi controller

  [1205674.818067] qemu-system-x86[39744]: segfault at 38 ip
  00005575890ad411 sp 00007ffd3c10a0e0 error 6 in qemu-system-
  x86_64[5575889ad000+951000]

  On 4.0 we have error with this context(dont save all output)
  "qemu_coroutine_get_aio_context(co)' failed"

  If we remove option =

  <driver iothread=3D'1'/>
  migrate work fine without segfaults

  2019-08-30 08:25:35.402+0000: starting up libvirt version: 5.6.0, package=
: 1.el7 (Unknown, 2019-08-06-09:57:56, mock), qemu version: 4.1.0qemu-4.1.0=
-1.el7, kernel: 4.14.35-1902.4.8.el7uek.x86_64, hostname: kvm-nvme5
  LC_ALL=3DC \
  PATH=3D/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin \
  HOME=3D/var/lib/libvirt/qemu/domain-75-p541999 \
  XDG_DATA_HOME=3D/var/lib/libvirt/qemu/domain-75-p541999/.local/share \
  XDG_CACHE_HOME=3D/var/lib/libvirt/qemu/domain-75-p541999/.cache \
  XDG_CONFIG_HOME=3D/var/lib/libvirt/qemu/domain-75-p541999/.config \
  QEMU_AUDIO_DRV=3Dnone \
  /usr/bin/qemu-system-x86_64 \
  -name guest=3Dp541999,debug-threads=3Don \
  -S \
  -object secret,id=3DmasterKey0,format=3Draw,file=3D/var/lib/libvirt/qemu/=
domain-75-p541999/master-key.aes \
  -machine pc-q35-4.0,accel=3Dkvm,usb=3Doff,dump-guest-core=3Doff \
  -cpu Cascadelake-Server,ss=3Don,hypervisor=3Don,tsc-adjust=3Don,umip=3Don=
,pku=3Don,md-clear=3Don,stibp=3Don,arch-capabilities=3Don,xsaves=3Don,rdctl=
-no=3Don,ibrs-all=3Don,skip-l1dfl-vmentry=3Don,mds-no=3Don,hv-time,hv-relax=
ed,hv-vapic,hv-spinlocks=3D0x1000,hv-vpindex,hv-runtime,hv-synic,hv-stimer,=
hv-fre
  quencies,hv-reenlightenment,hv-tlbflush \
  -m 2148 \
  -overcommit mem-lock=3Doff \
  -smp 1,sockets=3D1,cores=3D1,threads=3D1 \
  -object iothread,id=3Diothread1 \
  -uuid ff20ae7f-8cfe-4ec5-bd50-e78f8a167414 \
  -no-user-config \
  -nodefaults \
  -chardev socket,id=3Dcharmonitor,fd=3D44,server,nowait \
  -mon chardev=3Dcharmonitor,id=3Dmonitor,mode=3Dcontrol \
  -rtc base=3Dutc,driftfix=3Dslew \
  -global kvm-pit.lost_tick_policy=3Ddelay \
  -no-shutdown \
  -boot menu=3Don,strict=3Don \
  -device ich9-usb-ehci1,id=3Dusb,bus=3Dpcie.0,addr=3D0x5.0x7 \
  -device ich9-usb-uhci1,masterbus=3Dusb.0,firstport=3D0,bus=3Dpcie.0,multi=
function=3Don,addr=3D0x5 \
  -device ich9-usb-uhci2,masterbus=3Dusb.0,firstport=3D2,bus=3Dpcie.0,addr=
=3D0x5.0x1 \
  -device ich9-usb-uhci3,masterbus=3Dusb.0,firstport=3D4,bus=3Dpcie.0,addr=
=3D0x5.0x2 \
  -device virtio-scsi-pci,iothread=3Diothread1,id=3Dscsi0,bus=3Dpcie.0,addr=
=3D0x9 \
  -device virtio-serial-pci,id=3Dvirtio-serial0,bus=3Dpcie.0,addr=3D0x6 \
  -drive file=3D/dev/vm/p541999,format=3Draw,if=3Dnone,id=3Ddrive-scsi0-0-0=
-0,cache=3Dnone,discard=3Dunmap,aio=3Dthreads,throttling.bps-write=3D524288=
00,throttling.bps-write-max=3D314572800,throttling.bps-write-max-length=3D1=
20 \
  -device scsi-hd,bus=3Dscsi0.0,channel=3D0,scsi-id=3D0,lun=3D0,device_id=
=3Ddrive-scsi0-0-0-0,drive=3Ddrive-scsi0-0-0-0,id=3Dscsi0-0-0-0,bootindex=
=3D2,write-cache=3Don \
  -drive if=3Dnone,id=3Ddrive-sata0-0-0,readonly=3Don \
  -device ide-cd,bus=3Dide.0,drive=3Ddrive-sata0-0-0,id=3Dsata0-0-0,bootind=
ex=3D1 \
  -netdev tap,fd=3D47,id=3Dhostnet0,vhost=3Don,vhostfd=3D48 \
  -device virtio-net-pci,netdev=3Dhostnet0,id=3Dnet0,mac=3D00:00:00:54:19:9=
9,bus=3Dpcie.0,addr=3D0x3 \
  -chardev pty,id=3Dcharserial0 \
  -device isa-serial,chardev=3Dcharserial0,id=3Dserial0 \
  -chardev socket,id=3Dcharchannel0,fd=3D49,server,nowait \
  -device virtserialport,bus=3Dvirtio-serial0.0,nr=3D1,chardev=3Dcharchanne=
l0,id=3Dchannel0,name=3Dorg.qemu.guest_agent.0 \
  -vnc 0.0.0.0:6128,password \
  -device cirrus-vga,id=3Dvideo0,bus=3Dpcie.0,addr=3D0x1 \
  -device virtio-balloon-pci,id=3Dballoon0,bus=3Dpcie.0,addr=3D0x8 \
  -sandbox on,obsolete=3Ddeny,elevateprivileges=3Ddeny,spawn=3Ddeny,resourc=
econtrol=3Ddeny \
  -msg timestamp=3Don
  char device redirected to /dev/pts/5 (label charserial0)
  2019-08-30 08:27:00.539+0000: shutting down, reason=3Dcrashed

  =

  config:
  <domain type=3D'kvm'>
    <name>p541999</name>
    <uuid>ff20ae7f-8cfe-4ec5-bd50-e78f8a167414</uuid>
    <memory unit=3D'KiB'>2199552</memory>
    <currentMemory unit=3D'KiB'>2199552</currentMemory>
    <vcpu placement=3D'static'>1</vcpu>
    <iothreads>1</iothreads>
    <resource>
      <partition>/machine</partition>
    </resource>
    <os>
      <type arch=3D'x86_64' machine=3D'pc-q35-4.0'>hvm</type>
      <boot dev=3D'cdrom'/>
      <boot dev=3D'hd'/>
      <bootmenu enable=3D'yes'/>
    </os>
    <features>
      <acpi/>
      <apic/>
      <pae/>
      <hyperv>
        <relaxed state=3D'on'/>
        <vapic state=3D'on'/>
        <spinlocks state=3D'on' retries=3D'4096'/>
        <vpindex state=3D'on'/>
        <runtime state=3D'on'/>
        <synic state=3D'on'/>
        <stimer state=3D'on'/>
        <frequencies state=3D'on'/>
        <reenlightenment state=3D'on'/>
        <tlbflush state=3D'on'/>
      </hyperv>
      <msrs unknown=3D'ignore'/>
    </features>
    <cpu mode=3D'host-model' check=3D'full'>
      <model fallback=3D'forbid'/>
    </cpu>
    <clock offset=3D'utc'>
      <timer name=3D'rtc' tickpolicy=3D'catchup'/>
      <timer name=3D'pit' tickpolicy=3D'delay'/>
      <timer name=3D'hpet' present=3D'yes'/>
      <timer name=3D'hypervclock' present=3D'yes'/>
    </clock>
    <on_poweroff>destroy</on_poweroff>
    <on_reboot>restart</on_reboot>
    <on_crash>restart</on_crash>
    <devices>
      <emulator>/usr/bin/qemu-system-x86_64</emulator>
      <disk type=3D'block' device=3D'disk'>
        <driver name=3D'qemu' type=3D'raw' cache=3D'none' io=3D'threads' di=
scard=3D'unmap'/>
        <source dev=3D'/dev/vm/p541999'/>
        <backingStore/>
        <target dev=3D'sda' bus=3D'scsi'/>
        <iotune>
          <write_bytes_sec>52428800</write_bytes_sec>
          <write_bytes_sec_max>314572800</write_bytes_sec_max>
          <write_bytes_sec_max_length>120</write_bytes_sec_max_length>
        </iotune>
        <address type=3D'drive' controller=3D'0' bus=3D'0' target=3D'0' uni=
t=3D'0'/>
      </disk>
      <disk type=3D'file' device=3D'cdrom'>
        <driver name=3D'qemu' type=3D'raw'/>
        <target dev=3D'sdb' bus=3D'sata'/>
        <readonly/>
        <address type=3D'drive' controller=3D'0' bus=3D'0' target=3D'0' uni=
t=3D'0'/>
      </disk>
      <controller type=3D'usb' index=3D'0' model=3D'ich9-ehci1'>
        <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x05' =
function=3D'0x7'/>
      </controller>
      <controller type=3D'usb' index=3D'0' model=3D'ich9-uhci1'>
        <master startport=3D'0'/>
        <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x05' =
function=3D'0x0' multifunction=3D'on'/>
      </controller>
      <controller type=3D'usb' index=3D'0' model=3D'ich9-uhci2'>
        <master startport=3D'2'/>
        <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x05' =
function=3D'0x1'/>
      </controller>
      <controller type=3D'usb' index=3D'0' model=3D'ich9-uhci3'>
        <master startport=3D'4'/>
        <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x05' =
function=3D'0x2'/>
      </controller>
      <controller type=3D'virtio-serial' index=3D'0'>
        <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x06' =
function=3D'0x0'/>
      </controller>
      <controller type=3D'scsi' index=3D'0' model=3D'virtio-scsi'>
        <driver iothread=3D'1'/>
        <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x09' =
function=3D'0x0'/>
      </controller>
      <controller type=3D'pci' index=3D'0' model=3D'pcie-root'/>
      <controller type=3D'sata' index=3D'0'>
        <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x1f' =
function=3D'0x2'/>
      </controller>
      <interface type=3D'bridge'>
        <mac address=3D'00:00:00:54:19:99'/>
        <source bridge=3D'br0'/>
        <bandwidth>
          <inbound average=3D'12500' peak=3D'12500' burst=3D'1024'/>
          <outbound average=3D'12500' peak=3D'12500' burst=3D'1024'/>
        </bandwidth>
        <model type=3D'virtio'/>
        <filterref filter=3D'clean-traffic'>
          <parameter name=3D'CTRL_IP_LEARNING' value=3D'none'/>
          <parameter name=3D'IP' value=3D'1.2.3.4'/>
        </filterref>
        <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x03' =
function=3D'0x0'/>
      </interface>
      <serial type=3D'pty'>
        <target type=3D'isa-serial' port=3D'0'>
          <model name=3D'isa-serial'/>
        </target>
      </serial>
      <console type=3D'pty'>
        <target type=3D'serial' port=3D'0'/>
      </console>
      <channel type=3D'unix'>
        <source mode=3D'bind' path=3D'/var/lib/libvirt/qemu/p541999.agent'/>
        <target type=3D'virtio' name=3D'org.qemu.guest_agent.0'/>
        <address type=3D'virtio-serial' controller=3D'0' bus=3D'0' port=3D'=
1'/>
      </channel>
      <input type=3D'mouse' bus=3D'ps2'/>
      <input type=3D'keyboard' bus=3D'ps2'/>
      <graphics type=3D'vnc' port=3D'12028' autoport=3D'no' listen=3D'0.0.0=
.0' passwd=3D'SUPERPASSWORD'>
        <listen type=3D'address' address=3D'0.0.0.0'/>
      </graphics>
      <video>
        <model type=3D'cirrus' vram=3D'16384' heads=3D'1' primary=3D'yes'/>
        <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x01' =
function=3D'0x0'/>
      </video>
      <memballoon model=3D'virtio'>
        <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x08' =
function=3D'0x0'/>
      </memballoon>
    </devices>
    <seclabel type=3D'none' model=3D'none'/>
  </domain>

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1842038/+subscriptions

