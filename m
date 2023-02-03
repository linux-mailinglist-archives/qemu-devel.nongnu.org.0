Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 962F76899DE
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 14:37:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNwDt-0005B0-4X; Fri, 03 Feb 2023 08:35:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1398d6e02b=guohuai.shi@windriver.com>)
 id 1pNwD7-0005AI-GZ
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 08:34:42 -0500
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1398d6e02b=guohuai.shi@windriver.com>)
 id 1pNwD4-0003di-5S
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 08:34:36 -0500
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 313CsVpO026972; Fri, 3 Feb 2023 13:34:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=/IKsCRJk0FN+HnwZ8KlVST99ItT1JvTSnQUqfchaCUs=;
 b=m4nHLyagxiGd21U63ZBlnrDrw6wJ83D73zOQn7Gttpw7hwIagsda3TamszPU2k3o2atp
 Ba2XYMyBQHV3GmAIiW/F+uMh/s+QGUGQspJZnV6acTAnEsAN6IAKKPNVKt2chYthoYhb
 Z83ftVW+SkXsYDJRlduiSTI7Q/gIf0vrE3pi2rRZkDAchLWsESlMpWpkKNgTUvNwvoMZ
 bigFIGbDx38hStCrlP3/qbUJIyrBsqzE1uDvQRFLaKyjQQQ4+qWqfhppGhmD82RajlLX
 9T36rVSuWbsZ1uzH+r0VkkTMeNrU87UVdDNKRIwX47AYFhTaM1b8p4yoeHvOCHkYAiBQ Gg== 
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2046.outbound.protection.outlook.com [104.47.57.46])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nfn33t96b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Feb 2023 13:34:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jCeyhMRd5TIyLjAkbEe06ddX6dIE16+q7jYtW/HEXfnE74m649CMmt7xWoShygWRIFqa001l5q8+NRvTM7I6lpL5v1R4017/9pDkQX40gp3VRD2+Sjh21LLngRSfGdN0ryaiDX8yD9xdWXK62BjCHcy13qLNYh7yk/jEWiEJc9RCBlb0PyH5vIaqE5oeRlVBQbPgNr3/goM4dsoXGBn2Rt+XwXOiELIp3QUXAj+NC2UU7eIbi+HqB8272+q/CNURNmZyEEbOd+M6RGN1ztH7bfjU7pZRQTOPLU522QDuCNz5nDw3ZMvpmmf7anjqM0isnL2y49CdXJXferm9fDOCsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/IKsCRJk0FN+HnwZ8KlVST99ItT1JvTSnQUqfchaCUs=;
 b=i2d9RJbGFE1vNIECf6gBNhenBEMoly/0XbeYSLblrKIsQYH8udRaWQiG1B7wZxl0+QAq60Hz7XssK6gLD38htjhM9OxGt9eYei3+U4LwR4L9GsEjiFPRJbuE0B4SeDAT44VDejQlOKiaUBVPfFYZKXPLfjb1cQaxgx3LmJvDANq1xDBlm0oh2bR/fHRRqoIBfdZ57VsWjBYW+bF+MUI0MSIb0Kgxkji0tFbihqO0Ksab68bRANP5aCeXnmyt9fNWMJbIJ+aZvZ+Yj1HWNd5LqQWBlR0QqEpdaTfh8MnpIJFsvIcDkyaeeueqWYliPvlbCMLBm8hsexyxDhcVXqFkFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MN2PR11MB4173.namprd11.prod.outlook.com (2603:10b6:208:137::20)
 by DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.27; Fri, 3 Feb
 2023 13:34:14 +0000
Received: from MN2PR11MB4173.namprd11.prod.outlook.com
 ([fe80::2d69:6276:f527:9fb4]) by MN2PR11MB4173.namprd11.prod.outlook.com
 ([fe80::2d69:6276:f527:9fb4%6]) with mapi id 15.20.6064.027; Fri, 3 Feb 2023
 13:34:13 +0000
From: "Shi, Guohuai" <Guohuai.Shi@windriver.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "Meng, Bin" <Bin.Meng@windriver.com>, =?iso-8859-1?Q?Marc-Andr=E9_Lureau?=
 <marcandre.lureau@redhat.com>, =?iso-8859-1?Q?Daniel_P=2E_Berrang=E9?=
 <berrange@redhat.com>
Subject: RE: [PATCH v4 04/16] hw/9pfs: Implement Windows specific xxxdir() APIs
Thread-Topic: [PATCH v4 04/16] hw/9pfs: Implement Windows specific xxxdir()
 APIs
Thread-Index: AQHZNJCQ5QDQDl+c2UWDW8VIOF7gh669K9gAgAAOB2A=
Date: Fri, 3 Feb 2023 13:34:13 +0000
Message-ID: <MN2PR11MB417343F1C20D3DD9680461E6EFD79@MN2PR11MB4173.namprd11.prod.outlook.com>
References: <20230130095202.2773186-1-bin.meng@windriver.com>
 <20230130095202.2773186-5-bin.meng@windriver.com> <2770789.QfI4yIDJDK@silver>
In-Reply-To: <2770789.QfI4yIDJDK@silver>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR11MB4173:EE_|DM4PR11MB6360:EE_
x-ms-office365-filtering-correlation-id: 69333b0d-8017-4b05-1e63-08db05eb56f5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: twjSXclvb2lp4V+f8k7DxgW/vr3tZkPQiloXDUQMD+nU1+7WTgsR+pAbZo75C7nPNBKu8IdF2HXxhheal3eYAPzf8ixhgyVXa0lOGivY+QiaM9vZt3QiO6kQoxuPuZw6joc5NduV8uwGOuYLZuMVJ5DSewPO125wGABr5S4PYwsf9JLMNN7tCyWo14f8JA9l54QUYpBFQLPOQ14OtCpdQPfAos3KZRW6HEptyMLM/lYGJ/tEzqfY5n49iSH/lyKdG5JlEvtPfPXFlSK675eVUMsXm/KWzDuDQRixVKjSz1ev6mY5SOodeFy1lk/BmB3gQu/+rOND+28yoykvGnVDClSxrOI8L88A6PjkHqZShswRSbyoqjBLNBMcozkHlfQP9OjnDA5Sff+AKeXUnUovnThuN4y/ui/TRrXMhX3twBuoXpfYIHNlXT0PtdXYOjZakX2w9N5bObzQZZZPqDHhn2Zj4WoSslsRpz7VBb0ku9Ch7DMb4rMYCWTwobUSC+N/CoHbjDAqf6yBb+3rDoZ2GxZzuPNuDWC3VC62AMNXvBHUVaMWwFt0d37hrw088Lcm3vSuo7C5x4nSGDWMczA7+Ll2HpL0TOH8t//hiQ4nOQ4TfNVk7owE++hnskhaLE8QmTK8FXeh4Jcz4sOwah3im1ZiqhOw+O9N67rXvZXgmvV7JM8IXV5bDaWSCklbh37eqInldHTbuybixQIJL/EVGGjKp06OyrFqnGalNSwHl8SfOe/0gj9TbaGz8kME7rzf+dlc7bMBtUXuVtLg7gM1hw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4173.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(366004)(376002)(136003)(396003)(39850400004)(451199018)(8676002)(41300700001)(4326008)(83380400001)(66446008)(66476007)(66946007)(64756008)(66556008)(76116006)(6506007)(52536014)(8936002)(5660300002)(9686003)(186003)(30864003)(26005)(122000001)(55016003)(110136005)(33656002)(2906002)(54906003)(478600001)(53546011)(71200400001)(86362001)(316002)(966005)(38070700005)(7696005)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?KwY+SvRCT15z7zXBDr8bpnZNiyK7U0IOUKvzkShr0UisrzACfrS0DRnF2+?=
 =?iso-8859-1?Q?sYGxCfIetqWKmONWpIl1LlMsNG1x6cQ+0x/xrkM2FASfNk5I5SfKb5aJPt?=
 =?iso-8859-1?Q?F3FGhx672zAeYFk6rRmtaHh9YXuuJWN0ro8CmKkWDcqdeNt8L9D79TJkje?=
 =?iso-8859-1?Q?s9sXGhY7HdXhTi/e3IZKpuqk23+dTgpsW5Dg8Xwsd07+6yETNiPr5ntFIg?=
 =?iso-8859-1?Q?fklXkt/L8ipoKzH3y51XAZhTaSLStXRCFrXl6WKwkL8AnQnte4ngpJWqEP?=
 =?iso-8859-1?Q?v15AboL/OYV38UmEEh/iOKdipV19ZFA+Gfcm2wt4eJnUZigJHOYhXGf+FP?=
 =?iso-8859-1?Q?ltjXo1ZTaEgStRtdiqDhEtn3NCppQg4q02/3pT1ILO8RzbRvpVeHTdgX5R?=
 =?iso-8859-1?Q?1imscETV3x10okjPjkUrPoJsJwEDZ77YPNEPjI/NI0fR/zVXMwCHzqm0xG?=
 =?iso-8859-1?Q?E0ivufzfa0PTH1JCzBKeafnFrEweY/+VYXRyTTl7yrbRscEVLwQUBnF94i?=
 =?iso-8859-1?Q?6jDILNa8RKxFRXTfjFN10+tjmAVP3e+tjRtcbZiWUchEcEzrIVTRXVQPJu?=
 =?iso-8859-1?Q?pYGN3sSNLf/q7/0HX5AV+a+3gfTBaN0c8Dek2o/p/xlFmtB3Z7dWwUDqFB?=
 =?iso-8859-1?Q?7HI73YQ1jSlN1C4yqswcZOyqBLQ0P8Zwk4nA90fO/xPRh8D7gr2nRAYAdB?=
 =?iso-8859-1?Q?MNK+r4VW9e2fo5Hf4yGoAigTaTGhU/e5kTTECy6kAFUwQohUhBRRYN3HTI?=
 =?iso-8859-1?Q?DsbFfdSWspD0tPiIKYgsovLf6B9MYLRoNmqttm4iSmOWU2H4oVqaJ6fenr?=
 =?iso-8859-1?Q?saxlW0OHiIFr3GlNzfCylNp5jrTDsTtnbcgu7SQLOYDCLC96FV7tt9JOAh?=
 =?iso-8859-1?Q?UAN/ROiVk2fdmHtGNgZdlbfVRoYMXyRo/DlO72UYpO73hr/11IYdcMTWrj?=
 =?iso-8859-1?Q?HzizU7xpluIK2XDTiaYjnclcluMO9GUfVCOKbkbCD4gWvreLGXf4kbVpmL?=
 =?iso-8859-1?Q?fjbpaUK1dJcHtKmFUYX9rAA0+lxppnaeVXBl9pmd/B4z4nsdqbCoQ+3MSk?=
 =?iso-8859-1?Q?0mR1PbuLg+KjbH2mSux8wYPl7MTLOS81uB3r0X687A6l2n0BsyqkbMlXRz?=
 =?iso-8859-1?Q?xtjU3sE773WV7GlfXJgAKZ1FEFL/7xzKz1XbyP5mnZZnXva/VTZagsq1Cm?=
 =?iso-8859-1?Q?2ZKVBZPHTM8UkXhfbEQsE1wqMSHKaSgaY+LKZ91/SyvaL21e0WQGNRQQCR?=
 =?iso-8859-1?Q?UPQyHPGQMnB7DOAig5Kw1AAxxlBW7sjH6cPTngJlFxUickulSXCPTGc51u?=
 =?iso-8859-1?Q?/kMktYw86dfjsha6+5UnWjxP7ab7tj+uWu/fE8CGJ0ruSdkSp3uOJn29JC?=
 =?iso-8859-1?Q?LVN3khQmTx4Iq4p8vmVBUvFSv6ZPIr97zVV5V2CdQXUYKqujdnX/ADOqi6?=
 =?iso-8859-1?Q?6uX985qNSIer6Nq5K0IbXKkPGGQ3H8bFC2Ee18QbQJtGsKqsc6Gzo20QJb?=
 =?iso-8859-1?Q?bYv7ZNCDE78UdVm8y/Cdvi7ClpnNBjrWVHmxCpajqo1HKMQQoayfcbb3bT?=
 =?iso-8859-1?Q?GG1I88QRKua+LUdADWNxakDFJqw0Zl/C+SNDY/+F37cfPaf/suDJ895q1d?=
 =?iso-8859-1?Q?eX6ZqA8FZlhbWc+ul3O1wukCk0n0C9W7yD5SGqbXzv4Rzxqqqf3BCcdA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4173.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69333b0d-8017-4b05-1e63-08db05eb56f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2023 13:34:13.6946 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ke70wcirN7uptuRvyqi1WqDfr1bKt0z+/mCWsecjIuqEEyfFPvLDDaicC5+ejymv8IeLtZOGdRqG7fNP3Rq5fFzaaY2svK4UWUY2wvJBGjg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6360
X-Proofpoint-GUID: H--ZT6hZSSY2TkoQRllSFVkHdEgBXqst
X-Proofpoint-ORIG-GUID: H--ZT6hZSSY2TkoQRllSFVkHdEgBXqst
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-03_13,2023-02-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 impostorscore=0 mlxscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302030125
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
> Sent: Friday, February 3, 2023 20:25
> To: Greg Kurz <groug@kaod.org>; qemu-devel@nongnu.org
> Cc: Shi, Guohuai <Guohuai.Shi@windriver.com>; Meng, Bin
> <Bin.Meng@windriver.com>; Marc-Andr=E9 Lureau <marcandre.lureau@redhat.co=
m>;
> Daniel P. Berrang=E9 <berrange@redhat.com>
> Subject: Re: [PATCH v4 04/16] hw/9pfs: Implement Windows specific xxxdir(=
)
> APIs
>=20
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d
> know the content is safe.
>=20
> On Monday, January 30, 2023 10:51:50 AM CET Bin Meng wrote:
> > From: Guohuai Shi <guohuai.shi@windriver.com>
> >
> > This commit implements Windows specific xxxdir() APIs for safety
> > directory access.
> >
>=20
> This issue deserves a link to either the previous discussion
>=20
> Link: https://lore.kernel.org/qemu-devel/2830993.GtbaR8S6b6@silver/
>=20
> and/or a link to this continuation of the discussion here, as it's not a
> trivial issue, with pros and cons been discussed for the individual, poss=
ible
> solutions.
>=20
> > Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > ---
> >
> >  hw/9pfs/9p-util.h       |   6 +
> >  hw/9pfs/9p-util-win32.c | 296
> > ++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 302 insertions(+)
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
> > a99d579a06..5503199300 100644
> > --- a/hw/9pfs/9p-util-win32.c
> > +++ b/hw/9pfs/9p-util-win32.c
> > @@ -37,6 +37,13 @@
> >   *    Windows does not support opendir, the directory fd is created by
> >   *    CreateFile and convert to fd by _open_osfhandle(). Keep the fd o=
pen
> will
> >   *    lock and protect the directory (can not be modified or replaced)
> > + *
> > + * 5. Windows and MinGW does not provide safety directory accessing
> functions.
> > + *    readdir(), seekdir() and telldir() may get or set wrong value
> because
> > + *    directory entry data is not protected.
>=20
> I would rephrase that sentence, as it doesn't cover the root problem
> adequately. Maybe something like this:
>=20
> 5. Neither Windows native APIs, nor MinGW provide a POSIX compatible API =
for
> acquiring directory entries in a safe way. Calling those APIs (native
> _findfirst() and _findnext() or MinGW's readdir(), seekdir() and telldir(=
))
> directly can lead to an inconsistent state if directory is modified in
> between, e.g. the same directory appearing more than once in output, or
> directories not appearing at all in output even though they were neither
> newly created nor deleted. POSIX does not define what happens with delete=
d or
> newly created directories in between, but it guarantees a consistent stat=
e.
>=20
> > + *
> > + *    This file re-write POSIX directory accessing functions and cache=
 all
> > + *    directory entries during opening.
> >   */
> >
> >  #include "qemu/osdep.h"
> > @@ -51,6 +58,27 @@
> >
> >  #define V9FS_MAGIC  0x53465039  /* string "9PFS" */
> >
> > +/*
> > + * MinGW and Windows does not provide safety way to seek directory
> > +while other
> > + * thread is modifying same directory.
> > + *
> > + * The two structures are used to cache all directory entries when ope=
ning
> it.
> > + * Cached entries are always returned for read or seek.
> > + */
> > +struct dir_win32_entry {
> > +    QSLIST_ENTRY(dir_win32_entry) node;
> > +    struct _finddata_t dd_data;
> > +};
> > +
> > +struct dir_win32 {
> > +    struct dirent dd_dir;
> > +    uint32_t offset;
> > +    uint32_t total_entries;
> > +    QSLIST_HEAD(, dir_win32_entry) head;
> > +    struct dir_win32_entry *current;
> > +    char dd_name[1];
> > +};
> > +
> >  /*
> >   * win32_error_to_posix - convert Win32 error to POSIX error number
> >   *
> > @@ -977,3 +1005,271 @@ int qemu_mknodat(int dirfd, const char *filename=
,
> mode_t mode, dev_t dev)
> >      errno =3D ENOTSUP;
> >      return -1;
> >  }
> > +
> > +/*
> > + * opendir_win32 - open a directory
> > + *
> > + * This function opens a directory and caches all directory entries.
> > + */
> > +DIR *opendir_win32(const char *full_file_name) {
> > +    HANDLE hDir =3D INVALID_HANDLE_VALUE;
> > +    DWORD attribute;
> > +    intptr_t dd_handle =3D -1;
> > +    struct _finddata_t dd_data;
> > +
> > +    struct dir_win32 *stream =3D NULL;
> > +    struct dir_win32_entry *dir_entry;
> > +    struct dir_win32_entry *prev;
> > +    struct dir_win32_entry *next;
> > +
> > +    int err =3D 0;
> > +    int find_status;
> > +    uint32_t index;
> > +
> > +    /* open directory to prevent it being removed */
> > +
> > +    hDir =3D CreateFile(full_file_name, GENERIC_READ,
> > +                      FILE_SHARE_READ | FILE_SHARE_WRITE |
> FILE_SHARE_DELETE,
> > +                      NULL,
> > +                      OPEN_EXISTING, FILE_FLAG_BACKUP_SEMANTICS,
> > + NULL);
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
> > +    /*
> > +     * findfirst() need suffix format name like "\dir1\dir2\*", alloca=
te
> more
> > +     * buffer to store suffix.
> > +     */
> > +    stream =3D g_malloc0(sizeof(struct dir_win32) + strlen(full_file_n=
ame) +
> 3);
> > +    QSLIST_INIT(&stream->head);
> > +
> > +    strcpy(stream->dd_name, full_file_name);
> > +    strcat(stream->dd_name, "\\*");
> > +
> > +    dd_handle =3D _findfirst(stream->dd_name, &dd_data);
> > +
> > +    if (dd_handle =3D=3D -1) {
> > +        err =3D errno;
> > +        goto out;
> > +    }
> > +
> > +    index =3D 0;
> > +
> > +    /* read all entries to link list */
> > +    do {
> > +        dir_entry =3D g_malloc0(sizeof(struct dir_win32_entry));
> > +        memcpy(&dir_entry->dd_data, &dd_data, sizeof(dd_data));
> > +        if (index =3D=3D 0) {
> > +            QSLIST_INSERT_HEAD(&stream->head, dir_entry, node);
> > +        } else {
> > +            QSLIST_INSERT_AFTER(prev, dir_entry, node);
> > +        }
> > +
> > +        prev =3D dir_entry;
> > +        find_status =3D _findnext(dd_handle, &dd_data);
> > +
> > +        index++;
> > +    } while (find_status =3D=3D 0);
>=20
> So you decided to go for the solution that caches all entries of a direct=
ory
> in RAM.
>=20
> So don't you think my last suggested solution that would call native
> _findfirst() and _findnext() directly, but without any chaching and inste=
ad
> picking the relevent entry simply by inode number, might be a better
> candidate as a starting point for landing Windows support? Link to that
> previous
> suggestion:
>=20
> https://lore.kernel.org/qemu-devel/2468168.SvRIHAoRfs@silver/
>=20

I did a quick test for caching data without name entry, but it failed for r=
eading + deleting directory on Windows host (like "rm -rf" for a directory)=
.
The root cause is: Windows's directory entry is not cached.
If there is 100 files in a directory:

File1
File2
...
File100

When "rm -rf" is working:

It read first 10 entries, and remove them. 9pfs may seek and re-seek to off=
set 10 to read next 10 entries.
But Windows and MinGW does not provide rewinddir.
If we using findfirst() and findnext to seek to offset 10, then we will not=
 get File11 but get File 21 (because we skipped 10 entries by seekdir()).

If we removed some entries in directory, inode number is useless because we=
 can not find it again.


Thanks
Guohuai


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
> > +    stream->current =3D QSLIST_FIRST(&stream->head);
> > +
> > +out:
> > +    if (err !=3D 0) {
> > +        errno =3D err;
> > +        /* free whole list */
> > +        if (stream !=3D NULL) {
> > +            QSLIST_FOREACH_SAFE(dir_entry, &stream->head, node, next) =
{
> > +                QSLIST_REMOVE(&stream->head, dir_entry, dir_win32_entr=
y,
> node);
> > +                g_free(dir_entry);
> > +            }
> > +            g_free(stream);
> > +            stream =3D NULL;
> > +        }
> > +    }
> > +
> > +    /* after cached all entries, this handle is useless */
> > +    if (dd_handle !=3D -1) {
> > +        _findclose(dd_handle);
> > +    }
> > +
> > +    if (hDir !=3D INVALID_HANDLE_VALUE) {
> > +        CloseHandle(hDir);
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
> > +    struct dir_win32_entry *dir_entry;
> > +    struct dir_win32_entry *next;
> > +
> > +    if (stream =3D=3D NULL) {
> > +        errno =3D EBADF;
> > +        return -1;
> > +    }
> > +
> > +    /* free all resources */
> > +
> > +    QSLIST_FOREACH_SAFE(dir_entry, &stream->head, node, next) {
> > +        QSLIST_REMOVE(&stream->head, dir_entry, dir_win32_entry, node)=
;
> > +        g_free(dir_entry);
> > +    }
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
> > +    if (stream->offset >=3D stream->total_entries) {
> > +        /* reach to the end, return NULL without set errno */
> > +        return NULL;
> > +    }
> > +
> > +    memcpy(stream->dd_dir.d_name,
> > +           stream->current->dd_data.name,
> > +           sizeof(stream->dd_dir.d_name));
> > +
> > +    /* Windows does not provide inode number */
> > +    stream->dd_dir.d_ino =3D 0;
> > +    stream->dd_dir.d_reclen =3D 0;
> > +    stream->dd_dir.d_namlen =3D strlen(stream->dd_dir.d_name);
> > +
> > +    stream->offset++;
> > +    stream->current =3D QSLIST_NEXT(stream->current, node);
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
> > +    stream->current =3D QSLIST_FIRST(&stream->head);
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
> > +    uint32_t index;
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
> > +    /* seek position from list head */
> > +
> > +    stream->current =3D QSLIST_FIRST(&stream->head);
> > +
> > +    for (index =3D 0; index < (uint32_t)pos; index++) {
> > +        stream->current =3D QSLIST_NEXT(stream->current, node);
> > +    }
> > +    stream->offset =3D index;
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


