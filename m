Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EC66BBCEF
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 20:06:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcWSC-0007na-4i; Wed, 15 Mar 2023 15:06:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2438831cd6=guohuai.shi@windriver.com>)
 id 1pcWS7-0007nH-FE
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 15:06:24 -0400
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2438831cd6=guohuai.shi@windriver.com>)
 id 1pcWS3-0007Oo-RC
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 15:06:22 -0400
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32FBiF4K024902; Wed, 15 Mar 2023 12:05:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=KGdNGJf33HZ2Hz8OdmfP2tfk3Mxzh3VO/Ii96/1nRdY=;
 b=kmVzrZfEPdujV/3H5pvEy9Ktop68OO3fbMcuBmAudzyi77FYp2YTRPGYmzZIk5GN5IwF
 FYV/n2PboXCzTopYwOiPZnJYBaS18Ww22q2HG6N8gSdfOp/EjQUGZETaFk92DcTJoHfY
 mK6wpL5cQS7FqfCYHx8uDSbYkfMMmlY9hVST90TuQ/8sB05ZkqR35vMgeA/hiQiAuP3O
 hJtv/O3w9h/92wxZ5ctXpDfNadSBTS26jhtatF7TjSkdVB7gxqmSl9EfIjG74ChUmfqT
 5S2IPlgTxRPjQD3u0vW7kXWOqt9xX//shbDDliREezlUVoXtcWbGcasq2ZgG0pX3UsC8 NQ== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pb2avgy1n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Mar 2023 12:05:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T0yJ5E6FTYToA5bXRkeEhM1LSmSTqJ3fMZQA0koQ2RvqkFmfRV8QS7XTdi9FezFu0Im6K5LbHwXVQ0ObCPjxnrtu+ZBNddKM+P7isaJVLzpl5m1E+l5owoBvfOcwKD4y/ELQsjqs0xBd47s9ZHFdROxAdDonOHvaG5A9zSJwdv+X+l0QU+F4imvoHhC940OJDeZ8KQ+2SxzWO1s/2JFayreP8eOTqjvxRvHfuZAkyjAFrI4G9RrYhurxSLREJhEMvfd1KHxbSZkv02jq/FNs3bI7ZbQtO9OIxaprBsc0NKczV0XKJF7BVKtt50pStuSz5LFIe0B6i2e6hEpUbO33EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KGdNGJf33HZ2Hz8OdmfP2tfk3Mxzh3VO/Ii96/1nRdY=;
 b=P5dr47wU68yohMLo2kdk+Fr8UXM05D3Y8cN1tsQAix1+5B0oE/qJAW1a+W5QlUj/Pk1B1GTlciAv0YkxCl9le5PlX13wXfDfZsdcnpW0myv4AX0Oje/mAsfU6KeJL6hTlncQphhFjdK5AItgWsMVzeqGO/ox3o91qxAlT12RY6VJxnbScqMTsMiQIs9Sp84TDTvapCzlHr0DOnPEOF+ePz9S5xxg58mJLfKOMioRlFtpR0OKpghu1L0s0eYmHQxZKDqiVb68ipBLiicjyQBD2zbDDvB9oARUiCBsErj4g21hc7gLMCvONyvL7LLGaUlGo7oZh59FU/htkiSrludHLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MN2PR11MB4173.namprd11.prod.outlook.com (2603:10b6:208:137::20)
 by PH8PR11MB6730.namprd11.prod.outlook.com (2603:10b6:510:1c6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Wed, 15 Mar
 2023 19:05:34 +0000
Received: from MN2PR11MB4173.namprd11.prod.outlook.com
 ([fe80::2d69:6276:f527:9fb4]) by MN2PR11MB4173.namprd11.prod.outlook.com
 ([fe80::2d69:6276:f527:9fb4%7]) with mapi id 15.20.6178.029; Wed, 15 Mar 2023
 19:05:34 +0000
From: "Shi, Guohuai" <Guohuai.Shi@windriver.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "Meng, Bin" <Bin.Meng@windriver.com>
Subject: RE: [PATCH v5 04/16] hw/9pfs: Implement Windows specific xxxdir() APIs
Thread-Topic: [PATCH v5 04/16] hw/9pfs: Implement Windows specific xxxdir()
 APIs
Thread-Index: AQHZRRNNU05mDRm7PkmKbsZ8rLhVIa76k4AAgAA4rsA=
Date: Wed, 15 Mar 2023 19:05:34 +0000
Message-ID: <MN2PR11MB4173F2F6DEDE4C2D07AD444BEFBF9@MN2PR11MB4173.namprd11.prod.outlook.com>
References: <20230220100815.1624266-1-bin.meng@windriver.com>
 <20230220100815.1624266-5-bin.meng@windriver.com> <1922294.e5CzDnASyn@silver>
In-Reply-To: <1922294.e5CzDnASyn@silver>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR11MB4173:EE_|PH8PR11MB6730:EE_
x-ms-office365-filtering-correlation-id: aebfa7c0-51d7-42db-a92f-08db25884150
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NeShiRzuC4Kg0+5CbiEodrz9WZsDxJxGMsKY0u/+Z7m1tver+7Oh9rkWW15ZTU2rUgJevBkZEiQTJs6iAE4mEsBx7KCq/pSLszs03KuX9BX/T7f+NXT2X87Am9uEysYwv+YIxPgrQqVjl+OoiWtIF9pB4K1lff1w0fStZAM1kdoA6LYip/eXoIrcUBkZyhJxcI9ot+UcXYZhGfcvN5E6vZFlyGcAz6FTd+CYoghxuoB4WJ9zBpR6CVljatBNCjuP4dVqisFkS9DXVRbR3kDFNoNeZiElP25FkxB5WVknjHFYtBKCXOEnvkvQSfbGYKb4BUgexk7ka1/z21jFNNxWSQDMGy8ry9wLi+qOZ7/Yv0n0zg8zqPxwrJp9htN+G5ixgpvdxVSaD86GtJ5C2WFaT+d3g6W7Gs1G3aSjw+2owCBg85RuHCYS3b9kjHZF1mOTs1xQeGNyCLLp7OUHXwJkbZGG8g9UdnHU77dsuuldYpYqab39Itrxb9Eus2W8iRw3zoxZZe6+zfWaXLB/OtflD2BJAHRBslkeuc1vrNC2JUG1m4haDKbGl/8CB0Up6gk6+NQJ7DWmvUMrKQKy3y8eYbUBX04d0dafDd7vCkHdLZaFTY+MyUsBxPi8oU8VsiZXCWxTQyP6neWM5kzs8QuguUI/eneT9A94eVSUu43+oxqT2kjkSyFukzrezEPj/VRFeuvKIydnwhq5An30tXMHYw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4173.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(136003)(346002)(396003)(39860400002)(366004)(451199018)(33656002)(316002)(110136005)(478600001)(71200400001)(52536014)(5660300002)(7696005)(64756008)(8936002)(66446008)(66476007)(8676002)(4326008)(66556008)(30864003)(76116006)(66946007)(2906002)(41300700001)(107886003)(186003)(83380400001)(55016003)(86362001)(38100700002)(122000001)(38070700005)(9686003)(26005)(6506007)(53546011)(579004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+Iynf/MX/0R0xEvbs2ZiFaMUc0+H0EgG0/3oHmCvaB3g661AI8DXCRBDZfX8?=
 =?us-ascii?Q?SuCsN4INUIhTvEAgaLoqlajudrU3EoDQ/2mlOJSztqgTfzsBCPhBc/VrJFjk?=
 =?us-ascii?Q?poWJULU3mDCjhjD0PCOq2naFisS4cbIDFNiQHZRHQZMrhZYJNZtJRH3mnOvi?=
 =?us-ascii?Q?hBuCJs90uVe+4NLj+YqtQ2gIAQQunwBKfVPdj7YBg22BzZLaAMkHtbWkLlA0?=
 =?us-ascii?Q?viXyiXaZV1qfdPf1oeXrWNLzosFtCwohUdb9zK92Ot3bRoIQ1l/+lW3JXsrI?=
 =?us-ascii?Q?UCIPl2U//QPQA+RX/OsNWbCF4vk7FjnLVQp23wl7eJl2wGNVZyBA90rzsU4S?=
 =?us-ascii?Q?vy7Cj7lZJ8PEVBuSIkgHYM+nokfu5YznuWyZTwTEPBWxk7RBuMLL3ErmZ5eo?=
 =?us-ascii?Q?HYXt5txgOD1f/Nb7Wv1go250dkGB/S1rYnYp43z5nUqmyOQzZqEarafPyvow?=
 =?us-ascii?Q?69a0erBMGHs6800bzDY7AEWCFmZo3TA812FT0Abcsxb/3afpI5jOpUOQKqEo?=
 =?us-ascii?Q?5R95D9J/yWcHLVn8z32yIOrs1Kx4x6Hhng+dC4kbBnOCFqsgey3m6FH42595?=
 =?us-ascii?Q?z4n+TykjQQA+IaVe9lTtD01gy26nc01cnq/P/WFtncktOMZpyalJfepXGwTs?=
 =?us-ascii?Q?XtuSMCZN2wozJT2PSdih870JpVTvY4xQDuMDHP9MfcdMmc6mvOfUd4nhrD71?=
 =?us-ascii?Q?Bp6/s4MmGTqtXVwMC73JTq7QyeL8VbwzN5jWRiaIW/QqiLkP1H4d1pXnAA0B?=
 =?us-ascii?Q?7IzCJHpXnJ++1lyA22Yh+A+P9DZ4IBeis42VOYKw89QhEt1kwbjv++Wqkpy1?=
 =?us-ascii?Q?g2t+BWloqr1AF9hLBRP2dgkZJdiNUimnkk2QNMm9S8pbX8SN2LMifhz6YXpB?=
 =?us-ascii?Q?Z80fbeU3H4tQ6bQgn+Vvx4sh+Alg2wBaM9Yiszk4GO5xTyKOaIA+rkcw0gJZ?=
 =?us-ascii?Q?qEsZkWUupyoOnT6KVswSde3brnVr8+rxgl0YKdANohG4KufImTFOZwy6Unpd?=
 =?us-ascii?Q?1g6OOqW5oPEk0OMmzQSxX9haIU8DjLjHc7AsTZzqoYQMCAM6bYtW+t/4UR/U?=
 =?us-ascii?Q?G4vMg8HgARjk7OvFRsN1+EYo5Mx9mMPww5a4lUHAFAJny5q4g0Xt94VQRBwa?=
 =?us-ascii?Q?Llj3DxFqyqvSubkSoRpA7W7uWt/MW3/emVZeBJrJPFbvbV5hD8aUfW1XxeKu?=
 =?us-ascii?Q?l6l1GmOMBuqN9mVEBA+pHyFKsnIlT6O0wauOAK63a6QBCqormcU12GWeluiZ?=
 =?us-ascii?Q?bP/wQPdy5dSaP2EnE5LqvcRZ6MNe6nKVLv5vtJOE+Uea4coYQMi+vD51/W6D?=
 =?us-ascii?Q?w+5Yu4A/jYle698/J7evdvpfO5fiHYtVavhX0iMv4Csb1wdOAmoEFdcUtysU?=
 =?us-ascii?Q?/2grdUsopsxUBmtAhLKXkPl5BYnVvGBGAH5axkSvi62ZrGpbPiKmaSyBOPB5?=
 =?us-ascii?Q?Th9EmlfJcXYHlA+bW17B1hxzaAnzqph6EViTUo0qVFQzSclpUVw62Es+XMwS?=
 =?us-ascii?Q?SLpPLmyHjdQu2DdTTm1da5zswXcT6IaOvSjWSSVu0mEgaQSu+r+nYQiekupg?=
 =?us-ascii?Q?TYmP1Pna8iAXIPDf0gqwhws4NhtFtiHizkmJdrjPQPmvX86d8f230f/lxAh8?=
 =?us-ascii?Q?Ow=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4173.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aebfa7c0-51d7-42db-a92f-08db25884150
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2023 19:05:34.4486 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WFARBA2RFvdsijHPoT94SM7Yca1bF3l11SNPIiBfz3wuI/EnzG4MrBEcdxHVam8DWFgZUdUladfZYOWMZphqfDqJyUGF/6f0HXvmXrtfRLk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6730
X-Proofpoint-ORIG-GUID: HmS4u_7_2EQI6rexvhmK0XAjYJUt7z5b
X-Proofpoint-GUID: HmS4u_7_2EQI6rexvhmK0XAjYJUt7z5b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-15_10,2023-03-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 phishscore=0
 clxscore=1011 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2302240000 definitions=main-2303150159
Received-SPF: pass client-ip=205.220.166.238;
 envelope-from=prvs=2438831cd6=guohuai.shi@windriver.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



> -----Original Message-----
> From: Christian Schoenebeck <qemu_oss@crudebyte.com>
> Sent: Wednesday, March 15, 2023 00:06
> To: Greg Kurz <groug@kaod.org>; qemu-devel@nongnu.org
> Cc: Shi, Guohuai <Guohuai.Shi@windriver.com>; Meng, Bin
> <Bin.Meng@windriver.com>
> Subject: Re: [PATCH v5 04/16] hw/9pfs: Implement Windows specific xxxdir(=
)
> APIs
>=20
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d
> know the content is safe.
>=20
> On Monday, February 20, 2023 11:08:03 AM CET Bin Meng wrote:
> > From: Guohuai Shi <guohuai.shi@windriver.com>
> >
> > This commit implements Windows specific xxxdir() APIs for safety
> > directory access.
>=20
> That comment is seriously too short for this patch.
>=20
> 1. You should describe the behaviour implementation that you have chosen =
and
> why you have chosen it.
>=20
> 2. Like already said in the previous version of the patch, you should pla=
ce a
> link to the discussion we had on this issue.
>=20
> > Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > ---
> >
> >  hw/9pfs/9p-util.h       |   6 +
> >  hw/9pfs/9p-util-win32.c | 443
> > ++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 449 insertions(+)
> >
> > diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h index
> > 0f159fb4ce..c1c251fbd1 100644
> > --- a/hw/9pfs/9p-util.h
> > +++ b/hw/9pfs/9p-util.h
> > @@ -141,6 +141,12 @@ int unlinkat_win32(int dirfd, const char
> > *pathname, int flags);  int statfs_win32(const char *root_path, struct
> > statfs *stbuf);  int openat_dir(int dirfd, const char *name);  int
> > openat_file(int dirfd, const char *name, int flags, mode_t mode);
> > +DIR *opendir_win32(const char *full_file_name); int
> > +closedir_win32(DIR *pDir); struct dirent *readdir_win32(DIR *pDir);
> > +void rewinddir_win32(DIR *pDir); void seekdir_win32(DIR *pDir, long
> > +pos); long telldir_win32(DIR *pDir);
> >  #endif
> >
> >  static inline void close_preserve_errno(int fd) diff --git
> > a/hw/9pfs/9p-util-win32.c b/hw/9pfs/9p-util-win32.c index
> > a99d579a06..e9408f3c45 100644
> > --- a/hw/9pfs/9p-util-win32.c
> > +++ b/hw/9pfs/9p-util-win32.c
> > @@ -37,6 +37,16 @@
> >   *    Windows does not support opendir, the directory fd is created by
> >   *    CreateFile and convert to fd by _open_osfhandle(). Keep the fd o=
pen
> will
> >   *    lock and protect the directory (can not be modified or replaced)
> > + *
> > + * 5. Neither Windows native APIs, nor MinGW provide a POSIX compatibl=
e
> API for
> > + *    acquiring directory entries in a safe way. Calling those APIs
> (native
> > + *    _findfirst() and _findnext() or MinGW's readdir(), seekdir() and
> > + *    telldir()) directly can lead to an inconsistent state if directo=
ry
> is
> > + *    modified in between, e.g. the same directory appearing more than
> once
> > + *    in output, or directories not appearing at all in output even th=
ough
> they
> > + *    were neither newly created nor deleted. POSIX does not define wh=
at
> happens
> > + *    with deleted or newly created directories in between, but it
> guarantees a
> > + *    consistent state.
> >   */
> >
> >  #include "qemu/osdep.h"
> > @@ -51,6 +61,25 @@
> >
> >  #define V9FS_MAGIC  0x53465039  /* string "9PFS" */
> >
> > +/*
> > + * MinGW and Windows does not provide a safe way to seek directory
> > +while other
> > + * thread is modifying the same directory.
> > + *
> > + * This structure is used to store sorted file id and ensure
> > +directory seek
> > + * consistency.
> > + */
> > +struct dir_win32 {
> > +    struct dirent dd_dir;
> > +    uint32_t offset;
> > +    uint32_t total_entries;
> > +    HANDLE hDir;
> > +    uint32_t dir_name_len;
> > +    uint64_t dot_id;
> > +    uint64_t dot_dot_id;
> > +    uint64_t *file_id_list;
> > +    char dd_name[1];
> > +};
> > +
> >  /*
> >   * win32_error_to_posix - convert Win32 error to POSIX error number
> >   *
> > @@ -977,3 +1006,417 @@ int qemu_mknodat(int dirfd, const char *filename=
,
> mode_t mode, dev_t dev)
> >      errno =3D ENOTSUP;
> >      return -1;
> >  }
> > +
> > +static int file_id_compare(const void *id_ptr1, const void *id_ptr2)
> > +{
> > +    uint64_t id[2];
> > +
> > +    id[0] =3D *(uint64_t *)id_ptr1;
> > +    id[1] =3D *(uint64_t *)id_ptr2;
> > +
> > +    if (id[0] > id[1]) {
> > +        return 1;
> > +    } else if (id[0] < id[1]) {
> > +        return -1;
> > +    } else {
> > +        return 0;
> > +    }
> > +}
> > +
> > +static int get_next_entry(struct dir_win32 *stream) {
> > +    HANDLE hDirEntry =3D INVALID_HANDLE_VALUE;
> > +    char *entry_name;
> > +    char *entry_start;
> > +    FILE_ID_DESCRIPTOR fid;
> > +    DWORD attribute;
> > +
> > +    if (stream->file_id_list[stream->offset] =3D=3D stream->dot_id) {
> > +        strcpy(stream->dd_dir.d_name, ".");
> > +        return 0;
> > +    }
> > +
> > +    if (stream->file_id_list[stream->offset] =3D=3D stream->dot_dot_id=
) {
> > +        strcpy(stream->dd_dir.d_name, "..");
> > +        return 0;
> > +    }
> > +
> > +    fid.dwSize =3D sizeof(fid);
> > +    fid.Type =3D FileIdType;
> > +
> > +    fid.FileId.QuadPart =3D stream->file_id_list[stream->offset];
> > +
> > +    hDirEntry =3D OpenFileById(stream->hDir, &fid, GENERIC_READ,
> > +                             FILE_SHARE_READ | FILE_SHARE_WRITE
> > +                             | FILE_SHARE_DELETE,
> > +                             NULL,
> > +                             FILE_FLAG_BACKUP_SEMANTICS
> > +                             | FILE_FLAG_OPEN_REPARSE_POINT);
>=20
> What's the purpose of FILE_FLAG_OPEN_REPARSE_POINT here? As it's apparent=
ly
> not obvious, please add a comment.
>=20

If do not use this flag, and if file id is a symbolic link, then Windows wi=
ll not symbolic link itself, but open the target file.
This flag is similar as O_NOFOLLOW flag.

> > +
> > +    if (hDirEntry =3D=3D INVALID_HANDLE_VALUE) {
> > +        /*
> > +         * Not open it successfully, it may be deleted.
>=20
> Wrong English. "Open failed, it may have been deleted in the meantime.".
>=20
> > +         * Try next id.
> > +         */
> > +        return -1;
> > +    }
> > +
> > +    entry_name =3D get_full_path_win32(hDirEntry, NULL);
> > +
> > +    CloseHandle(hDirEntry);
> > +
> > +    if (entry_name =3D=3D NULL) {
> > +        return -1;
> > +    }
> > +
> > +    attribute =3D GetFileAttributes(entry_name);
> > +
> > +    /* symlink is not allowed */
> > +    if (attribute =3D=3D INVALID_FILE_ATTRIBUTES
> > +        || (attribute & FILE_ATTRIBUTE_REPARSE_POINT) !=3D 0) {
> > +        return -1;
>=20
> Wouldn't it make sense to call warn_report_once() here to let the user kn=
ow
> that he has some symlinks that are never delivered to guest?

OK, Got it.

>=20
> > +    }
> > +
> > +    if (memcmp(entry_name, stream->dd_name, stream->dir_name_len) !=3D
> > + 0) {
>=20
> No, that's unsafe. You want to use something like strncmp() instead.
>=20
> > +        /*
> > +         * The full entry file name should be a part of parent directo=
ry
> name,
> > +         * except dot and dot_dot (is already handled).
> > +         * If not, this entry should not be returned.
> > +         */
> > +        return -1;
> > +    }
> > +
> > +    entry_start =3D entry_name + stream->dir_name_len;
>=20
> s/entry_start/entry_basename/ ?
>=20
> > +
> > +    /* skip slash */
> > +    while (*entry_start =3D=3D '\\') {
> > +        entry_start++;
> > +    }
> > +
> > +    if (strchr(entry_start, '\\') !=3D NULL) {
> > +        return -1;
> > +    }
> > +
> > +    if (strlen(entry_start) =3D=3D 0
> > +        || strlen(entry_start) + 1 > sizeof(stream->dd_dir.d_name)) {
> > +        return -1;
> > +    }
> > +    strcpy(stream->dd_dir.d_name, entry_start);
>=20
> g_path_get_basename() ? :)

For above three comments:
This code is not good, should be fixed.
The code want to filter the following cases:
The parent directory path is not a part of entry's full path:=20
Parent: C:\123\456, entry: C:\123, C:\
Entry contains more than one name components:
Parent: C:\123\456, entry: C:\123\456\789\abc
Entry is zero length or name buffer is too long

I will refactor this part.

>=20
> > +
> > +    return 0;
> > +}
> > +
> > +/*
> > + * opendir_win32 - open a directory
> > + *
> > + * This function opens a directory and caches all directory entries.
>=20
> It just caches all file IDs, doesn't it?
>=20

Will fix it

> > + */
> > +DIR *opendir_win32(const char *full_file_name) {
> > +    HANDLE hDir =3D INVALID_HANDLE_VALUE;
> > +    HANDLE hDirEntry =3D INVALID_HANDLE_VALUE;
> > +    char *full_dir_entry =3D NULL;
> > +    DWORD attribute;
> > +    intptr_t dd_handle =3D -1;
> > +    struct _finddata_t dd_data;
> > +    uint64_t file_id;
> > +    uint64_t *file_id_list =3D NULL;
> > +    BY_HANDLE_FILE_INFORMATION FileInfo;
>=20
> FileInfo is the variable name, not a struct name, so no upper case for it
> please.

Will fix it.
>=20
> > +    struct dir_win32 *stream =3D NULL;
> > +    int err =3D 0;
> > +    int find_status;
> > +    int sort_first_two_entry =3D 0;
> > +    uint32_t list_count =3D 16;
>=20
> Magic number 16?

Will change it to a macro.
>=20
> > +    uint32_t index =3D 0;
> > +
> > +    /* open directory to prevent it being removed */
> > +
> > +    hDir =3D CreateFile(full_file_name, GENERIC_READ,
> > +                      FILE_SHARE_READ | FILE_SHARE_WRITE |
> FILE_SHARE_DELETE,
> > +                      NULL,
> > +                      OPEN_EXISTING,
> > +                      FILE_FLAG_BACKUP_SEMANTICS |
> FILE_FLAG_OPEN_REPARSE_POINT,
> > +                      NULL);
> > +
> > +    if (hDir =3D=3D INVALID_HANDLE_VALUE) {
> > +        err =3D win32_error_to_posix(GetLastError());
> > +        goto out;
> > +    }
> > +
> > +    attribute =3D GetFileAttributes(full_file_name);
> > +
> > +    /* symlink is not allow */
> > +    if (attribute =3D=3D INVALID_FILE_ATTRIBUTES
> > +        || (attribute & FILE_ATTRIBUTE_REPARSE_POINT) !=3D 0) {
> > +        err =3D EACCES;
> > +        goto out;
> > +    }
> > +
> > +    /* check if it is a directory */
> > +    if ((attribute & FILE_ATTRIBUTE_DIRECTORY) =3D=3D 0) {
> > +        err =3D ENOTDIR;
> > +        goto out;
> > +    }
> > +
> > +    file_id_list =3D g_malloc0(sizeof(uint64_t) * list_count);
> > +
> > +    /*
> > +     * findfirst() needs suffix format name like "\dir1\dir2\*",
> > +     * allocate more buffer to store suffix.
> > +     */
> > +    stream =3D g_malloc0(sizeof(struct dir_win32) +
> > + strlen(full_file_name) + 3);
>=20
> Not that I would care much, but +2 would be correct here, as you declared=
 the
> struct with one character already, so it is not a classic (zero size) fle=
x
> array:
>=20
>   struct dir_win32 {
>     ...
>     char dd_name[1];
>   };
>=20
Will fix it.

> > +
> > +    strcpy(stream->dd_name, full_file_name);
> > +    strcat(stream->dd_name, "\\*");
> > +
> > +    stream->hDir =3D hDir;
> > +    stream->dir_name_len =3D strlen(full_file_name);
> > +
> > +    dd_handle =3D _findfirst(stream->dd_name, &dd_data);
> > +
> > +    if (dd_handle =3D=3D -1) {
> > +        err =3D errno;
> > +        goto out;
> > +    }
> > +
> > +    /* read all entries to link list */
>=20
> "read all entries as a linked list"
>=20
> However there is no linked list here. It seems to be an array.

Will fix it.
>=20
> > +    do {
> > +        full_dir_entry =3D get_full_path_win32(hDir, dd_data.name);
> > +
> > +        if (full_dir_entry =3D=3D NULL) {
> > +            err =3D ENOMEM;
> > +            break;
> > +        }
> > +
> > +        /*
> > +         * Open every entry and get the file informations.
> > +         *
> > +         * Skip symbolic links during reading directory.
> > +         */
> > +        hDirEntry =3D CreateFile(full_dir_entry,
> > +                               GENERIC_READ,
> > +                               FILE_SHARE_READ | FILE_SHARE_WRITE
> > +                               | FILE_SHARE_DELETE,
> > +                               NULL,
> > +                               OPEN_EXISTING,
> > +                               FILE_FLAG_BACKUP_SEMANTICS
> > +                               | FILE_FLAG_OPEN_REPARSE_POINT, NULL);
> > +
> > +        if (hDirEntry !=3D INVALID_HANDLE_VALUE) {
> > +            if (GetFileInformationByHandle(hDirEntry,
> > +                                           &FileInfo) =3D=3D TRUE) {
> > +                attribute =3D FileInfo.dwFileAttributes;
> > +
> > +                /* only save validate entries */
> > +                if ((attribute & FILE_ATTRIBUTE_REPARSE_POINT) =3D=3D =
0) {
> > +                    if (index >=3D list_count) {
> > +                        list_count =3D list_count + 16;
>=20
> Magic number 16 again.
>=20
> > +                        file_id_list =3D g_realloc(file_id_list,
> > +                                                 sizeof(uint64_t)
> > +                                                 * list_count);
>=20
> OK, so here we are finally at the point where you chose the overall behav=
iour
> for this that we discussed before.
>=20
> So you are constantly appending 16 entry chunks to the end of the array,
> periodically reallocate the entire array, and potentially end up with one
> giant dense array with *all* file IDs of the directory.
>=20
> That's not really what I had in mind, as it still has the potential to ea=
sily
> crash QEMU if there are large directories on host. Theoretically a Window=
s
> directory might then consume up to 16 GB of RAM for looking up only one
> single directory.
>=20
> So is this the implementation that you said was very slow, or did you tes=
t a
> different one? Remember, my orgiginal idea (as starting point for Windows=
)
> was to only cache *one* file ID (the last being looked up). That's it. No=
t a
> list of file IDs.

If only cache one file ID, that means for every read directory operation.
we need to look up whole directory to find out the next ID larger than last=
 cached one.

I provided some performance test in last patch:
Run test for read directory with 100, 1000, 10000 entries
#1, For file name cache solution, the time cost is: 2, 9, 44 (in ms).
#2, For file id cache solution, the time cost: 3, 438, 4338 (in ms). This i=
s current solution.
#3, for cache one id solution, I just tested it: 4, 4788, more than one min=
utes (in ms)

I think it is not a good idea to cache one file id, it would be very bad pe=
rformance

>=20
> > +                    }
> > +                    file_id =3D (uint64_t)FileInfo.nFileIndexLow
> > +                              + (((uint64_t)FileInfo.nFileIndexHigh)
> > + << 32);
> > +
> > +
> > +                    file_id_list[index] =3D file_id;
> > +
> > +                    if (strcmp(dd_data.name, ".") =3D=3D 0) {
> > +                        stream->dot_id =3D file_id_list[index];
> > +                        if (index !=3D 0) {
> > +                            sort_first_two_entry =3D 1;
> > +                        }
> > +                    } else if (strcmp(dd_data.name, "..") =3D=3D 0) {
> > +                        stream->dot_dot_id =3D file_id_list[index];
> > +                        if (index !=3D 1) {
> > +                            sort_first_two_entry =3D 1;
> > +                        }
> > +                    }
> > +                    index++;
> > +                }
> > +            }
> > +            CloseHandle(hDirEntry);
> > +        }
> > +        g_free(full_dir_entry);
> > +        find_status =3D _findnext(dd_handle, &dd_data);
> > +    } while (find_status =3D=3D 0);
> > +
> > +    if (errno =3D=3D ENOENT) {
> > +        /* No more matching files could be found, clean errno */
> > +        errno =3D 0;
> > +    } else {
> > +        err =3D errno;
> > +        goto out;
> > +    }
> > +
> > +    stream->total_entries =3D index;
> > +    stream->file_id_list =3D file_id_list;
> > +
> > +    if (sort_first_two_entry =3D=3D 0) {
> > +        /*
> > +         * If the first two entry is "." and "..", then do not sort th=
em.
> > +         *
> > +         * If the guest OS always considers first two entries are "." =
and
> "..",
> > +         * sort the two entries may cause confused display in guest OS=
.
> > +         */
> > +        qsort(&file_id_list[2], index - 2, sizeof(file_id),
> file_id_compare);
> > +    } else {
> > +        qsort(&file_id_list[0], index, sizeof(file_id), file_id_compar=
e);
> > +    }
>=20
> Were there cases where you did not get "." and ".." ?

NTFS always provides "." and "..".
I could add more checks here to fix this risk

>=20
> > +
> > +out:
> > +    if (err !=3D 0) {
> > +        errno =3D err;
> > +        if (stream !=3D NULL) {
> > +            if (file_id_list !=3D NULL) {
> > +                g_free(file_id_list);
> > +            }
> > +            CloseHandle(hDir);
> > +            g_free(stream);
> > +            stream =3D NULL;
> > +        }
> > +    }
> > +
> > +    if (dd_handle !=3D -1) {
> > +        _findclose(dd_handle);
> > +    }
> > +
> > +    return (DIR *)stream;
> > +}
> > +
> > +/*
> > + * closedir_win32 - close a directory
> > + *
> > + * This function closes directory and free all cached resources.
> > + */
> > +int closedir_win32(DIR *pDir)
> > +{
> > +    struct dir_win32 *stream =3D (struct dir_win32 *)pDir;
> > +
> > +    if (stream =3D=3D NULL) {
> > +        errno =3D EBADF;
> > +        return -1;
> > +    }
> > +
> > +    /* free all resources */
> > +    CloseHandle(stream->hDir);
> > +
> > +    g_free(stream->file_id_list);
> > +
> > +    g_free(stream);
> > +
> > +    return 0;
> > +}
> > +
> > +/*
> > + * readdir_win32 - read a directory
> > + *
> > + * This function reads a directory entry from cached entry list.
> > + */
> > +struct dirent *readdir_win32(DIR *pDir) {
> > +    struct dir_win32 *stream =3D (struct dir_win32 *)pDir;
> > +
> > +    if (stream =3D=3D NULL) {
> > +        errno =3D EBADF;
> > +        return NULL;
> > +    }
> > +
> > +retry:
> > +
> > +    if (stream->offset >=3D stream->total_entries) {
> > +        /* reach to the end, return NULL without set errno */
> > +        return NULL;
> > +    }
> > +
> > +    if (get_next_entry(stream) !=3D 0) {
> > +        stream->offset++;
> > +        goto retry;
> > +    }
> > +
> > +    /* Windows does not provide inode number */
> > +    stream->dd_dir.d_ino =3D 0;
> > +    stream->dd_dir.d_reclen =3D 0;
> > +    stream->dd_dir.d_namlen =3D strlen(stream->dd_dir.d_name);
> > +
> > +    stream->offset++;
> > +
> > +    return &stream->dd_dir;
> > +}
> > +
> > +/*
> > + * rewinddir_win32 - reset directory stream
> > + *
> > + * This function resets the position of the directory stream to the
> > + * beginning of the directory.
> > + */
> > +void rewinddir_win32(DIR *pDir)
> > +{
> > +    struct dir_win32 *stream =3D (struct dir_win32 *)pDir;
> > +
> > +    if (stream =3D=3D NULL) {
> > +        errno =3D EBADF;
> > +        return;
> > +    }
> > +
> > +    stream->offset =3D 0;
> > +
> > +    return;
> > +}
> > +
> > +/*
> > + * seekdir_win32 - set the position of the next readdir() call in the
> > +directory
> > + *
> > + * This function sets the position of the next readdir() call in the
> > +directory
> > + * from which the next readdir() call will start.
> > + */
> > +void seekdir_win32(DIR *pDir, long pos) {
> > +    struct dir_win32 *stream =3D (struct dir_win32 *)pDir;
> > +
> > +    if (stream =3D=3D NULL) {
> > +        errno =3D EBADF;
> > +        return;
> > +    }
> > +
> > +    if (pos < -1) {
> > +        errno =3D EINVAL;
> > +        return;
> > +    }
> > +
> > +    if (pos =3D=3D -1 || pos >=3D (long)stream->total_entries) {
> > +        /* seek to the end */
> > +        stream->offset =3D stream->total_entries;
> > +        return;
> > +    }
> > +
> > +    if (pos - (long)stream->offset =3D=3D 0) {
> > +        /* no need to seek */
> > +        return;
> > +    }
> > +
> > +    stream->offset =3D pos;
> > +
> > +    return;
> > +}
> > +
> > +/*
> > + * telldir_win32 - return current location in directory
> > + *
> > + * This function returns current location in directory.
> > + */
> > +long telldir_win32(DIR *pDir)
> > +{
> > +    struct dir_win32 *stream =3D (struct dir_win32 *)pDir;
> > +
> > +    if (stream =3D=3D NULL) {
> > +        errno =3D EBADF;
> > +        return -1;
> > +    }
> > +
> > +    if (stream->offset > stream->total_entries) {
> > +        return -1;
> > +    }
> > +
> > +    return (long)stream->offset;
> > +}
> >
>=20


