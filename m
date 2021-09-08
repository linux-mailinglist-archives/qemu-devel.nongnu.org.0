Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BFC403AD3
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 15:40:09 +0200 (CEST)
Received: from localhost ([::1]:46142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNxo7-0002rN-OR
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 09:40:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.levon@nutanix.com>)
 id 1mNxm5-0000kd-Gf
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 09:38:01 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:56802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.levon@nutanix.com>)
 id 1mNxm3-0004T1-3x
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 09:38:01 -0400
Received: from pps.filterd (m0127844.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 188CpUTS030158;
 Wed, 8 Sep 2021 06:37:56 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=86oYwh0r792l5C04Za6TQ55rdu7ghUozPS/TIN0Fdlw=;
 b=gt63E6J4ub46BRbcZ/6MvXho0tpTH0Z6KT0igY+4VKaiyLPQuATZBAKvIEuQCPHctaLm
 H5s54NBP5dHDWlOExcKNy7m0WeRfsEZU3sdmVHOVkmxvGZNfNj4uk7fiurlRKUTyCEUk
 iZDLKfZHKXQRAy6QGXOUP0tdTiHxXg2tJZmSpxWkFMPV/B8UTiHEy+N3AaKVPJJy/crd
 5g4pAVXMGxmLHDrGOBj6IpKXWAWlXH1Wt+CFeUGotljxTGeBO0pjlmBcD691Q+Z3iAqG
 qZJAPlUndxMeKnr2g6OjxSNVhgf+lqMtTvufr47uR8caSwPrV9vi5gj/BM6xkSHpg4Co ng== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
 by mx0b-002c1b01.pphosted.com with ESMTP id 3axcuh9ya2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Sep 2021 06:37:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZdpHdZRbmFCKv+09jJeSNC67Qii5Gw7X+5uugqov+C2e2LGKFHY8urEZA4rI0a8MJM/IA5uTKD/ZTxyLRT8/6zqivne7PJtj8O6JdwSbmSfNF3CQWdkJFc0rDgnLovQEAjqqLj7FQk9qwsQ1TxHD0ZZs8kY5ih2CvFkEtdYdUKEysPO1bW4oUT0umsVgRdu1hmzB9odkmjG87fLIsbBsU10bYOKpyYFNksYt9PyoFOm9UMeksGDET319xH802D0VS3MaK/Vwn5eo1hXBpVByaR3vnSBT0wAPo7rhFE381UHYEZm6ls0m+/gzuIBAgl6y4aWjVEknt4V7tVC9uVbZtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=86oYwh0r792l5C04Za6TQ55rdu7ghUozPS/TIN0Fdlw=;
 b=UkkjrR5yBjdaOvXrjo/Uy3yfqC86PoFjU4ygi/ZBO5SsGCiqQ+e3FBls2kzVm6WqVQyOl0K2m0rqndQlq8vD9w9xUldBfK4GJJ2gqb5yIUiEppCtR9bCXUT+nwvQkCVJyl5iXkMur4kqCHlr1gCov+Hv5XbDqhDFKwcGm8YU0AbI2BDs19AmWNrI1nhYGvHzOOzonC4SIQ4ted/cGTf+kwWkDx9NZTZkUEyL6zUfdO4Ah4vLf0DbVUIdcCeMC/IzG6tNZnbFu/hfeIdlDhudQolBRjBKuifQP+05W5wuuWEUcdJvnTy005Vmbg7irePeuQuJJVvTdF/41NtHgnhlog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL0PR02MB4580.namprd02.prod.outlook.com (2603:10b6:208:40::27)
 by BL0PR02MB4883.namprd02.prod.outlook.com (2603:10b6:208:54::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Wed, 8 Sep
 2021 13:37:54 +0000
Received: from BL0PR02MB4580.namprd02.prod.outlook.com
 ([fe80::b9d9:2c4b:c85e:dbd0]) by BL0PR02MB4580.namprd02.prod.outlook.com
 ([fe80::b9d9:2c4b:c85e:dbd0%7]) with mapi id 15.20.4500.016; Wed, 8 Sep 2021
 13:37:54 +0000
From: John Levon <john.levon@nutanix.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH RFC server v2 05/11] vfio-user: run vfio-user context
Thread-Topic: [PATCH RFC server v2 05/11] vfio-user: run vfio-user context
Thread-Index: AQHXm2yIPjWEzOwcWUWSWCWzNjp1MquaK6sAgAAK7oA=
Date: Wed, 8 Sep 2021 13:37:53 +0000
Message-ID: <YTi8sYZkET5tffj/@movementarian.org>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <cover.1630084211.git.jag.raman@oracle.com>
 <3c043becf2b6e820f5392e0cadb465d5d9b9e6f8.1630084211.git.jag.raman@oracle.com>
 <YTizhs1m7EsAs9UG@stefanha-x1.localdomain>
In-Reply-To: <YTizhs1m7EsAs9UG@stefanha-x1.localdomain>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nutanix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d58028c6-1fa8-4e0f-81b5-08d972cddc72
x-ms-traffictypediagnostic: BL0PR02MB4883:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR02MB4883CA96DCCFF8324B9C1CB897D49@BL0PR02MB4883.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Hc3tDLjdiWrdTKhtak977BUZBfSfF3HeG19gZe86F00U1I6KPQML/a9awisPb+NDnMzarAPrOCZvruGJFkhRghFou6jIWP8yiK1mx50ZZAMHy3HBhH8ARTmmL8viUPoRESIpsobbp2zd/bjgEEPxeS67HzP9Z7xMzEOzcZm1ZfD1XSqrwJmP3iVmlb5z92EgoH+DK6dFQgW+Yw+lnbElXI6mYfV2D+APs7Bz3knV7X180e1v4n9KUrekX7qmw/TP5QoWs5gedHKa02KhYsD+gxYsYrUlEV3GyIzIkHCb1qsp99EkWP1HwaVp2eBdDMC9VcNF+MXwrBqe0qmn1wHu83D0RO1TT4zaQs/65/hP1/Fqbew2eWrschxeOLaYw1QjtadnRYnxz+seaiZdmNM0pu/hFsTcMfmLYiWZDtXPukCk7RBoeAgyzicKvgBvE76AKgnKE7jc9Rpxpy64aurvIXtzTohVfcJXuduuSJSCpr+GAJoIhVJins2zjyOf6hbgpexBckrvqane/eCSRxjb9TO0e/ejnnkpw6bOq/FUZ6Jo/YJJDxPojLne26gGQhq01QasnPTIlsC1Q9TdHtmQy7DV3FhLLeO4UELpL7AqVa8J00u9pDWbVwJ5vF5y7rAeZDzGZT+OyMClIrKtei91u5JN4+9DdFk5DVbxSVv5lUmfhAITRQSxZnATPIhoeQ3+UQlc+EzJcY2isxAUFehQRg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR02MB4580.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(366004)(376002)(39860400002)(346002)(136003)(107886003)(71200400001)(66476007)(2906002)(44832011)(8936002)(64756008)(6916009)(8676002)(86362001)(6486002)(186003)(66556008)(38100700002)(26005)(91956017)(7416002)(6506007)(83380400001)(38070700005)(5660300002)(76116006)(66446008)(9686003)(4326008)(36756003)(478600001)(54906003)(316002)(6512007)(122000001)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UiKvjuEP+Ht2yYk935qWOW07h7IAQqL9x4ZwtSGmwZQDKm57+sTtgLfxZYKU?=
 =?us-ascii?Q?uAoT5SHvbAZFy+hoLKze3qFUVINgAwAnW4f9/Cn3844ZsqvlObTP27NWMkRD?=
 =?us-ascii?Q?JyWad+gUCKj3bAT754iQ2l6HCwM/Rk63BGjUmr7RcVYUM35TlLlnmGYVfgQv?=
 =?us-ascii?Q?dLPWO/8i7hLg15uxXccnkS7W/NENkRpsl1Zo5QeWjIJG2jPb8LjG/UjP8F7R?=
 =?us-ascii?Q?oKys5YZYteViEvA59w7I4x5aa2MOK1wz2UEBNATQDu6Q8m4g0ExvXJ2qbqiG?=
 =?us-ascii?Q?aV122cJL3VnWasiqR1nZBi4JFKCXbXOPkSsTS+Y+yzhLbRg1vlP0Pc2rB/sw?=
 =?us-ascii?Q?KZUogXY9cD+x5agpPd819c2lIy7QKvQuRlak1VPyxGME5zDNZHRAiCyLWXKm?=
 =?us-ascii?Q?IebaEdrL3r7mWN1tC26TL8sMfrdWMuUzi/FOVsg7H8emLRcvsY+XtGqWA59b?=
 =?us-ascii?Q?uHfh44hCHiJygqsBZtXH3k5BV5Uu5S/YQJLOhYCwVO0DS4JXQ7JB8F/UKTo4?=
 =?us-ascii?Q?+ehIQpAtlv+qtQPXYnOuuL+z6WZyqpDrSfd7xaDvXRPG8mYnxt9ZJs8yRzE8?=
 =?us-ascii?Q?y1BdkaYH2aj0BivqhJ7a6NmaXEFDbu65wZ/ucaE3G/9zknXWS5xJjqC1YebE?=
 =?us-ascii?Q?0MPdwq5KAeJuJl4AyzGrSco30PVWYUZ5inGppQ6MKJrE5MCSNqE6/BbSkkxR?=
 =?us-ascii?Q?Im4BmXtMmKzYMbsKJGIejWdauKneOxwU9K5OzJe1yQuVexiHmd/hhuNUyK7l?=
 =?us-ascii?Q?DzjuyxFLHxheRtOBJaeBQWXicXFi+JwWIb3Ao4bzhpdVU7v+ODMjcC6QE2fA?=
 =?us-ascii?Q?i/ciL5dQ4dAsF4ujtyRmHQ5DchAuBEawDxBGjeakrxwTLdc3v97++mUnQvz8?=
 =?us-ascii?Q?0aq0yJddMfJm+Nj+vkw0QdDPJ5/0c8JmXmPd6mHTGOt0MYHdPMCUMgK211kr?=
 =?us-ascii?Q?Y/4RGhpGQMaqOdiWM6GOp3in4VE3Xn07DwdXdg7IXgZgLBIgAow67aDHpvVX?=
 =?us-ascii?Q?Ae3QigFyvp2L/O8f4+XtbW0q2DugqAP6hbN1s2Wmy/GV/OCe2JY8hfT9PEPb?=
 =?us-ascii?Q?G83+VagcummURtXOQBIE76Bt3YMt6KtpdPS8X2TBsuMWaVv67X3jHXhVVSzQ?=
 =?us-ascii?Q?S68zRfkSE4w4Wu1F2GYyl8WBhWEdfoubMv9+oi9uNEax6X+icv2UcOw41s+k?=
 =?us-ascii?Q?nGvM0Yn15p4gaILenTH3AFtjfMdHcUL30e1wIlgktzTm/xp8OSKEK8bXOt4U?=
 =?us-ascii?Q?yHuIwPLSZOU/5YadhSYDuaylIodRBlR50hzI6lOtjlTXJMRGZaX1zeghHmA6?=
 =?us-ascii?Q?XPFo5UWnWrQlNNsB+dZMG6yE?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <90DF5544F1B5264D8E287AFCB0264582@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR02MB4580.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d58028c6-1fa8-4e0f-81b5-08d972cddc72
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2021 13:37:53.9001 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z4EOcCt8h8sB/nZ7EVWrJuOvY5AoqEyVxBax5t1/GhjX8y9GCiAmx8aIvLbgGjelZBHC+9did15jc5/v9W8khA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4883
X-Proofpoint-GUID: b1BI6QdyuF2_UmUxrzbG808-OEVZBXDn
X-Proofpoint-ORIG-GUID: b1BI6QdyuF2_UmUxrzbG808-OEVZBXDn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-08_06,2021-09-07_02,2020-04-07_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=john.levon@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "elena.ufimtseva@oracle.com" <elena.ufimtseva@oracle.com>,
 "john.g.johnson@oracle.com" <john.g.johnson@oracle.com>,
 "thuth@redhat.com" <thuth@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>,
 "philmd@redhat.com" <philmd@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "marcandre.lureau@gmail.com" <marcandre.lureau@gmail.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 08, 2021 at 01:58:46PM +0100, Stefan Hajnoczi wrote:

> > +static void *vfu_object_attach_ctx(void *opaque)
> > +{
> > +    VfuObject *o =3D opaque;
> > +    int ret;
> > +
> > +retry_attach:
> > +    ret =3D vfu_attach_ctx(o->vfu_ctx);
> > +    if (ret < 0 && (errno =3D=3D EAGAIN || errno =3D=3D EWOULDBLOCK)) =
{
>=20
> Does this loop consume 100% CPU since this is non-blocking?

Looks like it. Instead after vfu_create_ctx, there should be a vfu_get_poll=
_fd()
to get the listen socket, then a qemu_set_fd_handler(vfu_object_attach_ctx)
to handle the attach when the listen socket is ready, modulo the below part=
.

> libvfio-user has non-blocking listen_fd but conn_fd is always blocking.

It is, but in vfu_run_ctx(), we poll on it:

```
790     if (vfu_ctx->flags & LIBVFIO_USER_FLAG_ATTACH_NB) {                =
         =20
791         sock_flags =3D MSG_DONTWAIT | MSG_WAITALL;                     =
           =20
792     }                                                                  =
         =20
793     return get_msg(hdr, sizeof(*hdr), fds, nr_fds, ts->conn_fd, sock_fl=
ags);    =20
```

> This means ATTACH_NB is not useful because vfu_attach_ctx() is actually
> blocking.

You're correct that vfu_attach_ctx is in fact partially blocking: after
accepting the connection, we call negotiate(), which can indeed block waiti=
ng if
the client hasn't sent anything.

> I think this means vfu_run_ctx() is also blocking in some places

Correct. There's a presumption that if a message is ready, we can read it a=
ll
without blocking, and equally that we can write to the socket without block=
ing.

The library docs are not at all clear on this point.

> and QEMU's event loop might hang :(
>=20
> Can you make libvfio-user non-blocking in order to solve these issues?

I presume you're concerned about the security aspect: a malicious client co=
uld
withhold a write, and hence hang the device server.

Problem is the libvfio-user API is synchronous: there's no way to return
half-way through a vfu_attach_ctx() (or a vfu_run_ctx() after we read the
header) then resume.

We'd have to have a whole separate API to do that, so a separate thread see=
ms a
better approach?

regards
john=

