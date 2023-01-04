Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D94A565DF55
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 22:52:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDBf8-0001pU-7S; Wed, 04 Jan 2023 16:51:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pDBf5-0001pM-0n
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 16:51:03 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pDBf2-0004l1-U9
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 16:51:02 -0500
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 304Le6Cf001084
 for <qemu-devel@nongnu.org>; Wed, 4 Jan 2023 21:50:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=gopMHKCuEYGWqh5ojcStxLiR9q1+uq22NdFhVLjLXfQ=;
 b=jprQ/uyH3qCWDU9PrC/Kp8RXAIlj/vcngrLNO61453KPzUpXkFLdGqpzjU0X04/OIYoF
 9hKIRLpslbZgo9ztNbGUpZA9TINYK5S+s0JMEMawnj7kigW102vIOddhmQEkqHqFWGhC
 hA4EVWQHHQosHsXkPNiKKXTEMzjNsa7uTXiGR7YQRp76aFHSaCa6vIVBIYoCVZMmp6bL
 kPKQxXlE7pyeIGjeYUOqG9RLCXxNv+A0j4EN/mRbi9X0GTOQW24tRY0bH+0ArdqiE7yV
 tDeravk565iyEc4dONpB2jtixWXcId2Hm5hTTEE2y42a0UyDJRJPu/dJ3VF/1hXs20Of vQ== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mvsvxtwtt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 21:50:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bZZ0n0kWYnixpGterS5riUBFDkD5R+kT/+g6FaSmALblk7RNVajCZk6NT5Tt3p3P9328AGBGmXrLkpZfZBZ+MJgkCaNC5cTOemVnE+h4L66BWH9905OXRp4raRC6K5eXxbhRAwLksQenxzGne33zvS26QpsiCuDR1LvmczzCnjT5AeMFm/aDw0FFMs/mUvjpQh2RBpi1FqoJF+VTmp4u/6U5ibkwxsbAjdncPW8VhJWaoFyHstxMvs6klK/te+EzEXHFnSNiMh0s4K07XrawoSAKGA3gVq4d5CXx5iqZL+N2bnh7yT+6Bc9TBkXCNIVkcAIBbBJNvfzkenO03yR2OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gopMHKCuEYGWqh5ojcStxLiR9q1+uq22NdFhVLjLXfQ=;
 b=UhQ7jqUQOQn4E5/nPREtxnMrB6J6oCvgy2hwk8Whu//lturJt816jwvHXhs3c7UKseQ5g3SfURA79EQIswwpcPRLjirygDRb0WxTHmD8TkHMzt29MuFq7d9mhv1CB13GF/f3XGFLmAZJrUwuHJUjnLH1e80kb2KX7AuQPAtSmYWXSANS935iHMAbk0dKsVc1kv5JF5N2cMOreLbvvHlxA07zqRZmL5IuDYx1o4MTWrMrhf3w29bEOIK5IzibzHYecwXYtftqILMDA2mI7Snea2QDoGecpCQ1Ro/vQdOZkVKhjX3zOav5d3e4/r5SOc8a0BvlpoRRyijL0Ambjt0KLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by SA0PR02MB7274.namprd02.prod.outlook.com
 (2603:10b6:806:e8::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 21:50:46 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::8ba2:2429:9eea:75fc]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::8ba2:2429:9eea:75fc%8]) with mapi id 15.20.5944.019; Wed, 4 Jan 2023
 21:50:45 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Marco Liebel <mliebel@qti.qualcomm.com>, "Marco Liebel (QUIC)"
 <quic_mliebel@quicinc.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Brian Cain <bcain@quicinc.com>
Subject: RE: [PATCH v2] Hexagon (target/hexagon) implement mutability mask for
 GPRs
Thread-Topic: [PATCH v2] Hexagon (target/hexagon) implement mutability mask
 for GPRs
Thread-Index: AQHZEYmgaETO3gLL/E63G6kWSxoV8K51ZBZggANfLQCAAAYewIAVQI4AgADfw2A=
Date: Wed, 4 Jan 2023 21:50:45 +0000
Message-ID: <SN4PR0201MB88084DD73F91AE634E538FF8DEF59@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20221216200345.831816-1-quic_mliebel@quicinc.com>
 <SN4PR0201MB8808811EBCD9471A2D3792FDDEE59@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <SJ0PR02MB764786AE5799B9372393A79594EB9@SJ0PR02MB7647.namprd02.prod.outlook.com>
 <SN4PR0201MB8808170B90DA3A2E3819DADBDEEB9@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <SJ0PR02MB7647024C2D36594D91FFD55194F59@SJ0PR02MB7647.namprd02.prod.outlook.com>
In-Reply-To: <SJ0PR02MB7647024C2D36594D91FFD55194F59@SJ0PR02MB7647.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|SA0PR02MB7274:EE_
x-ms-office365-filtering-correlation-id: a672db1f-e468-44a1-38af-08daee9dbc17
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uRyjptwhpCYJ7HrXP1/lmCJXRGLjElGU4R7tqpQNQynJX3+t1W4xuzAWtknZkluUKct+M43BTERRDoHL2siF3B57xFpsYV4CDHP2eU5PvGqVJV1m7N1FCENLM9pUuDW+PFxSSDK58D8z9WWbMgYYglxcxlAHYwj1Hw9GNexLkQNhOQIb1BJf3YkIBrGICKq7tLi+YgBmhIsnOXvWAkAZ7Fklv9JWjrNZ1mZ4LzbrQ3s6FLKnEfCGjvnGoPPtziJw5OFGEd8F0yno57tVJJv8OPc/qF3xgacoXkkbFLp/zUsI3cAb+Yj3Ibb8db/EA0VzVuxKdpSlE1cieBKd3MQykNIT0c5GBwCki+pVzsQBqpgbtAEkJV+r9dOfs1NYFn1B0JI3rRHvdroeTm+wLl5RRN4XpdMDaHwdm2ChwyJKZPwtuwzuWLwAR646t53zuwrY687DblR8sUmofLUbBZNvdbTuSXH72gsrWuOKiPn8JTIZeP+jxJy3hM6PJru4UUlB3fiBgeU3o4+hWs7DjCc0aehWkRgFMtMLApzzWO+WVRHQkCb7tc1pJh+0OyQ1zAZ30NTLGap3muIKtFiwy81LonjwaURrVgd+QkI6WJgW77dPWMcJzXzXW/eXufsEX5Tm5X0EwJgpjWCFxBvwtF/V7eNVdEo8DOmAPHk3+5RqthTT6JVncAnTBoS2kIac95y7kfq2hOBFWF9IH8Gf13bxPQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(366004)(39860400002)(346002)(396003)(136003)(451199015)(8676002)(76116006)(66946007)(66556008)(66446008)(4326008)(64756008)(66476007)(41300700001)(38070700005)(316002)(38100700002)(2906002)(110136005)(86362001)(5660300002)(122000001)(71200400001)(33656002)(83380400001)(8936002)(55016003)(52536014)(7696005)(6506007)(53546011)(478600001)(186003)(26005)(9686003)(107886003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XIbnNM97SGnFvr1JjlGP8mWJeCFe5DY3isHrGYYNlbqG6BbXTkFeiMaStdFW?=
 =?us-ascii?Q?OW0yjAR1WMPdyGO/9f4D+n/G+AoJdwT2Zg8+EvJzi0ldstzzB5DlMfr2eUfn?=
 =?us-ascii?Q?Q8c0vH0sYSieEqa6NjUJI8Jv4C1bWfL7SxxMetwai0MlaezLDANU5L1oHvH0?=
 =?us-ascii?Q?dGFaW5AapUxO93DIciUQYHdBVuNl5ZZh1NLjcqf7k6i9xcwAPOfDcITCbGPY?=
 =?us-ascii?Q?6SeEu1Oc5Q7i0g+9YCY8Ib/OQoQtmhbuc39woko7skiGGC6CsR5Rf6hyPvBC?=
 =?us-ascii?Q?jwl0wfEH/Ys7lz7veiU/W3+hZcq5AUT4G4GzBwOAuO+JIfmTcuLzmwkDtBw2?=
 =?us-ascii?Q?R0jVhSA1PVh2VnI/aCgJ3eGDcDrEStlrHF0zLGigOxtsDzMGUs++bYCOMJah?=
 =?us-ascii?Q?uqZhad++KRthZMV+B6kpT8iJzqghmiQHGbJKm6ltSp37yAJmAJWUxHF/Kuqk?=
 =?us-ascii?Q?9psvhh3mN+j2YcmyXuzBAd2K5vBqBz/gxDgpGlBMNR65EyUjvNMsbZJy4fCx?=
 =?us-ascii?Q?YXp+EiPqs7ZKQ41T7kipe71JYj6gQZ49WcAYBVYPnN0RzG5XgYxqZ4IcxwZf?=
 =?us-ascii?Q?GXHH+5/clJlcvEQ3blLxMCYvmraKDvefNmMUrKVUGwoiOq3K3KgNl36JqOx9?=
 =?us-ascii?Q?tYMu//w85X9gYIVN01NGi3VtUIvVJl4W3qJ30jJbGupHO96cyXoaBcZk5ktX?=
 =?us-ascii?Q?Vk3o1ymHhi07lUFOTw+xkjp/i1TW2F1vwLEesLeQfnk/WtsrqdHt8SSr0VgZ?=
 =?us-ascii?Q?XJhzjN7o9SY+kwY4IC5JabT1B87/dFIZhbG1sgNnURN47vcivHiGUqP2pEFU?=
 =?us-ascii?Q?t07BlmLB407knlxDWG1SSVqBADYWfvRs3h/QOMK3KF93iCUZqiRku0d4mmH3?=
 =?us-ascii?Q?auJGupcX7JQvLxVnMa0N22l8btVvpVU9kZFEsLSDN6iJuL+8lKx9Kon57H7G?=
 =?us-ascii?Q?6HahUoJRFkf4pvkInwyYFrhhdwPFlp4dBrflQosjmkvBAvaJUGDkTwqp5zqT?=
 =?us-ascii?Q?11ljhSZ8NjXgbScSMw+3xVniuu+w3pYiU8+jn/xZCK+Lf+wEyfKcZysCOz4F?=
 =?us-ascii?Q?BJPecpCmXSPijOAsNdEAlbB3JQ/kRxeOcszbG6UY+Hb/yMRAXDDO17YNkFQy?=
 =?us-ascii?Q?yX9TdeF0StEWgcLi8YCE695I8/gRbVRCHqHyD70xSi5Ps1J2W+G3Gefms4gJ?=
 =?us-ascii?Q?LO1thLoa0K98QAbOfOmHqkcUHWXmAmT+xRfGPoPRM59my0yU2etD4McZAAnk?=
 =?us-ascii?Q?qFDK6wndct1fIer7m4uZqRnccTlU5modj4fDj9e7il9xphwjDz9aXymkbC4R?=
 =?us-ascii?Q?1DkK9Vfm264dDLZiWPG2vbDN4bgFg02ZFww7Vj/MV+UuKd3JauTOPw+lCXN2?=
 =?us-ascii?Q?RW+Y4iapWIXJXpCytcSuKN6IEDMAM/ySM2jrBVY1WNI86fOve6AmMyR7v9YO?=
 =?us-ascii?Q?DszZd23cnP67zMC9ScIlIOekzv5HhhaDwGgGmHhumwUIiCBCikwC0Zweydl7?=
 =?us-ascii?Q?ylVk7aY9uTkbDhAQHtIqKaaw0DcuO5j2xxLgDKpq71kWslO5EbMrQ3ZeUxEm?=
 =?us-ascii?Q?lk0ENzj+pxqphZVHTD0lEJXkNcK5z94W/wmhVSK4?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: j8fY3CnTySgcnjnEFHhDKdC6Yoeopjxg3kLrRuKKsAPqVT7hkWcDdnj1avBNfd+cEtjJryl/ABfJnxORmWNlMbm0TPUuI/SXnRlrnn7Y3DEs0F04DMJv5KzsmHk26InSWWr8ldmKAeSBfa7/KEKEmMheONitdW+LHmvbdp3jafCyoY9cl6O0Ea5csP1IP652BLc23oMs9fJc4yB4Y2ldg8dE8QXTmUMBJMizfp2romuhfoO7D3anz3Yu5KhtA2EmI7A6G/rO1ZORfY9SkKtyB3UWwhARla820Y9AitADsoRbxJIRArYijSGbXN7P1eC1zH2hlBTBFSifH8wP7LqHdhkcKzXS2y/EB0Ni13Gie/rCpzrMDcLbPILXofH6dkUdZAtCpviHycXQsoYruSw+kKN7ZCugG4bOYSPSOxVH+oPDmwIVa4p8mmT/cBj+Ib3Wr0InAMr7V6HBe4wvGGaT1dtUERDFaCHGT8CgiXYwmWa2ssxs8p/PD7GCRLcJVbRDTKB+lb6JELypuSuN7yVUk8+5uakZI8pGby4PKTraoFZ65iqMPNyjEg/waGcIMHoxe+uhML0lbShtzFB1dSQKIIZMGDSU1wVY5Y9mIJUeVu3LPiRiYC7WeOvpunMOiQZh8inDcR1ZPIFMevyjOR8T0ahWUpDWIL+SxDuDMU+6NXZ4hmRy+wPW/VR/mHKeA054PbVLiyjaVzvGDvqQUkQiBJj5M0noPuE+VDf+MUEh5jgTsn4O35tf70qZdCbVZYbCUJejU3YSfSli0AIJm4bdEA==
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a672db1f-e468-44a1-38af-08daee9dbc17
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2023 21:50:45.8948 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U/udYH25ozDTCGUsUMpKsTEuineDE1JoeV8P9tMvZ9Kx7nO4v7/SMF1ay+k5agsBpXj1Xbd1eijlyfGykdarGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR02MB7274
X-Proofpoint-ORIG-GUID: cGzTDuZA-ILMqUD51Ukgk7pRKpuAgDod
X-Proofpoint-GUID: cGzTDuZA-ILMqUD51Ukgk7pRKpuAgDod
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-04_07,2023-01-04_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxlogscore=528 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301040177
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
> Sent: Wednesday, January 4, 2023 2:28 AM
> To: Taylor Simpson <tsimpson@quicinc.com>; Marco Liebel (QUIC)
> <quic_mliebel@quicinc.com>; qemu-devel@nongnu.org
> Cc: Brian Cain <bcain@quicinc.com>
> Subject: RE: [PATCH v2] Hexagon (target/hexagon) implement mutability
> mask for GPRs
>=20
> > -----Original Message-----
> > From: Taylor Simpson <tsimpson@quicinc.com>
> > Sent: Mittwoch, 21. Dezember 2022 21:06
> > To: Marco Liebel <mliebel@qti.qualcomm.com>; Marco Liebel (QUIC)
> > <quic_mliebel@quicinc.com>; qemu-devel@nongnu.org
> > Cc: Brian Cain <bcain@quicinc.com>
> > Subject: RE: [PATCH v2] Hexagon (target/hexagon) implement mutability
> > mask for GPRs
> >
> >
> >
> > > -----Original Message-----
> > > From: Marco Liebel <mliebel@qti.qualcomm.com>
> > > Sent: Wednesday, December 21, 2022 1:34 PM
> > > To: Taylor Simpson <tsimpson@quicinc.com>; Marco Liebel (QUIC)
> > > <quic_mliebel@quicinc.com>; qemu-devel@nongnu.org
> > > Cc: Brian Cain <bcain@quicinc.com>
> > > Subject: RE: [PATCH v2] Hexagon (target/hexagon) implement
> > > mutability mask for GPRs
> > >
> > > > > +#define WRITE_REG_IN_PACKET(reg_name, output, input) \
> > > > > +    asm volatile("{ " reg_name " =3D %1 }\n\t" \
> > > >
> > > > This is no different from the WRITE_REG above.  Instructions on a
> > > > line with no curly braces are a single packet.
> > > >
> > >
> > > Understood. The feedback on Brian's patch said to write tests that
> > > do transfers in a packet. Should I write some? (Just not in the way
> > > I did it above)
> >
> > Put some more instructions in the packet with the assignment.  I
> > recommend a read from the same register and verify you get the old valu=
e.
> >
>=20
> Reading and writing a control register in a single packet isn't possible,
> because CR instructions can only be executed in slot 3. I was thinking to=
 put a
> nop inside the packet, just so the packet gets generated. Or is there
> something else that's useful, other than reading the previous value?

You are right.  Let's move forward without any packet tests.  Sorry for the=
 confusion.

Taylor


