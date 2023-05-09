Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 251FA6FCEFB
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 22:01:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwTUt-000103-E6; Tue, 09 May 2023 15:59:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>) id 1pwTUp-0000zt-3j
 for qemu-devel@nongnu.org; Tue, 09 May 2023 15:59:39 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>) id 1pwTUn-0005o8-7I
 for qemu-devel@nongnu.org; Tue, 09 May 2023 15:59:38 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 349JpxKS021375
 for <qemu-devel@nongnu.org>; Tue, 9 May 2023 19:59:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=KgJQ+qUsLbH26jQngK0H+QjraHP3AnriEhaUWvUWM9Q=;
 b=WpL4PGlLU2hgMYoU3UTyGuuUgwBqSVWxy0i+sTARy8IFytiqXnkdz0ld9tHooEfIF5N/
 sVvtBl/KeZVokTpovrkcNJ1u9EGsuu89SX1rkcMY8yv3UBbo1LYZxXalsisq+Kjrx0XA
 n5BtvgqMEsDCCpt3khgZhyz++y8zswaOdz0mlEUqLJycPpwii7fX5u1av+ls8CbsTqFF
 uT/3lGRSlu2DEfSApoek2+YLihF1sIbK/3001m87l2UH+RcyvTHjKKt53bzJR6o6IEMI
 GO5pdwf58ymje3dfT5Ir5Mq6dQR3WEyCkXiASA+frTyqqBfVESKsHzHa3cQqGIDIUnux dA== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qf78ptqs8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 19:59:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TSLr1WyjrqLyEwkgR/H/KbF4HOB/u9hmHOc7xPpxYaTgI7X2wubD87huRgwQwABALtRQuKE/0z6UsRI96w6nPDkmzKFPPE5IfHPgzJKXhBOActZHKmvT6eJFfUfqz8KKzVvMdoiFu9iCJjM6ncM656J5E5SDJYaA6YvsNWLQVMytDJJ8n9dpj7jWaoCO0tGNbmLpbs6U8x3s3+DdxjObiqVPgxiMhwSM/z+/FjBB6lQXKSALne0KVotOdqbgnjjKm5jHGvCTnzQQW0m3TJVleP0vu1yQZrMqQCYiscoP4zAcB73bDjJ77fGpIjO4Q0qikXwph8KxgsxiYGDzHnKppg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KgJQ+qUsLbH26jQngK0H+QjraHP3AnriEhaUWvUWM9Q=;
 b=aAu6yCP8kBeJ4L+sZkRr5xKMpZFV1S02jvooOJwW3gW6XvXj48GqvIUYtLp/ilTAKEnW6/pFbrz6UcErgaq668J7KJ4UON23T3hzTTtTRTTDKASQ0hCvr1ZJPkjZ1otDBJ8VllmShp1g4rwG+QvkIw1HlEt9Vrsxg4ONGrxFLZhscOnIOcjiv+QUPn8AkrI/+zFcq8CwUAuDcQ2JIbp4X0nW2jocLhL1z1LHYxW4Ymz41DPoTJQMZttaJZ6lLkAy1YyvXhigzxuT1dn609uNc0QTqR3rEZcIPcSTeGS+pagaR3mbmfEyfTd8cGX6Aem1aYCFa5eioAJ+1rqEOMm2mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN6PR02MB4205.namprd02.prod.outlook.com (2603:10b6:805:35::17)
 by DM6PR02MB6988.namprd02.prod.outlook.com (2603:10b6:5:22c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 19:59:29 +0000
Received: from SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::3474:4ff3:5083:443b]) by SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::3474:4ff3:5083:443b%6]) with mapi id 15.20.6363.032; Tue, 9 May 2023
 19:59:29 +0000
From: Brian Cain <bcain@quicinc.com>
To: "Marco Liebel (QUIC)" <quic_mliebel@quicinc.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: Taylor Simpson <tsimpson@quicinc.com>, "Matheus Bernardino (QUIC)"
 <quic_mathbern@quicinc.com>
Subject: RE: [PATCH] Remove test_vshuff from hvx_misc tests
Thread-Topic: [PATCH] Remove test_vshuff from hvx_misc tests
Thread-Index: AQHZgqYR2xS+QA7gakCohwckRFyhDa9SXBcQ
Date: Tue, 9 May 2023 19:59:28 +0000
Message-ID: <SN6PR02MB4205613DAEAC2C3922F4CBE9B8769@SN6PR02MB4205.namprd02.prod.outlook.com>
References: <20230509184231.2467626-1-quic_mliebel@quicinc.com>
In-Reply-To: <20230509184231.2467626-1-quic_mliebel@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4205:EE_|DM6PR02MB6988:EE_
x-ms-office365-filtering-correlation-id: bfb9fc91-7e89-470f-17de-08db50c7e5df
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T5hLXGmeHPjABGcKEbCxOGGPiOPEbWd6BIo88DKl/DN2VjiJatm4khbu3FWM4GuKKf9E6xY2bkLGL73W0cOiRk3Q5D6fZHvBLT2rJil4ODxgtbA1qNJUhJEVXJNq6eo9K4dCmw/TbMIU+IdY6zAglp1A4tQzKNZRyhWf4d1Vuo3/0WtGXvlgXarLXq4Umk6M+oGYIaJ1n3zE84o13/izjIOdfb5oLTVCZEgOuvhwiQO/3RLYBZuVllitxufEUSrJPNSsQwuGCn/1JHxWb/8rOP95tY1cxJETG3ddgVm91Xkchz0TOHSIDNDZl0pUYxOIZDPpjgUnFs6RFfDu8ecUq7ozvNM29PeBREzoqLLYlv5JPoa9IJMZ0YAoV534Y5P1hWjo5TBdoNtaXXWGfh0DBDpM7v0G3gKtzItbV8sBwWl75x0MPVxOsBQl9Z5OoUmBMuyccjKuHCFR8qNv71SerrIEe1TJzuiyBmktffCK8J1ppeg7hJNiLa0Al1mcoArInfQ0NyVWJQEJmF+/nUO8EnD87V68LkqTmWjW+A0yWClY6MDQSGxW/kuIdw/eM/1HpZDVuLADTh4DfmpdflYbbpQyd4UBQeT/e8g63dErFOvSnR6yKCNjxjqhBc2NDDP3
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4205.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(396003)(39860400002)(136003)(376002)(366004)(451199021)(83380400001)(41300700001)(7696005)(71200400001)(38070700005)(8676002)(86362001)(5660300002)(8936002)(2906002)(33656002)(186003)(26005)(107886003)(9686003)(6506007)(53546011)(52536014)(55016003)(122000001)(38100700002)(478600001)(66946007)(66556008)(66476007)(64756008)(66446008)(76116006)(110136005)(54906003)(316002)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wQHSthNCAKEkUTJPpHbkyBYrrHtC1ui5qjLGrkjmfkWFz6mJaiQ559QHxs/O?=
 =?us-ascii?Q?WxBw0n3rMDdx64xZLKGngCfv4YimlvvS/8pG8KFPhAAzlVOf8kHfr1TZ29s4?=
 =?us-ascii?Q?8nIp4RP5JxNLbmJPcql45mWy3tLS9UhLu4VvH4ihACCuXtgxjzT2y3KLxntP?=
 =?us-ascii?Q?ZxcDIfkEQniGNBTLKrzNg4Birpf2yXfENQqwgD8dJEyXKmGwGOyOlVyc+lTM?=
 =?us-ascii?Q?WXTBthNbHIuzJJlv4s+YfCLJI0+jwWRkDJVDv4YDJsF5/gfRZZV/VgScPeUz?=
 =?us-ascii?Q?PhrNwN2KEiE5C+X12Hh0WOtJYd3iJ0Dc+/CMhT8vqMaw1Q2FsH2Nwp3xV+9O?=
 =?us-ascii?Q?37AzcheJh/Ie7l63RaTfMEKpQuaGSuEZ10ybhbW7U1LZ8HYw39E257ulHXm+?=
 =?us-ascii?Q?5+2daSqh1JBJaqbl5KUrzuX7fv28LearHr3JUOkqGEY76/RRLlMDoYmf554W?=
 =?us-ascii?Q?5dJ8MGlWrtgR/SFaZc9Ktv62ckmEnR1T14z3TGbzStQVruE+f1KMMYVAvkzZ?=
 =?us-ascii?Q?yShfzQuxIdYN47iqmXA8pO6zvDamL+9Vv831o3MEFBPezg8xCTG6Qkao6V+s?=
 =?us-ascii?Q?clRpmSyXlmYirDrIKw6lf8pwghq2MR7caAfPa2WlLM4GQU0lwOsFF1qpg33+?=
 =?us-ascii?Q?XVYlwelSJ/B/+7x6sweLpchy3YoAGgJ7GriCzlfiNVv2pN0N4oJJM5/ho/eq?=
 =?us-ascii?Q?yCoSrnHQryUthPlLmNyINY5QAukfew+0X2XMiXpr77B6rHZdNeHlNs8X7575?=
 =?us-ascii?Q?IathXuds4RunIYYIQQaCOuPQzraoueqYl+xdvWHr+ufEu1ViYgScwZiHhHST?=
 =?us-ascii?Q?YdN44ZDfbdGkJV63LLiv8glj5qM4WhhzFIgOfsywjeJlAU1VJ8MU1+mtpINd?=
 =?us-ascii?Q?sv4wUBl2gefxdjqZBPCpbcLQeYFcU+8cykPj2xKY+NoR+4X+o9mlvbrR4uNW?=
 =?us-ascii?Q?5mQJ77fvEflcOAIdxy6KYd5WptceGKgN5sZZZw/JFdmuTSTYPys+ZBUzLwDK?=
 =?us-ascii?Q?Lgk/+jRMGT6AQ+ri5yf7Ken+s8qMJEqyELlfDbMAYL6JTJZgctiWRamF/BdL?=
 =?us-ascii?Q?DcoGuC65MtBa6Nu5dtPZ2xEXSJECYAxyvbXXfjPTsPuuhH3ncpv/mqYpVM6R?=
 =?us-ascii?Q?8I/YJA8bl8pA3sQqcvTybALufnwhZg5ooPtuHnYc61029F3pK5lxmgu5ryon?=
 =?us-ascii?Q?XfWiq7EMc7V0bIU/lMo7HVuv3WuMt1VeXghNOyCObFDaUGU5DHbLdQo1AIS2?=
 =?us-ascii?Q?fnynyYglH5rv+InCUiUgl3J+tyC9Sc1wTYf7MFfaxqwvU5A+vpsTxc6tNEyM?=
 =?us-ascii?Q?8SMrRwN/W5TiAMJl7kYCFPPQZKzj1W2kFxX7rtHOmWj4/aGuzsyUOHM1t6AP?=
 =?us-ascii?Q?H/aedD2XhfHUqwzA2GKy2U/WrTX+mMWPFBbxmCU5e1XlLfa4QmWeWr2/tx0r?=
 =?us-ascii?Q?Voc0qF+MhiuO9yHk6l4NXtCSWtk0HPrl2+fJWe2Cem3qZrcgtexhv8sB5gXW?=
 =?us-ascii?Q?8rXXEUVTh6qM38GLLalWzFMnCfZM1g2k81R+nr2/xsheuFO1PeEEQp2P6XSF?=
 =?us-ascii?Q?dBOAm6xqmYEfVNqJX6nbL3XQAf0W4MGKQgspIqBn?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: ELbU0an0mT5RJv5oMBdKRVg7mF7b6DCAz/e6bcD+Iha/Zic+iVsKQdAeBLIjSocPuhuv2mAo4yVPqTQdoTd3WoCCz+OoUJS7lIWYcOnAX6pPWLVPdikv/79oB1MGbnDkqYjO/VpPMxbGt1S/4h/iYMluAAGErMkTalxIr03mf+IfM5FAAFM2yzg1eHIl17GCkoyAXRZymV66OCWrOPHaodEdZLS/EQWBfXSnSmYdFgyaGYgarBLiRerMmBSGPtP40lXb1lKY/2zKBKV4l+5Z2akQKU6xfsX+O7Pc+Z/P+vUBLTd45i7Z2ct/YAtR1zhXi+PPjJ8nf5S8C61wm6SXtVGBv22xl3jAXi7agGSggFMZdVVLBusWw9vEdrRfS6sqvg6i6grDpqP/39GxW06AzEbmssyD/wV8orU/WdhgmKOng+U3lFUQ1DpTOHrtoICmL9aQ1uL5ular4LvreX0WYK/erDZ0magQNry9d5NaeKD6fxq5+hyilneEf7fd2G7YPXIF0h52mxQ+ADbInfkghZuF+42EAgUMvjOn6RVLp4MxnD4hNd9eRV2oxf5p45HRPkKhzStbZ6o4MONvYeKa2W+VbE3kbDd6zowGV8L2ZofgFciJs+8qkqotTcQL3SneoU2a9JXbFAm9rd2dbY385VUGCKFhYYCSEJRpVRREhUfBnBoMQEj9jhgQyKYUqaDq9cT9uEfKcYMC2rxb9wDbMKYmNOUgos7sxwWekDoeGPEAQl19ALpIqZWAgDzkszoA6QQ/n+EiVToVHAq5MtpQxg==
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4205.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfb9fc91-7e89-470f-17de-08db50c7e5df
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2023 19:59:28.8032 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vyBz4W1g2Gakf8DbzgcbRHONRmW/95/Adv8foA/I2ZEeK7wiFLVWowmBpDGgMnz5n7UzcpnjeMHHUZuUuNcEUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6988
X-Proofpoint-ORIG-GUID: lrgiG1YsfASlKXCVo9vgcXNABE-Xp8d6
X-Proofpoint-GUID: lrgiG1YsfASlKXCVo9vgcXNABE-Xp8d6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-09_12,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0
 bulkscore=0 mlxlogscore=869 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305090165
Received-SPF: pass client-ip=205.220.180.131; envelope-from=bcain@quicinc.com;
 helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



> -----Original Message-----
> From: Marco Liebel (QUIC) <quic_mliebel@quicinc.com>
> Sent: Tuesday, May 9, 2023 1:43 PM
> To: qemu-devel@nongnu.org
> Cc: Taylor Simpson <tsimpson@quicinc.com>; Brian Cain <bcain@quicinc.com>=
;
> Matheus Bernardino (QUIC) <quic_mathbern@quicinc.com>; Marco Liebel
> (QUIC) <quic_mliebel@quicinc.com>
> Subject: [PATCH] Remove test_vshuff from hvx_misc tests
>=20
> test_vshuff checks that the vshuff instruction works correctly when
> both vector registers are the same. Using vshuff in this way is
> undefined and will be rejected by the compiler in a future version of
> the toolchain.
>=20
> Signed-off-by: Marco Liebel <quic_mliebel@quicinc.com>
> ---
>  tests/tcg/hexagon/hvx_misc.c | 45 ------------------------------------
>  1 file changed, 45 deletions(-)
>=20
> diff --git a/tests/tcg/hexagon/hvx_misc.c b/tests/tcg/hexagon/hvx_misc.c
> index d0e64e035f..bc4e76d7f0 100644
> --- a/tests/tcg/hexagon/hvx_misc.c
> +++ b/tests/tcg/hexagon/hvx_misc.c
> @@ -342,49 +342,6 @@ static void test_vsubuwsat_dv(void)
>      check_output_w(__LINE__, 2);
>  }
>=20
> -static void test_vshuff(void)
> -{
> -    /* Test that vshuff works when the two operands are the same registe=
r */
> -    const uint32_t splat =3D 0x089be55c;
> -    const uint32_t shuff =3D 0x454fa926;
> -    MMVector v0, v1;
> -
> -    memset(expect, 0x12, sizeof(MMVector));
> -    memset(output, 0x34, sizeof(MMVector));
> -
> -    asm volatile("v25 =3D vsplat(%0)\n\t"
> -                 "vshuff(v25, v25, %1)\n\t"
> -                 "vmem(%2 + #0) =3D v25\n\t"
> -                 : /* no outputs */
> -                 : "r"(splat), "r"(shuff), "r"(output)
> -                 : "v25", "memory");
> -
> -    /*
> -     * The semantics of Hexagon are the operands are pass-by-value, so c=
reate
> -     * two copies of the vsplat result.
> -     */
> -    for (int i =3D 0; i < MAX_VEC_SIZE_BYTES / 4; i++) {
> -        v0.uw[i] =3D splat;
> -        v1.uw[i] =3D splat;
> -    }
> -    /* Do the vshuff operation */
> -    for (int offset =3D 1; offset < MAX_VEC_SIZE_BYTES; offset <<=3D 1) =
{
> -        if (shuff & offset) {
> -            for (int k =3D 0; k < MAX_VEC_SIZE_BYTES; k++) {
> -                if (!(k & offset)) {
> -                    uint8_t tmp =3D v0.ub[k];
> -                    v0.ub[k] =3D v1.ub[k + offset];
> -                    v1.ub[k + offset] =3D tmp;
> -                }
> -            }
> -        }
> -    }
> -    /* Put the result in the expect buffer for verification */
> -    expect[0] =3D v1;
> -
> -    check_output_b(__LINE__, 1);
> -}
> -
>  static void test_load_tmp_predicated(void)
>  {
>      void *p0 =3D buffer0;
> @@ -489,8 +446,6 @@ int main()
>      test_vadduwsat();
>      test_vsubuwsat_dv();
>=20
> -    test_vshuff();
> -
>      test_load_tmp_predicated();
>      test_load_cur_predicated();
>=20
> --
> 2.25.1

Reviewed-by: Brian Cain <bcain@quicinc.com>

