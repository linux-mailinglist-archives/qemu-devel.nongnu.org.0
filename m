Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A05136EEDF
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 19:27:16 +0200 (CEST)
Received: from localhost ([::1]:33976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcARX-0001hW-M8
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 13:27:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1lc9vF-0000ko-Un; Thu, 29 Apr 2021 12:53:54 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:18370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1lc9vA-0000g5-Qz; Thu, 29 Apr 2021 12:53:53 -0400
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13TGpiHC008173; Thu, 29 Apr 2021 09:53:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=UnUdtDK2ScN1WYImaT51PmGtkMBgxph0k8w/z+51V9Y=;
 b=WAwolinyfVnNsbnzfGiDMpGu8NkvBgccQkJFvPYNs9sELVnwfPMXnfjut8uC7CKwg5rN
 aMn2BCuPJSzYpm5AQ4Lo2dDg9oenTkacjvrWk0sc4YbWZ5AlkBhkPxM71LqvA6PqcLvz
 HEqaM7Dc0ledD/CAJfipqVxTxgBZcBJ8SBiwvBZZHrPaDXLhx533AC1P9IFVqdi/B6tH
 GD/QkrfFYb42EGKgfKY7PFH1S5UKc49GmHRHbzcmvMoFBMdGKl0QQ48KW9FCw8ClxzsT
 3M6yK5crDg78OT0LmUl2mku0rXLGMeryzKDazvhfG0wzrATWBPWqqPNFLQib/xYi4C+m 5w== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
 by mx0a-002c1b01.pphosted.com with ESMTP id 387vtjgktb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Apr 2021 09:53:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=brXJ2cYycoeo7AYKVSQcHPf8rOOArIMYJ/FYMgB5L+EmlolNsAexr4CyDo93VwaAYYDLThSG6EfS0yl8Iar+NZaxwnOmfuYGFcSy9rAKuAiPMPmsEttZfVZN1X4Pyq6XKprwF//ZucNqjbqQfhSTluIV+vLk7gJO5E4mUZ+OVdngBtwFbWadUh93aVZGZnLxG38qzzz447q9DvuKEVL2lstyRzzA/pwjxID8InMyDhO62oW3sfPEgfgQDKzJYTOCRv5f/qI3CelXHiWxF9hWYtLlMtVktTWto7KWN9wOgh5ApFaW+kDCIr5dhLRjWYGDazKfoW3DmQmnODSSoNU77g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UnUdtDK2ScN1WYImaT51PmGtkMBgxph0k8w/z+51V9Y=;
 b=WgKmQo4vNohaRRhrRJP9SBTIc/7JestW+dD/AX3oec0B0p9EwWF/ZyxpYbEC5+XrKFY0W6GWlb4n7I8q9F9fF2oa6UlmTqM3EDANXEuNCQdP+qViFrDRWyYDj4ohkTlQcbDBiFfU0jfvha2CDqFn4MfPgn3RIpdeVA7doKxJwD+uBZweTfIvmG2/WcwUsm1fefHnDgXLfqsXwtVlNxh6o1VTExTwbkwAAVAKmqmM5xf/fUpwDPQwbR+mq6cndcml4N32p6BeoILDYqEY3DtgEhgb1eezc49ddH6E8TwggX/vlglhMGuOLce+mOq8rk9WDUJLgFuXwVpsmYyrnDpRog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from SN6PR02MB4543.namprd02.prod.outlook.com (2603:10b6:805:b1::24)
 by SA0PR02MB7116.namprd02.prod.outlook.com (2603:10b6:806:e4::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Thu, 29 Apr
 2021 16:53:39 +0000
Received: from SN6PR02MB4543.namprd02.prod.outlook.com
 ([fe80::bdbb:69ac:63f9:fc33]) by SN6PR02MB4543.namprd02.prod.outlook.com
 ([fe80::bdbb:69ac:63f9:fc33%7]) with mapi id 15.20.4065.026; Thu, 29 Apr 2021
 16:53:39 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 1/5] vhost-user-blk: Don't reconnect during initialisation
Thread-Topic: [PATCH 1/5] vhost-user-blk: Don't reconnect during initialisation
Thread-Index: AQHXN5luvZM5Xi2MZEaKiL49u8fLParLfNAAgABEXYA=
Date: Thu, 29 Apr 2021 16:53:38 +0000
Message-ID: <20210429165333.GA21503@raphael-debian-dev>
References: <20210422170221.285006-1-kwolf@redhat.com>
 <20210422170221.285006-2-kwolf@redhat.com>
 <YIqrNP7eg5EV0/iY@merkur.fritz.box>
In-Reply-To: <YIqrNP7eg5EV0/iY@merkur.fritz.box>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nutanix.com;
x-originating-ip: [69.122.45.60]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f693adcc-befd-4063-e7bc-08d90b2f5681
x-ms-traffictypediagnostic: SA0PR02MB7116:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA0PR02MB711639354E47E380363270A0EA5F9@SA0PR02MB7116.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: joB5GPnDLri4WKKjTbuNoYy/9Ol+HONkZGJHSGtJcaQIMUK343AGS1k90WW4Xr9xciCTlFdfODJE2vGdN5r16aZW2MrGQoFa8MmYPS41OADC7ZDMqGzEXVv9AT7J0czJdPk46phSJfpQiCMPXZ6e4UdjAwxDckLpF50+syLVQSc1Fso2+9s3QB/6CjdJ2Fao6NMDkrruEblohPfqeFpgnwolDCqHIoCNkKu7UFGXmcpb27l79UgNigPSwuXcCdoGedAhUZsjg1LBQzKAaXG4/wo5TLvEEDxacV5ANbE11M3y4PCi/TGl+64809cow/Jjfr24zQh+34NlZfqXQUS5M9Rv9NKyERRctoHesFEVBQzUh/+yR6PjkagyCpZ2V33e9lXBehSEbDEB1ooeHM6+io/3Uc0LDL2JQg/ZWZpMT1Uk3GlxXsvwNKWVcH4KCWWHXCO/jgWAS/VAsgrJ0jlbzobafxQ6ip/hz00QrwxaaOLWq+oYuyfjuXchPLYLCQ/x+JhPHLOCvOq0cHuYGdsxptTpcTwYymdA24hRrq/bU4bLafRuFkr+js9Wz4W0a11k681yr3Hr8HKHD2qY7u5kftMqdL9RrWrrqyhs1o8TXeI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4543.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(396003)(136003)(346002)(376002)(39860400002)(366004)(186003)(71200400001)(2906002)(64756008)(6916009)(9686003)(86362001)(6486002)(4326008)(66946007)(44832011)(33716001)(316002)(76116006)(66476007)(91956017)(558084003)(66446008)(122000001)(26005)(1076003)(66556008)(8676002)(38100700002)(6506007)(478600001)(5660300002)(8936002)(54906003)(6512007)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?2fJL5Eqy7mjfrQ0+xk22fselklfTi/o+1vR9ANNQOMcAQa4diHxPnyaU0lJQ?=
 =?us-ascii?Q?ma9MA3zmgLMy1L303P9pHuEJVl2t35i0l7N7BNem/TJ+thtb2gfAb3up5kUm?=
 =?us-ascii?Q?0Fklv4ysvTgruxWuM6/4mYwZJxPb4EwOAU4hiImOloheOZkRxDtxNbNyN8Yg?=
 =?us-ascii?Q?p+6Vey68M+Jp28i3hlNs638oP0WoEM3x3VHZTF5/kndAOYPR4IW/iTWfMRia?=
 =?us-ascii?Q?tuXuUU5dqgWcrnvzEhXblTR1ukomBARwP83zqLI7WE1I7trhb/hxWtZkpJVw?=
 =?us-ascii?Q?ba4r0VxH4UWNdgGAPzOIHHvcHm6knBL5BieZfyvT3VJ5LG8g5iGX5Wd437UL?=
 =?us-ascii?Q?ifWRbwl9wolB5rNTJj32MQBhrJFdszPFkzlCDBU8SDJxMwQOJIhwMgq0ampH?=
 =?us-ascii?Q?pXvMd2w6acOdhfbjDyfR1nBX7VUitiN1jQ1sS31+O3y/F4h/9PJfBBGgZQ+E?=
 =?us-ascii?Q?kAmftrbwRcGlNLrIC46lE10uCafWcaKlpgl+c8CWKOQl3sSBp4IwHHHORjnE?=
 =?us-ascii?Q?wN5Ql/9u1o/5KdOeupLyiTFjhQBGxOUFFg5kNoAWYSFDHMLzZOnBmoEVfzLa?=
 =?us-ascii?Q?Ou1vxQbdtGNgLotXJu2aun5sge8jmeIkmuyoKe/beFCnyjrbzXBMzX221ZQM?=
 =?us-ascii?Q?5i6mVFTBghht8dMYIXu8wA5oiFZPf7Hsg1LglIaizALz2quKCIw7WJ1uWmLX?=
 =?us-ascii?Q?ckt2eMhjyF/rdmXuLJ0akM67oLq3aiu5HCOIhoXoBqWYl6+Xt5Xc/wtwQWu5?=
 =?us-ascii?Q?S1KUHgdEWqAd0QMY1cOEjuXnbJ09NeYz2eIQpPOJEkeRVpMX9SIIzeFEOHGg?=
 =?us-ascii?Q?FEJzNH75Y5X5jDvjYlBl+XVGt+viAIygyU/Sq+wXIFztHjUKB/oXL37ETE2T?=
 =?us-ascii?Q?sY0V3WjxCU0cYzc2GQ/uDJfmnINPDWoJEbWxxL+9U+NKRGX1G3fZN5tK8g4C?=
 =?us-ascii?Q?mS2HD0bKxFuIY+JN/nGzfoH97YH1QqapGNx2F2L1RgLdCqA+DOZtcWgis2P2?=
 =?us-ascii?Q?3jtvqvuI1WnVm/QttGlkirEOxbt1r7lRBVNHQkxjdMox4B3gn5WpKLb62XHk?=
 =?us-ascii?Q?o7YbK42RY4Dmn7Sn5giQrisSIBDF3fJK6hBK9ILUufLOEkNKiXiJe+caBOzs?=
 =?us-ascii?Q?eNrHtix6NSPigHSuWsAlb9LrjVeUo2gOOJmgIte8jIVvFEWCtIz9ozWTfwNE?=
 =?us-ascii?Q?kKfT3XGNEjRBbMYGjOdAymZLTzJu3cp8/izP1T6lb7XSGhgO+h8SIJlTU+vI?=
 =?us-ascii?Q?Tr/4oE91W2U7MnsIsbXq9cdgABaBSjweAwbQXn/3tiTMTuWb7FfdkkAQzTL7?=
 =?us-ascii?Q?sTxqyf3xA/LcrPG61DWHxD4y?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CD01CC24D0D53040A4D9D4B1B2935815@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4543.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f693adcc-befd-4063-e7bc-08d90b2f5681
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2021 16:53:39.1159 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CNjXenbqJxJ12fYVsbvflEVw6bnEHMsxq/yFBFrxNtUKxWAUuSuzsz80/8Btp+R4OMjP7JYwgY4AGznXgHrwii67fQ9qAYU8L4rJEie9p/8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR02MB7116
X-Proofpoint-ORIG-GUID: HEC5Z3HR8yIwsYHmiFBNTIkqHbXTBNWX
X-Proofpoint-GUID: HEC5Z3HR8yIwsYHmiFBNTIkqHbXTBNWX
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-29_08:2021-04-28,
 2021-04-29 signatures=0
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "den-plotnikov@yandex-team.ru" <den-plotnikov@yandex-team.ru>,
 "mst@redhat.com" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 29, 2021 at 02:48:52PM +0200, Kevin Wolf wrote:
> So maybe patch 2 should come first and also fix the preexisting bug, and
> of course this patch needs a v2 that doesn't introduce the new instances
> of the bug.

Sounds good to me.

>=20
> Kevin
> =

