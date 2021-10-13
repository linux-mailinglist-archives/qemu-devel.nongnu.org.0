Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FC842B659
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 08:07:10 +0200 (CEST)
Received: from localhost ([::1]:58108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maXPx-0001Kk-6t
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 02:07:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1maXOd-0000Lv-Lv; Wed, 13 Oct 2021 02:05:47 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:20008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1maXOb-0000j6-62; Wed, 13 Oct 2021 02:05:47 -0400
Received: from pps.filterd (m0127843.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19CMes6n009140; 
 Tue, 12 Oct 2021 23:05:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=7MKDfIUkFOrBQFG73pWjejh1dOeJrWhe9ml9G4b9lKQ=;
 b=ySWJqircQEZS8oVHoATcY9zyYC5C7tm/IUDdTrpyrBClqXJXCHB8qYO4k15ntTmz0sLi
 MP1yyC8obsO6yUFdrFXQ7/FYjqsfCMRSUJC/rIrWB+i+36oTML6aFAU6Gu8M8OxZ3yJk
 3C4E5yMTIJ4HdAyouoouZ5io5V1DkHoYnL390XnDtE2tI3FXQa/c2UPThoVLZJ2AKhL0
 p0mGibohKSkmBD+Wc4oHSq4bsQbVxqAOYoRbBGygvZKh+svgmpPLPr+DinrTTIUQEelS
 su8Zh55CM7mbrBLFIaz0hvq2tJMuVXdo7UpgfnN921pnLdF0EJK5eVUF/F8XUvlTYQFh Fg== 
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2176.outbound.protection.outlook.com [104.47.73.176])
 by mx0b-002c1b01.pphosted.com with ESMTP id 3bnkc50ka1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Oct 2021 23:05:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WHAHq000rPMgkkP/wPzR7vJCSL0kL2YgXp/Z5/WLjYQ+FIPXoFp4z3cn5gZYMHttxbP6M1ZjrwMsHATo/gMvRmPFJSD1yjLL44hXXdn81aqoybQcs59IrrBXTISOfHKhBRbAcBQa/t0qZpa6WHbnM48nTlKrnP7Yjdr+WGEeranyGOhDTr9EC9QMf301KnL7Lcni1IX7VYG7WMHCFGqGNbWBkGWDx1rsQAyA6ooXTY2G1YHyJG8HE7ntZep0DxILxOaMAUy8KFMYVlpBeQU88B0eI9tqW8BNAlDl0AqxSHqC/JuVil1YUsS68zRlb1GyaA20YyhHrV3AGLly0E+UZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7MKDfIUkFOrBQFG73pWjejh1dOeJrWhe9ml9G4b9lKQ=;
 b=AzMChNqyvl6L/iwf/VwV4D7Owg5yvnnaoen/6LZXC3x3NFhjHdI1kvi08xgkWNwJnPjhOhSnpWMu4ufI6FJ5/xWGmQi8cGwE2pdQDpl1z7jULr0XYSPGsiRPmga9iGSwtQ/i8OUH8kgKTwmVW63Rcd9Td+UELeVbDo/8I6ypu9pVW5WyLB1kYWqzEq/9x3ZaWzKq8JhthCgA9RrDGYyhI9Ay/G200z8fQRASyrJyMeyWC0goL1BUPzYExXk9DPve9i7gyU1BAgBMjmA5L48W2Fwp8liW13bxzmpsLT0TyXGVdTJTs193vMFQInNYYkBKY7X1H/XO10VYlXQ4TU5K9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from CH0PR02MB7947.namprd02.prod.outlook.com (2603:10b6:610:104::22)
 by CH2PR02MB6055.namprd02.prod.outlook.com (2603:10b6:610:3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Wed, 13 Oct
 2021 06:05:38 +0000
Received: from CH0PR02MB7947.namprd02.prod.outlook.com
 ([fe80::95a5:72e6:5a62:470c]) by CH0PR02MB7947.namprd02.prod.outlook.com
 ([fe80::95a5:72e6:5a62:470c%6]) with mapi id 15.20.4587.026; Wed, 13 Oct 2021
 06:05:38 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1] libvhost-user: fix VHOST_USER_REM_MEM_REG skipping
 mmap_addr
Thread-Topic: [PATCH v1] libvhost-user: fix VHOST_USER_REM_MEM_REG skipping
 mmap_addr
Thread-Index: AQHXvtwaeFZLuGJV1Eq0Q9rMxfifyavQcu4A
Date: Wed, 13 Oct 2021 06:05:37 +0000
Message-ID: <20211013060530.GA8032@raphael-debian-dev>
References: <20211011201047.62587-1-david@redhat.com>
In-Reply-To: <20211011201047.62587-1-david@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nutanix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6db11dc9-cb3b-4909-6173-08d98e0f7a7b
x-ms-traffictypediagnostic: CH2PR02MB6055:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR02MB605589A0399B77FDBE66C84AEAB79@CH2PR02MB6055.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DLnsJcqs+UYi8eDZkq7VHdEciKdKD7OdchMqf9TND+oZv3UiJq1US79ForsnT+to4CdUSCGxgayhm55417tga3kLfeJhl5M+TLxg2lZeEHDSqwW3IuuDaWP/KADtmTMvUftrKWYBZa49JY4zOjbZDSvQFENx9jRIWNuIDcxppzPkNSlTbJ6/IuwS2p3k0094zOwuHNrCUVDdMvbeVjjrFrpJPD+3hdwanje6LAkRh0kvZ85PHgOMxL1SZithrEs29CbTAkhlgf5KH1LWjqEostEN8kT2R+CBtNs2MTiyNZXWqItz3aDUG7AStcYQKS9+UhrcnZynsIFx2wnGb2VD6sORp3ZM49JsSt+tXwBHgibK+altXkHVMCrT1qXzectYj+YeZ7dx+2e6lS4i9pyTAQ9QcFyCN7wCQtpqV+aejrOnpT2jXKTRYRjJcnofh1DXSrUyVfE1Yne1VLqwIflXqcD5jDIwaTPtKKvM8RmmNFmu9o2N0vAOPtjY2o0D5himcIOJKzgXKxaCooj47xuCZ5l8iRQZhyjsg8giP8iQG+0SPasCPyuVlMHPXcG95VfHV/Ezoh7lQxxe5B7UsW5XLX9HqUEwNLCa/v/1kmoy/xjVBtpK8OO/nNygPwBa42Lcrh9QaNkeqNlYc8v36HrinQAPZpnDqCH44j3NJcEHZ6IFVrpnSzSRWoeB0dpyO/ps1uTwujx5LjKwZBJ6LGNUQA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR02MB7947.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(366004)(44832011)(33716001)(6486002)(1076003)(6916009)(4326008)(6512007)(9686003)(5660300002)(508600001)(8676002)(6506007)(71200400001)(54906003)(316002)(8936002)(26005)(186003)(2906002)(83380400001)(38100700002)(122000001)(91956017)(38070700005)(64756008)(66556008)(66476007)(86362001)(66946007)(66446008)(76116006)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Cxe3XqQH22cgCVixwHTLGRHYmM4G9BScgF4ifqmpNl72s8XGm9pSjKEqTn?=
 =?iso-8859-1?Q?JQJONTdb4Ur4Yu+M7RSzEXb7muGFQw2PZ+kQn2D9Ayox+JKdzOyHcB19WY?=
 =?iso-8859-1?Q?tx9eWAEVJCEO9KU3c+IYZzv78nZN2Egjr2SMzMIdqFFGoaTtvm6hb0bboK?=
 =?iso-8859-1?Q?pIn9cwrwU/bgx9+4HKv2oJvx0LICiHkeXYQwp9rbqe9FCPVwGoJhUUpoet?=
 =?iso-8859-1?Q?rg7PLI2wxnxyM/zGEo4RgbegBIfll3Wx/IHS7yIq0W9vutvVTgi4OSOyuC?=
 =?iso-8859-1?Q?GaZrfc2dfZMuFIJ41LCKsUQUEDfvi9uiDT7/YdDLZHDfxXcsPwJo+OiYbT?=
 =?iso-8859-1?Q?eFS3kbtRRF0w28LLc114IZ9A/MdFAwrkuMNIpbpglfcANjgui2REB5JcAn?=
 =?iso-8859-1?Q?RKSGNfvfpTfzaI10BGYQa6Unx7FqR8eGocxlnYPLWhWsJxlUhfNEGi2ZTf?=
 =?iso-8859-1?Q?DR6UDv4DbQJEs8Xi1YE/o2fJl6HLvvmNoxojPkFa4GajtqaoDIi+eBf1wz?=
 =?iso-8859-1?Q?u/edFN+8LGSF6Si/rUAx0JtvnThnECCjIXKlWHIMqxmo0v6wSSWEpAyNRb?=
 =?iso-8859-1?Q?o9sJGvs6K/gZsZDoDD5Wt6q2VEoNr4JmeTsm5i/dwpnkKj1s9VC9dlBSlf?=
 =?iso-8859-1?Q?LKRaWZLx1mFueIUqcRMzO4vACoLrhfE6RcLAr+oHLDEwA53GR9r3l61pVd?=
 =?iso-8859-1?Q?0Sgz/QthPl8r4un7269jnAToOZPCl85jytS9IhgA+bHHIjLWC2Dbn3YQN3?=
 =?iso-8859-1?Q?P1fz2t2UX2Yn2gYlGv3Hpb2L8s+Gh15J5dobFb8TQbnKKljrjZrFpsQqJ8?=
 =?iso-8859-1?Q?ZNYgKPvWiAAy5kI5dw6m74uhkajGOxuGKnwWZsTgsNveuuQVRrZG3aRaAB?=
 =?iso-8859-1?Q?Bd+b8AhSygaxhYhiL/KMo72VzFtbCwCrE/ne4wRktBrygJLL3B7SGAu26q?=
 =?iso-8859-1?Q?HyCDuegotLnIxUveijc/9RM2E3ymvauyDGAhkN7rrLL5zA4gmJ58XCUbWC?=
 =?iso-8859-1?Q?AY7y+Otpg0hQaNTRssq4Vb96GKpyP5uvJYfcbhH0DYDVrpuFivx91F3aq9?=
 =?iso-8859-1?Q?VQcyuE+s2wUU5ODmV3mfUKK4eNZTt0qQU2lZVVZ3B8C6yOZfOaPJZVRrI3?=
 =?iso-8859-1?Q?lmP+03E9m6llFW3vj4JFdLhRVmW0LMHlvbLz5UdC6cPrMU8KmtFn0V5T4/?=
 =?iso-8859-1?Q?YC/URKg6HNvWl8hABqlzXzVAVCdKA4EloP1pDxxK5kHyruUeVfh3boyr95?=
 =?iso-8859-1?Q?iuy5bjUJQhO2HrqjLxP6sE2d0b3vOpGn5sWJsltpjgPaMwuiHyFKbc0A6o?=
 =?iso-8859-1?Q?KFa9aVCd0c0RTlIl7AodXqbymx+Eg0WNOW2eci9ZDuRJzM305jouyLSFO8?=
 =?iso-8859-1?Q?btHQo3sITt?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <47810037474AA6419A9C7F798EE263F5@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR02MB7947.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6db11dc9-cb3b-4909-6173-08d98e0f7a7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2021 06:05:37.9000 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tAkod/YwKr3dHlhXCpiPSM7gyzJCtFnUoKpCN7wcZBsDzlVbyl53ubXw8pFsmQQPiMV13YswDqw3AdwtVK3d7Z2fhoeb+gTv2P4C73kJB+8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6055
X-Proofpoint-ORIG-GUID: leMEvWjjjUy9n6rtJEIbpYFLHpT5VzTS
X-Proofpoint-GUID: leMEvWjjjUy9n6rtJEIbpYFLHpT5VzTS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-13_01,2021-10-13_01,2020-04-07_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 "qemu-stable@nongnu.org" <qemu-stable@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Coiby Xu <coiby.xu@gmail.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 11, 2021 at 10:10:47PM +0200, David Hildenbrand wrote:
> We end up not copying the mmap_addr of all existing regions, resulting
> in a SEGFAULT once we actually try to map/access anything within our
> memory regions.
>=20
> Fixes: 875b9fd97b34 ("Support individual region unmap in libvhost-user")
> Cc: qemu-stable@nongnu.org
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>
> Cc: "Marc-Andr=E9 Lureau" <marcandre.lureau@redhat.com>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Coiby Xu <coiby.xu@gmail.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>

> ---
>  subprojects/libvhost-user/libvhost-user.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libv=
host-user/libvhost-user.c
> index bf09693255..787f4d2d4f 100644
> --- a/subprojects/libvhost-user/libvhost-user.c
> +++ b/subprojects/libvhost-user/libvhost-user.c
> @@ -816,6 +816,7 @@ vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
>              shadow_regions[j].gpa =3D dev->regions[i].gpa;
>              shadow_regions[j].size =3D dev->regions[i].size;
>              shadow_regions[j].qva =3D dev->regions[i].qva;
> +            shadow_regions[j].mmap_addr =3D dev->regions[i].mmap_addr;
>              shadow_regions[j].mmap_offset =3D dev->regions[i].mmap_offse=
t;
>              j++;
>          } else {
> --=20
> 2.31.1
> =

