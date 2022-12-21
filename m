Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 354596535D8
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 19:06:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p83RL-0001pL-K1; Wed, 21 Dec 2022 13:03:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=935479d2d1=guohuai.shi@windriver.com>)
 id 1p83Qt-0001lo-1Q
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:03:11 -0500
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=935479d2d1=guohuai.shi@windriver.com>)
 id 1p83Qq-0004U9-C2
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:03:10 -0500
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BLEmBOj012536; Wed, 21 Dec 2022 10:02:49 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=NFBkYqNS+PX6q79PHWlr8sgtiLKPrndSRJTo/8pDJEk=;
 b=GvG/WduBt4beQn4y3d0SO+YD4KI8FKRCssr5ELIZtpbxXWZZPvw/J30AVl5SNBnYQiFK
 jUlQJ94oVxh1jt2t4bcaZSoaOyc7FB7gUxe1NlAX+MyjXLBagd/DjXfx1XfQHcmSxtD6
 LACwkx3mVyOhnX2pQoH6PRglUbn8XMkH6beTWs7J+j1L85U3cHMU9b+ba83M7YiUCrEa
 YQerz4a3M61Pug+mW2UqD0YdhvNN+T1uKOEIMOIMsSS0deqJPSjs/B5mhu+5/RE+wF+A
 axWA3ykzg7Jltj73T0EKibaXd1djlQmoUKjQT+QWyeE3YTSPvyAtvSeKyD0hzEmjTrJH Fg== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mh9x8u9rj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Dec 2022 10:02:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jANWRIEYxMPuK0o04JEoSRwQjfKMEk5F7BvoBL06gBqTbMvh/SILNLJyBiN4gYSD7XrTvUDmHD755GaJ8lrkjDqtXt6HcNjD8u1Ri6t8xvldsoAJpHy8Ig+YleZ3l1e308cpYoMZGL8UGkZvcJwvgD1ML/a6uO/z36yqoyb0PhmZgHKW1etdtuMMJw8qclwWMVBqJJJyCChU4wAHm5HLENoHbeq+5lzfIIF7eloeJnlvU6iQmIzYt5Ms9iv2+U1ZIKhtr5mT4/1MUV+EcJkhFuqyGT3WLRA4iRpbtgMRutiQSva1BHO9yRDyW7OgXGNipQMPJ7DLJSpGY8+CBDB3Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NFBkYqNS+PX6q79PHWlr8sgtiLKPrndSRJTo/8pDJEk=;
 b=BgJerCpnYJMKSOMGqj65p3t3020N+XGz/nk8xMTyHczsBUIhKQuGVeMBxL5NADxSOtA2XNY8tdTWVAuSFANDFY7nDT3a6Ay7q2ESpRdKmhcw3FKTrCqo6C7uEcFm3CvRQDs2lIVX0LvFhCic+JsXMujsjg9tm+Idy/2P2og4j6yiCujKGxDlcj1HHMHL5jaHuecoXYeoASNmcIMmGy9ayrP+kDHWvu9e4z32JoovDJ9f61Zn56duAp44F2C/t/yNwi+2ujcQBC3YPNcOT5LurXNhRhkY2/NS8sIksHQftHang6oBkDQHMf5zu3nfqkEa3CrSCmNhgq+F9UjDTH3XOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MN2PR11MB4173.namprd11.prod.outlook.com (2603:10b6:208:137::20)
 by SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Wed, 21 Dec
 2022 18:02:44 +0000
Received: from MN2PR11MB4173.namprd11.prod.outlook.com
 ([fe80::152a:cd56:591c:e9ae]) by MN2PR11MB4173.namprd11.prod.outlook.com
 ([fe80::152a:cd56:591c:e9ae%6]) with mapi id 15.20.5924.016; Wed, 21 Dec 2022
 18:02:43 +0000
From: "Shi, Guohuai" <Guohuai.Shi@windriver.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "Meng, Bin" <Bin.Meng@windriver.com>
Subject: RE: [PATCH v3 07/17] hw/9pfs: Support getting current directory
 offset for Windows
Thread-Topic: [PATCH v3 07/17] hw/9pfs: Support getting current directory
 offset for Windows
Thread-Index: AQHZE5OW94REMdLh3EyKw2mvTOVpOK54b2EAgAAxR0A=
Date: Wed, 21 Dec 2022 18:02:43 +0000
Message-ID: <MN2PR11MB4173F332BAEA088CEA1C5629EFEB9@MN2PR11MB4173.namprd11.prod.outlook.com>
References: <20221219102022.2167736-1-bin.meng@windriver.com>
 <20221219102022.2167736-8-bin.meng@windriver.com> <1688271.CY4Nip6A2B@silver>
In-Reply-To: <1688271.CY4Nip6A2B@silver>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR11MB4173:EE_|SJ1PR11MB6129:EE_
x-ms-office365-filtering-correlation-id: d5dfa198-d6d2-46ac-e1d4-08dae37d8f2f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Oeyo5HzoMJjMDz/HB0jV8deKqjd8bQe3azigOoR8zI9ms1cp5weOAbJ+i5ZmbxGatoqm/YWKkXaIfDgITPTeYd/2HOITAXyXDXrO73TxCO89BBya+eYgaApQAnG6OT58/JG6z9eAdgibOWvD/wtYFccod3rQkpxprtwe+ygU9b24AXNhvEu5tVb9dyFgWYTSUybP7aXyXXTWSW7qAM4Rg8ftrdyWLfRd4nRy1YfJm76ZNmsuJKV+/ezUNqRdgxYFdiEptnETC3n75XUnoA7PSnSsjpgO7rL4JUGqqcvdbgDuNVk+uUZIUacivKyLbVi/zf6Oe+YhnrSMQkqlAwoLRw4Ha3bmUoLI0/NTOXqJCanO9mt83iAu2Mj5L8+wkERKeK1tlWX9vAErblfB0s06IdRTCS0WIToGL1oUTJWQ4Lq/tp23WRlbQevqdSXrsyMtnF6BZgIMc06eBEy4C+wG8kDs9qjPg1S1rs3x6YlB2yaZ638orgDoCXebt86GdAOdnnSyjX4JbZ2WoT7WKbjdoxF3HtNwk570msawdHC9wA3XIQO6Wc7kma8REag+zyIA69hif2BBzDPzCtO6x8wp08OTwnH1tYi6sL8S86+GpLz2ej3iTx0dzo3UNlfKx6CsaybXCiFMcOqr1IiHkMw1MmmVUJ/gHOnkXTAGWHSRvhWbfVqxL0tt08ChBvHsAIdNFFybnXcIMzAxHhsVk7A/mA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4173.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(396003)(346002)(366004)(39850400004)(376002)(451199015)(107886003)(86362001)(6506007)(7696005)(478600001)(66556008)(66946007)(66446008)(64756008)(76116006)(66476007)(186003)(9686003)(26005)(55016003)(316002)(110136005)(71200400001)(4326008)(38070700005)(38100700002)(8676002)(122000001)(41300700001)(83380400001)(2906002)(53546011)(8936002)(33656002)(52536014)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bUpzFojDx02UobNSPYtjkxj7VZgijvGMhJFd1jDOpPm71jYLJ9AzDTpz9sfM?=
 =?us-ascii?Q?6RiWp39gQeeew/rNZGCx9UkEkUEu2BryTOci42/B084/gOu4Y/iWzuGC3O4K?=
 =?us-ascii?Q?HKwERFCOTZHckAFkJFtgMUEOaHRWn3sr6Kg3yKqtV5lJTA+eai3+UmYfgCrw?=
 =?us-ascii?Q?KZW04bsbqxLtNnHQb9l1oaIfEC5v2FFx2kIBSid3xd3QYz7/v1FZ8m57gIRo?=
 =?us-ascii?Q?2tVSk4UKXWH6rKZPj5G3IrCFNGcmWGk8TCgveCRVJ9t2dPCIX0d3H6Bbvrte?=
 =?us-ascii?Q?20drBgDkAkcEtoJ8vyeHXLx7XYrhPY0xa/e3YyvNqQpTLXulb2l/2phEwN8P?=
 =?us-ascii?Q?W2YqfIY+HoR+velIEIgYleXWsQfV3x2jHREcOAHi6btNV5S7xbU203DwZ6PG?=
 =?us-ascii?Q?pxffWdBCqEStjmPG5zdXvwsFc65ICa5hC+/RHYpZJIBpbPw/feSN5u7a2Edi?=
 =?us-ascii?Q?B+WvSTMTStTpBgpkC+Xe7r1VVWCD+9driRPeqBEiG/VcEIoM3F9o/GPVZi9F?=
 =?us-ascii?Q?8xr7pW+tlEvCTtbdZxA9SkQTjInc+2dBZSe0Nayt5bJ45EwWK55PR2wM5nyK?=
 =?us-ascii?Q?eeqKq217IpnvcvO36HTXCa+ZpaNslhpjHTLDP5wf8Rb4GgOPp27l1sq2TdG0?=
 =?us-ascii?Q?mFwmYeWX7lpXBX9C2C7RaDhVO2V9LMei22M8/WHH67ZrXd8IgzicyirQjJaI?=
 =?us-ascii?Q?5FkodEjjV1dKGxmjTUUfrLs0Mh/hThu14YGXkT40KtFS+ZEa0ZxNyRgYvBSj?=
 =?us-ascii?Q?z6tDyajoOx5qd0k/HM5rPjcVjEoBw4LLd6L++XqSDGkGbQcq7/nK4RINDFXn?=
 =?us-ascii?Q?Ciw/eF91rCNe0mTxbi5WvAD4DTUaWBgv+y0kdKcYw16q7XpMXw5t8Ecti1Od?=
 =?us-ascii?Q?8DRkPUjGgN11GfHgnzyVJksJ8nX+az1yYLgrJG2lj3e0NDSuukLwhiMC+voq?=
 =?us-ascii?Q?s5ub6k8RWF1U3E69qdZcLsZsSKTEVv5y6ePbgJVHTW44f9d2psFU6VHqJVTx?=
 =?us-ascii?Q?vg+ylxlqeTfSP4P2F7sIdLxErgRLlHuvuxiVtfJBDC+jzMRjASmuInrduCm9?=
 =?us-ascii?Q?iWyzCy4TDn6j2jGkWkjbPD/Ah/2Ci5yxKQVWqhTPUkYh59FsqoyPAEmUQ4nE?=
 =?us-ascii?Q?7bQLN/9S/XDeKTixN+YwriurVvX4QzUEBn3TJLRZoaGvA/JzE6rqHpshFp63?=
 =?us-ascii?Q?GumASkEu9AEeyaO/640qEyS2mqCXzTfTGmMXngKotkGzBvyEkfhqBfLwRaf7?=
 =?us-ascii?Q?QgvhQZuE4oRYyXAMo7TWJxv0YG4n4fFdzcANcpls5Xg2U7/jV/TiFer3d57c?=
 =?us-ascii?Q?u0cDYQfSU0TBs7ZHzBUByCJFOg65omJ12BW2mpXAQ5tR5hSq6uUl2fsCgnm4?=
 =?us-ascii?Q?GgflVnDKx3nSZthY0ZQ0/g4OqShoM77DjVTE7Z5p28zlC6CjaN1n7V4Po1Sf?=
 =?us-ascii?Q?VhkKa6UAyE84dsIEH6oF2xzIMog+SxC8WXp59jmJBaMuXPKawP8/8jARUwMJ?=
 =?us-ascii?Q?q1Hin9OGYWr3gaTs/bPxUrdYG94kMy012VOdP2z2SIJIYhQ9RLkc4129qBrU?=
 =?us-ascii?Q?6q2uZvRDhlckYvjILfmEIdfQWD1gFoNVJUwa8QoUmBHUCMxAWYuuiP4gdvss?=
 =?us-ascii?Q?rA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4173.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5dfa198-d6d2-46ac-e1d4-08dae37d8f2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2022 18:02:43.8574 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: af5Znn69xuqoySPcqaoREQPA/UFtRB1fO49OVqPUKeKxoSQuhywYFh91j/WbB1c5A6lalFB+y58mA3Pjt4Dx6uZq3dGSEv0yZZjrbzua+To=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6129
X-Proofpoint-GUID: Y9mm5F-JZ_M2EgMQwMntmsPS902P8vXL
X-Proofpoint-ORIG-GUID: Y9mm5F-JZ_M2EgMQwMntmsPS902P8vXL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-21_10,2022-12-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 priorityscore=1501 clxscore=1011 mlxscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212210152
Received-SPF: pass client-ip=205.220.166.238;
 envelope-from=prvs=935479d2d1=guohuai.shi@windriver.com;
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
> Sent: Wednesday, December 21, 2022 22:48
> To: Greg Kurz <groug@kaod.org>; qemu-devel@nongnu.org
> Cc: Shi, Guohuai <Guohuai.Shi@windriver.com>; Meng, Bin
> <Bin.Meng@windriver.com>
> Subject: Re: [PATCH v3 07/17] hw/9pfs: Support getting current directory
> offset for Windows
>=20
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d
> know the content is safe.
>=20
> On Monday, December 19, 2022 11:20:11 AM CET Bin Meng wrote:
> > From: Guohuai Shi <guohuai.shi@windriver.com>
> >
> > On Windows 'struct dirent' does not have current directory offset.
> > Update qemu_dirent_off() to support Windows.
> >
> > While we are here, add a build time check to error out if a new host
> > does not implement this helper.
> >
> > Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > ---
> >
> > (no changes since v1)
> >
> >  hw/9pfs/9p-util.h       | 11 ++++++++---
> >  hw/9pfs/9p-util-win32.c |  7 +++++++
> >  hw/9pfs/9p.c            |  4 ++--
> >  hw/9pfs/codir.c         |  2 +-
> >  4 files changed, 18 insertions(+), 6 deletions(-)
> >
> > diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h index
> > 90420a7578..e395936b30 100644
> > --- a/hw/9pfs/9p-util.h
> > +++ b/hw/9pfs/9p-util.h
> > @@ -127,6 +127,7 @@ int unlinkat_win32(int dirfd, const char
> > *pathname, int flags);  int statfs_win32(const char *root_path, struct
> > statfs *stbuf);  int openat_dir(int dirfd, const char *name);  int
> > openat_file(int dirfd, const char *name, int flags, mode_t mode);
> > +off_t qemu_dirent_off_win32(void *s, void *fs);
> >  #endif
> >
> >  static inline void close_preserve_errno(int fd) @@ -200,12 +201,16 @@
> > ssize_t fremovexattrat_nofollow(int dirfd, const char *filename,
> >   * so ensure it is manually injected earlier and call here when
> >   * needed.
> >   */
> > -static inline off_t qemu_dirent_off(struct dirent *dent)
> > +static inline off_t qemu_dirent_off(struct dirent *dent, void *s,
> > +void *fs)
> >  {
>=20
> Not sure why you chose void* here.

It is "V9fsState *" here, but 9p-util.h may be included by some other sourc=
e file which is not have definition of "V9fsState".
So change it to "void *" to prevent unnecessary type declarations.

>=20
> > -#ifdef CONFIG_DARWIN
> > +#if defined(CONFIG_DARWIN)
> >      return dent->d_seekoff;
> > -#else
> > +#elif defined(CONFIG_LINUX)
> >      return dent->d_off;
> > +#elif defined(CONFIG_WIN32)
> > +    return qemu_dirent_off_win32(s, fs); #else #error Missing
> > +qemu_dirent_off() implementation for this host system
> >  #endif
> >  }
> >
> > diff --git a/hw/9pfs/9p-util-win32.c b/hw/9pfs/9p-util-win32.c index
> > 7a270a7bd5..3592e057ce 100644
> > --- a/hw/9pfs/9p-util-win32.c
> > +++ b/hw/9pfs/9p-util-win32.c
> > @@ -929,3 +929,10 @@ int qemu_mknodat(int dirfd, const char *filename,
> mode_t mode, dev_t dev)
> >      errno =3D ENOTSUP;
> >      return -1;
> >  }
> > +
> > +off_t qemu_dirent_off_win32(void *s, void *fs) {
> > +    V9fsState *v9fs =3D s;
> > +
> > +    return v9fs->ops->telldir(&v9fs->ctx, (V9fsFidOpenState *)fs); }
>=20
> That's a bit tricky. So far (i.e. for Linux host, macOS host) we are stor=
ing
> the directory offset directly to the dirent struct. We are not using
> telldir() as the stream might have mutated in the meantime, hence calling
> telldir() might return a value that does no longer correlate to dirent in
> question.
>=20
> Hence my idea was to use the same hack for Windows as we did for macOS, w=
here
> we simply misuse a dirent field known to be not used, on macOS that's
> d_seekoff which we are misusing for that purpose.
>=20
> Looking at the mingw dirent.h header though, there is not much we can cho=
ose
> from. d_reclen is not used, but too short, d_ino is not used by mingw, bu=
t
> currently we actually read this field in server common code to assemble a
> file ID for guest. I mean it is always zero on Windows, so we could still
> misuse it, but we would need to inject more hacks there. :/

If you check seekdir and telldir() implement in MinGW,=20
you can see that MinGW (and Windows) does not have a safety way to seek/tel=
l directory offset.
Because Windows POSIX and native API does not provide a way to seek directo=
ry.
Windows native API only allow to read directory forward, but not backward.
So even we store the d_seekoff to some places, the directory may still be m=
odified.

And Windows file system actually has inode number, MinGW does not introduce=
 it to MinGW API.
So I think it is not good way to use d_ino.

Thanks
Guohuai

>=20
> > diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c index 072cf67956..be247eeb30
> > 100644
> > --- a/hw/9pfs/9p.c
> > +++ b/hw/9pfs/9p.c
> > @@ -2336,7 +2336,7 @@ static int coroutine_fn
> v9fs_do_readdir_with_stat(V9fsPDU *pdu,
> >          count +=3D len;
> >          v9fs_stat_free(&v9stat);
> >          v9fs_path_free(&path);
> > -        saved_dir_pos =3D qemu_dirent_off(dent);
> > +        saved_dir_pos =3D qemu_dirent_off(dent, pdu->s, &fidp->fs);
> >      }
> >
> >      v9fs_readdir_unlock(&fidp->fs.dir);
> > @@ -2537,7 +2537,7 @@ static int coroutine_fn v9fs_do_readdir(V9fsPDU *=
pdu,
> V9fsFidState *fidp,
> >              qid.version =3D 0;
> >          }
> >
> > -        off =3D qemu_dirent_off(dent);
> > +        off =3D qemu_dirent_off(dent, pdu->s, &fidp->fs);
> >          v9fs_string_init(&name);
> >          v9fs_string_sprintf(&name, "%s", dent->d_name);
> >
> > diff --git a/hw/9pfs/codir.c b/hw/9pfs/codir.c index
> > 93ba44fb75..d40515a607 100644
> > --- a/hw/9pfs/codir.c
> > +++ b/hw/9pfs/codir.c
> > @@ -168,7 +168,7 @@ static int do_readdir_many(V9fsPDU *pdu, V9fsFidSta=
te
> *fidp,
> >          }
> >
> >          size +=3D len;
> > -        saved_dir_pos =3D qemu_dirent_off(dent);
> > +        saved_dir_pos =3D qemu_dirent_off(dent, s, &fidp->fs);
> >      }
> >
> >      /* restore (last) saved position */
> >
>=20
>=20


