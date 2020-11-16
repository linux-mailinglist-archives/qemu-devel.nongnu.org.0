Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C552B3CA2
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 06:36:29 +0100 (CET)
Received: from localhost ([::1]:56758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keXBk-0003eb-J7
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 00:36:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1keX8v-0002FJ-2u
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 00:33:33 -0500
Received: from mail-dm6nam10on2060.outbound.protection.outlook.com
 ([40.107.93.60]:6880 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1keX8r-0007WZ-SW
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 00:33:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iS9kXYcjTJFaFU5DOOioGVFjsTrvBpaPerQlGPRCC0pnWtdTyTKPQFUMwatKm1p90DAFEh3uS9qrzzZgUTHKZDzrcia0IhM4YZQ7LfH5phTNOmy8LPtAXUO7yIfTE1GPBfBE5zdn/+5tHTlO9lRTfuub5RerERiXEnxjuLZ4Mf6R3qmhquj+Lzp5uX78WBgTndTVkGKfpNwh4Jerv3IaUrSBPA/5Wix39ZdM8jQXzG9IYDm1+IU+Zsx27qc7UQDu2BFhYiNFAlNXk1G5R7+dJyCy56Tg7+7VVgORAbVaVFJe3nwJjT/CdcEwRFrJZCUbsZuMytbF1bYng5np2UFNcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y+N0hFzZJy7gsKBBdfE7PPEdp4NWX5bzLsUoRY8PdCc=;
 b=bU/pBainoAjf82Qf1YFrgA4zybm/DhqdrNTAsGP3nM1Zkn2eU8RtOMbwGKe+D+mZYw8cLvbE7rJDDFrE/08oZJJiEfjvGBEVlMpdk1aATj/0fkdIbRfybzq9A2/tqKHEy8oPG814Ea8Ql4HfUYYOdMbAlIBmx2BYeF+44DpdTG+ogefhcFZ+zmkaDZca9qnAgiOL66/AtNqsVHFa4RN2A/zs8eeAlIg3SmeU/uAREUbNzTyMCeC6QMkpwCyhzHTzrBuhoWufLXe7lmV10vxibGZH3DR5xwTBCkstIB97lgSz8xVVy/GYhV7gsDb4YFw9y8QroEaHkVpm7sL97F/WEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y+N0hFzZJy7gsKBBdfE7PPEdp4NWX5bzLsUoRY8PdCc=;
 b=GqpsqMQmHPlRjh4lki/pOZzbEh2jYQ8qG0+OKttCVy7oddkj4Q3WEjtUj0Tkydea9BzZeS/GUSxn70zbVbXOXzyHDpsvtWmv1lnTxceC2+RKqcmpx2nuvjtmhDJ5ssBsWWJk73qOPVnZwrwhpAliDBliRV5X4sC4YHKVGPXEBrA=
Received: from BY5PR02MB6772.namprd02.prod.outlook.com (2603:10b6:a03:206::11)
 by BYAPR02MB4566.namprd02.prod.outlook.com (2603:10b6:a03:57::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Mon, 16 Nov
 2020 05:18:22 +0000
Received: from BY5PR02MB6772.namprd02.prod.outlook.com
 ([fe80::75ed:4271:263b:fd15]) by BY5PR02MB6772.namprd02.prod.outlook.com
 ([fe80::75ed:4271:263b:fd15%3]) with mapi id 15.20.3564.028; Mon, 16 Nov 2020
 05:18:22 +0000
From: Sai Pavan Boddu <saipava@xilinx.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, "kraxel@redhat.com"
 <kraxel@redhat.com>, "marcandre.lureau@redhat.com"
 <marcandre.lureau@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: RE: nec-usb-xhci migration breakage
Thread-Topic: nec-usb-xhci migration breakage
Thread-Index: AQHWuE5pWzwvtuxFgkaiq/cAd2w4p6nKPlEw
Date: Mon, 16 Nov 2020 05:18:22 +0000
Message-ID: <BY5PR02MB6772B2DC08D1BAE7994CBA28CAE30@BY5PR02MB6772.namprd02.prod.outlook.com>
References: <20201111171622.GI3232@work-vm>
In-Reply-To: <20201111171622.GI3232@work-vm>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [49.205.235.17]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d73bacc2-4dfb-4323-5bc0-08d889ef097d
x-ms-traffictypediagnostic: BYAPR02MB4566:
x-microsoft-antispam-prvs: <BYAPR02MB4566EBC28B504C5C76EEE3A4CAE30@BYAPR02MB4566.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6x1LOchajw/cEg1WZE1hnFg4NmfaXmCZ6o9qsdKO2ybk18ztQCraUMGvssQx62+LmnCZJkdFy3CuYwmzQ7WJMszsa0UjDWK+25ZVmM33tZGRjHjabiVzlF/zc04YdKC29gBeIpbtb4AGTFm7pbCd3apXXcYSnRfuK1388FQePPw14FrvtVbiiZ2vDbUt0zEr4v5tBnUvHx1duUK97dKe+KIdOEQ8n7aaFpbMPgQ0va3OZPsMr+7wath+A8LwS3rU3EsglkjgGPfNfvxFZKm/0hL9tjjQOTSgXsuoaR2eD1o2RNno0EBvdJIpiekz/8kyL9V5HtL+XLBM/H3CfKe1cA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR02MB6772.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39850400004)(346002)(376002)(366004)(6506007)(8676002)(53546011)(9686003)(5660300002)(86362001)(64756008)(66446008)(8936002)(66556008)(76116006)(66946007)(66476007)(3480700007)(33656002)(55016002)(83380400001)(7696005)(2906002)(110136005)(71200400001)(186003)(316002)(52536014)(478600001)(4326008)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: hMns9wOqC74wqoaQGpXs2J1oaceGkprhKEzvpJS35eagPpkUb4rY7LvvdRXUV7aoWo76w/cHeqvRfXCvGYm0gtuJf9toYdTe4ll3O83HbIU0+gfEKsvEheHipUu3aIdAhSvb/+7pvJ+OElgrkL8waiSbE1MdgHWVbqllgeU2pfQbDcgnLxl8K/4Nn24qYNGZd3ZSa08crynVa1mlrhZ6USwkcj0EEHISZbfHJYyHOIPAX5N1FWtJ3G6Ze/2AXwiXfE+m0tTn315cGICddi7uVtF77UPIuvlYZuRoJPnuzLpJ1b+r+uGPpbr/KxIQZGIJsgicdavmN7r9zW6/l8d9AzhbOl9tCFszZWVMwpQ7B9wlNKPCIAzuz4sahEM8cwRzIEojcPs2c0l+mIIieTI9/ENsgOiTSFQd2yXQ12yQM/iCfksO97212e6aTg5grbL5ztEqDU172xiD7TGbq9Zs7/GhqUxJHYmzw9f+Pdeu8zZQAkRtoh65l9FplqjDTuDzoo5V8XYFwUvPdMDy3Vgwt0Ala7gOnU4/UTdJ2lbqnb3egjsiwZiVxZfL0Gi9XiA9RYq8i7XkM95DbtTgiSApfm7plwN1aHAay7Ma17KCsDGP6kslzzpKHjvkXSon+iv/+3+GHcRuozUACGkgcQ9B+w==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB6772.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d73bacc2-4dfb-4323-5bc0-08d889ef097d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2020 05:18:22.0532 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kzsrjh3FXlBpsGVTZ8UMv6QxFZ3aFSQCZqrsxFtzY+CtdOlXO9x4vmhDKRCUML48pHv8TNtq46Np+2BWPM64DQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4566
Received-SPF: pass client-ip=40.107.93.60; envelope-from=saipava@xilinx.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 00:33:28
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Gerd
Hi David,

Sorry for the delayed response. I was able to reproduce your issue with nec=
-usb-xhci,  in my previous testing we have tested with qemu-xhci model whic=
h was good.
I would look further into this.=20

@Gerd: Do you have any high level comments on this ?

Regards,
Sai Pavan

> -----Original Message-----
> From: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Sent: Wednesday, November 11, 2020 10:46 PM
> To: kraxel@redhat.com; Sai Pavan Boddu <saipava@xilinx.com>;
> marcandre.lureau@redhat.com
> Cc: qemu-devel@nongnu.org
> Subject: nec-usb-xhci migration breakage
>=20
> Hi,
>   Somewhere between 5.1.0 and 5.2.0-rc1 there's a migration breakage on t=
he
> nec-usb-xhci device:
>=20
> [dgilbert@dgilbert-t580 try]$ ./x86_64-softmmu/qemu-system-x86_64 -M pc-
> q35-5.1 -device nec-usb-xhci -nographic -incoming tcp::4444
> qemu-system-x86_64: get_pci_config_device: Bad config data: i=3D0x72 read=
: 88
> device: 80 cmask: ff wmask: 71 w1cmask:0
> qemu-system-x86_64: Failed to load PCIDevice:config
> qemu-system-x86_64: Failed to load xhci:parent_obj
> qemu-system-x86_64: error while loading state for instance 0x0 of device
> '0000:00:03.0/xhci'
> qemu-system-x86_64: load of migration failed: Invalid argument
>=20
> lspci is showing the MSI count ifferent, but I'm not sure if that's the o=
nly
> problem or not:
>=20
> 5.1.0 showing:
> [root@localhost ~]# lspci -v -s 00:03.0 -v
> 00:03.0 USB controller: NEC Corporation uPD720200 USB 3.0 Host Controller
> (rev 03) (prog-if 30 [XHCI])
>         Subsystem: Red Hat, Inc. QEMU Virtual Machine
>         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
> ParErr- Stepping- SERR+ FastB2B- DisINTx+
>         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- =
<TAbort-
> <MAbort- >SERR- <PERR- INTx-
>         Latency: 0, Cache Line Size: 64 bytes
>         Interrupt: pin A routed to IRQ 23
>         Region 0: Memory at febd4000 (64-bit, non-prefetchable) [size=3D1=
6K]
>         Capabilities: [90] MSI-X: Enable+ Count=3D16 Masked-
>                 Vector table: BAR=3D0 offset=3D00003000
>                 PBA: BAR=3D0 offset=3D00003800
>         Capabilities: [a0] Express (v2) Root Complex Integrated Endpoint,=
 MSI 00
>                 DevCap: MaxPayload 128 bytes, PhantFunc 0
>                         ExtTag- RBE+
>                 DevCtl: CorrErr- NonFatalErr- FatalErr- UnsupReq-
>                         RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
>                         MaxPayload 128 bytes, MaxReadReq 128 bytes
>                 DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr-
> TransPend-
>                 DevCap2: Completion Timeout: Not Supported, TimeoutDis-, =
LTR-,
> OBFF Not Supported
>                          AtomicOpsCap: 32bit- 64bit- 128bitCAS-
>                 DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, L=
TR-, OBFF
> Disabled
>                          AtomicOpsCtl: ReqEn-
>         Capabilities: [70] MSI: Enable- Count=3D1/16 Maskable- 64bit+
>                 Address: 0000000000000000  Data: 0000
>         Kernel driver in use: xhci_hcd
>=20
> 5.2.0rc1 showing
> [root@localhost ~]# lspci -v -s 00:03.0 -v
> 00:03.0 USB controller: NEC Corporation uPD720200 USB 3.0 Host Controller
> (rev 03) (prog-if 30 [XHCI])
>         Subsystem: Red Hat, Inc. QEMU Virtual Machine
>         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
> ParErr- Stepping- SERR+ FastB2B- DisINTx+
>         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- =
<TAbort-
> <MAbort- >SERR- <PERR- INTx-
>         Latency: 0, Cache Line Size: 64 bytes
>         Interrupt: pin A routed to IRQ 23
>         Region 0: Memory at febd4000 (64-bit, non-prefetchable) [size=3D1=
6K]
>         Capabilities: [90] MSI-X: Enable+ Count=3D1 Masked-
>                 Vector table: BAR=3D0 offset=3D00003000
>                 PBA: BAR=3D0 offset=3D00003800
>         Capabilities: [a0] Express (v2) Root Complex Integrated Endpoint,=
 MSI 00
>                 DevCap: MaxPayload 128 bytes, PhantFunc 0
>                         ExtTag- RBE+
>                 DevCtl: CorrErr- NonFatalErr- FatalErr- UnsupReq-
>                         RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
>                         MaxPayload 128 bytes, MaxReadReq 128 bytes
>                 DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr-
> TransPend-
>                 DevCap2: Completion Timeout: Not Supported, TimeoutDis-, =
LTR-,
> OBFF Not Supported
>                          AtomicOpsCap: 32bit- 64bit- 128bitCAS-
>                 DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, L=
TR-, OBFF
> Disabled
>                          AtomicOpsCtl: ReqEn-
>         Capabilities: [70] MSI: Enable- Count=3D1/1 Maskable- 64bit+
>                 Address: 0000000000000000  Data: 0000
>         Kernel driver in use: xhci_hcd
>=20
> I see there's quite a few differences in the output of info qtree for the=
 device.
>=20
> Dave
>=20
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


