Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EA4658B13
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 10:34:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pApIc-000621-St; Thu, 29 Dec 2022 04:34:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mthiyaga@quicinc.com>)
 id 1pApIa-00060I-Tm
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 04:34:04 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mthiyaga@quicinc.com>)
 id 1pApIY-0007IV-Ot
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 04:34:04 -0500
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BT9SPCJ028472
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 09:34:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=KfS0CRAPqDTYsm+6O/sAbCSPiWR9twF9saW3yZAmZIc=;
 b=ajyw6TS5QyNEm1pvSl65x0UbM6xi2roG9FBLVJSRNnPY1r2nXHJ+ZP5hFr8G6B0zBUd6
 AcIWKbEgJxVEd4loCA3MLMcIgm2ohZel56mEUpa4pfHDG0w509R+MYx2TbrsWgTcw/HE
 n36VSLY2U3TUM/gSpCvoNO81gDxKGnbXirJnbOn54kKWEnoOi0HHrH6Cusd6W5ubH8+X
 iKOFBtVMLuPhecmwjeVjckvR54q8zP8a1MSiGRkESk/BCNBBqNSMaPAcrx9ixjpTnC8C
 h2Y3sU7KHqulz8qH6sXbLPTZTg8zHotBGuvwQQGz5PQlCH+8WT3mlvfJWtOpS1U7u4rW 5w== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2104.outbound.protection.outlook.com [104.47.58.104])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mr5fubd2d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 09:34:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TPIInXGxoknQUAqnAkgcClmqa4UiHLdTzuh6KKzlW+s/JrYuU1+pyZGpoFedv1gnibqeDo75lgOlnorpPmw60174qNUkhfdnbZ2hbNuLz+W6FKs1O0ALAHhQzVPB8u4BcWbPrDiuKVVa8JfaD3d61JXpwzZ8hVqEEgN4NJbNEl5AZyGVedxRfHbQLEySubStFoTmFw8pqkFVrHqHrJETbjG7KZmtIU7RZMBtY0TjZXWgZhOm8FggnLf6nHHTSxnwUWe/yj7GQVZ3CpXFvyJakdSKa+T10O5YCnVMg0VXmNjJpDN+fweQHbY0m2fhb31RabDpkSRmFTvNux8jhxPtLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KfS0CRAPqDTYsm+6O/sAbCSPiWR9twF9saW3yZAmZIc=;
 b=PquQZCaWR1wOUbNZ3iqVDVu/j+XJmrkHSVYXa0Smb/+a1DDBuhcEAH21fwfVrvIWIFPRNdulE/HFgPYKdF+L7dzMcRsP/n1Xmjt0fIWAnRMeLNAvfs8llSPSW/01oNSD++HvEDkgdkxt/Ohk5KEaeLuJUdcdI39M/sTpm9rOEAjrHXR16YwgNg4rLhh3FFJdy0UN2YcmkSFl2mAgrXQxUG7la/ynXsRpjNbTD8wBdqQo48FcPbG5z/zgC5Cm/Fznv3EQqbA5sSAyd0X5x3sgkFrllqcd0ylcMHjqNsbS3bTHyd4nwTbYrOUGt/Fp3gmwYeQMXqcU/IPQIpzl2lbqoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from MWHPR0201MB3497.namprd02.prod.outlook.com
 (2603:10b6:301:7e::24) by SA0PR02MB7210.namprd02.prod.outlook.com
 (2603:10b6:806:ea::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.17; Thu, 29 Dec
 2022 09:33:58 +0000
Received: from MWHPR0201MB3497.namprd02.prod.outlook.com
 ([fe80::49c9:9516:f90c:a65e]) by MWHPR0201MB3497.namprd02.prod.outlook.com
 ([fe80::49c9:9516:f90c:a65e%7]) with mapi id 15.20.5944.016; Thu, 29 Dec 2022
 09:33:58 +0000
From: "Mukilan Thiyagarajan (QUIC)" <quic_mthiyaga@quicinc.com>
To: Taylor Simpson <tsimpson@quicinc.com>, "Mukilan Thiyagarajan (QUIC)"
 <quic_mthiyaga@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Brian Cain <bcain@quicinc.com>, "Matheus Bernardino (QUIC)"
 <quic_mathbern@quicinc.com>
Subject: RE: [PATCH] tests/tcg/hexagon: fix underspecifed asm constraints
Thread-Topic: [PATCH] tests/tcg/hexagon: fix underspecifed asm constraints
Thread-Index: AQHZGtJE51ZgdWksFUmpHtN8hci7+K6DkFWAgAELXqA=
Date: Thu, 29 Dec 2022 09:33:57 +0000
Message-ID: <MWHPR0201MB3497533330F41E6CE0B902E5F4F39@MWHPR0201MB3497.namprd02.prod.outlook.com>
References: <20221228153657.10210-1-quic_mthiyaga@quicinc.com>
 <SN4PR0201MB8808DFF40FC2E821380E0F6CDEF29@SN4PR0201MB8808.namprd02.prod.outlook.com>
In-Reply-To: <SN4PR0201MB8808DFF40FC2E821380E0F6CDEF29@SN4PR0201MB8808.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MWHPR0201MB3497:EE_|SA0PR02MB7210:EE_
x-ms-office365-filtering-correlation-id: 83e32ee7-9a1c-4b98-29f4-08dae97fcfa6
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: x5fRlaG4o1poYZX3HcY9vyvfTL7KgJ+9srhRm45Iugvyw/nw3zTJ0HQEOzhX5ZTj4CHSSINzIa37QXLedFIWG3Um8R7Awf9SzrlgvmIGMkKVngfCmy3QvJ81C6aai/Y8KW91K48kT3KiY7XBEIpR7dX32A7bi3Uvk5B8UIbKQY4FQydZ/5q90D4RtqOaL3tERM3f2K8MCjiPL1/GRarvPye2x+GOc6FW5McNjtQkHwdyuueEXHJuExxGJIFcMZ/eEdPq2ZwrFTX9Dx14NFejePy7V2bj0+fFVm36T3d8q+0E9lQGv0sryNbYqhyWBuirmxRJyxqpHq0Bn2nObv05NM5OrdDd+HPJAKul3xNIE2fqXtX5lHcNw2FDtUXqHSEc3eRLufO2CzVK36f5YNRCj0O8rCdvkb/6KkYLkKlNNTyBpdpOPAVPDhBtm9YZx0iFuYoR0cu8qEp7M3fzVm44VyVqxQaW8bBbIke+5eTm6L0wMxwa3Buk6ze1dE0qIERLaQP/F4Q/Q/QLlfH4e9X6BMbBBy8YqGeThej6JJTLW2tcaCpttKBwqvbeyiCV3Es4BNl1ZE6d9ZOUAbnjNtYf4VI2A+RF8fkv+PyDmh/yHhlsVp0V4CdNqNxncGXnQqPDi2UDur4S0C9JiKOPqOhWQFlZHvsuAuTOKoQQw0ZFMTaNMtbHJt3V9zBkOE/OPxvmzSMYtz0PANque6lZEgKOhNL7tYvkgTiRDeLRuY9L5y4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR0201MB3497.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(366004)(346002)(136003)(396003)(451199015)(86362001)(316002)(55016003)(107886003)(2906002)(38100700002)(9686003)(186003)(6506007)(53546011)(26005)(7696005)(966005)(478600001)(71200400001)(33656002)(41300700001)(122000001)(54906003)(110136005)(66446008)(8676002)(4326008)(64756008)(83380400001)(8936002)(66476007)(52536014)(66556008)(76116006)(66946007)(5660300002)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?H3RN2ct7W0zUJF7eeIUPm0xRGCkEgimBOsRmwJwUcRC33VWLasmTS5T/GNJg?=
 =?us-ascii?Q?nSzQE0saf4aM5C5tZCf2A/iq6pw/gNmvmpOaCiM5tdgu6N2zlb6+qKvIo5eV?=
 =?us-ascii?Q?GvyvIUzEQGaZx5WFvtaKBU+cF4/Lls7TtZ/kBu5a0NwEvq7QvgYD/JzTNXc5?=
 =?us-ascii?Q?m7m9fAa3vQ/VBb73gbfkGDFY5HRXQDa0XAei6GUL0+pIZluj/TCK4S5VKkfx?=
 =?us-ascii?Q?DeUCxSnYpmfJ7nnom0F6Bp5e90HuojEWfbHodLanB2JQlbsxO8Vt1v9ukJmY?=
 =?us-ascii?Q?CSF4lUW/mdzFQX1NWXHGtYIB9FrvP5h2Dc39KIbiza6qqeMPkoL9/40r32xK?=
 =?us-ascii?Q?V84VmQUyCTdS7wVZtI+rIkPOMjVKcdqtVOn1MngKJy98B07CwaMaLd10S1vS?=
 =?us-ascii?Q?esb5ottRpAHPJ7UA/6PCXv0tdiHYEo2RxbPwd4YvT82rU+1EgTt56XYPOadx?=
 =?us-ascii?Q?gnkCD8t9v9hhrljgS7X2Xfu65jhhv0dj00w38l6GNsj7EJfTbUxK4vyROEB8?=
 =?us-ascii?Q?GKUR9c6uqhZH/bQ53iWTTFaOYRQttUT7xknkqBu5RcVH8v6bM3pm0RMRQ+4N?=
 =?us-ascii?Q?OWzkEBaz+j72wB3eXL2M3/YqDCgljX5hhXBx9dkkgQ+XgxKllBetETwWQm8j?=
 =?us-ascii?Q?uUFFRlwH21cC8HmDqQWc0Ae7hjJbQLufyTB0aORtnpExT50MHbVoyOkzB1qs?=
 =?us-ascii?Q?SfMFHs+cw9bpds+Vd6xU6XiAjzw4I5tg0mBQdZbt0zEL5icKLi+oI2K8iYNK?=
 =?us-ascii?Q?wcbgJ2+mYK2GV2WqoUuBmU0fq6fANzYp+/KpzLssnPGcWcQdruTq5S0HS74+?=
 =?us-ascii?Q?bucPRWUtr2TXzSwYKigOAX/D2tpnoYuFVJUdPF8RHJ50pN2Tv7n25HaXjq7u?=
 =?us-ascii?Q?OeAa4MDJFx4iaSc+9yrJ6IE+c1xFBJTDbAA/FhKpNmPrdUl2CQ783BMEX8bq?=
 =?us-ascii?Q?edNAzjnZwxo5b9unpGNcCs2arc5CUINYoujXe/ZRl929AWaWCtI/8hAXV0Go?=
 =?us-ascii?Q?jUeLXUY/1QLsWbGC+3nWDc0k9tUYFggIEO6DiG7xxRmlam8oDWep/pkvX5k+?=
 =?us-ascii?Q?PLQcAkoLawaeoi77paiRfpWqTrGzHTYx6c3IlMduF/bLtvA3pwrec5eww8L/?=
 =?us-ascii?Q?U/sMkg6ENy1hKJ61tEOJeH7mTNFNcRb48BgKqhezg/ag0CuM66G9yCWi4LHv?=
 =?us-ascii?Q?4wjnj4nfGszE45Bfzn1aTN+bJYgRkhvpvI6JNkKk+Mh/T6I7D4ViwGvj/4xP?=
 =?us-ascii?Q?WixbdtqIHQrt7mhWZspoLE0T0ve933OtP3pHlcEVriQ0krexgF2andTkDKaG?=
 =?us-ascii?Q?jIB5eAkwjSPZvsMFXQ8ksG+B0IDhn7m/Hp/lR57nVCVaAvdHpVwbB2KGxIeq?=
 =?us-ascii?Q?tZYo7c5faHUFH8eml4+oGuIXXj9d+VB8rTrW9gLNi0s4DVEdQemXuZcrcvlo?=
 =?us-ascii?Q?1rLv/lTR9Cygi2CEhZjKb0oyljQ84PQQBTZlMkSJacSWQwZrbuMN/n+pRwj/?=
 =?us-ascii?Q?WvIxgFTqY3BGGrLUN7F6jt3dP9NpFBCzPNLQle/1XUfeHbHZOAjTBUlxNyKG?=
 =?us-ascii?Q?swRNObZUgegQQcJnLiE9BaUdQTlVyOzdwuOC5hef?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR0201MB3497.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83e32ee7-9a1c-4b98-29f4-08dae97fcfa6
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Dec 2022 09:33:57.9613 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vFXDPMlIX3qsnJPzvRT90pdFIVqC+XhjzUT65luPT518afsVdZ7m4SCAMtykZ18YxuE6eoZqE4ojLi2tETuyfGEE4cBMv4W7/DM761NxMbA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR02MB7210
X-Proofpoint-GUID: nRILaZPGwBQ6NS8_dtgG3A0AZTd2bLC8
X-Proofpoint-ORIG-GUID: nRILaZPGwBQ6NS8_dtgG3A0AZTd2bLC8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-29_04,2022-12-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 adultscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212290079
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

Thanks for the review, Taylor!

> Good catch.  However, the "p" argument is also modified, so we need to mo=
ve it to
> the outputs list and use "+r"(p).  This will also require swapping %1 and=
 %2 in the body.

Ah, good point. I didn't account for memw(%2++#4) incrementing register %2.
I've made the suggested changes in v2 of the patch:

https://patchew.org/QEMU/20221229081836.12130-1-quic._5Fmthiyaga@quicinc.co=
m/

Regards,
Mukilan

-----Original Message-----
From: Taylor Simpson <tsimpson@quicinc.com>=20
Sent: Wednesday, December 28, 2022 11:07 PM
To: Mukilan Thiyagarajan (QUIC) <quic_mthiyaga@quicinc.com>; qemu-devel@non=
gnu.org
Cc: Brian Cain <bcain@quicinc.com>; Matheus Bernardino (QUIC) <quic_mathber=
n@quicinc.com>
Subject: RE: [PATCH] tests/tcg/hexagon: fix underspecifed asm constraints



> -----Original Message-----
> From: Mukilan Thiyagarajan (QUIC) <quic_mthiyaga@quicinc.com>
> Sent: Wednesday, December 28, 2022 9:37 AM
> To: qemu-devel@nongnu.org; Taylor Simpson <tsimpson@quicinc.com>
> Cc: Brian Cain <bcain@quicinc.com>; Matheus Bernardino (QUIC)
> <quic_mathbern@quicinc.com>; Mukilan Thiyagarajan (QUIC)
> <quic_mthiyaga@quicinc.com>
> Subject: [PATCH] tests/tcg/hexagon: fix underspecifed asm constraints
>=20
> There are two test cases where the inline asm doesn't have the correct
> constraints causing them to fail when using certain clang
> versions/optimization levels.
>=20
> In mem_noshuf.c, the register r7 is written to but not specified in the c=
lobber
> list.
>=20
> In misc.c, the 'result' output needs the early clobber modifier since the=
 rest
> of the inputs are read after assignment to the output register.
>=20
> Signed-off-by: Mukilan Thiyagarajan <quic_mthiyaga@quicinc.com>
> ---
>  tests/tcg/hexagon/mem_noshuf.c | 2 +-
>  tests/tcg/hexagon/misc.c       | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/tcg/hexagon/misc.c b/tests/tcg/hexagon/misc.c index
> f0b1947fb3..9b1604d82f 100644
> --- a/tests/tcg/hexagon/misc.c
> +++ b/tests/tcg/hexagon/misc.c
> @@ -189,7 +189,7 @@ static int L2_ploadrifnew_pi(void *p, int pred)
>                 "    p0 =3D cmp.eq(%1, #1)\n\t"
>                 "    if (!p0.new) %0 =3D memw(%2++#4)\n\t"
>                 "}\n\t"
> -               : "=3Dr"(result) : "r"(pred), "r"(p)
> +               : "=3D&r"(result) : "r"(pred), "r"(p)

Good catch.  However, the "p" argument is also modified, so we need to move=
 it to the outputs list and use "+r"(p).  This will also require swapping %=
1 and %2 in the body.

Otherwise
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>


