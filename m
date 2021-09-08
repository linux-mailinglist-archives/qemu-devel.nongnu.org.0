Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6336D403B3F
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 16:14:00 +0200 (CEST)
Received: from localhost ([::1]:36804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNyKs-0001tz-Vx
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 10:13:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=4885cc67ef=xuzhou.cheng@windriver.com>)
 id 1mNtWs-0002v3-Ee; Wed, 08 Sep 2021 05:06:03 -0400
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238]:31190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=4885cc67ef=xuzhou.cheng@windriver.com>)
 id 1mNtWm-0003kh-Ja; Wed, 08 Sep 2021 05:06:00 -0400
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1888LKVU004622; 
 Wed, 8 Sep 2021 02:05:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=Q70CB3MbIip5vXbmiXue2yyIv0uxqEknegMOz9JnYwI=;
 b=o787Tw+epshgXJSXEPAGkjcEg3K2NcflW3z2uizR0Kj07Rh62kjTH0hFB/9vfeMhsMK0
 vy7TEoL0Zcn5GyV+ONJxXWVM8wXdBY/WjUnS4PYoxzl2UUCvNc7FLFyhQ6InPViScdXK
 7S3xNQrBQq5xLIU2eFVWpwyFZbggFm/NW1az71V+735LMCAKIziNxmQ6tR7AQddqzIwa
 0r8x2Xxbz1KDcaA1uEDWsMmff7RHa48V31YkEipCtqMYXhOp9c+P6/iyFpvfSR0Ghil7
 uwzR3c0rjSTHUsXgKELGAiVHrx8mcOUwTViZuwgxGUeirkRUgBEzYopi8z1ms8Rgl/nB 0Q== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
 by mx0a-0064b401.pphosted.com with ESMTP id 3axcms0f49-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Sep 2021 02:05:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KDeZFklOuQKsyf2ImBR27KiNp4jM8GBOA21AX035GpZJ9ok4liv0/w3iB+zL7H/PATXBxUlvCfJOjXOQvx1QrcB2f+SsSHyRBHIP6X19gwlM3HG7ZumeOe36+Acpc2D9b3bOUErs0wWLetTVdsPHneBCTVtG5xOkux0hCIIDhfWWG8WOkozhugDiMxBCR78KCvzoSBVmxVlxg6PFaR9DgYhCrtECFijdGD7+S6zn5PUq1gjRcCDqlUU7vfRjoR1Og1b7ONTn6JmTTCcCXLs2JaFiKhWDX/VdGQgyhYMcohieckRdaufhbzAbEVbH3nmq/f3g5tS2TqcLRaQArcciSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=Q70CB3MbIip5vXbmiXue2yyIv0uxqEknegMOz9JnYwI=;
 b=Or4K571BNjGZrXe+9+r2J6k5cmf+uLAr6R+Z9MENaC3qrX3UCWMLc9BIzsts3LLrGbeirO26p6v4COXuRbd258wqhHoSq2s+SayumP/Lr4cyusSxQgOpJx+afTS/biLVn0XNX3iOH2NDk67jQZk4byzlMFf4w1EdEslfaq/o6d6HL0qs4KHjFg+1xM5hWTDZJSB2SRiO3Qee3k2xIunaE1pRYpzsLV1y3P4Ay7dbU6lAo6WAOxWz+C++bF4BmUw8mhKHnWD2Jd6WmG56d1BQjlv73ZbNY9ENJQ0Y+bjQGqoWmhMTfhNetFcAzruFs2ZkNhY+v9/8IPoEL6oP83YRRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5205.namprd11.prod.outlook.com (2603:10b6:510:3d::24)
 by PH0PR11MB4999.namprd11.prod.outlook.com (2603:10b6:510:37::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Wed, 8 Sep
 2021 09:05:26 +0000
Received: from PH0PR11MB5205.namprd11.prod.outlook.com
 ([fe80::c062:7238:b631:eb40]) by PH0PR11MB5205.namprd11.prod.outlook.com
 ([fe80::c062:7238:b631:eb40%7]) with mapi id 15.20.4478.025; Wed, 8 Sep 2021
 09:05:26 +0000
From: "Cheng, Xuzhou" <Xuzhou.Cheng@windriver.com>
To: Bin Meng <bmeng.cn@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Subject: RE: [PATCH] hw/ssi: imx_spi: Improve chip select handling
Thread-Topic: [PATCH] hw/ssi: imx_spi: Improve chip select handling
Thread-Index: AQHXpHskAiQidG75/Um5ihjizNW0VKuZvOaQ
Date: Wed, 8 Sep 2021 09:05:26 +0000
Message-ID: <PH0PR11MB5205AE78D6C5DFFFA767183B97D49@PH0PR11MB5205.namprd11.prod.outlook.com>
References: <20210808013406.223506-1-linux@roeck-us.net>
 <CAFEAcA8+o69ztRaaMvqh+zNaFs_6reSHX_ijknay6_0VePSE2w@mail.gmail.com>
 <a34c10d4-fc90-0186-3214-c3c5e77b4eea@roeck-us.net>
 <CAFEAcA_cAp6kWTE6Lpx6QF1zfTYfQXiOPgdfkztS3iuJkRB0xQ@mail.gmail.com>
 <b5e43e87-c1bd-3265-298e-346413a22a82@roeck-us.net>
 <CAEUhbmWN1=j=hPntg1j6aOv-AZNDm1UrDFB364Qqf0SAccyJew@mail.gmail.com>
 <c49b65a2-fa3e-c180-5fdf-a0a64cb91a32@amsat.org>
 <e08467c0-bd69-81d3-93d3-13b8fc812453@roeck-us.net>
 <CAEUhbmX9JxE+VxSL8BWGd_XKD-WJ0r5d5MKsbdVgPiJkZd5Y3w@mail.gmail.com>
 <CAEUhbmVfFRdbtu7yWUauO6sd0QNhoH6tuTAFA2PMxZp5P7+awA@mail.gmail.com>
In-Reply-To: <CAEUhbmVfFRdbtu7yWUauO6sd0QNhoH6tuTAFA2PMxZp5P7+awA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4f9fe0bc-f584-4422-5049-08d972a7cc5b
x-ms-traffictypediagnostic: PH0PR11MB4999:
x-microsoft-antispam-prvs: <PH0PR11MB4999CC8736E9BC1B9E600CBE97D49@PH0PR11MB4999.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8MR1DlFp3JX2cSqMzVWsj3pldsTv5YlsXWsq8y32nY+gvaHFUYqbAepgMo0hZXsIgH5D/1S+yW1cabwzDTCB3yoqUsnEuJMoY7aME3evWGwp1f+lXxl300Lt0vKdIU0ysQaB3PGAOwujxvX5RfXacP9R1tsJtXiOz5ggCydxCpo1hxwwfnXdjJHbV+p32LxXCQHSYpwjulshzjR1BgVRmSFLXlzF55VMhuO9lOwzvwsMbyR/MtX3wgGOIDBz3qf7ljJDaWaK4Zts5l0l8mQJRajO1PizeBiH1i1II9AE0rilOrYCoKfev+/UJUII9nsuz5UlYetygrqiRoPZhnzLTsiQTERVJW5RwZUZLnwSR6Ef/xA4pEttg4ZbThg7m4PM2a/I+9/Fw3ULpR5NCUCnEj8sOmhJmPZSCwu7hBgw5ioLv2j8fv+KK5NC072kdebKxnhgFC61zVx3uQw5BeDuXUjuhK+OTuzmW1jBoVPsgWFbI0BCaBD8wqUQbEBcRMjbDvK8aVkl8nhL7BLoxqQZTwUUnzhGUfWGuXI4UO6AZdyw3nz8rWWmfL/xfbyZMJwtLxIVMEhbm4U8PF78jmPele4Xo0qtwlbOlBFzZ/kcM1LoBJbo0ilaG0jYc6nziCh8A3siOtqAqn1twfM2z5wKuWn1XVtzr7yI0Q7sPXztE9fyQpU+liqrVRWLjH+5Dlafq9Sx4abMIdhXhx4QpO/md206Xtw0fn/+nwXkSGaw4rQVyKyxxfCJ9gap/z9lulDrz+MF25BJ+B6hHNKHCYoGy2d4QOdG6lWFGLJIvIgx/ZE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5205.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(39850400004)(396003)(366004)(316002)(478600001)(52536014)(4326008)(38070700005)(966005)(7696005)(83380400001)(2906002)(26005)(186003)(8676002)(71200400001)(8936002)(5660300002)(33656002)(66476007)(66556008)(64756008)(122000001)(9686003)(66446008)(86362001)(55016002)(110136005)(76116006)(53546011)(38100700002)(54906003)(66946007)(6506007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SFBUbjJPNytLQmhYTVh0cXh1WmhDaXRsVjVFcTUyQVk1dHZwYUlYYlJvU1Ez?=
 =?utf-8?B?R0NpYmNRbGptTmFydkFEZFJ0bnc3TWtXa3ZzeUY4OG9BbVE4Q0VNajlEZzE1?=
 =?utf-8?B?YTlOVGpYdW1xN3RYN09CY2RmZVAyT3RiYnoySmNWQTZSZUV3elc3ZXltRk5y?=
 =?utf-8?B?aVhTS0NZZnZDS0xLamZyc3JvRGJXQXlmUmc2bStiQ1VBMGtYTDNrL29XL2Vp?=
 =?utf-8?B?NFB6QmVlUnBVMExYdCtvUHpBZjl4WGVsdDVwSmEycGFjTlB0NzhLRVltMWZz?=
 =?utf-8?B?dytqSW9NWExpMWNtWjZwZzlFbzN3c3l5aGdHKzFOT2ozVi9nNnN6b1lVNlk1?=
 =?utf-8?B?Q0orczVZUG5rVGgvYjhQOVlNVjRxK2QvRHphWFpWdGJtWktOclEzd2JYTlhq?=
 =?utf-8?B?TGduOGdxK3JGeEMvRHp0d1VCTXUyR1E5cjlVYitwYzlOWHNReUhzT0xwMjR1?=
 =?utf-8?B?NEFhTU1JcGtsQmZQVmIzdzc0N0FHWDZOaWtMWVl3SzdEVndkaGMrMERxYWlj?=
 =?utf-8?B?R1lJM3ZBTncyNnZQMDl6elZqQ0ZHdjByc0VvVVEvWi9IN2Q5UTVOMnFuVmhJ?=
 =?utf-8?B?TGhlM2lwNDFac2hHek0vMWgvaWRPQitCdU5rQzZwOXRsK2FQUXZhQmNtS3M1?=
 =?utf-8?B?ZFZ2UC9WdkVWYlI0Y2lJSzFYcEtVSnJBVWxzdnI0N2IrT0FuM1lDU3hleWE4?=
 =?utf-8?B?cjVDdW91L2NVT3NUbSsyWnNZRlloejNDdWo4a3FjR204SWE2SWQ3T2VXRks4?=
 =?utf-8?B?a0VaSEsva0ZLNlUyRnVFK0NzbVFQSjlHUDlsL3RIWHF6Q2RzQkU5Rmx3Q1Vp?=
 =?utf-8?B?eUtTanJiSVVNK2FONHFmMncydVR0QVpaSkdQN2RiRVR3K0pJdmFIaXBCVVc3?=
 =?utf-8?B?ZHliWllGc2ZXT05VTGd0Y1IxZXFHVkcyZkQ3NFJmdWMwRW15aVFWVUFmcVQz?=
 =?utf-8?B?MFd6bmJXTVcrcE4xT0dEeDM4ZjBuYVNQZk4xa3FUdzMxaTZSRGZITi9ZdGJX?=
 =?utf-8?B?REdzUGVNbDd1cVFZa202QUtKWFVLZmgxNFpkWXl4WXpOQncwcWhaQ1ZUQkxP?=
 =?utf-8?B?dkpBc0ZlV3psWVhjV1crbzVPQ2dTWmFmeU8wY1k0NWNaTzhkQ2dua0NJTEVG?=
 =?utf-8?B?ZjdHTVJ5WFpZcDlyekpXUjR3SUh4NWxnSE1DdFgrd1J4REhhOXBSU3BZcGNE?=
 =?utf-8?B?OHlqclpOeXdxNVhyOWJML3huRmpWYW9tSnpmZU1QVVlybFhoU0ljc1lieDds?=
 =?utf-8?B?WklYTy9DUG8zalFsNkpWcEVhbi83bVVvLzRwREYwY2Y5VXkxZ1JBODFwck1E?=
 =?utf-8?B?M2YxL0FHUWFuZ1FQVVFOVS9ISmJvU21qcjQrQVJxQkNRN2Z5dkJyb0lpenR2?=
 =?utf-8?B?Y2Fvb2FHaDhYdnZEWjhtR1Y3UlJqZGl1blQ5WGU3eFVsWDVSdlR2cU5TSWJa?=
 =?utf-8?B?OWFrbWdLNnlDTlJCbUdZdk9ya1ZsbjY2cG1VOXVaYnNGeHBYS2lQSEZoQkpt?=
 =?utf-8?B?QnBKKzZxMU8zcUk4LzJXb2c5WlNkUCtGMGFVT0ZZYm1Xd2Fld2M2QTdBTk4v?=
 =?utf-8?B?bUlGOWFReFl2elFOTUZsNlE0YmtacXpJMFY5UnA2UXdlNjJjZmNVRHVxTnla?=
 =?utf-8?B?czNWZGJjZXFvNy9uMFMzUnhNcHI0MXNZUmx3Sm9wN2t4UzBJTkhRVG5kNXNp?=
 =?utf-8?B?L1Z3OFp2VzBhQWtKc0NkVGdkWTZ5V3dhdkVMRG9UdlptS0ZROU9OeGNGMUUv?=
 =?utf-8?Q?iohHlXM6bwOTekiWyk=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f9fe0bc-f584-4422-5049-08d972a7cc5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2021 09:05:26.0190 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cPoe6EBOi6l//aVqFRetnZlR7LRG4xCkmDvNPxwK/oCwnl//pgB+Lpb/q3HjpXjkx5jfc7wKzYoSk/ds4SA7AxF8WgzbUpFrn8VZeAWfYKY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4999
X-Proofpoint-GUID: qBCWF2wFt0pz6gIMBv5gncdAY0cYMZHT
X-Proofpoint-ORIG-GUID: qBCWF2wFt0pz6gIMBv5gncdAY0cYMZHT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-08_03,2021-09-07_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 mlxscore=0 priorityscore=1501 clxscore=1011 impostorscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109080058
Received-SPF: pass client-ip=205.220.166.238;
 envelope-from=prvs=4885cc67ef=xuzhou.cheng@windriver.com;
 helo=mx0a-0064b401.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 08 Sep 2021 10:09:14 -0400
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
 QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhhbmtzIEJpbiBhZGRlZCBtZSBpbnRvIHRoaXMgbG9vcC4NCg0KSGksIEd1ZW50ZXINCg0KSSBh
bSBpbnRlcmVzdGVkIGluIHlvdXIgcGF0Y2ggYW5kIHRoZSBpc3N1ZSB3aGF0IHlvdSBmb3VuZC4g
SSB3YW50IHRvIHJlcHJvZHVjZSB5b3VyIGlzc3VlIG9uIExpbnV4LCBidXQgSSBmYWlsZWQsIHRo
ZSBzcGktbm9yIG9mIHNhYnJlbGl0ZSBvbiBMaW51eCBkb2VzIG5vdCB3b3JrLg0KDQpDb3VsZCB5
b3Ugc2hhcmUgeW91ciBMaW51eCBrZXJuZWwgdmVyc2lvbj8gSXQgd291bGQgYmUgZ3JlYXQgaWYg
eW91IGNhbiBzaGFyZSB0aGUgZGV0YWlsZWQgc3RlcHMgdG8gcmVwcm9kdWNlLg0KDQpNeSB0ZXN0
IHJlY29yZDoNCkxpbnV4IHZlcnNpb246IGh0dHBzOi8vZ2l0aHViLmNvbS90b3J2YWxkcy9saW51
eCwgdGhlIGxhc3QgY29tbWl0IGlzIGFjMDhiMWM2OGQxYjFlZDNjZWJiMjE4ZmMzZWEyYzA3NDg0
ZWIwN2QuDQpMaW51eCBjb25maWd1cmF0aW9uOiBpbXhfdjZfdjdfZGVmY29uZmlnLg0KDQpRRU1V
IGNvbW1hbmQ6DQpxZW11LXN5c3RlbS1hcm0gLW5vZ3JhcGhpYyAtTSBzYWJyZWxpdGUgLXNtcCA0
IC1tIDFHIC1zZXJpYWwgbnVsbCAtc2VyaWFsIC9kZXYvcHRzLzUwIC1rZXJuZWwgekltYWdlIC1p
bml0cmQgcm9vdGZzLmV4dDQgLWFwcGVuZCAicm9vdD0vZGV2L3JhbSByZGluaXQ9c2Jpbi9pbml0
IiAtZHRiIGlteDZxLXNhYnJlbGl0ZS5kdGIgLW5ldCBuaWMgLW5ldCB0YXAsaWZuYW1lPXRhcF94
Y2hlbmcsc2NyaXB0PW5vIC1kcml2ZSBmaWxlPWZsYXNoLnNhYnJlLGZvcm1hdD1yYXcsaWY9bXRk
DQoNCkxvZ3M6IHRoZXJlIGFyZSBzYW1lIGxvZ3Mgd2hlbiBJIGFwcGx5IHlvdXIgcGF0Y2ggb3Ig
bm90IGFwcGx5LiBTbyBJIGRvbid0IHVuZGVyc3RhbmQgd2hhdCB0aGlzIHBhdGNoIGZpeGVzLCBt
YXliZSBJIG1pc3NlZCBzb21ldGhpbmc/IDooLi4uDQoNCiMgY2F0IC9wcm9jL210ZA0KZGV2OiAg
ICBzaXplICAgZXJhc2VzaXplICBuYW1lDQptdGQwOiAwMDIwMDAwMCAwMDAwMTAwMCAic3BpMC4w
Ig0KIyBscyAvZGV2L210ZCoNCi9kZXYvbXRkMCAgICAgICAvZGV2L210ZDBybyAgICAgL2Rldi9t
dGRibG9jazANCiMgZWNobyAiMDEyMzQ1Njc4OTk4NzY1NDMyMTAiID4gdGVzdA0KIyBkZCBpZj10
ZXN0IG9mPS9kZXYvbXRkMCAgLyogZmxhc2guc2FicmUgaXMgZW1wdHkgKi8NCjArMSByZWNvcmRz
IGluDQowKzEgcmVjb3JkcyBvdXQNCiMgZGQgaWY9L2Rldi9tdGQwIG9mPXRlc3Rfb3V0DQo0MDk2
KzAgcmVjb3JkcyBpbg0KNDA5NiswIHJlY29yZHMgb3V0DQojIGNhdCB0ZXN0X291dCAgICAgICAg
ICAgICAvKiB0ZXN0X291dCBpcyBlbXB0eSAqLw0KDQpSZWdhcmRzLA0KWHV6aG91DQoNCi0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBCaW4gTWVuZyA8Ym1lbmcuY25AZ21haWwuY29t
PiANClNlbnQ6IDIwMjHlubQ55pyIOOaXpSAxNDozMQ0KVG86IEd1ZW50ZXIgUm9lY2sgPGxpbnV4
QHJvZWNrLXVzLm5ldD47IENoZW5nLCBYdXpob3UgPFh1emhvdS5DaGVuZ0B3aW5kcml2ZXIuY29t
Pg0KQ2M6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxmNGJ1Z0BhbXNhdC5vcmc+OyBQZXRlciBN
YXlkZWxsIDxwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc+OyBBbGlzdGFpciBGcmFuY2lzIDxhbGlz
dGFpckBhbGlzdGFpcjIzLm1lPjsgUUVNVSBEZXZlbG9wZXJzIDxxZW11LWRldmVsQG5vbmdudS5v
cmc+OyBxZW11LWFybSA8cWVtdS1hcm1Abm9uZ251Lm9yZz47IEplYW4tQ2hyaXN0b3BoZSBEdWJv
aXMgPGpjZEB0cmlidWR1Ym9pcy5uZXQ+DQpTdWJqZWN0OiBSZTogW1BBVENIXSBody9zc2k6IGlt
eF9zcGk6IEltcHJvdmUgY2hpcCBzZWxlY3QgaGFuZGxpbmcNCg0KW1BsZWFzZSBub3RlOiBUaGlz
IGUtbWFpbCBpcyBmcm9tIGFuIEVYVEVSTkFMIGUtbWFpbCBhZGRyZXNzXQ0KDQpPbiBXZWQsIFNl
cCA4LCAyMDIxIGF0IDI6MjkgUE0gQmluIE1lbmcgPGJtZW5nLmNuQGdtYWlsLmNvbT4gd3JvdGU6
DQo+DQo+IE9uIFN1biwgU2VwIDUsIDIwMjEgYXQgMTA6MDggQU0gR3VlbnRlciBSb2VjayA8bGlu
dXhAcm9lY2stdXMubmV0PiB3cm90ZToNCj4gPg0KPiA+IE9uIDkvNC8yMSA0OjE5IFBNLCBQaGls
aXBwZSBNYXRoaWV1LURhdWTDqSB3cm90ZToNCj4gPiA+IE9uIDkvNS8yMSAxOjA2IEFNLCBCaW4g
TWVuZyB3cm90ZToNCj4gPiA+PiBPbiBTdW4sIFNlcCA1LCAyMDIxIGF0IDE6MTMgQU0gR3VlbnRl
ciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0PiB3cm90ZToNCj4gPiA+Pj4NCj4gPiA+Pj4gT24g
OS8yLzIxIDEyOjI5IFBNLCBQZXRlciBNYXlkZWxsIHdyb3RlOg0KPiA+ID4+Pj4gT24gVGh1LCAy
IFNlcHQgMjAyMSBhdCAxNzowOSwgR3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0PiB3
cm90ZToNCj4gPiA+Pj4+Pg0KPiA+ID4+Pj4+IE9uIDkvMi8yMSA4OjU4IEFNLCBQZXRlciBNYXlk
ZWxsIHdyb3RlOg0KPiA+ID4+Pj4+PiBPbiBTdW4sIDggQXVnIDIwMjEgYXQgMDI6MzQsIEd1ZW50
ZXIgUm9lY2sgPGxpbnV4QHJvZWNrLXVzLm5ldD4gd3JvdGU6DQo+ID4gPj4+Pj4+Pg0KPiA+ID4+
Pj4+Pj4gVGhlIGNvbnRyb2wgcmVnaXN0ZXIgZG9lcyBub3QgcmVhbGx5IGhhdmUgYSBtZWFucyB0
byANCj4gPiA+Pj4+Pj4+IGRlc2VsZWN0IGFsbCBjaGlwIHNlbGVjdHMgZGlyZWN0bHkuIEFzIHJl
c3VsdCwgQ1MgaXMgDQo+ID4gPj4+Pj4+PiBlZmZlY3RpdmVseSBuZXZlciBkZXNlbGVjdGVkLCBh
bmQgY29ubmVjdGVkIGZsYXNoIGNoaXBzIGZhaWwgDQo+ID4gPj4+Pj4+PiB0byBwZXJmb3JtIHJl
YWQgb3BlcmF0aW9ucyBzaW5jZSB0aGV5IGRvbid0IGdldCB0aGUgZXhwZWN0ZWQgDQo+ID4gPj4+
Pj4+PiBjaGlwIHNlbGVjdCBzaWduYWxzIHRvIHJlc2V0IHRoZWlyIHN0YXRlIG1hY2hpbmUuDQo+
ID4gPj4+Pj4+Pg0KPiA+ID4+Pj4+Pj4gTm9ybWFsbHkgYW5kIHBlciBjb250cm9sbGVyIGRvY3Vt
ZW50YXRpb24gb25lIHdvdWxkIGFzc3VtZSANCj4gPiA+Pj4+Pj4+IHRoYXQgY2hpcCBzZWxlY3Qg
c2hvdWxkIGJlIHNldCB3aGVuZXZlciBhIHRyYW5zZmVyIHN0YXJ0cyANCj4gPiA+Pj4+Pj4+IChY
Q0ggaXMgc2V0IG9yIHRoZSB0eCBmaWZvIGlzIHdyaXR0ZW4gaW50byksIGFuZCB0aGF0IGl0IA0K
PiA+ID4+Pj4+Pj4gc2hvdWxkIGJlIGRpc2FibGVkIHdoZW5ldmVyIGEgdHJhbnNmZXIgaXMgY29t
cGxldGUuIEhvd2V2ZXIsIA0KPiA+ID4+Pj4+Pj4gdGhhdCBkb2VzIG5vdCB3b3JrIGluDQo+ID4g
Pj4+Pj4+PiBwcmFjdGljZTogYXR0ZW1wdHMgdG8gaW1wbGVtZW50IHRoaXMgYXBwcm9hY2ggcmVz
dWx0ZWQgaW4gDQo+ID4gPj4+Pj4+PiBmYWlsdXJlcywgcHJlc3VtYWJseSBiZWNhdXNlIGEgc2lu
Z2xlIHRyYW5zYWN0aW9uIGNhbiBiZSANCj4gPiA+Pj4+Pj4+IHNwbGl0IGludG8gbXVsdGlwbGUg
dHJhbnNmZXJzLg0KPiA+ID4+Pj4+Pj4NCj4gPiA+Pj4+Pj4+IEF0IHRoZSBzYW1lIHRpbWUsIHRo
ZXJlIGlzIG5vIGV4cGxpY2l0IHNpZ25hbCBmcm9tIHRoZSBob3N0IA0KPiA+ID4+Pj4+Pj4gaW5k
aWNhdGluZyBpZiBjaGlwIHNlbGVjdCBzaG91bGQgYmUgYWN0aXZlIG9yIG5vdC4gSW4gdGhlIA0K
PiA+ID4+Pj4+Pj4gYWJzZW5jZSBvZiBzdWNoIGEgZGlyZWN0IHNpZ25hbCwgdXNlIHRoZSBidXJz
dCBsZW5ndGggDQo+ID4gPj4+Pj4+PiB3cml0dGVuIGludG8gdGhlIGNvbnRyb2wgcmVnaXN0ZXIg
dG8gZGV0ZXJtaW5lIGlmIGFuIGFjY2VzcyANCj4gPiA+Pj4+Pj4+IGlzIG9uZ29pbmcgb3Igbm90
LiBEaXNhYmxlIGFsbCBjaGlwIHNlbGVjdHMgaWYgdGhlIGJ1cnN0IA0KPiA+ID4+Pj4+Pj4gbGVu
Z3RoIGZpZWxkIGluIHRoZSBjb25maWd1cmF0aW9uIHJlZ2lzdGVyIGlzIHNldCB0byAwLCBhbmQg
DQo+ID4gPj4+Pj4+PiAocmUtKWVuYWJsZSBjaGlwIHNlbGVjdCBpZiBhIHRyYW5zZmVyIGlzIHN0
YXJ0ZWQuIFRoaXMgaXMgDQo+ID4gPj4+Pj4+PiBwb3NzaWJsZSBiZWNhdXNlIHRoZSBMaW51eCBk
cml2ZXIgY2xlYXJzIHRoZSBidXJzdCBsZW5ndGggZmllbGQgd2hlbmV2ZXIgaXQgcHJlcGFyZXMg
dGhlIGNvbnRyb2xsZXIgZm9yIHRoZSBuZXh0IHRyYW5zZmVyLg0KPiA+ID4+Pj4+Pj4gVGhpcyBz
b2x1dGlvbiAgaXMgbGVzcyB0aGFuIHBlcmZlY3Qgc2luY2UgaXQgZWZmZWN0aXZlbHkgDQo+ID4g
Pj4+Pj4+PiBvbmx5IGRpc2FibGVzIGNoaXAgc2VsZWN0IHdoZW4gaW5pdGlhdGluZyB0aGUgbmV4
dCB0cmFuc2ZlciwgDQo+ID4gPj4+Pj4+PiBidXQgaXQgZG9lcyB3b3JrIHdpdGggTGludXggYW5k
IHNob3VsZCBvdGhlcndpc2UgZG8gbm8gaGFybS4NCj4gPiA+Pj4+Pj4+DQo+ID4gPj4+Pj4+PiBT
dG9wIGNvbXBsYWluaW5nIGlmIHRoZSBidXJzdCBsZW5ndGggZmllbGQgaXMgc2V0IHRvIGEgdmFs
dWUgDQo+ID4gPj4+Pj4+PiBvZiAwLCBzaW5jZSB0aGF0IGlzIGRvbmUgYnkgTGludXggZm9yIGV2
ZXJ5IHRyYW5zZmVyLg0KPiA+ID4+Pj4+Pj4NCj4gPiA+Pj4+Pj4+IFdpdGggdGhpcyBwYXRjaCwg
YSBjb21tYW5kIGxpbmUgcGFyYW1ldGVyIHN1Y2ggYXMgIi1kcml2ZSANCj4gPiA+Pj4+Pj4+IGZp
bGU9Zmxhc2guc2FicmUsZm9ybWF0PXJhdyxpZj1tdGQiIGNhbiBiZSB1c2VkIHRvIA0KPiA+ID4+
Pj4+Pj4gaW5zdGFudGlhdGUgdGhlIGZsYXNoIGNoaXAgaW4gdGhlIHNhYnJlbGl0ZSBlbXVsYXRp
b24uIA0KPiA+ID4+Pj4+Pj4gV2l0aG91dCB0aGlzIHBhdGNoLCB0aGUgZmxhc2ggaW5zdGFudGlh
dGVzLCBidXQgaXQgb25seSByZWFkcyB6ZXJvZXMuDQo+ID4gPj4+Pj4+Pg0KPiA+ID4+Pj4+Pj4g
U2lnbmVkLW9mZi1ieTogR3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0Pg0KPiA+ID4+
Pj4+Pj4gLS0tDQo+ID4gPj4+Pj4+PiBJIGFtIG5vdCBlbnRpcmVseSBoYXBweSB3aXRoIHRoaXMg
c29sdXRpb24sIGJ1dCBpdCBpcyB0aGUgDQo+ID4gPj4+Pj4+PiBiZXN0IEkgd2FzIGFibGUgdG8g
Y29tZSB1cCB3aXRoLiBJZiBhbnlvbmUgaGFzIGEgYmV0dGVyIA0KPiA+ID4+Pj4+Pj4gaWRlYSwg
SSdsbCBiZSBoYXBweSB0byBnaXZlIGl0IGEgdHJ5Lg0KPiA+ID4+Pj4+Pj4NCj4gPiA+Pj4+Pj4+
ICAgICBody9zc2kvaW14X3NwaS5jIHwgMTcgKysrKysrKy0tLS0tLS0tLS0NCj4gPiA+Pj4+Pj4+
ICAgICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkNCj4g
PiA+Pj4+Pj4+DQo+ID4gPj4+Pj4+PiBkaWZmIC0tZ2l0IGEvaHcvc3NpL2lteF9zcGkuYyBiL2h3
L3NzaS9pbXhfc3BpLmMgaW5kZXggDQo+ID4gPj4+Pj4+PiAxODk0MjNiYjNhLi43YTA5MzE1NmJk
IDEwMDY0NA0KPiA+ID4+Pj4+Pj4gLS0tIGEvaHcvc3NpL2lteF9zcGkuYw0KPiA+ID4+Pj4+Pj4g
KysrIGIvaHcvc3NpL2lteF9zcGkuYw0KPiA+ID4+Pj4+Pj4gQEAgLTE2Nyw2ICsxNjcsOCBAQCBz
dGF0aWMgdm9pZCBpbXhfc3BpX2ZsdXNoX3R4ZmlmbyhJTVhTUElTdGF0ZSAqcykNCj4gPiA+Pj4+
Pj4+ICAgICAgICAgRFBSSU5URigiQmVnaW46IFRYIEZpZm8gU2l6ZSA9ICVkLCBSWCBGaWZvIFNp
emUgPSAlZFxuIiwNCj4gPiA+Pj4+Pj4+ICAgICAgICAgICAgICAgICBmaWZvMzJfbnVtX3VzZWQo
JnMtPnR4X2ZpZm8pLCANCj4gPiA+Pj4+Pj4+IGZpZm8zMl9udW1fdXNlZCgmcy0+cnhfZmlmbykp
Ow0KPiA+ID4+Pj4+Pj4NCj4gPiA+Pj4+Pj4+ICsgICAgcWVtdV9zZXRfaXJxKHMtPmNzX2xpbmVz
W2lteF9zcGlfc2VsZWN0ZWRfY2hhbm5lbChzKV0sIA0KPiA+ID4+Pj4+Pj4gKyAwKTsNCj4gPiA+
Pj4+Pj4+ICsNCj4gPiA+Pj4+Pj4+ICAgICAgICAgd2hpbGUgKCFmaWZvMzJfaXNfZW1wdHkoJnMt
PnR4X2ZpZm8pKSB7DQo+ID4gPj4+Pj4+PiAgICAgICAgICAgICBpbnQgdHhfYnVyc3QgPSAwOw0K
PiA+ID4+Pj4+Pj4NCj4gPiA+Pj4+Pj4+IEBAIC0zODUsMTMgKzM4Nyw2IEBAIHN0YXRpYyB2b2lk
IGlteF9zcGlfd3JpdGUodm9pZCAqb3BhcXVlLCBod2FkZHIgb2Zmc2V0LCB1aW50NjRfdCB2YWx1
ZSwNCj4gPiA+Pj4+Pj4+ICAgICAgICAgY2FzZSBFQ1NQSV9DT05SRUc6DQo+ID4gPj4+Pj4+PiAg
ICAgICAgICAgICBzLT5yZWdzW0VDU1BJX0NPTlJFR10gPSB2YWx1ZTsNCj4gPiA+Pj4+Pj4+DQo+
ID4gPj4+Pj4+PiAtICAgICAgICBidXJzdCA9IEVYVFJBQ1Qocy0+cmVnc1tFQ1NQSV9DT05SRUdd
LCBFQ1NQSV9DT05SRUdfQlVSU1RfTEVOR1RIKSArIDE7DQo+ID4gPj4+Pj4+PiAtICAgICAgICBp
ZiAoYnVyc3QgJSA4KSB7DQo+ID4gPj4+Pj4+PiAtICAgICAgICAgICAgcWVtdV9sb2dfbWFzayhM
T0dfVU5JTVAsDQo+ID4gPj4+Pj4+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAiWyVzXSVz
OiBidXJzdCBsZW5ndGggJWQgbm90IHN1cHBvcnRlZDogcm91bmRpbmcgdXAgdG8gbmV4dCBtdWx0
aXBsZSBvZiA4XG4iLA0KPiA+ID4+Pj4+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgVFlQ
RV9JTVhfU1BJLCBfX2Z1bmNfXywgYnVyc3QpOw0KPiA+ID4+Pj4+Pj4gLSAgICAgICAgfQ0KPiA+
ID4+Pj4+Pg0KPiA+ID4+Pj4+PiBXaHkgaGFzIHRoaXMgbG9nIG1lc3NhZ2UgYmVlbiByZW1vdmVk
ID8NCj4gPiA+Pj4+Pg0KPiA+ID4+Pj4+IFdoYXQgSSB3YW50ZWQgdG8gZG8gaXM6DQo+ID4gPj4+
Pj4NCj4gPiA+Pj4+PiAiU3RvcCBjb21wbGFpbmluZyBpZiB0aGUgYnVyc3QgbGVuZ3RoIGZpZWxk
IGlzIHNldCB0byBhIHZhbHVlIG9mIDAsDQo+ID4gPj4+Pj4gICAgIHNpbmNlIHRoYXQgaXMgZG9u
ZSBieSBMaW51eCBmb3IgZXZlcnkgdHJhbnNmZXIuIg0KPiA+ID4+Pj4+DQo+ID4gPj4+Pj4gV2hh
dCBJIGRpZCBpbnN0ZWFkIGlzIHRvIHJlbW92ZSB0aGUgbWVzc2FnZSBlbnRpcmVseS4NCj4gPiA+
Pj4+Pg0KPiA+ID4+Pj4+IEhvdyBhYm91dCB0aGUgcmVzdCBvZiB0aGUgcGF0Y2ggPyBJcyBpdCB3
b3J0aCBhIHJlc2VuZCB3aXRoIA0KPiA+ID4+Pj4+IHRoZSBtZXNzYWdlIHJlc3RvcmVkIChleGNl
cHQgZm9yIGJ1cnN0IHNpemUgPT0gMCksIG9yIGlzIGl0IG5vdCBhY2NlcHRhYmxlIGFueXdheSA/
DQo+ID4gPj4+Pg0KPiA+ID4+Pj4gSSBkaWQgdGhlIGVhc3kgYml0IG9mIHRoZSBjb2RlIHJldmll
dyBiZWNhdXNlIGFuc3dlcmluZyB0aGlzIA0KPiA+ID4+Pj4gcXVlc3Rpb24gaXMgcHJvYmFibHkg
YSBtdWx0aXBsZS1ob3VyIGpvYi4uLnRoaXMgaXMgc3RpbGwgb24gbXkgDQo+ID4gPj4+PiB0b2Rv
IGxpc3QsIGJ1dCBJJ20gaG9waW5nIHNvbWVib2R5IHdobyB1bmRlcnN0YW5kcyB0aGUgTUlYIFNQ
SSANCj4gPiA+Pj4+IGRldmljZSBnZXRzIHRvIGl0IGZpcnN0Lg0KPiA+ID4+Pj4NCj4gPiA+Pj4N
Cj4gPiA+Pj4gTWFrZXMgc2Vuc2UuIE9mIGNvdXJzZSwgaXQgd291bGQgYmUgZXZlbiBiZXR0ZXIg
aWYgc29tZW9uZSBjYW4gDQo+ID4gPj4+IGV4cGxhaW4gaG93IHRoaXMgd29ya3Mgb24gcmVhbCBo
YXJkd2FyZS4NCj4gPiA+Pj4NCj4gPiA+Pg0KPiA+ID4+IEkgaGFwcGVuZWQgdG8gbm90aWNlIHRo
aXMgcGF0Y2ggdG9kYXkuIEJldHRlciB0byBjYyBwZW9wbGUgd2hvIA0KPiA+ID4+IG9uY2Ugd29y
a2VkIG9uIHRoaXMgcGFydCBmcm9tICJnaXQgYmxhbWUiIG9yICJnaXQgbG9nIi4NCj4gPiA+DQo+
ID4gPiBFdmVuIGJldHRlciBpZiB5b3UgYWRkIHlvdXJzZWxmIGFzIGRlc2lnbmF0ZWQgcmV2aWV3
ZXIgOykNCj4gPiA+DQo+ID4gPiAkIC4vc2NyaXB0cy9nZXRfbWFpbnRhaW5lci5wbCAtZiBody9z
c2kvaW14X3NwaS5jIEFsaXN0YWlyIEZyYW5jaXMgDQo+ID4gPiA8YWxpc3RhaXJAYWxpc3RhaXIy
My5tZT4gKG1haW50YWluZXI6U1NJKSBQZXRlciBNYXlkZWxsIA0KPiA+ID4gPHBldGVyLm1heWRl
bGxAbGluYXJvLm9yZz4gKG9kZCBmaXhlcjppLk1YMzEgKGt6bSkpIA0KPiA+ID4gSmVhbi1DaHJp
c3RvcGhlIER1Ym9pcyA8amNkQHRyaWJ1ZHVib2lzLm5ldD4gKHJldmlld2VyOlNBQlJFTElURSAv
IA0KPiA+ID4gaS5NWDYpDQo+ID4gPg0KPiA+ID4+DQo+ID4gPj4+IEluIHRoaXMgY29udGV4dCwg
aXQgd291bGQgYmUgdXNlZnVsIHRvIGtub3cgaWYgcmVhbCBTUEkgZmxhc2ggDQo+ID4gPj4+IGNo
aXBzIHJlc2V0IHRoZWlyIHN0YXRlIHRvIGlkbGUgdW5kZXIgc29tZSBjb25kaXRpb25zIHdoaWNo
IGFyZSANCj4gPiA+Pj4gbm90IGNvdmVyZWQgYnkgdGhlIGN1cnJlbnQgY29kZSBpbiBody9ibG9j
ay9tMjVwODAuYy4gTWF5YmUgdGhlIA0KPiA+ID4+PiByZWFsIHByb2JsZW0gaXMgYXMgc2ltcGxl
IGFzIHRoYXQgY29kZSBzZXR0aW5nIGRhdGFfcmVhZF9sb29wIA0KPiA+ID4+PiB3aGVuIGl0IHNo
b3VsZCBub3QsIG9yIHRoYXQgaXQgZG9lc24ndCByZXNldCB0aGF0IGZsYWcgd2hlbiBpdCANCj4g
PiA+Pj4gc2hvdWxkICh1bmxlc3MgSSBhbSBtaXNzaW5nIHNvbWV0aGluZywgdGhlIGZsYWcgaXMg
Y3VycmVudGx5IG9ubHkgcmVzZXQgYnkgZGlzYWJsaW5nIGNoaXAgc2VsZWN0KS4NCj4gPiA+DQo+
ID4gPiBQbGF1c2libGUgaHlwb3RoZXNpcy4NCj4gPiA+DQo+ID4NCj4gPiBQb3NzaWJseS4gTm90
ZSB0aGF0IEkgZGlkIGNoZWNrIHRoZSBmbGFzaCBjaGlwIHNwZWNpZmljYXRpb24sIGJ1dCBJIA0K
PiA+IGRvbid0IHNlZSBhIG5vdGFibGUgZGlmZmVyZW5jZSB0byB0aGUgcWVtdSBpbXBsZW1lbnRh
dGlvbi4gQnV0IHRoZW4sIA0KPiA+IGFnYWluLCBJIG1heSBiZSBtaXNzaW5nIHNvbWV0aGluZy4N
Cj4gPg0KPg0KPiArWHV6aG91IENoZW5nIHdobyBvbmNlIHdvcmtlZCBvbiBpbXhfc3BpIGZvciBz
b21lIGNvbW1lbnRzDQoNCkFjdHVhbGx5IGFkZGluZyBoaW0gdGhpcyB0aW1lIDopDQo=

