Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AFB62E229
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 17:40:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovhvK-0005En-47; Thu, 17 Nov 2022 11:39:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=832002e6f7=guohuai.shi@windriver.com>)
 id 1ovhvE-0005Br-1c
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 11:39:28 -0500
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=832002e6f7=guohuai.shi@windriver.com>)
 id 1ovhv6-0003yp-Cw
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 11:39:27 -0500
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AHF91Dx015362; Thu, 17 Nov 2022 16:39:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=8JmpgQdNeXfiOVz9Vk9o0kdeb9Oeu2mWAXX+OkQj72c=;
 b=r5q96p9sFSI7zmucuuryB7auQRY/Bzl/uGDXEWO/B8cRzhSEup2Vsx6RCnx4jibC6doW
 iU3kRFW8oOXkb2CE1wb2VXLRsGlKfFfBz47AtEKlA1+2Ew3LcNDVtKA1oEUI6JFajAoy
 d9ivXI7m+Rxy/ViQXMqR7cb96jhYAIebKqo9W53Chwy7Gr57/o2RHrnJkmZQP91yEj3n
 O00u5hYaAcv0wl43XcJg2XGcqMjRGliJmWfwVCTVlKKIntwH1si9PI4jyDziHsSZIKFW
 Q02CtC3PrfEQS/XxJbwMVakCsG7AZ/CV0Tfyyo/q1TNCHAYybR2WFgkkSJISJMVp6/qI Mw== 
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam04lp2044.outbound.protection.outlook.com [104.47.73.44])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kwbu1gj72-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Nov 2022 16:39:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZtujskiEcEGFCn1GftnFdfhdePfw+UdflWo8XhsdPB6pOmzuT9UdcM1Vow2EcgQANSdO4MXg4tQsKk6q90KgFK7CgdnyFomsQkGF04YVCU/Bby/UKiJh26RVCUiHk2W3z17WoUF4pRpS/tVqmHcVjv9Nh6z+zIAQjK+yGi4by9Qz2zGOQPQE7wS41dkU0pt/iYrTbD1PT6UlUYa/tfy2l3zXKKFglXtaPNdo7FDxk3OexLelm3RmVn1sHsx/7mjSATTlTsGvNF50H4kSV2oeLqNHue4rU65e7WDnKGaj0elDTPLwLZjS3/kWckAf8ZumAp8SCLNFeXkveZar7wJPxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8JmpgQdNeXfiOVz9Vk9o0kdeb9Oeu2mWAXX+OkQj72c=;
 b=mrt34h4NrSOrn+/ooUj8TAGtGf9rJsNRxk6Dqm6pCUK7C5piEXHXTLcGfGN6++5YSwTp0Ns3SVevyA5tG+rTP+YyrW8KCoKjSrua/GoutgH3sIreZ8vn2UgSSeny2fo39ngKz/qSmS6BzIFU+PEnS3Ve9gZbrdG5ZG0a0O/s8aUQWu23flzx4IM82kwPoG5M4waeI+3D8cWYG+tjdJBYbZVl245FfQG2A0vu0edeAf6iGkwBk+qVwhN0q6ZOpZYWVYIzlvpxLc7KKSSeAkefJt4vbZrmtWPMHX+N5OdPBK4A/PNE44TvvtBfVwXPMH1jGOfuCk4RMT3CNZ73eOTeUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MN2PR11MB4173.namprd11.prod.outlook.com (2603:10b6:208:137::20)
 by BL1PR11MB5224.namprd11.prod.outlook.com (2603:10b6:208:30a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.20; Thu, 17 Nov
 2022 16:38:58 +0000
Received: from MN2PR11MB4173.namprd11.prod.outlook.com
 ([fe80::9614:33e1:965d:f223]) by MN2PR11MB4173.namprd11.prod.outlook.com
 ([fe80::9614:33e1:965d:f223%7]) with mapi id 15.20.5813.020; Thu, 17 Nov 2022
 16:38:57 +0000
From: "Shi, Guohuai" <Guohuai.Shi@windriver.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: Greg Kurz <groug@kaod.org>, "Meng, Bin" <Bin.Meng@windriver.com>
Subject: RE: [PATCH v2 07/19] hw/9pfs: Implement Windows specific utilities
 functions for 9pfs
Thread-Topic: [PATCH v2 07/19] hw/9pfs: Implement Windows specific utilities
 functions for 9pfs
Thread-Index: AQHY9YVJmR90yH3fgkSvld65CqTJUK5DTvwAgAAJqQA=
Date: Thu, 17 Nov 2022 16:38:57 +0000
Message-ID: <MN2PR11MB4173118DF0D998C5313517EEEF069@MN2PR11MB4173.namprd11.prod.outlook.com>
References: <20221111042225.1115931-1-bin.meng@windriver.com>
 <20221111042225.1115931-8-bin.meng@windriver.com>
 <21395096.gP3yPR2jYx@silver>
In-Reply-To: <21395096.gP3yPR2jYx@silver>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR11MB4173:EE_|BL1PR11MB5224:EE_
x-ms-office365-filtering-correlation-id: 3bc7c9f0-9a09-48dd-de87-08dac8ba3959
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 79DgFUe8f/XaCIKSkmi2TvOoqgvuumDgN9mbuJqWvatit1AAUGjo0bAF2zka1yT5OnOaFU8qoeRl9NaC+K+HRAFA2x75RYyqAheCXBUNuw9i4yi1DBtUklL7e94Cm8Me+NaBMh3nBgx4/Tn83QreHT+G7GpIG2A6joxg50dYSgepA3HEi/8afTlbSPCGVhSlFbe5wHBegs2TM97cgXe09ClQEwN2LNJpzHRbpby+CP4k/oAYpwUU86czrK5sykpKv5OfU4Ck8qIWA1UJi/3uTIX4t/CggRA1bbi8hw/YLe4ToiZUUcuLJu5fW3q5Fku5v6tU4u2aYIsGVf+B0Ve8VmMV7Ch5BVLLgSn83XrlLYxm4Y6SPYbAKBkz8YEb9eyUqvTyfbbHS9kldIn9PIgYCPTpKTlHiKNABCxlcGv4wzsSw4igfUrvsz5Jsrdwu4B2E3GOmc4qfhObUwxYKkQr1V0roITk2SRxZGnv8kQiC62eoP8y7r/bP+eG6pYLOewhYbWpxyAIPzv3fe2opJHXZk90AZRSxymn7Hgu+0O1LG5wtjQK/zMsjgfE+8mu1UUJPPWrXospPH3njS6l6kK45YcO8x6O2sX6S3wNpde9yl/8RvNK9DucIN6jGECPWF2lroPWdVFXYs/ADrXJX3WOpwt/2Wg0peu5d0p1A78JrClOPX0UeoLl1dOsBFqIt1jXE8n4LMYtBA5FoyIIq+5Q/FJfphB2wx9/3qh1LyvOO+Q=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4173.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(376002)(39850400004)(346002)(366004)(451199015)(2906002)(83380400001)(55016003)(33656002)(41300700001)(66946007)(86362001)(76116006)(186003)(38100700002)(6506007)(110136005)(7696005)(53546011)(54906003)(122000001)(38070700005)(26005)(8936002)(5660300002)(52536014)(66556008)(4326008)(8676002)(66476007)(64756008)(66446008)(9686003)(30864003)(316002)(71200400001)(107886003)(478600001)(21314003)(559001)(579004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0ayjqfxVBRE7YDbFraOnxUQQgUYEwMqIsJGmmAbVexF7EJ40/LIlZr5EhpYC?=
 =?us-ascii?Q?hmB7f8LeKFD3qaGY9NLVw7cPPENtOsVBugSNPNcJfszxtDfQMB4Ctbla80tO?=
 =?us-ascii?Q?47BDy+vFOCV3JQMZmQPcq1Pa0IeIiPAho78pMDoVo8/pyAb+fZaacOUeIEPZ?=
 =?us-ascii?Q?5H/+PpQJNdE6rxDxseZ0aTZxOOgjeTcDsKWwZF4gqS30Ks8A+0XYubTtzouj?=
 =?us-ascii?Q?y8Ts1Xa3OPKkxba+Q4dOZ0BJg6Da1fhG8xYa/lPDkmM4tCPrRg6Hu2AqHCVx?=
 =?us-ascii?Q?eEL8yWA3XBD9rM1H3g+32nrqX2Ep4o23XzL5AePyXyPjtOa3T+8OFOwd3N6d?=
 =?us-ascii?Q?oh7xnxyPT2wuNvMC9v+7buU/ht6fVM+lQBFIiYPOo2hVmwZg4UiOi+AlOJlI?=
 =?us-ascii?Q?HEilUr5qALnzazRXs15dFDQyr904rj9kjokiLvuWKTMOAK6axjM5k6IFuMOp?=
 =?us-ascii?Q?lK5PGP3ohPp6ueh3RB00XS9sOF1JtkZ8RU5l0O6GVdNIXvlUf6nn+MnCbsOQ?=
 =?us-ascii?Q?EiJ8O6G2VAl7+vMWIPVYy46sYU9IIjlzrwC5c9OFiqiknsooFOJw6mg5LyM8?=
 =?us-ascii?Q?mc9RbTIQRfPfFzbAVMFJyJyBkg68ZEYbsZHLFj9rQqiCHs0nFQ7iAHYCJCCR?=
 =?us-ascii?Q?4i71MFSe04bxlyD2ACU0kBVHFFBmeyWYqlaluNb5nwSX1VKpCcNjATzGUExa?=
 =?us-ascii?Q?9fv9WdM/IyudV4m+qbi3nLCqHXdBhnGsOZx/D5910SJC+uNb4G+DNjBYvkhp?=
 =?us-ascii?Q?hsDYlS6moZZgjsB3XwfrWfUAc+LC4A1dwqowxzCiFQ/dlabHAVbJmJ7faG2/?=
 =?us-ascii?Q?3sSLbGuJKxkLoz+jLjqfSc7c9CFLAnyXcN+TB1bNNT7ZvKvBZu7RTGvXUq38?=
 =?us-ascii?Q?YYExYuchJbN4JkVf8A9cmVN3N+XvZgsLR7FskwP4ICELMPOw1RTG7unsn80y?=
 =?us-ascii?Q?FmcZ9GGLMhUAGEe5q4S1zNQwMt1Lkyl4XmNII0mMxtvVfj2ySA2PArtp9dnU?=
 =?us-ascii?Q?Qt15uydMG0EpOx1usUtrCZyFD1ig4jz8L3S/lFt/ufz9DTcCIaPnAM5i1ev5?=
 =?us-ascii?Q?42XDW5Qf9tWpNWFGWz3YTe/LOcuxRqAIk60CbKYWrz9ADGv0LNb7TngThkH6?=
 =?us-ascii?Q?Um8l6n32vXuNkElfD95ClbhhH7ejjcIrHfvAdRZepFLpcR4ufHLiOU+cZXeO?=
 =?us-ascii?Q?eTl5F6s1ABl64tSNYoY/nhajdYE/yKaZ3DFKz1fzAWd/Z2fYskk4YSh+nzM7?=
 =?us-ascii?Q?8QHDqoQYC/NhWa7d7hP0PtNG5fKNMUFgkA96v36de9Llv5e7uUAoMcrNfRfW?=
 =?us-ascii?Q?09fNN7dfR0FQOq1UNKQBJo+CuQeKhNSB4mxepBMslW1pgaFIN+ci7ZVPY8We?=
 =?us-ascii?Q?4nv1JB3rOfWaOdyDu1fMa6VKf9LZfLSvDXlVZBKVwkpgFpa8n3epuzh6+t+a?=
 =?us-ascii?Q?FycQkmdh5JuZKAOvpJtbnaQN7hqAuTrnIytAzo5Ayzm5+cmOzg5A0Fd/7Pc4?=
 =?us-ascii?Q?UFse/kt+xzW5RTv+IzNeIF3pLgSbNR3AkxkkS9XBiufw2HSv5vhcN6+b8DG3?=
 =?us-ascii?Q?GxvQdc4Da6X/tNurPrsk/zqyjaDwc3HkDqSMbX++?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4173.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bc7c9f0-9a09-48dd-de87-08dac8ba3959
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2022 16:38:57.7697 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UNL0d6DqBFwlrwUbG0cad8HLacwRXJN3I+02NhJLh/8ZWYeLdmcep5Z1HkWKjMWOjJHrbSWUUNcJRJGM8qn8vN3rCAOEcw+T38mFXI1SBq4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5224
X-Proofpoint-GUID: sMw-1AnEM0APKrs0hpiLRdtDVHNQZtNv
X-Proofpoint-ORIG-GUID: sMw-1AnEM0APKrs0hpiLRdtDVHNQZtNv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-17_06,2022-11-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211170123
Received-SPF: pass client-ip=205.220.178.238;
 envelope-from=prvs=832002e6f7=guohuai.shi@windriver.com;
 helo=mx0b-0064b401.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
> Sent: Thursday, November 17, 2022 23:55
> To: qemu-devel@nongnu.org
> Cc: Shi, Guohuai <Guohuai.Shi@windriver.com>; Greg Kurz <groug@kaod.org>;
> Meng, Bin <Bin.Meng@windriver.com>
> Subject: Re: [PATCH v2 07/19] hw/9pfs: Implement Windows specific utiliti=
es
> functions for 9pfs
>=20
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d
> know the content is safe.
>=20
> On Friday, November 11, 2022 5:22:13 AM CET Bin Meng wrote:
> > From: Guohuai Shi <guohuai.shi@windriver.com>
> >
> > Windows POSIX API and MinGW library do not provide the NO_FOLLOW flag,
> > and do not allow opening a directory by POSIX open(). This causes all
> > xxx_at() functions cannot work directly. However, we can provide
> > Windows handle based functions to emulate xxx_at() functions (e.g.:
> > openat_win32, utimensat_win32, etc.).
> >
> > NTFS ADS (Alternate Data Streams) is used to emulate 9pfs extended
> > attributes on Windows. Symbolic link is only supported when security
> > model is "mapped-xattr" or "mapped-file".
> >
> > Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> >
> > ---
> >
> > Changes in v2:
> > - Support symbolic link when security model is "mapped-xattr" or "mappe=
d-
> file"
> >
> >  hw/9pfs/9p-local.h      |   7 +
> >  hw/9pfs/9p-util.h       |  38 +-
> >  hw/9pfs/9p-local.c      |   4 -
> >  hw/9pfs/9p-util-win32.c | 934
> > ++++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 978 insertions(+), 5 deletions(-)  create mode
> > 100644 hw/9pfs/9p-util-win32.c
> >
> > diff --git a/hw/9pfs/9p-local.h b/hw/9pfs/9p-local.h index
> > 66a21316a0..eb4f39ddc2 100644
> > --- a/hw/9pfs/9p-local.h
> > +++ b/hw/9pfs/9p-local.h
> > @@ -13,6 +13,13 @@
> >  #ifndef QEMU_9P_LOCAL_H
> >  #define QEMU_9P_LOCAL_H
> >
> > +typedef struct {
> > +    QemuFd_t mountfd;
> > +#ifdef CONFIG_WIN32
> > +    char *root_path;
> > +#endif
> > +} LocalData;
> > +
> >  QemuFd_t local_open_nofollow(FsContext *fs_ctx, const char *path, int
> flags,
> >                               mode_t mode);  QemuFd_t
> > local_opendir_nofollow(FsContext *fs_ctx, const char *path); diff
> > --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h index
> > 3d6bd1a51e..5fb854bf61 100644
> > --- a/hw/9pfs/9p-util.h
> > +++ b/hw/9pfs/9p-util.h
> > @@ -88,26 +88,61 @@ static inline int errno_to_dotl(int err) {
> >      return err;
> >  }
> >
> > -#ifdef CONFIG_DARWIN
> > +#if defined(CONFIG_DARWIN)
> >  #define qemu_fgetxattr(...) fgetxattr(__VA_ARGS__, 0, 0)
> > +#elif defined(CONFIG_WIN32)
> > +#define qemu_fgetxattr fgetxattr_win32
> >  #else
> >  #define qemu_fgetxattr fgetxattr
> >  #endif
> >
> > +#ifdef CONFIG_WIN32
> > +#define qemu_openat     openat_win32
> > +#define qemu_fstatat    fstatat_win32
> > +#define qemu_mkdirat    mkdirat_win32
> > +#define qemu_renameat   renameat_win32
> > +#define qemu_utimensat  utimensat_win32
> > +#define qemu_unlinkat   unlinkat_win32
> > +#else
> >  #define qemu_openat     openat
> >  #define qemu_fstatat    fstatat
> >  #define qemu_mkdirat    mkdirat
> >  #define qemu_renameat   renameat
> >  #define qemu_utimensat  utimensat
> >  #define qemu_unlinkat   unlinkat
> > +#endif
> > +
> > +#ifdef CONFIG_WIN32
> > +char *get_full_path_win32(QemuFd_t fd, const char *name); ssize_t
> > +fgetxattr_win32(int fd, const char *name, void *value, size_t size);
> > +QemuFd_t openat_win32(QemuFd_t dirfd, const char *pathname, int flags,
> > +                      mode_t mode);
> > +int fstatat_win32(QemuFd_t dirfd, const char *pathname,
> > +                  struct stat *statbuf, int flags); int
> > +mkdirat_win32(QemuFd_t dirfd, const char *pathname, mode_t mode); int
> > +renameat_win32(QemuFd_t olddirfd, const char *oldpath,
> > +                   QemuFd_t newdirfd, const char *newpath); int
> > +utimensat_win32(QemuFd_t dirfd, const char *pathname,
> > +                    const struct timespec times[2], int flags); int
> > +unlinkat_win32(QemuFd_t dirfd, const char *pathname, int flags); int
> > +statfs_win32(const char *root_path, struct statfs *stbuf); QemuFd_t
> > +openat_dir(QemuFd_t dirfd, const char *name); QemuFd_t
> > +openat_file(QemuFd_t dirfd, const char *name, int flags,
> > +                     mode_t mode);
> > +#endif
>=20
> That's quite a bunch of *_win32() prototypes. Maybe moving them into thei=
r
> own 9p-util-win32.h file?
>=20
> >  static inline void close_preserve_errno(QemuFd_t fd)  {
> >      int serrno =3D errno;
> > +#ifndef CONFIG_WIN32
> >      close(fd);
> > +#else
> > +    CloseHandle(fd);
> > +#endif
> >      errno =3D serrno;
> >  }
> >
> > +#ifndef CONFIG_WIN32
> >  static inline QemuFd_t openat_dir(QemuFd_t dirfd, const char *name)
> > {
> >      return qemu_openat(dirfd, name,
> > @@ -155,6 +190,7 @@ again:
> >      errno =3D serrno;
> >      return fd;
> >  }
> > +#endif
> >
> >  ssize_t fgetxattrat_nofollow(QemuFd_t dirfd, const char *path,
> >                               const char *name, void *value, size_t
> > size); diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c index
> > 22377a3105..24e21141d5 100644
> > --- a/hw/9pfs/9p-local.c
> > +++ b/hw/9pfs/9p-local.c
> > @@ -53,10 +53,6 @@
> >  #define BTRFS_SUPER_MAGIC 0x9123683E
> >  #endif
> >
> > -typedef struct {
> > -    QemuFd_t mountfd;
> > -} LocalData;
> > -
> >  QemuFd_t local_open_nofollow(FsContext *fs_ctx, const char *path, int
> flags,
> >                               mode_t mode)  { diff --git
> > a/hw/9pfs/9p-util-win32.c b/hw/9pfs/9p-util-win32.c new file mode
> > 100644 index 0000000000..ed3d519937
> > --- /dev/null
> > +++ b/hw/9pfs/9p-util-win32.c
> > @@ -0,0 +1,934 @@
> > +/*
> > + * 9p utilities (Windows Implementation)
> > + *
> > + * Copyright (c) 2022 Wind River Systems, Inc.
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
> > + * See the COPYING file in the top-level directory.
> > + */
> > +
> > +/*
> > + * This file contains Windows only functions for 9pfs.
> > + *
> > + * For 9pfs Windows host, the following features are different from Li=
nux
> host:
> > + *
> > + * 1. Windows POSIX API does not provide the NO_FOLLOW flag, that mean=
s
> MinGW
> > + *    cannot detect if a path is a symbolic link or not. Also Windows =
do
> not
> > + *    provide POSIX compatible readlink(). Supporting symbolic link in
> 9pfs on
> > + *    Windows may cause security issues, so symbolic link support is
> disabled
> > + *    completely for security model "none" or "passthrough".
>=20
> So your standpoint is, guest cannot create links, therefore no need for
> NO_FOLLOW and friends, safe. However a common use case for 9p is to expor=
t a
> directory tree that was previously deployed by other means that might ind=
eed
> place links that might attempt to escape the sandbox. Don't you think tha=
t
> such scenarios should be handled in some way?

Previously deployed links are checked by flag FILE_ATTRIBUTE_REPARSE_POINT.
If a file is a link, it will have flag FILE_ATTRIBUTE_REPARSE_POINT returne=
d by GetFileAttributes().
This flag is checked in openat_win32(), fstatat_win32(), renameat_win32(), =
utimensat_win32(), unlinkat_win32(), openat_dir().
So all scenarios are handled correctly.

>=20
> > + *
> > + * 2. Windows file system does not support extended attributes directl=
y.
> 9pfs
> > + *    for Windows uses NTFS ADS (Alternate Data Streams) to emulate
> extended
> > + *    attributes.
> > + *
> > + * 3. statfs() is not available on Windows. qemu_statfs() is used to
> emulate it.
> > + *
> > + * 4. On Windows trying to open a directory with the open() API will f=
ail.
> > + *    This is because Windows does not allow opening directory in norm=
al
> usage.
> > + *
> > + *    As a result of this, all xxx_at() functions won't work directly =
on
> > + *    Windows, e.g.: openat(), unlinkat(), etc.
> > + *
> > + *    As xxx_at() can prevent parent directory to be modified on Linux
> host,
> > + *    to support this and prevent security issue, all xxx_at() APIs ar=
e
> replaced
> > + *    by xxx_at_win32() and Windows handle is used to replace the
> directory fd.
>=20
> As you already have a Windows HANDLE, you could call NtCreateFile() to
> implement openat(), no? NtCreateFile() takes an optional `HANDLE
> RootDirectory` attribute with its ObjectAttributes function argument.
>=20

In the next version, no need provide "HANDLE" version functions. All functi=
ons are kept as old prototype: use fd, and convert fd to handle by _get_osf=
handle().

Thanks
Guohuai=20
> > + *
> > + *    Windows file system does not allow replacing a file or directory=
 if
> it is
> > + *    referenced by a handle. Keep the handle open will lock and prote=
ct
> the
> > + *    parent directory and make the access to files atomically.
> > + *
> > + *    If we don't protect (lock) the parent directory, the parent
> directory may
> > + *    be replaced by others (e.g.: a symbolic link) and cause security
> issues.
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "qapi/error.h"
> > +#include "qemu/error-report.h"
> > +#include "9p.h"
> > +#include "9p-util.h"
> > +#include "9p-local.h"
> > +
> > +#include <windows.h>
> > +#include <dirent.h>
> > +
> > +#define V9FS_MAGIC  0x53465039  /* string "9PFS" */
> > +
> > +/*
> > + * build_ads_name - construct Windows ADS name
> > + *
> > + * This function constructs Windows NTFS ADS (Alternate Data Streams)
> > +name
> > + * to <namebuf>.
> > + */
> > +static int build_ads_name(char *namebuf, size_t namebuf_len,
> > +                          const char *filename, const char *ads_name)
> > +{
> > +    size_t total_size;
> > +
> > +    total_size =3D strlen(filename) + strlen(ads_name) + 2;
> > +    if (total_size  > namebuf_len) {
> > +        return -1;
> > +    }
> > +
> > +    /*
> > +     * NTFS ADS (Alternate Data Streams) name format: filename:ads_nam=
e
> > +     * e.g.: D:\1.txt:my_ads_name
> > +     */
> > +
> > +    strcpy(namebuf, filename);
> > +    strcat(namebuf, ":");
> > +    strcat(namebuf, ads_name);
> > +
> > +    return 0;
> > +}
> > +
> > +/*
> > + * copy_ads_name - copy ADS name from buffer returned by
> > +FindNextStreamW()
> > + *
> > + * This function removes string "$DATA" in ADS name string returned
> > +by
> > + * FindNextStreamW(), and copies the real ADS name to <namebuf>.
> > + */
> > +static ssize_t copy_ads_name(char *namebuf, size_t namebuf_len,
> > +                             char *full_ads_name) {
> > +    char *p1, *p2;
> > +
> > +    /*
> > +     * NTFS ADS (Alternate Data Streams) name from enumerate data form=
at:
> > +     * :ads_name:$DATA, e.g.: :my_ads_name:$DATA
> > +     *
> > +     * ADS name from FindNextStreamW() always has ":$DATA" string at t=
he
> end.
> > +     *
> > +     * This function copies ADS name to namebuf.
> > +     */
> > +
> > +    p1 =3D strchr(full_ads_name, ':');
> > +    if (p1 =3D=3D NULL) {
> > +        return -1;
> > +    }
> > +
> > +    p2 =3D strchr(p1 + 1, ':');
> > +    if (p2 =3D=3D NULL) {
> > +        return -1;
> > +    }
> > +
> > +    /* skip empty ads name */
> > +    if (p2 - p1 =3D=3D 1) {
> > +        return 0;
> > +    }
> > +
> > +    if (p2 - p1 + 1 > namebuf_len) {
> > +        return -1;
> > +    }
> > +
> > +    memcpy(namebuf, p1 + 1, p2 - p1 - 1);
> > +    namebuf[p2 - p1 - 1] =3D '\0';
> > +
> > +    return p2 - p1;
> > +}
> > +
> > +/*
> > + * get_full_path_win32 - get full file name base on a handle
> > + *
> > + * This function gets full file name based on a handle specified by
> > +<fd> to
> > + * a file or directory.
> > + *
> > + * Caller function needs to free the file name string after use.
> > + */
> > +char *get_full_path_win32(QemuFd_t fd, const char *name) {
> > +    g_autofree char *full_file_name =3D NULL;
> > +    DWORD total_size;
> > +    DWORD name_size;
> > +
> > +    full_file_name =3D g_malloc0(NAME_MAX);
> > +
> > +    /* get parent directory full file name */
> > +    name_size =3D GetFinalPathNameByHandle(fd, full_file_name,
> > +                                         NAME_MAX - 1,
> FILE_NAME_NORMALIZED);
> > +    if (name_size =3D=3D 0 || name_size > NAME_MAX - 1) {
> > +        return NULL;
> > +    }
> > +
> > +    /* full path returned is the "\\?\" syntax, remove the lead string=
 */
> > +    memmove(full_file_name, full_file_name + 4, NAME_MAX - 4);
> > +
> > +    if (name !=3D NULL) {
> > +        total_size =3D strlen(full_file_name) + strlen(name) + 2;
> > +
> > +        if (total_size > NAME_MAX) {
> > +            return NULL;
> > +        }
> > +
> > +        /* build sub-directory file name */
> > +        strcat(full_file_name, "\\");
> > +        strcat(full_file_name, name);
> > +    }
> > +
> > +    return g_steal_pointer(&full_file_name); }
> > +
> > +/*
> > + * fgetxattr_win32 - get extended attribute by fd
> > + *
> > + * This function gets extened attribute by <fd>. <fd> will be
> > +translated to
> > + * Windows handle.
> > + *
> > + * This function emulates extended attribute by NTFS ADS.
> > + */
> > +ssize_t fgetxattr_win32(int fd, const char *name, void *value, size_t
> > +size) {
> > +    g_autofree char *full_file_name =3D NULL;
> > +    char ads_file_name[NAME_MAX + 1] =3D {0};
> > +    DWORD dwBytesRead;
> > +    HANDLE hStream;
> > +    HANDLE hFile;
> > +
> > +    hFile =3D (HANDLE)_get_osfhandle(fd);
> > +
> > +    full_file_name =3D get_full_path_win32(hFile, NULL);
> > +    if (full_file_name =3D=3D NULL) {
> > +        errno =3D EIO;
> > +        return -1;
> > +    }
> > +
> > +    if (build_ads_name(ads_file_name, NAME_MAX, full_file_name, name) =
< 0)
> {
> > +        errno =3D EIO;
> > +        return -1;
> > +    }
> > +
> > +    hStream =3D CreateFile(ads_file_name, GENERIC_READ, FILE_SHARE_REA=
D,
> NULL,
> > +                         OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
> > +    if (hStream =3D=3D INVALID_HANDLE_VALUE &&
> > +        GetLastError() =3D=3D ERROR_FILE_NOT_FOUND) {
> > +        errno =3D ENODATA;
> > +        return -1;
> > +    }
> > +
> > +    if (ReadFile(hStream, value, size, &dwBytesRead, NULL) =3D=3D FALS=
E) {
> > +        errno =3D EIO;
> > +        CloseHandle(hStream);
> > +        return -1;
> > +    }
> > +
> > +    CloseHandle(hStream);
> > +
> > +    return dwBytesRead;
> > +}
> > +
> > +/*
> > + * openat_win32 - emulate openat()
> > + *
> > + * This function emulates openat().
> > + *
> > + * Windows POSIX API does not support opening a directory by open().
> > +Only
> > + * handle of directory can be opened by CreateFile().
> > + *
> > + * So openat_win32() has to use a directory handle instead of a direct=
ory
> fd.
> > + *
> > + * For symbolic access:
> > + * 1. Parent directory handle <dirfd> should not be a symbolic link
> because
> > + *    it is opened by openat_dir() which can prevent from opening a li=
nk
> to
> > + *    a dirctory.
> > + * 2. Link flag in <mode> is not set because Windows does not have thi=
s
> flag.
> > + *    Create a new symbolic link will be denied.
> > + * 3. This function checks file symbolic link attribute after open.
> > + *
> > + * So symbolic link will not be accessed by 9p client.
> > + */
> > +QemuFd_t openat_win32(QemuFd_t dirfd, const char *pathname, int flags,
> > +                      mode_t mode)
> > +{
> > +    g_autofree char *full_file_name1 =3D NULL;
> > +    g_autofree char *full_file_name2 =3D NULL;
> > +    HANDLE hFile =3D INVALID_HANDLE_VALUE;
> > +    int fd;
> > +
> > +    full_file_name1 =3D get_full_path_win32(dirfd, pathname);
> > +    if (full_file_name1 =3D=3D NULL) {
> > +        return hFile;
> > +    }
> > +
> > +    fd =3D open(full_file_name1, flags, mode);
> > +    if (fd > 0) {
> > +        DWORD attribute;
> > +        hFile =3D (HANDLE)_get_osfhandle(fd);
> > +
> > +        full_file_name2 =3D get_full_path_win32(hFile, NULL);
> > +        attribute =3D GetFileAttributes(full_file_name2);
> > +
> > +        /* check if it is a symbolic link */
> > +        if ((attribute =3D=3D INVALID_FILE_ATTRIBUTES)
> > +            || (attribute & FILE_ATTRIBUTE_REPARSE_POINT) !=3D 0) {
> > +            errno =3D EACCES;
> > +            hFile =3D INVALID_HANDLE_VALUE;
> > +            close(fd);
> > +        }
> > +    }
> > +
> > +    return hFile;
> > +}
> > +
> > +/*
> > + * fstatat_win32 - emulate fstatat()
> > + *
> > + * This function emulates fstatat().
> > + *
> > + * Windows POSIX API does not support opening a directory by open().
> > +Only
> > + * handle of directory can be opened by CreateFile().
> > + *
> > + * So fstatat_win32() has to use a directory handle instead of a direc=
tory
> fd.
> > + *
> > + * Access to a symbolic link will be denied to prevent security issues=
.
> > + */
> > +int fstatat_win32(QemuFd_t dirfd, const char *pathname,
> > +                  struct stat *statbuf, int flags) {
> > +    g_autofree char *full_file_name =3D NULL;
> > +    HANDLE hFile =3D INVALID_HANDLE_VALUE;
> > +    BY_HANDLE_FILE_INFORMATION file_info;
> > +    DWORD attribute;
> > +    int err =3D 0;
> > +    int ret =3D -1;
> > +    ino_t st_ino;
> > +
> > +    full_file_name =3D get_full_path_win32(dirfd, pathname);
> > +    if (full_file_name =3D=3D NULL) {
> > +        return ret;
> > +    }
> > +
> > +    /* open file to lock it */
> > +    hFile =3D CreateFile(full_file_name, GENERIC_READ,
> > +                       FILE_SHARE_READ | FILE_SHARE_WRITE |
> FILE_SHARE_DELETE,
> > +                       NULL,
> > +                       OPEN_EXISTING,
> > +                       FILE_FLAG_BACKUP_SEMANTICS
> > +                       | FILE_FLAG_OPEN_REPARSE_POINT,
> > +                       NULL);
> > +
> > +    if (hFile =3D=3D INVALID_HANDLE_VALUE) {
> > +        err =3D EACCES;
> > +        goto out;
> > +    }
> > +
> > +    attribute =3D GetFileAttributes(full_file_name);
> > +
> > +    /* check if it is a symbolic link */
> > +    if ((attribute =3D=3D INVALID_FILE_ATTRIBUTES)
> > +        || (attribute & FILE_ATTRIBUTE_REPARSE_POINT) !=3D 0) {
> > +        errno =3D EACCES;
> > +        goto out;
> > +    }
> > +
> > +    ret =3D stat(full_file_name, statbuf);
> > +
> > +    if (GetFileInformationByHandle(hFile, &file_info) =3D=3D 0) {
> > +        errno =3D EACCES;
> > +        goto out;
> > +    }
> > +
> > +    /*
> > +     * Windows (NTFS) file ID is a 64-bit ID:
> > +     *   16-bit sequence ID + 48 bit segment number
> > +     *
> > +     * But currently, ino_t defined in Windows header file is only 16-=
bit,
> > +     * and it is not patched by MinGW. So we build a pseudo inode numb=
er
> > +     * by the low 32-bit segment number when ino_t is only 16-bit.
> > +     */
> > +    if (sizeof(st_ino) =3D=3D sizeof(uint64_t)) {
> > +        st_ino =3D (ino_t)((uint64_t)file_info.nFileIndexLow
> > +                         | (((uint64_t)file_info.nFileIndexHigh) << 32=
));
> > +    } else if (sizeof(st_ino) =3D=3D sizeof(uint16_t)) {
> > +        st_ino =3D (ino_t)(((uint16_t)file_info.nFileIndexLow)
> > +                         ^ ((uint16_t)(file_info.nFileIndexLow >> 16))=
);
> > +    } else {
> > +        st_ino =3D (ino_t)file_info.nFileIndexLow;
> > +    }
> > +
> > +    statbuf->st_ino =3D st_ino;
> > +
> > +out:
> > +    if (hFile !=3D INVALID_HANDLE_VALUE) {
> > +        CloseHandle(hFile);
> > +    }
> > +
> > +    if (err !=3D 0) {
> > +        errno =3D err;
> > +    }
> > +    return ret;
> > +}
> > +
> > +/*
> > + * mkdirat_win32 - emulate mkdirat()
> > + *
> > + * This function emulates mkdirat().
> > + *
> > + * Windows POSIX API does not support opening a directory by open().
> > +Only
> > + * handle of directory can be opened by CreateFile().
> > + *
> > + * So mkdirat_win32() has to use a directory handle instead of a direc=
tory
> fd.
> > + */
> > +int mkdirat_win32(QemuFd_t dirfd, const char *pathname, mode_t mode)
> > +{
> > +    g_autofree char *full_file_name =3D NULL;
> > +    int ret =3D -1;
> > +
> > +    full_file_name =3D get_full_path_win32(dirfd, pathname);
> > +    if (full_file_name =3D=3D NULL) {
> > +        return ret;
> > +    }
> > +
> > +    ret =3D mkdir(full_file_name);
> > +
> > +    return ret;
> > +}
> > +
> > +/*
> > + * renameat_win32 - emulate renameat()
> > + *
> > + * This function emulates renameat().
> > + *
> > + * Windows POSIX API does not support openning a directory by open().
> > +Only
> > + * handle of directory can be opened by CreateFile().
> > + *
> > + * So renameat_win32() has to use a directory handle instead of a
> directory fd.
> > + *
> > + * Access to a symbolic link will be denied to prevent security issues=
.
> > + */
> > +int renameat_win32(HANDLE olddirfd, const char *oldpath,
> > +                   HANDLE newdirfd, const char *newpath) {
> > +    g_autofree char *full_old_name =3D NULL;
> > +    g_autofree char *full_new_name =3D NULL;
> > +    HANDLE hFile;
> > +    DWORD attribute;
> > +    int err =3D 0;
> > +    int ret =3D -1;
> > +
> > +    full_old_name =3D get_full_path_win32(olddirfd, oldpath);
> > +    full_new_name =3D get_full_path_win32(newdirfd, newpath);
> > +    if (full_old_name =3D=3D NULL || full_new_name =3D=3D NULL) {
> > +        return ret;
> > +    }
> > +
> > +    /* open file to lock it */
> > +    hFile =3D CreateFile(full_old_name, GENERIC_READ,
> > +                       FILE_SHARE_READ | FILE_SHARE_WRITE |
> FILE_SHARE_DELETE,
> > +                       NULL,
> > +                       OPEN_EXISTING, FILE_FLAG_BACKUP_SEMANTICS,
> > + NULL);
> > +
> > +    attribute =3D GetFileAttributes(full_old_name);
> > +
> > +    /* check if it is a symbolic link */
> > +    if ((attribute =3D=3D INVALID_FILE_ATTRIBUTES)
> > +        || (attribute & FILE_ATTRIBUTE_REPARSE_POINT) !=3D 0) {
> > +        err =3D EACCES;
> > +        goto out;
> > +    }
> > +
> > +    CloseHandle(hFile);
> > +
> > +    ret =3D rename(full_old_name, full_new_name);
> > +out:
> > +    if (err !=3D 0) {
> > +        errno =3D err;
> > +    }
> > +    return ret;
> > +}
> > +
> > +/*
> > + * utimensat_win32 - emulate utimensat()
> > + *
> > + * This function emulates utimensat().
> > + *
> > + * Windows POSIX API does not support opening a directory by open().
> > +Only
> > + * handle of directory can be opened by CreateFile().
> > + *
> > + * So utimensat_win32() has to use a directory handle instead of a
> directory fd.
> > + *
> > + * Access to a symbolic link will be denied to prevent security issues=
.
> > + */
> > +int utimensat_win32(QemuFd_t dirfd, const char *pathname,
> > +                    const struct timespec times[2], int flags) {
> > +    g_autofree char *full_file_name =3D NULL;
> > +    HANDLE hFile =3D INVALID_HANDLE_VALUE;
> > +    DWORD attribute;
> > +    struct utimbuf tm;
> > +    int err =3D 0;
> > +    int ret =3D -1;
> > +
> > +    full_file_name =3D get_full_path_win32(dirfd, pathname);
> > +    if (full_file_name =3D=3D NULL) {
> > +        return ret;
> > +    }
> > +
> > +    /* open file to lock it */
> > +    hFile =3D CreateFile(full_file_name, GENERIC_READ,
> > +                       FILE_SHARE_READ | FILE_SHARE_WRITE |
> FILE_SHARE_DELETE,
> > +                       NULL,
> > +                       OPEN_EXISTING,
> > +                       FILE_FLAG_BACKUP_SEMANTICS
> > +                       | FILE_FLAG_OPEN_REPARSE_POINT,
> > +                       NULL);
> > +
> > +    if (hFile =3D=3D INVALID_HANDLE_VALUE) {
> > +        err =3D EACCES;
> > +        goto out;
> > +    }
> > +
> > +    attribute =3D GetFileAttributes(full_file_name);
> > +
> > +    /* check if it is a symbolic link */
> > +    if ((attribute =3D=3D INVALID_FILE_ATTRIBUTES)
> > +        || (attribute & FILE_ATTRIBUTE_REPARSE_POINT) !=3D 0) {
> > +        errno =3D EACCES;
> > +        goto out;
> > +    }
> > +
> > +    tm.actime =3D times[0].tv_sec;
> > +    tm.modtime =3D times[1].tv_sec;
> > +
> > +    ret =3D utime(full_file_name, &tm);
> > +
> > +out:
> > +    if (hFile !=3D INVALID_HANDLE_VALUE) {
> > +        CloseHandle(hFile);
> > +    }
> > +
> > +    if (err !=3D 0) {
> > +        errno =3D err;
> > +    }
> > +    return ret;
> > +}
> > +
> > +/*
> > + * unlinkat_win32 - emulate unlinkat()
> > + *
> > + * This function emulates unlinkat().
> > + *
> > + * Windows POSIX API does not support opening a directory by open().
> > +Only
> > + * handle of directory can be opened by CreateFile().
> > + *
> > + * So unlinkat_win32() has to use a directory handle instead of a
> directory fd.
> > + *
> > + * Access to a symbolic link will be denied to prevent security issues=
.
> > + */
> > +
> > +int unlinkat_win32(QemuFd_t dirfd, const char *pathname, int flags) {
> > +    g_autofree char *full_file_name =3D NULL;
> > +    HANDLE hFile;
> > +    DWORD attribute;
> > +    int err =3D 0;
> > +    int ret =3D -1;
> > +
> > +    full_file_name =3D get_full_path_win32(dirfd, pathname);
> > +    if (full_file_name =3D=3D NULL) {
> > +        return ret;
> > +    }
> > +
> > +    /* open file to prevent other one modify it */
> > +    hFile =3D CreateFile(full_file_name, GENERIC_READ,
> > +                       FILE_SHARE_READ | FILE_SHARE_WRITE |
> FILE_SHARE_DELETE,
> > +                       NULL,
> > +                       OPEN_EXISTING, FILE_FLAG_BACKUP_SEMANTICS,
> > + NULL);
> > +
> > +    attribute =3D GetFileAttributes(full_file_name);
> > +
> > +    /* check if it is a symbolic link */
> > +    if ((attribute =3D=3D INVALID_FILE_ATTRIBUTES)
> > +        || (attribute & FILE_ATTRIBUTE_REPARSE_POINT) !=3D 0) {
> > +        err =3D EACCES;
> > +        goto out;
> > +    }
> > +
> > +    if (flags =3D=3D AT_REMOVEDIR) { /* remove directory */
> > +        if ((attribute & FILE_ATTRIBUTE_DIRECTORY) =3D=3D 0) {
> > +            err =3D ENOTDIR;
> > +            goto out;
> > +        }
> > +        ret =3D rmdir(full_file_name);
> > +    } else { /* remove regular file */
> > +        if ((attribute & FILE_ATTRIBUTE_DIRECTORY) !=3D 0) {
> > +            err =3D EISDIR;
> > +            goto out;
> > +        }
> > +        ret =3D remove(full_file_name);
> > +    }
> > +
> > +    /* after last handle closed, file will be removed */
> > +    CloseHandle(hFile);
> > +
> > +out:
> > +    if (err !=3D 0) {
> > +        errno =3D err;
> > +    }
> > +    return ret;
> > +}
> > +
> > +/*
> > + * statfs_win32 - statfs() on Windows
> > + *
> > + * This function emulates statfs() on Windows host.
> > + */
> > +int statfs_win32(const char *path, struct statfs *stbuf) {
> > +    char RealPath[4] =3D { 0 };
> > +    unsigned long SectorsPerCluster;
> > +    unsigned long BytesPerSector;
> > +    unsigned long NumberOfFreeClusters;
> > +    unsigned long TotalNumberOfClusters;
> > +
> > +    /* only need first 3 bytes, e.g. "C:\ABC", only need "C:\" */
> > +    memcpy(RealPath, path, 3);
> > +
> > +    if (GetDiskFreeSpace(RealPath, &SectorsPerCluster, &BytesPerSector=
,
> > +                         &NumberOfFreeClusters, &TotalNumberOfClusters=
) =3D=3D
> 0) {
> > +        errno =3D EIO;
> > +        return -1;
> > +    }
> > +
> > +    stbuf->f_type =3D V9FS_MAGIC;
> > +    stbuf->f_bsize =3D
> > +        (__fsword_t)SectorsPerCluster * (__fsword_t)BytesPerSector;
> > +    stbuf->f_blocks =3D (fsblkcnt_t)TotalNumberOfClusters;
> > +    stbuf->f_bfree =3D (fsblkcnt_t)NumberOfFreeClusters;
> > +    stbuf->f_bavail =3D (fsblkcnt_t)NumberOfFreeClusters;
> > +    stbuf->f_files =3D -1;
> > +    stbuf->f_ffree =3D -1;
> > +    stbuf->f_namelen =3D NAME_MAX;
> > +    stbuf->f_frsize =3D 0;
> > +    stbuf->f_flags =3D 0;
> > +
> > +    return 0;
> > +}
> > +
> > +/*
> > + * openat_dir - emulate openat_dir()
> > + *
> > + * This function emulates openat_dir().
> > + *
> > + * Windows POSIX API does not support opening a directory by open().
> > +Only
> > + * handle of directory can be opened by CreateFile().
> > + *
> > + * So openat_dir() has to use a directory handle instead of a director=
y fd.
> > + *
> > + * Access to a symbolic link will be denied to prevent security issues=
.
> > + */
> > +QemuFd_t openat_dir(QemuFd_t dirfd, const char *name) {
> > +    g_autofree char *full_file_name =3D NULL;
> > +    HANDLE hSubDir;
> > +    DWORD attribute;
> > +
> > +    full_file_name =3D get_full_path_win32(dirfd, name);
> > +    if (full_file_name =3D=3D NULL) {
> > +        return INVALID_HANDLE_VALUE;
> > +    }
> > +
> > +    attribute =3D GetFileAttributes(full_file_name);
> > +    if (attribute =3D=3D INVALID_FILE_ATTRIBUTES) {
> > +        return INVALID_HANDLE_VALUE;
> > +    }
> > +
> > +    /* check if it is a directory */
> > +    if ((attribute & FILE_ATTRIBUTE_DIRECTORY) =3D=3D 0) {
> > +        return INVALID_HANDLE_VALUE;
> > +    }
> > +
> > +    /* do not allow opening a symbolic link */
> > +    if ((attribute & FILE_ATTRIBUTE_REPARSE_POINT) !=3D 0) {
> > +        return INVALID_HANDLE_VALUE;
> > +    }
> > +
> > +    /* open it */
> > +    hSubDir =3D CreateFile(full_file_name, GENERIC_READ,
> > +                         FILE_SHARE_READ | FILE_SHARE_WRITE |
> FILE_SHARE_DELETE,
> > +                         NULL,
> > +                         OPEN_EXISTING, FILE_FLAG_BACKUP_SEMANTICS, NU=
LL);
> > +    return hSubDir;
> > +}
> > +
> > +QemuFd_t openat_file(QemuFd_t dirfd, const char *name, int flags,
> > +                     mode_t mode)
> > +{
> > +    return openat_win32(dirfd, name, flags | _O_BINARY, mode); }
> > +
> > +/*
> > + * fgetxattrat_nofollow - get extended attribute
> > + *
> > + * This function gets extended attribute from file <path> in the
> > +directory
> > + * specified by <dirfd>. The extended atrribute name is specified by
> > +<name>
> > + * and return value will be put in <value>.
> > + *
> > + * This function emulates extended attribute by NTFS ADS.
> > + */
> > +ssize_t fgetxattrat_nofollow(QemuFd_t dirfd, const char *path,
> > +                             const char *name, void *value, size_t
> > +size) {
> > +    g_autofree char *full_file_name =3D NULL;
> > +    char ads_file_name[NAME_MAX + 1] =3D { 0 };
> > +    DWORD dwBytesRead;
> > +    HANDLE hStream;
> > +
> > +    full_file_name =3D get_full_path_win32(dirfd, path);
> > +    if (full_file_name =3D=3D NULL) {
> > +        errno =3D EIO;
> > +        return -1;
> > +    }
> > +
> > +    if (build_ads_name(ads_file_name, NAME_MAX, full_file_name, name) =
< 0)
> {
> > +        errno =3D EIO;
> > +        return -1;
> > +    }
> > +
> > +    hStream =3D CreateFile(ads_file_name, GENERIC_READ, FILE_SHARE_REA=
D,
> NULL,
> > +                         OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
> > +    if (hStream =3D=3D INVALID_HANDLE_VALUE &&
> > +        GetLastError() =3D=3D ERROR_FILE_NOT_FOUND) {
> > +        errno =3D ENODATA;
> > +        return -1;
> > +    }
> > +
> > +    if (ReadFile(hStream, value, size, &dwBytesRead, NULL) =3D=3D FALS=
E) {
> > +        errno =3D EIO;
> > +        CloseHandle(hStream);
> > +        return -1;
> > +    }
> > +
> > +    CloseHandle(hStream);
> > +
> > +    return dwBytesRead;
> > +}
> > +
> > +/*
> > + * fsetxattrat_nofollow - set extended attribute
> > + *
> > + * This function set extended attribute to file <path> in the
> > +directory
> > + * specified by <dirfd>.
> > + *
> > + * This function emulates extended attribute by NTFS ADS.
> > + */
> > +
> > +int fsetxattrat_nofollow(QemuFd_t dirfd, const char *path, const char
> *name,
> > +                         void *value, size_t size, int flags) {
> > +    g_autofree char *full_file_name =3D NULL;
> > +    char ads_file_name[NAME_MAX + 1] =3D { 0 };
> > +    DWORD dwBytesWrite;
> > +    HANDLE hStream;
> > +
> > +    full_file_name =3D get_full_path_win32(dirfd, path);
> > +    if (full_file_name =3D=3D NULL) {
> > +        errno =3D EIO;
> > +        return -1;
> > +    }
> > +
> > +    if (build_ads_name(ads_file_name, NAME_MAX, full_file_name, name) =
< 0)
> {
> > +        errno =3D EIO;
> > +        return -1;
> > +    }
> > +
> > +    hStream =3D CreateFile(ads_file_name, GENERIC_WRITE, FILE_SHARE_RE=
AD,
> NULL,
> > +                         CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, NULL);
> > +    if (hStream =3D=3D INVALID_HANDLE_VALUE) {
> > +        errno =3D EIO;
> > +        return -1;
> > +    }
> > +
> > +    if (WriteFile(hStream, value, size, &dwBytesWrite, NULL) =3D=3D FA=
LSE) {
> > +        errno =3D EIO;
> > +        CloseHandle(hStream);
> > +        return -1;
> > +    }
> > +
> > +    CloseHandle(hStream);
> > +
> > +    return 0;
> > +}
> > +
> > +/*
> > + * flistxattrat_nofollow - list extended attribute
> > + *
> > + * This function gets extended attribute lists from file <filename>
> > +in the
> > + * directory specified by <dirfd>. Lists returned will be put in <list=
>.
> > + *
> > + * This function emulates extended attribute by NTFS ADS.
> > + */
> > +ssize_t flistxattrat_nofollow(QemuFd_t dirfd, const char *filename,
> > +                              char *list, size_t size) {
> > +    g_autofree char *full_file_name =3D NULL;
> > +    WCHAR WideCharStr[NAME_MAX + 1] =3D { 0 };
> > +    char full_ads_name[NAME_MAX + 1];
> > +    WIN32_FIND_STREAM_DATA fsd;
> > +    BOOL bFindNext;
> > +    char *list_ptr =3D list;
> > +    size_t list_left_size =3D size;
> > +    HANDLE hFind;
> > +    int ret;
> > +
> > +    full_file_name =3D get_full_path_win32(dirfd, filename);
> > +    if (full_file_name =3D=3D NULL) {
> > +        errno =3D EIO;
> > +        return -1;
> > +    }
> > +
> > +    /*
> > +     * ADS enumerate function only has WCHAR version, so we need to
> > +     * covert filename to utf-8 string.
> > +     */
> > +    ret =3D MultiByteToWideChar(CP_UTF8, 0, full_file_name,
> > +                              strlen(full_file_name), WideCharStr,
> NAME_MAX);
> > +    if (ret =3D=3D 0) {
> > +        errno =3D EIO;
> > +        return -1;
> > +    }
> > +
> > +    hFind =3D FindFirstStreamW(WideCharStr, FindStreamInfoStandard, &f=
sd, 0);
> > +    if (hFind =3D=3D INVALID_HANDLE_VALUE) {
> > +        errno =3D ENODATA;
> > +        return -1;
> > +    }
> > +
> > +    do {
> > +        memset(full_ads_name, 0, sizeof(full_ads_name));
> > +
> > +        /*
> > +         * ADS enumerate function only has WCHAR version, so we need t=
o
> > +         * covert cStreamName to utf-8 string.
> > +         */
> > +        ret =3D WideCharToMultiByte(CP_UTF8, 0,
> > +                                  fsd.cStreamName, wcslen(fsd.cStreamN=
ame)
> + 1,
> > +                                  full_ads_name, sizeof(full_ads_name)=
 - 1,
> > +                                  NULL, NULL);
> > +        if (ret =3D=3D 0) {
> > +            if (GetLastError() =3D=3D ERROR_INSUFFICIENT_BUFFER) {
> > +                errno =3D ERANGE;
> > +            }
> > +            CloseHandle(hFind);
> > +            return -1;
> > +        }
> > +
> > +        ret =3D copy_ads_name(list_ptr, list_left_size, full_ads_name)=
;
> > +        if (ret < 0) {
> > +            errno =3D ERANGE;
> > +            CloseHandle(hFind);
> > +            return -1;
> > +        }
> > +
> > +        list_ptr =3D list_ptr + ret;
> > +        list_left_size =3D list_left_size - ret;
> > +
> > +        bFindNext =3D FindNextStreamW(hFind, &fsd);
> > +    } while (bFindNext);
> > +
> > +    CloseHandle(hFind);
> > +
> > +    return size - list_left_size;
> > +}
> > +
> > +/*
> > + * fremovexattrat_nofollow - remove extended attribute
> > + *
> > + * This function removes an extended attribute from file <filename>
> > +in the
> > + * directory specified by <dirfd>.
> > + *
> > + * This function emulates extended attribute by NTFS ADS.
> > + */
> > +ssize_t fremovexattrat_nofollow(QemuFd_t dirfd, const char *filename,
> > +                                const char *name) {
> > +    g_autofree char *full_file_name =3D NULL;
> > +    char ads_file_name[NAME_MAX + 1] =3D { 0 };
> > +
> > +    full_file_name =3D get_full_path_win32(dirfd, filename);
> > +    if (full_file_name =3D=3D NULL) {
> > +        errno =3D EIO;
> > +        return -1;
> > +    }
> > +
> > +    if (build_ads_name(ads_file_name, NAME_MAX, filename, name) < 0) {
> > +        errno =3D EIO;
> > +        return -1;
> > +    }
> > +
> > +    if (DeleteFile(ads_file_name) !=3D 0) {
> > +        if (GetLastError() =3D=3D ERROR_FILE_NOT_FOUND) {
> > +            errno =3D ENODATA;
> > +            return -1;
> > +        }
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +/*
> > + * local_opendir_nofollow - open a Windows directory
> > + *
> > + * This function returns a Windows file handle of the directory
> > +specified by
> > + * <dirpath> based on 9pfs mount point.
> > + *
> > + * Windows POSIX API does not support opening a directory by open().
> > +Only
> > + * handle of directory can be opened by CreateFile().
> > + *
> > + * This function checks the resolved path of <dirpath>. If the
> > +resolved
> > + * path is not in the scope of root directory (e.g. by symbolic
> > +link), then
> > + * this function will fail to prevent any security issues.
> > + */
> > +HANDLE local_opendir_nofollow(FsContext *fs_ctx, const char *dirpath)
> > +{
> > +    g_autofree char *full_file_name =3D NULL;
> > +    LocalData *data =3D fs_ctx->private;
> > +    HANDLE hDir;
> > +
> > +    hDir =3D openat_dir(data->mountfd, dirpath);
> > +    if (hDir =3D=3D INVALID_HANDLE_VALUE) {
> > +        return INVALID_HANDLE_VALUE;
> > +    }
> > +
> > +    full_file_name =3D get_full_path_win32(hDir, NULL);
> > +    if (full_file_name =3D=3D NULL) {
> > +        CloseHandle(hDir);
> > +        return INVALID_HANDLE_VALUE;
> > +    }
> > +
> > +    /*
> > +     * Check if the resolved path is in the root directory scope:
> > +     * data->root_path and full_file_name are full path with symbolic
> > +     * link resolved, so fs_ctx->root_path must be in the head of
> > +     * full_file_name. If not, that means guest OS tries to open a fil=
e
> not
> > +     * in the scope of mount point. This operation should be denied.
> > +     */
> > +    if (memcmp(full_file_name, data->root_path,
> > +               strlen(data->root_path)) !=3D 0) {
> > +        CloseHandle(hDir);
> > +        hDir =3D INVALID_HANDLE_VALUE;
> > +    }
> > +
> > +    return hDir;
> > +}
> > +
> > +/*
> > + * qemu_mknodat - mknodat emulate function
> > + *
> > + * This function emulates mknodat on Windows. It only works when
> > +security
> > + * model is mapped or mapped-xattr.
> > + */
> > +int qemu_mknodat(QemuFd_t dirfd, const char *filename, mode_t mode,
> > +dev_t dev) {
> > +    if (S_ISREG(mode) || !(mode & S_IFMT)) {
> > +        HANDLE hFile =3D openat_file(dirfd, filename, O_CREAT, mode);
> > +        if (hFile =3D=3D INVALID_HANDLE_VALUE) {
> > +            return -1;
> > +        }
> > +        close_preserve_errno(hFile);
> > +        return 0;
> > +    }
> > +
> > +    error_report_once("Unsupported operation for mknodat");
> > +    errno =3D ENOTSUP;
> > +    return -1;
> > +}
> >
>=20


