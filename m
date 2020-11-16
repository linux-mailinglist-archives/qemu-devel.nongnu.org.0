Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D72CA2B3E54
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 09:11:37 +0100 (CET)
Received: from localhost ([::1]:60712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keZbr-0007CO-Iw
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 03:11:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1keZaz-0006cV-A9
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 03:10:41 -0500
Received: from mail-dm6nam12on2046.outbound.protection.outlook.com
 ([40.107.243.46]:14817 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1keZav-0003Y3-B5
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 03:10:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jTrcSMYq5H4QEHWq6pa9btr4EhgDhXRuUPWTiQtuNNUwRZAC2aVz7/mW6kb+FlG2/5IRN+yhbhWALs9slvEYHpUaxVFFXPOfk4IuOTf/hcrWDvvracqMBsvDcCcUjO4aHbPgU2l/ePhAU4VCHDrB+HednMO15qs47RluMBdCu/I5hPu1mytgvO4Pr3rUT3UCeQH6NUu5oq5DpR3jXgG/KChnuasezW4+kUwXxvZwhvFv50ORGQRfO7bH40R6CG9VScgco5qrccKZP+BfHbSBy8CFVx9eCcDT+g0JX3xyT0N9wLwoVcph4mmi58kLuGmd7Y3PP2D52wgqHBTZU4+OQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aZWjtqDyRfg/lqhAQVdS10PztrlBE06ttrM2H5imiac=;
 b=MGrFq9vGo3OzRr56yqUUrrH1WVljquAWQzR9xE7eIoHPouGU4LlZoTp7zMKd/K5QkW5ZYZYaK6txawiS9TCiyN7O5VP8q57yi5zzsbRFJdX7RFNYHm53mm5qkhiumf0oV/Nq23bObFXz5H0MkR9ya5eysagVYhqYlJbNDdgaprhT9wwIpBuUjIg2ux0uxY8dltW0rtO0wwsKrKIUaSuyiSgrbDG9lciBgr5FynLFPaeW8v+hKh7BR11KLu5qKso+fWs1sUlR95UzCZVATAtMYHkEa5YtKlpdgnQbZe4/pCAQe54gs7S6VR8UGheLNKY0xdmzvaCs6MI1wS7yqrXb8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aZWjtqDyRfg/lqhAQVdS10PztrlBE06ttrM2H5imiac=;
 b=YBfORqjrOH+gKUc6B/3iwfoGplfZ4tm4RH66Lp75+Pci9TANEh+zlE6XFLGQk+8y59Iusga/LD9rSYURlGe2WfkI0l6+ASNLrjUzn128XW9napJPTCtlXCuWlx0HAoXXDXx4lSOv667nmZY43c8TItvahcbCimA3N+FLUhI6ZZg=
Received: from BY5PR02MB6772.namprd02.prod.outlook.com (2603:10b6:a03:206::11)
 by BYAPR02MB5000.namprd02.prod.outlook.com (2603:10b6:a03:68::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Mon, 16 Nov
 2020 08:10:34 +0000
Received: from BY5PR02MB6772.namprd02.prod.outlook.com
 ([fe80::75ed:4271:263b:fd15]) by BY5PR02MB6772.namprd02.prod.outlook.com
 ([fe80::75ed:4271:263b:fd15%3]) with mapi id 15.20.3564.028; Mon, 16 Nov 2020
 08:10:34 +0000
From: Sai Pavan Boddu <saipava@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: RE: [PATCH v13 0/4] Add Versal usb model
Thread-Topic: [PATCH v13 0/4] Add Versal usb model
Thread-Index: AQHWty2HdOp1M5opqUSqk1plzrVo8KnKcPEg
Date: Mon, 16 Nov 2020 08:10:33 +0000
Message-ID: <BY5PR02MB67725D033C3725C001D0AE05CAE30@BY5PR02MB6772.namprd02.prod.outlook.com>
References: <1604991130-12965-1-git-send-email-sai.pavan.boddu@xilinx.com>
In-Reply-To: <1604991130-12965-1-git-send-email-sai.pavan.boddu@xilinx.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [49.205.235.17]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a6de343f-4ea9-4625-4bdc-08d88a0717c2
x-ms-traffictypediagnostic: BYAPR02MB5000:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB50006C56575CAD1405AA0358CAE30@BYAPR02MB5000.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1775;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nc9//Ojnt01wRxu4uAqF80IZ4xm0so4Y9W+Hl0ctG6g5pTyHnQn0x15E8qRw4ZFR2pTnGqZr0nGetM5q63fvD55LkeCUEU/83qf32+/3uWIsNrDliS6JiQJw88XP7M9B2dQkDfWSg4UVqnNFcyp2ME8JMEqk8Wuteaqjgw5VC4gtFPVeVsAwnMRnzLTq9WO/fW0tcR5WX12hj7hpHi1rTFypYGK75DZV1HRaT9cU9JAuOVe1zFvtQ9o8OiKQlT4trjuf2amE/VsZZlVzFg0qCgQGkqyaH3REncy/RrdIxU9iKbB4+VwZdP8TM46+GWlfRHvHLw1bjUnPdoj8xAgrSg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR02MB6772.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(366004)(136003)(346002)(39850400004)(26005)(86362001)(8936002)(7416002)(83380400001)(186003)(478600001)(8676002)(6506007)(66946007)(76116006)(7696005)(64756008)(66446008)(66556008)(316002)(54906003)(53546011)(66476007)(9686003)(33656002)(6916009)(4326008)(5660300002)(55016002)(52536014)(2906002)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: WlTa6D9V9BWgcurfRM4eDXxIaUlndAWHELm2bYNXh9gbDzUEkcT7zycG6yqf+y9V36Z36dMWDCVnm419l7Tze5bQD+cxeECysl+2i1pDKkAQVFwkJ0rd9FzAVa1plx3WDy1OMVz6d25NEjk1VvjEplbn2mlPanHPdUFbXM9Njs882uJCQh/4rMcG60SSBRaCi96uveLYQMzWZo5hKX2cjquaHuEx6Zs9XNAxpB+dB9A+AWi0tcEJTFryCKmY3Gqd2fyrypruses1GVvg0e4NeNVsO8Pyzl9fwnElFwOBb4aOe3i/J6fNdVF0OZRFQpVuzXetB02kTBL/1boE/cm9TgWFrJOhyUdNn1+x5QGEhIaNof1Wlv/0ih6ms+8XeGMQeB0F/pp2ANceRxqGqYz4JPZmXhNJ8vp4eS+A+t1U/SGPrdyTcMp3XZN2jWuCYdwuAwU4NCcosMxxCdNQEO3tz0SQR8GMHrTXa+WsnQ4DZ0R/AmclP7w9IuWx095qWbQSlm44vkFNzOMF5Fs3wC64kXk3HspaQ1o3i83SRKmRlGm7XLI8Ki55PT+P9gRddZcVyTCqWQ2L+61muqyQlc4n0+R9MH9fYTh84f7zmo5pHCfo3GkaQtuPxfDo3YFh8q5IzV2j0+4pGzRr2XAIGPau+A==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB6772.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6de343f-4ea9-4625-4bdc-08d88a0717c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2020 08:10:33.9933 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vDCtb5QKZXcsDZI6pJfrxImTFvfmZlZk6hoSObPL58/h/UO2tYUOstbCdux5b5FbALGjGYJFOVp2jHCr/IaKOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5000
Received-SPF: pass client-ip=40.107.243.46; envelope-from=saipava@xilinx.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 03:10:35
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
Cc: Francisco Eduardo Iglesias <figlesia@xilinx.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Vikram Garhwal <fnuv@xilinx.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ying Fang <fangying1@huawei.com>,
 =?iso-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 Paul Zimmerman <pauldzim@gmail.com>,
 =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

> -----Original Message-----
> From: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
> Sent: Tuesday, November 10, 2020 12:22 PM
> To: Peter Maydell <peter.maydell@linaro.org>; Markus Armbruster
> <armbru@redhat.com>; Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>;
> Paolo Bonzini <pbonzini@redhat.com>; Gerd Hoffmann <kraxel@redhat.com>;
> Edgar Iglesias <edgari@xilinx.com>; Francisco Eduardo Iglesias
> <figlesia@xilinx.com>; Alistair Francis <alistair.francis@wdc.com>; Eduar=
do
> Habkost <ehabkost@redhat.com>; Ying Fang <fangying1@huawei.com>;
> Philippe Mathieu-Daud=E9 <philmd@redhat.com>; Vikram Garhwal
> <fnuv@xilinx.com>; Paul Zimmerman <pauldzim@gmail.com>; Sai Pavan Boddu
> <saipava@xilinx.com>
> Cc: QEMU Developers <qemu-devel@nongnu.org>
> Subject: [PATCH v13 0/4] Add Versal usb model
>=20
> This patch series attempts to make 'hcd-xhci' an independent model so it =
can
> be used by both pci and system-bus interface.
>=20
> Changes for V2:
>     Make XHCIState non-qom
>     Use container_of functions for retriving pci device instance
>     Initialize the AddressSpace pointer in PATCH 1/3 itself Changes for V=
3:
>     Convert XHCIState to TYPE_DEVICE and register as a child of XHCIPciSt=
ate.
> Changes for V4:
>     Add DWC3 usb controller
>     Add versal, usb2-reg module
>     Connect sysbus xhci to versal virt board Changes for V5:
>     Add extra info about dwc3 and usb2_regs devices in commit messages
>     Use only one irq for versal usb controller
>     Mark the unimplemented registers in dwc3 controller
>     Rebase the patches over master.
>     Move few mispalced contents from patch 2/7 to 3/7.
>     Fix the author names in the header.
>     Move the inclusion of "sysemu/dma.h" from patch 1/7 to 3/7 Changes fo=
r
> V6:
>     Fixed style issue in patch 7/7
>     Renamed usb2_reg model to VersalUsb2CtrlReg
>     Fixed author in headers
> Changes for V7:
>     Create a usb structure to keep things clean
>     Remove the repeated patch in the series i.e 5/7 Changes for V8:
>     Fix vmstate sturcts to support cross version migration.
> Changes for V9:
>     Added recommended changes to fix vmstate migration.
>     Fixed commit message on 3/7.
> Changes for V10:
>     use vmstate_post_load avaialble in VMStateDescription
>     tested vmstate cross migration.
> Changes for V11:
>     Removed the patches which got accepted
>     Changed object name "USB2Reg" -> "ctrl"
>     Updated Subject line on cover letter.
> Changes for V12:
>     Use reset class for usb2-ctrl-regs module
>     Move the few register update to realize
>     Marked registers which are unimplemented in regapi model=20
>     Changs for V13:
>     Add usb subsystem for xilinx devices,
>     Memory Map xhci internally to dwc3 device,
>     Add respective changes to connect VersalUsb2 subsystem to xilinx-vers=
al.
[Sai Pavan Boddu]=20
Does these changes looks good ?

Regards,
Sai Pavan
>=20
>=20
>=20
> Sai Pavan Boddu (2):
>   usb: Add versal-usb2-ctrl-regs module
>   usb: xlnx-usb-subsystem: Add xilinx usb subsystem
>=20
> Vikram Garhwal (2):
>   usb: Add DWC3 model
>   arm: xlnx-versal: Connect usb to virt-versal
>=20
>  hw/arm/xlnx-versal-virt.c                   |  58 +++
>  hw/arm/xlnx-versal.c                        |  26 ++
>  hw/usb/Kconfig                              |   6 +
>  hw/usb/hcd-dwc3.c                           | 677 ++++++++++++++++++++++=
++++++
>  hw/usb/meson.build                          |   3 +
>  hw/usb/xlnx-usb-subsystem.c                 |  94 ++++
>  hw/usb/xlnx-versal-usb2-ctrl-regs.c         | 229 ++++++++++
>  include/hw/arm/xlnx-versal.h                |   9 +
>  include/hw/usb/hcd-dwc3.h                   |  56 +++
>  include/hw/usb/xlnx-usb-subsystem.h         |  45 ++
>  include/hw/usb/xlnx-versal-usb2-ctrl-regs.h |  45 ++
>  11 files changed, 1248 insertions(+)
>  create mode 100644 hw/usb/hcd-dwc3.c
>  create mode 100644 hw/usb/xlnx-usb-subsystem.c  create mode 100644
> hw/usb/xlnx-versal-usb2-ctrl-regs.c
>  create mode 100644 include/hw/usb/hcd-dwc3.h  create mode 100644
> include/hw/usb/xlnx-usb-subsystem.h
>  create mode 100644 include/hw/usb/xlnx-versal-usb2-ctrl-regs.h
>=20
> --
> 2.7.4


