Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8C161500B
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 18:10:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1optIT-0005YJ-4k; Tue, 01 Nov 2022 11:35:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8304fcac20=guohuai.shi@windriver.com>)
 id 1optIN-0005Xb-K2
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 11:35:21 -0400
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8304fcac20=guohuai.shi@windriver.com>)
 id 1optII-0002UI-88
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 11:35:18 -0400
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A1CoAOj020464; Tue, 1 Nov 2022 08:34:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=RZ3u7TvxA/0EL0nNL4LEZCzEsv6d7SF9TB9xCsnvuqQ=;
 b=IbYOzL7HuOLg8//ML+E9zOzENgDf2+1PB/S+C6XVRTsyjJmUiNAv6/gVOHbpaZA0rjfx
 Y2snh64ZmLA01Hg1eCwnp1GrozGWIqGlSz5KAQEDrHzN0Ar0sXUKFET0iUvfrgduXnQE
 WNB61vQCHvCPbWJFVMCM0/zrTG9T0Lgb8Vu2F6xGk+b9mwgmwGSTvV1fD39f8Ja6dVAS
 MtOZh0GjaucAZ0JXNtnGcmS4lOli5AzoF0ZNTzkKimVkOZvlAyT8x7rAguhME4xfniZy
 q6Eg1gRGoOcqDSFcqLzA3gVZT8MCThNjus407PBmwXsTIHZtQFQDZN6IRlU0cvm+Xwnp Gw== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kh3pkj81p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Nov 2022 08:34:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UZ0Qcm3dfR86t6xCXY39Q0kgPTWuQfGZKPsliJXzIs4wvaKs+d/P5AmpuPs7fv5NxbsA2wfajBwnDJwAlOGJ79SDfhLRugyWFJCfCIqE8UNl3IcAfKf0HPycAGetVXeIhqQED4efkusYDngPogjl1ZTV9D3eYiiY0z3lP7/qwAKTtLwSgrFsy6I4fKgER+N1RNTLT1aCOGcMzV1p9aLGCWitelX2Q+oSoWf87XIHZ7vQQkqAqiYaC72qlamwGf9s0/eTeFlLp6fxIqCxSsgY4GQ9Mut60iICOLhrGbMG9SWhlML7Wn5jeMiCkOTLXi0f2bv1Jv6Ip6u+ttT5kvOOfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RZ3u7TvxA/0EL0nNL4LEZCzEsv6d7SF9TB9xCsnvuqQ=;
 b=F0pCPx2js2eEQW8G0IxJCT2BbfkF9v3aph/dM+dAHU+V7VMT3AP/GHl24j5YrGUnHWTmiAssam7rQOu3+mQfWMO3Q/yjv7BdKcZh2OMhvMyvN15QIMcWEg81sQNb/dK+/T3pQR/UwdBs2xVdKJzTxgBn6JH0nH6mXWdTAFBSw48banxSNi3oTTL96BaqwDo5GnLkmllF2SKNr8bayPUrjuEPsozGcFq0Zq+AODW4ZsqXdOrcnOU3qMGKFCGQC2KWjAtaZ12mzwboP4ARO3bk8CgcbN8pdmVdpHgvZQXonb6EHXZCtAh/ujMBfm2VahYCmHRdEKrrtb1mPkwLRX/DUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MN2PR11MB4173.namprd11.prod.outlook.com (2603:10b6:208:137::20)
 by CY5PR11MB6090.namprd11.prod.outlook.com (2603:10b6:930:2e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Tue, 1 Nov
 2022 15:34:54 +0000
Received: from MN2PR11MB4173.namprd11.prod.outlook.com
 ([fe80::d5da:febb:1542:911a]) by MN2PR11MB4173.namprd11.prod.outlook.com
 ([fe80::d5da:febb:1542:911a%4]) with mapi id 15.20.5769.019; Tue, 1 Nov 2022
 15:34:54 +0000
From: "Shi, Guohuai" <Guohuai.Shi@windriver.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: Greg Kurz <groug@kaod.org>, "Meng, Bin" <Bin.Meng@windriver.com>
Subject: RE: [PATCH 09/16] hw/9pfs: Disable unsupported flags and features for
 Windows
Thread-Topic: [PATCH 09/16] hw/9pfs: Disable unsupported flags and features
 for Windows
Thread-Index: AQHY52VFg9o7M4tGH0Os7IfLSKMdJ64qN5kAgAACtzA=
Date: Tue, 1 Nov 2022 15:34:54 +0000
Message-ID: <MN2PR11MB4173559962E6363B726B884DEF369@MN2PR11MB4173.namprd11.prod.outlook.com>
References: <20221024045759.448014-1-bin.meng@windriver.com>
 <20221024045759.448014-10-bin.meng@windriver.com> <2442661.hKK5dv67Mp@silver>
In-Reply-To: <2442661.hKK5dv67Mp@silver>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR11MB4173:EE_|CY5PR11MB6090:EE_
x-ms-office365-filtering-correlation-id: e3661b22-a16e-4c15-6dfa-08dabc1e9fdd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r6dU2V4+kGUjnGZ8zX1DDnWD88kdUI5p+0NGSVKmaaBDVqP0GXsSZ0aXKfOPjK4qWtLYKYqDK5/oDt5JW903BHdbDOx//HWVUOI3V0divrp8/QWwhftMVRQE3eLiU/x/+eppb2/vmsQSLly6gQfv7Xeua7G6DqRLh8kpFx4k7zRtx7eI+1Ws1sF2QezMte/NAvR0iDdxfgtXlVeMCnBP4Yg+db372ZB6tHCTfaFsc/PGWGAKj7TqcGSneQ/Hp3NgPN6F6eOVB7jYruGpUuE8BwC13aBmZfQOcarQJMqEKLpyLmTE0VxOM4XRX1uS1b4HaICS4nKrwwq9gunMMkbvsMjZRqNPhOvgL0Vyue03V56uNgsRxlwFW6a4z0TBDf4RGCP73YItlunEq27h98BhJv2+sExotbj81fepmW/AJiGWg7CYdDmbCTwuE95IOs1Y8rLCelBO4Ks6TjBqLLQTsfTYOPrWLNPtxWQ4JTePmUPWjtlteCTlHlCg87dPMHYOmzxZMHYVUAiT9RLBZC5BtbC8dxThLSTmsb5JGtpD7Z4B27x3g9k0qxIpLlZfixOim3Yd0BK0co9RpEchSKUSchM1fSMiI34Hz0+p2woErZEJgw93F8XkezQt7TbdBesChiva3Q4346IwcrV1FER/lywAQZx2Clh4LP8acgPkLH3qgswgl3+fV7sJncrxz79a1vMdi16u1j5F6PLYoHaCz3ETsnPV6rEGDy6EK6Xdz+FawGcKpGSMe0ncYd1dSckl8LeDgJXkCjozG8h7KRw/euOJ/w8l/4UOHuijhCDVTwAoFFkTyHwTf5uDRzf+Uy5BmO2bbcyVfgsW105Z9sBo3A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4173.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39850400004)(376002)(396003)(346002)(136003)(366004)(451199015)(26005)(9686003)(52536014)(41300700001)(8936002)(5660300002)(83380400001)(122000001)(38100700002)(2906002)(30864003)(186003)(38070700005)(6506007)(478600001)(966005)(71200400001)(66556008)(55016003)(86362001)(66476007)(76116006)(66946007)(64756008)(4326008)(33656002)(53546011)(8676002)(107886003)(7696005)(110136005)(316002)(54906003)(66446008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?26en5pLh0DVXm7uDGOT35Li/jQ09s1GxNf9R7PCEKg0Jb/E7fNvACzew9hqF?=
 =?us-ascii?Q?vOcBb165dYQtoxvEb98u+mhl0cAE68FA79DbP5S0VPZmx8JPVrYidnh/mH2W?=
 =?us-ascii?Q?WJLKBMjS7rf6MbtQ7zfZP5HJP3Sbj8BwEIJoFxw8TZG5NxTe1/E3Cb/5fdJL?=
 =?us-ascii?Q?A0IB9Q9hLYLOiqPglt0Tv2Vq0FEEB0SffMTUnH5Gbq7AbEfK/92YPG3+V3VB?=
 =?us-ascii?Q?fMrKWE81YyAaDPJez3S7xxsmorEu9IBXeeClmJbWDrcZCRENi11ht34Yc82z?=
 =?us-ascii?Q?w1Q8JvE711v2jRGmfSxhB4J6NXd1IM0vx9Rs+FBeD3rM5cHaLubqpGjjiLOm?=
 =?us-ascii?Q?w90MILiMvK2Q56+19p+z5EDIPCtEqtvpGmfhURiu2eUnp8+Sp61aB11Upd1j?=
 =?us-ascii?Q?Yh5TTy5Ulwwsia01P1PjmvF6uYOVi7WSlGpogV+RxEpnZ6KGLMt0XGdlTa1H?=
 =?us-ascii?Q?LgHJffpU+9ecKhYrCVuKX+BZKaVRFzZ6OpMj995WhKHebHHQj4g0YTp0WMGc?=
 =?us-ascii?Q?E+XSINp/mY6G9wgdTs/RWraWEYn6JRyFUA5p5WzXH/2T0QZuT2zXaOc+f1ka?=
 =?us-ascii?Q?wnaCUubwv70RPPb+kRzrPxi5cFZQJ0NT3JvjiPV3Hqoj/yi6VOwqZXrTqlu2?=
 =?us-ascii?Q?cSkG5K3l2cmQmHNZAtb1FzWWsoitm3pI9aeOECrfGpBd206apUCue55qjZm8?=
 =?us-ascii?Q?36kofbIlItEEb11a44ZEZ16QQruFAclZxPtMknrTUe9EBxhqFX07N/ZUWot1?=
 =?us-ascii?Q?6e86oCO0KhItyMaHXVL/oVryd76okIubv5DfwmbfDpEMuPcz7m+npVyR9cPh?=
 =?us-ascii?Q?0F2uVdwOrW8464lD6W5JRbW6q/Rj05Fckd3KxHspn3JrFzrZMyDD7nPtweLd?=
 =?us-ascii?Q?pxfo1vGUZaRm2Zs3Qr2A7F6pEoqfwIllHskfhW614dMhDZhUuKKbiXBhdf64?=
 =?us-ascii?Q?n40JQP/wh3QGIZUQRE4/NrYDrUgaWD60lYXPNm1lHvQvPtZ8fxXnO3KRcdyu?=
 =?us-ascii?Q?d0fzP8IDKTv/V/WMdD5wN3R++7GVZ9yq0dHXqeLPe3SUmXnLWsq1VyFkjqoq?=
 =?us-ascii?Q?JvyzR5QCRqsUHyDRZ4IxfIdKUY8OUClE0DONb1+loNc34quGk1cgkUmU1vF/?=
 =?us-ascii?Q?iBmIDktA81PSKcQg2rR6DhhbjdzS8p6m9YTLaNGsm2w+Cryf4OxyfSA0CJUW?=
 =?us-ascii?Q?u7z+Nt3930KJMMGO4WS88r3y4VqEjeSM7YCgaKWsCQlncCILA8qaawlTiT+J?=
 =?us-ascii?Q?sDcL/j+dBFDYFy2Gu7nUqxuqEkZaZO1gPU12hK0DaQf2G9ozlHqvpbUfAMK0?=
 =?us-ascii?Q?NCPFQ+3T5oyKhB5AgK43EJkZPFxKXUS8gQU+v2t+bukEinOGQYevN0u1ANvD?=
 =?us-ascii?Q?NyiZbMNoPSUENTSOUCbTmATsX7nHTSuJNw3AmNGaHUqoQaxQCxdLmKZaZxED?=
 =?us-ascii?Q?RniqJPqOaITq0Rcc3Q/kkNPH+K3geelytF7eYZx3hCnNsMaUbf6THkjQwFwa?=
 =?us-ascii?Q?s8UKTEZZ/gcH4Za2J318ZsBvs2BWfXtTFx6Txl+oqBCXc/NGYcFwze7128BS?=
 =?us-ascii?Q?8S6taQbPdXD9uGBFF1b9DzjDd0WTdVKBsik3twkiEDm7Hxvcj54Ws0yQhDSX?=
 =?us-ascii?Q?Ig=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4173.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3661b22-a16e-4c15-6dfa-08dabc1e9fdd
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2022 15:34:54.3007 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dwLd1SpAK62iI+glTAcNIaJuWeHCJPivg4XCBwW9XXOXFcRfzCEdU5lRJ1iKLUx+l+1X4LUk4dBXrdUlapgEJ6SEapPCCfAkdl3e2HV5iC4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6090
X-Proofpoint-ORIG-GUID: Fta9vBsoTROITGCVbd-rwT6XcYwB3IPI
X-Proofpoint-GUID: Fta9vBsoTROITGCVbd-rwT6XcYwB3IPI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-01_07,2022-11-01_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 mlxscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 spamscore=0 malwarescore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211010117
Received-SPF: pass client-ip=205.220.166.238;
 envelope-from=prvs=8304fcac20=guohuai.shi@windriver.com;
 helo=mx0a-0064b401.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
> Sent: Tuesday, November 1, 2022 23:04
> To: qemu-devel@nongnu.org
> Cc: Shi, Guohuai <Guohuai.Shi@windriver.com>; Greg Kurz <groug@kaod.org>;
> Meng, Bin <Bin.Meng@windriver.com>
> Subject: Re: [PATCH 09/16] hw/9pfs: Disable unsupported flags and feature=
s
> for Windows
>=20
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>=20
> On Monday, October 24, 2022 6:57:52 AM CET Bin Meng wrote:
> > From: Guohuai Shi <guohuai.shi@windriver.com>
> >
> > Some flags and features are not supported on Windows, like mknod,
> > readlink, file mode, etc. Update the codes for Windows.
> >
> > Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > ---
> >
> >  hw/9pfs/9p-util.h |  6 +++-
> >  hw/9pfs/9p.c      | 90 ++++++++++++++++++++++++++++++++++++++++++-----
> >  2 files changed, 86 insertions(+), 10 deletions(-)
> >
> > diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h index
> > 82b2d0c3e4..3d154e9103 100644
> > --- a/hw/9pfs/9p-util.h
> > +++ b/hw/9pfs/9p-util.h
> > @@ -53,8 +53,10 @@ static inline uint64_t makedev_dotl(uint32_t dev_maj=
or,
> uint32_t dev_minor)
> >   */
> >  static inline uint64_t host_dev_to_dotl_dev(dev_t dev)  { -#ifdef
> > CONFIG_LINUX
> > +#if defined(CONFIG_LINUX)
> >      return dev;
> > +#elif defined(CONFIG_WIN32)
> > +    return 0;
>=20
> Really?

Check MS this document: https://learn.microsoft.com/en-us/cpp/c-runtime-lib=
rary/reference/fstat-fstat32-fstat64-fstati64-fstat32i64-fstat64i32?view=3D=
msvc-170
st_rdev: If a device, fd; otherwise 0.
st_dev: If a device, fd; otherwise 0.

So for any file open, it should be 0.

>=20
> >  #else
> >      return makedev_dotl(major(dev), minor(dev));  #endif @@ -260,7
> > +262,9 @@ static inline struct dirent *qemu_dirent_dup(struct dirent
> > *dent)  #if defined CONFIG_DARWIN && defined CONFIG_PTHREAD_FCHDIR_NP
> > int pthread_fchdir_np(int fd) __attribute__((weak_import));  #endif
> > +#ifndef CONFIG_WIN32
> >  int qemu_mknodat(P9_FILE_ID dirfd, const char *filename, mode_t mode,
> >                   dev_t dev);
> > +#endif
> >
> >  #endif
> > diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c index 6c4af86240..771aab34ac
> > 100644
> > --- a/hw/9pfs/9p.c
> > +++ b/hw/9pfs/9p.c
> > @@ -39,6 +39,11 @@
> >  #include "qemu/xxhash.h"
> >  #include <math.h>
> >
> > +#ifdef CONFIG_WIN32
> > +#define UTIME_NOW   ((1l << 30) - 1l)
> > +#define UTIME_OMIT  ((1l << 30) - 2l) #endif
> > +
> >  int open_fd_hw;
> >  int total_open_fd;
> >  static int open_fd_rc;
> > @@ -132,13 +137,17 @@ static int dotl_to_open_flags(int flags)
> >      DotlOpenflagMap dotl_oflag_map[] =3D {
> >          { P9_DOTL_CREATE, O_CREAT },
> >          { P9_DOTL_EXCL, O_EXCL },
> > +#ifndef CONFIG_WIN32
> >          { P9_DOTL_NOCTTY , O_NOCTTY },
> > +#endif
> >          { P9_DOTL_TRUNC, O_TRUNC },
> >          { P9_DOTL_APPEND, O_APPEND },
> > +#ifndef CONFIG_WIN32
> >          { P9_DOTL_NONBLOCK, O_NONBLOCK } ,
> >          { P9_DOTL_DSYNC, O_DSYNC },
> >          { P9_DOTL_FASYNC, FASYNC },
> > -#ifndef CONFIG_DARWIN
> > +#endif
> > +#ifdef CONFIG_LINUX
>=20
> Better
>=20
>    #if !defined(CONFIG_DARWIN) && !defined(CONFIG_WIN32)
>=20

It is OK.

> Otherwise it might automatically opt-out other future platforms
> unintentionally.
>=20
> >          { P9_DOTL_NOATIME, O_NOATIME },
> >          /*
> >           *  On Darwin, we could map to F_NOCACHE, which is @@ -151,8
> > +160,10 @@ static int dotl_to_open_flags(int flags)  #endif
> >          { P9_DOTL_LARGEFILE, O_LARGEFILE },
> >          { P9_DOTL_DIRECTORY, O_DIRECTORY },
> > +#ifndef CONFIG_WIN32
> >          { P9_DOTL_NOFOLLOW, O_NOFOLLOW },
> >          { P9_DOTL_SYNC, O_SYNC },
> > +#endif
> >      };
> >
> >      for (i =3D 0; i < ARRAY_SIZE(dotl_oflag_map); i++) { @@ -179,8
> > +190,11 @@ static int get_dotl_openflags(V9fsState *s, int oflags)
> >       * Filter the client open flags
> >       */
> >      flags =3D dotl_to_open_flags(oflags);
> > -    flags &=3D ~(O_NOCTTY | O_ASYNC | O_CREAT);
> > -#ifndef CONFIG_DARWIN
> > +    flags &=3D ~(O_CREAT);
> > +#ifndef CONFIG_WIN32
> > +    flags &=3D ~(O_NOCTTY | O_ASYNC);
> > +#endif
> > +#ifdef CONFIG_LINUX
>=20
> Same as above: better explicitly opt-out than the other way around.
>=20

It is OK.

> >      /*
> >       * Ignore direct disk access hint until the server supports it.
> >       */
> > @@ -986,9 +1000,11 @@ static int stat_to_qid(V9fsPDU *pdu, const struct
> stat *stbuf, V9fsQID *qidp)
> >      if (S_ISDIR(stbuf->st_mode)) {
> >          qidp->type |=3D P9_QID_TYPE_DIR;
> >      }
> > +#ifndef CONFIG_WIN32
> >      if (S_ISLNK(stbuf->st_mode)) {
> >          qidp->type |=3D P9_QID_TYPE_SYMLINK;
> >      }
> > +#endif
> >
> >      return 0;
> >  }
> > @@ -1097,6 +1113,7 @@ static mode_t v9mode_to_mode(uint32_t mode,
> V9fsString *extension)
> >          ret |=3D S_IFDIR;
> >      }
> >
> > +#ifndef CONFIG_WIN32
> >      if (mode & P9_STAT_MODE_SYMLINK) {
> >          ret |=3D S_IFLNK;
> >      }
> > @@ -1106,6 +1123,7 @@ static mode_t v9mode_to_mode(uint32_t mode,
> V9fsString *extension)
> >      if (mode & P9_STAT_MODE_NAMED_PIPE) {
> >          ret |=3D S_IFIFO;
> >      }
> > +#endif
> >      if (mode & P9_STAT_MODE_DEVICE) {
> >          if (extension->size && extension->data[0] =3D=3D 'c') {
> >              ret |=3D S_IFCHR;
> > @@ -1118,6 +1136,7 @@ static mode_t v9mode_to_mode(uint32_t mode,
> V9fsString *extension)
> >          ret |=3D S_IFREG;
> >      }
> >
> > +#ifndef CONFIG_WIN32
> >      if (mode & P9_STAT_MODE_SETUID) {
> >          ret |=3D S_ISUID;
> >      }
> > @@ -1127,6 +1146,7 @@ static mode_t v9mode_to_mode(uint32_t mode,
> V9fsString *extension)
> >      if (mode & P9_STAT_MODE_SETVTX) {
> >          ret |=3D S_ISVTX;
> >      }
> > +#endif
> >
> >      return ret;
> >  }
> > @@ -1182,6 +1202,7 @@ static uint32_t stat_to_v9mode(const struct stat
> *stbuf)
> >          mode |=3D P9_STAT_MODE_DIR;
> >      }
> >
> > +#ifndef CONFIG_WIN32
> >      if (S_ISLNK(stbuf->st_mode)) {
> >          mode |=3D P9_STAT_MODE_SYMLINK;
> >      }
> > @@ -1193,11 +1214,13 @@ static uint32_t stat_to_v9mode(const struct sta=
t
> *stbuf)
> >      if (S_ISFIFO(stbuf->st_mode)) {
> >          mode |=3D P9_STAT_MODE_NAMED_PIPE;
> >      }
> > +#endif
> >
> >      if (S_ISBLK(stbuf->st_mode) || S_ISCHR(stbuf->st_mode)) {
> >          mode |=3D P9_STAT_MODE_DEVICE;
> >      }
> >
> > +#ifndef CONFIG_WIN32
> >      if (stbuf->st_mode & S_ISUID) {
> >          mode |=3D P9_STAT_MODE_SETUID;
> >      }
> > @@ -1209,6 +1232,7 @@ static uint32_t stat_to_v9mode(const struct stat
> *stbuf)
> >      if (stbuf->st_mode & S_ISVTX) {
> >          mode |=3D P9_STAT_MODE_SETVTX;
> >      }
> > +#endif
> >
> >      return mode;
> >  }
> > @@ -1247,9 +1271,17 @@ static int coroutine_fn stat_to_v9stat(V9fsPDU *=
pdu,
> V9fsPath *path,
> >              return err;
> >          }
> >      } else if (v9stat->mode & P9_STAT_MODE_DEVICE) {
> > +        unsigned maj, min;
> > +
> > +#ifndef CONFIG_WIN32
> > +        maj =3D major(stbuf->st_rdev);
> > +        min =3D minor(stbuf->st_rdev);
> > +#else
> > +        maj =3D min =3D 0;
> > +#endif
>=20
> Really?

See above link.

>=20
> >          v9fs_string_sprintf(&v9stat->extension, "%c %u %u",
> >                  S_ISCHR(stbuf->st_mode) ? 'c' : 'b',
> > -                major(stbuf->st_rdev), minor(stbuf->st_rdev));
> > +                maj, min);
> >      } else if (S_ISDIR(stbuf->st_mode) || S_ISREG(stbuf->st_mode)) {
> >          v9fs_string_sprintf(&v9stat->extension, "%s %lu",
> >                  "HARDLINKCOUNT", (unsigned long)stbuf->st_nlink); @@
> > -1317,7 +1349,14 @@ static int32_t blksize_to_iounit(const V9fsPDU
> > *pdu, int32_t blksize)
> >
> >  static int32_t stat_to_iounit(const V9fsPDU *pdu, const struct stat
> > *stbuf)  {
> > -    return blksize_to_iounit(pdu, stbuf->st_blksize);
> > +    int32_t blksize;
> > +
> > +#ifndef CONFIG_WIN32
> > +    blksize =3D stbuf->st_blksize);
> > +#else
> > +    blksize =3D 0;
> > +#endif
>=20
> Really?

Windows struct stat does not have such field. See above link.

>=20
> > +    return blksize_to_iounit(pdu, blksize);
> >  }
> >
> >  static int stat_to_v9stat_dotl(V9fsPDU *pdu, const struct stat
> > *stbuf, @@ -1332,7 +1371,11 @@ static int stat_to_v9stat_dotl(V9fsPDU *=
pdu,
> const struct stat *stbuf,
> >      v9lstat->st_rdev =3D host_dev_to_dotl_dev(stbuf->st_rdev);
> >      v9lstat->st_size =3D stbuf->st_size;
> >      v9lstat->st_blksize =3D stat_to_iounit(pdu, stbuf);
> > +#ifndef CONFIG_WIN32
> >      v9lstat->st_blocks =3D stbuf->st_blocks;
> > +#else
> > +    v9lstat->st_blocks =3D 0;
> > +#endif
>=20
> Really?

Windows struct stat does not have such field. See above link.

>=20
> >      v9lstat->st_atime_sec =3D stbuf->st_atime;
> >      v9lstat->st_mtime_sec =3D stbuf->st_mtime;
> >      v9lstat->st_ctime_sec =3D stbuf->st_ctime; @@ -1340,7 +1383,8 @@
> > static int stat_to_v9stat_dotl(V9fsPDU *pdu, const struct stat *stbuf,
> >      v9lstat->st_atime_nsec =3D stbuf->st_atimespec.tv_nsec;
> >      v9lstat->st_mtime_nsec =3D stbuf->st_mtimespec.tv_nsec;
> >      v9lstat->st_ctime_nsec =3D stbuf->st_ctimespec.tv_nsec; -#else
> > +#endif
> > +#ifdef CONFIG_LINUX
> >      v9lstat->st_atime_nsec =3D stbuf->st_atim.tv_nsec;
> >      v9lstat->st_mtime_nsec =3D stbuf->st_mtim.tv_nsec;
> >      v9lstat->st_ctime_nsec =3D stbuf->st_ctim.tv_nsec; @@ -2471,6
> > +2515,7 @@ static int coroutine_fn v9fs_do_readdir(V9fsPDU *pdu,
> V9fsFidState *fidp,
> >      struct dirent *dent;
> >      struct stat *st;
> >      struct V9fsDirEnt *entries =3D NULL;
> > +    unsigned char d_type =3D 0;
> >
> >      /*
> >       * inode remapping requires the device id, which in turn might be
> > @@ -2540,10 +2585,13 @@ static int coroutine_fn v9fs_do_readdir(V9fsPDU
> *pdu, V9fsFidState *fidp,
> >          v9fs_string_init(&name);
> >          v9fs_string_sprintf(&name, "%s", dent->d_name);
> >
> > +#ifndef CONFIG_WIN32
> > +        d_type =3D dent->d_type;
> > +#endif
> >          /* 11 =3D 7 + 4 (7 =3D start offset, 4 =3D space for storing c=
ount) */
> >          len =3D pdu_marshal(pdu, 11 + count, "Qqbs",
> >                            &qid, off,
> > -                          dent->d_type, &name);
> > +                          d_type, &name);
>=20
> Are you saying that d_type is not initialized with zero already?

struct dirent is defined by MinGW, it does not have d_type member:

https://github.com/Alexpux/mingw-w64/blob/master/mingw-w64-headers/crt/dire=
nt.h


>=20
> >          v9fs_string_free(&name);
> >
> > @@ -2873,8 +2921,12 @@ static void coroutine_fn v9fs_create(void *opaqu=
e)
> >          }
> >
> >          nmode |=3D perm & 0777;
> > +#ifndef CONFIG_WIN32
> >          err =3D v9fs_co_mknod(pdu, fidp, &name, fidp->uid, -1,
> >                              makedev(major, minor), nmode, &stbuf);
> > +#else
> > +        err =3D -ENOTSUP;
> > +#endif
> >          if (err < 0) {
> >              goto out;
> >          }
> > @@ -2899,8 +2951,12 @@ static void coroutine_fn v9fs_create(void *opaqu=
e)
> >          v9fs_path_copy(&fidp->path, &path);
> >          v9fs_path_unlock(s);
> >      } else if (perm & P9_STAT_MODE_SOCKET) {
> > +#ifndef CONFIG_WIN32
> >          err =3D v9fs_co_mknod(pdu, fidp, &name, fidp->uid, -1,
> >                              0, S_IFSOCK | (perm & 0777), &stbuf);
> > +#else
> > +        err =3D -ENOTSUP;
> > +#endif
>=20
> As with previous patches, I would consider making the user aware to use
> mapped(-xattr) with something like error_report_once().

OK, got it.

>=20
> >          if (err < 0) {
> >              goto out;
> >          }
> > @@ -3634,7 +3690,7 @@ out_nofid:
> >
> >  static void coroutine_fn v9fs_mknod(void *opaque)  {
> > -
> > +#ifndef CONFIG_WIN32
> >      int mode;
> >      gid_t gid;
> >      int32_t fid;
> > @@ -3691,6 +3747,10 @@ out:
> >  out_nofid:
> >      pdu_complete(pdu, err);
> >      v9fs_string_free(&name);
> > +#else
> > +    V9fsPDU *pdu =3D opaque;
> > +    pdu_complete(pdu, -1);
> > +#endif
> >  }
> >
> >  /*
> > @@ -3963,7 +4023,7 @@ out_nofid:
> >  #if defined(CONFIG_LINUX)
> >  /* Currently, only Linux has XATTR_SIZE_MAX */  #define
> > P9_XATTR_SIZE_MAX XATTR_SIZE_MAX -#elif defined(CONFIG_DARWIN)
> > +#elif defined(CONFIG_DARWIN) || defined(CONFIG_WIN32)
> >  /*
> >   * Darwin doesn't seem to define a maximum xattr size in its user
> >   * space header, so manually configure it across platforms as 64k.
> > @@ -3980,6 +4040,7 @@ out_nofid:
> >
> >  static void coroutine_fn v9fs_xattrcreate(void *opaque)  {
> > +#ifndef CONFIG_WIN32
> >      int flags, rflags =3D 0;
> >      int32_t fid;
> >      uint64_t size;
> > @@ -4041,10 +4102,15 @@ out_put_fid:
> >  out_nofid:
> >      pdu_complete(pdu, err);
> >      v9fs_string_free(&name);
> > +#else
> > +    V9fsPDU *pdu =3D opaque;
> > +    pdu_complete(pdu, -1);
> > +#endif
> >  }
> >
> >  static void coroutine_fn v9fs_readlink(void *opaque)  {
> > +#ifndef CONFIG_WIN32
> >      V9fsPDU *pdu =3D opaque;
> >      size_t offset =3D 7;
> >      V9fsString target;
> > @@ -4080,6 +4146,10 @@ out:
> >      put_fid(pdu, fidp);
> >  out_nofid:
> >      pdu_complete(pdu, err);
> > +#else
> > +    V9fsPDU *pdu =3D opaque;
> > +    pdu_complete(pdu, -1);
> > +#endif
>=20
> Unnecessary double declaration of pdu.
>=20

OK, got it.

> >  }
> >
> >  static CoroutineEntry *pdu_co_handlers[] =3D { @@ -4341,6 +4411,7 @@
> > void v9fs_reset(V9fsState *s)
> >
> >  static void __attribute__((__constructor__)) v9fs_set_fd_limit(void)
> > {
> > +#ifndef CONFIG_WIN32
> >      struct rlimit rlim;
> >      if (getrlimit(RLIMIT_NOFILE, &rlim) < 0) {
> >          error_report("Failed to get the resource limit"); @@ -4348,4
> > +4419,5 @@ static void __attribute__((__constructor__))
> v9fs_set_fd_limit(void)
> >      }
> >      open_fd_hw =3D rlim.rlim_cur - MIN(400, rlim.rlim_cur / 3);
> >      open_fd_rc =3D rlim.rlim_cur / 2;
> > +#endif
>=20
> Really?

Windows does not provide getrlimit()

>=20
> >  }
> >
>=20
>=20


