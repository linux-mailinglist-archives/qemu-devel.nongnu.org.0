Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A3D658B07
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 10:31:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pApFi-0002ku-Si; Thu, 29 Dec 2022 04:31:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mthiyaga@quicinc.com>)
 id 1pApFc-0002kB-J7
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 04:31:01 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mthiyaga@quicinc.com>)
 id 1pApFa-0006ps-OX
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 04:31:00 -0500
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BT7TJIT012445; Thu, 29 Dec 2022 09:30:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=mAS8docM8fWAm4EdFhhXKqetVGwM+l/Yuv/akXGR0+s=;
 b=CtbgtsfrYOTVcOGh2TTtm5SQVzssqHsEPFmuF3Vs4iozVpKfJiFrMhbD0R5ZB7B/5Z1E
 brcWJgk78obUFkUxJynn3cXZMtNbNwsgv+cFQPA9kqxntxaRAO6FIsFm5eo+aQAeaRUD
 HMeGY+bTI1Uy3r4/pHphW+JK2VaBuUZ7qwSwgtBXoxqIOBgTz1JcY9+lKCtHiG63ytC9
 SOgv7BZMM7vxcs2PrNlc88UNfHacBvTDU+Up2vKRyOrV8XaJXTHsh/ix0zI27Yz9ESKp
 a4rTsMqDB4kcQZLYQB7ldbXWEWLKUl4QQpsiXkT8t/2vRTOsw+rP/PJyWJaXy1+yW0o5 Nw== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mratp2xmd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Dec 2022 09:30:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jfS7xxuJGOuA4Etl1J2zjVltyRagjb4guOQOE2deBx3w99e6V1McPFlZNPOiY/nyZzLL6BNtGj0pVlsfEMIPbopvmbUpmVHQd4sF9MYrNmoKWNZG9VqXqJ+NPVR+u47RhDyvsgjHmHjwis+5KngHcWvk83n9A5RjJ67TZnzrwF3hcPD+G6lQRWr+xZwwZZOi37CMjH9+1nn2urt5TPD/1BGoesaLIUbQRHCJ/qdd/IJ5hvTC5ezcl3w+lnLedE+kFa8S7IU+AUfo0Nv77Omp1x3WYAhW4zcbjExzJqxDeBCHzpggaeexxmVOiuOv67WVWT+kSASTqT/Scq+hyUWf4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mAS8docM8fWAm4EdFhhXKqetVGwM+l/Yuv/akXGR0+s=;
 b=HnAJGUjPahw9WD0/Srmy9d9teX5gd2fWgT2cJLqHMDTXU2H0Ixp56eHHHxLkQ9NgM/ZuDfr3P15CJgnGudOaMEz8jO9yWcR5c3x7gRzO+r+HNgShWmaQMSWH9fbn9Kiy4/Qp6320/QO6/dSPm8bYq1bx0d23H4M8m3gOHFbFTQu3VZz5mBWZ3ZIE2WIGM7iAaDApHKuy6QYmEHikocjZNdzyFZN0QTkopXCRI2Gplc04HzPLqrZD8mQiYwB3bZKo2CTY3t0qR8PiHgkKblzUAzNEwZ9wo+A/MAz8IhfB7+VKsK3CtDsuPzS9qbh4zE05O2rp0NlDBtHWl81RC9P5Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from MWHPR0201MB3497.namprd02.prod.outlook.com
 (2603:10b6:301:7e::24) by PH0PR02MB7287.namprd02.prod.outlook.com
 (2603:10b6:510:14::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.17; Thu, 29 Dec
 2022 09:30:53 +0000
Received: from MWHPR0201MB3497.namprd02.prod.outlook.com
 ([fe80::49c9:9516:f90c:a65e]) by MWHPR0201MB3497.namprd02.prod.outlook.com
 ([fe80::49c9:9516:f90c:a65e%7]) with mapi id 15.20.5944.016; Thu, 29 Dec 2022
 09:30:53 +0000
From: "Mukilan Thiyagarajan (QUIC)" <quic_mthiyaga@quicinc.com>
To: Taylor Simpson <tsimpson@quicinc.com>, "Mukilan Thiyagarajan (QUIC)"
 <quic_mthiyaga@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "laurent@vivier.eu" <laurent@vivier.eu>
CC: Brian Cain <bcain@quicinc.com>, "richard.henderson@linaro.org"
 <richard.henderson@linaro.org>, "alex.bennee@linaro.org"
 <alex.bennee@linaro.org>
Subject: RE: [PATCH 2/2] target/hexagon: rename aliased register HEX_REG_P3_0
Thread-Topic: [PATCH 2/2] target/hexagon: rename aliased register HEX_REG_P3_0
Thread-Index: AQHZGgjXRWDZtTarkEuVt94cF7otVa6DmdSAgAEClVA=
Date: Thu, 29 Dec 2022 09:30:53 +0000
Message-ID: <MWHPR0201MB3497798498CC908FD491CD1CF4F39@MWHPR0201MB3497.namprd02.prod.outlook.com>
References: <20221227153447.2729-1-quic_mthiyaga@quicinc.com>
 <20221227153447.2729-3-quic_mthiyaga@quicinc.com>
 <SN4PR0201MB88086AC78421AA6DE6C9D034DEF29@SN4PR0201MB8808.namprd02.prod.outlook.com>
In-Reply-To: <SN4PR0201MB88086AC78421AA6DE6C9D034DEF29@SN4PR0201MB8808.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MWHPR0201MB3497:EE_|PH0PR02MB7287:EE_
x-ms-office365-filtering-correlation-id: 0d2016f1-173e-498d-a2f8-08dae97f61ce
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0nUGUlJHm1nXKh34z9StAQZZqnFsCdKs8YiTRNRWC7orR6XWi2VuRvxtceZIDclPYyTa5tv0u+Jg4rrbLc8RXTLExfiXe9Vj07KYe6xJivKXX9gbzv8McAr3iG21FlS3h52qiQWjLQhJPQsYLWHDqCP0mi4KgYfVH3Bzl8fCGBBsUX4POjb3CI6lFNwh7ZfIDlUb29QAmIRsOjMypituj4pbyJpy3MV7+x6dMGA4xju7nQaAlrd8hUXY5OHONPDdfi2dP0r7YebYhWpNT9nbmclVQZCrNoBxkORnj9/gP836H4sSAfwVlaQjSnbXGdoXSlCY2YM3YHx3SfeOt2L6VZYt9LvnJK8gTRUslcdJU4I/lCNwL+YMUMAv8+TQWKoF+mMaAN1S9VFhTRu+Q62aqcRY4v1uLDtkPmEAtoWaYN6A/Onv87IPNQu2xyYmUsPYSQx3Az+/3a72gPT34sxQW6SWfAbRTSlrt+szKT/fmYqrgJ5zw20phROMU2BrcgD1sVrI+Jil7T7A5nYBMXycHE2p3n3/4q7cyKlHV4d6JH1lSyPNab5fOBMocnVfRcWHsIgwgJ4Wxx7gxCBqXJ3duasGbmdwxvJi54dhLnvBa+rH/E/ff/I+vz1TR6ItmkuY8SZKxJsAB0ic23+XTnKXlfzFUiKaCWHxe+6RqqP+EvNKoQTPnT8TwtiVNjvmmAioV6l1Z8yXQ9ZMd3qIDd3MsVz+rRFSsufyMFLJwyP0tQI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR0201MB3497.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(39860400002)(346002)(366004)(376002)(451199015)(478600001)(122000001)(6506007)(53546011)(966005)(7696005)(38100700002)(71200400001)(52536014)(186003)(26005)(41300700001)(9686003)(86362001)(8936002)(54906003)(110136005)(38070700005)(66476007)(66946007)(33656002)(64756008)(55016003)(2906002)(66556008)(316002)(66446008)(5660300002)(83380400001)(76116006)(4326008)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lW077n9k3jxPCGfRTHXOdcZTwtoVGog+nAEYLEdQriNzd1/JhU26ZQzpH+dv?=
 =?us-ascii?Q?lIY6ZGpx0ZfiP7iLPsXA+KNjnYxDx97odKANd3nxt/xY0cwss+WY5p3Iushi?=
 =?us-ascii?Q?efd/YIaZjMKLnsSpO41OMw83xjJCNW+eNhm4DIFPnCM+FaJVhwopaEdp8rV3?=
 =?us-ascii?Q?IRmo5Bhh820gDIlVLF+EEJny5Ed0OjOmNK90JuSloBmZjqNid/SsB5aTyoc1?=
 =?us-ascii?Q?/YCUgWtnpqCHYpYacrlGiNrjKfxNYsgQb6nb19uaKWi9WNkAw3OUMHMRmoZH?=
 =?us-ascii?Q?faPYKYuE2jnRweIc0L5osxZ9s4f6/WhzUovgr1pMYJQH4Djbavd0hdnI5HR5?=
 =?us-ascii?Q?Z4HuR6HH4A66sZXafz7U3C8O5ssBXE/G+vilxw1YQ5A2meChyGxqT6o1ePQr?=
 =?us-ascii?Q?Y30VLbzHqsb9ogz7breFPVe14s1Lol+DFRoR1RE1UYqU1P/by423FxCbNQNQ?=
 =?us-ascii?Q?d/XaHo7L8P2ExHUsh+5tkc7/EAOf7SvuegbtolhLs13pbJxQ7KRIhSkG5m3D?=
 =?us-ascii?Q?Q2U6MZ7oOshwyjhOodFQLOVgOr4DTA29bwNRx92C2+Kn7ZA5lWPj68pr36RE?=
 =?us-ascii?Q?8vc86G1iHkC6abbEDiaDhE80RZnN1Fvunt6wO2Zm7liNOPgKn/nwE7BayMXN?=
 =?us-ascii?Q?BkRXHAuJYuT9PpinpLa/O1eRNanWTIP6GY0851Rc0iZ3lIJwHXpFNwyK805K?=
 =?us-ascii?Q?M833S03u0o/Fol6xpeY+WmxsEi6ghkB+uygWhi8TkxNNQ0kw2avbMOCyWf1Q?=
 =?us-ascii?Q?hqJZjvFXdhiux4fARGsVYdiaVD7czn41ZGaycLhcNkroSD00MOsrz9hvKBYN?=
 =?us-ascii?Q?4tPDd1OxLtbWBlqaTKAKptpOSYpbQTin+vi2oGEc6BrIZsEX7zik04NgHoHz?=
 =?us-ascii?Q?4kiEqwix9CdlhflacB1wasTNdLwspNZp352sngYHGYopfiuspIeRg4DzkL7Y?=
 =?us-ascii?Q?aa9SrTj9wcrXNdOA1iuo+Xfor8pVY8D5A6wJQwAFUOXYbkPEdUvdYqRIPw5m?=
 =?us-ascii?Q?deSiz0mEt9/2TH70cFH8t2O4Pgfqrt2baPQozU4C+eJBGGZKQ2mHyouy6Smq?=
 =?us-ascii?Q?O6oPpDOvUCk1QS7mSZEyPVshNaFsF4TzKRzaCSJEse8VbjYFdVhOAiAIAR0y?=
 =?us-ascii?Q?Cuzcuw59Ny+BcN1n6diVJbR2vZm7IMzZYsc8YrXRnc20IOG1jJPtgOPjmDXO?=
 =?us-ascii?Q?JrK57lI+rEt2ucHiwsRYU3ZI4F34kav+JuLPjLTBlzRpD7Yrf5DoHyYXurd2?=
 =?us-ascii?Q?zl0hiN8ZpW5OjwtxSLbc75lNxRxe2h09x+jJpyU5w4qxvCAGbGdMoFoebxXJ?=
 =?us-ascii?Q?atA8+UjxxnGQSPbe0JDA4mVCUmHTZ4LcGNAu8i/6xSdESUR6in5Mlx4T4MXU?=
 =?us-ascii?Q?K6jErsn0tdG1tNPWVR6ePkigaZ8Mn2voNlgpd12p06q+NbdFJEEsNn7suBX7?=
 =?us-ascii?Q?dYBbMO7O3BW8LQhz/n2t2398zQRxh+r1ZR3RUYDnzNYl/jtZotLDQpFkGca2?=
 =?us-ascii?Q?u+EwNsfetCBJSe+ePviJfUeLDk37Y1fk1qNO0SPI0lTWeJA1vul05dS0Gvtf?=
 =?us-ascii?Q?s+sdC4KSIfx+rxrkHXfY8xn5SGNm5k9PJ6B564DY?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR0201MB3497.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d2016f1-173e-498d-a2f8-08dae97f61ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Dec 2022 09:30:53.6772 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xyf1YFe2PVaovf96cMUEdCP3D/JAAAxYR8BahEPMeYYyLAjhDJcazPD/ZW9dPjVb0xSVuizygsbHnwDw+Upsc6AEjqT+NtzWDh+bGVneVfU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7287
X-Proofpoint-ORIG-GUID: VbTTYEyD5k40Ii1EKFvFFxBqHjutVxV6
X-Proofpoint-GUID: VbTTYEyD5k40Ii1EKFvFFxBqHjutVxV6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-29_04,2022-12-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 mlxscore=0 suspectscore=0 malwarescore=0 mlxlogscore=921
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212290078
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=quic_mthiyaga@quicinc.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

> Not sure why you broke this comment into two lines, but ...

I'm not sure if this issue is on my end or your mail client, but the=20
formatting appears to be correct in the patchew:
https://patchew.org/QEMU/20221227153447.2729-1-quic._5Fmthiyaga@quicinc.com=
/20221227153447.2729-3-quic._5Fmthiyaga@quicinc.com/

Please let me know if the formatting is still off in v2 of the patch for yo=
u.

Thanks,
Mukilan

-----Original Message-----
From: Taylor Simpson <tsimpson@quicinc.com>=20
Sent: Wednesday, December 28, 2022 11:35 PM
To: Mukilan Thiyagarajan (QUIC) <quic_mthiyaga@quicinc.com>; qemu-devel@non=
gnu.org; laurent@vivier.eu
Cc: Brian Cain <bcain@quicinc.com>; richard.henderson@linaro.org; alex.benn=
ee@linaro.org
Subject: RE: [PATCH 2/2] target/hexagon: rename aliased register HEX_REG_P3=
_0



> -----Original Message-----
> From: Mukilan Thiyagarajan (QUIC) <quic_mthiyaga@quicinc.com>
> Sent: Tuesday, December 27, 2022 9:35 AM
> To: qemu-devel@nongnu.org; Taylor Simpson <tsimpson@quicinc.com>;=20
> laurent@vivier.eu
> Cc: Brian Cain <bcain@quicinc.com>; richard.henderson@linaro.org;=20
> alex.bennee@linaro.org; Mukilan Thiyagarajan (QUIC)=20
> <quic_mthiyaga@quicinc.com>
> Subject: [PATCH 2/2] target/hexagon: rename aliased register
> HEX_REG_P3_0
>=20
> diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c index
> 658ca4ff78..807037c586 100644
> --- a/target/hexagon/cpu.c
> +++ b/target/hexagon/cpu.c
> @@ -86,7 +86,7 @@ static target_ulong=20
> adjust_stack_ptrs(CPUHexagonState *env, target_ulong addr)
>      return addr;
>  }
>=20
> -/* HEX_REG_P3_0 (aka C4) is an alias for the predicate registers */
> +/* HEX_REG_P3_0_ALIASED (aka C4) is an alias for the predicate=20
> +registers */

Not sure why you broke this comment into two lines, but ...
/*
 * Multiline comments should be
 * formatted like this
 */

Otherwise
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>


