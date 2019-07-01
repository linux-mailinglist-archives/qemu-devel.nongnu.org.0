Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B758F4D457
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jun 2019 18:54:53 +0200 (CEST)
Received: from localhost ([::1]:50400 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1he0Ko-0005f6-Eq
	for lists+qemu-devel@lfdr.de; Thu, 20 Jun 2019 12:54:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42128)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1he06h-0005EM-7z
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 12:40:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hdzwe-00019Y-GK
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 12:29:54 -0400
Received: from indium.canonical.com ([91.189.90.7]:36636)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hdzwc-00017b-QO
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 12:29:50 -0400
Received: from gac.canonical.com ([91.189.90.20])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hdzwZ-0008NO-CX
 for <qemu-devel@nongnu.org>; Thu, 20 Jun 2019 16:29:47 +0000
Received: from gac.canonical.com (localhost [IPv6:::1])
 by gac.canonical.com (Postfix) with ESMTPS id 4F06D5C06D0
 for <qemu-devel@nongnu.org>; Thu, 20 Jun 2019 16:29:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Jun 2019 16:29:46 -0000
From: Launchpad Bug Tracker <1829696@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: centos clock qemu-kvm redhat
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: berrange qianxi416
X-Launchpad-Bug-Reporter: qianxi (qianxi416)
X-Launchpad-Bug-Modifier: Kashyap Chamarthy (kashyapc)
References: <155832450585.26079.9550620234862222790.malonedeb@soybean.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Message-Id: <156104818702.21625.7883452233792353592.launchpad@gac.canonical.com>
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="18986";
 Instance="appserver-secrets-lazr.conf"
X-Launchpad-Hash: 536c0b318b23c245fd3845153f117af5c0736e2d
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1829696] [NEW] qemu-kvm takes 100% CPU when
 running redhat/centos 7.6 guest VM OS
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
Reply-To: Bug 1829696 <1829696@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

You have been subscribed to a public bug:

Description
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
When running redhat or centos 7.6 guest os on vm,
the cpu usage is very low on vm(100% idle), but on host,
qemu-kvm reports 100% cpu busy usage.

After searching some related bugs report,
I suspect that it is due to the clock settings in vm's domain xml.
My Openstack cluster uses the default clock settings as follow:
    <clock offset=3D'utc'>
      <timer name=3D'rtc' tickpolicy=3D'catchup'/>
      <timer name=3D'pit' tickpolicy=3D'delay'/>
      <timer name=3D'hpet' present=3D'no'/>
    </clock>
And in this report, https://bugs.launchpad.net/qemu/+bug/1174654
it claims that <timer name=3D'rtc' track=3D'guest'/> can solve the 100% cpu=
 usage problem when using Windows Image Guest OS,
but I makes some tests, the solusion dose not work for me.


Steps to reproduce
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
* create a vm using centos or redhat 7.6 image
* using sar tool inside vm and host to check the cpu usage, and compare them


Expected result
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
host's cpu usage report should be same with vm's cpu usage


Actual result
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
vm's cpu usage is 100% idle, host's cpu usage is 100% busy


Environment
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
1. Exact version of OpenStack you are running.
# rpm -qa | grep nova
openstack-nova-compute-13.1.2-1.el7.noarch
python2-novaclient-3.3.2-1.el7.noarch
python-nova-13.1.2-1.el7.noarch
openstack-nova-common-13.1.2-1.el7.noarch

2. Which hypervisor did you use?
   (For example: Libvirt + KVM, Libvirt + XEN, Hyper-V, PowerKVM, ...)
   What's the version of that?
# libvirtd -V
libvirtd (libvirt) 3.9.0

# /usr/libexec/qemu-kvm --version
QEMU emulator version 2.6.0 (qemu-kvm-ev-2.6.0-28.el7_3.6.1), Copyright (c)=
 2003-2008 Fabrice Bellard


Logs & Configs
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
The VM xml:
<domain type=3D'kvm' id=3D'29'>
  <name>instance-00005022</name>
  <uuid>7f5a66a5-****-****-****-75dec****bbb</uuid>
  <metadata>
    <nova:instance xmlns:nova=3D"http://openstack.org/xmlns/libvirt/nova/1.=
0">
      <nova:package version=3D"13.1.2-1.el7"/>
      <nova:name>*******</nova:name>
      <nova:creationTime>2019-05-20 03:08:46</nova:creationTime>
      <nova:flavor name=3D"2d2dab36-****-****-****-246e9****110">
        <nova:memory>2048</nova:memory>
        <nova:disk>12</nova:disk>
        <nova:swap>2048</nova:swap>
        <nova:ephemeral>0</nova:ephemeral>
        <nova:vcpus>1</nova:vcpus>
      </nova:flavor>
      <nova:owner>
        <nova:user uuid=3D"********************">****</nova:user>
        <nova:project uuid=3D"********************">****</nova:project>
      </nova:owner>
      <nova:root type=3D"image" uuid=3D"4496a420-****-****-****-b50f****ada=
3"/>
    </nova:instance>
  </metadata>
  <memory unit=3D'KiB'>2097152</memory>
  <currentMemory unit=3D'KiB'>2097152</currentMemory>
  <vcpu placement=3D'static'>1</vcpu>
  <cputune>
    <shares>1024</shares>
    <vcpupin vcpu=3D'0' cpuset=3D'27'/>
    <emulatorpin cpuset=3D'27'/>
  </cputune>
  <numatune>
    <memory mode=3D'strict' nodeset=3D'1'/>
    <memnode cellid=3D'0' mode=3D'strict' nodeset=3D'1'/>
  </numatune>
  <resource>
    <partition>/machine</partition>
  </resource>
  <sysinfo type=3D'smbios'>
    <system>
      <entry name=3D'manufacturer'>Fedora Project</entry>
      <entry name=3D'product'>OpenStack Nova</entry>
      <entry name=3D'version'>13.1.2-1.el7</entry>
      <entry name=3D'serial'>64ab0e89-****-****-****-05312ef66983</entry>
      <entry name=3D'uuid'>7f5a66a5-****-****-****-75decaf82bbb</entry>
      <entry name=3D'family'>Virtual Machine</entry>
    </system>
  </sysinfo>
  <os>
    <type arch=3D'x86_64' machine=3D'pc-i440fx-rhel7.3.0'>hvm</type>
    <boot dev=3D'hd'/>
    <smbios mode=3D'sysinfo'/>
  </os>
  <features>
    <acpi/>
    <apic/>
  </features>
  <cpu mode=3D'custom' match=3D'exact' check=3D'full'>
    <model fallback=3D'forbid'>IvyBridge</model>
    <topology sockets=3D'1' cores=3D'1' threads=3D'1'/>
    <feature policy=3D'require' name=3D'hypervisor'/>
    <feature policy=3D'require' name=3D'arat'/>
    <feature policy=3D'require' name=3D'xsaveopt'/>
    <numa>
      <cell id=3D'0' cpus=3D'0' memory=3D'2097152' unit=3D'KiB'/>
    </numa>
  </cpu>
  <clock offset=3D'utc'>
    <timer name=3D'pit' tickpolicy=3D'delay'/>
    <timer name=3D'rtc' tickpolicy=3D'catchup'/>
    <timer name=3D'hpet' present=3D'no'/>
  </clock>
  <on_poweroff>destroy</on_poweroff>
  <on_reboot>restart</on_reboot>
  <on_crash>destroy</on_crash>
  <devices>
    <emulator>/usr/libexec/qemu-kvm</emulator>
    <disk type=3D'file' device=3D'disk'>
      <driver name=3D'qemu' type=3D'raw' cache=3D'none'/>
      <source file=3D'/data/instances/7f5a66a5-****-****-****-75decaf82bbb/=
disk'/>
      <backingStore/>
      <target dev=3D'vda' bus=3D'virtio'/>
      <alias name=3D'virtio-disk0'/>
      <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x04' fu=
nction=3D'0x0'/>
    </disk>
    <disk type=3D'file' device=3D'disk'>
      <driver name=3D'qemu' type=3D'raw' cache=3D'none'/>
      <source file=3D'/data/instances/7f5a66a5-****-****-****-75decaf82bbb/=
disk.swap'/>
      <backingStore/>
      <target dev=3D'vdb' bus=3D'virtio'/>
      <alias name=3D'virtio-disk1'/>
      <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x05' fu=
nction=3D'0x0'/>
    </disk>
    <disk type=3D'file' device=3D'cdrom'>
      <driver name=3D'qemu' type=3D'raw' cache=3D'none'/>
      <source file=3D'/data/instances/7f5a66a5-****-****-****-75decaf82bbb/=
disk.config'/>
      <backingStore/>
      <target dev=3D'hdd' bus=3D'ide'/>
      <readonly/>
      <alias name=3D'ide0-1-1'/>
      <address type=3D'drive' controller=3D'0' bus=3D'1' target=3D'0' unit=
=3D'1'/>
    </disk>
    <controller type=3D'usb' index=3D'0' model=3D'piix3-uhci'>
      <alias name=3D'usb'/>
      <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x01' fu=
nction=3D'0x2'/>
    </controller>
    <controller type=3D'pci' index=3D'0' model=3D'pci-root'>
      <alias name=3D'pci.0'/>
    </controller>
    <controller type=3D'ide' index=3D'0'>
      <alias name=3D'ide'/>
      <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x01' fu=
nction=3D'0x1'/>
    </controller>
    <interface type=3D'bridge'>
      <mac address=3D'fa:16:3e:a6:ea:4f'/>
      <source bridge=3D'brq52c66dc3-64'/>
      <bandwidth>
        <inbound average=3D'102400'/>
        <outbound average=3D'102400'/>
      </bandwidth>
      <target dev=3D'tapa29e94e5-42'/>
      <model type=3D'virtio'/>
      <alias name=3D'net0'/>
      <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x03' fu=
nction=3D'0x0'/>
    </interface>
    <serial type=3D'file'>
      <source path=3D'/data/instances/7f5a66a5-****-****-****-75decaf82bbb/=
console.log'/>
      <target type=3D'isa-serial' port=3D'0'>
        <model name=3D'isa-serial'/>
      </target>
      <alias name=3D'serial0'/>
    </serial>
    <serial type=3D'pty'>
      <source path=3D'/dev/pts/10'/>
      <target type=3D'isa-serial' port=3D'1'>
        <model name=3D'isa-serial'/>
      </target>
      <alias name=3D'serial1'/>
    </serial>
    <console type=3D'file'>
      <source path=3D'/data/instances/7f5a66a5-****-****-****-75decaf82bbb/=
console.log'/>
      <target type=3D'serial' port=3D'0'/>
      <alias name=3D'serial0'/>
    </console>
    <input type=3D'tablet' bus=3D'usb'>
      <alias name=3D'input0'/>
      <address type=3D'usb' bus=3D'0' port=3D'1'/>
    </input>
    <input type=3D'mouse' bus=3D'ps2'>
      <alias name=3D'input1'/>
    </input>
    <input type=3D'keyboard' bus=3D'ps2'>
      <alias name=3D'input2'/>
    </input>
    <graphics type=3D'vnc' port=3D'5910' autoport=3D'yes' listen=3D'0.0.0.0=
' keymap=3D'en-us'>
      <listen type=3D'address' address=3D'0.0.0.0'/>
    </graphics>
    <video>
      <model type=3D'cirrus' vram=3D'16384' heads=3D'1' primary=3D'yes'/>
      <alias name=3D'video0'/>
      <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x02' fu=
nction=3D'0x0'/>
    </video>
    <memballoon model=3D'virtio'>
      <stats period=3D'10'/>
      <alias name=3D'balloon0'/>
      <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x06' fu=
nction=3D'0x0'/>
    </memballoon>
  </devices>
  <seclabel type=3D'dynamic' model=3D'dac' relabel=3D'yes'>
    <label>+107:+107</label>
    <imagelabel>+107:+107</imagelabel>
  </seclabel>
</domain>

CPU Usage Report inside VM:
# sar -u -P 0 1 5
Linux 3.10.0-957.el7.x86_64 (******) 	05/20/2019 	_x86_64_	(1 CPU)

11:34:40 AM     CPU     %user     %nice   %system   %iowait    %steal     %=
idle
11:34:41 AM       0      0.00      0.00      0.00      0.00      0.00    10=
0.00
11:34:42 AM       0      0.00      0.00      0.00      0.00      0.00    10=
0.00
11:34:43 AM       0      0.00      0.00      0.00      0.00      0.00    10=
0.00
11:34:44 AM       0      0.00      0.00      0.00      0.00      0.00    10=
0.00
11:34:45 AM       0      0.00      0.00      0.00      0.00      0.00    10=
0.00
Average:          0      0.00      0.00      0.00      0.00      0.00    10=
0.00

CPU Usage Report ON HOST(the vm's cpu is pinned on host's no.27 physic cpu):
# sar -u -P 27 1 5
Linux 3.10.0-862.el7.x86_64 (******) 	05/20/2019 	_x86_64_	(48 CPU)

11:34:40 AM     CPU     %user     %nice   %system   %iowait    %steal     %=
idle
11:34:41 AM      27    100.00      0.00      0.00      0.00      0.00      =
0.00
11:34:42 AM      27    100.00      0.00      0.00      0.00      0.00      =
0.00
11:34:43 AM      27    100.00      0.00      0.00      0.00      0.00      =
0.00
11:34:44 AM      27    100.00      0.00      0.00      0.00      0.00      =
0.00
11:34:45 AM      27    100.00      0.00      0.00      0.00      0.00      =
0.00
Average:         27    100.00      0.00      0.00      0.00      0.00      =
0.00

clocksource inside VM:
# cat /sys/devices/system/clocksource/clocksource0/current_clocksource
kvm_clock

** Affects: qemu
     Importance: Undecided
         Status: New


** Tags: centos clock qemu-kvm redhat
-- =

qemu-kvm takes 100% CPU when running redhat/centos 7.6 guest VM OS
https://bugs.launchpad.net/bugs/1829696
You received this bug notification because you are a member of qemu-devel-m=
l, which is subscribed to QEMU.

