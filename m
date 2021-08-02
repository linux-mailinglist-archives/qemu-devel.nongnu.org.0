Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F443DE3ED
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 03:20:57 +0200 (CEST)
Received: from localhost ([::1]:41972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAj72-0004sb-1K
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 21:20:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ryan.Lindsay@petermac.org>)
 id 1mAhGl-0003Hi-Rr; Mon, 02 Aug 2021 19:22:51 -0400
Received: from mail-me3aus01on2139.outbound.protection.outlook.com
 ([40.107.108.139]:16354 helo=AUS01-ME3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ryan.Lindsay@petermac.org>)
 id 1mAhGf-0001Vg-SF; Mon, 02 Aug 2021 19:22:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cfDfwOmLAcg+YZhbwFIrNDUpbfElQ6uKc12R/JLUm9+FdYLgqGiuzzRPgbMo75pgpqP4HBNmfTreOZGzE/VUQw1iyHw7PKFncYYw/kL6R8Vu+pm4rRBcImpne1+EtxViMhpBGNVoVEEM1eO1sHpDS/k2BWrS0FspDcFtfCaq8BmXrdR1AT4UiY6132jWPUg320eOVUI4UVvpHA7W13pCdn7VCJXGc6ZS0iQvPfuKc6K4WwOJ7el33BPY+NyfB4lk9GTZo1F5iz+cBK6TMb6PMJuhTwYDoiil2NiXs4Jv+u+e+MK9pQFfyYuc8/o+f3bzRupMscfsNWEzNqmcwZSlkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NoOTjtaqd5lu+jZi+kLd28J3PqyuxQLEYiWkJ/kku8I=;
 b=RFLrcIIbfLWbxok03Rl06Vx/IO8OT+g+n1fDJiQzLC4jg/UOE1BC9oKiL6F0jyCwdBWcLuejXFWXwvo6HCsjngHrYxEYZcABuoY8nbwDAvQh0vEO0zs3yaKjja4LcZmlkbv825H0xlQ58hVG+QpjLViEOCQT4SmwVReSOK+hO5ymG0qV5ILfg6C5dNXOf49PYIDpcnIqFFvR25GzYrn0VSwWM2aX/VxlOYXs4C85vB7Fje8Bce5ZYSpgKUya7Wk6A7b7GmuDlKU6LFxGGCyKTeAGvpLxAv5n4Zn9amH3Gd1JmxmImfCUR+sKqA+VLEwHg0qxCZ6MtwuplWErnxGzSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=petermac.org; dmarc=pass action=none header.from=petermac.org;
 dkim=pass header.d=petermac.org; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=PeterMacVic.onmicrosoft.com; s=selector1-PeterMacVic-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NoOTjtaqd5lu+jZi+kLd28J3PqyuxQLEYiWkJ/kku8I=;
 b=Sv8nslPM0yWlUDwv/Hf6Mr/NFlhHmg0ObSThtj6X9R75Bhqay9aiQKuSFFaX4hK3xd/j+Na9pHF0cfz2pKhlpLy7hyjaAmfJzNWNe9Z/TERpb8lY/Hd+v6aFvDjwt2zgGNaFUafZEHgkDpvPegaDKwSdAboRf0T//05fLkNNiPQ=
Received: from MEYP282MB1687.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:ba::8) by
 MEYP282MB2421.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:11b::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.18; Mon, 2 Aug 2021 23:22:33 +0000
Received: from MEYP282MB1687.AUSP282.PROD.OUTLOOK.COM
 ([fe80::38f9:6b9c:3dbd:c099]) by MEYP282MB1687.AUSP282.PROD.OUTLOOK.COM
 ([fe80::38f9:6b9c:3dbd:c099%4]) with mapi id 15.20.4373.026; Mon, 2 Aug 2021
 23:22:33 +0000
From: Lindsay Ryan <Ryan.Lindsay@petermac.org>
To: =?iso-8859-1?Q?C=E9dric_Le_Goater?= <clg@kaod.org>,
 =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>,
 "qemu-discuss@nongnu.org" <qemu-discuss@nongnu.org>
Subject: Re: need help with my config
Thread-Topic: need help with my config
Thread-Index: AQHXhPgugg8suvQtYE6qremYr/LHs6tbgu2AgAA5K4CABSOW4w==
Date: Mon, 2 Aug 2021 23:22:33 +0000
Message-ID: <MEYP282MB1687AFC06D7168F3B4A3B9CEF9EF9@MEYP282MB1687.AUSP282.PROD.OUTLOOK.COM>
References: <MEYP282MB168775224F9A7690C9F5AEF9F9EC9@MEYP282MB1687.AUSP282.PROD.OUTLOOK.COM>
 <82ae0532-50c2-7a67-af16-04226cb2986b@redhat.com>,
 <39f8272b-2c2f-08d6-1fb5-cd519fdf2bbd@kaod.org>
In-Reply-To: <39f8272b-2c2f-08d6-1fb5-cd519fdf2bbd@kaod.org>
Accept-Language: en-AU, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kaod.org; dkim=none (message not signed)
 header.d=none;kaod.org; dmarc=none action=none header.from=petermac.org;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 51c54900-afa6-4570-802d-08d9560c6805
x-ms-traffictypediagnostic: MEYP282MB2421:
x-microsoft-antispam-prvs: <MEYP282MB242132A1E9985A1B0396618EF9EF9@MEYP282MB2421.AUSP282.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wRdPa1smRdANIsd7/kpxUt0ey79rqHxZ69HxT+8yHgvmBPl/qRgYl6A3/14upit4U/UDiG+a9h6we5dyC0zvtFE3tgSZabbTLXo+ZbtKhgPO4zj0Gw8cvAD4xMOG0i3LYvdWwW0jX6YEjJcXJaSR5e2ao+Z7ykmgM7AAi9oemvJnZL2Hny2vgoVPMnv07YPzfU2r61LIKr/+Cpqz2t1R1Rf+qpg1AXDNQCifTY2oYw4PDTnolsWKFOcWBSmDao+Ye2cdVLn/IV5bJ0Cv8n9TnXy+IgbiTaqysjF+IWafgMC8HKN6mTTf8qPVclnyunkL7zzhYkOP34SRghKzXvtUZshM7/Z2OUgXQR+TiMJJu/gZYBu0njaz6StIC93Af3hXCyjJic/k+d8g5QkMY9ut9N9wYGD/B9zd0a/P41B2imuohSTUFEPCs11DOiNrf7BAKzOABH5FnPvMGVV9rvmbWmU3pserP/myIKKpKMmzypyP+nrQaY929R+qpiWCtOQTcHzGqrNu2VHo5eX9CPhl8Te10RWWhrAql6aA7u/P5j3WzlnvUEEu8N5fP5iBx1po1Jl7VifWZgAhYhFfan2VzHH7rNHKmJV5xjnJ9yEytxnG5ydiJgmVzwmT5oFb1dvExHaYA/5e8d/PXyZy3vMjdSPFpx479AWKI6eCe8PHkWFpFJBX6HvmtQev4b/2ldACr9AQx6KpAkH+ncnkuEWf3g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MEYP282MB1687.AUSP282.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(396003)(136003)(366004)(346002)(39860400002)(376002)(76116006)(66946007)(52536014)(110136005)(8936002)(2906002)(8676002)(66476007)(66556008)(64756008)(5660300002)(38070700005)(86362001)(21615005)(19627405001)(66446008)(66574015)(166002)(83380400001)(122000001)(33656002)(7696005)(55016002)(966005)(4326008)(54906003)(53546011)(6506007)(186003)(786003)(316002)(478600001)(71200400001)(9686003)(38100700002)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?zxM0mZh1HlxcaXexam5wo4/SgFOcZDnnONjvCdw0ViFYDft/xH78Ubjbqq?=
 =?iso-8859-1?Q?ybpszDqrIJHpOxt23BBJdy6Z1GgAhiSteFDcfm/KnzKcqUA9qDeqhgqCp/?=
 =?iso-8859-1?Q?m9cl7O07wBLFHIWRViGhcyN4BeSPZ53EcbCqFIz3suVevBmqKTpl29nqLG?=
 =?iso-8859-1?Q?aVXG4rsZZdxueZZWVxl5Ob69cfcdLh1bkGDjpM1kIC+NxdiqYC5haFkNVm?=
 =?iso-8859-1?Q?HpRhtFzR1Gefd+KrIDMkS+a0MDtEi4Sf4dSLX8pPXaXHZIolpwN5RxDg/c?=
 =?iso-8859-1?Q?M7X5QiQhDt62IQBzhowE8q4IVW6XK7v9XRW2XLDODOVYu4zNx49psFFQUL?=
 =?iso-8859-1?Q?HExvwPBy79xdDOjTD9HeUX857Tvc62L4cqIcELJKlz1yOpL0b2SfC6FazZ?=
 =?iso-8859-1?Q?yBy/lRn3CqsjXNvEFllbJAntJisBg5ZR5HJKbPUwzoSieS0gSYs6lvGK/w?=
 =?iso-8859-1?Q?W25eE4+H2/f2+457xtXzmlFBBTizN8zxQXKCUECifi7ztq+LQUaW5KhZ4n?=
 =?iso-8859-1?Q?MkVPA6vaYB+qxBdYSduuC/4ldZomIoozNqCWclK9OQ4h+G6V38IM35WXhH?=
 =?iso-8859-1?Q?XflO8Vyw3Yzg4dl3QCgXGPQlxV3mLYyDWzG+Nre0wdELX7GbMEPo3iLrzo?=
 =?iso-8859-1?Q?HYfdap2/W6b3NsmI1N2QAtZ+THU5FQsKc9m6jWIXhsEOEql3X4MEoLjnm2?=
 =?iso-8859-1?Q?bkakRNLJY3KvQg40IpWDkqJ9Y+UknSKavZBSgqVzxLBw2I1J81Z+fNTKfm?=
 =?iso-8859-1?Q?5BUZCAg7iseSCilQRvWuSmPeyXVhoTThXo+EV32bUOIMC6UE2wQrz6q1i6?=
 =?iso-8859-1?Q?q4WwrI90Ep4YEZsHYcVHAtIAWUZsIYXMB4D3WGU6wsTZX1zMXtZDTX3RMU?=
 =?iso-8859-1?Q?0BoewX9Locl2MB7Q26OjOHvpnCkWEF08rZzVghx/qMmeyaMtP/6tqnsfND?=
 =?iso-8859-1?Q?ZvJIWJEwlZF9tmRq/vx8kfTTLu+ZJwUQgHfG4SFA82wykHNTjP5e6M5fJd?=
 =?iso-8859-1?Q?jGuYZiTgqZ+25HQLS70W4MZsWY5zkf3MPhGz5vW5zU82fZPvFEpaf51AGP?=
 =?iso-8859-1?Q?ttnoTvLNPlJt3dInXhkWajSOoOHtL3pAKioVFvqEyKukPJE3G+szbOLnRn?=
 =?iso-8859-1?Q?/hujKPJMdtYXLl1KIs+tQIt9Vf3NKlH71+G4eyGHAYTpWBm7cCrqzsP0F4?=
 =?iso-8859-1?Q?65VaGflRIClOrb8/MMdysriEAwi06rU63WcpGHxKQRaOPkefjGJnSkmTNV?=
 =?iso-8859-1?Q?/Eelef2ewUblqkIW6ryJS5WAVSmvCoww1AnZlMQwz7kr1RlPikQE8S25DD?=
 =?iso-8859-1?Q?bK5NOOZxQpmkGxgevYiYfdN1t5mQlQJd5zK6/L9wIkWdEaM=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_MEYP282MB1687AFC06D7168F3B4A3B9CEF9EF9MEYP282MB1687AUSP_"
MIME-Version: 1.0
X-OriginatorOrg: Petermac.org
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MEYP282MB1687.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 51c54900-afa6-4570-802d-08d9560c6805
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2021 23:22:33.3895 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ad1d679-7a9d-467b-8ded-9fddbe88f77b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZQZaxL1ORLiQUDhwetlVdGc21E8pXctxPso25+SETv7Zu7pg+FQSeropKP/mF4w8JuCYcgfnJimDM6IMhUQXT+wdJkAE6UKTP7maDPEmLjk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MEYP282MB2421
Received-SPF: pass client-ip=40.107.108.139;
 envelope-from=Ryan.Lindsay@petermac.org;
 helo=AUS01-ME3-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 02 Aug 2021 21:19:50 -0400
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
Cc: qemu-ppc <qemu-ppc@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_MEYP282MB1687AFC06D7168F3B4A3B9CEF9EF9MEYP282MB1687AUSP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Cedric,
Thanks for replying.
I think I want to go down the PowerNV Power 9
Which I will need the OpenPower firmware.
Looks like the webpage for downloading prebuild witherspoon and skiboot is =
down/dead. Hasn't been working for me for 24hours anyway
Is that the only place to download that firmware?

regards


Ryan Lindsay BEng, MSc.
Linux Storage Administrator
Research Computing Facility

________________________________
From: C=E9dric Le Goater <clg@kaod.org>
Sent: Saturday, 31 July 2021 2:50 AM
To: Philippe Mathieu-Daud=E9 <philmd@redhat.com>; Lindsay Ryan <Ryan.Lindsa=
y@petermac.org>; qemu-discuss@nongnu.org <qemu-discuss@nongnu.org>
Cc: qemu-ppc <qemu-ppc@nongnu.org>; qemu-devel <qemu-devel@nongnu.org>
Subject: Re: need help with my config

! EXTERNAL EMAIL: Think before you click. If suspicious send to CyberReport=
@petermac.org

Hello,

On 7/30/21 3:25 PM, Philippe Mathieu-Daud=E9 wrote:
> Cc'ing qemu-ppc@
>
> On 7/30/21 6:25 AM, Lindsay Ryan wrote:
>> Hi
>> I'm trying to emulate some physical IBM Power 9's that we have. There
>> seems to be plenty of examples of using x86_64 qemu, but slightly less
>> for Power.

For baremetal emulation, please use the PowerNV machine. See this page :

  https://qemu.readthedocs.io/en/latest/system/ppc/powernv.html

HW is not fully emulated but QEMU has enough support to start a multichip
system running any distro.

>> Unless it's specifically for installing AIX

AIX only runs under the pseries machine (virtualized) and not on baremetal.

>> Anyway, I'm trying to boot the VM as I guess a bare metal Power 9 box,
>> then install redhat from Iso on a disk and have it on the network.
>>
>> ./qemu-system-ppc64 -cpu POWER9 -smp cpus=3D4 -machine pseries -m 4096 -=
M
>> accel=3Dtcg  -serial stdio -nodefaults -nographic -device
>> megasas,id=3Dscsi0,bus=3Dpci.0,addr=3D0x5 -drive
>> file=3D/home/hdisk1.qcow2,if=3Dnone,id=3Ddrive-scsi0-0-0-0,format=3Dqcow=
2,cache=3Dnone
>> -device
>> scsi-hd,bus=3Dscsi0.0,channel=3D0,scsi-id=3D0,lun=3D0,drive=3Ddrive-scsi=
0-0-0-0,id=3Dscsi0-0-0-0,bootindex=3D2
>> -cdrom /mnt/images/rhel-8.4-ppc64le-boot.iso -monitor
>> telnet:0.0.0.0:3344,server,nowait -netdev
>> bridge,id=3Dnet0,helper=3Dqemu-bridge-helper,br=3Dbridge0,id=3Dhostnet0

This is a pseries machine (virtualized) and not baremetal.

Which machine do you want to run ? pseries is the VM platform as run by KVM=
,
It can run under TCG also. PowerNV is the baremetal platform on which KVM
runs using the OPAL firmware. QEMU only has a PowerNV emulator, so TCG.

These are two very different PPC machines.

>> So the megasas gets detected as a raid controller. Yay.
>> But my qcow2 disk image doesn't seem to be plugged into it correctly as
>> it's not detected.
>> It sees the cdrom image and I can boot from it.
>> The other thing I can't get working is the network card.

because you don't have any :) Add a device and link it to the netdev.


That's how I run a TCG pseries POWER9 machine on my x86 laptop:

qemu-system-ppc64 -M pseries,cap-cfpc=3Dworkaround,cap-sbbc=3Dworkaround,ca=
p-ibs=3Dworkaround,cap-ccf-assist=3Don,ic-mode=3Ddual -m 4G -accel tcg,thre=
ad=3Dmulti -cpu POWER9 -smp 4,cores=3D4,maxcpus=3D8,threads=3D1 -device vir=
tio-net-pci,netdev=3Dnet0,mac=3DC0:FF:EE:00:00:02,bus=3Dpci.0,addr=3D0x2 -n=
etdev tap,id=3Dnet0,helper=3D/usr/libexec/qemu-bridge-helper,br=3Dvirbr0,vh=
ost=3Don -device virtio-scsi-pci,id=3Dscsi0,bus=3Dpci.0,addr=3D0x1 -drive f=
ile=3D./ubuntu-ppc64le.qcow2,if=3Dnone,id=3Ddrive-scsi0-0-0-0,format=3Dqcow=
2,cache=3Dnone -device scsi-hd,bus=3Dscsi0.0,channel=3D0,scsi-id=3D0,lun=3D=
0,drive=3Ddrive-scsi0-0-0-0,id=3Dscsi0-0-0-0,bootindex=3D1 -device qemu-xhc=
i,id=3Dusb,bus=3Dpci.0,addr=3D0x4 -nographic -nodefaults -serial mon:stdio

and a PowerNV POWER9 machine :

qemu-system-ppc64 -m 4G -machine powernv9 -smp 2 -accel tcg,thread=3Dmulti =
-kernel ./open-power/images/witherspoon-latest/zImage.epapr -initrd ./open-=
power/images/witherspoon-latest/rootfs.cpio.xz -bios ./open-power/images/wi=
therspoon-latest/skiboot.lid -device pcie-pci-bridge,id=3Dbridge1,bus=3Dpci=
e.1,addr=3D0x0 -device ich9-ahci,id=3Dsata0,bus=3Dpcie.0,addr=3D0x0 -drive =
file=3D./ubuntu-ppc64le-powernv.qcow2,if=3Dnone,id=3Ddrive0,format=3Dqcow2,=
cache=3Dnone -device ide-hd,bus=3Dsata0.0,unit=3D0,drive=3Ddrive0,id=3Dide,=
bootindex=3D1 -device e1000e,netdev=3Dnet0,mac=3DC0:FF:EE:00:01:03,bus=3Dbr=
idge1,addr=3D0x3 -netdev bridge,helper=3D/usr/libexec/qemu-bridge-helper,br=
=3Dvirbr0,id=3Dnet0 -device nec-usb-xhci,bus=3Dbridge1,addr=3D0x2 -device u=
sb-storage,drive=3Dusbkey -drive file=3D./usb.img,if=3Dnone,id=3Dusbkey,for=
mat=3Draw,cache=3Dnone -serial mon:stdio -nographic

You will need firmware images for the latter.


Cheers,
C.


Disclaimer: This email (including any attachments or links) may contain con=
fidential and/or legally privileged information and is intended only to be =
read or used by the addressee. If you are not the intended addressee, any u=
se, distribution, disclosure or copying of this email is strictly prohibite=
d. Confidentiality and legal privilege attached to this email (including an=
y attachments) are not waived or lost by reason of its mistaken delivery to=
 you. If you have received this email in error, please delete it and notify=
 us immediately by telephone or email. Peter MacCallum Cancer Centre provid=
es no guarantee that this transmission is free of virus or that it has not =
been intercepted or altered and will not be liable for any delay in its rec=
eipt.

--_000_MEYP282MB1687AFC06D7168F3B4A3B9CEF9EF9MEYP282MB1687AUSP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi Cedric,&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks for replying.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I think I want to go down the PowerNV Power 9</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Which I will need the OpenPower firmware.&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Looks like the webpage for downloading prebuild witherspoon and skiboot is =
down/dead. Hasn't been working for me for 24hours anyway</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Is that the only place to download that firmware?</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
regards</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp;</div>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">
<div>
<div style=3D"color:rgb(0,0,0); font-family:Calibri,Arial,Helvetica,sans-se=
rif; font-size:12pt">
<span>
<div style=3D"border-bottom-color:currentColor; border-left-color:currentCo=
lor; border-right-color:currentColor; border-top-color:currentColor; font-f=
amily:Calibri,Arial,Helvetica,sans-serif; font-size:12pt; font-size-adjust:=
none; margin-bottom:0px; margin-top:0px">
<span style=3D"border-bottom-color:currentColor; border-left-color:currentC=
olor; border-right-color:currentColor; border-top-color:currentColor; font-=
size-adjust:none; margin-bottom:0px; margin-top:0px">Ryan Lindsay BEng, MSc=
.</span></div>
<div style=3D"border-bottom-color:currentColor; border-left-color:currentCo=
lor; border-right-color:currentColor; border-top-color:currentColor; font-f=
amily:Calibri,Arial,Helvetica,sans-serif; font-size:12pt; font-size-adjust:=
none; margin-bottom:0px; margin-top:0px">
<span style=3D"border-bottom-color:currentColor; border-left-color:currentC=
olor; border-right-color:currentColor; border-top-color:currentColor; font-=
size-adjust:none; margin-bottom:0px; margin-top:0px">Linux Storage Administ=
rator</span></div>
<div style=3D"border-bottom-color:currentColor; border-left-color:currentCo=
lor; border-right-color:currentColor; border-top-color:currentColor; font-f=
amily:Calibri,Arial,Helvetica,sans-serif; font-size:12pt; font-size-adjust:=
none; margin-bottom:0px; margin-top:0px">
<span style=3D"border-bottom-color:currentColor; border-left-color:currentC=
olor; border-right-color:currentColor; border-top-color:currentColor; font-=
size-adjust:none; margin-bottom:0px; margin-top:0px">Research Computing Fac=
ility</span></div>
<br>
</span></div>
</div>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> C=E9dric Le Goater &l=
t;clg@kaod.org&gt;<br>
<b>Sent:</b> Saturday, 31 July 2021 2:50 AM<br>
<b>To:</b> Philippe Mathieu-Daud=E9 &lt;philmd@redhat.com&gt;; Lindsay Ryan=
 &lt;Ryan.Lindsay@petermac.org&gt;; qemu-discuss@nongnu.org &lt;qemu-discus=
s@nongnu.org&gt;<br>
<b>Cc:</b> qemu-ppc &lt;qemu-ppc@nongnu.org&gt;; qemu-devel &lt;qemu-devel@=
nongnu.org&gt;<br>
<b>Subject:</b> Re: need help with my config</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">! EXTERNAL EMAIL: Think before you click. If suspi=
cious send to CyberReport@petermac.org<br>
<br>
Hello,<br>
<br>
On 7/30/21 3:25 PM, Philippe Mathieu-Daud=E9 wrote:<br>
&gt; Cc'ing qemu-ppc@<br>
&gt;<br>
&gt; On 7/30/21 6:25 AM, Lindsay Ryan wrote:<br>
&gt;&gt; Hi<br>
&gt;&gt; I'm trying to emulate some physical IBM Power 9's that we have. Th=
ere<br>
&gt;&gt; seems to be plenty of examples of using x86_64 qemu, but slightly =
less<br>
&gt;&gt; for Power.<br>
<br>
For baremetal emulation, please use the PowerNV machine. See this page :<br=
>
<br>
&nbsp; <a href=3D"https://qemu.readthedocs.io/en/latest/system/ppc/powernv.=
html">https://qemu.readthedocs.io/en/latest/system/ppc/powernv.html</a><br>
<br>
HW is not fully emulated but QEMU has enough support to start a multichip<b=
r>
system running any distro.<br>
<br>
&gt;&gt; Unless it's specifically for installing AIX<br>
<br>
AIX only runs under the pseries machine (virtualized) and not on baremetal.=
<br>
<br>
&gt;&gt; Anyway, I'm trying to boot the VM as I guess a bare metal Power 9 =
box,<br>
&gt;&gt; then install redhat from Iso on a disk and have it on the network.=
<br>
&gt;&gt;<br>
&gt;&gt; ./qemu-system-ppc64 -cpu POWER9 -smp cpus=3D4 -machine pseries -m =
4096 -M<br>
&gt;&gt; accel=3Dtcg&nbsp; -serial stdio -nodefaults -nographic -device<br>
&gt;&gt; megasas,id=3Dscsi0,bus=3Dpci.0,addr=3D0x5 -drive<br>
&gt;&gt; file=3D/home/hdisk1.qcow2,if=3Dnone,id=3Ddrive-scsi0-0-0-0,format=
=3Dqcow2,cache=3Dnone<br>
&gt;&gt; -device<br>
&gt;&gt; scsi-hd,bus=3Dscsi0.0,channel=3D0,scsi-id=3D0,lun=3D0,drive=3Ddriv=
e-scsi0-0-0-0,id=3Dscsi0-0-0-0,bootindex=3D2<br>
&gt;&gt; -cdrom /mnt/images/rhel-8.4-ppc64le-boot.iso -monitor<br>
&gt;&gt; telnet:0.0.0.0:3344,server,nowait -netdev<br>
&gt;&gt; bridge,id=3Dnet0,helper=3Dqemu-bridge-helper,br=3Dbridge0,id=3Dhos=
tnet0<br>
<br>
This is a pseries machine (virtualized) and not baremetal.<br>
<br>
Which machine do you want to run ? pseries is the VM platform as run by KVM=
,<br>
It can run under TCG also. PowerNV is the baremetal platform on which KVM<b=
r>
runs using the OPAL firmware. QEMU only has a PowerNV emulator, so TCG.<br>
<br>
These are two very different PPC machines.<br>
<br>
&gt;&gt; So the megasas gets detected as a raid controller. Yay.<br>
&gt;&gt; But my qcow2 disk image doesn't seem to be plugged into it correct=
ly as<br>
&gt;&gt; it's not detected.<br>
&gt;&gt; It sees the cdrom image and I can boot from it.<br>
&gt;&gt; The other thing I can't get working is the network card.<br>
<br>
because you don't have any :) Add a device and link it to the netdev.<br>
<br>
<br>
That's how I run a TCG pseries POWER9 machine on my x86 laptop:<br>
<br>
qemu-system-ppc64 -M pseries,cap-cfpc=3Dworkaround,cap-sbbc=3Dworkaround,ca=
p-ibs=3Dworkaround,cap-ccf-assist=3Don,ic-mode=3Ddual -m 4G -accel tcg,thre=
ad=3Dmulti -cpu POWER9 -smp 4,cores=3D4,maxcpus=3D8,threads=3D1 -device vir=
tio-net-pci,netdev=3Dnet0,mac=3DC0:FF:EE:00:00:02,bus=3Dpci.0,addr=3D0x2
 -netdev tap,id=3Dnet0,helper=3D/usr/libexec/qemu-bridge-helper,br=3Dvirbr0=
,vhost=3Don -device virtio-scsi-pci,id=3Dscsi0,bus=3Dpci.0,addr=3D0x1 -driv=
e file=3D./ubuntu-ppc64le.qcow2,if=3Dnone,id=3Ddrive-scsi0-0-0-0,format=3Dq=
cow2,cache=3Dnone -device scsi-hd,bus=3Dscsi0.0,channel=3D0,scsi-id=3D0,lun=
=3D0,drive=3Ddrive-scsi0-0-0-0,id=3Dscsi0-0-0-0,bootindex=3D1
 -device qemu-xhci,id=3Dusb,bus=3Dpci.0,addr=3D0x4 -nographic -nodefaults -=
serial mon:stdio<br>
<br>
and a PowerNV POWER9 machine :<br>
<br>
qemu-system-ppc64 -m 4G -machine powernv9 -smp 2 -accel tcg,thread=3Dmulti =
-kernel ./open-power/images/witherspoon-latest/zImage.epapr -initrd ./open-=
power/images/witherspoon-latest/rootfs.cpio.xz -bios ./open-power/images/wi=
therspoon-latest/skiboot.lid -device
 pcie-pci-bridge,id=3Dbridge1,bus=3Dpcie.1,addr=3D0x0 -device ich9-ahci,id=
=3Dsata0,bus=3Dpcie.0,addr=3D0x0 -drive file=3D./ubuntu-ppc64le-powernv.qco=
w2,if=3Dnone,id=3Ddrive0,format=3Dqcow2,cache=3Dnone -device ide-hd,bus=3Ds=
ata0.0,unit=3D0,drive=3Ddrive0,id=3Dide,bootindex=3D1 -device e1000e,netdev=
=3Dnet0,mac=3DC0:FF:EE:00:01:03,bus=3Dbridge1,addr=3D0x3
 -netdev bridge,helper=3D/usr/libexec/qemu-bridge-helper,br=3Dvirbr0,id=3Dn=
et0 -device nec-usb-xhci,bus=3Dbridge1,addr=3D0x2 -device usb-storage,drive=
=3Dusbkey -drive file=3D./usb.img,if=3Dnone,id=3Dusbkey,format=3Draw,cache=
=3Dnone -serial mon:stdio -nographic<br>
<br>
You will need firmware images for the latter.<br>
<br>
<br>
Cheers,<br>
C.<br>
</div>
</span></font></div>
<p style=3D"margin:0cm;margin-bottom:.0001pt;font-size:15px;font-family:&qu=
ot;Calibri&quot;,sans-serif;">
<span style=3D"font-size: 12px;"><br>
</span></p>
<p style=3D"margin:0cm;margin-bottom:.0001pt;font-size:15px;font-family:&qu=
ot;Calibri&quot;,sans-serif;">
<span style=3D"font-size: 12px;"><strong>Disclaimer:&nbsp;</strong>This ema=
il (including any attachments or links) may contain confidential and/or leg=
ally privileged information and is intended only to be read or used by the =
addressee. If you are not the intended
 addressee, any use, distribution, disclosure or copying of this email is s=
trictly prohibited. Confidentiality and legal privilege attached to this em=
ail (including any attachments) are not waived or lost by reason of its mis=
taken delivery to you. If you have
 received this email in error, please delete it and notify us immediately b=
y telephone or email. Peter MacCallum Cancer Centre provides no guarantee t=
hat this transmission is free of virus or that it has not been intercepted =
or altered and will not be liable
 for any delay in its receipt. </span></p>
</body>
</html>

--_000_MEYP282MB1687AFC06D7168F3B4A3B9CEF9EF9MEYP282MB1687AUSP_--

