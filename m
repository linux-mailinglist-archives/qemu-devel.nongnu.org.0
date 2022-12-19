Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3426511C0
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 19:25:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7Ko1-0005Ow-45; Mon, 19 Dec 2022 13:24:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1p7Knz-0005Oh-7j
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 13:24:03 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1p7Knv-000093-Vm
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 13:24:02 -0500
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BJFXZ8E029536
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 18:23:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=JHJy+M5fDm7g6RFellC4P4aBU4niONHsR/jRDZ2ENAQ=;
 b=mS6txxiLEI/uoBVNsBJPEP8RPRmYglQHbFlkcun3tyzmNfGBNih7nloEItGiVy6nXArA
 NUMPjWLYIoeaTApeYTOhPYyGXudDOy3eYxs1XwSXMX+GOkRCxvPSZtkS4TgOSyyh2bCo
 VM7kqbQY57uItbMQ6LAESJJM7XfDy+35A32KrLR8qKFyG/fINEZYrkSOQsOBzRrPWFJP
 307SSAm8O+Si4xG/G+m282kspcEwn3KXTH+3n2NLY4RC6wCGrbbTS/NcH9iyHM4E/65t
 M+eL7qKXYn8Ta866027nED9/OL+R4LqTYP/H1Pr44LcM/JJLtCPGhDnnNhTReoOHP85w Rw== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mjkwqs4my-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 18:23:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KMRFqceBUY+r0bEHNTZS0VJUYwKsbwLgGWVOksz+HTyk1WLuyxVHG5KpEYDHUaek9r1P84DpdDn2/9oscIG+uuEygq18vs9WIRBtZGPcdeW4EaOyoPoacGYa0lb7a8+tfXjhHbij/ubq0pI7AUTf2kqgShUd8ex9ZBtBefXG65T5X5uHcPtcUebQmYGIWNXUUOtpCVnM/iaSxSFIvLIeAutrgZ9xgkMkAUo/51vZt2pMqfWWI75oUfyoXGIT+tkh141U154RR2wdyXY9ZXgq3/4j8HDSEw7m57RWkIIanqChdK6xPy+wr/QUHaOFS2LnnOsKmu+g+kBgxg/HUKDO3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JHJy+M5fDm7g6RFellC4P4aBU4niONHsR/jRDZ2ENAQ=;
 b=fN2WiljHaiSszzV2N9OXug3r277fKTfRkRxMS+LajtkaQWnyqgeXdTbxVjsBF8k0sAHkC9soGZNMAWoEvNS2qVmCFnHNAcc0ikS1RmYrfJKAUL7M4Xsv0KjEAWJRaXNwLHOfdtSPtGWFuPf3n9is77ZzHQ4UB/IHLiNtWNeQs98nciuU5IRV8Al13VLLLbHwPlR2LIFQrkSuuxbbr/OcuZnpYON22IA2hEi3VnbSHKUXMwhREOCq6105odyJK8vHyDeoe4F1eFLfB628SAJCxy8Z7MPlQwbQskiuX587pzVhe8Nqd29n5/MZL9YHnybcTqhN5Nsj7ljThJEzbuR6Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by DM6PR02MB7081.namprd02.prod.outlook.com
 (2603:10b6:5:257::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.15; Mon, 19 Dec
 2022 18:23:51 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::8ba2:2429:9eea:75fc]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::8ba2:2429:9eea:75fc%9]) with mapi id 15.20.5924.016; Mon, 19 Dec 2022
 18:23:50 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: "Marco Liebel (QUIC)" <quic_mliebel@quicinc.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: Brian Cain <bcain@quicinc.com>
Subject: RE: [PATCH v2] Hexagon (target/hexagon) implement mutability mask for
 GPRs
Thread-Topic: [PATCH v2] Hexagon (target/hexagon) implement mutability mask
 for GPRs
Thread-Index: AQHZEYmgaETO3gLL/E63G6kWSxoV8K51ZBZg
Date: Mon, 19 Dec 2022 18:23:50 +0000
Message-ID: <SN4PR0201MB8808811EBCD9471A2D3792FDDEE59@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20221216200345.831816-1-quic_mliebel@quicinc.com>
In-Reply-To: <20221216200345.831816-1-quic_mliebel@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|DM6PR02MB7081:EE_
x-ms-office365-filtering-correlation-id: 0c1ca536-4155-4fde-defe-08dae1ee2d98
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: B8WQjDLxZnoY55YY1NV1QlQWieLgHhOUsH+pMNVxh5fSuferw4zx2VohSPLj3ElT3k//fUryMa6VpgFFlozpnbe/0aUVI4uOuJ4L6EPnSTXgnAlDGP4LqQ6kNBDl+S0W01KrEAgHOoSEI39ApJzgxWR1sMdEIJynULidJfZ0thUWQ2BoxNrzcc9MfSS2d3k9gQS2XF0ugJoxazLKL4YLv25H2s1Nf1aMTEsQlRUANaw6sQPOatd1mP0UQvy/gSFbSnUo+kLFQ715HeRajWjMnQeJBH/TMcaYaQFBoF7s20+Jr9iZTGZKIqpcf5GMuLP0jCpN3gkOVy24pz9rVR33HrnRIXzzbmd6ePwNr9+Ej3v3Bo1ok3Wgl/6sZZnTSNlEEFawJITplJqLB9dYZYNuGeHNfTe0KK2pwgGmwsOeOntA4hkGZQchuuB7ip/KWgL0iTH2XDEMeIIxd6w3da0ibJAnayyl+tzEu7VbYG8WqoRjDbPI2Hijd3yRxF5al88DppFPLd8MntVVNqE9OhVkVwUW/eIaClMh7Aag8zmIWXPAL77BwHRNZpMnN82LGzy3z8ajqr1CHn+VzTysYY3j28nYvG/vW92YWC23rlNVxFqs/nmljVOSNEoSwjR8HiwgqentMBVs6W3B1ejCEjEa9nOx/ygeRfBsqr5SPuaJdOzYxIRgVL7as9vLAhp+yQdzPRevnGGKzgAwfc71axvYQAgI6u6OI9//WR55c6etMmkfCAJ5L1mdq6axZA0xCvGb
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(136003)(346002)(366004)(396003)(451199015)(33656002)(83380400001)(122000001)(86362001)(64756008)(66476007)(2906002)(30864003)(52536014)(8936002)(66446008)(66946007)(38070700005)(76116006)(4326008)(8676002)(66556008)(38100700002)(5660300002)(41300700001)(7696005)(55016003)(9686003)(186003)(26005)(6506007)(107886003)(53546011)(110136005)(316002)(71200400001)(478600001)(2004002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RVRf9iK1VgTfRJbbD2wI4Q+txT88mSmc8PkQndTjyEaeWoydYTkekUmvqFWc?=
 =?us-ascii?Q?sdecSjr4qf+h0L2ClWcCRt/FeTptx7n7uLbyRe6Xu8fxFIcT4kUHDwfYitXf?=
 =?us-ascii?Q?pTPNcVlsBlgxsTtxNgYuxeAQHS8Su+8hxpcEYTnCszQD4M8ZsbbWO3aH5y19?=
 =?us-ascii?Q?ZQ4w0si28GrK5Vat7oDSv1CUWdy+g6AccmyqwfrkO7M0OCzxrTqTPweOAab9?=
 =?us-ascii?Q?ftF+rX6j7SbyKU78RQRv027NMmtCiUo4jTpT4dqbDVT9LxDgM2UvKkr+JIqb?=
 =?us-ascii?Q?dxIm+9Q3tl1qrbKy8tfg0GfiOzUNUAo2cDkPsaNHbtYOk4ks5WmTn+7x/gZu?=
 =?us-ascii?Q?HvPfKqSvNuns8cKaybE3lclADkZjvQ8awVVoG5dRCHm61BZMbXWGrvJNqBUc?=
 =?us-ascii?Q?uz7KFPFyyK/4EH7qTJDUu8c2lZFLQst53BDb0/+/PtQjvpKVSwqVeX3lchJG?=
 =?us-ascii?Q?msbPyJ20RkMp/8oj3lz4BKPM4olHkEsoHZ1N02MPS2I0beA6GSHhmwi3p2Cg?=
 =?us-ascii?Q?a2N3GePWpEKIuGUZZN9Efvl/YhETl75ezEpyKxdIkAZQ/7NmipLXz/U/NgFl?=
 =?us-ascii?Q?OPMEE7mPJ0tRrCYJ0qYfrZEynn72ahIIf9jXhuw55isKRBcqAbTymmQw0abz?=
 =?us-ascii?Q?AOPHqITl8YRRNlI+y/h6yhde4ii4afy1NIWTI5RSxV3M3edbd2phdh4ZW8Ph?=
 =?us-ascii?Q?NDRFx2Uqdk3pROsAsYlhlwosOWK8LUJ2hMkKs6E4aHe3ygGIVf/aoo0AUmXS?=
 =?us-ascii?Q?6o7x4ycPAVCV4TdN9zr+0J5AVn0f7NwwkOLfUQ9++CTg4M0tcZdO9gbS9a6e?=
 =?us-ascii?Q?mdz08/7XC86L5StuUaVA3sjQdfI+TKXqCjRr4+ZuGEUumvuBo2BbVstYigF9?=
 =?us-ascii?Q?UIkNoO9q/jZc3KW6oHmvS6DzpPnYYarhr2hVXjJQvbARyEHU2UO6HsVjT+y6?=
 =?us-ascii?Q?KIWdFjJSvQb2bcrlhWlHlqImJaiR1OHZdF7ku4bmJLziB9pqy9mHfrYxmp5/?=
 =?us-ascii?Q?4vD4jRbbQN4atoTcJhmRk/CDZx8BJogmsBcJbxToHNmkmulx4eNBaLd8YljT?=
 =?us-ascii?Q?8Sq7JZjIeINqOvADo2gmt9LeKbN/hTOFevQgd6mviMBsay0Bu0WOKzuAWRSW?=
 =?us-ascii?Q?wIJwJwfc/myjubLHZcmyQjoZZ0wm9ZrzV7OvLJXPdBUp9UDwP1SUnZAIRkl8?=
 =?us-ascii?Q?bJ1pxPW25PQQMIlSUm8gRCshK+eGn3MYVfWcKis6K+ZnDc+TEswTgwi5q1X0?=
 =?us-ascii?Q?/VlziAf3lu7KDifndJS/YQUVvis4PStma+cuFHZzi+V2bjxX6x5bS+OKiMdT?=
 =?us-ascii?Q?q1HoTWZ4TnS/MqocHy8lPNR2bIH/RG2FmHBWns8JJGpb+ti85qWgXzMly7GY?=
 =?us-ascii?Q?Iz15YjHwahYmO5nRHBsjCNP4YTtBUIPTTC43X6CsgN1pdVu30ZHDmJz16pjQ?=
 =?us-ascii?Q?aDAf7AMSETI2VyVqnIZq2Sd+313r0jWVlPEnOZoZf4zOTin5xIRrsPAVnW+K?=
 =?us-ascii?Q?XGh9nv6f5DfVQJrlarJRJFbJHcTxqfC7znOv4QWE/7m/KpO8B1GStGNVLIat?=
 =?us-ascii?Q?vfpghCLvcjFOZ+GBpOhMwij45k6Nn0KlchPT9gUX?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c1ca536-4155-4fde-defe-08dae1ee2d98
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2022 18:23:50.9180 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tuK8pyHa01+fSd9rldRdPgIsqLWzTvfFolCJVtN/KiKK5yjWhpei72729RjQ8bSig9lk5nve7tIT3GF8EA78QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB7081
X-Proofpoint-GUID: E9YMoTt0BSg4Icq4h6_pKrFNw6r2T95n
X-Proofpoint-ORIG-GUID: E9YMoTt0BSg4Icq4h6_pKrFNw6r2T95n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-19_01,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 priorityscore=1501 spamscore=0 mlxlogscore=999 lowpriorityscore=0
 suspectscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212190163
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
> From: Marco Liebel (QUIC) <quic_mliebel@quicinc.com>
> Sent: Friday, December 16, 2022 2:04 PM
> To: qemu-devel@nongnu.org
> Cc: Brian Cain <bcain@quicinc.com>; Taylor Simpson
> <tsimpson@quicinc.com>; Marco Liebel (QUIC) <quic_mliebel@quicinc.com>
> Subject: [PATCH v2] Hexagon (target/hexagon) implement mutability mask
> for GPRs
>=20
> Some registers are defined to have immutable bits, this commit will
> implement that behavior.
>=20
> Signed-off-by: Marco Liebel <quic_mliebel@quicinc.com>
> ---
> This incorporates the feedback given on Brian's patch
>=20
>  target/hexagon/genptr.c           |  43 ++++-
>  tests/tcg/hexagon/Makefile.target |   3 +
>  tests/tcg/hexagon/reg_mut.c       | 307
> ++++++++++++++++++++++++++++++
>  3 files changed, 351 insertions(+), 2 deletions(-)  create mode 100644
> tests/tcg/hexagon/reg_mut.c
>=20
> diff --git a/target/hexagon/genptr.c b/target/hexagon/genptr.c index
> 806d0974ff..a91db8c76d 100644
> --- a/target/hexagon/genptr.c
> +++ b/target/hexagon/genptr.c
> @@ -30,6 +30,32 @@
>  #include "gen_tcg.h"
>  #include "gen_tcg_hvx.h"
>=20
> +static const target_ulong reg_immut_masks[TOTAL_PER_THREAD_REGS] =3D
> {
> +    [HEX_REG_USR] =3D 0xc13000c0,
> +    [HEX_REG_PC] =3D UINT32_MAX,
> +    [HEX_REG_GP] =3D 0x3f,
> +    [HEX_REG_UPCYCLELO] =3D UINT32_MAX,
> +    [HEX_REG_UPCYCLEHI] =3D UINT32_MAX,
> +    [HEX_REG_UTIMERLO] =3D UINT32_MAX,
> +    [HEX_REG_UTIMERHI] =3D UINT32_MAX,
> +};

UINT_MAX is confusing.  Use ~0 instead.

#define IMMUTABLE (~0)
...
[HEX_REG_PC] =3D IMMUTABLE
...

> +
> +static inline void gen_masked_reg_write(TCGv result, TCGv new_val, TCGv
> cur_val,
> +                                        target_ulong reg_mask) {
> +    if (reg_mask) {
> +        TCGv tmp =3D tcg_temp_new();
> +
> +        /* out_val =3D (in_val & reg_mask) | (cur_val & ~reg_mask) */

Comment doesn't match the TCG code below.  Should be
        /* result =3D (new_val & ~reg_mask) | (cur_val & reg_mask) */

> +        /* result is used to avoid creating a second temporary variable =
*/
> +        tcg_gen_andi_tl(result, new_val, ~reg_mask);
> +        tcg_gen_andi_tl(tmp, cur_val, reg_mask);
> +        tcg_gen_or_tl(result, result, tmp);
> +
> +        tcg_temp_free(tmp);
> +    }
> +}

All of the callers of this function pass the same TCGv for result and new_v=
al.  So, we are getting lucky that this function doesn't set result when re=
g_mask is zero.  In order to future-proof this function, either eliminate t=
he result parameter or assign to it from new_val when reg_mask is zero.

> +
>  static inline void gen_log_predicated_reg_write(int rnum, TCGv val, int =
slot)
> {
>      TCGv zero =3D tcg_constant_tl(0);
> diff --git a/tests/tcg/hexagon/Makefile.target
> b/tests/tcg/hexagon/Makefile.target
> index 96a4d7a614..4e9a20960b 100644
> --- a/tests/tcg/hexagon/Makefile.target
> +++ b/tests/tcg/hexagon/Makefile.target
> @@ -43,9 +43,12 @@ HEX_TESTS +=3D load_align  HEX_TESTS +=3D atomics
> HEX_TESTS +=3D fpstuff  HEX_TESTS +=3D overflow
> +HEX_TESTS +=3D reg_mut
>=20
>  TESTS +=3D $(HEX_TESTS)
>=20
> +reg_mut: CFLAGS +=3D -I$(SRC_PATH)/target/hexagon/
> +

You won't need this when you remove hex_regs.h from the test (see below).

>  # This test has to be compiled for the -mv67t target
>  usr: usr.c
>  	$(CC) $(CFLAGS) -mv67t -O2 -Wno-inline-asm -Wno-expansion-to-
> defined $< -o $@ $(LDFLAGS) diff --git a/tests/tcg/hexagon/reg_mut.c
> b/tests/tcg/hexagon/reg_mut.c new file mode 100644 index
> 0000000000..8bbc1559dd
> --- /dev/null
> +++ b/tests/tcg/hexagon/reg_mut.c
> @@ -0,0 +1,307 @@
> +
> +/*
> + *  Copyright(c) 2022 Qualcomm Innovation Center, Inc. All Rights Reserv=
ed.
> + *
> + *  This program is free software; you can redistribute it and/or
> +modify
> + *  it under the terms of the GNU General Public License as published
> +by
> + *  the Free Software Foundation; either version 2 of the License, or
> + *  (at your option) any later version.
> + *
> + *  This program is distributed in the hope that it will be useful,
> + *  but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *  GNU General Public License for more details.
> + *
> + *  You should have received a copy of the GNU General Public License
> + *  along with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include <stdio.h>
> +#include <stdint.h>
> +
> +#include "hex_regs.h"

Don't include headers from QEMU  itself in the test cases.

You don't need this because you are just converting from the enum to a stri=
ng.  Just use the string itself and skip the switch statement.

> +
> +static int err;
> +
> +enum {
> +    HEX_REG_PAIR_C9_8,
> +    HEX_REG_PAIR_C11_10,
> +    HEX_REG_PAIR_C15_14,
> +    HEX_REG_PAIR_C31_30,
> +};

Shouldn't need this if you switch to using strings for the register names.

> +#define WRITE_REG(reg_name, output, input) \
> +    asm volatile(reg_name " =3D %1\n\t" \
> +                 "%0 =3D " reg_name "\n\t" \
> +                 : "=3Dr"(output) \
> +                 : "r"(input) \
> +                 : reg_name);
> +
> +#define WRITE_REG_IN_PACKET(reg_name, output, input) \
> +    asm volatile("{ " reg_name " =3D %1 }\n\t" \

This is no different from the WRITE_REG above.  Instructions on a line with=
 no curly braces are a single packet.

> +                 "%0 =3D " reg_name "\n\t" \
> +                 : "=3Dr"(output) \
> +                 : "r"(input) \
> +                 : reg_name);
> +
> +#define WRITE_REG_ENCODED(reg_name, encoding, output, input) \
> +    asm volatile("r0 =3D %1\n\t" \
> +                 encoding \
> +                 "%0 =3D " reg_name "\n\t" \
> +                 : "=3Dr"(output) \
> +                 : "r"(input) \
> +                 : "r0");
> +
> +#define WRITE_REG_ENCODED_IN_PACKET(reg_name, encoding, output,
> input) \
> +    asm volatile("{ r0 =3D %1 }\n\t" \

This is also the same as WRITE_REG_ENCODED.

> +                 encoding \
> +                 "%0 =3D " reg_name "\n\t" \
> +                 : "=3Dr"(output) \
> +                 : "r"(input) \
> +                 : "r0");
> +
> +#define WRITE_REG_PAIR_ENCODED(reg_name, encoding, output, input) \
> +    asm volatile("r1:0 =3D %1\n\t" \
> +                 encoding \
> +                 "%0 =3D " reg_name "\n\t" \
> +                 : "=3Dr"(output) \
> +                 : "r"(input) \
> +                 : "r1:0");
> +
> +#define WRITE_REG_PAIR_ENCODED_IN_PACKET(reg_name, encoding,
> output, input) \
> +    asm volatile("{ r1:0 =3D %1 }\n\t" \
> +                 encoding \
> +                 "%0 =3D " reg_name "\n\t" \
> +                 : "=3Dr"(output) \
> +                 : "r"(input) \
> +                 : "r1:0");
> +
> +/*
> + * Instruction word: { pc =3D r0 }
> + *
> + * This instruction is barred by the assembler.
> + *
> + *    3                   2                   1
> + *  1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
> + * +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
> + * |    Opc[A2_tfrrcr]   | Src[R0] |P P|                 |  C9/PC  |
> + * +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
> + */
> +#define PC_EQ_R0        ".word 0x6220c009\n\t"
> +#define GP_EQ_R0        ".word 0x6220c00b\n\t"
> +#define UPCYCLELO_EQ_R0 ".word 0x6220c00e\n\t"
> +#define UPCYCLEHI_EQ_R0 ".word 0x6220c00f\n\t"
> +#define UTIMERLO_EQ_R0  ".word 0x6220c01e\n\t"
> +#define UTIMERHI_EQ_R0  ".word 0x6220c01f\n\t"
> +
> +#define C9_8_EQ_R1_0    ".word 0x6320c008\n\t"
> +#define C11_10_EQ_R1_0  ".word 0x6320c00a\n\t"
> +#define C15_14_EQ_R1_0  ".word 0x6320c00e\n\t"
> +#define C31_30_EQ_R1_0  ".word 0x6320c01e\n\t"

Only the assignment to PC and C9 (which is an alias for PC) are not allowed=
 by the assembler.  For the others, use the normal assembly syntax.

> +
> +static inline uint32_t write_reg(int rnum, uint32_t val) {
> +    uint32_t result;
> +    switch (rnum) {
> +    case HEX_REG_USR:
> +        WRITE_REG("usr", result, val);
> +        break;
> +    case HEX_REG_PC:
> +        WRITE_REG_ENCODED("pc", PC_EQ_R0, result, val);
> +        break;
> +    case HEX_REG_GP:
> +        WRITE_REG_ENCODED("gp", GP_EQ_R0, result, val);
> +        break;
> +    case HEX_REG_UPCYCLELO:
> +        WRITE_REG_ENCODED("upcyclelo", UPCYCLELO_EQ_R0, result, val);
> +        break;
> +    case HEX_REG_UPCYCLEHI:
> +        WRITE_REG_ENCODED("upcyclehi", UPCYCLEHI_EQ_R0, result, val);
> +        break;
> +    case HEX_REG_UTIMERLO:
> +        WRITE_REG_ENCODED("utimerlo", UTIMERLO_EQ_R0, result, val);
> +        break;
> +    case HEX_REG_UTIMERHI:
> +        WRITE_REG_ENCODED("utimerhi", UTIMERHI_EQ_R0, result, val);
> +        break;
> +    }
> +    return result;
> +}

There's a 1-1 mapping from the invocations of this  to a line in the switch=
 statement.  Replace the invocation with the body of each case, so you won'=
t have to include hex_regs.h

> +
> +static inline uint32_t write_reg_in_packet(int rnum, uint32_t val) {
> +    uint32_t result;
> +    switch (rnum) {
> +    case HEX_REG_USR:
> +        WRITE_REG_IN_PACKET("usr", result, val);
> +        break;
> +    case HEX_REG_PC:
> +        WRITE_REG_ENCODED_IN_PACKET("pc", PC_EQ_R0, result, val);
> +        break;
> +    case HEX_REG_GP:
> +        WRITE_REG_ENCODED_IN_PACKET("gp", GP_EQ_R0, result, val);
> +        break;
> +    case HEX_REG_UPCYCLELO:
> +        WRITE_REG_ENCODED_IN_PACKET("upcyclelo", UPCYCLELO_EQ_R0,
> result, val);
> +        break;
> +    case HEX_REG_UPCYCLEHI:
> +        WRITE_REG_ENCODED_IN_PACKET("upcyclehi", UPCYCLEHI_EQ_R0,
> result, val);
> +        break;
> +    case HEX_REG_UTIMERLO:
> +        WRITE_REG_ENCODED_IN_PACKET("utimerlo", UTIMERLO_EQ_R0,
> result, val);
> +        break;
> +    case HEX_REG_UTIMERHI:
> +        WRITE_REG_ENCODED_IN_PACKET("utimerhi", UTIMERHI_EQ_R0,
> result, val);
> +        break;
> +    }
> +    return result;
> +}

This is redundant because the IN_PACKET macros are redundant.

> +
> +static inline uint64_t write_reg_pair(int rnum, uint32_t val_hi,
> +                                      uint32_t val_lo) {
> +    uint64_t val =3D (uint64_t) val_hi << 32 | val_lo;
> +    uint64_t result;
> +    switch (rnum) {
> +    case HEX_REG_PAIR_C9_8:
> +        WRITE_REG_PAIR_ENCODED("c9:8", C9_8_EQ_R1_0, result, val);
> +        break;
> +    case HEX_REG_PAIR_C11_10:
> +        WRITE_REG_PAIR_ENCODED("c11:10", C11_10_EQ_R1_0, result, val);
> +        break;
> +    case HEX_REG_PAIR_C15_14:
> +        WRITE_REG_PAIR_ENCODED("c15:14", C15_14_EQ_R1_0, result, val);
> +        break;
> +    case HEX_REG_PAIR_C31_30:
> +        WRITE_REG_PAIR_ENCODED("c31:30", C31_30_EQ_R1_0, result, val);
> +        break;
> +    }
> +    return result;
> +}
> +
> +static inline uint64_t write_reg_pair_in_packet(int rnum, uint32_t val_h=
i,
> +                                                uint32_t val_lo) {
> +    uint64_t val =3D (uint64_t) val_hi << 32 | val_lo;
> +    uint64_t result;
> +    switch (rnum) {
> +    case HEX_REG_PAIR_C9_8:
> +        WRITE_REG_PAIR_ENCODED_IN_PACKET("c9:8", C9_8_EQ_R1_0,
> result, val);
> +        break;
> +    case HEX_REG_PAIR_C11_10:
> +        WRITE_REG_PAIR_ENCODED_IN_PACKET("c11:10", C11_10_EQ_R1_0,
> result, val);
> +        break;
> +    case HEX_REG_PAIR_C15_14:
> +        WRITE_REG_PAIR_ENCODED_IN_PACKET("c15:14", C15_14_EQ_R1_0,
> result, val);
> +        break;
> +    case HEX_REG_PAIR_C31_30:
> +        WRITE_REG_PAIR_ENCODED_IN_PACKET("c31:30", C31_30_EQ_R1_0,
> result, val);
> +        break;
> +    }
> +    return result;
> +}

This is redundant also.

> +
> +static inline void write_control_registers(void) {
> +    check(write_reg(HEX_REG_USR,        0xffffffff), 0x3ecfff3f);
> +    check(write_reg(HEX_REG_GP,         0xffffffff), 0xffffffc0);
> +    check(write_reg(HEX_REG_UPCYCLELO,  0xffffffff),        0x0);
> +    check(write_reg(HEX_REG_UPCYCLEHI,  0xffffffff),        0x0);
> +    check(write_reg(HEX_REG_UTIMERLO,   0xffffffff),        0x0);
> +    check(write_reg(HEX_REG_UTIMERHI,   0xffffffff),        0x0);
> +
> +    /*
> +     * PC is special.  Setting it to these values
> +     * should cause a catastrophic failure.
> +     */
> +    check_ne(write_reg(HEX_REG_PC, 0x00000000), 0x00000000);
> +    check_ne(write_reg(HEX_REG_PC, 0x00000000), 0x00000001);
> +    check_ne(write_reg(HEX_REG_PC, 0xffffffff), 0xffffffff);
> +    check_ne(write_reg(HEX_REG_PC, 0x00000000), 0x00000000); }

This is the same as the first test for PC.

> +
> +static inline void write_control_registers_in_packets(void)
> +{
> +    check(write_reg_in_packet(HEX_REG_USR,        0xffffffff), 0x3ecfff3=
f);
> +    check(write_reg_in_packet(HEX_REG_GP,         0xffffffff), 0xffffffc=
0);
> +    check(write_reg_in_packet(HEX_REG_UPCYCLELO,  0xffffffff),        0x=
0);
> +    check(write_reg_in_packet(HEX_REG_UPCYCLEHI,  0xffffffff),        0x=
0);
> +    check(write_reg_in_packet(HEX_REG_UTIMERLO,   0xffffffff),        0x=
0);
> +    check(write_reg_in_packet(HEX_REG_UTIMERHI,   0xffffffff),        0x=
0);
> +
> +    check_ne(write_reg_in_packet(HEX_REG_PC, 0x00000000), 0x00000000);
> +    check_ne(write_reg_in_packet(HEX_REG_PC, 0x00000001), 0x00000001);
> +    check_ne(write_reg_in_packet(HEX_REG_PC, 0xffffffff), 0xffffffff);
> +    check_ne(write_reg_in_packet(HEX_REG_PC, 0x00000000), 0x00000000);
> +}

This is redundant.

> +
> +static inline void write_control_register_pairs(void)
> +{
> +    check(write_reg_pair(HEX_REG_PAIR_C11_10, 0xffffffff, 0xffffffff),
> +          0xffffffc0ffffffff);
> +    check(write_reg_pair(HEX_REG_PAIR_C15_14, 0xffffffff, 0xffffffff), 0=
x0);
> +    check(write_reg_pair(HEX_REG_PAIR_C31_30, 0xffffffff, 0xffffffff),
> +0x0);
> +
> +    check_ne(write_reg_pair(HEX_REG_PAIR_C9_8, 0x00000000,
> 0x00000000),
> +             0x0000000000000000);
> +    check_ne(write_reg_pair(HEX_REG_PAIR_C9_8, 0x00000001,
> 0x00000000),
> +             0x0000000100000000);
> +    check_ne(write_reg_pair(HEX_REG_PAIR_C9_8, 0xffffffff, 0xffffffff),
> +             0xffffffffffffffff);
> +    check_ne(write_reg_pair(HEX_REG_PAIR_C9_8, 0x00000000,
> 0x00000000),
> +             0x0000000000000000);
> +}
> +
> +static inline void write_control_register_pairs_in_packets(void)
> +{
> +    check(write_reg_pair_in_packet(HEX_REG_PAIR_C11_10, 0xffffffff,
> 0xffffffff),
> +          0xffffffc0ffffffff);
> +    check(write_reg_pair_in_packet(HEX_REG_PAIR_C15_14, 0xffffffff,
> 0xffffffff),
> +          0x0);
> +    check(write_reg_pair_in_packet(HEX_REG_PAIR_C31_30, 0xffffffff,
> 0xffffffff),
> +          0x0);
> +
> +    check_ne(write_reg_pair_in_packet(HEX_REG_PAIR_C9_8, 0x00000000,
> +             0x00000000), 0x0000000000000000);
> +    check_ne(write_reg_pair_in_packet(HEX_REG_PAIR_C9_8, 0x00000001,
> +             0x00000000), 0x0000000100000000);
> +    check_ne(write_reg_pair_in_packet(HEX_REG_PAIR_C9_8, 0xffffffff,
> +             0xffffffff), 0xffffffffffffffff);
> +    check_ne(write_reg_pair_in_packet(HEX_REG_PAIR_C9_8, 0x00000000,
> +             0x00000000), 0x0000000000000000); }

Also redundant.

> +
> +int main()
> +{
> +    err =3D 0;
> +
> +    write_control_registers();
> +    write_control_registers_in_packets();
> +    write_control_register_pairs();
> +    write_control_register_pairs_in_packets();
> +
> +    puts(err ? "FAIL" : "PASS");
> +    return err;
> +}
> --
> 2.25.1


