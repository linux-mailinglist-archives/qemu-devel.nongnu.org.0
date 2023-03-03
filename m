Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3976AA599
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 00:28:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYEnn-0005VQ-T0; Fri, 03 Mar 2023 18:27:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pYEnm-0005V4-AC
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 18:27:02 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pYEni-0006sS-V3
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 18:27:02 -0500
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 323MHJkt022709; Fri, 3 Mar 2023 23:26:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=fULyyKTB3jLu+DxvdeczD3UqXXHMEhJrj4NPf6/+AAc=;
 b=IGyI2zkq1GcrJjQeErC7MSmKCMal2SKvUtvvNfSBZoYL16DUmWX147vcTQH645kcnXMP
 StsohIiLTAb1VnwxW9wk+i+4IjPwR1zUnCuUj410yjRO6REjWXWzoKVY/LVVfhzuGBnF
 xIm6FAVriAOUGUD9XPVukRDFasDXJzUl7/zMPHhw7htkemTdQxUq72lKEfDGtJESTU5t
 TQEdLGslGiTPJp2o27iGmgDZybIbCi7bHquN99E9QGSYQFAKrozVdQ9gttsIJItvLyfb
 VEyXP12VFxSpdkDecv4PdiJqa/IP2wLLc/Mi+hMPvD+2T+rzpjKB4usv7gDX6bzRukE/ wg== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p3dpxjd9f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Mar 2023 23:26:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WMwrWb+u1mrSU+KX486nGGTiQztMmyFH4bHrwFiJyhk8dhQzxS7Jy7cTt6qzcj07zyf4W1qM4KO7gU3YWKN9B/8/K9cOi6CC6VAIepgfhWPyWe/tCHxN3ixCKJQK9T2dQHfGJLh1qfg2j+L6qglR/Eo02u+P4iFSsN+5Go4rGmF/dxQ/PgZKEcLZtXxKw8wracWgKDtSixoTI4SxBGNzdKuUNuuJqlynytta3bv3e5aRq60qnh26sEKNIFI8Ognv5Z/a9WjWQ4a5fG0otTYZWHa8YPlIR0tp828Z5FhyTslARrgltbG4inkEu+QOwFckgASI5MWMlBeMueEJha22RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fULyyKTB3jLu+DxvdeczD3UqXXHMEhJrj4NPf6/+AAc=;
 b=SmfE2joNKt5s/t/PN7xpnNOxEF10XhHi7kBOd+qfEhj0bjhqPAMvhad2OnkbxtAr5lUN3hH618eXJv5dioEHcFxczjJ3W8O3vyG+iP5cMe6OronSzONeRuvtoqulQOq63fHdT8goMIz7nHeSeBEWqxLUtxHrkJxYyhN9kOSHCdDEHln37b7zMWOPyaApgvcSkL1hcLO33qeTXwbYMxlVbz+cSjg9GbAUA1qCtMlRu6wp8WEvxPtm1R931W5l4huroWLvKW76mQFA21MAycTx05R0J7LsiDYqy9usR9/1LJfmjNU6WMBscAN/4nuTKjSE4dxLO6IqkM5PMPC77naTGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by PH0PR02MB7525.namprd02.prod.outlook.com
 (2603:10b6:510:5c::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.19; Fri, 3 Mar
 2023 23:26:54 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::3e12:c026:afdc:beda]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::3e12:c026:afdc:beda%5]) with mapi id 15.20.6156.019; Fri, 3 Mar 2023
 23:26:53 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "anjo@rev.ng" <anjo@rev.ng>
Subject: RE: [PATCH 1/2] tcg: Link branches to the labels
Thread-Topic: [PATCH 1/2] tcg: Link branches to the labels
Thread-Index: AQHZTh/XKiKWIFTSEkiK+Qi3EwSD8K7psfcA
Date: Fri, 3 Mar 2023 23:26:53 +0000
Message-ID: <SN4PR0201MB880817781D443D160C6EF817DEB39@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20230303223056.966286-1-richard.henderson@linaro.org>
 <20230303223056.966286-2-richard.henderson@linaro.org>
In-Reply-To: <20230303223056.966286-2-richard.henderson@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|PH0PR02MB7525:EE_
x-ms-office365-filtering-correlation-id: 35e10f81-80b2-4d39-e0ca-08db1c3ec5f6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RLnf532PQC8kiJvwcCO+YsabGLyWz5HDWYBntnEtOFuWqbnANIDaL+gsuOZkLItp3D3lLvAnItjh0hL1ATYzVqfPzAWOdlTe1tQ0I1Xqv1u0SZmYTT16fqPQFsW2VH7jG9RtflGbo8jU5ebpyC8I8Xqq4v3tGZXQbg9AaQIPeeaZ3+MJPwrYw21U4tebS02MAvrpoUsXKJb/zcfM6K+GfJzmGNNYuXVgnCltO0y2cr5zqRVLqCq4CGbU1n6no9Vda3JeySWSbYn0Q/DhPwyojGGgumcev7qXQj+E6nm6ijVDBDwnrxSAABg7cQpS2Y7ftAbxT/PNr3HbJhsg8FvaTDh6FWEWM9yq7LvVXP7AfcWQdlcGEMMIH4e6mBxigxDtdEhCmi2fBvhbd4ev9IB+mAIXKcDvTy9ztX46UwJ+d+0MTEcqqwbvY0VDwGS/y+RuWUcXhTk4AKXP/f1wLLE60luqCuQQ+p0YC4GRP3PP7aLY84dXD2z+VWJHsXRQh/IiyybRH9KsgiEqwpNHxzNydk2T+Gv9h6B7Fyvg9nyOBzPiPhW8k09uToeLCpJKH45oEjDZGNWO1kkZUqz8TCsyZSfEwFmL/ArKqXPBlHVPSTO/s5Sa/YLKamHNJFscuY4jTiIEs/IRxrOyWn3PbI48SVWCYwdISXlku3K1Oc7E6EPjTviK/+HdHpLOQh7nDV/Oew2jcVJ9pzOLEf7HTBof7g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(396003)(366004)(376002)(346002)(39860400002)(451199018)(122000001)(83380400001)(38100700002)(8936002)(71200400001)(52536014)(478600001)(5660300002)(55016003)(86362001)(33656002)(38070700005)(76116006)(26005)(9686003)(53546011)(186003)(64756008)(6506007)(66446008)(66946007)(66556008)(7696005)(2906002)(316002)(66476007)(8676002)(41300700001)(4326008)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MJl2hPYdvO3vss/too7CxMsisKvqPjq1vgSegGeky69LnYdstx2cXwNjfsaw?=
 =?us-ascii?Q?44QSSKojSyqdVG6iKgXVXnrTa+yDoqxDrQesbGEcbQL63Zr3R+yaKZi8dgdd?=
 =?us-ascii?Q?rwkK16j7C+tIgLcPvvVg/CY8lLFbQHFDPBKcboc7UnkEl4uW+hX8y1y69TCr?=
 =?us-ascii?Q?/dK1YjEk4lbkWJ9TualwONcV2NrQ/Cpy2/nN9j/IqkPIeif5X7FcPcue5fSK?=
 =?us-ascii?Q?276BKelxd8w+dst4PfzRmsxGkCXIvD+IFZvOnqEuip+tu0idbmVv1ohI37ac?=
 =?us-ascii?Q?TMpE4YGNbq5SFoIS8UUKyr76we0mWEajaLHyOTIaihdGLT92UBgWAHFc6+xZ?=
 =?us-ascii?Q?nTCsWnIKaPWpLYkjRLr8Y/BchAoI0sbbxYtMz6ztB4ni8LKm1ROpnC42OeVW?=
 =?us-ascii?Q?aCtGKSfh0+KZNvFmAa44MMDX42EBHRoOZWZd/RcW1+S3n6hOrr34PU9h91kq?=
 =?us-ascii?Q?3E/b67hzW12KPnEEKc0g8N7w9MvsHoh7iZ1qB0F6LyLn3Kj2v7sxZ9bYmsPu?=
 =?us-ascii?Q?I/7vVf6gnXEpGxg2DjYYk2qvg/jUevyUAXPkyKQazt4OtCSRoBf3fZDs1NMg?=
 =?us-ascii?Q?faMBvNluRBjf2F2LpCwLVWXsMKFr8YIROFvJz7rGePSMr4K6G9hfGmmNCVLf?=
 =?us-ascii?Q?+YCIFlyEqndiOvhDa4gWFVaoxq8flz7Cnn0+agAwr1v0ibbD2qdIwub1KPin?=
 =?us-ascii?Q?L+kOFdLKIKCF6V2gcAHbFwrypY7SGv7AR01CcycMbuWb0nmeFzGJE7GEEscl?=
 =?us-ascii?Q?uw7HKq7skKZVJ7W8wmSy8QOUyNmsGfQJT+0Vha9ZajOdbWKMgOKhqVqP0tsX?=
 =?us-ascii?Q?8j8C5sEpfoRwuODx7/AX26x91cZvSTValrUvuv3jS6Ep0XR6AsmZu1PPR6qR?=
 =?us-ascii?Q?LnKnNDPqmt/xdCjrx5R7PYDfgMohvbcYfJkOiuF/O72bGxGdxq4ejVkaY1YO?=
 =?us-ascii?Q?ZNqbvGAPsGLz3FXgh0pZ0uyn7DpdzRcSdTU+n5qqzP3VIxQYj/avX0iXdPtZ?=
 =?us-ascii?Q?cQn3dkjWt5h4dkoPV9jEzmaKw/aAhy3JFMUjZQUXsBDHm9Z9oas5VKGkDPuU?=
 =?us-ascii?Q?ap8G9Sbyua/6A1tXzC6j0e8lfl0I63NDj8BlSSj80lKFBD4L7AQtHAQEhM49?=
 =?us-ascii?Q?pEBzZ6W74NXpcA8Lb18zpApQZGTywG1fRwq0TGpi3grxKZYKMT0t90AY/1MV?=
 =?us-ascii?Q?qFEg7gPxQKZhOp/s8T1ICaBWfW5ucKq94FWtl4A9jg4Y3Re3MZoMgiUZojWa?=
 =?us-ascii?Q?4KksVDbwk7MiueTvy1QYR5KumVXLe2ZP9R79+AdeiIsZ/CwLUxSzI30eT8mW?=
 =?us-ascii?Q?P1z7Y1d52PUcerkOuP7xp6d0NPJvUGuhCGJjXwRCcdB/lDW8v4TwH0tFMdlH?=
 =?us-ascii?Q?/sLSHdOmZCQdmETsLsHX9oteFZWEngdeu4lSLFhHIKm05mlH7i2670RtRo+f?=
 =?us-ascii?Q?QHV5ztmI4qKjAYuzN3JCxJbe4u4IRqJediqRGMFVYTDhQAOGCf/+3MVBDlpo?=
 =?us-ascii?Q?YVpWrgYION+1ikuDcYbNrMMLtCjqTG0Qj3l5+Q3O+Jvfid5EfTm2MrpM5oCP?=
 =?us-ascii?Q?ljgr/wk8c/oD587nESs8UwK/N/ibwdzP9F5mBwsE?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: Q/AedOy30Iky8GshaTrMWZg8Go/qojAJch5pTdq3UieS6RBJhHHzQOe/2LQ62c6Pa0QnbUZN0s78vYyWj/spXUH4jUInZRlbXdz2QBrG37uj9LADIhqucQ8TVSh5JfZkrphEvaUE7+42HLhm6Pf7RwgEhTDxwDZgmdhGuqklEvq0S0fUz5Aq1PXyxyoyKJWnidu6JJyrHzPMstcOed7+cfkVkhOWGDOn0SSBoMkYLfh6PF+owmj2pJYpXWMP1+Iz1uID13NPkzKgHUgcDxn2uI2ZaViQF9zBihL1107IkHaMIoPBhK1il2OfX9Ech1tQ2n/rEoGr2AJG2RmzAIcmMVfKFgrfZCR05ZuOHwR36IY/16Py+j4JhtCxNtyIB44mK79QukYO62/5hJOqbTyyh200xS6p8PTcDBu5NrdjuIXTjKkrkbvdsI3hWNZDGx4f4rx5ZT5VnTjyUty9xL/yUVSQa9ll5fL+oh+RpXGJLX2ynRPJ+VJUHMvqfee0KqwaKo33n/AdB70V2sk9H1OW3FI6rRcLSyJmWnPAwzZfYYaJ9/xcmOau3BZsCck14Al/rvq2DicB6s/0JbLRSm0AsktwaHrasAp35bJuPf5TgaCrK0A1a+DPFsLg0BaM+17yiGvmARxxGq8CxjUpduvoI8kRQtOSYEbeTRxu40wJRFKCF7khLf++IUcYtHgqllPjs5719/IFuSnA4FkgspntMrOviQWfJYGqIwqN8ShgvYoGdipZzbEWkpTaP0xrmQKOzLY6o9OpAJoBcGk7rC0FV8z6RgiIyk+52AKWLISIMYS3WTEijrrOzThrow1G8rN3
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35e10f81-80b2-4d39-e0ca-08db1c3ec5f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2023 23:26:53.7273 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bA7xZTGWhGXt+bptWI9f1Ldmh6CgVkcQTB3i28sOf5i28AqWeUeG0QjMYHGRqfexFxQ7zM3JUuoTN1gN3VP91Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7525
X-Proofpoint-ORIG-GUID: DSQImQHVHf5ch9zok62aAFDctk6F68qq
X-Proofpoint-GUID: DSQImQHVHf5ch9zok62aAFDctk6F68qq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-03_05,2023-03-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 mlxlogscore=577 clxscore=1015 priorityscore=1501 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303030197
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=tsimpson@quicinc.com; helo=mx0b-0031df01.pphosted.com
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



> -----Original Message-----
> From: Richard Henderson <richard.henderson@linaro.org>
> Sent: Friday, March 3, 2023 3:31 PM
> To: qemu-devel@nongnu.org
> Cc: anjo@rev.ng; Taylor Simpson <tsimpson@quicinc.com>
> Subject: [PATCH 1/2] tcg: Link branches to the labels
>=20
> This allows us to easily find all branches that use a label.
> Since 'refs' is only tested vs zero, remove it and test for an empty list=
 instead.
> Drop the use of bitfields, which had been used to pack refs into a single=
 32-
> bit word.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/tcg/tcg-op.h |  7 +------
>  include/tcg/tcg.h    | 19 +++++++++++++------
>  tcg/tcg-op.c         | 22 +++++++++++++++++++---
>  tcg/tcg.c            | 30 ++++++++++++++++++++----------
>  4 files changed, 53 insertions(+), 25 deletions(-)
>=20
> diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c index f2269a1b91..befc7c000d 100=
644
> --- a/tcg/tcg-op.c
> +++ b/tcg/tcg-op.c
> @@ -84,6 +84,22 @@ void tcg_gen_op6(TCGOpcode opc, TCGArg a1, TCGArg
> a2, TCGArg a3,
>      op->args[5] =3D a6;
>  }
>=20
> +/* Generic ops.  */
> +
> +static void last_is_label_use(TCGLabel *l) {

It would be more clear to name this function "add_label_use".

Otherwise,
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>


