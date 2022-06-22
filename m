Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB856554AC0
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 15:16:30 +0200 (CEST)
Received: from localhost ([::1]:47900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o40Dd-0004ff-CE
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 09:16:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pade@trifox.com>)
 id 1o3qy1-0003o1-DW; Tue, 21 Jun 2022 23:23:45 -0400
Received: from 50-247-71-33-static.hfc.comcastbusiness.net
 ([50.247.71.33]:56985 helo=mail.trifox.com)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pade@trifox.com>)
 id 1o3qxz-0004tI-Bh; Tue, 21 Jun 2022 23:23:45 -0400
Received: from TRI225 (tri225.trifox.com [192.0.2.225])
 by mail.trifox.com (Postfix) with ESMTPA id E89903CA;
 Tue, 21 Jun 2022 13:59:43 -0700 (PDT)
From: "Paul Dembry" <pade@trifox.com>
To: "'Daniel Henrique Barboza'" <danielhb413@gmail.com>, <qemu-ppc@nongnu.org>,
 <qemu-devel@nongnu.org>
References: <00d101d88588$173538c0$459faa40$@trifox.com>
 <b2f5539f-2504-3c20-1f2b-5b7f03f2ea52@gmail.com>
In-Reply-To: <b2f5539f-2504-3c20-1f2b-5b7f03f2ea52@gmail.com>
Subject: RE: AIX 7.2 guest, Windows 10 host, networking, qemu 6.0.50.
Date: Tue, 21 Jun 2022 20:23:40 -0700
Organization: Trifox, Inc.
Message-ID: <001501d885e7$77e6bea0$67b43be0$@trifox.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIOPk4JtLjrNmH8eDNWY04tgZ0DtAIIyaxarN76xLA=
Content-Language: en-us
Received-SPF: pass client-ip=50.247.71.33; envelope-from=pade@trifox.com;
 helo=mail.trifox.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, RCVD_ILLEGAL_IP=1.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 22 Jun 2022 09:13:11 -0400
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: pade@trifox.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Daniel,
  Thank your for your information. I decided to try to get this working =
on my linux esxi guest because qemu AIX comes up in 5 minutes vs 10-12 =
on my Windows machine and I am rebooting often. I used your -device =
spapr-vlan and -netdev tap options. My complete qemu startup is

/usr/local/bin/qemu-system-ppc64 -cpu POWER8 -machine pseries -m 3072 =
-serial stdio \
 -drive =
file=3D/usr2/qemu/aix72/aix.img,if=3Dnone,id=3Ddrive-virtio-disk0 \
 -device virtio-scsi-pci,id=3Dscsi -device =
scsi-hd,drive=3Ddrive-virtio-disk0 \
 -drive =
file=3D/usr2/qemu/aix72/aix1.img,if=3Dnone,id=3Ddrive-virtio-disk1 \
 -device scsi-hd,drive=3Ddrive-virtio-disk1 \
 -display vnc=3D:1 -g 1280x1024 \
 -cdrom /usr2/qemu/aix72/cdrom.iso \
 -prom-env "boot-command=3Dboot disk:" \
 -device spapr-vlan,netdev=3Dnet0,mac=3D52:54:00:49:53:14 \
 -netdev =
tap,id=3Dnet0,helper=3D/usr/local/libexec/qemu-bridge-helper,br=3Dvirbr0

Linux host (192.0.2.186) shows
ens160: flags=3D4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.0.2.186  netmask 255.255.255.0  broadcast 192.0.2.255
        inet6 fe80::20c:29ff:fef6:5732  prefixlen 64  scopeid 0x20<link>
        ether 00:0c:29:f6:57:32  txqueuelen 1000  (Ethernet)
        RX packets 11506150  bytes 30643403943 (30.6 GB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 1626763  bytes 21619253603 (21.6 GB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=3D73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 2118  bytes 202514 (202.5 KB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 2118  bytes 202514 (202.5 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

tap0: flags=3D4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet6 fe80::fc04:20ff:fe9d:ee6d  prefixlen 64  scopeid =
0x20<link>
        ether 32:3b:ac:a5:d6:5f  txqueuelen 1000  (Ethernet)
        RX packets 12  bytes 976 (976.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 4032  bytes 210056 (210.0 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

virbr0: flags=3D4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.122.1  netmask 255.255.255.0  broadcast =
192.168.122.255
        ether 52:54:00:29:24:24  txqueuelen 1000  (Ethernet)
        RX packets 262  bytes 21672 (21.6 KB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 2  bytes 84 (84.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

vnet10: flags=3D4099<UP,BROADCAST,MULTICAST>  mtu 1500
        inet6 fe80::b842:6ff:fe28:d7d4  prefixlen 64  scopeid 0x20<link>
        ether ba:42:06:28:d7:d4  txqueuelen 1000  (Ethernet)
        RX packets 36  bytes 1956 (1.9 KB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 25  bytes 1914 (1.9 KB)
        TX errors 0  dropped 5 overruns 0  carrier 0  collisions 0
(I think vnet10 is a leftover from some of my attempts)

/usr/local/etc/qemu/bridge.conf has
allow virbr0

netstat -r shows

Kernel IP routing table
Destination     Gateway         Genmask         Flags   MSS Window  irtt =
Iface
default         _gateway        0.0.0.0         UG        0 0          0 =
ens160
192.0.2.0       0.0.0.0         255.255.255.0   U         0 0          0 =
ens160
192.0.2.96      0.0.0.0         255.255.255.255 UH        0 0          0 =
vnet10
192.168.122.0   0.0.0.0         255.255.255.0   U         0 0          0 =
virbr0

(tri862 =3D 192.0.2.186)

AIX shows:
# /usr/sbin/ifconfig -a
en0: =
flags=3De084863,480<UP,BROADCAST,NOTRAILERS,RUNNING,SIMPLEX,MULTICAST,GRO=
UPRT,64BIT,CHAIN>
        inet 192.0.2.96 netmask 0xffffff00 broadcast 192.0.2.255
         tcp_sendspace 262144 tcp_recvspace 262144 rfc1323 1
lo0: =
flags=3De08084b,c0<UP,BROADCAST,LOOPBACK,RUNNING,SIMPLEX,MULTICAST,GROUPR=
T,64BIT,LARGESEND,CHAIN>
        inet 127.0.0.1 netmask 0xff000000 broadcast 127.255.255.255
        inet6 ::1%1/64
         tcp_sendspace 131072 tcp_recvspace 131072 rfc1323 1

netstat -r shows

# netstat -r
Routing tables
Destination        Gateway           Flags   Refs     Use  If   Exp  =
Groups

Route Tree for Protocol Family 2 (Internet):
127/8              loopback          U         4      1676 lo0      -    =
  -  =20
192.0.2.0          tri6qemu          UHSb      0         0 en0      -    =
  -   =3D>
192.0.2/24         tri6qemu          U         0        13 en0      -    =
  -  =20
tri6qemu           loopback          UGHS      0         2 lo0      -    =
  -  =20
192.0.2.255        tri6qemu          UHSb      0         0 en0      -    =
  -  =20

(tri6qemu =3D 192.0.2.96).

1. It seems to me that host linux needs to "connect" a route between =
virbr0 and 192.0.2.96 so that packets heading to Aix guest get routed to =
virbr0. Not clear where vibr0 got 192.168.122.1? Maybe assign 192.0.2.96 =
<-> 192.168.122.0 gateway?
2. And somehow guest AIX needs a gateway that somehow connects to virbr0 =
so that packets heading to Linux host get routed to virbr0.
3. I think this picture might do it: =
https://www.jazakallah.info/post/how-to-setup-network-for-ibm-aix-vm-acce=
ss-in-qemu? AIX guest doesn't have to be 192.0.2.x, I can make it =
whatever it takes just so I can transfer files and xterm from it to my =
system.=20

I do not recall the command line I used to create the AIX images. I did =
it last year on Windows and when networking didn't work, I put it aside =
but my disk files are from that period. What really perplexes me is that =
this must have somehow worked at one point because my AIX disk images =
have the xlc v13 and v16 compilers which do not come with the base OS. =
Somehow I got the tar files to the AIX sytem to do those installs.
Regards,
Paul

-----Original Message-----
From: Daniel Henrique Barboza <danielhb413@gmail.com>=20
Sent: Tuesday, June 21, 2022 3:05 PM
To: pade@trifox.com; qemu-ppc@nongnu.org; qemu-devel@nongnu.org
Subject: Re: AIX 7.2 guest, Windows 10 host, networking, qemu 6.0.50.

Hi Paul,

I'm CC'ing the overall QEMU mailing list as well to increase the chance =
of finding someone that runs QEMU on Windows.

On 6/21/22 13:00, Paul Dembry wrote:
> I have AIX 7.2 installed and running fine however I cannot get any =
access to it via my LAN. I have tried multiple variations of -netdev and =
-device, the AIX system =E2=80=9Csees=E2=80=9D en0, but nothing more.


This is a working example of an AIX guest with network using the =
spapr-vlan net device:

-M pseries,ic-mode=3Dxics -cpu POWER9 -smp 2 \ -device =
spapr-vlan,netdev=3Dnet0,mac=3D52:54:00:49:53:14 \ -netdev =
tap,id=3Dnet0,helper=3D/usr/libexec/qemu-bridge-helper,br=3Dvirbr0 \ =
-device virtio-scsi,id=3Dscsi0 \ -drive =
file=3D./disk.qcow2,if=3Dnone,id=3Ddrive-scsi0-0-0-0,format=3Dqcow2,cache=
=3Dnone \ -device =
scsi-hd,bus=3Dscsi0.0,channel=3D0,scsi-id=3D0,lun=3D0,drive=3Ddrive-scsi0=
-0-0-0,id=3Dscsi0-0-0-0,bootindex=3D1



> The examples I have found all use a linux host which I can use however =
when I set up the bridge device, I lost LAN connectivity to my linux =
machine (ESXi guest). What I want to accomplish is the AIX system =
appearing like any other machine on my LAN with bi-directional =
connectivity. Failing that, it would be ok if it spoke only to the =
Windows host because I could move files to/from the Windows host and AIX =
guest. Has anyone been successful at this at doing this or have any =
ideas of how I can accomplish this feat? This would be very handy =
because my =E2=80=9Creal=E2=80=9D AIX box does not have an HMC and so I =
cannot remote boot it.

I've never tried to run QEMU using Windows. I'll give a try when I have =
the chance. I guess that one core difference is how you'll create the =
network bridge for the guest.


Which command line did you use to create the AIX guest?


>=20
> That fact that AIX 7.2 even comes up on qemu ppc64 is a tremendous =
achievement =F0=9F=98=8A!!

An even greater achievement would be to make it work under a Windows 10 =
host :D


Take care,


Daniel

>=20
> Paul
>=20


