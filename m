Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5953A689F4B
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 17:31:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNyyA-0001tL-Rb; Fri, 03 Feb 2023 11:31:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1398d6e02b=guohuai.shi@windriver.com>)
 id 1pNyxo-0001aU-OF
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 11:31:08 -0500
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1398d6e02b=guohuai.shi@windriver.com>)
 id 1pNyxl-0007tH-4B
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 11:31:00 -0500
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 313ECPwr020338; Fri, 3 Feb 2023 16:30:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=hc0Un1WWx0yxZgOHJjXyrCIGOOBAzDNmQ1+6NNugrPQ=;
 b=CiFQhs/kGYKJjr40xd8OoToH3GGNkUPxSHB0Gs0i6vUaNjtfolry+rEdi37NLpivykiy
 fKyee0KdWw3krVr65JF4AucsQ9UBlnfTU4x7T4Ak0GingxGQIB6O2+TpDCR14UH7zkex
 4hhoM2rhqgaiJbegMbkjlF8nRlqRaHo73I0RcFdsyr1B+IIEdeDjIeLGTrkjmbBNSQJu
 Mta0BvowLlpkmxEdT5Mt9/SSS9YHEl9pWLn4Fe35utH1JEoNR0/qtsRLK6BiNvuzUN/Y
 ECXGQ7827P6Ta7i2PPuyBOjMfT7v2EDALlfYuRR6izOkMs3HDqPrLLCW6L+2ojYX6V4k KQ== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ncrx3enkb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Feb 2023 16:30:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kfeOc7n9oW40U4uHu8KQFhfYbmIvvgLAZbt7U+JWJdKFyzzC8LCCI2pZ+DfzZ4LDmZm94nYdEaG49deeBVq6bissk4/wkKKYWdA+t6uBpS3vahFnY4Fh0HUiJsCM+VhBIC2+IYgCfW+lUr1Z0NAJBonY3tJxBlviKvxjRaJFZTBy0eH2RXmZ+ZDB/9wHl+yESPz9YCS7eIWoV2P/9RnHh9qh4p/rSDdihRZy2FBw5LaUVFnKpQBWua7e4P3glUWcD+Mrb2BmuQ2MoqrTG1eU4F+RnVFx5We8kuPFUKQQFyS8CLBu6wf2rG3DhAIKgDN5qYiZW7i4ME1k7cV0eolz8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hc0Un1WWx0yxZgOHJjXyrCIGOOBAzDNmQ1+6NNugrPQ=;
 b=ePBBSiGlLxudyYELENqB/W6VCgdeGAFaQiTmLBAHzoz45GFBa6jAkTtNkHO84Clm1JEIrhs3JGuuoHjPnxGm49qFtAVCV60vvgIcP2eTA+dLZ0xf6W2955QKcWBZZwPolg5ssZMOnMnIZ46054+JzUl5qqS8g3vo5A3g+an74FsX3jtcJdcj/S8nIq73mJECTYKEUTixIRsigMY5mOet6O//6vtCURvb3ZewcHaAJezV3macJbexWMFek5RgrYmCtkKkbdh1lt12xVHqnbt3nphPDBrBIKna9rXTNviBhW1DSaEe1DXWtf8E3u2nCJAn7I00EMgZ+WNbWcSvo1daVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MN2PR11MB4173.namprd11.prod.outlook.com (2603:10b6:208:137::20)
 by SN7PR11MB7565.namprd11.prod.outlook.com (2603:10b6:806:344::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Fri, 3 Feb
 2023 16:30:36 +0000
Received: from MN2PR11MB4173.namprd11.prod.outlook.com
 ([fe80::2d69:6276:f527:9fb4]) by MN2PR11MB4173.namprd11.prod.outlook.com
 ([fe80::2d69:6276:f527:9fb4%6]) with mapi id 15.20.6064.027; Fri, 3 Feb 2023
 16:30:36 +0000
From: "Shi, Guohuai" <Guohuai.Shi@windriver.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "Meng, Bin" <Bin.Meng@windriver.com>, =?iso-8859-1?Q?Marc-Andr=E9_Lureau?=
 <marcandre.lureau@redhat.com>, =?iso-8859-1?Q?Daniel_P=2E_Berrang=E9?=
 <berrange@redhat.com>
Subject: RE: [PATCH v4 04/16] hw/9pfs: Implement Windows specific xxxdir() APIs
Thread-Topic: [PATCH v4 04/16] hw/9pfs: Implement Windows specific xxxdir()
 APIs
Thread-Index: AQHZNJCQ5QDQDl+c2UWDW8VIOF7gh669K9gAgAAOB2CAABf+gIAADomA
Date: Fri, 3 Feb 2023 16:30:35 +0000
Message-ID: <MN2PR11MB4173C6CF342F103D757F8A21EFD79@MN2PR11MB4173.namprd11.prod.outlook.com>
References: <20230130095202.2773186-1-bin.meng@windriver.com>
 <2770789.QfI4yIDJDK@silver>
 <MN2PR11MB417343F1C20D3DD9680461E6EFD79@MN2PR11MB4173.namprd11.prod.outlook.com>
 <7414919.cCnjH5He9x@silver>
In-Reply-To: <7414919.cCnjH5He9x@silver>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR11MB4173:EE_|SN7PR11MB7565:EE_
x-ms-office365-filtering-correlation-id: 685a2720-bbc7-4327-8dbe-08db0603fa86
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lExx9YxQtIs42bd2DA7LHZ0bAVrhY2UJ7lpMLSYTXLk0r5pKPqSwZXa3JlzyuCZ5qslDEYP7xbxYyKS0F9SX1q6LL3IfRWaCIlcprcLcahR2O/XCFX+BRbHPK+Rmye2sCOiD4XoBdXusoqJxaMfFJDOsIlU/+hyMDhTzdO3qzQjtEf3IeFUCol9/JNvqLUQzk/RN8DcNR2w5ohS19lI+4LKc8CQQHwR9qV1jRdHc88ovhTycrjhO7wHxS/RzTcjW8hwr0CPtq4u9oMoLQgaLnByYPRJAd3FlFb8ffICKjWjb2IvoLMFuCsSenoUyJ0Lwntj8VmxxlQv6URUbFUfPKuvQkQ9x8ozL5wAPNbaD2HVQnKawfzUAVyy/wNJzyG8oE989YJGG/kRixZE+XmLERKFaTc5WfckMuAtykIDCPRZTa+SMPnDDBcXPdzhJ7w/M+2VyLxz/GP0RKzt/mxCfo7QUcDkszDvfccjUjZlz0D21/8qMNZYHnkPyU1GjImuuqveLJCA0P5CbbCnU8Of6vgDahAxPfCy/GqUN2MMs3+25UmRLsbor1vudKYHqlCou3O3pdw+BAUr0rN+XseUE4Sm2NknkeTtUONqkuewGTmU41NbOz/MupKsnm8Trj52wvqcmJ8QDU/2nOdBHXBnKMetc2C/GJiqCQ1SuhUdhTV6ZHwtPP3TaXTWxmN++2//Ky/fmpZ7bXAHgzm/mM/o+Mtd+BDxxvYbHzCGHlAmtBQlrSPvWHqwNDqw7xO/n87EBS0rSxewx4wAD1TFILeIj7w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4173.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(39850400004)(396003)(366004)(376002)(346002)(451199018)(110136005)(55016003)(122000001)(38100700002)(26005)(54906003)(5660300002)(316002)(52536014)(38070700005)(86362001)(83380400001)(6506007)(4326008)(8676002)(76116006)(30864003)(2906002)(7696005)(9686003)(33656002)(966005)(66476007)(71200400001)(66446008)(8936002)(66556008)(478600001)(64756008)(53546011)(186003)(41300700001)(66946007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Vjbre7Hn9qt0fo8qq5zrYNMa/kQ61UZKtgBbt0gfXOVorGpxbtQBk+USwN?=
 =?iso-8859-1?Q?xq2og4kjL67Lj0EKxl6vE/NzWsnH5fLiFVeNFvcrbFBgHLBApObG3Vz69R?=
 =?iso-8859-1?Q?MAsXoD/vEYwwljSw0HTeiapcep5yoAeWBsMF05ndmKFEMmqIbpdCfnXBcI?=
 =?iso-8859-1?Q?fZATZpnOrJ6c5hr9gEAAW85WBqTg5zZ1Rahg9RPaMXbNbty9bfXTT2fWLb?=
 =?iso-8859-1?Q?IzwQs5Llt8i9VqLzqas5TRzwTO3iXIb3HR3DTdhQP3aI1imwwHj8s6InBX?=
 =?iso-8859-1?Q?lalhQWekWnNlNxJCNnoMvKw2qj+6ff2pfC6xJqm0dtABOdTMJfoS5JHyob?=
 =?iso-8859-1?Q?LxFMOpoJVp4+Mgur90bkL81AU96yfpVzXwSEbtfXvQ5Gk2int2TVXT5KXT?=
 =?iso-8859-1?Q?NVRnOAu2lt/bfM0Rhm4BQ+mGHd/gVnKJwgLKNh8O6DR8xi2l/AUKnqytAB?=
 =?iso-8859-1?Q?1n2K4uuGqowKA++IsJdWaeL5A6v7zsm1lGDb0u5WE3a2kW2grJHNP7+ae5?=
 =?iso-8859-1?Q?sOCqkdYlNeJH83GqdGLty8oYP4pU03tlEbnbILjQK6rI92QabLBCd/eKRR?=
 =?iso-8859-1?Q?wNeAXS207y6FYY0dV6/6qggW8h4bWAeiHRlmZAHxPZpFOcAnOnQAcs00ly?=
 =?iso-8859-1?Q?no1RibYfNS6YJp4GNByx5lKJtmC5uezz2wnPAdzjfBRLWH3yxyOiF4Z9pD?=
 =?iso-8859-1?Q?cc2lkOv+x5blcs4FL92cVxzxwk35FP5Dr5jNNTpec+0V4w38Q01Ncmevj1?=
 =?iso-8859-1?Q?qD3bBGM5TJAUGM+iltAuquOxxa304Yc3nVhXbhGE+b7V0T5ovK4+hwZGTa?=
 =?iso-8859-1?Q?aZFwXiunNNna4bfgmWuWWiVAQLrF4u8Az4fqIi/pgmo0S8HuCPg9oXYyW4?=
 =?iso-8859-1?Q?TM7wqVKw39jgRWshDEox3ZAEBRBRu92uQpHWkhjZuhJTSU0Ipgzrsi8WnO?=
 =?iso-8859-1?Q?rE501LGAd+ncWb7bybsOw4Tbyg6SGDXt7bKenbNrjXbzSs8jL8L5qEj4Ms?=
 =?iso-8859-1?Q?cUs1l4BJMrBmXqLM1M+CuOSyYmOZZQuqOeOCEn+Xk63nSBW9g2iqKpqPXN?=
 =?iso-8859-1?Q?PvCr5GbkVJ4ATDYGYrz8LQvguHb+DxOH1QsAT8P9pLFWL9c60SkcDdGxkj?=
 =?iso-8859-1?Q?/plYO6qkybqhBW4yDcwYfyVeQ+mV1bAa4iS4ZDB8zQCY/2CpIN+v3qYfpr?=
 =?iso-8859-1?Q?i7MQ/YlKZTmUEVsJd9M+LGPdlKzkp6MfI6fOiC9hz1/bEiSvjC5YVILolh?=
 =?iso-8859-1?Q?NILVYJXqnwuvcKcF8x8+zLpZXyqMQ+0g9f97V6GBfYG0ygD22XKyObMfSP?=
 =?iso-8859-1?Q?W6ByQgruTdVI3zM0nheQN4jZuoKdlUGoaCmfqtjpF8LAIVAOxklodWvh5D?=
 =?iso-8859-1?Q?JlekL9zh2kGnM7JinlWubYMt2WYzOorh7eU3BgRzJYC7mgz1gsKQFPMbGk?=
 =?iso-8859-1?Q?dPszfLQWo0aOi7qnuBOLOpLvm3L0mL0SUlXCh4352r9gdJKnxvYKXP1PFC?=
 =?iso-8859-1?Q?M2rO+qv9icNgMAgFdvDTMG0blCYdNwq/BsM9zF+Q7dig+OTX1RhufDQX9B?=
 =?iso-8859-1?Q?pzNxfrlnVzptN7yxi8j9oDgqzvBPrp0DPGaGJmlDkX/rRXLySLduRrzFYd?=
 =?iso-8859-1?Q?LI6D00iZIDT2I7sBpbapPKeSbWKJ0OHpOPLlOF+t4pxcE6G/p7I9WoYQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4173.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 685a2720-bbc7-4327-8dbe-08db0603fa86
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2023 16:30:36.0535 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P+UgHuJ3KjEYDWL83ZYc2SWboo2cyYoMmnr1D4SUEBRVFdG/GHd3PZoiKgZwPLiaF3kdNRryH+gFV0m4IicZTD0f1gnVQHfjlilbyPke714=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7565
X-Proofpoint-GUID: tCe7-AaSQVaEZTNpplz4xp-HFa73rsIb
X-Proofpoint-ORIG-GUID: tCe7-AaSQVaEZTNpplz4xp-HFa73rsIb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-03_15,2023-02-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0
 adultscore=0 malwarescore=0 clxscore=1015 mlxlogscore=999 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302030151
Received-SPF: pass client-ip=205.220.178.238;
 envelope-from=prvs=1398d6e02b=guohuai.shi@windriver.com;
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
> From: Christian Schoenebeck <qemu_oss@crudebyte.com>
> Sent: Friday, February 3, 2023 22:41
> To: Greg Kurz <groug@kaod.org>; qemu-devel@nongnu.org
> Cc: Meng, Bin <Bin.Meng@windriver.com>; Marc-Andr=E9 Lureau
> <marcandre.lureau@redhat.com>; Daniel P. Berrang=E9 <berrange@redhat.com>=
; Shi,
> Guohuai <Guohuai.Shi@windriver.com>
> Subject: Re: [PATCH v4 04/16] hw/9pfs: Implement Windows specific xxxdir(=
)
> APIs
>=20
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d
> know the content is safe.
>=20
> On Friday, February 3, 2023 2:34:13 PM CET Shi, Guohuai wrote:
> >
> > > -----Original Message-----
> > > From: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > Sent: Friday, February 3, 2023 20:25
> > > To: Greg Kurz <groug@kaod.org>; qemu-devel@nongnu.org
> > > Cc: Shi, Guohuai <Guohuai.Shi@windriver.com>; Meng, Bin
> > > <Bin.Meng@windriver.com>; Marc-Andr=E9 Lureau
> > > <marcandre.lureau@redhat.com>; Daniel P. Berrang=E9
> > > <berrange@redhat.com>
> > > Subject: Re: [PATCH v4 04/16] hw/9pfs: Implement Windows specific
> > > xxxdir() APIs
> > >
> > > CAUTION: This email comes from a non Wind River email account!
> > > Do not click links or open attachments unless you recognize the
> > > sender and know the content is safe.
> > >
> > > On Monday, January 30, 2023 10:51:50 AM CET Bin Meng wrote:
> > > > From: Guohuai Shi <guohuai.shi@windriver.com>
> > > >
> > > > This commit implements Windows specific xxxdir() APIs for safety
> > > > directory access.
> > > >
> > >
> > > This issue deserves a link to either the previous discussion
> > >
> > > Link: https://lore.kernel.org/qemu-devel/2830993.GtbaR8S6b6@silver/
> > >
> > > and/or a link to this continuation of the discussion here, as it's
> > > not a trivial issue, with pros and cons been discussed for the
> > > individual, possible solutions.
> > >
> > > > Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
> > > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > > ---
> > > >
> > > >  hw/9pfs/9p-util.h       |   6 +
> > > >  hw/9pfs/9p-util-win32.c | 296
> > > > ++++++++++++++++++++++++++++++++++++++++
> > > >  2 files changed, 302 insertions(+)
> > > >
> > > > diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h index
> > > > 0f159fb4ce..c1c251fbd1 100644
> > > > --- a/hw/9pfs/9p-util.h
> > > > +++ b/hw/9pfs/9p-util.h
> > > > @@ -141,6 +141,12 @@ int unlinkat_win32(int dirfd, const char
> > > > *pathname, int flags);  int statfs_win32(const char *root_path,
> > > > struct statfs *stbuf);  int openat_dir(int dirfd, const char
> > > > *name);  int openat_file(int dirfd, const char *name, int flags,
> > > > mode_t mode);
> > > > +DIR *opendir_win32(const char *full_file_name); int
> > > > +closedir_win32(DIR *pDir); struct dirent *readdir_win32(DIR
> > > > +*pDir); void rewinddir_win32(DIR *pDir); void seekdir_win32(DIR
> > > > +*pDir, long pos); long telldir_win32(DIR *pDir);
> > > >  #endif
> > > >
> > > >  static inline void close_preserve_errno(int fd) diff --git
> > > > a/hw/9pfs/9p-util-win32.c b/hw/9pfs/9p-util-win32.c index
> > > > a99d579a06..5503199300 100644
> > > > --- a/hw/9pfs/9p-util-win32.c
> > > > +++ b/hw/9pfs/9p-util-win32.c
> > > > @@ -37,6 +37,13 @@
> > > >   *    Windows does not support opendir, the directory fd is create=
d by
> > > >   *    CreateFile and convert to fd by _open_osfhandle(). Keep the =
fd
> open
> > > will
> > > >   *    lock and protect the directory (can not be modified or repla=
ced)
> > > > + *
> > > > + * 5. Windows and MinGW does not provide safety directory
> > > > + accessing
> > > functions.
> > > > + *    readdir(), seekdir() and telldir() may get or set wrong valu=
e
> > > because
> > > > + *    directory entry data is not protected.
> > >
> > > I would rephrase that sentence, as it doesn't cover the root problem
> > > adequately. Maybe something like this:
> > >
> > > 5. Neither Windows native APIs, nor MinGW provide a POSIX compatible
> > > API for acquiring directory entries in a safe way. Calling those
> > > APIs (native
> > > _findfirst() and _findnext() or MinGW's readdir(), seekdir() and
> > > telldir()) directly can lead to an inconsistent state if directory
> > > is modified in between, e.g. the same directory appearing more than
> > > once in output, or directories not appearing at all in output even
> > > though they were neither newly created nor deleted. POSIX does not
> > > define what happens with deleted or newly created directories in betw=
een,
> but it guarantees a consistent state.
> > >
> > > > + *
> > > > + *    This file re-write POSIX directory accessing functions and c=
ache
> all
> > > > + *    directory entries during opening.
> > > >   */
> > > >
> > > >  #include "qemu/osdep.h"
> > > > @@ -51,6 +58,27 @@
> > > >
> > > >  #define V9FS_MAGIC  0x53465039  /* string "9PFS" */
> > > >
> > > > +/*
> > > > + * MinGW and Windows does not provide safety way to seek
> > > > +directory while other
> > > > + * thread is modifying same directory.
> > > > + *
> > > > + * The two structures are used to cache all directory entries
> > > > +when opening
> > > it.
> > > > + * Cached entries are always returned for read or seek.
> > > > + */
> > > > +struct dir_win32_entry {
> > > > +    QSLIST_ENTRY(dir_win32_entry) node;
> > > > +    struct _finddata_t dd_data;
> > > > +};
> > > > +
> > > > +struct dir_win32 {
> > > > +    struct dirent dd_dir;
> > > > +    uint32_t offset;
> > > > +    uint32_t total_entries;
> > > > +    QSLIST_HEAD(, dir_win32_entry) head;
> > > > +    struct dir_win32_entry *current;
> > > > +    char dd_name[1];
> > > > +};
> > > > +
> > > >  /*
> > > >   * win32_error_to_posix - convert Win32 error to POSIX error numbe=
r
> > > >   *
> > > > @@ -977,3 +1005,271 @@ int qemu_mknodat(int dirfd, const char
> > > > *filename,
> > > mode_t mode, dev_t dev)
> > > >      errno =3D ENOTSUP;
> > > >      return -1;
> > > >  }
> > > > +
> > > > +/*
> > > > + * opendir_win32 - open a directory
> > > > + *
> > > > + * This function opens a directory and caches all directory entrie=
s.
> > > > + */
> > > > +DIR *opendir_win32(const char *full_file_name) {
> > > > +    HANDLE hDir =3D INVALID_HANDLE_VALUE;
> > > > +    DWORD attribute;
> > > > +    intptr_t dd_handle =3D -1;
> > > > +    struct _finddata_t dd_data;
> > > > +
> > > > +    struct dir_win32 *stream =3D NULL;
> > > > +    struct dir_win32_entry *dir_entry;
> > > > +    struct dir_win32_entry *prev;
> > > > +    struct dir_win32_entry *next;
> > > > +
> > > > +    int err =3D 0;
> > > > +    int find_status;
> > > > +    uint32_t index;
> > > > +
> > > > +    /* open directory to prevent it being removed */
> > > > +
> > > > +    hDir =3D CreateFile(full_file_name, GENERIC_READ,
> > > > +                      FILE_SHARE_READ | FILE_SHARE_WRITE |
> > > FILE_SHARE_DELETE,
> > > > +                      NULL,
> > > > +                      OPEN_EXISTING, FILE_FLAG_BACKUP_SEMANTICS,
> > > > + NULL);
> > > > +
> > > > +    if (hDir =3D=3D INVALID_HANDLE_VALUE) {
> > > > +        err =3D win32_error_to_posix(GetLastError());
> > > > +        goto out;
> > > > +    }
> > > > +
> > > > +    attribute =3D GetFileAttributes(full_file_name);
> > > > +
> > > > +    /* symlink is not allow */
> > > > +    if (attribute =3D=3D INVALID_FILE_ATTRIBUTES
> > > > +        || (attribute & FILE_ATTRIBUTE_REPARSE_POINT) !=3D 0) {
> > > > +        err =3D EACCES;
> > > > +        goto out;
> > > > +    }
> > > > +
> > > > +    /* check if it is a directory */
> > > > +    if ((attribute & FILE_ATTRIBUTE_DIRECTORY) =3D=3D 0) {
> > > > +        err =3D ENOTDIR;
> > > > +        goto out;
> > > > +    }
> > > > +
> > > > +    /*
> > > > +     * findfirst() need suffix format name like "\dir1\dir2\*",
> > > > + allocate
> > > more
> > > > +     * buffer to store suffix.
> > > > +     */
> > > > +    stream =3D g_malloc0(sizeof(struct dir_win32) +
> > > > + strlen(full_file_name) +
> > > 3);
> > > > +    QSLIST_INIT(&stream->head);
> > > > +
> > > > +    strcpy(stream->dd_name, full_file_name);
> > > > +    strcat(stream->dd_name, "\\*");
> > > > +
> > > > +    dd_handle =3D _findfirst(stream->dd_name, &dd_data);
> > > > +
> > > > +    if (dd_handle =3D=3D -1) {
> > > > +        err =3D errno;
> > > > +        goto out;
> > > > +    }
> > > > +
> > > > +    index =3D 0;
> > > > +
> > > > +    /* read all entries to link list */
> > > > +    do {
> > > > +        dir_entry =3D g_malloc0(sizeof(struct dir_win32_entry));
> > > > +        memcpy(&dir_entry->dd_data, &dd_data, sizeof(dd_data));
> > > > +        if (index =3D=3D 0) {
> > > > +            QSLIST_INSERT_HEAD(&stream->head, dir_entry, node);
> > > > +        } else {
> > > > +            QSLIST_INSERT_AFTER(prev, dir_entry, node);
> > > > +        }
> > > > +
> > > > +        prev =3D dir_entry;
> > > > +        find_status =3D _findnext(dd_handle, &dd_data);
> > > > +
> > > > +        index++;
> > > > +    } while (find_status =3D=3D 0);
> > >
> > > So you decided to go for the solution that caches all entries of a
> > > directory in RAM.
> > >
> > > So don't you think my last suggested solution that would call native
> > > _findfirst() and _findnext() directly, but without any chaching and
> > > instead picking the relevent entry simply by inode number, might be
> > > a better candidate as a starting point for landing Windows support?
> > > Link to that previous
> > > suggestion:
> > >
> > > https://lore.kernel.org/qemu-devel/2468168.SvRIHAoRfs@silver/
> > >
> >
> > I did a quick test for caching data without name entry, but it failed f=
or
> reading + deleting directory on Windows host (like "rm -rf" for a directo=
ry).
> > The root cause is: Windows's directory entry is not cached.
> > If there is 100 files in a directory:
> >
> > File1
> > File2
> > ...
> > File100
> >
> > When "rm -rf" is working:
> >
> > It read first 10 entries, and remove them. 9pfs may seek and re-seek to
> offset 10 to read next 10 entries.
> > But Windows and MinGW does not provide rewinddir.
> > If we using findfirst() and findnext to seek to offset 10, then we will=
 not
> get File11 but get File 21 (because we skipped 10 entries by seekdir()).
>=20
> I assume you are referring to a simple solution like MinGW does, i.e. a
> consecutive dense index (0,1,2,3,...n-1 where n is the current total amou=
nt
> of directory entries). That would not work, yes. But that's not what I
> suggested.
>=20
> With an inode number based lookup you would not seek to an incorrect entr=
y
> ...
>=20
> > If we removed some entries in directory, inode number is useless becaus=
e we
> can not find it again.
>=20
> You *can* recover from the previous inode number, even if any directory e=
ntry
> has been deleted in the meantime: you would lookup the entry with the nex=
t
> higher inode number.
>=20
> Example, say initial directory state on host is:
>=20
> name   inode-nr
> aaa    8
> bbb    3
> ccc    4
> ddd    2
> eee    9
>=20
> Say client is looking up exactly 2 entries, you would return to client in
> this order (by inode-nr):
>=20
> 1. ddd
> 2. bbb
>=20
> Now say "bbb" (a.k.a. previous) and "ccc" (a.k.a next) are removed. Direc=
tory
> state on host is now:
>=20
> name   inode-nr
> aaa    8
> ddd    2
> eee    9
>=20
> Subsequently the last directory entries are requested by client. Previous
> inode number (stored in RAM) was 3, which no longer exists, so you lookup=
 the
> entry with the next higher inode number than 3, which is now 8 in this
> example. Hence you would eventually return to client (in this order):
>=20
> 3. aaa
> 4. eee
>=20

Yes, it can work by using inode number (called File ID on Windows host: htt=
ps://learn.microsoft.com/en-us/windows/win32/api/winbase/ns-winbase-file_id=
_info).
However, Windows does not provide a function to get file information by fil=
e ID.
That means, for anytime of seeking directory, 9pfs need to do the following=
 sequence work to locate a name entry:

1. findfirst
2. CreateFile to get file handle
3. GetFileInformationByHandleEx to get file ID (https://learn.microsoft.com=
/en-us/windows/win32/api/minwinbase/ne-minwinbase-file_info_by_handle_class=
)
4. Close file handle and return if the file ID is match
5. findnext
6. repeat to step #2

Windows does not short file name entry by file ID and the file ID is 128-bi=
t integer.
When there are many entries in directory, seeking directory will cause a ve=
ry bad performance.

So I think store all name entries would be better than store all file ID.


> >
> >
> > Thanks
> > Guohuai
> >
> >
> > > > +
> > > > +    if (errno =3D=3D ENOENT) {
> > > > +        /* No more matching files could be found, clean errno */
> > > > +        errno =3D 0;
> > > > +    } else {
> > > > +        err =3D errno;
> > > > +        goto out;
> > > > +    }
> > > > +
> > > > +    stream->total_entries =3D index;
> > > > +    stream->current =3D QSLIST_FIRST(&stream->head);
> > > > +
> > > > +out:
> > > > +    if (err !=3D 0) {
> > > > +        errno =3D err;
> > > > +        /* free whole list */
> > > > +        if (stream !=3D NULL) {
> > > > +            QSLIST_FOREACH_SAFE(dir_entry, &stream->head, node, ne=
xt)
> {
> > > > +                QSLIST_REMOVE(&stream->head, dir_entry,
> > > > +dir_win32_entry,
> > > node);
> > > > +                g_free(dir_entry);
> > > > +            }
> > > > +            g_free(stream);
> > > > +            stream =3D NULL;
> > > > +        }
> > > > +    }
> > > > +
> > > > +    /* after cached all entries, this handle is useless */
> > > > +    if (dd_handle !=3D -1) {
> > > > +        _findclose(dd_handle);
> > > > +    }
> > > > +
> > > > +    if (hDir !=3D INVALID_HANDLE_VALUE) {
> > > > +        CloseHandle(hDir);
> > > > +    }
> > > > +
> > > > +    return (DIR *)stream;
> > > > +}
> > > > +
> > > > +/*
> > > > + * closedir_win32 - close a directory
> > > > + *
> > > > + * This function closes directory and free all cached resources.
> > > > + */
> > > > +int closedir_win32(DIR *pDir)
> > > > +{
> > > > +    struct dir_win32 *stream =3D (struct dir_win32 *)pDir;
> > > > +    struct dir_win32_entry *dir_entry;
> > > > +    struct dir_win32_entry *next;
> > > > +
> > > > +    if (stream =3D=3D NULL) {
> > > > +        errno =3D EBADF;
> > > > +        return -1;
> > > > +    }
> > > > +
> > > > +    /* free all resources */
> > > > +
> > > > +    QSLIST_FOREACH_SAFE(dir_entry, &stream->head, node, next) {
> > > > +        QSLIST_REMOVE(&stream->head, dir_entry, dir_win32_entry,
> node);
> > > > +        g_free(dir_entry);
> > > > +    }
> > > > +
> > > > +    g_free(stream);
> > > > +
> > > > +    return 0;
> > > > +}
> > > > +
> > > > +/*
> > > > + * readdir_win32 - read a directory
> > > > + *
> > > > + * This function reads a directory entry from cached entry list.
> > > > + */
> > > > +struct dirent *readdir_win32(DIR *pDir) {
> > > > +    struct dir_win32 *stream =3D (struct dir_win32 *)pDir;
> > > > +
> > > > +    if (stream =3D=3D NULL) {
> > > > +        errno =3D EBADF;
> > > > +        return NULL;
> > > > +    }
> > > > +
> > > > +    if (stream->offset >=3D stream->total_entries) {
> > > > +        /* reach to the end, return NULL without set errno */
> > > > +        return NULL;
> > > > +    }
> > > > +
> > > > +    memcpy(stream->dd_dir.d_name,
> > > > +           stream->current->dd_data.name,
> > > > +           sizeof(stream->dd_dir.d_name));
> > > > +
> > > > +    /* Windows does not provide inode number */
> > > > +    stream->dd_dir.d_ino =3D 0;
> > > > +    stream->dd_dir.d_reclen =3D 0;
> > > > +    stream->dd_dir.d_namlen =3D strlen(stream->dd_dir.d_name);
> > > > +
> > > > +    stream->offset++;
> > > > +    stream->current =3D QSLIST_NEXT(stream->current, node);
> > > > +
> > > > +    return &stream->dd_dir;
> > > > +}
> > > > +
> > > > +/*
> > > > + * rewinddir_win32 - reset directory stream
> > > > + *
> > > > + * This function resets the position of the directory stream to
> > > > +the
> > > > + * beginning of the directory.
> > > > + */
> > > > +void rewinddir_win32(DIR *pDir)
> > > > +{
> > > > +    struct dir_win32 *stream =3D (struct dir_win32 *)pDir;
> > > > +
> > > > +    if (stream =3D=3D NULL) {
> > > > +        errno =3D EBADF;
> > > > +        return;
> > > > +    }
> > > > +
> > > > +    stream->offset =3D 0;
> > > > +    stream->current =3D QSLIST_FIRST(&stream->head);
> > > > +
> > > > +    return;
> > > > +}
> > > > +
> > > > +/*
> > > > + * seekdir_win32 - set the position of the next readdir() call in
> > > > +the directory
> > > > + *
> > > > + * This function sets the position of the next readdir() call in
> > > > +the directory
> > > > + * from which the next readdir() call will start.
> > > > + */
> > > > +void seekdir_win32(DIR *pDir, long pos) {
> > > > +    struct dir_win32 *stream =3D (struct dir_win32 *)pDir;
> > > > +    uint32_t index;
> > > > +
> > > > +    if (stream =3D=3D NULL) {
> > > > +        errno =3D EBADF;
> > > > +        return;
> > > > +    }
> > > > +
> > > > +    if (pos < -1) {
> > > > +        errno =3D EINVAL;
> > > > +        return;
> > > > +    }
> > > > +
> > > > +    if (pos =3D=3D -1 || pos >=3D (long)stream->total_entries) {
> > > > +        /* seek to the end */
> > > > +        stream->offset =3D stream->total_entries;
> > > > +        return;
> > > > +    }
> > > > +
> > > > +    if (pos - (long)stream->offset =3D=3D 0) {
> > > > +        /* no need to seek */
> > > > +        return;
> > > > +    }
> > > > +
> > > > +    /* seek position from list head */
> > > > +
> > > > +    stream->current =3D QSLIST_FIRST(&stream->head);
> > > > +
> > > > +    for (index =3D 0; index < (uint32_t)pos; index++) {
> > > > +        stream->current =3D QSLIST_NEXT(stream->current, node);
> > > > +    }
> > > > +    stream->offset =3D index;
> > > > +
> > > > +    return;
> > > > +}
> > > > +
> > > > +/*
> > > > + * telldir_win32 - return current location in directory
> > > > + *
> > > > + * This function returns current location in directory.
> > > > + */
> > > > +long telldir_win32(DIR *pDir)
> > > > +{
> > > > +    struct dir_win32 *stream =3D (struct dir_win32 *)pDir;
> > > > +
> > > > +    if (stream =3D=3D NULL) {
> > > > +        errno =3D EBADF;
> > > > +        return -1;
> > > > +    }
> > > > +
> > > > +    if (stream->offset > stream->total_entries) {
> > > > +        return -1;
> > > > +    }
> > > > +
> > > > +    return (long)stream->offset;
> > > > +}
> > > >
> > >
> >
> >
> >
>=20
>=20


