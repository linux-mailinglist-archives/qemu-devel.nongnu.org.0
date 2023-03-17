Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4FB6BE033
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 05:39:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pd1qQ-0001Xc-MU; Fri, 17 Mar 2023 00:37:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=244014cdc6=guohuai.shi@windriver.com>)
 id 1pd1qN-0001VX-Qb
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 00:37:32 -0400
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=244014cdc6=guohuai.shi@windriver.com>)
 id 1pd1qJ-0007X1-D5
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 00:37:31 -0400
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32H4ahJN026537; Fri, 17 Mar 2023 04:36:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=V0RDksr1/rLlqOuCevFT8pj5DWitLJD1aVcAkAPVUwQ=;
 b=K6AWYb5TyDe1ou6ZuXmURf0l+uPI2y1kgNMYqSe6VNLJzdQlFgjxpf2H95r8uW8PbjdD
 6yZdjePhvHfHvpjotSzxQJyVsnNvFMaLOB5i6pUCGIoAYwrIZSYHyUJCi6Kz54+TTQSN
 +KFxR/aTcDzJBIGcQarTTOHc7MRPcu7Ycu2MdAK7VfB/T8/QoE1V3kocF6K6wrhiGnPb
 hb+nw0faCVUBrXJK09yh3e4S8/JSfSLuLvgXC9AAQWxMfbBdMlpbeQdE35gemVED4btx
 O5oU9v9m30RvsJ5lmI0ingTQD+XcVc+sGqiN5VTl4zqUYdphAmZgdgkaP+zQ9i5mG8UP 5A== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pbq1h9b45-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Mar 2023 04:36:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LbIAr+z5OyVtmZRn9QqZAG7VSU1EjJlnMd96jMU9C8JeRQzmgA3HzuJJ/IBp4hmV+qHRlczsyA6elyEgbQipaPadmCllWzBAnwpWd8lR4unfQH4Lw6TOJweh9mk64/bK6phXEfDc9YWYy7L+XaqFJFVZC1uKqa4XyRoAMANFAGvkcMijL404YfgxulcD9W9hz0Efw2szYPvocrCKeDrW3p4ja1G0Ks4/5cuAME/xZH3voV7iMkeFigWYYZyIElyD8j1iBtzFvdnUq9inEpFDvjXdXvSG9PdGkpF0TVBBfbow4+qM3UZlyaOb8ajIs9xnphWdBT1fPsREBhx08SQqPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V0RDksr1/rLlqOuCevFT8pj5DWitLJD1aVcAkAPVUwQ=;
 b=Q4TB10IrYhS3HhT+pYKUsp68Ca9UFYg6/MhJq8TGbPT8ourm1ve8YkdErvqHUxfcabBjitaxIxZRhCjInms4BLMH5vMZEQ0cQW3WEj8ENz3Xl5/6NZNgvsyjcQuOtEhOQZ1kgSJ1w2ODTz4XXO/iLxugfMe0uAzLNZ2IYpQtwcUBmo6TCH12Si8901SWL3Ror0A0foHNzEkig7G5e0MAo5XM6UFP6BXAb+CJV9oUpcDL13M0IknfA0rykdBepJWfjj4RVR7FgXNRIRnO8gwZvran16TjVDLpx/J8opdkBX+FqWWKqjVn265zvoo8bsv2PPl7fGYAbQPn4TI3aNqlrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MN2PR11MB4173.namprd11.prod.outlook.com (2603:10b6:208:137::20)
 by SJ0PR11MB7703.namprd11.prod.outlook.com (2603:10b6:a03:4e6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.29; Fri, 17 Mar
 2023 04:36:37 +0000
Received: from MN2PR11MB4173.namprd11.prod.outlook.com
 ([fe80::2d69:6276:f527:9fb4]) by MN2PR11MB4173.namprd11.prod.outlook.com
 ([fe80::2d69:6276:f527:9fb4%7]) with mapi id 15.20.6178.035; Fri, 17 Mar 2023
 04:36:37 +0000
From: "Shi, Guohuai" <Guohuai.Shi@windriver.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "Meng, Bin" <Bin.Meng@windriver.com>
Subject: RE: [PATCH v5 04/16] hw/9pfs: Implement Windows specific xxxdir() APIs
Thread-Topic: [PATCH v5 04/16] hw/9pfs: Implement Windows specific xxxdir()
 APIs
Thread-Index: AQHZRRNNU05mDRm7PkmKbsZ8rLhVIa76k4AAgAA4rsCAApgMgIAABkcQgAESgkA=
Date: Fri, 17 Mar 2023 04:36:37 +0000
Message-ID: <MN2PR11MB4173971C16C358073A949C28EFBD9@MN2PR11MB4173.namprd11.prod.outlook.com>
References: <20230220100815.1624266-1-bin.meng@windriver.com>
 <1922294.e5CzDnASyn@silver>
 <MN2PR11MB4173F2F6DEDE4C2D07AD444BEFBF9@MN2PR11MB4173.namprd11.prod.outlook.com>
 <2201939.iVmW86lLxn@silver>
 <MN2PR11MB4173F6A077C963E1C5149CF8EFBC9@MN2PR11MB4173.namprd11.prod.outlook.com>
In-Reply-To: <MN2PR11MB4173F6A077C963E1C5149CF8EFBC9@MN2PR11MB4173.namprd11.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR11MB4173:EE_|SJ0PR11MB7703:EE_
x-ms-office365-filtering-correlation-id: 4f566566-2260-400e-a9eb-08db26a131fe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5HrCwhxZ7MQQWlUaAvxFtTEDbbjXa6BRYHhf2JGgrSxV74FV02Z3Y0bPlntQ9LTgOvzDmrDCjc8SFY4U5ReqBVV10hMmedqh9HwczZR+ujFbYCnaQsdr0xRniry8tEQsgtsfg5nkD3VuurYXZAZlSoDTfluNTUAENxJ1PfNAFvNJi46ZtBwZRH7F6jnvMAzG6w+Sy/NgZXJ7SMC80mEwPzg1eT+O8uSveQOfsGRxH6gmtn6mUIVsuGJhm73MmDwPOivhl0e5rrFkVNa2T3t2+XG3Y4H0jKYjoS2nEGgDdqjWlq/430KJ0j8INQaVrdk2r8BDnC6RI7lVs4Gip9wGNYS1j275sM8nzTMYmCXZvIvV+zXh0+jUDJTCTEiDxjnJYs8sQ/MNV51pxD+nnFFxnYGwMCNwmNu+NnNYWLji/+KLd3H/k9KGSicHzBG7fs8lMjDwmzMou/Ujg5DYw4Lm9Y3ZVJKRZGayHb6kh6TEPgx42FJBCkliqSFmOVr3iVtt8X2aySQi2JHzzDNo+/CD5tBswXXKmkwD+idcguX1IzZs57FJpUom/nXzM9CQv5Sd4GXIDp+vY1X06J7aqo3ObUAsax1K3qbOxyuX+Xmz+N7bEvQQuLN2XBHjh6cIKZVoUQA4MmrhqFeCPIWthetKKNSjlCFwtn6OYTiIydSQxfBofDQ5ejrwdZWNWz5P52rEGTlTqre5stgrIyHbNtHiPg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4173.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(376002)(39850400004)(396003)(366004)(346002)(451199018)(66476007)(52536014)(478600001)(8936002)(41300700001)(30864003)(5660300002)(2906002)(38100700002)(122000001)(38070700005)(86362001)(33656002)(71200400001)(66946007)(66556008)(66446008)(8676002)(7696005)(64756008)(9686003)(76116006)(55016003)(4326008)(107886003)(110136005)(186003)(316002)(83380400001)(26005)(6506007)(53546011)(559001)(579004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xk0BaVBW6X/8DYhgyRQ8kE8mtVWYNj4OF9jK4ujWv5qJkZuLjm73b18y5+E+?=
 =?us-ascii?Q?UWp+6iEei1ykSwhhvR83b2/i7IUGqLbX9RsHPZQc4HL7hJVWW1y24ojXo6Gm?=
 =?us-ascii?Q?+rkPlwN6/RXhDB1AZG6eeEcrUWCfs/R//Rk/XsH4sNFyRTQ1pyeJI/S/gojO?=
 =?us-ascii?Q?YGzV9OeGgmdmN4hq4bcV1MSiXPD8zlnEg8kyGAdUNK+09setbKDjuHJsPjYS?=
 =?us-ascii?Q?XqBTWNds0lkT8+1BbxYKJZLAR5QcsWB3m0Ni+GuzfpsU01+O73SZQJN+2RPe?=
 =?us-ascii?Q?LwOU2AVgL1rRhXpQkDUwIqvSj16vzeIvcZ5HRrTkw2NMjYBELcIIVfIcg7Ej?=
 =?us-ascii?Q?b718z0ThP4mRceD/oRO8uqmcoNwBLySDMzPNRznbrtdb6A+SaRxTPr5psdZ7?=
 =?us-ascii?Q?5RzYJDM/yIh8fkLNbQJB9+DbPrChoWBLVDLGUOaDoLCK1mjcRaQGraEDVKRG?=
 =?us-ascii?Q?IYu19v6nYpp7oBxSrtahhQwGZtE8O6k6UhzdO0RaSRpptOEOiRZ5GgAvKlCx?=
 =?us-ascii?Q?tccO5SCUF8/ZUDwpZmgJh4JIrPSblngGaEDmQ2y7lQw8BPdNBHD8BJIF+qcE?=
 =?us-ascii?Q?wpn2NUtUtFsodzmYHJBFcl8xhs14m4qU+moqZgCECua5JmnQ1et5tfcEld9a?=
 =?us-ascii?Q?UlqMFO1eDggkcKkMuVS91BPgN5KlOG0HpXgb0Vduwvq1ebxoJI5UTppxYrM7?=
 =?us-ascii?Q?b6D0rV9PlFGjrerE8yTgTmr72nACWyNvkHi7sjkjKVZktItniZeQRi8e9diB?=
 =?us-ascii?Q?imssH5s7lBKh7nB0Jh7wfeAETtPfWhZ2PDTvF1e4a3Tzp7gQEvqLMElRIYHG?=
 =?us-ascii?Q?69Gg8wJJsOPMuUcytvpHK1OZZkUVmz9xHiCqrG2chIshV0gXSC8ySvE6+i/F?=
 =?us-ascii?Q?Uk4GOKCL7XgjvZhhlTGpTkIw6xOSbcywOp00fqFdWWyhjIxgqfAOWnSXf9CK?=
 =?us-ascii?Q?4aE4CapY+MfNXVf+blyAQshY1vRmT6LxJNW4MalBgHEXHhT1vDSF5oiXUOJe?=
 =?us-ascii?Q?snHtzB1E6c+bg9NGwBUCweqbejaNCk0CfVR1op5J6uSdY56/NbmivAFWmlkl?=
 =?us-ascii?Q?KzEpE7nFdNLCk95v6Id98rEJK+5ecAfnZVzlO9S25SGogzXj1SmuqO5/YIH7?=
 =?us-ascii?Q?Av1aHuRNZ/OVFumw5dHCwq5xo91k4bc3ZITnY72cNMjuMlczNVbSGq6/J+NQ?=
 =?us-ascii?Q?0tXJt5ms3fV8O+UfIqzle4NE7CtlDWlhWr4H5JbsUO/qhq0/cbcSBfXzdR9t?=
 =?us-ascii?Q?Ldzrcn0rJ99PwNTB7vXDdPXOs0/Ni0apRlmr8yZUGdnoq4M2pQMfQrrHXYb1?=
 =?us-ascii?Q?POCSBhWIl9eEu+4722aHTWkXr/JRDREpgq7aQzLMpqpHEX83g3K0fJ5VAxU0?=
 =?us-ascii?Q?4N3W7MMKlUrMe1rvZZcsEP2AbvSqn2S6qB3ohdP73v644vQrOfRJ122vrr+a?=
 =?us-ascii?Q?Jx2YwqwPk2PmSK/oXH0xWy1I9Ht89ACDxvQWcSdvyXGuqW1iuHXIC8zHToAR?=
 =?us-ascii?Q?8pyeOe7RLXJidPRyhUA10TeTw0Ha6qh3WPe6B0jb9RPzZKelVoOX5tnrsfCp?=
 =?us-ascii?Q?DTL/TiG47KTbAPhmu9CBas+3+4LIsqfzXWrIMIw2?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4173.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f566566-2260-400e-a9eb-08db26a131fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2023 04:36:37.2795 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AuMEy2eq6CUTEuY5ycBe7uAIH+Bat/HL1OQXEjODyh0pxiVJjqwXYVQcphdxlPgjd0+XCTXE6krJfB6KSRt0y4YxJbmx2VfjnVqygbeQZrM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7703
X-Proofpoint-ORIG-GUID: h138_-w9QgGX4ZHItYKOxiQcThbZuJiU
X-Proofpoint-GUID: h138_-w9QgGX4ZHItYKOxiQcThbZuJiU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-17_02,2023-03-16_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 clxscore=1015 adultscore=0 mlxlogscore=999 impostorscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 mlxscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303170028
Received-SPF: pass client-ip=205.220.178.238;
 envelope-from=prvs=244014cdc6=guohuai.shi@windriver.com;
 helo=mx0b-0064b401.pphosted.com
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
> From: Shi, Guohuai
> Sent: Friday, March 17, 2023 01:28
> To: Christian Schoenebeck <qemu_oss@crudebyte.com>; Greg Kurz
> <groug@kaod.org>; qemu-devel@nongnu.org
> Cc: Meng, Bin <Bin.Meng@windriver.com>
> Subject: RE: [PATCH v5 04/16] hw/9pfs: Implement Windows specific xxxdir(=
)
> APIs
>=20
>=20
>=20
> > -----Original Message-----
> > From: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > Sent: Thursday, March 16, 2023 19:05
> > To: Greg Kurz <groug@kaod.org>; qemu-devel@nongnu.org
> > Cc: Meng, Bin <Bin.Meng@windriver.com>; Shi, Guohuai
> > <Guohuai.Shi@windriver.com>
> > Subject: Re: [PATCH v5 04/16] hw/9pfs: Implement Windows specific
> > xxxdir() APIs
> >
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender
> > and know the content is safe.
> >
> > On Wednesday, March 15, 2023 8:05:34 PM CET Shi, Guohuai wrote:
> > >
> > > > -----Original Message-----
> > > > From: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > > Sent: Wednesday, March 15, 2023 00:06
> > > > To: Greg Kurz <groug@kaod.org>; qemu-devel@nongnu.org
> > > > Cc: Shi, Guohuai <Guohuai.Shi@windriver.com>; Meng, Bin
> > > > <Bin.Meng@windriver.com>
> > > > Subject: Re: [PATCH v5 04/16] hw/9pfs: Implement Windows specific
> > > > xxxdir() APIs
> > > >
> > > > CAUTION: This email comes from a non Wind River email account!
> > > > Do not click links or open attachments unless you recognize the
> > > > sender and know the content is safe.
> > > >
> > > > On Monday, February 20, 2023 11:08:03 AM CET Bin Meng wrote:
> > > > > From: Guohuai Shi <guohuai.shi@windriver.com>
> > > > >
> > > > > This commit implements Windows specific xxxdir() APIs for safety
> > > > > directory access.
> > > >
> > > > That comment is seriously too short for this patch.
> > > >
> > > > 1. You should describe the behaviour implementation that you have
> > > > chosen and why you have chosen it.
> > > >
> > > > 2. Like already said in the previous version of the patch, you
> > > > should place a link to the discussion we had on this issue.
> > > >
> > > > > Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
> > > > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > > > ---
> > > > >
> > > > >  hw/9pfs/9p-util.h       |   6 +
> > > > >  hw/9pfs/9p-util-win32.c | 443
> > > > > ++++++++++++++++++++++++++++++++++++++++
> > > > >  2 files changed, 449 insertions(+)
> > > > >
> > > > > diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h index
> > > > > 0f159fb4ce..c1c251fbd1 100644
> > > > > --- a/hw/9pfs/9p-util.h
> > > > > +++ b/hw/9pfs/9p-util.h
> > > > > @@ -141,6 +141,12 @@ int unlinkat_win32(int dirfd, const char
> > > > > *pathname, int flags);  int statfs_win32(const char *root_path,
> > > > > struct statfs *stbuf);  int openat_dir(int dirfd, const char
> > > > > *name);  int openat_file(int dirfd, const char *name, int flags,
> > > > > mode_t mode);
> > > > > +DIR *opendir_win32(const char *full_file_name); int
> > > > > +closedir_win32(DIR *pDir); struct dirent *readdir_win32(DIR
> > > > > +*pDir); void rewinddir_win32(DIR *pDir); void seekdir_win32(DIR
> > > > > +*pDir, long pos); long telldir_win32(DIR *pDir);
> > > > >  #endif
> > > > >
> > > > >  static inline void close_preserve_errno(int fd) diff --git
> > > > > a/hw/9pfs/9p-util-win32.c b/hw/9pfs/9p-util-win32.c index
> > > > > a99d579a06..e9408f3c45 100644
> > > > > --- a/hw/9pfs/9p-util-win32.c
> > > > > +++ b/hw/9pfs/9p-util-win32.c
> > > > > @@ -37,6 +37,16 @@
> > > > >   *    Windows does not support opendir, the directory fd is crea=
ted by
> > > > >   *    CreateFile and convert to fd by _open_osfhandle(). Keep th=
e fd
> > open
> > > > will
> > > > >   *    lock and protect the directory (can not be modified or rep=
laced)
> > > > > + *
> > > > > + * 5. Neither Windows native APIs, nor MinGW provide a POSIX
> > > > > + compatible
> > > > API for
> > > > > + *    acquiring directory entries in a safe way. Calling those A=
PIs
> > > > (native
> > > > > + *    _findfirst() and _findnext() or MinGW's readdir(), seekdir=
() and
> > > > > + *    telldir()) directly can lead to an inconsistent state if
> > directory
> > > > is
> > > > > + *    modified in between, e.g. the same directory appearing mor=
e
> than
> > > > once
> > > > > + *    in output, or directories not appearing at all in output e=
ven
> > though
> > > > they
> > > > > + *    were neither newly created nor deleted. POSIX does not def=
ine
> > what
> > > > happens
> > > > > + *    with deleted or newly created directories in between, but =
it
> > > > guarantees a
> > > > > + *    consistent state.
> > > > >   */
> > > > >
> > > > >  #include "qemu/osdep.h"
> > > > > @@ -51,6 +61,25 @@
> > > > >
> > > > >  #define V9FS_MAGIC  0x53465039  /* string "9PFS" */
> > > > >
> > > > > +/*
> > > > > + * MinGW and Windows does not provide a safe way to seek
> > > > > +directory while other
> > > > > + * thread is modifying the same directory.
> > > > > + *
> > > > > + * This structure is used to store sorted file id and ensure
> > > > > +directory seek
> > > > > + * consistency.
> > > > > + */
> > > > > +struct dir_win32 {
> > > > > +    struct dirent dd_dir;
> > > > > +    uint32_t offset;
> > > > > +    uint32_t total_entries;
> > > > > +    HANDLE hDir;
> > > > > +    uint32_t dir_name_len;
> > > > > +    uint64_t dot_id;
> > > > > +    uint64_t dot_dot_id;
> > > > > +    uint64_t *file_id_list;
> > > > > +    char dd_name[1];
> > > > > +};
> > > > > +
> > > > >  /*
> > > > >   * win32_error_to_posix - convert Win32 error to POSIX error
> number
> > > > >   *
> > > > > @@ -977,3 +1006,417 @@ int qemu_mknodat(int dirfd, const char
> > > > > *filename,
> > > > mode_t mode, dev_t dev)
> > > > >      errno =3D ENOTSUP;
> > > > >      return -1;
> > > > >  }
> > > > > +
> > > > > +static int file_id_compare(const void *id_ptr1, const void
> > > > > +*id_ptr2) {
> > > > > +    uint64_t id[2];
> > > > > +
> > > > > +    id[0] =3D *(uint64_t *)id_ptr1;
> > > > > +    id[1] =3D *(uint64_t *)id_ptr2;
> > > > > +
> > > > > +    if (id[0] > id[1]) {
> > > > > +        return 1;
> > > > > +    } else if (id[0] < id[1]) {
> > > > > +        return -1;
> > > > > +    } else {
> > > > > +        return 0;
> > > > > +    }
> > > > > +}
> > > > > +
> > > > > +static int get_next_entry(struct dir_win32 *stream) {
> > > > > +    HANDLE hDirEntry =3D INVALID_HANDLE_VALUE;
> > > > > +    char *entry_name;
> > > > > +    char *entry_start;
> > > > > +    FILE_ID_DESCRIPTOR fid;
> > > > > +    DWORD attribute;
> > > > > +
> > > > > +    if (stream->file_id_list[stream->offset] =3D=3D stream->dot_=
id) {
> > > > > +        strcpy(stream->dd_dir.d_name, ".");
> > > > > +        return 0;
> > > > > +    }
> > > > > +
> > > > > +    if (stream->file_id_list[stream->offset] =3D=3D stream->dot_=
dot_id) {
> > > > > +        strcpy(stream->dd_dir.d_name, "..");
> > > > > +        return 0;
> > > > > +    }
> > > > > +
> > > > > +    fid.dwSize =3D sizeof(fid);
> > > > > +    fid.Type =3D FileIdType;
> > > > > +
> > > > > +    fid.FileId.QuadPart =3D stream->file_id_list[stream->offset]=
;
> > > > > +
> > > > > +    hDirEntry =3D OpenFileById(stream->hDir, &fid, GENERIC_READ,
> > > > > +                             FILE_SHARE_READ | FILE_SHARE_WRITE
> > > > > +                             | FILE_SHARE_DELETE,
> > > > > +                             NULL,
> > > > > +                             FILE_FLAG_BACKUP_SEMANTICS
> > > > > +                             | FILE_FLAG_OPEN_REPARSE_POINT);
> > > >
> > > > What's the purpose of FILE_FLAG_OPEN_REPARSE_POINT here? As it's
> > > > apparently not obvious, please add a comment.
> > > >
> > >
> > > If do not use this flag, and if file id is a symbolic link, then
> > > Windows
> > will not symbolic link itself, but open the target file.
> > > This flag is similar as O_NOFOLLOW flag.
> >
> > OK, got it, thanks! But please add a comment in code that describes thi=
s.
> >
> > > > > +
> > > > > +    if (hDirEntry =3D=3D INVALID_HANDLE_VALUE) {
> > > > > +        /*
> > > > > +         * Not open it successfully, it may be deleted.
> > > >
> > > > Wrong English. "Open failed, it may have been deleted in the
> meantime.".
> > > >
> > > > > +         * Try next id.
> > > > > +         */
> > > > > +        return -1;
> > > > > +    }
> > > > > +
> > > > > +    entry_name =3D get_full_path_win32(hDirEntry, NULL);
> > > > > +
> > > > > +    CloseHandle(hDirEntry);
> > > > > +
> > > > > +    if (entry_name =3D=3D NULL) {
> > > > > +        return -1;
> > > > > +    }
> > > > > +
> > > > > +    attribute =3D GetFileAttributes(entry_name);
> > > > > +
> > > > > +    /* symlink is not allowed */
> > > > > +    if (attribute =3D=3D INVALID_FILE_ATTRIBUTES
> > > > > +        || (attribute & FILE_ATTRIBUTE_REPARSE_POINT) !=3D 0) {
> > > > > +        return -1;
> > > >
> > > > Wouldn't it make sense to call warn_report_once() here to let the
> > > > user know that he has some symlinks that are never delivered to gue=
st?
> > >
> > > OK, Got it.
> > >
> > > >
> > > > > +    }
> > > > > +
> > > > > +    if (memcmp(entry_name, stream->dd_name,
> > > > > + stream->dir_name_len) !=3D
> > > > > + 0) {
> > > >
> > > > No, that's unsafe. You want to use something like strncmp() instead=
.
> > > >
> > > > > +        /*
> > > > > +         * The full entry file name should be a part of parent
> > > > > + directory
> > > > name,
> > > > > +         * except dot and dot_dot (is already handled).
> > > > > +         * If not, this entry should not be returned.
> > > > > +         */
> > > > > +        return -1;
> > > > > +    }
> > > > > +
> > > > > +    entry_start =3D entry_name + stream->dir_name_len;
> > > >
> > > > s/entry_start/entry_basename/ ?
> > > >
> > > > > +
> > > > > +    /* skip slash */
> > > > > +    while (*entry_start =3D=3D '\\') {
> > > > > +        entry_start++;
> > > > > +    }
> > > > > +
> > > > > +    if (strchr(entry_start, '\\') !=3D NULL) {
> > > > > +        return -1;
> > > > > +    }
> > > > > +
> > > > > +    if (strlen(entry_start) =3D=3D 0
> > > > > +        || strlen(entry_start) + 1 > sizeof(stream->dd_dir.d_nam=
e)) {
> > > > > +        return -1;
> > > > > +    }
> > > > > +    strcpy(stream->dd_dir.d_name, entry_start);
> > > >
> > > > g_path_get_basename() ? :)
> > >
> > > For above three comments:
> > > This code is not good, should be fixed.
> > > The code want to filter the following cases:
> > > The parent directory path is not a part of entry's full path:
> > > Parent: C:\123\456, entry: C:\123, C:\ Entry contains more than one
> > > name components:
> > > Parent: C:\123\456, entry: C:\123\456\789\abc Entry is zero length
> > > or name buffer is too long
> > >
> > > I will refactor this part.
> >
> > In general: writing parsing code yourself is extremely error prone.
> > That's why it makes sense to use existing functions from glib, etc.
> >
> > > >
> > > > > +
> > > > > +    return 0;
> > > > > +}
> > > > > +
> > > > > +/*
> > > > > + * opendir_win32 - open a directory
> > > > > + *
> > > > > + * This function opens a directory and caches all directory entr=
ies.
> > > >
> > > > It just caches all file IDs, doesn't it?
> > > >
> > >
> > > Will fix it
> > >
> > > > > + */
> > > > > +DIR *opendir_win32(const char *full_file_name) {
> > > > > +    HANDLE hDir =3D INVALID_HANDLE_VALUE;
> > > > > +    HANDLE hDirEntry =3D INVALID_HANDLE_VALUE;
> > > > > +    char *full_dir_entry =3D NULL;
> > > > > +    DWORD attribute;
> > > > > +    intptr_t dd_handle =3D -1;
> > > > > +    struct _finddata_t dd_data;
> > > > > +    uint64_t file_id;
> > > > > +    uint64_t *file_id_list =3D NULL;
> > > > > +    BY_HANDLE_FILE_INFORMATION FileInfo;
> > > >
> > > > FileInfo is the variable name, not a struct name, so no upper case
> > > > for it please.
> > >
> > > Will fix it.
> > > >
> > > > > +    struct dir_win32 *stream =3D NULL;
> > > > > +    int err =3D 0;
> > > > > +    int find_status;
> > > > > +    int sort_first_two_entry =3D 0;
> > > > > +    uint32_t list_count =3D 16;
> > > >
> > > > Magic number 16?
> > >
> > > Will change it to a macro.
> > > >
> > > > > +    uint32_t index =3D 0;
> > > > > +
> > > > > +    /* open directory to prevent it being removed */
> > > > > +
> > > > > +    hDir =3D CreateFile(full_file_name, GENERIC_READ,
> > > > > +                      FILE_SHARE_READ | FILE_SHARE_WRITE |
> > > > FILE_SHARE_DELETE,
> > > > > +                      NULL,
> > > > > +                      OPEN_EXISTING,
> > > > > +                      FILE_FLAG_BACKUP_SEMANTICS |
> > > > FILE_FLAG_OPEN_REPARSE_POINT,
> > > > > +                      NULL);
> > > > > +
> > > > > +    if (hDir =3D=3D INVALID_HANDLE_VALUE) {
> > > > > +        err =3D win32_error_to_posix(GetLastError());
> > > > > +        goto out;
> > > > > +    }
> > > > > +
> > > > > +    attribute =3D GetFileAttributes(full_file_name);
> > > > > +
> > > > > +    /* symlink is not allow */
> > > > > +    if (attribute =3D=3D INVALID_FILE_ATTRIBUTES
> > > > > +        || (attribute & FILE_ATTRIBUTE_REPARSE_POINT) !=3D 0) {
> > > > > +        err =3D EACCES;
> > > > > +        goto out;
> > > > > +    }
> > > > > +
> > > > > +    /* check if it is a directory */
> > > > > +    if ((attribute & FILE_ATTRIBUTE_DIRECTORY) =3D=3D 0) {
> > > > > +        err =3D ENOTDIR;
> > > > > +        goto out;
> > > > > +    }
> > > > > +
> > > > > +    file_id_list =3D g_malloc0(sizeof(uint64_t) * list_count);
> > > > > +
> > > > > +    /*
> > > > > +     * findfirst() needs suffix format name like "\dir1\dir2\*",
> > > > > +     * allocate more buffer to store suffix.
> > > > > +     */
> > > > > +    stream =3D g_malloc0(sizeof(struct dir_win32) +
> > > > > + strlen(full_file_name) + 3);
> > > >
> > > > Not that I would care much, but +2 would be correct here, as you
> > > > declared the struct with one character already, so it is not a
> > > > classic (zero size) flex
> > > > array:
> > > >
> > > >   struct dir_win32 {
> > > >     ...
> > > >     char dd_name[1];
> > > >   };
> > > >
> > > Will fix it.
> > >
> > > > > +
> > > > > +    strcpy(stream->dd_name, full_file_name);
> > > > > +    strcat(stream->dd_name, "\\*");
> > > > > +
> > > > > +    stream->hDir =3D hDir;
> > > > > +    stream->dir_name_len =3D strlen(full_file_name);
> > > > > +
> > > > > +    dd_handle =3D _findfirst(stream->dd_name, &dd_data);
> > > > > +
> > > > > +    if (dd_handle =3D=3D -1) {
> > > > > +        err =3D errno;
> > > > > +        goto out;
> > > > > +    }
> > > > > +
> > > > > +    /* read all entries to link list */
> > > >
> > > > "read all entries as a linked list"
> > > >
> > > > However there is no linked list here. It seems to be an array.
> > >
> > > Will fix it.
> > > >
> > > > > +    do {
> > > > > +        full_dir_entry =3D get_full_path_win32(hDir,
> > > > > + dd_data.name);
> > > > > +
> > > > > +        if (full_dir_entry =3D=3D NULL) {
> > > > > +            err =3D ENOMEM;
> > > > > +            break;
> > > > > +        }
> > > > > +
> > > > > +        /*
> > > > > +         * Open every entry and get the file informations.
> > > > > +         *
> > > > > +         * Skip symbolic links during reading directory.
> > > > > +         */
> > > > > +        hDirEntry =3D CreateFile(full_dir_entry,
> > > > > +                               GENERIC_READ,
> > > > > +                               FILE_SHARE_READ | FILE_SHARE_WRIT=
E
> > > > > +                               | FILE_SHARE_DELETE,
> > > > > +                               NULL,
> > > > > +                               OPEN_EXISTING,
> > > > > +                               FILE_FLAG_BACKUP_SEMANTICS
> > > > > +                               | FILE_FLAG_OPEN_REPARSE_POINT,
> > > > > + NULL);
> > > > > +
> > > > > +        if (hDirEntry !=3D INVALID_HANDLE_VALUE) {
> > > > > +            if (GetFileInformationByHandle(hDirEntry,
> > > > > +                                           &FileInfo) =3D=3D TRU=
E) {
> > > > > +                attribute =3D FileInfo.dwFileAttributes;
> > > > > +
> > > > > +                /* only save validate entries */
> > > > > +                if ((attribute & FILE_ATTRIBUTE_REPARSE_POINT) =
=3D=3D 0) {
> > > > > +                    if (index >=3D list_count) {
> > > > > +                        list_count =3D list_count + 16;
> > > >
> > > > Magic number 16 again.
> > > >
> > > > > +                        file_id_list =3D g_realloc(file_id_list,
> > > > > +                                                 sizeof(uint64_t=
)
> > > > > +                                                 * list_count);
> > > >
> > > > OK, so here we are finally at the point where you chose the
> > > > overall behaviour for this that we discussed before.
> > > >
> > > > So you are constantly appending 16 entry chunks to the end of the
> > > > array, periodically reallocate the entire array, and potentially
> > > > end up with one giant dense array with *all* file IDs of the direct=
ory.
> > > >
> > > > That's not really what I had in mind, as it still has the
> > > > potential to easily crash QEMU if there are large directories on ho=
st.
> > > > Theoretically a Windows directory might then consume up to 16 GB
> > > > of RAM for looking up only one single directory.
> > > >
> > > > So is this the implementation that you said was very slow, or did
> > > > you test a different one? Remember, my orgiginal idea (as starting
> > > > point for Windows) was to only cache *one* file ID (the last being
> > > > looked up). That's it. Not a list of file IDs.
> > >
> > > If only cache one file ID, that means for every read directory operat=
ion.
> > > we need to look up whole directory to find out the next ID larger
> > > than last
> > cached one.
> > >
> > > I provided some performance test in last patch:
> > > Run test for read directory with 100, 1000, 10000 entries #1, For
> > > file name cache solution, the time cost is: 2, 9, 44 (in ms).
> > > #2, For file id cache solution, the time cost: 3, 438, 4338 (in ms).
> > > This
> > is current solution.
> > > #3, for cache one id solution, I just tested it: 4, 4788, more than
> > > one minutes (in ms)
> > >
> > > I think it is not a good idea to cache one file id, it would be very
> > > bad performance
> >
> > Yes, the performce would be lousy, but at least we would have a basis
> > that just works^TM. Correct behaviour always comes before performance.
> > And from there you could add additional patches on top to address
> > performance improvements. Because the point is: your implementation is
> > also suboptimal, and more importantly: prone to crashes like we discuss=
ed
> before.
> >
> > Regarding performance: for instance you are re-allocating an entire
> > dense buffer on every 16 new entries. That will slow down things
> > extremely. Please use a container from glib, because these are
> > handling resize operations more smoothly for you out of the box, i.e.
> > typically by doubling the container capacity instead of re-allocating
> frequently with small chunks like you did.
> >
> > However I am still not convinced that allocating a huge dense buffer
> > with
> > *all* file IDs of a directory makes sense.
> >
> > On the long-term it would make sense to do it like other implementation=
s:
> > store a snapshot of the directory temporarily on disk. That way it
> > would not matter how huge the directory is. But that's a complex
> > implementation, so not something that I would do in this series already=
.
> >
> > On the short/mid term I think we could simply make a mix of your
> > solution and the one-ID solution that I suggested: keeping a maximum
> > of e.g. 1k file IDs in RAM. And once guest seeks past that boundary,
> > loading the subsequent 1k entries, free-ing the previous 1k entries, an=
d so
> on.
> >
>=20
> Please note that the performance data is tested in native OS, but not in
> QEMU.
> It is even worse in QEMU.
>=20
> I run Linux guest OS on Windows host, use "ls -l" command to list a direc=
tory
> with about 100 entries.
> "ls -l" command need about 0.5 second to display one directory entry.
>=20
> Caching only one node (file id, or file name, or others) will make 9pfs n=
ot
> usable: listing 100 directory entries need 50 seconds in guest OS.

I have to point out that you missing about random accessing for a directory=
, this is the key of performance.
In QEMU 9p directory reading solution, it will try to read as many as possi=
ble entries (in function do_readdir_many).
When the butter is not enough, do_readdir_many will re-seek to the last rea=
d entry.
The key point is the "re-seek" directory.

Read directory is always read the next entry, so cache one id will be OK, a=
nd less performance impact.
But seek directory may seek to anywhere, seek directory need to cache all I=
Ds.

Consider about this case:
There are 100 files in directory, name is from "file001" to "file100".

Currently, next read entry is "file050".
Now, user want to seek to directory offset 20 (should be "file020").
Because we only cached one id ("file050"), we do not know the file id for o=
ffset 20.
So we could only get the file id in offset 0 (need to search whole director=
y to get the minimal ID), and get the file id in offset 1, ... to offset 20=
.

So for the random accessing, seek to offset N in a directory with M-entries=
, we need to search whole directory for N times and reading totally M*N ent=
ries.
If there are 1000 files in a directory, and want seek to offset 1000 random=
ly, need to open file 1000*1000 times.
For the worst test case: read + seek + read for 1000 files, 9p on Windows h=
ost will need open files for 1000*(1 + 2 + 3 ... 1000) =3D 500500000 times.=
 It may need several hours to finish it.

Another problem is: if only cache one ID, we can not detect which directory=
 is deleted.
It is no difference with use MinGW native APIs, and we go back to the start=
 point.
Cache one ID is useful for getting next entry, but not useful for telling u=
s where is current offset.
Because after deleting some entries, guest OS may re-seek to the last offse=
t. Storing only one ID is useless for re-seek to last offset.

Here is summarize of requirements:
1. Guest OS may seek directory randomly.
2. Some entries may be deleted during directory reading.

To match the requirements, a snapshot of directory may be the only solution=
.
So we should force on which information should be in snapshot (file id, or =
filename), and how to store it.
I do not think it is a big problem for large directory. Actually, if there =
are more than 1 million files in a directory, Windows File Explorer may not=
 response.


>=20
> > > >
> > > > > +                    }
> > > > > +                    file_id =3D (uint64_t)FileInfo.nFileIndexLow
> > > > > +                              +
> > > > > + (((uint64_t)FileInfo.nFileIndexHigh)
> > > > > + << 32);
> > > > > +
> > > > > +
> > > > > +                    file_id_list[index] =3D file_id;
> > > > > +
> > > > > +                    if (strcmp(dd_data.name, ".") =3D=3D 0) {
> > > > > +                        stream->dot_id =3D file_id_list[index];
> > > > > +                        if (index !=3D 0) {
> > > > > +                            sort_first_two_entry =3D 1;
> > > > > +                        }
> > > > > +                    } else if (strcmp(dd_data.name, "..") =3D=3D=
 0) {
> > > > > +                        stream->dot_dot_id =3D file_id_list[inde=
x];
> > > > > +                        if (index !=3D 1) {
> > > > > +                            sort_first_two_entry =3D 1;
> > > > > +                        }
> > > > > +                    }
> > > > > +                    index++;
> > > > > +                }
> > > > > +            }
> > > > > +            CloseHandle(hDirEntry);
> > > > > +        }
> > > > > +        g_free(full_dir_entry);
> > > > > +        find_status =3D _findnext(dd_handle, &dd_data);
> > > > > +    } while (find_status =3D=3D 0);
> > > > > +
> > > > > +    if (errno =3D=3D ENOENT) {
> > > > > +        /* No more matching files could be found, clean errno */
> > > > > +        errno =3D 0;
> > > > > +    } else {
> > > > > +        err =3D errno;
> > > > > +        goto out;
> > > > > +    }
> > > > > +
> > > > > +    stream->total_entries =3D index;
> > > > > +    stream->file_id_list =3D file_id_list;
> > > > > +
> > > > > +    if (sort_first_two_entry =3D=3D 0) {
> > > > > +        /*
> > > > > +         * If the first two entry is "." and "..", then do not
> > > > > + sort
> > them.
> > > > > +         *
> > > > > +         * If the guest OS always considers first two entries
> > > > > + are "." and
> > > > "..",
> > > > > +         * sort the two entries may cause confused display in
> > > > > + guest
> > OS.
> > > > > +         */
> > > > > +        qsort(&file_id_list[2], index - 2, sizeof(file_id),
> > > > file_id_compare);
> > > > > +    } else {
> > > > > +        qsort(&file_id_list[0], index, sizeof(file_id),
> > file_id_compare);
> > > > > +    }
> > > >
> > > > Were there cases where you did not get "." and ".." ?
> > >
> > > NTFS always provides "." and "..".
> > > I could add more checks here to fix this risk
> >
> > That's what I assumed. So you can probably just drop this code for
> > simplicity.
> >
> > >
> > > >
> > > > > +
> > > > > +out:
> > > > > +    if (err !=3D 0) {
> > > > > +        errno =3D err;
> > > > > +        if (stream !=3D NULL) {
> > > > > +            if (file_id_list !=3D NULL) {
> > > > > +                g_free(file_id_list);
> > > > > +            }
> > > > > +            CloseHandle(hDir);
> > > > > +            g_free(stream);
> > > > > +            stream =3D NULL;
> > > > > +        }
> > > > > +    }
> > > > > +
> > > > > +    if (dd_handle !=3D -1) {
> > > > > +        _findclose(dd_handle);
> > > > > +    }
> > > > > +
> > > > > +    return (DIR *)stream;
> > > > > +}
> > > > > +
> > > > > +/*
> > > > > + * closedir_win32 - close a directory
> > > > > + *
> > > > > + * This function closes directory and free all cached resources.
> > > > > + */
> > > > > +int closedir_win32(DIR *pDir)
> > > > > +{
> > > > > +    struct dir_win32 *stream =3D (struct dir_win32 *)pDir;
> > > > > +
> > > > > +    if (stream =3D=3D NULL) {
> > > > > +        errno =3D EBADF;
> > > > > +        return -1;
> > > > > +    }
> > > > > +
> > > > > +    /* free all resources */
> > > > > +    CloseHandle(stream->hDir);
> > > > > +
> > > > > +    g_free(stream->file_id_list);
> > > > > +
> > > > > +    g_free(stream);
> > > > > +
> > > > > +    return 0;
> > > > > +}
> > > > > +
> > > > > +/*
> > > > > + * readdir_win32 - read a directory
> > > > > + *
> > > > > + * This function reads a directory entry from cached entry list.
> > > > > + */
> > > > > +struct dirent *readdir_win32(DIR *pDir) {
> > > > > +    struct dir_win32 *stream =3D (struct dir_win32 *)pDir;
> > > > > +
> > > > > +    if (stream =3D=3D NULL) {
> > > > > +        errno =3D EBADF;
> > > > > +        return NULL;
> > > > > +    }
> > > > > +
> > > > > +retry:
> > > > > +
> > > > > +    if (stream->offset >=3D stream->total_entries) {
> > > > > +        /* reach to the end, return NULL without set errno */
> > > > > +        return NULL;
> > > > > +    }
> > > > > +
> > > > > +    if (get_next_entry(stream) !=3D 0) {
> > > > > +        stream->offset++;
> > > > > +        goto retry;
> > > > > +    }
> > > > > +
> > > > > +    /* Windows does not provide inode number */
> > > > > +    stream->dd_dir.d_ino =3D 0;
> > > > > +    stream->dd_dir.d_reclen =3D 0;
> > > > > +    stream->dd_dir.d_namlen =3D strlen(stream->dd_dir.d_name);
> > > > > +
> > > > > +    stream->offset++;
> > > > > +
> > > > > +    return &stream->dd_dir;
> > > > > +}
> > > > > +
> > > > > +/*
> > > > > + * rewinddir_win32 - reset directory stream
> > > > > + *
> > > > > + * This function resets the position of the directory stream to
> > > > > +the
> > > > > + * beginning of the directory.
> > > > > + */
> > > > > +void rewinddir_win32(DIR *pDir) {
> > > > > +    struct dir_win32 *stream =3D (struct dir_win32 *)pDir;
> > > > > +
> > > > > +    if (stream =3D=3D NULL) {
> > > > > +        errno =3D EBADF;
> > > > > +        return;
> > > > > +    }
> > > > > +
> > > > > +    stream->offset =3D 0;
> > > > > +
> > > > > +    return;
> > > > > +}
> > > > > +
> > > > > +/*
> > > > > + * seekdir_win32 - set the position of the next readdir() call
> > > > > +in the directory
> > > > > + *
> > > > > + * This function sets the position of the next readdir() call
> > > > > +in the directory
> > > > > + * from which the next readdir() call will start.
> > > > > + */
> > > > > +void seekdir_win32(DIR *pDir, long pos) {
> > > > > +    struct dir_win32 *stream =3D (struct dir_win32 *)pDir;
> > > > > +
> > > > > +    if (stream =3D=3D NULL) {
> > > > > +        errno =3D EBADF;
> > > > > +        return;
> > > > > +    }
> > > > > +
> > > > > +    if (pos < -1) {
> > > > > +        errno =3D EINVAL;
> > > > > +        return;
> > > > > +    }
> > > > > +
> > > > > +    if (pos =3D=3D -1 || pos >=3D (long)stream->total_entries) {
> > > > > +        /* seek to the end */
> > > > > +        stream->offset =3D stream->total_entries;
> > > > > +        return;
> > > > > +    }
> > > > > +
> > > > > +    if (pos - (long)stream->offset =3D=3D 0) {
> > > > > +        /* no need to seek */
> > > > > +        return;
> > > > > +    }
> > > > > +
> > > > > +    stream->offset =3D pos;
> > > > > +
> > > > > +    return;
> > > > > +}
> > > > > +
> > > > > +/*
> > > > > + * telldir_win32 - return current location in directory
> > > > > + *
> > > > > + * This function returns current location in directory.
> > > > > + */
> > > > > +long telldir_win32(DIR *pDir)
> > > > > +{
> > > > > +    struct dir_win32 *stream =3D (struct dir_win32 *)pDir;
> > > > > +
> > > > > +    if (stream =3D=3D NULL) {
> > > > > +        errno =3D EBADF;
> > > > > +        return -1;
> > > > > +    }
> > > > > +
> > > > > +    if (stream->offset > stream->total_entries) {
> > > > > +        return -1;
> > > > > +    }
> > > > > +
> > > > > +    return (long)stream->offset; }
> > > > >
> > > >
> > >
> > >
> > >
> >
> >


