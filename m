Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36260410331
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Sep 2021 05:11:30 +0200 (CEST)
Received: from localhost ([::1]:59658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRQlF-000697-AO
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 23:11:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=489508de8a=xuzhou.cheng@windriver.com>)
 id 1mRQjo-0005BD-3U; Fri, 17 Sep 2021 23:10:00 -0400
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238]:51104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=489508de8a=xuzhou.cheng@windriver.com>)
 id 1mRQjl-0003sN-5k; Fri, 17 Sep 2021 23:09:59 -0400
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18I1YnUY008891; 
 Fri, 17 Sep 2021 20:09:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=XWUvjjXrBdCB/X+vExNKLVfEy3LmUdf/FGxTCT4H6eU=;
 b=hL0yo6VecuLRseZDGhEnZOAVI1xWISu7k0V/8j05AJi/nNoGGdyNgm56Nxb9N8Y02/j6
 p5qcCc3fqLf767pMbUaH5yPApdMZ/35b0TDl+A+ZOiQ423GcrkTnvmYagRPw8GwgiHVS
 3+7qqoK7Mqg1UCJM8axvMckGDlxPc1Gt51/D5TbcRRg3zKrdw4w6ksT+aZU1F1cnSFmb
 cO6/PFCWKRkw846mU/MfVEEDhojdGC6qx9Ce42Iu7/m0fyN4mxsiaXnqt32XLc8r32RM
 6bqdIIuwJ41DyIGPE1xaRIhtmZrSKQMBmFg+6kxGTGIBZHmy6OJKlALxev7124vkzPhK QQ== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
 by mx0a-0064b401.pphosted.com with ESMTP id 3b50vb8btm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Sep 2021 20:09:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y0NZWgVFYSgjLpZUojQbAfK/zCcmNbgaqeU/VMEeK201o8OXVeXhMtUGoCrRy/ubcE8rLdmeS5iSRnSNa37yqClgCXdDyBroAvRGU6kJVW44JHeVNoTMnlNrz/wqrKaba2kUba1+CdGm8tuSUk1p+iedaXHCsqbjzsCKTk8AMJcDMomzJ2gaGUuDkEiTd3wjxUux9IAzOvE6gxMafSGZQJIPP04lA2JLHBRHh5fIKJtRKISmP82+nQ3eie0gfJki4zDleV0fOiIEtfXok1nmbJEOS2Ra7v2SkZN/ndeROaV1R/9479Owzg+0Z53pQkTmVTCAurLHUyqVbR60CHx67g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=XWUvjjXrBdCB/X+vExNKLVfEy3LmUdf/FGxTCT4H6eU=;
 b=AxqKdC9jLnNA3NniwrIBtEob98Q2KxSXM6gL0riYqJZIVXeEy4ORTOyjwnDV69sRVGHNN/+yEG8lTdRJaa/9qtr8GnD+iJIUu6wwIib7H1OZ+gUyhvwz7DLyR5OCvR9CoIiDkE0+pnsP7uD83gkV7rp0Te7XcMG30lPxugLFiyJ1w72SdRrK0AT+HMTIZkb+2MzJRbVb9pepnwWQ3xiBo1H4/VfSbI8/buCBC1US4drUcbC9XVUR1snc2dORPBVM9yweNrSOHEt7pZs5OwzmEyWMGcymMY2+6BZnShLcUtLh+67kapHiG+Gcs+WwJpkzuIqul+vRrsYxLLhccJzoNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5205.namprd11.prod.outlook.com (2603:10b6:510:3d::24)
 by PH0PR11MB4775.namprd11.prod.outlook.com (2603:10b6:510:34::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Sat, 18 Sep
 2021 03:09:35 +0000
Received: from PH0PR11MB5205.namprd11.prod.outlook.com
 ([fe80::c062:7238:b631:eb40]) by PH0PR11MB5205.namprd11.prod.outlook.com
 ([fe80::c062:7238:b631:eb40%6]) with mapi id 15.20.4523.017; Sat, 18 Sep 2021
 03:09:35 +0000
From: "Cheng, Xuzhou" <Xuzhou.Cheng@windriver.com>
To: Guenter Roeck <linux@roeck-us.net>
Subject: RE: [PATCH] hw/ssi: imx_spi: Improve chip select handling
Thread-Topic: [PATCH] hw/ssi: imx_spi: Improve chip select handling
Thread-Index: AQHXpHskAiQidG75/Um5ihjizNW0VKuZvOaQgACeDgCADCMesIAARUwAgAJnNvA=
Date: Sat, 18 Sep 2021 03:09:34 +0000
Message-ID: <PH0PR11MB52058E0462672E61797758B997DE9@PH0PR11MB5205.namprd11.prod.outlook.com>
References: <CAFEAcA_cAp6kWTE6Lpx6QF1zfTYfQXiOPgdfkztS3iuJkRB0xQ@mail.gmail.com>
 <b5e43e87-c1bd-3265-298e-346413a22a82@roeck-us.net>
 <CAEUhbmWN1=j=hPntg1j6aOv-AZNDm1UrDFB364Qqf0SAccyJew@mail.gmail.com>
 <c49b65a2-fa3e-c180-5fdf-a0a64cb91a32@amsat.org>
 <e08467c0-bd69-81d3-93d3-13b8fc812453@roeck-us.net>
 <CAEUhbmX9JxE+VxSL8BWGd_XKD-WJ0r5d5MKsbdVgPiJkZd5Y3w@mail.gmail.com>
 <CAEUhbmVfFRdbtu7yWUauO6sd0QNhoH6tuTAFA2PMxZp5P7+awA@mail.gmail.com>
 <PH0PR11MB5205AE78D6C5DFFFA767183B97D49@PH0PR11MB5205.namprd11.prod.outlook.com>
 <8b86d434-a2e6-8122-0a88-dc9a15fbfe87@roeck-us.net>
 <PH0PR11MB5205684F9CDEC890187D09D997DC9@PH0PR11MB5205.namprd11.prod.outlook.com>
 <20210916142140.GA252836@roeck-us.net>
In-Reply-To: <20210916142140.GA252836@roeck-us.net>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none; roeck-us.net; dmarc=none action=none header.from=windriver.com; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5899b953-236c-4c5f-79a8-08d97a51be3c
x-ms-traffictypediagnostic: PH0PR11MB4775:
x-microsoft-antispam-prvs: <PH0PR11MB4775A85682A232A7B1E1035A97DE9@PH0PR11MB4775.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ye8GRqLuhiL7TajUvY/j89qAG4ZyCT/WcFYVg1EybSlwbayTBlHjMSqX16R1wzN1sKS1sKJJRRaqLJ2krmd8esSw2HXQ2TbOPwgph7ntaZt8vFXxuK4jmAshdEjc+i71adUTw7HX/TG6VKCJWj/LqS1RFY+k56x19ie+a8OrsY+OrnegwNkSJ7fBJ8/dpcYLS0GTlzWVdEeQj/YAyzM2auFXty7j/w/divsOa/JgUtp8f4rdRT8IUbDwgFAioJL72OdAx09Srfm07aBHAy22mvmOLlubHBMnXkd0ikxcZHoG8r03BHPvgB1wSi4E89WH5Qtl9zROq5biIuj9BFc2gzxK30AcHtbleklEWs0H3v6GioxgX3/2H6WEDi5xEY8P5eRFI0/50qBOE5+0xum3vd05FwBsTngRtjhJ/OrxOBRI9hfhTzoQgknd9F3jatdliwrVuXEOu58e7NuVSpzPrCKFSfkEM7hUlNOCkBs9CJtl+3/Sngp59ERmD8cNbQiUYXHFu7yliGtv7R6GLedzDRy8xTwtVWgkPALmb6Mm1KpjvH17r4zjVChFT7qZETmCuUg5/fVIfkSlDvwunXH676nm89Xtq88Wxqf5I9ZYUFAH6ECJFSLMxdnoMVc8dsk0ZoFrPVuZud+7w3iA1yu6oF+ajY+8s7q4BSIdayZg7X7A1tCZ08T8nBmj5secM6FB+D7fE7QV0N8ietSdtT/0pQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5205.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(39850400004)(366004)(136003)(346002)(5660300002)(52536014)(6916009)(6506007)(66556008)(76116006)(66476007)(64756008)(66946007)(66446008)(2906002)(33656002)(38070700005)(83380400001)(478600001)(38100700002)(122000001)(55016002)(54906003)(4326008)(9686003)(8676002)(86362001)(26005)(186003)(8936002)(71200400001)(7696005)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?iuqkwBkFH0VW2ITJf/XULU2VlV4+SzqdfSekPdFS9cjsxa5E4BomomEqIy?=
 =?iso-8859-1?Q?0PnLY4yOvTOtH4cKBHaVeEwNGpJINLhaamcwk+DG2k3nZ6dfoJyPjWDhP1?=
 =?iso-8859-1?Q?7Zs/EAHfXwUSRh5hiq+i225GB53i4yAcuMWpx3nUzehNSBsHKHhbAjbvGv?=
 =?iso-8859-1?Q?yRPUsduRT7lw1XjfTQr7QWJBPVj9gqZqzOSfOtTLld6LbyD86tNIiKkjfe?=
 =?iso-8859-1?Q?/QAjLULhZHLngA++r83QfPEj62/bZAddE59NcyAv0zHqeQiGxc6l7W6p/h?=
 =?iso-8859-1?Q?HfA/Ywd0wwQTLbRGMCIDe9/d2tmEc/HCbNVdzOaF4ZzdzrlQiLyHDlC/Df?=
 =?iso-8859-1?Q?5zq1hE+ayKjAVjww6sqFZEIWmI1vw1b9kR2KsLDzLXC69hfM6UJSfH80wZ?=
 =?iso-8859-1?Q?xoMACqpy1gu94g1W5EqB5HLiHIC30gYKVNQ4IDpcwjxhaYK6B7buUFKpwV?=
 =?iso-8859-1?Q?l+ZrPA/h/kHyBM+4G1KdJaCjbKEOAnc18mWQBLZt4hicHm4miYpBv7LRhb?=
 =?iso-8859-1?Q?QntqRuBus6+qR6dF0mi4FtZXWqGocsPfSJ8N6TaL26vxBI/MTRA+OtS90O?=
 =?iso-8859-1?Q?QS5mtGPSvRSjAmwzu7h5twGbBkxGgDq6jDUFMShzHwPD9fJCLsLzt5PZBv?=
 =?iso-8859-1?Q?uwa82u0yCI03DFYlnCeSOdmhUjFAw3abrLEJOd5TW5d7KULy6SQTFAEVtQ?=
 =?iso-8859-1?Q?JMgp08XJpUMwCHLMTjdjIUItazz5A/NaRC7BzZOglOLVv6ZCo5/rwxaRno?=
 =?iso-8859-1?Q?jSgqusqh9XWR3HU7SdyEgvq2wZNHScSiBwRNzYEdgc7ZmpIBsjMqSaetXW?=
 =?iso-8859-1?Q?CPQcCKw33bCQ0vX6bIhAjJj5gj7Hk+cy0VMkaVTx1ud0/JmjzLbvJ3EhHc?=
 =?iso-8859-1?Q?su3FAMTxofuAjxe1f++gNy2wo7Q7Uvh8IhcH4YaeH57gEGIjssEna3niYt?=
 =?iso-8859-1?Q?YhrDIeYt/xeRu5P31L9ove5mndi7GKHrnNE9k6QAcDstRreKaJLbmvwIuY?=
 =?iso-8859-1?Q?0Kp9BXOHSXq9GjNiXh4BRjKm7/AxuGOpQ6lKBDQUinUVd8V9WN0PSkq5D6?=
 =?iso-8859-1?Q?KTqLWMEBxY5jSU/foIRlVIdYeEBIkWiF+z0VSWp3QaKa4RLrOHFDYhM9E+?=
 =?iso-8859-1?Q?X6PWIdTLZjy7a+Hwhp0LTzx9JGpHW+nkFFFDqqqJ9GwdAxLk4bCF8MmUkA?=
 =?iso-8859-1?Q?lsb01xHsymHnIP4U8W5huYmURB8eVyBUmq4cdTA3tbfnHoR/zF+YsY2zbi?=
 =?iso-8859-1?Q?UfYVN/9iTwVYbI9iTLXJaaISiKWOXQNeOQkXJhjjdnN9pYbm1N0Yu96FXv?=
 =?iso-8859-1?Q?IfKqNDi2M+xN8f6MJqD8bouTmEI8gtQErtoVi/etOCMq9VE=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5899b953-236c-4c5f-79a8-08d97a51be3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2021 03:09:35.0248 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0TIT/ZC8eNfcBaN1DMmtV7hsGfPLMbJywHxya6r19+DFP4MnjH28MRz+0MrPniFw3qDE9XWMJH5CsAjv7L0oCOIR9EZHWViAKbaOobB0icc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4775
X-Proofpoint-GUID: 5Pf2xq9ZMWvP5u32kHukF2PxLBaAApk2
X-Proofpoint-ORIG-GUID: 5Pf2xq9ZMWvP5u32kHukF2PxLBaAApk2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-18_01,2021-09-17_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=1
 bulkscore=0 phishscore=0
 lowpriorityscore=0 spamscore=1 suspectscore=0 adultscore=0 clxscore=1015
 impostorscore=0 mlxscore=1 mlxlogscore=228 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109180019
Received-SPF: pass client-ip=205.220.166.238;
 envelope-from=prvs=489508de8a=xuzhou.cheng@windriver.com;
 helo=mx0a-0064b401.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair@alistair23.me>,
 =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> > I got some free time in the past days to investigate this issue. Guente=
r is right, the Linux imx-spi driver does not work on QEMU.
> >
> > The reason is that the state of m25p80 machine loops in STATE_READING_D=
ATA state after receiving RDSR command, the new command is ignored. Before =
sending a new command, the CS line should be pulled to high, this make the =
state of m25p80 back to IDLE.
> >
> > I have same point with Guenter, it's that set CS to 1 when burst is zer=
o. But i don't think it is necessary to set CS to 0 in imx_spi_flush_txfifo=
(). I will send a new patch to fix this issue.
> >
>=20
> Thanks a lot for looking into this. If you have a better solution than mi=
ne, by all means, please go for it. As I mentioned in my patch, I didn't re=
ally like it, but I was unable to find a better solution.
I am doing some experiment to verify that the new patch is reasonable, so t=
he new patch will be delayed few days.

>=20
> > BTW, the Linux driver uses DMA mode when transfer length is greater tha=
n the FIFO size, But QEMU imx-spi model doesn't support DMA now.
>=20
> Does it have practical impact ? Obviously my tests were somewhat limited =
(I was happy to get Linux booting from flash), but I don't recall seeing a =
problem.
There seem have no practical impact. :)

