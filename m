Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E61615B00
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 04:45:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oq4gF-0006Lv-W9; Tue, 01 Nov 2022 23:44:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=83056df09e=guohuai.shi@windriver.com>)
 id 1oq4gE-0006Lb-4I
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 23:44:42 -0400
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=83056df09e=guohuai.shi@windriver.com>)
 id 1oq4gA-0008MC-AU
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 23:44:41 -0400
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A22Liop032575; Tue, 1 Nov 2022 20:44:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=Pr9JDClBDecjdsnw0T15SXV/4wd3G9+KaIpeE3LQwtc=;
 b=Cg6VdZgUnJjB8W97YW1FgPVfk11Ft6TMjYB41Ze0wwfcJbmLmEs96Ok88yNngCpv94du
 FooItAldb4x2BGtP9npcw8eoFN31SmSxT1L5mtdxDZ7ABJQ4nHvLyXxXVh4tt8qpKXUP
 OnRYIkG9oG6bH3Bho82FisafYa6ATK96a+t1m2FF/he0ktS8aB5FDIYS4YeiIr9V+0V9
 jE9p4j4vvMJrKNhU5rkgri3xH1wnSG3cSyF+8vI75LtPJZDbCZIRTXRKz3S1qlxWo5J8
 7MzwZMvp3fBAlNJmt8vFNCrYBetsuhQE3+qEiyHGIxXDMcAQhKfuAP0l45QD0mPiqKAs Mg== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kh3pkjuvu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Nov 2022 20:44:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H3NZTntw6hPVW4NsTOCj2KUyq/hGVvnHoO0Z2P8EBqAai2tX6hbQWpmL3IG0OU/WVd/Y+juw4wEfbp1nJBHhab86DANjyghgRt0JGjql/10Qj5mRA3G1/KUP7T2jGa/BtVuODPDBdNaK4AkaAR4YmHDhO7BXgdFztfw3RNt1MxJUrqWSFoa/vb5TwOs8XFlHvF17aUJKnZUT33ziX8s69Qbrbtmsh48FVkyfOId41N/62a3KmLTWszZj4ZLHvWbsUu0id9r56ENgyBobQxQ5z5GP+zdh2hWv/UB/kBFu+fMR7m/Z32TWKyrerY906dUQpDRwROsOeI55PO1Pt/H8qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pr9JDClBDecjdsnw0T15SXV/4wd3G9+KaIpeE3LQwtc=;
 b=WblXHGLvJ9JAdv5f5ZNOEJmiv8xQDxrzHb3RjMiuS9X55NxZ1GYtJUtsB1xOwlFlxcuXJAlFAL09afr2wwvJmuEyqjol/TS5byORoEelN9mfTMNOgNJpWw7/QDU3fjcg48ypU/mZUuU61QAR3xQhIHjx1kNgDL/LhfjWuUNmHxyUOf87ZSX+138Qnl2jwUKm91q80jfm6BN9Wn0yeMpD7PddbwuPr2YdgA4Ddqi6qEbggMLbUztisscDk78fTVjGsV3GqJFTwMndQFn35Q68Dh8S9PtPj9GEDcKHKmf1/ILzl2dD3MDunQH8pEUf3K3AKGdFk/cdSN0BCOkEvLA8Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MN2PR11MB4173.namprd11.prod.outlook.com (2603:10b6:208:137::20)
 by IA1PR11MB6122.namprd11.prod.outlook.com (2603:10b6:208:3ee::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Wed, 2 Nov
 2022 03:44:15 +0000
Received: from MN2PR11MB4173.namprd11.prod.outlook.com
 ([fe80::d5da:febb:1542:911a]) by MN2PR11MB4173.namprd11.prod.outlook.com
 ([fe80::d5da:febb:1542:911a%4]) with mapi id 15.20.5769.019; Wed, 2 Nov 2022
 03:44:14 +0000
From: "Shi, Guohuai" <Guohuai.Shi@windriver.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: Greg Kurz <groug@kaod.org>, "Meng, Bin" <Bin.Meng@windriver.com>
Subject: RE: [PATCH 09/16] hw/9pfs: Disable unsupported flags and features for
 Windows
Thread-Topic: [PATCH 09/16] hw/9pfs: Disable unsupported flags and features
 for Windows
Thread-Index: AQHY52VFg9o7M4tGH0Os7IfLSKMdJ64qN5kAgAACtzCAAD7pgIAAie/Q
Date: Wed, 2 Nov 2022 03:44:14 +0000
Message-ID: <MN2PR11MB4173529A71C30E89E4DAF743EF399@MN2PR11MB4173.namprd11.prod.outlook.com>
References: <20221024045759.448014-1-bin.meng@windriver.com>
 <2442661.hKK5dv67Mp@silver>
 <MN2PR11MB4173559962E6363B726B884DEF369@MN2PR11MB4173.namprd11.prod.outlook.com>
 <2052313.fat1d0ETzH@silver>
In-Reply-To: <2052313.fat1d0ETzH@silver>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR11MB4173:EE_|IA1PR11MB6122:EE_
x-ms-office365-filtering-correlation-id: ac016993-9274-4533-e6b2-08dabc848322
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dCESTDe3pEwp8sPilyMCXbbwf8UfHRocZ2JG4wIFxIXZ3Q/yLSW+ZIQyTa6WDqvSnJpySQcD2d1dZP7ENLBZJ1LhTezRnAgiZQR6CzvIi0svN26bf4zIMDdeCzYqhtnvscdRhQiysxELLjnlIHBgp/VrdB6D/F5ZJ/FRGN59RQPASsrWj6zOuJTssmaryjF+LLTK1nAs4oJRYHEFvSCgZIqCzcVGAVpkGOOCeh6rXklM/6kfUHBF7aKvddDRk9wktxG8IsxdcRqfQqn+02qjzVjV1BjCr6n9DEJXbZpIuP51dDFmG2oG3M6kJGh6zsPq+845BfFmwfpV9TCJC0O0LfB8ryd+e+QB4dCqinxLZAPfN55p819j8l9NyUKt9uqEIv/h8XeNJRPPYD3ZMCtpqTNGsvRYopMTkAvkABhTTvlojWZESXdvLUGLoUTZMmhr1xkESg/aDz0Jtv+yzLU47pvp94nSjr/CzRtT+if+Dk08lg5ZtVbqFag6qxwPuC7irjUnrnVbl/mvwQCr8Xjdib6NzSaRHefZzj1eWp52Yl48cJXqiRn4VU8JwTk0Jx0m7Ol/D+oJtLuQQYCQnO037Q1J4jBo8wkbcPc3aQVrmG/A/V3fVBlkrBjG/xW4XyCayErtc3dRjpWDlr6Bi4c7DERYVimTdQ8f+wryQhW2vFoFIbKKARPyTBNziDoZUGZ4+wE8cLZaZDo52AgHCfihiYnd9ovWHPB4DcYIr7AgzUyAva0fuhm62amcldl/mEwumzzSy83dHOYACkVrTzlV3v4edJj432ubWYeqYy3c21LA43YPpEpK3PPPbv/iSVpOnuToICFKRc0jQoTRmW8kFQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4173.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39850400004)(136003)(396003)(366004)(346002)(451199015)(83380400001)(86362001)(55016003)(107886003)(478600001)(7696005)(6506007)(966005)(2906002)(71200400001)(30864003)(38070700005)(38100700002)(33656002)(122000001)(53546011)(9686003)(26005)(186003)(4326008)(76116006)(66946007)(66556008)(66446008)(64756008)(8676002)(66476007)(316002)(8936002)(41300700001)(54906003)(52536014)(110136005)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8tNzmJEnxTmEMzEhsHdXGUncEyL1+QMRCD6xx9Y8WxDE8Pyi+IxNH+toChJ7?=
 =?us-ascii?Q?k18AQs2jJcJgSzowAG/fJD1cEXSlcCiemfQcmfZo23z+Crf6Ct1hk/0lrWni?=
 =?us-ascii?Q?2x9b8lgCrsk9KXpAFI1P8mUGMmAqLZ6pM8JV6xRV1vmZltLIFOoeASHIOyLe?=
 =?us-ascii?Q?BMTyqrr/hGgyrhKKseLepK3974LFnHqzCotffzpnOVnDqRSQIRfv9Jmkt7gE?=
 =?us-ascii?Q?9wt70ZW60R0EwQkjftlD2NCDMok7KDybHi9VBvRq+ASmZXeGDtwOGUn2+jgP?=
 =?us-ascii?Q?n+ev18h1f0r2Ped+/HjGgYv9BefbJcgjRkpRVASdKy8KAQ16aGtScTuH7MKp?=
 =?us-ascii?Q?ZPyjgRtd2julbdsi0JbIjRETaOB+Pz6VuDipJTvmmlxXKGKzoi+OBc5ZTw76?=
 =?us-ascii?Q?Zr/3kP9BOWEKvZ0ZAkVYScrPsWI7EJX8AjIzVtdr7ifkZPo+jIi9iHLOL2Zj?=
 =?us-ascii?Q?2PYrCnzXVwtSeAdOhtTo5pZta1+j8Ik4yYr4IuU2MHI/YebaQ7d1bmGwnNtO?=
 =?us-ascii?Q?njj/jiH0D9hWKT+DH0uuo83TluE/2OF4wx+AMNOiTXE4aLRgc7zlyVogjXDy?=
 =?us-ascii?Q?yAMXejry+zeQZSNNE3PR7tEpni1IEVT3A8A13I0WOgOq1ha5+8DdHUjzleHf?=
 =?us-ascii?Q?88yoRvLN84J95VuInCjAiJJK+feQRkscjW4V3zQUXWM4FmTFafeDo4PndlF7?=
 =?us-ascii?Q?iIOC1ND4R0MEZG+TyEY56n/7BTHoY9ggMVzSbXAKKHZB8BxRUB72hV7D5vBs?=
 =?us-ascii?Q?KPFhptvNSkTird4K7YpEOyvg23nKcUq4n0ZdhE5Ug4fBCCv6e69dKxr3sGgr?=
 =?us-ascii?Q?cQZzNG6eJemt1S12tN+wFn+5xom91eVXOLsjZmvgPwRNuFSL/9pVcoSPBnP2?=
 =?us-ascii?Q?QCkOoTZMBBxUkOhXsNmmN0scA8FVdVJ3D17kKEkmOUDJtg7wjoHO6QfCn9kD?=
 =?us-ascii?Q?7uTdMaKWyvhVIwSLK0jTEDj4X9N3zPZWZ5MpOvdBpbV88excEuJqGejjWkqV?=
 =?us-ascii?Q?PsG7pnp3ukmZqz43cJws4ujvWeuUwJnmXKLskEsmjkyHBL5lF9c6zfhqHxf9?=
 =?us-ascii?Q?YMeLchALYxWt+MqH3lMPK/AvLVtwAApzWiyTNnb1TPLkyfyR6RBXTcgrF3rm?=
 =?us-ascii?Q?2x16GWnMhu8VwLPB1gT0FOlZUWeLKMCDW8Pv1oBsdLjmBqmtzBXJcCBZe2jY?=
 =?us-ascii?Q?Ihuk2S9cSj1jjn4J0Dy293nt/bynOGlG20d5ciNJRXGs2PjBZmSH2Acc0mMT?=
 =?us-ascii?Q?W/ExWATPLttsSxR/WBFz6/NnKsbdQZLZ1iV/cqh4NwMjix6zWkM1ee94ioxE?=
 =?us-ascii?Q?WZkygeP/0ImN29KU+FtQsW3DHRoARO7t+SYa8UpKw8NtbwVJ/5Xkik58cSnr?=
 =?us-ascii?Q?sET46W4Xg7IYuM6InjRX7P+Qg3LWbJqGDsYC6Js/+CWbdupXjvB833IV4Ngi?=
 =?us-ascii?Q?hoiDa56J/X+DkzyURxkyxFsOHyjETr3sfJYi9W9IPrmdoYj40iKUBDNBdWwz?=
 =?us-ascii?Q?Q+4nEBBA6IEhyo9S+HTQEb9PdeEpG7wdWQDQSU2FhxCr3yNLGoaiKEdoiE23?=
 =?us-ascii?Q?Z/542yZMqX48aUcbvsW0NzEJrUvs+4eGeEPowWvatcRqt192GZqKyj0MFsK9?=
 =?us-ascii?Q?6A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4173.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac016993-9274-4533-e6b2-08dabc848322
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2022 03:44:14.7529 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f+eiGR69j1bYVgPkf1FVC9nvJkWUw8HxsM2gcSHyX5uqKwFWxI5p+HsavYeZ/bLwgju3y9i6gzRb3aPN/fqNr2iGFvWU/J0EW4Rxj0VND5k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6122
X-Proofpoint-ORIG-GUID: BUcVSHpH_rS5B0IAMCGPxQdWpUhkBEE1
X-Proofpoint-GUID: BUcVSHpH_rS5B0IAMCGPxQdWpUhkBEE1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-01_12,2022-11-01_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 mlxscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 spamscore=0 malwarescore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211020021
Received-SPF: pass client-ip=205.220.166.238;
 envelope-from=prvs=83056df09e=guohuai.shi@windriver.com;
 helo=mx0a-0064b401.pphosted.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



> -----Original Message-----
> From: Christian Schoenebeck <qemu_oss@crudebyte.com>
> Sent: Wednesday, November 2, 2022 02:59
> To: qemu-devel@nongnu.org
> Cc: Greg Kurz <groug@kaod.org>; Meng, Bin <Bin.Meng@windriver.com>; Shi,
> Guohuai <Guohuai.Shi@windriver.com>
> Subject: Re: [PATCH 09/16] hw/9pfs: Disable unsupported flags and feature=
s
> for Windows
>=20
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>=20
> On Tuesday, November 1, 2022 4:34:54 PM CET Shi, Guohuai wrote:
> >
> > > -----Original Message-----
> > > From: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > Sent: Tuesday, November 1, 2022 23:04
> > > To: qemu-devel@nongnu.org
> > > Cc: Shi, Guohuai <Guohuai.Shi@windriver.com>; Greg Kurz
> > > <groug@kaod.org>; Meng, Bin <Bin.Meng@windriver.com>
> > > Subject: Re: [PATCH 09/16] hw/9pfs: Disable unsupported flags and
> > > features for Windows
> > >
> > > [Please note: This e-mail is from an EXTERNAL e-mail address]
> > >
> > > On Monday, October 24, 2022 6:57:52 AM CET Bin Meng wrote:
> > > > From: Guohuai Shi <guohuai.shi@windriver.com>
> > > >
> > > > Some flags and features are not supported on Windows, like mknod,
> > > > readlink, file mode, etc. Update the codes for Windows.
> > > >
> > > > Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
> > > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > > ---
> > > >
> > > >  hw/9pfs/9p-util.h |  6 +++-
> > > >  hw/9pfs/9p.c      | 90 ++++++++++++++++++++++++++++++++++++++++++-=
----
> > > >  2 files changed, 86 insertions(+), 10 deletions(-)
> > > >
> > > > diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h index
> > > > 82b2d0c3e4..3d154e9103 100644
> > > > --- a/hw/9pfs/9p-util.h
> > > > +++ b/hw/9pfs/9p-util.h
> > > > @@ -53,8 +53,10 @@ static inline uint64_t makedev_dotl(uint32_t
> > > > dev_major,
> > > uint32_t dev_minor)
> > > >   */
> > > >  static inline uint64_t host_dev_to_dotl_dev(dev_t dev)  { -#ifdef
> > > > CONFIG_LINUX
> > > > +#if defined(CONFIG_LINUX)
> > > >      return dev;
> > > > +#elif defined(CONFIG_WIN32)
> > > > +    return 0;
> > >
> > > Really?
> >
> > Check MS this document:
> > https://learn.microsoft.com/en-us/cpp/c-runtime-library/reference/fsta
> > t-fstat32-fstat64-fstati64-fstat32i64-fstat64i32?view=3Dmsvc-170
> > st_rdev: If a device, fd; otherwise 0.
> > st_dev: If a device, fd; otherwise 0.
> >
> > So for any file open, it should be 0.
>=20
> Yeah, but that function translates a corresponding device ID for *Linux*
> guest side. And the intention is to avoid e.g. file ID collisions on gues=
t
> side.
> Because for a Linux guest, the two-tuple (device number, inode number) ma=
kes
> a system-wide unique file ID.
>=20
> If you just return zero here, that might be OK if only one 9p directory i=
s
> exported to guest, but say you have "C:\foo\" exported and "D:\bar\" expo=
rted
> and mounted via 9p to guest, then guest would assume every file with the =
same
> inode number on those two to be the same files. But they are not. They ar=
e on
> two different drives actually.
>=20

Got it.
Windows does not provide any numerical type ID for device,=20
I think the solution could be using driver letter ASC code "C:", "D:", etc.

> >
> > >
> > > >  #else
> > > >      return makedev_dotl(major(dev), minor(dev));  #endif @@
> > > > -260,7
> > > > +262,9 @@ static inline struct dirent *qemu_dirent_dup(struct
> > > > +dirent
> > > > *dent)  #if defined CONFIG_DARWIN && defined
> > > > CONFIG_PTHREAD_FCHDIR_NP int pthread_fchdir_np(int fd)
> > > > __attribute__((weak_import));  #endif
> > > > +#ifndef CONFIG_WIN32
> > > >  int qemu_mknodat(P9_FILE_ID dirfd, const char *filename, mode_t mo=
de,
> > > >                   dev_t dev);
> > > > +#endif
> > > >
> > > >  #endif
> > > > diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c index
> > > > 6c4af86240..771aab34ac
> > > > 100644
> > > > --- a/hw/9pfs/9p.c
> > > > +++ b/hw/9pfs/9p.c
> > > > @@ -39,6 +39,11 @@
> > > >  #include "qemu/xxhash.h"
> > > >  #include <math.h>
> > > >
> > > > +#ifdef CONFIG_WIN32
> > > > +#define UTIME_NOW   ((1l << 30) - 1l)
> > > > +#define UTIME_OMIT  ((1l << 30) - 2l) #endif
> > > > +
> > > >  int open_fd_hw;
> > > >  int total_open_fd;
> > > >  static int open_fd_rc;
> > > > @@ -132,13 +137,17 @@ static int dotl_to_open_flags(int flags)
> > > >      DotlOpenflagMap dotl_oflag_map[] =3D {
> > > >          { P9_DOTL_CREATE, O_CREAT },
> > > >          { P9_DOTL_EXCL, O_EXCL },
> > > > +#ifndef CONFIG_WIN32
> > > >          { P9_DOTL_NOCTTY , O_NOCTTY },
> > > > +#endif
> > > >          { P9_DOTL_TRUNC, O_TRUNC },
> > > >          { P9_DOTL_APPEND, O_APPEND },
> > > > +#ifndef CONFIG_WIN32
> > > >          { P9_DOTL_NONBLOCK, O_NONBLOCK } ,
> > > >          { P9_DOTL_DSYNC, O_DSYNC },
> > > >          { P9_DOTL_FASYNC, FASYNC }, -#ifndef CONFIG_DARWIN
> > > > +#endif
> > > > +#ifdef CONFIG_LINUX
> > >
> > > Better
> > >
> > >    #if !defined(CONFIG_DARWIN) && !defined(CONFIG_WIN32)
> > >
> >
> > It is OK.
>=20
> You got my point, hopefully:
>=20
> > > Otherwise it might automatically opt-out other future platforms
> > > unintentionally.
> > >
> > > >          { P9_DOTL_NOATIME, O_NOATIME },
> > > >          /*
> > > >           *  On Darwin, we could map to F_NOCACHE, which is @@
> > > > -151,8
> > > > +160,10 @@ static int dotl_to_open_flags(int flags)  #endif
> > > >          { P9_DOTL_LARGEFILE, O_LARGEFILE },
> > > >          { P9_DOTL_DIRECTORY, O_DIRECTORY },
> > > > +#ifndef CONFIG_WIN32
> > > >          { P9_DOTL_NOFOLLOW, O_NOFOLLOW },
> > > >          { P9_DOTL_SYNC, O_SYNC },
> > > > +#endif
> > > >      };
> > > >
> > > >      for (i =3D 0; i < ARRAY_SIZE(dotl_oflag_map); i++) { @@ -179,8
> > > > +190,11 @@ static int get_dotl_openflags(V9fsState *s, int oflags)
> > > >       * Filter the client open flags
> > > >       */
> > > >      flags =3D dotl_to_open_flags(oflags);
> > > > -    flags &=3D ~(O_NOCTTY | O_ASYNC | O_CREAT);
> > > > -#ifndef CONFIG_DARWIN
> > > > +    flags &=3D ~(O_CREAT);
> > > > +#ifndef CONFIG_WIN32
> > > > +    flags &=3D ~(O_NOCTTY | O_ASYNC); #endif #ifdef CONFIG_LINUX
> > >
> > > Same as above: better explicitly opt-out than the other way around.
> > >
> >
> > It is OK.
> >
> > > >      /*
> > > >       * Ignore direct disk access hint until the server supports it=
.
> > > >       */
> > > > @@ -986,9 +1000,11 @@ static int stat_to_qid(V9fsPDU *pdu, const
> > > > struct
> > > stat *stbuf, V9fsQID *qidp)
> > > >      if (S_ISDIR(stbuf->st_mode)) {
> > > >          qidp->type |=3D P9_QID_TYPE_DIR;
> > > >      }
> > > > +#ifndef CONFIG_WIN32
> > > >      if (S_ISLNK(stbuf->st_mode)) {
> > > >          qidp->type |=3D P9_QID_TYPE_SYMLINK;
> > > >      }
> > > > +#endif
> > > >
> > > >      return 0;
> > > >  }
> > > > @@ -1097,6 +1113,7 @@ static mode_t v9mode_to_mode(uint32_t mode,
> > > V9fsString *extension)
> > > >          ret |=3D S_IFDIR;
> > > >      }
> > > >
> > > > +#ifndef CONFIG_WIN32
> > > >      if (mode & P9_STAT_MODE_SYMLINK) {
> > > >          ret |=3D S_IFLNK;
> > > >      }
> > > > @@ -1106,6 +1123,7 @@ static mode_t v9mode_to_mode(uint32_t mode,
> > > V9fsString *extension)
> > > >      if (mode & P9_STAT_MODE_NAMED_PIPE) {
> > > >          ret |=3D S_IFIFO;
> > > >      }
> > > > +#endif
> > > >      if (mode & P9_STAT_MODE_DEVICE) {
> > > >          if (extension->size && extension->data[0] =3D=3D 'c') {
> > > >              ret |=3D S_IFCHR;
> > > > @@ -1118,6 +1136,7 @@ static mode_t v9mode_to_mode(uint32_t mode,
> > > V9fsString *extension)
> > > >          ret |=3D S_IFREG;
> > > >      }
> > > >
> > > > +#ifndef CONFIG_WIN32
> > > >      if (mode & P9_STAT_MODE_SETUID) {
> > > >          ret |=3D S_ISUID;
> > > >      }
> > > > @@ -1127,6 +1146,7 @@ static mode_t v9mode_to_mode(uint32_t mode,
> > > V9fsString *extension)
> > > >      if (mode & P9_STAT_MODE_SETVTX) {
> > > >          ret |=3D S_ISVTX;
> > > >      }
> > > > +#endif
> > > >
> > > >      return ret;
> > > >  }
> > > > @@ -1182,6 +1202,7 @@ static uint32_t stat_to_v9mode(const struct
> > > > stat
> > > *stbuf)
> > > >          mode |=3D P9_STAT_MODE_DIR;
> > > >      }
> > > >
> > > > +#ifndef CONFIG_WIN32
> > > >      if (S_ISLNK(stbuf->st_mode)) {
> > > >          mode |=3D P9_STAT_MODE_SYMLINK;
> > > >      }
> > > > @@ -1193,11 +1214,13 @@ static uint32_t stat_to_v9mode(const
> > > > struct stat
> > > *stbuf)
> > > >      if (S_ISFIFO(stbuf->st_mode)) {
> > > >          mode |=3D P9_STAT_MODE_NAMED_PIPE;
> > > >      }
> > > > +#endif
> > > >
> > > >      if (S_ISBLK(stbuf->st_mode) || S_ISCHR(stbuf->st_mode)) {
> > > >          mode |=3D P9_STAT_MODE_DEVICE;
> > > >      }
> > > >
> > > > +#ifndef CONFIG_WIN32
> > > >      if (stbuf->st_mode & S_ISUID) {
> > > >          mode |=3D P9_STAT_MODE_SETUID;
> > > >      }
> > > > @@ -1209,6 +1232,7 @@ static uint32_t stat_to_v9mode(const struct
> > > > stat
> > > *stbuf)
> > > >      if (stbuf->st_mode & S_ISVTX) {
> > > >          mode |=3D P9_STAT_MODE_SETVTX;
> > > >      }
> > > > +#endif
> > > >
> > > >      return mode;
> > > >  }
> > > > @@ -1247,9 +1271,17 @@ static int coroutine_fn
> > > > stat_to_v9stat(V9fsPDU *pdu,
> > > V9fsPath *path,
> > > >              return err;
> > > >          }
> > > >      } else if (v9stat->mode & P9_STAT_MODE_DEVICE) {
> > > > +        unsigned maj, min;
> > > > +
> > > > +#ifndef CONFIG_WIN32
> > > > +        maj =3D major(stbuf->st_rdev);
> > > > +        min =3D minor(stbuf->st_rdev); #else
> > > > +        maj =3D min =3D 0;
> > > > +#endif
> > >
> > > Really?
> >
> > See above link.
> >
> > >
> > > >          v9fs_string_sprintf(&v9stat->extension, "%c %u %u",
> > > >                  S_ISCHR(stbuf->st_mode) ? 'c' : 'b',
> > > > -                major(stbuf->st_rdev), minor(stbuf->st_rdev));
> > > > +                maj, min);
> > > >      } else if (S_ISDIR(stbuf->st_mode) || S_ISREG(stbuf->st_mode))=
 {
> > > >          v9fs_string_sprintf(&v9stat->extension, "%s %lu",
> > > >                  "HARDLINKCOUNT", (unsigned long)stbuf->st_nlink);
> > > > @@
> > > > -1317,7 +1349,14 @@ static int32_t blksize_to_iounit(const V9fsPDU
> > > > *pdu, int32_t blksize)
> > > >
> > > >  static int32_t stat_to_iounit(const V9fsPDU *pdu, const struct
> > > > stat
> > > > *stbuf)  {
> > > > -    return blksize_to_iounit(pdu, stbuf->st_blksize);
> > > > +    int32_t blksize;
> > > > +
> > > > +#ifndef CONFIG_WIN32
> > > > +    blksize =3D stbuf->st_blksize); #else
> > > > +    blksize =3D 0;
> > > > +#endif
> > >
> > > Really?
> >
> > Windows struct stat does not have such field. See above link.
>=20
> Yeah, but you cannot simply return zero here, because that information is
> interpreted on guest side as the optimum chunk size for I/O. So some apps
> might misbehave e.g. by trying allocate buffers with zero size, throwing
> division by zero exceptions, or trying to read() / write() with zero chun=
k
> size.
>=20
> I'm pretty sure there is some kind of API to get the block size of the
> underlying drive on Windows. And if not, then something like 4k or 8k is
> still better than zero.
>=20

The possible solution could be put a hard-code (e.g. 4096, 512) here.
This function does not have any context parameter for input.
To get block size, need a file handle or path. But this function does not h=
ave it.

> > >
> > > > +    return blksize_to_iounit(pdu, blksize);
> > > >  }
> > > >
> > > >  static int stat_to_v9stat_dotl(V9fsPDU *pdu, const struct stat
> > > > *stbuf, @@ -1332,7 +1371,11 @@ static int
> > > > stat_to_v9stat_dotl(V9fsPDU *pdu,
> > > const struct stat *stbuf,
> > > >      v9lstat->st_rdev =3D host_dev_to_dotl_dev(stbuf->st_rdev);
> > > >      v9lstat->st_size =3D stbuf->st_size;
> > > >      v9lstat->st_blksize =3D stat_to_iounit(pdu, stbuf);
> > > > +#ifndef CONFIG_WIN32
> > > >      v9lstat->st_blocks =3D stbuf->st_blocks;
> > > > +#else
> > > > +    v9lstat->st_blocks =3D 0;
> > > > +#endif
> > >
> > > Really?
> >
> > Windows struct stat does not have such field. See above link.
>=20
> Then it probably has to be calculated by file size / block size.

Got it.

>=20
> > >
> > > >      v9lstat->st_atime_sec =3D stbuf->st_atime;
> > > >      v9lstat->st_mtime_sec =3D stbuf->st_mtime;
> > > >      v9lstat->st_ctime_sec =3D stbuf->st_ctime; @@ -1340,7 +1383,8
> > > > @@ static int stat_to_v9stat_dotl(V9fsPDU *pdu, const struct stat
> *stbuf,
> > > >      v9lstat->st_atime_nsec =3D stbuf->st_atimespec.tv_nsec;
> > > >      v9lstat->st_mtime_nsec =3D stbuf->st_mtimespec.tv_nsec;
> > > >      v9lstat->st_ctime_nsec =3D stbuf->st_ctimespec.tv_nsec; -#else
> > > > +#endif
> > > > +#ifdef CONFIG_LINUX
> > > >      v9lstat->st_atime_nsec =3D stbuf->st_atim.tv_nsec;
> > > >      v9lstat->st_mtime_nsec =3D stbuf->st_mtim.tv_nsec;
> > > >      v9lstat->st_ctime_nsec =3D stbuf->st_ctim.tv_nsec; @@ -2471,6
> > > > +2515,7 @@ static int coroutine_fn v9fs_do_readdir(V9fsPDU *pdu,
> > > V9fsFidState *fidp,
> > > >      struct dirent *dent;
> > > >      struct stat *st;
> > > >      struct V9fsDirEnt *entries =3D NULL;
> > > > +    unsigned char d_type =3D 0;
> > > >
> > > >      /*
> > > >       * inode remapping requires the device id, which in turn
> > > > might be @@ -2540,10 +2585,13 @@ static int coroutine_fn
> > > > v9fs_do_readdir(V9fsPDU
> > > *pdu, V9fsFidState *fidp,
> > > >          v9fs_string_init(&name);
> > > >          v9fs_string_sprintf(&name, "%s", dent->d_name);
> > > >
> > > > +#ifndef CONFIG_WIN32
> > > > +        d_type =3D dent->d_type;
> > > > +#endif
> > > >          /* 11 =3D 7 + 4 (7 =3D start offset, 4 =3D space for stori=
ng count)
> */
> > > >          len =3D pdu_marshal(pdu, 11 + count, "Qqbs",
> > > >                            &qid, off,
> > > > -                          dent->d_type, &name);
> > > > +                          d_type, &name);
> > >
> > > Are you saying that d_type is not initialized with zero already?
> >
> > struct dirent is defined by MinGW, it does not have d_type member:
> >
> > https://github.com/Alexpux/mingw-w64/blob/master/mingw-w64-headers/crt
> > /dirent.h
>=20
> My bad, I misread your code. That's fine.
>=20
> >
> > >
> > > >          v9fs_string_free(&name);
> > > >
> > > > @@ -2873,8 +2921,12 @@ static void coroutine_fn v9fs_create(void
> *opaque)
> > > >          }
> > > >
> > > >          nmode |=3D perm & 0777;
> > > > +#ifndef CONFIG_WIN32
> > > >          err =3D v9fs_co_mknod(pdu, fidp, &name, fidp->uid, -1,
> > > >                              makedev(major, minor), nmode,
> > > > &stbuf);
> > > > +#else
> > > > +        err =3D -ENOTSUP;
> > > > +#endif
> > > >          if (err < 0) {
> > > >              goto out;
> > > >          }
> > > > @@ -2899,8 +2951,12 @@ static void coroutine_fn v9fs_create(void
> *opaque)
> > > >          v9fs_path_copy(&fidp->path, &path);
> > > >          v9fs_path_unlock(s);
> > > >      } else if (perm & P9_STAT_MODE_SOCKET) {
> > > > +#ifndef CONFIG_WIN32
> > > >          err =3D v9fs_co_mknod(pdu, fidp, &name, fidp->uid, -1,
> > > >                              0, S_IFSOCK | (perm & 0777), &stbuf);
> > > > +#else
> > > > +        err =3D -ENOTSUP;
> > > > +#endif
> > >
> > > As with previous patches, I would consider making the user aware to
> > > use
> > > mapped(-xattr) with something like error_report_once().
> >
> > OK, got it.
> >
> > >
> > > >          if (err < 0) {
> > > >              goto out;
> > > >          }
> > > > @@ -3634,7 +3690,7 @@ out_nofid:
> > > >
> > > >  static void coroutine_fn v9fs_mknod(void *opaque)  {
> > > > -
> > > > +#ifndef CONFIG_WIN32
> > > >      int mode;
> > > >      gid_t gid;
> > > >      int32_t fid;
> > > > @@ -3691,6 +3747,10 @@ out:
> > > >  out_nofid:
> > > >      pdu_complete(pdu, err);
> > > >      v9fs_string_free(&name);
> > > > +#else
> > > > +    V9fsPDU *pdu =3D opaque;
> > > > +    pdu_complete(pdu, -1);
> > > > +#endif
> > > >  }
> > > >
> > > >  /*
> > > > @@ -3963,7 +4023,7 @@ out_nofid:
> > > >  #if defined(CONFIG_LINUX)
> > > >  /* Currently, only Linux has XATTR_SIZE_MAX */  #define
> > > > P9_XATTR_SIZE_MAX XATTR_SIZE_MAX -#elif defined(CONFIG_DARWIN)
> > > > +#elif defined(CONFIG_DARWIN) || defined(CONFIG_WIN32)
> > > >  /*
> > > >   * Darwin doesn't seem to define a maximum xattr size in its user
> > > >   * space header, so manually configure it across platforms as 64k.
> > > > @@ -3980,6 +4040,7 @@ out_nofid:
> > > >
> > > >  static void coroutine_fn v9fs_xattrcreate(void *opaque)  {
> > > > +#ifndef CONFIG_WIN32
> > > >      int flags, rflags =3D 0;
> > > >      int32_t fid;
> > > >      uint64_t size;
> > > > @@ -4041,10 +4102,15 @@ out_put_fid:
> > > >  out_nofid:
> > > >      pdu_complete(pdu, err);
> > > >      v9fs_string_free(&name);
> > > > +#else
> > > > +    V9fsPDU *pdu =3D opaque;
> > > > +    pdu_complete(pdu, -1);
> > > > +#endif
> > > >  }
> > > >
> > > >  static void coroutine_fn v9fs_readlink(void *opaque)  {
> > > > +#ifndef CONFIG_WIN32
> > > >      V9fsPDU *pdu =3D opaque;
> > > >      size_t offset =3D 7;
> > > >      V9fsString target;
> > > > @@ -4080,6 +4146,10 @@ out:
> > > >      put_fid(pdu, fidp);
> > > >  out_nofid:
> > > >      pdu_complete(pdu, err);
> > > > +#else
> > > > +    V9fsPDU *pdu =3D opaque;
> > > > +    pdu_complete(pdu, -1);
> > > > +#endif
> > >
> > > Unnecessary double declaration of pdu.
> > >
> >
> > OK, got it.
> >
> > > >  }
> > > >
> > > >  static CoroutineEntry *pdu_co_handlers[] =3D { @@ -4341,6 +4411,7
> > > > @@ void v9fs_reset(V9fsState *s)
> > > >
> > > >  static void __attribute__((__constructor__))
> > > > v9fs_set_fd_limit(void) {
> > > > +#ifndef CONFIG_WIN32
> > > >      struct rlimit rlim;
> > > >      if (getrlimit(RLIMIT_NOFILE, &rlim) < 0) {
> > > >          error_report("Failed to get the resource limit"); @@
> > > > -4348,4
> > > > +4419,5 @@ static void __attribute__((__constructor__))
> > > v9fs_set_fd_limit(void)
> > > >      }
> > > >      open_fd_hw =3D rlim.rlim_cur - MIN(400, rlim.rlim_cur / 3);
> > > >      open_fd_rc =3D rlim.rlim_cur / 2;
> > > > +#endif
> > >
> > > Really?
> >
> > Windows does not provide getrlimit()
>=20
> But it has _getmaxstdio() and _setmaxstdio().
>=20
> And even if Windows had no replacement functions, you need to initialize
> these two global variables with some meaningful value. Otherwise they wou=
ld
> be zero, and that would mean 9p server would assume max. 0 files could be
> open at the same time, so it would constantly close and re-open every sin=
gle
> file descriptor on every minor micro-transaction for no reason.

I could implement this function by _getmaxstdio() and _setmaxstdio().
But these two functions are used for struct FILE, but not file descriptor (=
FD).
I wrote a basic test for this function:
  _getmaxstdio() returns 512, but I can use "open" to open at least 600 fil=
es without error.

Windows does not provide any document about the limititaion.

I think we can put a hard code here: 512, 1024, 2048, etc.


Thanks
Guohuai

>=20
> Best regards,
> Christian Schoenebeck
>=20


