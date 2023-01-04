Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFB965CE42
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 09:29:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCz8a-0002LZ-Dd; Wed, 04 Jan 2023 03:28:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mliebel@qti.qualcomm.com>)
 id 1pCz8T-0002LA-D4
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 03:28:33 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mliebel@qti.qualcomm.com>)
 id 1pCz8R-0006NP-3C
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 03:28:32 -0500
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3047WsBX013283
 for <qemu-devel@nongnu.org>; Wed, 4 Jan 2023 08:28:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=iT9vsbvtlukTtQJ1mEqyqrQIqQ4WG/itfxU2i8NgCxk=;
 b=pSmKck8FBV1sLoC8ynoihqTEFGMS4DMJv7hIySTUBlgM5Jzabe9iZK2TLgGGwXUED5Yv
 2pVcP5miYiJa5pNqxZy50fkjvUoFrzrQyZdVys5tKTaD2znJKBLtWYPWnKP1QjLq9GAq
 ORTirHCfqfODAZglq9uUoEeORJfRTCvh13PPSFLiuPj1nKzbARIYGalMr5n9HZ1Owtmn
 6O7Ec+HVIiBB9W/usnwZVgtYXddPBw8lTNY8Jq7ihhxVPDFXYrADVCMLtD2PcsMs89ZN
 imKaafCmRBe3jneLWL4bIapvvNeVeIPT+37RlcbYQQjyeiJ08gcC8LZ3FuDKlHZvgBy3 lQ== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mvsvwsb8n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 08:28:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RZTRfwYuImyvN5xWDjhpmTCN7tOVOU9IcItKUaLsrWTw6dd8ttE+6jkUfHKNg2oY2TxzOE04xVjFb2hPr9LUDHdkuFY0ZjCJq5t/mKRFsNSfYQAuZJvH0GzweB0VgTX2Sln7dHwAoYXqIx7VgXw989d8UT1KDuB4SQzzHzS75Sy9SVkheiFWA/HUvYBQ7VIMpQiRPxAp+li64RSq3O0fnbMWlovztiw45caa3aKKgrNaESM1/2j+kJ0gRIUWfYWL1V6p4QuvfgL68T0inzecy6f2uVQRgVhwpcZhhXOdIH7Y87dLK2PLLE3OeA9kVuZQfX/r6r2Wb5kXn+uXvBEefg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iT9vsbvtlukTtQJ1mEqyqrQIqQ4WG/itfxU2i8NgCxk=;
 b=QR+gApXjcVz1hLOLdRs54ZaO9y0NZe+NVMlPTM79DTrY80G1uG4hMjqLZK4zvDPAzrOrYpwVnnMCErW5cvTPvdWs64QG6RC01FpXRhBukf+vGJBLEf9KRaU+WAUxDjr15EJvy5fF8b0w9Kk6d7GFx95ByTWR8rbarthbs/FY06pRsVXXG+PBsNLQZjJlDca3rAQv5hElo/QkQ5rDwq/P1SfjUB381wUfZEqaKwByW26I8AWqHYwgEy3VInC4a8ReAsixr4Wx8Bl9w7h8AcoEsXZn7UHE88odv7USncJg4v71lTFBBh2iBDT+gO3RmflUCoPkhFKzjnr1pQzb7cYbNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from SJ0PR02MB7647.namprd02.prod.outlook.com (2603:10b6:a03:320::8)
 by SN7PR02MB9330.namprd02.prod.outlook.com (2603:10b6:806:34f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 08:28:22 +0000
Received: from SJ0PR02MB7647.namprd02.prod.outlook.com
 ([fe80::1c68:628b:cbf8:e689]) by SJ0PR02MB7647.namprd02.prod.outlook.com
 ([fe80::1c68:628b:cbf8:e689%4]) with mapi id 15.20.5944.019; Wed, 4 Jan 2023
 08:28:22 +0000
From: Marco Liebel <mliebel@qti.qualcomm.com>
To: Taylor Simpson <tsimpson@quicinc.com>, "Marco Liebel (QUIC)"
 <quic_mliebel@quicinc.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Brian Cain <bcain@quicinc.com>
Subject: RE: [PATCH v2] Hexagon (target/hexagon) implement mutability mask for
 GPRs
Thread-Topic: [PATCH v2] Hexagon (target/hexagon) implement mutability mask
 for GPRs
Thread-Index: AQHZEYmgHJLV4s+F90e9SSuelU8HKa51iwEAgAMhrACAAB+kAIAVOQkg
Date: Wed, 4 Jan 2023 08:28:22 +0000
Message-ID: <SJ0PR02MB7647024C2D36594D91FFD55194F59@SJ0PR02MB7647.namprd02.prod.outlook.com>
References: <20221216200345.831816-1-quic_mliebel@quicinc.com>
 <SN4PR0201MB8808811EBCD9471A2D3792FDDEE59@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <SJ0PR02MB764786AE5799B9372393A79594EB9@SJ0PR02MB7647.namprd02.prod.outlook.com>
 <SN4PR0201MB8808170B90DA3A2E3819DADBDEEB9@SN4PR0201MB8808.namprd02.prod.outlook.com>
In-Reply-To: <SN4PR0201MB8808170B90DA3A2E3819DADBDEEB9@SN4PR0201MB8808.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR02MB7647:EE_|SN7PR02MB9330:EE_
x-ms-office365-filtering-correlation-id: 93c9ed1a-415d-495e-00f5-08daee2da44b
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j3iuHjE9kuUbA8y3nWz3RREdvdd2SL0V+wN1pDek2YyIOo+Z8z8OUb4FVt+bM2VOw5Gw9oyxmhGXNZHQl9IDwhDEheDgOdhrLMobmULP+Oh/9/Bsg49eLugdvtjnLz6h6eypT/g+aFXKDP26CZ24yM7jQrfN2FczXtj80aEGLHpSruYlpc2u7dEi/bh4mfpwFn4yVQCzr+zh0RML9j2Sv1bTxKn/rVzHg0A0UHFBTez6n1SgJuvZ/Myos0GZ/78EpmTHagboojc04reP/isSQTqn6zZapRTCctDH2rR7y+wyH2+S45oayqw0sn5+9AfWeitwWFIFlH6yDInUGsIcn6VgHG9ifwiquXWyhTsj2/4q5jUpP6jNelQDA9C6d2IS6Ym3BCXD617VDzSoc10VQ1dWEoLcgjPiZkkQrEO0lTfzT8apWcVc76oFDDrFZLmWc2HhpnyU/Afx1s7fUZtG/HoZw5CWhXoCoEMpYvse2cQGfsgsMdhmaA6c+bPQjM7gD13ccQl5fJTZs2eB4NpSVy9+MniBPOikNvwtS79M4iXB8gozAzqpDerKIINNqMRnfawfIxwP7gI3bV0Ot6ASxWhkSJgqIVSZecQLIwI6V4EJY/mfTin6OdC6g87JBWePIEpxk148D7MxytTWkGw40Z0289pvjYTdi4Do8FNmvD9LKAIDFmZJGwwqRl8seDvW
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7647.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(396003)(136003)(39860400002)(346002)(376002)(451199015)(5660300002)(2906002)(4326008)(41300700001)(478600001)(8676002)(52536014)(76116006)(8936002)(66556008)(66476007)(110136005)(66446008)(64756008)(66946007)(316002)(71200400001)(53546011)(107886003)(186003)(55016003)(26005)(9686003)(7696005)(33656002)(6506007)(83380400001)(122000001)(38100700002)(86362001)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YQSA9qKgrJ9nW3CrVslg1++De87gtq1jdfHl2mnbr5GbvtNcf9dIbbgdVJZO?=
 =?us-ascii?Q?yEEGfFLmjjtxnNiPEk/rnz6ZBlFMD1SRq+XDmt1JcyC6P82cQCLR7wocvGpk?=
 =?us-ascii?Q?pcyKlVlnFy6XMNOYKRoR/FUcabK21+vRPH1FgTjenovkbdUvG03P0Ilb4b06?=
 =?us-ascii?Q?Ubq0zoW1RyOnf9OTSeezUeJzAS9c8wUdmG29rUeizPeYjMNlh1uMNVrg47iw?=
 =?us-ascii?Q?sGyeV3OfaP66w1D2mTmTT1gw3vYTrJNeffZA3QyNrIIs7MJW8gvgNmo5Q6Pa?=
 =?us-ascii?Q?7oX/4x5oMjwcLC1XeyPoKnGIU1ViYf6aoUFfxT1+kOKxauGdsi2n2mZyHio1?=
 =?us-ascii?Q?ZgAqrvVtwkJiU9nTVhwZ3sxzGZBDyjxhAT8kIro4vmqXfVpzoWqqBmFJmdLX?=
 =?us-ascii?Q?4PZhA/einxXg8WeMHg6NXokrT7KQSVzOb1pcvJd47s5trDgBdaQLQsiwibvL?=
 =?us-ascii?Q?ulCgWdk2+jAnWJmaywSOsR8V2h9jBQ16h/gkU12p7iYg6OjfDb7+5Tu9bGlq?=
 =?us-ascii?Q?H3xoAryrbmlBzRtbGb9CRZ/jDFwZRmaQQrjkPmRxO6FedNa/ZodD8wR0M8Ei?=
 =?us-ascii?Q?1lPTM1mud1Wk1lp3foIBasqKmb8/DC0hxpbvrPHI//NVfzHM+cYaxaxgSfVx?=
 =?us-ascii?Q?nQpq2kpU+LjMBTWE+4w7EE4TCUacDEAvGi2H8D3wD7Fsj+F54kHYgF3QZcWJ?=
 =?us-ascii?Q?QIQzrMNf1liXS9hRXby62zRPpIBtO+2ZzHlPFxBmC4Wu9Cy449fSnfBgzGqy?=
 =?us-ascii?Q?laSUu3Rr3z+BngSEt2RXvWsTXjBCqNn5oMS90M1TJNTnO1kES7eQwwMf9qtj?=
 =?us-ascii?Q?dkj7DG+PC1vwTkXkhvEGS/Uls/IbcVA6EJucTOTInu0f+IQLGo91hY0UfC4N?=
 =?us-ascii?Q?A2L0nF9qsLhQXmX6ZIPpU5VKrU/t3QdU5slfmU75h1b0kHtIl9+1goIa/ymZ?=
 =?us-ascii?Q?4ZiUCNNdq5bln+3LZkG+cQF5PdzxpzaMw53lxn7h4fbbTJ9NhKpH7wjM6Hme?=
 =?us-ascii?Q?iX1wPOJPy/EZ9o05cOS25sFH4HddL24DJw/H8rqCrY9FbQDvy+g+owb0Vc11?=
 =?us-ascii?Q?T5UmaI02f9g9apWUAo2w2kzyC4KDNLvTNuiRtDcKJfAGfaXGr87Ptl4fJxzz?=
 =?us-ascii?Q?srunWpIPX8KAAwofmeeEC4M33G0IEFa1N+ytgHs1TRe/jRErIPhkDRAt4NaF?=
 =?us-ascii?Q?2jQNQB4Jruiw00brSqZM3J1sLx54NYtiBunS72iBAk+w5kbTd2N0AporHTu3?=
 =?us-ascii?Q?KdK8Hscz0B3+LyrMv8/PuOZqamJ5zJGXlK65fKTR95VqDxjUYpdNdFq6LmSG?=
 =?us-ascii?Q?p4qWCeIeM45cB0kS82KW/zpZ2sufds/uOXVmU69nHY2gbNwZ8KZAfnL0oP48?=
 =?us-ascii?Q?9KdnyEFVYo7hx67m4/syfZDQfSVDEVtSRVY9GyEe8beWhpkS7UkmIxLlcTt9?=
 =?us-ascii?Q?5LldKTSvV1TaYneq+YLiLYTXSbVDj0Q21lMrc4NfKsKwcz9OfD8vveEaZsxn?=
 =?us-ascii?Q?jQdOz0n9ZFgfPCHVkfV7NoC9yOHq7C1dOVWLINJaM0nioiGzAP3sb2O7OgOe?=
 =?us-ascii?Q?qgRdfbEzuAcneAi3t8cX/KtY4YoXahVwgeAm+lXU?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: mmaiJ03N99unc0rsAvHqpwc5WFA9QKO3t5cpLpM63TOOXEA9ItYYLJAN3kWLkORmhl/n8IP8LM16wiNUe6nBKpNwChxLjBpsDAiFS8dFyXOQcRejuswZwBJCY7jfrL0bh+iGHBAy75WxvrZJUXPHlcvUFpg5/2sZE9zb2+8MIyCFR+n8sC7fsrO0FMZXnMSAAyAJxpRzEW+L6s3ZX/cu++RjQVyxg/KwhEQqSHV3fPvpYOTmaLIQlO0pkqXinld8LmeQevX931ly3If2ioZUo8bL8Ofpk72TUAd+1IXR4qCrDkaSh+DwYjMvVJwv7rbxofbc5i7oZhD/4JiPETD49/nuoeEmCtBiWbjbcnNDXi8j1kEX29U6UloiWu4MAS8Z6Y03Vo2XsxseoFY3rKSAknLxYdNUFFm2znbiNepMThTZKaLpMIrhrxccP46a507D+6MVaf9CVD2ofJJEoknNoEs6u/xQSE86k7PHVpHuMJHXUY5Vuh//ixBhN5SqY4u3dY5NaAKyIr71wO+Y+71WdCdEtHo1yBPn0tIXjel/s4xF5HrcF/ZwXB2H3bEu4a/TspYrEA62mmSzcP7dv2g119qfMf553/WmgCQeNEcIIS0tRGYGkYteL/3uStSEmcN4wnuMBf7zAue+hLLgiNmEmG+C82xFcNtW+EAmOxvbMDJk5lGjM6lIKpm4zBQNgBVl6DknDo1ujwfjAKTBNHSwWppw6xPcDaDCBEOHJU2f/w9aLQ1Wob9Hb8nt7CUplVJNKoB05obXeQVoOWFtpIJQpQ==
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7647.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93c9ed1a-415d-495e-00f5-08daee2da44b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2023 08:28:22.3508 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FFgZ9hTwQZvx9LsjnpgFkiKYvOT4pmhlfjmkdxaOCw0uYcpS8uEgirvYp79h9MhNzx/xDxAvTqnhB6nImboWOayIuv85DfXbi5Et4KQnNeM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR02MB9330
X-Proofpoint-GUID: QlafcS0Ei28qbAgZuoM6MWRoMn_yQn30
X-Proofpoint-ORIG-GUID: QlafcS0Ei28qbAgZuoM6MWRoMn_yQn30
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-04_04,2023-01-03_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 mlxlogscore=672 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301040070
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=mliebel@qti.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
> From: Taylor Simpson <tsimpson@quicinc.com>
> Sent: Mittwoch, 21. Dezember 2022 21:06
> To: Marco Liebel <mliebel@qti.qualcomm.com>; Marco Liebel (QUIC)
> <quic_mliebel@quicinc.com>; qemu-devel@nongnu.org
> Cc: Brian Cain <bcain@quicinc.com>
> Subject: RE: [PATCH v2] Hexagon (target/hexagon) implement mutability
> mask for GPRs
>=20
>=20
>=20
> > -----Original Message-----
> > From: Marco Liebel <mliebel@qti.qualcomm.com>
> > Sent: Wednesday, December 21, 2022 1:34 PM
> > To: Taylor Simpson <tsimpson@quicinc.com>; Marco Liebel (QUIC)
> > <quic_mliebel@quicinc.com>; qemu-devel@nongnu.org
> > Cc: Brian Cain <bcain@quicinc.com>
> > Subject: RE: [PATCH v2] Hexagon (target/hexagon) implement mutability
> > mask for GPRs
> >
> > > > +#define WRITE_REG_IN_PACKET(reg_name, output, input) \
> > > > +    asm volatile("{ " reg_name " =3D %1 }\n\t" \
> > >
> > > This is no different from the WRITE_REG above.  Instructions on a
> > > line with no curly braces are a single packet.
> > >
> >
> > Understood. The feedback on Brian's patch said to write tests that do
> > transfers in a packet. Should I write some? (Just not in the way I did
> > it above)
>=20
> Put some more instructions in the packet with the assignment.  I recommen=
d
> a read from the same register and verify you get the old value.
>=20

Reading and writing a control register in a single packet isn't possible,
because CR instructions can only be executed in slot 3. I was thinking to
put a nop inside the packet, just so the packet gets generated. Or is there
something else that's useful, other than reading the previous value?=20

