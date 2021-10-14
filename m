Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5375142D1DC
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 07:31:03 +0200 (CEST)
Received: from localhost ([::1]:47600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1matKX-0006wq-Rj
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 01:31:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1matJ1-0006I7-Vg
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 01:29:28 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:9940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1matIy-0004ym-Uk
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 01:29:27 -0400
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19DNxMrB010332; 
 Wed, 13 Oct 2021 22:29:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=H/UAtrA1vnx5kASbtF1pEfwVUhe992zOsRhJELoqE7A=;
 b=DR1ZW3IB5t7vg/JgfIioiszSi12YeAAPGJa6O/+33/qoG4hieIx2xv6ZfunRMkM5bOuX
 c7rSqfzhQT6hMNOjsT43nBxWD+8gonsglWv8gYX+aymwgb8JdW6NquWH75V9sEyGFUF3
 xkIzhghqJMHcpJcRE1lB4frtlr2s9mTwq4lRDtgpQtXwac9z0xisUVvgD4Y5OkMpmFKa
 S1Oi8RUC551MPpqTaIaLnCtRK0DXBZE6mCKabeFfWtylkbj9tSy6BYoSZfKviOHMHSPX
 +Vzl7JnnX28KF4KFUeGJM47cuw042p2LnLKGzqBZD02DXU/abv043OeXeq/QWX2Eio2C Bw== 
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2043.outbound.protection.outlook.com [104.47.73.43])
 by mx0a-002c1b01.pphosted.com with ESMTP id 3bp8968h9y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Oct 2021 22:29:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K8CZVjYrw3LEkDRK2lAMD1g8tCrGNlbE4P4kdCRFDY4m96DMmtc0eQU/EXlbr3syp/9+V436nG65ISpk86Eqxgo5k2QQwFfYGGnnWthyVC2EKpA+o199E3JlKOqMRDihFs4Zqb5L2YWd/++vwroAuDjnVrGvFWHWnPPClZrG5F0Zfd8KjOtfgrlpphmSBV2W+1OKB3sdUfNm/50mOm4qzKEGPLDz25smZZB/cT8sdBfCpenZzG/prPnzwkpf1l3bbniPvs6w6UwuVxU3Z+ngriNyPmG3HaDXlJENyJDLYQysiO3Df7Teth9Xxnfwhe9YdAZnBbRNgW61UmV64Mi01g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H/UAtrA1vnx5kASbtF1pEfwVUhe992zOsRhJELoqE7A=;
 b=XcsfRbFpl7nLLItJbsGQJgZr6iPcYVLAHk0LYgagqmjUg0r/TOVK4/MDIXDeL7p2gfEZfvMOHD5KzbgCKDAl0XDLvmPP02mvuH9Dh3OrEroIn2ddRLALv4ahtnb2GbRDoQ9z9mMYW4j+SR2NQdWFr1Lnf62Qftzwt5Rda4Hhak0InThZPcDvkRlo5zT6IBS5EOTEV1I/w+JJ4J23K6NYpQGk8lX6sBCbw5KMfTEtTOHcZzkYeXg3QtHj4Zcvn6xqgxz0clsmjyW2UfpQhwT13cZ9c4chLdJJ1mUnzeQJttkTdR3mOPmhWZ+DcG5rGmjqr2Fo6oMjtGniYOGfa8OF/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by BL0PR02MB5460.namprd02.prod.outlook.com (2603:10b6:208:83::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Thu, 14 Oct
 2021 05:29:19 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::804:50eb:bd2:eb3c]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::804:50eb:bd2:eb3c%7]) with mapi id 15.20.4608.016; Thu, 14 Oct 2021
 05:29:19 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1] libvhost-user: fix VHOST_USER_REM_MEM_REG not closing
 the fd
Thread-Topic: [PATCH v1] libvhost-user: fix VHOST_USER_REM_MEM_REG not closing
 the fd
Thread-Index: AQHXv5h+sI2TRXPscUaomCe3odWO1avQr72AgAAA1gCAAUkaAA==
Date: Thu, 14 Oct 2021 05:29:19 +0000
Message-ID: <20211014052918.GB21284@raphael-debian-dev>
References: <20211012183832.62603-1-david@redhat.com>
 <YWaraVenjaIZXHCc@stefanha-x1.localdomain>
 <76ec743d-afb5-dea5-6c54-2180d176ca1a@redhat.com>
In-Reply-To: <76ec743d-afb5-dea5-6c54-2180d176ca1a@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nutanix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 483d3842-5eee-42ca-2336-08d98ed3928c
x-ms-traffictypediagnostic: BL0PR02MB5460:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR02MB5460A1CE739B967F82AE4956EAB89@BL0PR02MB5460.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:1775;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: L5NElIaCwZZw3aaDZd7xBVxTw5JyHjRcoS3931lmqsJyLXWV4l+aRPpEz3L+2ctr7SgoLrDyLzcwHJClT7nVgPNOWyz0wEPxWcCF/P3EzGPW8dYIDzgTmQW07Eia7niZdFWM3fudNi165PHE4SN2XJO9L1iTv7XVKj2OZM4791IkmZ5biqZRS8fSiHmBnvVHFyLCl5Hp8ExbNxTl6nnW1ITWZR9KPqjXOe4gt8d5PvSD1GxitEUV+UUiq05lXZfdRoNbkleQq31Te10J9Aosj4L/YRqMXBP9Wlb1NOV4b/gTml/OVOnzQ2dn+v4zRZ7/Zg1ixaFET1DEqdzcaU4Z4iyoPppCMQqgj7aaInvQbfMn4EwyGTeF9/ocTV0Z8KM+RIMMMHjZ4H9RQ1z9SqO8eQHeEdTnoW1nF+aITTpfWNib0hjwysXYZL9qV/QS5F55PEriINcw72McxEWKlFZHJhKA/g9e/++rKgR8uSjbiRd2iKxW44l3pmIeeRYptFuUNb4rhvSai/JhGzIqsGNGrWrMq8JHkuDEy+zlw9SiZ/5kuY0vWvWSlmUTGpddSvlc9fIOyLeGfGLsI+O8coRsY99ZWJ6N3YEf0YW8AqDeoeh396ydswSL8DGRJcTLPqAlqUXXbu1Nt4qsZr8qGh1rjXXJ70i9PxDN0HtLQihs1IwCE5vANTiD1h3CisUMqpQ3u/eH0jdajHVHvCd9JAQCew==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(366004)(6512007)(71200400001)(66476007)(66946007)(66556008)(38070700005)(76116006)(91956017)(4326008)(316002)(122000001)(9686003)(1076003)(66446008)(54906003)(64756008)(53546011)(8676002)(5660300002)(6916009)(508600001)(186003)(83380400001)(33656002)(8936002)(6506007)(6486002)(44832011)(33716001)(26005)(38100700002)(2906002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?p9sFWXZF4fFwhvhFu6evMlmH6znO2YoQ9rwTg3s35ReMhe+xkk9zAzJnw9?=
 =?iso-8859-1?Q?GTBX6LwEiHL/5Nh5u0gti8KULblxsjxNSv51lP2UUxT0bHvIIygcvh2Cpt?=
 =?iso-8859-1?Q?5rUK0PPCRJop6V9EV3PTpvWHlhwNTkfy7bm0gv6K4sDFK0WfGg6K3yC8iu?=
 =?iso-8859-1?Q?zL7keDNBhIpimaT1zsiRwqL8U5ihL2uFgH1d31i88qqYFMgEGpiLl29zmx?=
 =?iso-8859-1?Q?u2LwS0Gx+QGquvgClXfPBqm1UH00FBBRP9XrLI6TICta0UzbMhEyRG7wNa?=
 =?iso-8859-1?Q?ElqbQQLNraNHxGBuxMHIhya4apMvDsKz2sm6huKOdp3hbGMmjSLDz+QCW7?=
 =?iso-8859-1?Q?vTugr8B1wc3XxiSfx7ucAkHz0GYKZzWBdxNKVh6hK6lGn6hCBKavAaZL0I?=
 =?iso-8859-1?Q?2gFt4sudczcMyhechcD0VG8S1ACD0WmTIlcGMkZCVbvptI/ybmPQYWtacS?=
 =?iso-8859-1?Q?FdDwMMCnXaWG3ub/gFozduYMiGtotVd9M+GpZG3waojRj+cYGXjJY1/PEs?=
 =?iso-8859-1?Q?S6R24dKLJfkUaf8r+rsGSGaoS2GntrkJL+639yWW5ZY9wNFb/Ux6mcr68O?=
 =?iso-8859-1?Q?RVnX1N8kgPuhaYVb11yLpWp/clsZtX0we7CgSC/gfwR4USNrRMb+RoLuYQ?=
 =?iso-8859-1?Q?8QTQYWwGu8h1x7NI1EFf0pdEgk1qDtBQwdrQNr3sJswkBAvyL5RDaxdrMx?=
 =?iso-8859-1?Q?Mmnfu78RYuxzV31zNEuqi5fOzdGEdp1jolLV9NxZyqQ0UWRW+YD89FUHgM?=
 =?iso-8859-1?Q?5TkESpB9clQ2hnkGMoDk2lyK/EGTR/QAaYtnwfXYQrTn0wqZqNXJY/CL++?=
 =?iso-8859-1?Q?QpxFVuIAOCiZZGx3sBLmd8qozDZ68ZBM5KPd8oCshGvV0VU1EfMTk13DjX?=
 =?iso-8859-1?Q?Pt2nShasm+AWl5f7a39reB795pncjR7UzZzoUj7Sx2ThQxZJWvoGcXvDZe?=
 =?iso-8859-1?Q?YqSqqNFgzJcCQDVk6N/+Dc+fW6AaP6f3GuO4BzaRTizLG6ztr0ey6oPi3W?=
 =?iso-8859-1?Q?ugM7ANN5nHYGnuJU2bRzQDt4wMJmYf7iiqc92fUZHogQrOlfj1x1N1IPIu?=
 =?iso-8859-1?Q?LJ0bMT15nZEioM54dZhkb2IEd+RTbM+QBIXG7gdUksdmH/0mEoCkQFAjzK?=
 =?iso-8859-1?Q?eStHdC22Oxn/SJ01XchsqDqSbRvobcd/1f8QEEGWjcwlTCqeD8OZaTy7E1?=
 =?iso-8859-1?Q?LhTHU3EGj5RdvuF+rJyCBmxy3GwSB5iAqk1dPjC3gNW3yhVC+8vbfQptk0?=
 =?iso-8859-1?Q?+SzexOa9e7JjsBtaYo/DkAU3jAwPApJuvOEQtPGOkmbuhAqytCiuPTMm73?=
 =?iso-8859-1?Q?rO8aGYsNqXRmvXSFsYeLyikVqJgC6Dh4jVsal+H/L2VXwPCpjFii+vXMED?=
 =?iso-8859-1?Q?OWDA++cEKN?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <A0F8183D652284448B9DCE897C96ACCC@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 483d3842-5eee-42ca-2336-08d98ed3928c
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2021 05:29:19.6670 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OqeC3ik70znDwbPiiqGXZ3Uiu5dfhEudNC1GUcj7SW+L30w2ow66Fxdwm2y21c+RT48JjJ0G3WIN/I4ORYCiuodiZT9ihFl0tyMPdpFHJSM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB5460
X-Proofpoint-ORIG-GUID: HAFceUSaCFpZqx-v1_MIipLyvPBYtta_
X-Proofpoint-GUID: HAFceUSaCFpZqx-v1_MIipLyvPBYtta_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-14_01,2021-10-13_02,2020-04-07_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Coiby Xu <coiby.xu@gmail.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 13, 2021 at 11:51:24AM +0200, David Hildenbrand wrote:
> On 13.10.21 11:48, Stefan Hajnoczi wrote:
> > On Tue, Oct 12, 2021 at 08:38:32PM +0200, David Hildenbrand wrote:
> > > We end up not closing the file descriptor, resulting in leaking one
> > > file descriptor for each VHOST_USER_REM_MEM_REG message.
> > >=20
> > > Fixes: 875b9fd97b34 ("Support individual region unmap in libvhost-use=
r")
> > > Cc: Michael S. Tsirkin <mst@redhat.com>
> > > Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>
> > > Cc: "Marc-Andr=E9 Lureau" <marcandre.lureau@redhat.com>
> > > Cc: Stefan Hajnoczi <stefanha@redhat.com>
> > > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > > Cc: Coiby Xu <coiby.xu@gmail.com>
> > > Signed-off-by: David Hildenbrand <david@redhat.com>
> > > ---
> > >   subprojects/libvhost-user/libvhost-user.c | 2 ++
> > >   1 file changed, 2 insertions(+)
> > >=20
> > > diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/=
libvhost-user/libvhost-user.c
> > > index bf09693255..bb5c3b3280 100644
> > > --- a/subprojects/libvhost-user/libvhost-user.c
> > > +++ b/subprojects/libvhost-user/libvhost-user.c
> > > @@ -839,6 +839,8 @@ vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
> > >           vu_panic(dev, "Specified region not found\n");
> > >       }
> > > +    close(vmsg->fds[0]);
> >=20
> > Does anything check that exactly 1 fd was received? For example,
> > vu_set_log_fd_exec() does:
> >=20
> >    if (vmsg->fd_num !=3D 1) {
> >        vu_panic(dev, "Invalid log_fd message");
> >        return false;
> >    }
> >=20
> > I think that's necessary both to make vhost-user master development
> > easier and because fds[] is not initialized to -1.

Ack - will add that.

>=20
> Similarly, vu_add_mem_reg() assumes exactly one was sent AFAIKS.

Ack

>=20
> If we panic, do we still have to call vmsg_close_fds() ?
>=20

I think so. What else will close the FDs?

AFAICT a vu_panic does not imply that the overall process has to die if tha=
t's
what you mean. What if one process is exposing multiple devices and only on=
e of
them panics?

> --=20
> Thanks,
>=20
> David / dhildenb
> =

