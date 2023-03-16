Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D13736BD71B
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 18:30:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcrPZ-0005IA-Sh; Thu, 16 Mar 2023 13:29:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=24390c1229=guohuai.shi@windriver.com>)
 id 1pcrPX-0005HP-1t
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 13:29:07 -0400
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=24390c1229=guohuai.shi@windriver.com>)
 id 1pcrPT-0003FQ-K5
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 13:29:06 -0400
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32GGWilw020783; Thu, 16 Mar 2023 17:28:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=jHTz1PxLYaSUuyfccHMoen3HUGYkgu5pS0mPmpLu17U=;
 b=i8JUXLMMCsWX832I2LD5LqB8HgGvjmTH3afUlH6W6sgRAQHoyj2flvSs94SGnLypezzt
 fqxJDETZFbhAKJ+RyqWY9xrMupgI0xK1wHPKgLa132x0uV10VihEU4pSzlyE7a/l/Q3P
 pY2YDSI9a40p1W+ZnDnJ3FTkjDWxDcODOeZGgb/lbNFNG0WFdIH74P1cJYO0vKA63lhN
 ICyyIyPXikygjxD0Vuyss/d5L91x6WdNgKeK9cTJeGE26bu8TbUtCLblebUrbkGPqPPw
 edlDIHjaCFfYCN5WwQk1vxJezTNn0fO3CX/F7H7z5e1TAfwcUIG/dIopE1tO57BpDDL+ tA== 
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam02lp2045.outbound.protection.outlook.com [104.47.56.45])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pbqm78t6j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Mar 2023 17:28:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cRfHA9erVpXrFAHhXB0e4Aks40dbk6+pqvf5XsY3oub6BNzHY2Sj7rkYVJZmOVUWRJkXDIt5O/tOQauSPPdWdUU1BummGuFLB5Y8vPgNPGJo1rIULqnhYWysy0eE6/chOzIsTs+LGzD2I9nMpPZESCxgZPvn6dSPt4kbFxfhLiXk0lIIaZ8VIR/7jqeMqoJ2OlBwhH/drqcJ8dmScQB2hcezBbblLv6aQI7ExQHPZkIceASobkDesM8PYEZxiHFkqB7mJVYtYgXRi/yFZTXAofn3Up2tKwFwYmlk4YbU9wFikEjTSirummrHi5lWShBUIMktd46OC2VpXOxjw9OG9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jHTz1PxLYaSUuyfccHMoen3HUGYkgu5pS0mPmpLu17U=;
 b=S2HkRaBeFRNuiGdJlLIsTR5bkeytwdSt5xhbbmvluLPojnNT6vLxcD6JIaSPXntDBnKVM65DTqaF2CfnsnoaMQ6mCyMg6a2vcuyRMHfT6qz4UyZ9z/ZwuWAtiuhBj1Q2pdgkKfAJ1s2Ud2gDSnWJV5nSs6WfpMBLmlz8s25oVoIb3ds0ZmfPsTBawJB9P3QMMXu96Nc+SkINEWkvgO1VL70JBn0siohtx80P/j9/JM7Hjiv2WAbEQLIJTZ2uq9QsWZUz9i4SBmAG/dotonRToVoV4ABi5QXE9F7NDCNfn+jWjjw6B7c8TRGKtQ+rmfd4VIw70+7q/a66toNi5dYuHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MN2PR11MB4173.namprd11.prod.outlook.com (2603:10b6:208:137::20)
 by PH7PR11MB6332.namprd11.prod.outlook.com (2603:10b6:510:1fc::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Thu, 16 Mar
 2023 17:28:16 +0000
Received: from MN2PR11MB4173.namprd11.prod.outlook.com
 ([fe80::2d69:6276:f527:9fb4]) by MN2PR11MB4173.namprd11.prod.outlook.com
 ([fe80::2d69:6276:f527:9fb4%7]) with mapi id 15.20.6178.031; Thu, 16 Mar 2023
 17:28:15 +0000
From: "Shi, Guohuai" <Guohuai.Shi@windriver.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "Meng, Bin" <Bin.Meng@windriver.com>
Subject: RE: [PATCH v5 04/16] hw/9pfs: Implement Windows specific xxxdir() APIs
Thread-Topic: [PATCH v5 04/16] hw/9pfs: Implement Windows specific xxxdir()
 APIs
Thread-Index: AQHZRRNNU05mDRm7PkmKbsZ8rLhVIa76k4AAgAA4rsCAApgMgIAABkcQ
Date: Thu, 16 Mar 2023 17:28:15 +0000
Message-ID: <MN2PR11MB4173F6A077C963E1C5149CF8EFBC9@MN2PR11MB4173.namprd11.prod.outlook.com>
References: <20230220100815.1624266-1-bin.meng@windriver.com>
 <1922294.e5CzDnASyn@silver>
 <MN2PR11MB4173F2F6DEDE4C2D07AD444BEFBF9@MN2PR11MB4173.namprd11.prod.outlook.com>
 <2201939.iVmW86lLxn@silver>
In-Reply-To: <2201939.iVmW86lLxn@silver>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR11MB4173:EE_|PH7PR11MB6332:EE_
x-ms-office365-filtering-correlation-id: a6c8eeed-ffbc-4fb6-8042-08db2643d37d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GAEW8pMTpHj6B9r1yFm50NL+vzT/qIodttlVg4dhf+f7uJFjZqH+UEV36PVaLHEvyhfI2wxVvfGiQg45mhXmjEQkbTg6BaabM/Hn9qSPqYWVFRsjvoPOP/W7LhchcO1VfvuQ0apul6PCNvcMY+NdzjuRTjfB2t3KUcBAu5AMpsrK4zvW/vbyGMLNCMH5NOPt716kYPKIIu7Jx6MWk6oMaXk1ZomkHMibc0dBrX6Zb9yLJt2G+Fwj8fKPyhvVCNKFTB400d+hpzme9tb084XkjcwVvkiW4TrIwMwp6E0tO9FVWLOmSidb5y9TD/2UGWhzGSHzeQrra8UqVPnjm9ZEehwK4ZGL1YnUSts+sE8Og75ATCKONEcwaa/o2T97FvBV5gwbLibWkPfxC8Vqyfg8pMzH5pxJWKoQQUkDgBjH2eVIPM9e10P/f87J7bBg8JXBQ71J1FlJW2Mdj8NHCx5DAChAY2P0uCTQk+EvwOhvQkvz0HJR5YSS8K0swJ/1RjKe6ESHo3NPMo3cDXVn8WSYbvY0KQb8T9dqLmQw2aEzBO1EjK9y1aYGv4AcHo7RfWqxgvdae27am1q3cKVFAXcZy7kTGaMVfQ9COEKFpYCj/T6mBgoWHkarZA7SW/j+WgpxVO5R64GY4gf/mUl/yCz+qUmA/bEwr93WDxaD9z53CoDP/aoDmvYl3PFSqljSsJIsD7UndF69PKzN5mqV09lE6A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4173.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39850400004)(376002)(366004)(346002)(396003)(136003)(451199018)(316002)(83380400001)(33656002)(76116006)(5660300002)(30864003)(38100700002)(55016003)(86362001)(52536014)(122000001)(478600001)(8676002)(41300700001)(66446008)(66556008)(66476007)(66946007)(64756008)(4326008)(107886003)(26005)(9686003)(8936002)(110136005)(7696005)(186003)(38070700005)(2906002)(6506007)(71200400001)(53546011)(559001)(579004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?G3eUsfvwi3qXQw2nXuV3BeCIuR8+mGafjqclc4nyFuXMu5YfmOErEI0PBVB7?=
 =?us-ascii?Q?tSZaOU9+EHEeBPNPm//PtVwHKYkYHFQ0RvkW8zlXTtT5YnG+iGxX7B3fbZGj?=
 =?us-ascii?Q?aeGwaFfEBJSXz3TYPrGfQLBcU+gLqUXotUqdJ0KkKa7ELWUj3xRI+l6gcZnt?=
 =?us-ascii?Q?nzXFsf/X16iZU9e9vdHSHgJGOIBx2OzkRYpLcjEYEmfxwvZrTiEMy/FxKbqb?=
 =?us-ascii?Q?/g8E08g93uS8v6lb7kRWjNtw+QizkxKAOh/54HS6DTkTQARH4K40Za/fthUB?=
 =?us-ascii?Q?HIJ1u1gioB/hnTjOa8BUvEn1vkDQPOfU8Nh9GpY2nhfRsN3SsSCKYWjnB+sA?=
 =?us-ascii?Q?dPjZnyBHKzAlHArRJc+hww4jHPmMOdhXZY+YIbL7ERf0OWfpcmYr27UmX9wD?=
 =?us-ascii?Q?UV9JZwqNlj3QqpfPigAUfwDi9IZYQuJMAsVDExfS/dBpjz3bp0uQzJNg6mSc?=
 =?us-ascii?Q?loAiLep+RYxh+Ca786JF/3cYt8GVEYBfY2FSldS8+xG2ThBRkTdSnwcS3Fqe?=
 =?us-ascii?Q?ztgA5ZiX8HytWelBSqoYSDFB54ynEBl5nc1eg8pf2SdsU2XYU41mwUvdfDpL?=
 =?us-ascii?Q?DImVtlhKaM7CD5gVJso2Kn97rPMI/i7+0g0zUArqaXAyXleCJ5MYQYIZMl4E?=
 =?us-ascii?Q?vh8Ouzvl5CgmnpGvVU6X+gNoX93k8bcylb9HDNKutbDf+J8jTvOJd9Kbzcc3?=
 =?us-ascii?Q?QunZKD+sLp+81frb/QbEu8y6minkyESaQBcl1YyojM1Wa6U3yYgg3xQ1eVUG?=
 =?us-ascii?Q?MctOGEaMHYlJ6IFA4Qo1r7wvsMieWx0YgGiysyQr/UrL4TJzK7fzRHduf570?=
 =?us-ascii?Q?E235X0DOERCpPHCQCstnALaamTXQ1+uzZNOtHy14ohBr1G0eyVWP0fl+/MGl?=
 =?us-ascii?Q?GN5T1IATshCdbMkfunKpbuIzZzI4hoYYRnzvaJgZG0wcZeNLy66Jnpli+wS9?=
 =?us-ascii?Q?HNimw7mNbA4xvVZVDndBTWuCnRlSmQlM7YEBB7C+g17ARxc58aFTm/chgp9S?=
 =?us-ascii?Q?XocHjRy8/TEEYVYZpal9HfmRnM+LuUzPB0EqC/2F3wliKjKd1hDe508zDh+y?=
 =?us-ascii?Q?GwxN2w4rsIxXrjTEdiLl7s4tAPrcl9YN66o7DGWUB7sfeInbObDJnR823fHG?=
 =?us-ascii?Q?kCWTp+aiPxGM/cSNeMoDSSfYEtZkd7OYOxTVyWaZz4v9CxN27wziNxFXGbun?=
 =?us-ascii?Q?0aHD7/tPdrw6aS00b6OvbVvGfrW6sgmMXhFKDFY2sIGna/DXWJ9s4SpJXDgp?=
 =?us-ascii?Q?AbyvbH1VYTXXEjrXhQ1P+b54hwXfmb9teKqKsvUo4LkeTCHPS5GfD6trq8Lp?=
 =?us-ascii?Q?VmLEXblHjXaNUjGrixD0ct7HxDsdFoe0fXYbETpCbQ1er77KMiGgrMJSWrjm?=
 =?us-ascii?Q?R+7PXp88CYZZErkjARdt15prP/44TqH4zOUTdmG6TrdzrVj5kh8fDZHqxlc2?=
 =?us-ascii?Q?ReSdgn2u7MAD5+jJHQgDend2d8X9AjLXhF7PhfVVHRv/fFJ5ytqYpXFekE9a?=
 =?us-ascii?Q?zVbUWjgcbpzcb6W9snwotY8FP8ueHXUHpHfT4llr9pcympDKrwpHpx/wlMDo?=
 =?us-ascii?Q?MCYkTlh6dLOGJ9nJwB1CZO/wSRpjqvWiwhizD/eF?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4173.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6c8eeed-ffbc-4fb6-8042-08db2643d37d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2023 17:28:15.5313 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pfyz/uvchciH12+yigU2LSSOyRiTv+AGYL9HpWXorcY1rsi5lghvjbhIfBCOf+Zhlph5bkWe94cRolQEegor4r2UCsZOuOAx4cFjIoIZvQs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6332
X-Proofpoint-GUID: RiqPdk7TX7EHoeOqlhNPfB2cLYPb2T54
X-Proofpoint-ORIG-GUID: RiqPdk7TX7EHoeOqlhNPfB2cLYPb2T54
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-16_10,2023-03-16_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303160135
Received-SPF: pass client-ip=205.220.178.238;
 envelope-from=prvs=24390c1229=guohuai.shi@windriver.com;
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
> Sent: Thursday, March 16, 2023 19:05
> To: Greg Kurz <groug@kaod.org>; qemu-devel@nongnu.org
> Cc: Meng, Bin <Bin.Meng@windriver.com>; Shi, Guohuai
> <Guohuai.Shi@windriver.com>
> Subject: Re: [PATCH v5 04/16] hw/9pfs: Implement Windows specific xxxdir(=
)
> APIs
>=20
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d
> know the content is safe.
>=20
> On Wednesday, March 15, 2023 8:05:34 PM CET Shi, Guohuai wrote:
> >
> > > -----Original Message-----
> > > From: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > Sent: Wednesday, March 15, 2023 00:06
> > > To: Greg Kurz <groug@kaod.org>; qemu-devel@nongnu.org
> > > Cc: Shi, Guohuai <Guohuai.Shi@windriver.com>; Meng, Bin
> > > <Bin.Meng@windriver.com>
> > > Subject: Re: [PATCH v5 04/16] hw/9pfs: Implement Windows specific
> > > xxxdir() APIs
> > >
> > > CAUTION: This email comes from a non Wind River email account!
> > > Do not click links or open attachments unless you recognize the
> > > sender and know the content is safe.
> > >
> > > On Monday, February 20, 2023 11:08:03 AM CET Bin Meng wrote:
> > > > From: Guohuai Shi <guohuai.shi@windriver.com>
> > > >
> > > > This commit implements Windows specific xxxdir() APIs for safety
> > > > directory access.
> > >
> > > That comment is seriously too short for this patch.
> > >
> > > 1. You should describe the behaviour implementation that you have
> > > chosen and why you have chosen it.
> > >
> > > 2. Like already said in the previous version of the patch, you
> > > should place a link to the discussion we had on this issue.
> > >
> > > > Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
> > > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > > ---
> > > >
> > > >  hw/9pfs/9p-util.h       |   6 +
> > > >  hw/9pfs/9p-util-win32.c | 443
> > > > ++++++++++++++++++++++++++++++++++++++++
> > > >  2 files changed, 449 insertions(+)
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
> > > > a99d579a06..e9408f3c45 100644
> > > > --- a/hw/9pfs/9p-util-win32.c
> > > > +++ b/hw/9pfs/9p-util-win32.c
> > > > @@ -37,6 +37,16 @@
> > > >   *    Windows does not support opendir, the directory fd is create=
d by
> > > >   *    CreateFile and convert to fd by _open_osfhandle(). Keep the =
fd
> open
> > > will
> > > >   *    lock and protect the directory (can not be modified or repla=
ced)
> > > > + *
> > > > + * 5. Neither Windows native APIs, nor MinGW provide a POSIX
> > > > + compatible
> > > API for
> > > > + *    acquiring directory entries in a safe way. Calling those API=
s
> > > (native
> > > > + *    _findfirst() and _findnext() or MinGW's readdir(), seekdir()=
 and
> > > > + *    telldir()) directly can lead to an inconsistent state if
> directory
> > > is
> > > > + *    modified in between, e.g. the same directory appearing more =
than
> > > once
> > > > + *    in output, or directories not appearing at all in output eve=
n
> though
> > > they
> > > > + *    were neither newly created nor deleted. POSIX does not defin=
e
> what
> > > happens
> > > > + *    with deleted or newly created directories in between, but it
> > > guarantees a
> > > > + *    consistent state.
> > > >   */
> > > >
> > > >  #include "qemu/osdep.h"
> > > > @@ -51,6 +61,25 @@
> > > >
> > > >  #define V9FS_MAGIC  0x53465039  /* string "9PFS" */
> > > >
> > > > +/*
> > > > + * MinGW and Windows does not provide a safe way to seek
> > > > +directory while other
> > > > + * thread is modifying the same directory.
> > > > + *
> > > > + * This structure is used to store sorted file id and ensure
> > > > +directory seek
> > > > + * consistency.
> > > > + */
> > > > +struct dir_win32 {
> > > > +    struct dirent dd_dir;
> > > > +    uint32_t offset;
> > > > +    uint32_t total_entries;
> > > > +    HANDLE hDir;
> > > > +    uint32_t dir_name_len;
> > > > +    uint64_t dot_id;
> > > > +    uint64_t dot_dot_id;
> > > > +    uint64_t *file_id_list;
> > > > +    char dd_name[1];
> > > > +};
> > > > +
> > > >  /*
> > > >   * win32_error_to_posix - convert Win32 error to POSIX error numbe=
r
> > > >   *
> > > > @@ -977,3 +1006,417 @@ int qemu_mknodat(int dirfd, const char
> > > > *filename,
> > > mode_t mode, dev_t dev)
> > > >      errno =3D ENOTSUP;
> > > >      return -1;
> > > >  }
> > > > +
> > > > +static int file_id_compare(const void *id_ptr1, const void
> > > > +*id_ptr2) {
> > > > +    uint64_t id[2];
> > > > +
> > > > +    id[0] =3D *(uint64_t *)id_ptr1;
> > > > +    id[1] =3D *(uint64_t *)id_ptr2;
> > > > +
> > > > +    if (id[0] > id[1]) {
> > > > +        return 1;
> > > > +    } else if (id[0] < id[1]) {
> > > > +        return -1;
> > > > +    } else {
> > > > +        return 0;
> > > > +    }
> > > > +}
> > > > +
> > > > +static int get_next_entry(struct dir_win32 *stream) {
> > > > +    HANDLE hDirEntry =3D INVALID_HANDLE_VALUE;
> > > > +    char *entry_name;
> > > > +    char *entry_start;
> > > > +    FILE_ID_DESCRIPTOR fid;
> > > > +    DWORD attribute;
> > > > +
> > > > +    if (stream->file_id_list[stream->offset] =3D=3D stream->dot_id=
) {
> > > > +        strcpy(stream->dd_dir.d_name, ".");
> > > > +        return 0;
> > > > +    }
> > > > +
> > > > +    if (stream->file_id_list[stream->offset] =3D=3D stream->dot_do=
t_id) {
> > > > +        strcpy(stream->dd_dir.d_name, "..");
> > > > +        return 0;
> > > > +    }
> > > > +
> > > > +    fid.dwSize =3D sizeof(fid);
> > > > +    fid.Type =3D FileIdType;
> > > > +
> > > > +    fid.FileId.QuadPart =3D stream->file_id_list[stream->offset];
> > > > +
> > > > +    hDirEntry =3D OpenFileById(stream->hDir, &fid, GENERIC_READ,
> > > > +                             FILE_SHARE_READ | FILE_SHARE_WRITE
> > > > +                             | FILE_SHARE_DELETE,
> > > > +                             NULL,
> > > > +                             FILE_FLAG_BACKUP_SEMANTICS
> > > > +                             | FILE_FLAG_OPEN_REPARSE_POINT);
> > >
> > > What's the purpose of FILE_FLAG_OPEN_REPARSE_POINT here? As it's
> > > apparently not obvious, please add a comment.
> > >
> >
> > If do not use this flag, and if file id is a symbolic link, then Window=
s
> will not symbolic link itself, but open the target file.
> > This flag is similar as O_NOFOLLOW flag.
>=20
> OK, got it, thanks! But please add a comment in code that describes this.
>=20
> > > > +
> > > > +    if (hDirEntry =3D=3D INVALID_HANDLE_VALUE) {
> > > > +        /*
> > > > +         * Not open it successfully, it may be deleted.
> > >
> > > Wrong English. "Open failed, it may have been deleted in the meantime=
.".
> > >
> > > > +         * Try next id.
> > > > +         */
> > > > +        return -1;
> > > > +    }
> > > > +
> > > > +    entry_name =3D get_full_path_win32(hDirEntry, NULL);
> > > > +
> > > > +    CloseHandle(hDirEntry);
> > > > +
> > > > +    if (entry_name =3D=3D NULL) {
> > > > +        return -1;
> > > > +    }
> > > > +
> > > > +    attribute =3D GetFileAttributes(entry_name);
> > > > +
> > > > +    /* symlink is not allowed */
> > > > +    if (attribute =3D=3D INVALID_FILE_ATTRIBUTES
> > > > +        || (attribute & FILE_ATTRIBUTE_REPARSE_POINT) !=3D 0) {
> > > > +        return -1;
> > >
> > > Wouldn't it make sense to call warn_report_once() here to let the
> > > user know that he has some symlinks that are never delivered to guest=
?
> >
> > OK, Got it.
> >
> > >
> > > > +    }
> > > > +
> > > > +    if (memcmp(entry_name, stream->dd_name, stream->dir_name_len)
> > > > + !=3D
> > > > + 0) {
> > >
> > > No, that's unsafe. You want to use something like strncmp() instead.
> > >
> > > > +        /*
> > > > +         * The full entry file name should be a part of parent
> > > > + directory
> > > name,
> > > > +         * except dot and dot_dot (is already handled).
> > > > +         * If not, this entry should not be returned.
> > > > +         */
> > > > +        return -1;
> > > > +    }
> > > > +
> > > > +    entry_start =3D entry_name + stream->dir_name_len;
> > >
> > > s/entry_start/entry_basename/ ?
> > >
> > > > +
> > > > +    /* skip slash */
> > > > +    while (*entry_start =3D=3D '\\') {
> > > > +        entry_start++;
> > > > +    }
> > > > +
> > > > +    if (strchr(entry_start, '\\') !=3D NULL) {
> > > > +        return -1;
> > > > +    }
> > > > +
> > > > +    if (strlen(entry_start) =3D=3D 0
> > > > +        || strlen(entry_start) + 1 > sizeof(stream->dd_dir.d_name)=
) {
> > > > +        return -1;
> > > > +    }
> > > > +    strcpy(stream->dd_dir.d_name, entry_start);
> > >
> > > g_path_get_basename() ? :)
> >
> > For above three comments:
> > This code is not good, should be fixed.
> > The code want to filter the following cases:
> > The parent directory path is not a part of entry's full path:
> > Parent: C:\123\456, entry: C:\123, C:\ Entry contains more than one
> > name components:
> > Parent: C:\123\456, entry: C:\123\456\789\abc Entry is zero length or
> > name buffer is too long
> >
> > I will refactor this part.
>=20
> In general: writing parsing code yourself is extremely error prone. That'=
s
> why it makes sense to use existing functions from glib, etc.
>=20
> > >
> > > > +
> > > > +    return 0;
> > > > +}
> > > > +
> > > > +/*
> > > > + * opendir_win32 - open a directory
> > > > + *
> > > > + * This function opens a directory and caches all directory entrie=
s.
> > >
> > > It just caches all file IDs, doesn't it?
> > >
> >
> > Will fix it
> >
> > > > + */
> > > > +DIR *opendir_win32(const char *full_file_name) {
> > > > +    HANDLE hDir =3D INVALID_HANDLE_VALUE;
> > > > +    HANDLE hDirEntry =3D INVALID_HANDLE_VALUE;
> > > > +    char *full_dir_entry =3D NULL;
> > > > +    DWORD attribute;
> > > > +    intptr_t dd_handle =3D -1;
> > > > +    struct _finddata_t dd_data;
> > > > +    uint64_t file_id;
> > > > +    uint64_t *file_id_list =3D NULL;
> > > > +    BY_HANDLE_FILE_INFORMATION FileInfo;
> > >
> > > FileInfo is the variable name, not a struct name, so no upper case
> > > for it please.
> >
> > Will fix it.
> > >
> > > > +    struct dir_win32 *stream =3D NULL;
> > > > +    int err =3D 0;
> > > > +    int find_status;
> > > > +    int sort_first_two_entry =3D 0;
> > > > +    uint32_t list_count =3D 16;
> > >
> > > Magic number 16?
> >
> > Will change it to a macro.
> > >
> > > > +    uint32_t index =3D 0;
> > > > +
> > > > +    /* open directory to prevent it being removed */
> > > > +
> > > > +    hDir =3D CreateFile(full_file_name, GENERIC_READ,
> > > > +                      FILE_SHARE_READ | FILE_SHARE_WRITE |
> > > FILE_SHARE_DELETE,
> > > > +                      NULL,
> > > > +                      OPEN_EXISTING,
> > > > +                      FILE_FLAG_BACKUP_SEMANTICS |
> > > FILE_FLAG_OPEN_REPARSE_POINT,
> > > > +                      NULL);
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
> > > > +    file_id_list =3D g_malloc0(sizeof(uint64_t) * list_count);
> > > > +
> > > > +    /*
> > > > +     * findfirst() needs suffix format name like "\dir1\dir2\*",
> > > > +     * allocate more buffer to store suffix.
> > > > +     */
> > > > +    stream =3D g_malloc0(sizeof(struct dir_win32) +
> > > > + strlen(full_file_name) + 3);
> > >
> > > Not that I would care much, but +2 would be correct here, as you
> > > declared the struct with one character already, so it is not a
> > > classic (zero size) flex
> > > array:
> > >
> > >   struct dir_win32 {
> > >     ...
> > >     char dd_name[1];
> > >   };
> > >
> > Will fix it.
> >
> > > > +
> > > > +    strcpy(stream->dd_name, full_file_name);
> > > > +    strcat(stream->dd_name, "\\*");
> > > > +
> > > > +    stream->hDir =3D hDir;
> > > > +    stream->dir_name_len =3D strlen(full_file_name);
> > > > +
> > > > +    dd_handle =3D _findfirst(stream->dd_name, &dd_data);
> > > > +
> > > > +    if (dd_handle =3D=3D -1) {
> > > > +        err =3D errno;
> > > > +        goto out;
> > > > +    }
> > > > +
> > > > +    /* read all entries to link list */
> > >
> > > "read all entries as a linked list"
> > >
> > > However there is no linked list here. It seems to be an array.
> >
> > Will fix it.
> > >
> > > > +    do {
> > > > +        full_dir_entry =3D get_full_path_win32(hDir, dd_data.name)=
;
> > > > +
> > > > +        if (full_dir_entry =3D=3D NULL) {
> > > > +            err =3D ENOMEM;
> > > > +            break;
> > > > +        }
> > > > +
> > > > +        /*
> > > > +         * Open every entry and get the file informations.
> > > > +         *
> > > > +         * Skip symbolic links during reading directory.
> > > > +         */
> > > > +        hDirEntry =3D CreateFile(full_dir_entry,
> > > > +                               GENERIC_READ,
> > > > +                               FILE_SHARE_READ | FILE_SHARE_WRITE
> > > > +                               | FILE_SHARE_DELETE,
> > > > +                               NULL,
> > > > +                               OPEN_EXISTING,
> > > > +                               FILE_FLAG_BACKUP_SEMANTICS
> > > > +                               | FILE_FLAG_OPEN_REPARSE_POINT,
> > > > + NULL);
> > > > +
> > > > +        if (hDirEntry !=3D INVALID_HANDLE_VALUE) {
> > > > +            if (GetFileInformationByHandle(hDirEntry,
> > > > +                                           &FileInfo) =3D=3D TRUE)=
 {
> > > > +                attribute =3D FileInfo.dwFileAttributes;
> > > > +
> > > > +                /* only save validate entries */
> > > > +                if ((attribute & FILE_ATTRIBUTE_REPARSE_POINT) =3D=
=3D 0) {
> > > > +                    if (index >=3D list_count) {
> > > > +                        list_count =3D list_count + 16;
> > >
> > > Magic number 16 again.
> > >
> > > > +                        file_id_list =3D g_realloc(file_id_list,
> > > > +                                                 sizeof(uint64_t)
> > > > +                                                 * list_count);
> > >
> > > OK, so here we are finally at the point where you chose the overall
> > > behaviour for this that we discussed before.
> > >
> > > So you are constantly appending 16 entry chunks to the end of the
> > > array, periodically reallocate the entire array, and potentially end
> > > up with one giant dense array with *all* file IDs of the directory.
> > >
> > > That's not really what I had in mind, as it still has the potential
> > > to easily crash QEMU if there are large directories on host.
> > > Theoretically a Windows directory might then consume up to 16 GB of
> > > RAM for looking up only one single directory.
> > >
> > > So is this the implementation that you said was very slow, or did
> > > you test a different one? Remember, my orgiginal idea (as starting
> > > point for Windows) was to only cache *one* file ID (the last being
> > > looked up). That's it. Not a list of file IDs.
> >
> > If only cache one file ID, that means for every read directory operatio=
n.
> > we need to look up whole directory to find out the next ID larger than =
last
> cached one.
> >
> > I provided some performance test in last patch:
> > Run test for read directory with 100, 1000, 10000 entries #1, For file
> > name cache solution, the time cost is: 2, 9, 44 (in ms).
> > #2, For file id cache solution, the time cost: 3, 438, 4338 (in ms). Th=
is
> is current solution.
> > #3, for cache one id solution, I just tested it: 4, 4788, more than
> > one minutes (in ms)
> >
> > I think it is not a good idea to cache one file id, it would be very
> > bad performance
>=20
> Yes, the performce would be lousy, but at least we would have a basis tha=
t
> just works^TM. Correct behaviour always comes before performance. And fro=
m
> there you could add additional patches on top to address performance
> improvements. Because the point is: your implementation is also suboptima=
l,
> and more importantly: prone to crashes like we discussed before.
>=20
> Regarding performance: for instance you are re-allocating an entire dense
> buffer on every 16 new entries. That will slow down things extremely. Ple=
ase
> use a container from glib, because these are handling resize operations m=
ore
> smoothly for you out of the box, i.e. typically by doubling the container
> capacity instead of re-allocating frequently with small chunks like you d=
id.
>=20
> However I am still not convinced that allocating a huge dense buffer with
> *all* file IDs of a directory makes sense.
>=20
> On the long-term it would make sense to do it like other implementations:
> store a snapshot of the directory temporarily on disk. That way it would =
not
> matter how huge the directory is. But that's a complex implementation, so=
 not
> something that I would do in this series already.
>=20
> On the short/mid term I think we could simply make a mix of your solution=
 and
> the one-ID solution that I suggested: keeping a maximum of e.g. 1k file I=
Ds
> in RAM. And once guest seeks past that boundary, loading the subsequent 1=
k
> entries, free-ing the previous 1k entries, and so on.
>=20

Please note that the performance data is tested in native OS, but not in QE=
MU.
It is even worse in QEMU.

I run Linux guest OS on Windows host, use "ls -l" command to list a directo=
ry with about 100 entries.
"ls -l" command need about 0.5 second to display one directory entry.

Caching only one node (file id, or file name, or others) will make 9pfs not=
 usable: listing 100 directory entries need 50 seconds in guest OS.

> > >
> > > > +                    }
> > > > +                    file_id =3D (uint64_t)FileInfo.nFileIndexLow
> > > > +                              +
> > > > + (((uint64_t)FileInfo.nFileIndexHigh)
> > > > + << 32);
> > > > +
> > > > +
> > > > +                    file_id_list[index] =3D file_id;
> > > > +
> > > > +                    if (strcmp(dd_data.name, ".") =3D=3D 0) {
> > > > +                        stream->dot_id =3D file_id_list[index];
> > > > +                        if (index !=3D 0) {
> > > > +                            sort_first_two_entry =3D 1;
> > > > +                        }
> > > > +                    } else if (strcmp(dd_data.name, "..") =3D=3D 0=
) {
> > > > +                        stream->dot_dot_id =3D file_id_list[index]=
;
> > > > +                        if (index !=3D 1) {
> > > > +                            sort_first_two_entry =3D 1;
> > > > +                        }
> > > > +                    }
> > > > +                    index++;
> > > > +                }
> > > > +            }
> > > > +            CloseHandle(hDirEntry);
> > > > +        }
> > > > +        g_free(full_dir_entry);
> > > > +        find_status =3D _findnext(dd_handle, &dd_data);
> > > > +    } while (find_status =3D=3D 0);
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
> > > > +    stream->file_id_list =3D file_id_list;
> > > > +
> > > > +    if (sort_first_two_entry =3D=3D 0) {
> > > > +        /*
> > > > +         * If the first two entry is "." and "..", then do not sor=
t
> them.
> > > > +         *
> > > > +         * If the guest OS always considers first two entries are
> > > > + "." and
> > > "..",
> > > > +         * sort the two entries may cause confused display in gues=
t
> OS.
> > > > +         */
> > > > +        qsort(&file_id_list[2], index - 2, sizeof(file_id),
> > > file_id_compare);
> > > > +    } else {
> > > > +        qsort(&file_id_list[0], index, sizeof(file_id),
> file_id_compare);
> > > > +    }
> > >
> > > Were there cases where you did not get "." and ".." ?
> >
> > NTFS always provides "." and "..".
> > I could add more checks here to fix this risk
>=20
> That's what I assumed. So you can probably just drop this code for
> simplicity.
>=20
> >
> > >
> > > > +
> > > > +out:
> > > > +    if (err !=3D 0) {
> > > > +        errno =3D err;
> > > > +        if (stream !=3D NULL) {
> > > > +            if (file_id_list !=3D NULL) {
> > > > +                g_free(file_id_list);
> > > > +            }
> > > > +            CloseHandle(hDir);
> > > > +            g_free(stream);
> > > > +            stream =3D NULL;
> > > > +        }
> > > > +    }
> > > > +
> > > > +    if (dd_handle !=3D -1) {
> > > > +        _findclose(dd_handle);
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
> > > > +
> > > > +    if (stream =3D=3D NULL) {
> > > > +        errno =3D EBADF;
> > > > +        return -1;
> > > > +    }
> > > > +
> > > > +    /* free all resources */
> > > > +    CloseHandle(stream->hDir);
> > > > +
> > > > +    g_free(stream->file_id_list);
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
> > > > +retry:
> > > > +
> > > > +    if (stream->offset >=3D stream->total_entries) {
> > > > +        /* reach to the end, return NULL without set errno */
> > > > +        return NULL;
> > > > +    }
> > > > +
> > > > +    if (get_next_entry(stream) !=3D 0) {
> > > > +        stream->offset++;
> > > > +        goto retry;
> > > > +    }
> > > > +
> > > > +    /* Windows does not provide inode number */
> > > > +    stream->dd_dir.d_ino =3D 0;
> > > > +    stream->dd_dir.d_reclen =3D 0;
> > > > +    stream->dd_dir.d_namlen =3D strlen(stream->dd_dir.d_name);
> > > > +
> > > > +    stream->offset++;
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
> > > > +    stream->offset =3D pos;
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


