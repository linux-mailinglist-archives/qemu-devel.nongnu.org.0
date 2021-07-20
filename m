Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 136B93D020F
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 21:11:31 +0200 (CEST)
Received: from localhost ([::1]:48190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5v9O-00052l-5d
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 15:11:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thanos.makatos@nutanix.com>)
 id 1m5v8Z-0004Nm-Fo
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 15:10:39 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:47368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thanos.makatos@nutanix.com>)
 id 1m5v8W-0003SO-Kd
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 15:10:39 -0400
Received: from pps.filterd (m0127838.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16KJ53Js007708; Tue, 20 Jul 2021 12:10:33 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=sr7eu9u4feGBJy+/kl2yL7KZ32J6U3GFxKvu/Ul8030=;
 b=j+SkJqd27mauK8BxEbdjqNiA2rTytTaLIW74s6jtteZ6yvcKx7WRyqtn9ZDdovNCmrA7
 o3ZExzAC+irWCWIZIVZE0J7BgZT6Plor+AN4K3bG2WjDGcLVWTumB6/SweAayfG/BMv6
 NwyD6f6spMcQV+qElgNnqyjchM1z7Zf6hFvPD2whPyKkic1GGuitmaazbkyll3zzpne+
 c/SXm5YgqOFGhoJaY32md3eAZc87vqUgnD0fpAPBeNvsLC2cSzWH//WEy0zmdBOaGEb+
 lnjN7Dp1wN796zuVqvtZKZxbIdodTrs+NjrRDDDKZSj5N4piFZgVmJtwsOGU9LjXcWX6 Cg== 
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2048.outbound.protection.outlook.com [104.47.51.48])
 by mx0a-002c1b01.pphosted.com with ESMTP id 39w78kbjgk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jul 2021 12:10:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=afi9Ja10Sy+WlglFjQh5mgBlKnnml1HpwaKsr8fjXP3xKZFsY8rxcnm3HPOh1vi9825fIU67/Vma4bEkP8DdtgwyA5AoaL+X8+pAyHglslg5XwuECCFJSlDqLyPLHbywLZ4UgUqQfz3hCv+ZCEqU4HCK0FYKLg/9FwHAjfCv1udFbq2yBehA7DJRNlt9hB03tFQSOZ6+s9Ez7FaVaLy6dvI8Tip0JdGyIHV96QwsPE5MoLsb8bzSWIkLSw4Poo7ZjMX7Ge+M9tJv8okWOvLkKtiqaa4xXTad4+dgOltutUlrQP4aqv7+gbuigySuiske7tXVopXWQumRwKIvCQwIrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sr7eu9u4feGBJy+/kl2yL7KZ32J6U3GFxKvu/Ul8030=;
 b=TkiRZhm/okY7wIr+oVtfHcdgPfAX7dlK1nuhOzscfqFxzxWkLpSVHus8Q3uosuT/OCIs9SESN/L1odh6yMLrSoF6rBkiN9MFbK/VVWR61iykWVhglkg3p/wHbGW6CYjHtmeHhvX+EDtfc1PBMN7egZyckXOyOTIctQM4Vkzh4ecdKxTZ8hF8sRjauKEiXHrknNfDVJGf4hWu7r26LIMPnd/LBJKrWkv3qo4eJ7/MDZG0lfDQZgGX3wouj81ePWHdR+UuU5MXbCGDS/F//kfLRcJpBlM90s31C2hPqV7uZ9P1QrpqSB6QJ45PnjoFVt2gokBbWxC75xCLqor8Y80TTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from CH0PR02MB7898.namprd02.prod.outlook.com (2603:10b6:610:113::5)
 by CH2PR02MB6104.namprd02.prod.outlook.com (2603:10b6:610:d::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Tue, 20 Jul
 2021 19:10:31 +0000
Received: from CH0PR02MB7898.namprd02.prod.outlook.com
 ([fe80::3167:f3a5:5f8c:284b]) by CH0PR02MB7898.namprd02.prod.outlook.com
 ([fe80::3167:f3a5:5f8c:284b%9]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 19:10:31 +0000
From: Thanos Makatos <thanos.makatos@nutanix.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: RE: VFIO/vfio-user: specify NVMe namespace to boot from
Thread-Topic: VFIO/vfio-user: specify NVMe namespace to boot from
Thread-Index: Add3IRjipNVw1LSNQ8eSxs0hDldgcAAvmmEAAW6eVwA=
Date: Tue, 20 Jul 2021 19:10:31 +0000
Message-ID: <CH0PR02MB7898B28B8D9A1C77336F1E3D8BE29@CH0PR02MB7898.namprd02.prod.outlook.com>
References: <CH0PR02MB789873144D21EEEB6C501D298B159@CH0PR02MB7898.namprd02.prod.outlook.com>
 <YO2BxLCOmNgRqIBl@stefanha-x1.localdomain>
In-Reply-To: <YO2BxLCOmNgRqIBl@stefanha-x1.localdomain>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nutanix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 64c47e25-026d-4b12-dcb9-08d94bb20b32
x-ms-traffictypediagnostic: CH2PR02MB6104:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR02MB61040DCDADAF5F971AACD8728BE29@CH2PR02MB6104.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yiUNdIpHseXR4OKfKs8cV3WmeR5yktymFPSR4j5lZFjbryt/h77gdvEtYRL4ZEXchlGe3y/gKgQbXkUURM4T4/hiMZFTu4i0o6gkSpt89XQUk//atHScHRl+GDLKgMQT5OfM65WZL9Ra1Mb1YPmHGvlgt6/aooGGPPenkpfCKDnnI3ypQh8vC92KnjiAAju5rJv+LrU7EL0HoZJZvO6LI4OaAWRP/uACdC5Q68bRDExCNnRvVavhSCtdFj52kfbx3m4mnyZfiLV0bH1V7+PjW47WrSWUFKzixdv/W6eTPrImOUUpwmkyg0ubQZIssH9FetY7lJdFap5ttzzMnbSNUZUKohKW2jXNeKFpLP4YwWqX2DRUeG7Myw1kYAsMSPKVeasU2rH8KNESvAJbQn5wZ4FJB5J3EsqtrlHHHiB5d6tlEMae6MOyH0Ohv9UsW3AnQ366e0V6OtWNH4IsUx1Gt4SAw3fEhSW6JgWUT1o/CTrTvp4VSm1g2dI5Hz7riDrPu96OD+CEi+RoDjMjMgQNKssp2ksEW4zgCWmd7uGNKR6wtnPPb44SjMy0o91h6MOn4W+3xhWRK1nXNmEPjIVD6AOk9ya8FAw3z+QVJr5SkLDPXMwH6HjPxbHTO3RAagzrn8TWJnDbh+N5p2aDIeXjHAlRJ4Y2opl56s90BScfyYbTgvnI+1wEgit1qDkKTEU61oByBodx+c3gaG4reY+d5KOFi1855Wq757R6LIh1ntCBe5X1S3/RqGR/eRg9LtKTG6pNlOl2/8uqJnmCFqTreqKrPiVzTSP12a+sYA1W5N4Thb4hjMT4op4TFzUgAZ1FOIGxFy1cL0dSkmXdzBabfw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR02MB7898.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(396003)(346002)(376002)(136003)(366004)(8936002)(8676002)(44832011)(66946007)(55016002)(6916009)(2906002)(38100700002)(83380400001)(5660300002)(52536014)(9686003)(122000001)(33656002)(4326008)(71200400001)(186003)(26005)(966005)(316002)(66446008)(64756008)(66556008)(66476007)(478600001)(76116006)(54906003)(86362001)(6506007)(7696005)(38070700004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?oXhD/9wJJ/TBCwLLa1prtTMWXTWOFLgspdf0DDqr2DQ3AhICCyy7istin6r6?=
 =?us-ascii?Q?PbjIwAyBaBR96cXf4E0Rnxr0u/SMu4XODbKOMnUAlWKDsgtDpH90Cbcu1UY1?=
 =?us-ascii?Q?6hh2h+ZhPmZs8Iwl2TXaZChLhXPgrCigAhfgTUIbHghTOGo7LulPEJixAOBB?=
 =?us-ascii?Q?kxjJZis1WX3+c9mSGdxcD+FPhER3nLsipX1ocIJOvwYaPj4/QPAEsdtXhmKc?=
 =?us-ascii?Q?FC3oY7lLvZat2mw3GAIvyhcxWJ9p//Vih8w1ywpjZvwxWV+lCcJnlRpLd8KM?=
 =?us-ascii?Q?8WZE8sbO86bCCmlqPpa6xu5KZHX0qfuoErIIKhNno7ZxZy1v3ZpBXVdhsZG5?=
 =?us-ascii?Q?gt3lUtvpR6yG36YQ7c2oF+fgSUSn89MfiepeXdIXqmpK8c+6KqikjjGWyLUH?=
 =?us-ascii?Q?bbs8W1XQqp6vqe9UEm3eJJwbbvcwuFUqwwPMDERuWXoNRBn9//+RN/V2l4Mh?=
 =?us-ascii?Q?Hub/iqaHXV6Ozbt3wvVsu76GrEBmgK6WS08Xlp9DXyrxLHKHBAhXv2aIsfYk?=
 =?us-ascii?Q?rcCc7icM44VCt71db76/Y8seabwN//e6/Doe+J4oJqhui0y2AOe07S0C20sg?=
 =?us-ascii?Q?YUGj+zAm9rtelZkGplunwe2T/LDCU5Tc3bIMM35aP/6haigGfxwKpTOWoWVT?=
 =?us-ascii?Q?eUP3hN8fJduIgtrCN3XAQi2IcH6M8fik8YG4mRCsLRPCWA6qlJ9JQAhQ8SLt?=
 =?us-ascii?Q?dWe+tYANmjSlOLJPtStZlVSu25WfSISRTbRs15YVbTWIPnPoCUxnqqhgrtHC?=
 =?us-ascii?Q?sNYcOHEazbNp9LdgLNxfJ507EoG5/A7MelNdBR1j8xDEaHHD/54Hs2XK/2PN?=
 =?us-ascii?Q?twhF2rOq/rFX+dJCnhnicFU9FqP3V0GDoFdGT3hjgsl1LFqn7d3kEZhuk+Pu?=
 =?us-ascii?Q?EpXJ2Juf7yydDc7438rXvCc0qDlAk3oT1EbaQVPxCB2nQ7tyQ+aaKA527Z3a?=
 =?us-ascii?Q?GJvXrkLGGamvQ0/uWJEuk/stmEkViYnAsnLNrO/CSFukAfe2QJK/v82sudGb?=
 =?us-ascii?Q?aWk2c1+K2Lrt0199ESCYPy/rg3upPVn/7OEShpwhMKHqWUq2ERksH+nH3/mV?=
 =?us-ascii?Q?hH23s81kDDWSLYa8RJw9c9XWlmNW2uKDm3hKdW01xmwJ2r8itv5ujwRZeTxc?=
 =?us-ascii?Q?l36SFX0v3KCGI0O4UbEmvLRXGKXeK+lsTI3ODIgsB+MLMNhyoojuw7G0v7Gw?=
 =?us-ascii?Q?YwK0paU0lRssuQc5silJGMaCdRdfSJ+Aa1KO38S8NIuOWZkfE6ftMRcreB3e?=
 =?us-ascii?Q?tOIIp3xYGUZ53n/YiKtLHQFUmddpDpemeqVHCCpZ6XCm2lYOVirbPJ798uG0?=
 =?us-ascii?Q?XrM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR02MB7898.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64c47e25-026d-4b12-dcb9-08d94bb20b32
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2021 19:10:31.2844 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MPf/DN9ww1qLBYDfgOREn1Wa23GFdW/8xfO0USrYyrsBHFzhS8kGfjvu7736pvxVxoFu+T+WIall2pxIQV8XL5fXOQ2h3qD/14b0wcANE5E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6104
X-Proofpoint-GUID: LK3TTO6DUKbDvGRNkTcHBspBnbol80JM
X-Proofpoint-ORIG-GUID: LK3TTO6DUKbDvGRNkTcHBspBnbol80JM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-20_13:2021-07-19,
 2021-07-20 signatures=0
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=thanos.makatos@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 "jag.raman@oracle.com" <jag.raman@oracle.com>,
 John Levon <john.levon@nutanix.com>,
 "k.jensen@samsung.com" <k.jensen@samsung.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "kraxel@redhat.com" <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> On Mon, Jul 12, 2021 at 01:24:07PM +0000, Thanos Makatos wrote:
> > We're working on implementing a virtual NVMe controller based on SPDK
> and a multiprocess-qemu branch that uses the vfio-user. We're facing a
> problem where the existing API doesn't allow us to tell QEMU from which
> NVMe namespace we'd like SeaBIOS to boot from.
> >
> > How can we solve this problem? Can we add a parameter to the '-boot'
> option, e.g. '-boot path=3D/devices/pciblah/...@namespace0'? AFAIK VFIO
> should have the same problem.
> >
> > The corresponding SeaBIOS patch can be found in
> https://mail.coreboot.org/hyperkitty/list/seabios@seabios.org/thread/2Q7
> NPH7TJNHK6JGPHQL7755HILO23ISN/
>=20
> Hi,
> I have CCed Gerd Hoffmann on a hunch that he may have ideas.
>=20
> Yes, I think the path needs to include the Namespace ID similar to how
> SCSI boot paths include the target/channel/LUN.

Just to make sure I've explained the problem correctly, what we need to fix=
 is not specific to NVMe: we want to be able to boot from any PCI device, s=
o we'd need something like '-boot /devices/pciblah'. Specifically, for NVMe=
 we might want to specify the namespace (as we can't necessarily assume tha=
t the first one must be used), therefore we'd have to add the '/namespace0'=
 bit. For other kinds of PCI devices, we'd have to append something differe=
nt.

Would such a change be acceptable?

>=20
> When the SeaBIOS NVMe driver probes the controller is should discover
> the available Namespaces and set up individual drives for each
> Namespace. That would be analogous to virtio_scsi_add_lun().

Setting up an individual drive can easily exhaust SeaBIOS's limited memory,=
 so it's better to either probe the specified namespace or probe the first =
active one. I've sent a patch here: https://mail.coreboot.org/hyperkitty/li=
st/seabios@seabios.org/message/TKKUCH5PYZPXZG3NA2F5SALUFUVUYDZG/


