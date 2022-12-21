Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 845C86537C7
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 21:50:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8613-0007Uq-NV; Wed, 21 Dec 2022 15:48:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mliebel@qti.qualcomm.com>)
 id 1p84qs-0007IE-Fh
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 14:34:06 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mliebel@qti.qualcomm.com>)
 id 1p84qq-00036y-Og
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 14:34:06 -0500
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BLEUQ43020958
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 19:34:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=QORGoSG18g+SrchH+sr386LED6/qAcm0hmZ9B/hzvr4=;
 b=eOJNiwQPWLoJk3kMxXqhKUI1w75EHY3OHhtYwcMxF2hpqXj9mcQ1mMvRaXPNTsaC8cFc
 Z3opjRgGFVpFEDfAwt9Jh6K2Ausax6z2wHumShKCL3pxVrx7Qrgg/pSSjQsE9GJGeVPq
 xUDbSn8MWwNq7hT14V02S/YElDvi/rTDbhXJrdRHwIDNA3W6tqJ63Qex8WMowJv49h1g
 SegQI9p0e5FASez7QG50QVd9sTgeN+YKNsjrurhZdHIhcaSSOSPeAH8zISwMcV3TEzyZ
 ZMJ92VRDKXtVuEpMrt/dSz3oawwjX5W+z33GMdCx4uk4yuKhyWS16f50Pv+R1qoTdBaX Iw== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mm3cjrr4f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 19:34:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DdbKGFckVDRye52gvsz4pAMRKyYOZaM59pYwjeEcwXNKItjZmME3CvOUZsxgWwEG1/Js26hhpdAq1HToynPrk71si2nL+1Wq6DI22lVecAxlAnMcBq5+p0iDrus01M3VM3jvu1iBonx7shtvKEWjc3caW5qJHWA25YKffJzUJJIRPmjuUoJpABmS6sTt0A+K2S2Z1dem4zB8SQfyHQABY0XU46+kxBeWZhHV3wE71JBwNretsdZDsbNan3MBOIYeebZlL/Z24WhFoGmL4kwh5m/+84NXmgaaUppjlfJf05zkl8IrbRjnxIsLct7FXaGB7OYTPDJ+ORnOz9ttqT46Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QORGoSG18g+SrchH+sr386LED6/qAcm0hmZ9B/hzvr4=;
 b=AbdBMUyfVnusYkQJUptVsRRSsjWGOOyhxIG9OE/Py/r1LhUz1qpdIuG/KkibFVt+G13mMMWjJtbyJaqZpOoBYKChPDhoWNGYQy3k3jT7fyZSuFqTS5vd7LhjDa6Rrpg8ePnOB5zwmuJBf5sLZU2DPHvkU0dGU+SzVPk8ntlP7kDdAKoCQdySpXiG4xRcIiaiy/FMA+IGUfYwOqrIGbGQlGqI8S5Ly2ROGRTAfCoWAoc10L28y/p3RGM64AOJKoKyjRpEHF8HObt7DZys/G8kQNbHv0zOoiw7zS+698Tm4Jw2VnpIQ/Er8Ua0+RoBPNSx4+P1dF1UMZ2d3B2/dc69kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from SJ0PR02MB7647.namprd02.prod.outlook.com (2603:10b6:a03:320::8)
 by PH0PR02MB7111.namprd02.prod.outlook.com (2603:10b6:510:9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Wed, 21 Dec
 2022 19:33:59 +0000
Received: from SJ0PR02MB7647.namprd02.prod.outlook.com
 ([fe80::1c68:628b:cbf8:e689]) by SJ0PR02MB7647.namprd02.prod.outlook.com
 ([fe80::1c68:628b:cbf8:e689%4]) with mapi id 15.20.5924.016; Wed, 21 Dec 2022
 19:33:59 +0000
From: Marco Liebel <mliebel@qti.qualcomm.com>
To: Taylor Simpson <tsimpson@quicinc.com>, "Marco Liebel (QUIC)"
 <quic_mliebel@quicinc.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Brian Cain <bcain@quicinc.com>
Subject: RE: [PATCH v2] Hexagon (target/hexagon) implement mutability mask for
 GPRs
Thread-Topic: [PATCH v2] Hexagon (target/hexagon) implement mutability mask
 for GPRs
Thread-Index: AQHZEYmgHJLV4s+F90e9SSuelU8HKa51iwEAgAMhrAA=
Date: Wed, 21 Dec 2022 19:33:58 +0000
Message-ID: <SJ0PR02MB764786AE5799B9372393A79594EB9@SJ0PR02MB7647.namprd02.prod.outlook.com>
References: <20221216200345.831816-1-quic_mliebel@quicinc.com>
 <SN4PR0201MB8808811EBCD9471A2D3792FDDEE59@SN4PR0201MB8808.namprd02.prod.outlook.com>
In-Reply-To: <SN4PR0201MB8808811EBCD9471A2D3792FDDEE59@SN4PR0201MB8808.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR02MB7647:EE_|PH0PR02MB7111:EE_
x-ms-office365-filtering-correlation-id: 1389e32c-81a2-4128-d0bb-08dae38a4ea1
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VWVqNsEvcrsovQph2NtOTGSk/E0nePzOf2Io+8TPYlxbDlentYZQo3HKw51ionDsIAEfzki5P5nLbFHZPwiIY9csTC82vKyHKMf2NJan5G7SsaQpGbaW9leW83pga0zP/vFRrjy7aNuZ1ECez5EE2WBs46fMXN0JGTr4mYEx8tPFP23a33QjnVo1uVAdmRy0ErxEAqebnhhthQVV/3kkW2E/7w5QyVH997PTEsIVok/sD+0LtXLhYPJrH/C3qGzdtDtX/ZUgWQNMCaCOM4oufyhVRWRfGMYoqhJN4muhQZb7kxxIBQe+Jby4HU7Rd0c0B9L2Q9BzmiP7UqnKDPu6iNZaNWCGa+xIPSHoE9v3W4U6JoeekUKfNMpF3X3qOBZo0DamY4xCRi3KC2hteXJU9KBkVd751thG7wpmjXvwxP/Ln2Ie0asRFeArqXghqdCgCX/M9zrnUUiQb5UaziIVzfTb7pVRkgHjIP02HAR53uAqTSmoyqS0edZDg9HgxGFU3uNFIt9hQuRhWkgEz2XmY2dOilc/Ffn7ilFqV4lJDUqmHoMqASvqzVnD29VZZLnTjZiCDfqIRUGEX8xdjsgPTwS8xAkAMtpH8r8jRo+gn5P1cLxHt1nz6bKnNlmjVVqC+Z2pLspH5jgYEwA0YqDzy/2XWt8jL0Mm5PgDWRZtAb8pMoYGoMVZbJJicHdfPr5c8j6OIwsegOSmpaQNCWoJIg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7647.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(39860400002)(376002)(346002)(136003)(451199015)(55016003)(33656002)(4326008)(66946007)(76116006)(316002)(66476007)(66446008)(8936002)(64756008)(5660300002)(478600001)(52536014)(66556008)(71200400001)(6506007)(7696005)(8676002)(107886003)(41300700001)(186003)(86362001)(26005)(9686003)(38070700005)(110136005)(122000001)(2906002)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?EOre2GYqdC4dILYYLxmoXweAKho3HFUnQlhMSEQosVPbooLaXiNgEqwauJGg?=
 =?us-ascii?Q?uTvZElDDx9g5fMvng8pJUbivujOUe4K19YtxghSWPRCiXTRzY/XvevKkA/HQ?=
 =?us-ascii?Q?vAtZR8D6gDq1y1vhROJQJT8eabQ1F5bzwNJB3nhkIagr1PPthCoMqpKalTXC?=
 =?us-ascii?Q?r+MSOXR4R51GwTVUBjM2CmKcI60bCXxaocJ76ZJgHC4ocmynSoRN6llVhz2W?=
 =?us-ascii?Q?cIGqWcD00+xahSzc2ZShbtedVVv+GAKWM9c4xlF0CKCDhmGVzGfo4zVL/vdC?=
 =?us-ascii?Q?m4zPMKMN1ozcC1+rhM4Bvt2YLwqkR83ud5OuNlR512Un8O4MFmMhoVJg6I5x?=
 =?us-ascii?Q?xyvAXP/ABid7PMu0oUR+dbNlj61i7RrM7dBBrrrU996FtyMjrI5lx8soWtBZ?=
 =?us-ascii?Q?lJVfJEGRgw7T9A62/HWRczRbso5+2YbTboZ6TEKtaLA/ymDAWVQbtz9IKx08?=
 =?us-ascii?Q?uhGxMzZnZZh3WVB8Ijv8HjODZjyNTCkH7jrWQUMUKywaWqFZ0S94rsZpwNlm?=
 =?us-ascii?Q?abMST1UCFufb142FncFDPsl2zY03b5Q2dtgf6e2D0BF6OpqGti/AwvpRqsAN?=
 =?us-ascii?Q?OpP2dtFQNrtTDWuiHqYgNgtK16yhnFyWq+Vr9UbhC57T2jeTrC21i4ZzNxmh?=
 =?us-ascii?Q?NtuhDN+zH08qIpzuR8IbMSCorCUS7aFRrOq1nlds94w16IFmKdAqMn4IjW00?=
 =?us-ascii?Q?Mt1gS3+8+VAUwkVxyzkYqBmmqs4x4U7jtFzgupoSDugBJD1/iU8UofD9uhVQ?=
 =?us-ascii?Q?Gc6SOKrnckxjQzyuyFL9KpZSbs/kwBCuUkQ6v0JCcol1ls+7wwCW53dM2/Wy?=
 =?us-ascii?Q?YwRe2Yfdu6OK08t8qSaJib6I3ee8p3HRJotVfSCmkq2so5UeBwEfQivBHpdD?=
 =?us-ascii?Q?m8XKUCNNeC5GElr3QJCfUtn2RbN4PmqizrtJdULoswaxGOud+Ue3rAp1gWZC?=
 =?us-ascii?Q?yPjnpntFzSprUOhDHSSPJw0lxJFEYWO3yokyzsx3TlWf6ItJOZO94KnJ8Kv9?=
 =?us-ascii?Q?aFP5cptUWpnE/X9g/FcOBqzU67E4W5haB1h5iUjjXw7XkcJ2oHzGT8xDH1mN?=
 =?us-ascii?Q?aylV7sTNfoTUVoluQB2O8cNxt1iMt4kMdudBqHab2UMzrlFhPAsguS/dwDtm?=
 =?us-ascii?Q?WPbfGdJ8XvtlPvYjyDN3ctaRSIqwk8H122f3CTMDdMwxVY+eTww8dsqEzPGE?=
 =?us-ascii?Q?CD8IGXqvP0ZXkNNMWUnNyoaIbRJlZUpV1M3/+QqyCXM7yA59obivBlooWiJ6?=
 =?us-ascii?Q?9WQq6Zc94HvGtAHjcg1L1UYTrfZkWGhERmisEUrChxGJ5WrCNAi7UGq7TK3c?=
 =?us-ascii?Q?pSXxFNq6xwh3y7E6eYfmTx2KG0Fn6psbwcvarP/pqyAxBhTMo57OGk2BP+j2?=
 =?us-ascii?Q?3DNBW+692Cl4WcYq2C4oEXEc5o5tI2hZha/hJDmclJxpx6roGT01gnKhpPAf?=
 =?us-ascii?Q?nulSfFShPwWRcVZRpt0cKBEmsRw5Q5d5aMsUJJ3wIaM8GktebXrK3dHFA0MV?=
 =?us-ascii?Q?Wve1IudcJCl4F+o1oCyrYKSr649g55OalyzEK+2HCLa2g8D06mhSRUml39qh?=
 =?us-ascii?Q?pBkUcBlHisqKPgotV9hw6GLGSnxWc48pEheetfG8?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7647.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1389e32c-81a2-4128-d0bb-08dae38a4ea1
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2022 19:33:59.0097 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 49yVeAqD5fygtVUNqurBgEc5opcu+wr2PZIYGAYy+18xc0RE46xhzSeUFY5zRIXpkcE4q1QfxwyWoPDtgQe22IdFwEUINYCshaJ1lQqGNxw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7111
X-Proofpoint-GUID: M2dYSpvGI2yKhoOpfYB1wD7kkyWsVSja
X-Proofpoint-ORIG-GUID: M2dYSpvGI2yKhoOpfYB1wD7kkyWsVSja
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-21_11,2022-12-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=578
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1011 priorityscore=1501
 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212210166
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=mliebel@qti.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 21 Dec 2022 15:48:30 -0500
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

> > +#define WRITE_REG_IN_PACKET(reg_name, output, input) \
> > +    asm volatile("{ " reg_name " =3D %1 }\n\t" \
>=20
> This is no different from the WRITE_REG above.  Instructions on a line wi=
th
> no curly braces are a single packet.
>=20

Understood. The feedback on Brian's patch said to write tests that do trans=
fers
in a packet. Should I write some? (Just not in the way I did it above)

> > +
> > +/*
> > + * Instruction word: { pc =3D r0 }
> > + *
> > + * This instruction is barred by the assembler.
> > + *
> > + *    3                   2                   1
> > + *  1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
> > + * +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
> > + * |    Opc[A2_tfrrcr]   | Src[R0] |P P|                 |  C9/PC  |
> > + * +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
> > + */
> > +#define PC_EQ_R0        ".word 0x6220c009\n\t"
> > +#define GP_EQ_R0        ".word 0x6220c00b\n\t"
> > +#define UPCYCLELO_EQ_R0 ".word 0x6220c00e\n\t"
> > +#define UPCYCLEHI_EQ_R0 ".word 0x6220c00f\n\t"
> > +#define UTIMERLO_EQ_R0  ".word 0x6220c01e\n\t"
> > +#define UTIMERHI_EQ_R0  ".word 0x6220c01f\n\t"
> > +
> > +#define C9_8_EQ_R1_0    ".word 0x6320c008\n\t"
> > +#define C11_10_EQ_R1_0  ".word 0x6320c00a\n\t"
> > +#define C15_14_EQ_R1_0  ".word 0x6320c00e\n\t"
> > +#define C31_30_EQ_R1_0  ".word 0x6320c01e\n\t"
>=20
> Only the assignment to PC and C9 (which is an alias for PC) are not allow=
ed by
> the assembler.  For the others, use the normal assembly syntax.
>=20

I used the regular names at first, but when running `make check-tcg` it gen=
erates
errors. For example:
     error: unknown register name 'gp' in asm WRITE_REG(result, "gp", 0xfff=
fffff);

Should I use them anyway?

