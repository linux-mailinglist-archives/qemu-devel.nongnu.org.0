Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E523658574
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 19:07:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAao1-0005Wh-5V; Wed, 28 Dec 2022 13:05:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pAanw-0005UO-LE
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 13:05:28 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pAanu-0005SX-VA
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 13:05:28 -0500
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BSHjAXJ027217; Wed, 28 Dec 2022 18:05:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=yS3XelKlL6yI7o/YSdgXGH/KORKWiODu+faAz9by4fk=;
 b=mHRP2gxDyyxzKPavkw1U5vUtLJbDgVLx1iu8MfhLkJvv8B91RTyXCh8nyzbaj7XLIKhN
 Nl09RpEcT+JgrPmGFlwthHvmHGzJ3Tt3zpYwZ3C7mA8rQGPYgFlmWLLk4BBgAfrO1BZx
 XY8TdCwnxUFpQ9FjCtkOp/FNJHNrv6uqEC70OyoSd0fq53m46QzATaX5lqVYiuE24i3z
 cWtCY/SAOZiDGVamz+Ap8bC4tJcvDxF8XZ+pmKF5L8n/CqGqyAkWivRDKDM1lO/1gc3W
 ZrDlxgmdoxvROACI/+wpooG00RNdWBIEcB4EgSGE/NpX1CQRMog2e3/GX9IGbkKTRWXC bg== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mrctr9dq4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Dec 2022 18:05:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mvb3TcPG4mmr9s/v0jptqldyucZlKt0XV2j1slR9dAtEDFFqGS5Zc462c0+jeztNJNiuCxFL1QLCsygvUPpx70NFAigxim7bWI67MIlR/2Vp5HEa/nRQDFACvGh4maYHR5GVT3E4HsGutMl1keTaoiaiZOIFshZK7Ed3V2VBXsJRY6e5gxekcfU9s1cKRql3GhgUq9B2iyevVTbncD2IVzlzXeHxG+tZs4MUZEERgRT5Pnl9zAZJLUhNdx0l5UUEbZxW4IYNJSw6snbDFuManfycHFPWR/q3qFjxUmr/B39fbTarrHkOBgTuvGok9eMw6FcKFKGySM0stwfHSktO+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yS3XelKlL6yI7o/YSdgXGH/KORKWiODu+faAz9by4fk=;
 b=hItGJxtqP62BquH2XSPmd8eKDdJ8GHl3OOltFt0gRAjIIDKZQ8RQyioyMJRofkVqPlg6HbOKlDyt26YcgzA+NNLFJKzvHb7pzJ1uG0JK785Z2urN7tbdZhF/BKim7Joun67xtfDVdOpcz4DXnvJpcTjZdbR9cCVBUknW/hJUBtWeBkxJXis4yPom/PflKUka9XM7GaWmRAPufrZftElHPYjuJWQU3/v7Yg3sre0Jv9aB+OZPBU144888F5PUx4g90g4Pr4QJYopkh4BFBWF9deim80yNJmPA3cwm54BuBVG3Giavlq9W3DRO0rSf52P/OgOpuQBG8AzJFX6Ii8SmYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by MN2PR02MB6640.namprd02.prod.outlook.com
 (2603:10b6:208:1d0::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Wed, 28 Dec
 2022 18:05:21 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::8ba2:2429:9eea:75fc]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::8ba2:2429:9eea:75fc%6]) with mapi id 15.20.5944.016; Wed, 28 Dec 2022
 18:05:21 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: "Mukilan Thiyagarajan (QUIC)" <quic_mthiyaga@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "laurent@vivier.eu"
 <laurent@vivier.eu>
CC: Brian Cain <bcain@quicinc.com>, "richard.henderson@linaro.org"
 <richard.henderson@linaro.org>, "alex.bennee@linaro.org"
 <alex.bennee@linaro.org>
Subject: RE: [PATCH 2/2] target/hexagon: rename aliased register HEX_REG_P3_0
Thread-Topic: [PATCH 2/2] target/hexagon: rename aliased register HEX_REG_P3_0
Thread-Index: AQHZGgjWycmJfMGyh0CH29VMUHEMY66Dl7mA
Date: Wed, 28 Dec 2022 18:05:21 +0000
Message-ID: <SN4PR0201MB88086AC78421AA6DE6C9D034DEF29@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20221227153447.2729-1-quic_mthiyaga@quicinc.com>
 <20221227153447.2729-3-quic_mthiyaga@quicinc.com>
In-Reply-To: <20221227153447.2729-3-quic_mthiyaga@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|MN2PR02MB6640:EE_
x-ms-office365-filtering-correlation-id: 179a5581-d54d-4bbd-a63e-08dae8fe1615
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3PxySIeDtp56WUarrO1QXpyfZzUoOOagXxkAFC0JOKm87TLpZiReldMcWHVIwaE2qhGvW3y+QovahkqJiQ6EuWShpS8GsiAhppGuq3j/Hugor921xaNSrWjSVbaJ2cXt0KFIXq/yqnTHVgmxJGYHWnNBdyDNmRhpXCx1/nje07suEvnbvA1HP7TMsQsZn4Zfl3JW+zZ1pwq31+eICuA42s7ztG4aC9hHKx+Tws3ZfryCbyGpniHP/4bgcpetcxpgwmzFIGuciRo1b2Bhxt3Mhvb1ELibdjkDC8m/qc/NA7hWEPOoFu8M+qk7t6so0qIULPks80SH7FvAttVyZbXdyrURqekdIGhiHxYHbeuS+wPuKlfIKHKZ0GQ5ucpgP7Uy18oHUcsnGqxoRQuzTNb/24KNwTjQQenUC3OEbZjeHGS2dkmwbS/O/tYSYFSogIDfQ6vUrxZBnGfUkt/TYNSM/I9IhMvt1dRou+Z+Gi0UxbVzNPjBsh5v197tg1sDnVu+Wb6pmFBR/vc6mzbvCZg264HO/faW8IRt8n14FCXQPaHpawS1lHGNx1gWyPS8clM1PqOyPae8WUfBOe2lE0s9enG2U/wHKUe9TIB7qF3B/h6vHD8mfuIPm2IjeyK21+6vGSTg2hO80xd7LMQHL41rMnNh8Ida2phAhGANaP0QTfVKt1KN5E+4QnIkqMYDSJYNxd85uCS2/o6+sCeC1DdLDw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(136003)(366004)(396003)(376002)(451199015)(33656002)(71200400001)(478600001)(316002)(186003)(110136005)(54906003)(2906002)(6506007)(38070700005)(122000001)(38100700002)(83380400001)(55016003)(53546011)(86362001)(7696005)(26005)(4744005)(5660300002)(52536014)(8676002)(76116006)(66946007)(8936002)(66446008)(4326008)(66556008)(9686003)(64756008)(66476007)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nTgFVg/5zufUSaHzGfiVhoQqGbeFL1Xu46spCMlqO7dkbliTHpvaKmVdAEmj?=
 =?us-ascii?Q?vNcpZSMSdrd366hgj8NDCJhrxFiJtmwRzlmygo37oLAOWmX+YyIHMiAQbFoS?=
 =?us-ascii?Q?5pcvQ5imoCnJ6WU61PGs4BnEu3+gntfcOI1A/5fjtekvl2stCy2pJLEp+ZJq?=
 =?us-ascii?Q?+oONXt1NhahOd88u8AUc4O8+puVekRwYGwKwTyH8io/I/bQiqo1s6S98xE7x?=
 =?us-ascii?Q?GHZvhpBXtWHHygs4mFvLepckzeDHoqT2G5lP5vMMgpBkKB7dOw8GbBxo9Rcz?=
 =?us-ascii?Q?zeuO1ALeIYVao2CD8szG/qXdsT2U+SGF1dbKcIl5EvXI3ypigqGKWeFAUra3?=
 =?us-ascii?Q?BxLxWsQjUJBST98IaeuQamGiHIIqvQ+bhSWbbqr+G4PjkhK0U8udkEhS/K+A?=
 =?us-ascii?Q?EsuJDfz7WNtdDcuX9oNIUC+eBohmBSF2/Ijid0ICiGNMvfKCz7m8VhlTGinJ?=
 =?us-ascii?Q?RY9His4ocp7LvLiwwtYMlKgtaw1J+iSYQ+7qARG+U0XI//HluZfML5hr0aox?=
 =?us-ascii?Q?1caSGFBuGJoKcB0S+LqCWSum7vtc1pKqxEfu//GG7UjCY+rdxj3/VD2jjs19?=
 =?us-ascii?Q?5r+m/fAgfw3TTFLTNfS8kKptt+Bqfw0em9JVsBLmvQ0xqcqzEnq6n+r2Uem2?=
 =?us-ascii?Q?hGFCYOvZd5oBHLW6BDYqsAjpel1sxceirJZ9cFAmZN6llivFYCBeeYPe/P5b?=
 =?us-ascii?Q?EKASzFkw6780EiiZt/FoTyySGigAij+rGfejrxQ+zjf+NGrcsvt4BSxiEv2K?=
 =?us-ascii?Q?Ag6ofkeN6ieApEIn++KlUrvPDn/lPjKDlBf4zIbatKSC5liqyRS3LWPzxz49?=
 =?us-ascii?Q?KOMhDE9zlhEYo2ZZRQvtmNJj6B3AJZu+tWuB5BqweAgMTaD85geMnb+zuFS6?=
 =?us-ascii?Q?BDRTAXHtWwKTro9EKQVw43tFGCDARc8IHehyqYGTTTAwSoPWxNckc9xJ7Wnn?=
 =?us-ascii?Q?PTUSw0llFHQRXn0OmZr9+hhNnSCUVG7aTdCQ5el73aX1P24eIeOUeKSENM2v?=
 =?us-ascii?Q?x0niV/zyOm9U6cRkc18XHws2rySJ9FtBs8aq2fyYXC42C62+O4mlZaGXDo0F?=
 =?us-ascii?Q?UuEQTHAa3oLYbeTbYpGb5MZpTe1WkePQXTytIuiR6UJhPUIwWQFoS/eWZ8Jg?=
 =?us-ascii?Q?mAc1Fm5Q+IXifd43Q0v6h/yWwRbrFqbL56HTWYiduYgDIoTXQy0+CYwLe/Oa?=
 =?us-ascii?Q?1uJ1UXogfAV1BgREcSyt4LPB6QMGiMtB5KgWENpO5JA2dCTOf5kESDf/J8c+?=
 =?us-ascii?Q?suXjFq6cbBbVPc2S83lSBQsuoax5hBwauFzeWwSowTuVynCwcgFHSSneAjDG?=
 =?us-ascii?Q?Pi6/xea+HgUTGqHYkrGAwLk5ymj5DSg27sWmdyFb1kKUXgvitW1xeuyeaUoc?=
 =?us-ascii?Q?vBvzXLlYLE/MdRzdnN4CUDqCggd1EUoiSuCw5OUhA8K/iD+pWERc7B+ZHtxE?=
 =?us-ascii?Q?jLGLzQ6ZjvubDwRYkGv0vBTGXAxSCV16g3ACx7Ya/RyW0wkui9JtcZDtN+Df?=
 =?us-ascii?Q?u86RFDs4ME6vrdsm2WfdToOIEfjOZDdtpjww/5ljuIDc2Jxdv24z0B0O5TCE?=
 =?us-ascii?Q?f4tNct/4vU4bpcIUY0Le4KXA1RmduAVkHXeO9z/Q?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 179a5581-d54d-4bbd-a63e-08dae8fe1615
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Dec 2022 18:05:21.5888 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kAWXNyPWEfwdD5pOFhR07DnaMCs3FTXq6rH4H+lWd/hpDoutdDOmLG+rU9iL7F4of8c1ad6npY6u8xk5hhyIDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6640
X-Proofpoint-GUID: -IGAOrwLkmO2c3qHQqXVhyy6lwNAyZTd
X-Proofpoint-ORIG-GUID: -IGAOrwLkmO2c3qHQqXVhyy6lwNAyZTd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-28_13,2022-12-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0
 adultscore=0 bulkscore=0 mlxlogscore=801 spamscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212280155
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=tsimpson@quicinc.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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



> -----Original Message-----
> From: Mukilan Thiyagarajan (QUIC) <quic_mthiyaga@quicinc.com>
> Sent: Tuesday, December 27, 2022 9:35 AM
> To: qemu-devel@nongnu.org; Taylor Simpson <tsimpson@quicinc.com>;
> laurent@vivier.eu
> Cc: Brian Cain <bcain@quicinc.com>; richard.henderson@linaro.org;
> alex.bennee@linaro.org; Mukilan Thiyagarajan (QUIC)
> <quic_mthiyaga@quicinc.com>
> Subject: [PATCH 2/2] target/hexagon: rename aliased register
> HEX_REG_P3_0
>=20
> diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c index
> 658ca4ff78..807037c586 100644
> --- a/target/hexagon/cpu.c
> +++ b/target/hexagon/cpu.c
> @@ -86,7 +86,7 @@ static target_ulong adjust_stack_ptrs(CPUHexagonState
> *env, target_ulong addr)
>      return addr;
>  }
>=20
> -/* HEX_REG_P3_0 (aka C4) is an alias for the predicate registers */
> +/* HEX_REG_P3_0_ALIASED (aka C4) is an alias for the predicate
> +registers */

Not sure why you broke this comment into two lines, but ...
/*
 * Multiline comments should be
 * formatted like this
 */

Otherwise
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>

