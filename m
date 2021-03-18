Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDAE33FFB3
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 07:35:59 +0100 (CET)
Received: from localhost ([::1]:51370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMmGE-0003Pv-BT
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 02:35:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <decui@microsoft.com>)
 id 1lMiCI-00042c-T7
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 22:15:40 -0400
Received: from mail-bn7nam10on2139.outbound.protection.outlook.com
 ([40.107.92.139]:33825 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <decui@microsoft.com>)
 id 1lMiCF-0000jB-Ia
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 22:15:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OicwHxAqlSdnuG4UTNbJBUuct4cb6DDBBMwRDd2UdF3+NDgEBec83e9Ei4i2t2uZa2fw3nx5G0VjgGnZX/PeTvnLMpiUw8ysp1Lo6fo9wQ5vusVbbGM67kQUsCzBDBbFaeXpSvihXl63LSnUVuR7FPdoeM4BEHuJ9B6+cyyMCzKPI3il+gFjhQz7hfrv7OMnLT54Hg8YDlLxLh+FTFxhir1rCtBGbxHU6wDHH7/CQGnF2rPgUntIuaEJaCS4oKZT6S8F3CVgiN551dEGIP4OZ0f4D04Rs1QFO5fGLRIh0l7OdsgRiO0qEKhruqmpQ6TMyYiJsYGldXqkvCCfmbIR9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MBjHhW/YA3RGVZ7HJYFvGgIYN2hR5OR9/h9hmBf+ozI=;
 b=PhJw4sUXIBcl43LRldq5Cz9AvI/91Ta+ZsKFD7vUtCS0jUaGR3P0ZWrLCoai74yRNTtUKijTK7+WT7R84S1CqSs2TkW3cYZUBAwW1zueXQi+2wT1CHgHhboGboFmNpJlCGb+v+EzAUc64PW+bU2Ph6PCczbIUBmvkZOf+gViHGxqCh+c07PP8um5okt5idT4Nt8S5hrWJLFx6bLxt3KLsoRLTevIAjl50USIiBP8cheqQVdH4uh2nUoQKCxM6yvS7kihqlmwpxZU02QukRxnVkbUFtqK6aWq8teK5NUqf59Tn4t9zx8JI3uJNM8uWxs1d18pHfpXOAZRt7F9Cw6hOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MBjHhW/YA3RGVZ7HJYFvGgIYN2hR5OR9/h9hmBf+ozI=;
 b=Tztoa28zynDSFSVoHeETd2N0T+1/Gq3hlWU9sOzh/SKEpU1Pro7/KURefXoFNBCrefqnQRMbThzICGOw7Qa59h/QQ5J2rh4AfhzkWLNjuh73OkBe2Y61vHBdMKzj7UZPf3jDi3R+AZcLPrm4L0PgHBcsd+BCOrLC+XDutBlaX+k=
Received: from MW2PR2101MB1756.namprd21.prod.outlook.com (2603:10b6:302:d::31)
 by MW2PR2101MB1834.namprd21.prod.outlook.com (2603:10b6:302:7::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.2; Thu, 18 Mar
 2021 02:00:29 +0000
Received: from MW2PR2101MB1756.namprd21.prod.outlook.com
 ([fe80::bced:1ffd:80dd:b192]) by MW2PR2101MB1756.namprd21.prod.outlook.com
 ([fe80::bced:1ffd:80dd:b192%7]) with mapi id 15.20.3977.005; Thu, 18 Mar 2021
 02:00:29 +0000
From: Dexuan Cui <decui@microsoft.com>
To: Laszlo Ersek <lersek@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
CC: Vishal Verma <vishal.l.verma@intel.com>, Wei Yang
 <richardw.yang@linux.intel.com>, Ross Zwisler <ross.zwisler@linux.intel.com>, 
 Haozhong Zhang <haozhong.zhang@intel.com>, "Williams, Dan J"
 <dan.j.williams@intel.com>, Jeff Moyer <jmoyer@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: Microsoft and Intel NVDIMM ACPI _DSM interfaces status?
Thread-Topic: Microsoft and Intel NVDIMM ACPI _DSM interfaces status?
Thread-Index: AQHXG3+/P6Bcw06/i0CDTlKjiPP+JKqI8TIg
Date: Thu, 18 Mar 2021 02:00:29 +0000
Message-ID: <MW2PR2101MB1756B8A06546D00D9307BA4CBF699@MW2PR2101MB1756.namprd21.prod.outlook.com>
References: <YFHsy8599w7KT1SB@stefanha-x1.localdomain>
 <eaee4c20-5fd7-f257-eddf-331ffe4e39ef@redhat.com>
In-Reply-To: <eaee4c20-5fd7-f257-eddf-331ffe4e39ef@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=d6e40ed7-7fb8-465b-8877-d9b7b9663ed9;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2021-03-18T01:14:51Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=microsoft.com;
x-originating-ip: [76.104.247.152]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7be57455-de05-4817-049d-08d8e9b19b5b
x-ms-traffictypediagnostic: MW2PR2101MB1834:
x-ld-processed: 72f988bf-86f1-41af-91ab-2d7cd011db47,ExtAddr
x-microsoft-antispam-prvs: <MW2PR2101MB18342796B5E232DF029616B9BF699@MW2PR2101MB1834.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: m22mb9Mfz3ZZPg/W+RgZM1IYf8hkas/pWJFvjD+yR00foeBvCKU4cuX+jq9t9XnwODRP5ID03ygrKUjq7xRjkg91TClgT0GXS/MQ2TQAoNqzwj7eUo5JbWFiLSs8sqkyCMYomRYBKEy3crkePyFLp4LLaYJOmOg9cv4PzGkK/r4rhKpZVMhN7zXKZZ1y0MGb/CVa4HxNuD00KpBHqlL3qDQLTonFmgqMI+ZCjGaCxK1eYzpruq2vb4y6v8hJB69MoUgAIwdLisJ2sNHXNOHFRGfRuVfmTMlSIgFXKS5Nw1uxZEvbTCFosUy3WFl1YJMDolXtQ69ptp/6/fzC28SSTSQ/zy9LWfMa2PdfUwXqmGbHjJ9vEwNp+Y5WPU2146KlEldUHlrqbsXivYZThBJAmx20W19ZRqaOA30ZUgA5Ufl1yk6dU3BPFY1gB01IfqGN4DT+MTLJuLmkyzIVr/q51EHHSCYcw4jpURj6GNfBF0C/2wSsANG/1xClnW+VeO5EC7C0MrZSoElJn7xKHQDYXnoJOjH9F2SJfxgKN2muHNd1QWIUGZKpmJkm6CSTKFJW2gHeOR+m4Ah8UudLtJ3VG+yEgQ1S2hbErSdov/731FdDTSHxc4xVcn2iIIv3s6Fw
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR2101MB1756.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(346002)(366004)(39860400002)(47530400004)(83380400001)(64756008)(478600001)(33656002)(316002)(186003)(38100700001)(110136005)(82950400001)(7696005)(8990500004)(54906003)(86362001)(82960400001)(6506007)(66556008)(2906002)(66476007)(26005)(66946007)(71200400001)(9686003)(4326008)(55016002)(5660300002)(8936002)(76116006)(66446008)(8676002)(10290500003)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?0Fq5g4p2dwH5+5ufkxGqq5smqSvlxy3KKL3qEpr42aEIGnYFbleD18nxDKp7?=
 =?us-ascii?Q?PIg5jXc1K9Ac+rKFJOd74GkHc1B7x1vemDO1Kk10DA5KBStzRaRFWO2mhHG+?=
 =?us-ascii?Q?E0v59JZaBSlIyQhppsWpCKquu9S/zhqOshwDyAqCexmmdb52q73cDbr1R5yd?=
 =?us-ascii?Q?uTdUYzQaMJAFAsqKG1fNa5rFLxp7e9Lj13KhDkvGgPc19CNufxr7RexZcyUO?=
 =?us-ascii?Q?iEJx2vCkcYgrOvzJvl0nKE9HJfwORJFQDyWGVXmRiuuSxxtI4yCYH+hlJ9ZG?=
 =?us-ascii?Q?McKqL/ME//tlQztQdF151yAocT8izEnbSIL4oCVMOFbU1H/GgAhLqZBV2kk1?=
 =?us-ascii?Q?YpWXS+tMW2VTF8lQ45hbN4XgnK7R425vMMMPPTuzfYmFgPImvPUHBjfZ6TZc?=
 =?us-ascii?Q?VVVjaUD6ITm3t3kja/jzngXGifXLkEjpYhdRJNV1M4xIab4zohY/YifYid4Z?=
 =?us-ascii?Q?XnRLFFZsvdLYg0Z8pCs41l6Eqhhma4qsbEvJ4B9VdGmO8V+g3xMee18LdLZk?=
 =?us-ascii?Q?7MoDQUDR4neMMYAdHovbnVE//gU+MnohP6RqBX41EPNlr7L/oha0Hi4hJo04?=
 =?us-ascii?Q?1kmO7vPTxV+eUCP6YAnj88iozJoMOQoryY7xyQsBb/c0XaadUPANwU8Rh8b8?=
 =?us-ascii?Q?N03uFMT3KC8JLm/timv4aCZikOsPTYAm1UM6KlZ8BixozxQU5tywKCjbdsWU?=
 =?us-ascii?Q?8IeMmoEHju+u3Qhz3YSFdGn/duW3AE5kLE2QBIi4+Zv5WcHjvs8pS/B0yvj1?=
 =?us-ascii?Q?nDrnmWbTDFQ1mTXRiHjjW85PZ9e9Qxa821gTvilThLS5P6kH/QnycyyFIe8J?=
 =?us-ascii?Q?vcInHKqXc0vABAl19cZSr+VvLPRwBI585Yi6K2ptcz8yUTfN4wufCK6kxW3N?=
 =?us-ascii?Q?fty7bgqkZdxuv8jjmXcYD0qKmV3Tq1sgZ7I+AxawK1Lnj7f4IE4hWtEt2F2N?=
 =?us-ascii?Q?ehcmTc4zkeHxXqCNilZmqtkYurP9tT9zLmSys5prugOKNrQ/OXdkPIWitCO4?=
 =?us-ascii?Q?XGBteLlIlnbEouyCe8Z+vZZLEYlmyx4cRfS7XfMpqWW0pQcKdw/hdE8umNRQ?=
 =?us-ascii?Q?clNE0iBzjAj1cD8+ON02BEWNgSnJrNqS0OwBUPJgn/WC8zJ/lEggc3R3+iXd?=
 =?us-ascii?Q?cVOYZWdyHHRAPYMvFKbWFKldt1v7dT8jeoKHamZIrIErM6Nj60esCjvNUdjW?=
 =?us-ascii?Q?O6bbWxVNPeYp9+/9MM0zEZjyTQs6E5JUjmvoqg309U85e2yBda3WdnC1uBW/?=
 =?us-ascii?Q?X0xUBD2i97a2gvwkplT89GBLZ/SEYVr7xGY96u2Ua6PnCNBnl3hWGV1QCYKu?=
 =?us-ascii?Q?z6JZ017mqe44dFJ8N4Fz6NdV?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR2101MB1756.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7be57455-de05-4817-049d-08d8e9b19b5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2021 02:00:29.6372 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Df758tVbmhFbisXIW876c/9VRlDKw91Y1ukJTviiWrMf7mgxQGzlr3cOX02TDL49KB7f4jsdGlEpM3bPoefXJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR2101MB1834
Received-SPF: pass client-ip=40.107.92.139; envelope-from=decui@microsoft.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 18 Mar 2021 02:33:24 -0400
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> From: Laszlo Ersek <lersek@redhat.com>
> Sent: Wednesday, March 17, 2021 3:45 PM
> > The specs for the Intel interface are available here:
> > ...
> > This is the interface that QEMU emulates. It has been reported that
> > Windows 2016 Server and 2019 Server guests do not recognize QEMU's
> > emulated NVDIMM devices using the Microsoft driver.

I'm not sure why this happens -- sorry, I have no Windows knowledge.
=20
> > Should QEMU emulate both of them to make running Windows guests easy?

I'm not sure about the background here, but since it looks like QEMU is alr=
eady
able to emulate the Intel NVDIMM, I suppose it should be quick to add the
emulation of the Hyper-V NVDIMM. I think they're pretty similar, and the
_DSM interface supported by Hyper-V NVDIMM is simple.
=20
> In my (uneducated) opinion: yes. Microsoft standarized their Region
> Format Interface, with their _DSM UUID and all; and right now, that spec
> seems to be the *only* officially approved format in the RFIC registry.
> So it's plausible to me that, unlike the Linux kernel, Microsoft's
> driver doesn't support the -- technically unapproved, nonstandard --
> Intel Region Format Interface.
>=20
> Dexuan, please correct me if I'm wrong.
>=20
> Thanks,
> Laszlo

Hi Laszlo, I'm not 100% sure, but I guess your may be correct.

BTW, earlier in 2019, we made the below patches (which are in the mainline)=
:

2019-02-28    libnvdimm/btt: Fix LBA masking during 'free list' population
2019-02-12    acpi/nfit: Require opt-in for read-only label configurations
2019-02-02    libnvdimm/dimm: Add a no-BLK quirk based on NVDIMM family
2019-01-29    nfit: Add Hyper-V NVDIMM DSM command set to white list
2019-01-29    nfit: acpi_nfit_ctl(): Check out_obj->type in the right place

The patches improve the interoperability between Windows VM and=20
Linux VM, e.g. the same Hyper-V NVDIMM device can work this way:
the Windows VM creates an NTFS partition based on the device, and
creates a text file in the partition, and later we shut down the Windows VM
and assign the device to Linux VM, and Linux VM is able to read the text fi=
le.

Before the patches, IIRC, Linux VM could only use the Hyper-V NVIDMM
device in label-less mode.

Let me share some old 2019 notes about Hyper-V NVDIMM, in case the
info may be helpful to you:=20

"
In Linux VM, IMO the label-less mode is preferred for Hyper-V NVDIMM,
because Hyper-V does not support _LSW (I'm not sure about the latest
status), so Dan made the patch "acpi/nfit: Require opt-in for read-only
label configurations" to not use the Hyper-V label info, by default.
In label-less mode, when creating a namespace, Linux can set it to
one of the 4 namespace modes: fsdax, devdax, sector, and raw (these
namespace modes are Linux-specific and can not be recognized
by Windows.).=20

With the "nfit.force_labels" bootup-time kernel parameter, Linux can
be forced to be in label mode, and then if Hyper-V initializes the 4KB
BTT Info Block(s) with the standard EFI_BTT_ABSTRACTION_GUID
(which is defined in UEFI 2.7 spec), we're supposed to support the
"interoperability" between Windows VM and Linux VM.

Note: label-less mode is incompatible with label mode. A namespace
created in one mode can't be recognized when Linux runs in the other
mode. In label mode, so far, only 2 namespace modes (raw and sector)
can be supported by the Hyper-V NVDIMM, because Hyper-V doesn't
support _LSW, yet. If Hyper-V sets the EFI_BTT_ABSTRACTION_GUID,
the namespace is "BTT-capable" and can be in sector namespace
mode, otherwise it's in raw namespace mode.

After a Windows VM initializes a BTT-capable namespace in a Hyper-V
NVDIMM device by creating a NTFS file system in the namespace, we
can re-assign the Hyper-V NVDIMM device to Linux VM, and in label
mode Linux VM is supposed to be able to read and write the files in
the NTFS file system.
"

Thanks,
-- Dexuan

