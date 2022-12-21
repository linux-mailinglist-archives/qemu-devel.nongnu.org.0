Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5143E653754
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 21:07:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p85MJ-0005z8-Ca; Wed, 21 Dec 2022 15:06:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1p85MF-0005yz-OU
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 15:06:31 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1p85MC-0000Vv-Ba
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 15:06:30 -0500
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BLK6Ql7015249
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 20:06:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=rPmYy8W3X7Ujh/x0TM0cWlwEg1WyEh5MVlwvR0cPw1c=;
 b=lLu5UP9byxNwxs2RRxfH+42zYqSD3KEvj8M4/bAKzYINBV4fyi4l4z1RpSe3duzmulrB
 JFRkK8WEvUhgvaCV3HaxQGEfQhu6GKyUe4DXxygEtck36jFbshvi+DCLmjDYaUh0YZ5g
 D4LuyDiPbRf5HO7FOTuDE9cDPQs1SNk6Go4uW6JBc2EgM+xshb1isq0PrhLsCGPNhZuo
 NKlHqQeGU1CjuuM4iT2sK91PDApCt9H28Beuu6I9IipzlogePKGxsDnSVEKxlp2fh2pX
 SNLkMGC9wz+pvzU/txt8LaYHokikY/lhQXCHkFsBZ+5+1hOXrClFWIwz+CkWBu4XYnQE oQ== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mk83xv90b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 20:06:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MNajIQIRySOn3j7z8K5l9VBEknhmj2oCxVgoJlNJV81wfbpB/ByJGhIwHs+cshR3h6hDo0ttKz9Xz9Iy9N6qXnEbu+jrNOjcySXrZ2ZdBhKZcBNm7sQE+8jsLuoWgZVh0rDU2yUgXD8abgNV+LHB0+3OXpgU7O7qdjdjTjih4QuKx0nJRbtt9YLml2jy1tTw+ILm+73Pij1hhhF2q9hOLuxrfE6FfwfqfVC7t7r4zTD9ujuIaWapIoRx2RKec777g5aW3AyG37MdhnATedamdhxC7GJLybkCBy/wLqs+mifdgGh2/bIlehX/KCGgBts1oiBD973G4K9LD9OiZIFVxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rPmYy8W3X7Ujh/x0TM0cWlwEg1WyEh5MVlwvR0cPw1c=;
 b=AYT/fEpwlVMIEWW5xms7BGHZGLG0Ck6oJxpGi4AG2c+mUCoXUB2FKMjgRax2WTdPJcsrNcs/GHNhkOhzcQdlamnVoVtqQ/c8s6s40cLDisOJgOpCE0bgg9CWvxEBxp8kmtqPi6TEqwHyBOXQwRWaVNQ6d/H/Gd2LY2KsKE0wdH8Pyebv3Ypu00vFKetY/TF6SxPSmf6PBp7RwPUEb3o3TbbHXRpqxVtfb8ZDfHTWXSr9mtm9jwPNu1hVViGEx460R8E1a5IviqQUc+EvinYEucrqu7fbJW+X2p2Ek1TCc7rvWxBP8p7BIzvkMzVpL8bTEU6/IyL4xTSFA4ZvmHuKxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by DM6PR02MB7049.namprd02.prod.outlook.com
 (2603:10b6:5:25b::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Wed, 21 Dec
 2022 20:06:22 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::8ba2:2429:9eea:75fc]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::8ba2:2429:9eea:75fc%9]) with mapi id 15.20.5924.016; Wed, 21 Dec 2022
 20:06:22 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Marco Liebel <mliebel@qti.qualcomm.com>, "Marco Liebel (QUIC)"
 <quic_mliebel@quicinc.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Brian Cain <bcain@quicinc.com>
Subject: RE: [PATCH v2] Hexagon (target/hexagon) implement mutability mask for
 GPRs
Thread-Topic: [PATCH v2] Hexagon (target/hexagon) implement mutability mask
 for GPRs
Thread-Index: AQHZEYmgaETO3gLL/E63G6kWSxoV8K51ZBZggANfLQCAAAYewA==
Date: Wed, 21 Dec 2022 20:06:22 +0000
Message-ID: <SN4PR0201MB8808170B90DA3A2E3819DADBDEEB9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20221216200345.831816-1-quic_mliebel@quicinc.com>
 <SN4PR0201MB8808811EBCD9471A2D3792FDDEE59@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <SJ0PR02MB764786AE5799B9372393A79594EB9@SJ0PR02MB7647.namprd02.prod.outlook.com>
In-Reply-To: <SJ0PR02MB764786AE5799B9372393A79594EB9@SJ0PR02MB7647.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|DM6PR02MB7049:EE_
x-ms-office365-filtering-correlation-id: 7d522642-8f47-4a2e-40b3-08dae38ed50d
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qVRX3y9vvl3+ZyOK6MG/jGDvk4RsoddXHjb68rVNIF5HDHJxYqIi6gyFtc6VTe5Vu4yo4402d4C/Q9pVIXzqvF4zKDmuz1lk7uuRXqwMr9jkQrXXT9kc0tl4sqf22xV3V0DtVXLXDwFEpdP5ABiuAsRBhbRLV+bJ6ia3YKkfhZmcI0pxRA0acohviMmwHpwN17epsdmj1+Lcov1d0+CGq7Y1pNhviv1UGlFmHKCG/Q2sUooPeHeSmgatsHWfjJtuEkP8/e5EMON90UvnLU7Nvf4Z0PBplSvFzlWuMmTNmfLHsXyhsUe+23DJtpF91baK2KGpSbnKCKqWiFCEDNlOJvZasz6mEwZOP6uTyeRVoevXPxnL1YjIZGuosRywvX6O6/1z8+2pTmzLYRi/LVgiRw0k0cUDP7fyKyDeJ7hhl96o9SEOV0PGxd/dJ8ScKBcBPwFGlyC2lY7FAB+MWeLM0uHH9RwB8B9g/Xd8AqdqJvrIZREpbLXGon0eaSbVZxwMgoqNvrMgNxJvvTqLSFsdSvGVx+x/N+Lb5FUWTGKqg4Gkugo31UmELDUdCXQtK9yzKO4Am7vqvb9c0TsfBFgus6rOuhRNWW2VZte80TJ1rUDfJnKGApVk541TPRQesIoWsdZYLkB2VgXipL80burvz0MlCQt+jC8cub5P2HLkT4qgH6fBI2EHPABrf359CGCk11PsjhiF0GdRCw9HOUGZnQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(366004)(39860400002)(396003)(346002)(376002)(451199015)(55016003)(71200400001)(38070700005)(83380400001)(122000001)(38100700002)(107886003)(33656002)(478600001)(86362001)(7696005)(5660300002)(6506007)(53546011)(186003)(9686003)(26005)(2906002)(66476007)(8676002)(76116006)(66946007)(66446008)(64756008)(66556008)(4326008)(8936002)(52536014)(41300700001)(316002)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Q52IJ2kraTnwBRgCk3LNmgA49dmGKvWVJLXuFYicwADadM1Ce1bF0j0efa48?=
 =?us-ascii?Q?4Ee5/ptIW/y7V8RS3bPzrYVyqpdjn2jazBCZA1mY6PnoINe6jxUQGKTs7GQO?=
 =?us-ascii?Q?CtExJX+wtBSwO/Q4EOl+95YBq1JhKIrA/Xg9OB7Gu5Pq+sZJ5DeDp+CItRqD?=
 =?us-ascii?Q?cXm1rWMG28s9FaXDZkeNq4UMpJEzrl6Mv04urVgUmkt4uAwvFpvoeEAw7RNt?=
 =?us-ascii?Q?1iO5FUIMPBYYRQMm1epR2SNH/OQbibdpkNNHJ6NyRWedxK7pcM3BpS7nFoUB?=
 =?us-ascii?Q?EJ88zaBpPnqLN1+A95Btwc2seoGjO8kxGDYPK8w8oXA2haJb7WQraUefnfCm?=
 =?us-ascii?Q?8s06Ae1QC0YslCMSvpSWZ7WW4fLhkCxJzagn4AJzZiCQxBVf921QOXn9nvTO?=
 =?us-ascii?Q?gmWIMA1QIleykQw2/9vHVyBZpZwjirJvdq2YIQbLJgwJ/BAkPx97e/UJxOsU?=
 =?us-ascii?Q?YG9xUdtIBOj6P70+6VxuYQ9m1OYIiKeVCIm/+wWTg2L8jdN5ayxPCts4OLxd?=
 =?us-ascii?Q?Z+1SaWFzf5JQIeMdwa1TlPS7J11sLRr7wW2Ai1JIeP+n1AB2P8ILR2zpIaNx?=
 =?us-ascii?Q?weunLLrTzRklAGQWcpyvugY8Pv5AYEM1r4pcZgyQ1NVKOmWWUsVwmDZsurne?=
 =?us-ascii?Q?DlRfKVqovjeMEd5CX1eCwM1DFgZjScdal0Y/Zq6S9FidpjD7pQwHe9dXWpUg?=
 =?us-ascii?Q?vtLJnbdlI9yHqZZBL5/bIFwWjMSkJ5MnGSHwUZP5d220whjuMqz2RLo/QPOF?=
 =?us-ascii?Q?/ENEfSSjHFZPsNpJz0XBDpox6Nk7AGK8EH6YHhj9qrXJTZWxJf3g0Rq8SH/d?=
 =?us-ascii?Q?+0HeVHzFgqdUiU9m+sETy5N8pKM9vL+yCwUndIHa/sx/0rv75FDQXjXicZxO?=
 =?us-ascii?Q?GeyfWqwzprTNbXiqYB3FVUluzYOFeSJw4dyp9oUXpkFqpyDjYHP/2YGXHMgg?=
 =?us-ascii?Q?V/EZC6ip4+OIxvfjJc4JQJGfB9LgeH9bCoR7MdhRDzxyn2XQm39+ONi0h2+K?=
 =?us-ascii?Q?X+CzRLWH3nHy/5XUTnYbAnKkWxZ4+TzvKpkErqqgdVQ2o49iFCmMlHGJIcd8?=
 =?us-ascii?Q?VshvBBdAhmPtro11NSIFQwMyJxdpKU54GAdrXqxR2MC8hJNPWmxMlvuQhFXG?=
 =?us-ascii?Q?M88S45scwb42OH82KKeSuSXxWgsu0WZ18RvCcWQ8jaizf9HiilWABUSB0Xo7?=
 =?us-ascii?Q?XFDYFUaO1P7uWGWr+UjncaoVlHcUQs37275q2nCVYAg4/CWb5QTsCIeOLeFh?=
 =?us-ascii?Q?DfYFFj3fWTve47kH2FiYaiV4U59NWMTQU9BJClcv64queSbKQTfK/ptva2xq?=
 =?us-ascii?Q?9pMlUFQBGdcOwS+vELTtMR/fM++hODIoJ3lFVRTHn3dWSA+O4WHRE/zdMPUO?=
 =?us-ascii?Q?omAzXvcObx+MOpEMmoPxkRLEKdSfn5BygYy7ga9EDIypSCVX+50jNGVLdK2U?=
 =?us-ascii?Q?Wt+wMDHn7Ga88mo0DHItuRZIhk0A2obWOaUVlQp1oQhGun5gI89yshOFmIZw?=
 =?us-ascii?Q?a5D6/sbiHzkuyqfhIRP+eKdYHgk+BoayHrSegG3J1nCIduCF/26zckLg2Hnc?=
 =?us-ascii?Q?hawK6wuvNW6jRMtFKooUH/Bp6lsu8bwcR7Alel2P?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d522642-8f47-4a2e-40b3-08dae38ed50d
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2022 20:06:22.5310 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NCnD1sksVoE+zORWVxg33KLU8CpZZUXQP7nsgqHMXgWeTOFeG2YjS9x1HRAj21knSZfX3c0iNZBE7mMp/P5xfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB7049
X-Proofpoint-ORIG-GUID: IvbhXyQzx1BLa-6EkgQ9aaLMLSScJSYj
X-Proofpoint-GUID: IvbhXyQzx1BLa-6EkgQ9aaLMLSScJSYj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-21_11,2022-12-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=613
 clxscore=1015 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212210171
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
> From: Marco Liebel <mliebel@qti.qualcomm.com>
> Sent: Wednesday, December 21, 2022 1:34 PM
> To: Taylor Simpson <tsimpson@quicinc.com>; Marco Liebel (QUIC)
> <quic_mliebel@quicinc.com>; qemu-devel@nongnu.org
> Cc: Brian Cain <bcain@quicinc.com>
> Subject: RE: [PATCH v2] Hexagon (target/hexagon) implement mutability
> mask for GPRs
>=20
> > > +#define WRITE_REG_IN_PACKET(reg_name, output, input) \
> > > +    asm volatile("{ " reg_name " =3D %1 }\n\t" \
> >
> > This is no different from the WRITE_REG above.  Instructions on a line
> > with no curly braces are a single packet.
> >
>=20
> Understood. The feedback on Brian's patch said to write tests that do
> transfers in a packet. Should I write some? (Just not in the way I did it=
 above)

Put some more instructions in the packet with the assignment.  I recommend =
a read from the same register and verify you get the old value.

>=20
> > > +
> > > +/*
> > > + * Instruction word: { pc =3D r0 }
> > > + *
> > > + * This instruction is barred by the assembler.
> > > + *
> > > + *    3                   2                   1
> > > + *  1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
> > > + * +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
> > > + * |    Opc[A2_tfrrcr]   | Src[R0] |P P|                 |  C9/PC  |
> > > + *
> > > ++-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
> > > + */
> > > +#define PC_EQ_R0        ".word 0x6220c009\n\t"
> > > +#define GP_EQ_R0        ".word 0x6220c00b\n\t"
> > > +#define UPCYCLELO_EQ_R0 ".word 0x6220c00e\n\t"
> > > +#define UPCYCLEHI_EQ_R0 ".word 0x6220c00f\n\t"
> > > +#define UTIMERLO_EQ_R0  ".word 0x6220c01e\n\t"
> > > +#define UTIMERHI_EQ_R0  ".word 0x6220c01f\n\t"
> > > +
> > > +#define C9_8_EQ_R1_0    ".word 0x6320c008\n\t"
> > > +#define C11_10_EQ_R1_0  ".word 0x6320c00a\n\t"
> > > +#define C15_14_EQ_R1_0  ".word 0x6320c00e\n\t"
> > > +#define C31_30_EQ_R1_0  ".word 0x6320c01e\n\t"
> >
> > Only the assignment to PC and C9 (which is an alias for PC) are not
> > allowed by the assembler.  For the others, use the normal assembly synt=
ax.
> >
>=20
> I used the regular names at first, but when running `make check-tcg` it
> generates errors. For example:
>      error: unknown register name 'gp' in asm WRITE_REG(result, "gp",
> 0xffffffff);
>=20
> Should I use them anyway?

Don't use the WRITE_REG macro because that puts reg_name in the clobbers li=
st and the compiler doesn't know about these registers.  If you use the WRI=
TE_REG_ENCODED macro, it should work - though you might want to change the =
name of the macro to WRITE_REG_NOCLOBBER.

Thanks,
Taylor



