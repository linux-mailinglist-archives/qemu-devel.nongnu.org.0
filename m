Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 872E9462482
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 23:18:44 +0100 (CET)
Received: from localhost ([::1]:33548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mroyx-0003hJ-4N
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 17:18:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1mrovk-0001kn-1I; Mon, 29 Nov 2021 17:15:26 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:1846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1mrovh-0002n6-0x; Mon, 29 Nov 2021 17:15:22 -0500
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1ATJlPg6014803;
 Mon, 29 Nov 2021 14:15:16 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=rhQpxDbZmTLt48tNWSprgCWbo/ft2qMLrtS1xg8aJd0=;
 b=JCNcO3J/5T/Usiu4L+XY4DL8v7UwYViIBdwjWxHlFqr0cyMy9RJaovn5nKOK1sePLBNW
 chqNVMOaJA/+1XvEhrCMwZNu9sz30UWjffq58+X639b9Ph2hpTjBGmZxhLyiPlr35oKs
 XAbKM+yOzs2KGSaAcPvanE9WY3DqYRDWe8Y2e9rSmA7jHaATWGHxBuPTebl7+bY9hR01
 39nIpU4wlm5lJhiRbLdso57edmU41z0T4mbyGxSafZLGz/zki4lHUWtDazfcaub5hyHJ
 0aXay6KCSJXiV/LY8Y7sa2F6m5fJ1oPpUis45CvuMHy+H5AP+gnXVeAJTFbcLUpOo3aO cg== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3cmppx9xfj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 14:15:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lxSGxyS9HSvoz8Y91az+XTrnoxM/PhTjZmkwZ+w6EtK+sdRwvxw29we7t7oMsm9WqLBkV5lPf0bRxlW0hyF/01Kv4pDJRnofv1+yxIuWybHpPyCaXu0K3fILguWbU7lXcQCYoqjv/wKFnbndi3sE5jL6lp+wyp0nBWkumN3Ycu92kMR0fFJ0OUa96OlXHCxHaZ7gb28NwFvOv14bvukkV8FzLdY++JnAmCfIhNM6LgIahsY1vu57xMFHB89XFbfBpN5x+/9hoOBH7OalTzhrDEzcYqemxP/H4oOlH5r2LIO9cmSb1J74K7A2K+r6mstyVNXtgn1P1/0aT8CC5fKbkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rhQpxDbZmTLt48tNWSprgCWbo/ft2qMLrtS1xg8aJd0=;
 b=emM8ur+9Yd7qbDffRzlk6q6I/koknl3IBi5x45KrtaCnARs9cQzwYme8R5NhgAXpvrBhQ3ga/6iAkbLogvj2oAfBdFZYiPgAMfq78+akhIg4sFIHjP06cs2Lv8A1DEFc9xI75bD1rf4HPLw0Gxa2ux/WrUFq7QTkD3pRHY68/d6W7S8/gFaadHhKQuTpAkmQiDCK9vwrXN2a6XT4L4FaAPBF6gWLmnKIEmas4JniS07kOyCADHC6DkhcfVIDPISLobn661aOrMeySd/BFvtoje56GXrNAdaA33DcRSdpcdsQmsHYfZvp9Z2jQSyMwn1RMaAZZ5OJsA9m2NVG0o+S9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by BL0PR02MB4417.namprd02.prod.outlook.com (2603:10b6:208:45::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20; Mon, 29 Nov
 2021 22:15:12 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::25f1:c1cf:5f90:35af]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::25f1:c1cf:5f90:35af%7]) with mapi id 15.20.4713.027; Mon, 29 Nov 2021
 22:15:12 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Roman Kagan <rvkagan@yandex-team.ru>, Kevin Wolf <kwolf@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-block@nongnu.org"
 <qemu-block@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>, Hanna Reitz
 <hreitz@redhat.com>, "yc-core@yandex-team.ru" <yc-core@yandex-team.ru>,
 =?iso-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 01/10] vhost-user-blk: reconnect on any error during
 realize
Thread-Topic: [PATCH 01/10] vhost-user-blk: reconnect on any error during
 realize
Thread-Index: AQHX1xGQdhZ+wK2bK0CvUd5YwJAwxqv+m6cAgADm8wCAAEK/gIAAjAwAgBrdmgA=
Date: Mon, 29 Nov 2021 22:15:12 +0000
Message-ID: <20211129221508.GB5722@raphael-debian-dev>
References: <20211111153354.18807-1-rvkagan@yandex-team.ru>
 <20211111153354.18807-2-rvkagan@yandex-team.ru> <YY1YXrCPgt+Fcb2+@redhat.com>
 <YY4aGok6e8Z6BRQu@rvkaganb.lan> <YY5SF0uPkoEvX9qM@redhat.com>
 <YY7Hkl0uftx8TPZS@rvkaganb.lan>
In-Reply-To: <YY7Hkl0uftx8TPZS@rvkaganb.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dd325aaf-a32b-405d-d5c5-08d9b385b6b8
x-ms-traffictypediagnostic: BL0PR02MB4417:
x-microsoft-antispam-prvs: <BL0PR02MB441713D7B39A436DF9AF658CEA669@BL0PR02MB4417.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LnpZZPGwLZixePT3EdkGuARn40kF0Wl6VD309IXPMP05oyqyz0l3Y5TYihxg4W1QIm026a4vlx0iwyIqAI8v7eHP1wQMb74pCVGQ/HYeEs5ElG+xE2ASojZAx8guhoWgTGNBd5yoTEIWNPhQnJNRihZB0gEyW0T6DUuCx9rkqJe67lT6cesoY6QTgUqoolUevFr/H1yljbMaKYoJWWpdqQEWjm92MEZxCnHn40fD0msOemGyzUhynx+AenSRAR92XpidIX0qrgPN7qcKZn88qoth9QnIFe4QEVEcM22GvIP68R0FnLLsjyXvVhmgU0vLDq/fT3GZWYF/YeEuwUi/x++AikgDOGi73ZIxikkZH+n7FB03O0S3QI7yEet4b3hkEszj1DG5mH1VtmGm9oKAhGFkN+D9JSmzCeT2DLPNL5q7IXUumDskTaweL+HARXMYZSHCKiOqzdQzFbfZOGdc6nEYSsnHjbExPc25EZ1VEek2t2vvrwagn4S5uHmAaX74kl7sYqFgG1mFUsEw6ny5bpXxx6i+dAmYKfKg9+pUfGxrsbIi+UhtTHZTVddkOait9lFK7f2/lMhZe71fjxfumoRmW/ZYZo28gx4iBSfugsO37ujqvN5waJO1HKim6PX7pQjbdbaNv9cAGfypl9JUoe8XE9wzW4wk2HIQMDzAMO+mlsifu+mj/sTwYjPYGlGb3dLApJvLbi6XUSFIZ8NQ6w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(366004)(33716001)(122000001)(86362001)(4744005)(508600001)(110136005)(5660300002)(64756008)(66446008)(66556008)(66476007)(91956017)(1076003)(76116006)(66946007)(9686003)(6512007)(8936002)(186003)(38100700002)(2906002)(6486002)(71200400001)(26005)(44832011)(33656002)(6506007)(8676002)(316002)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?XrY51zdgfcjZoc+p1PwzQ4FzEsdZYyXx2fApd+dZJEP6bHjal0/GytWVlb?=
 =?iso-8859-1?Q?wH1pJLwQViN6NXfnlnh8uURNqzhzfce8HHEFB0uWk07F/ZETtGZNzFHbu0?=
 =?iso-8859-1?Q?6MH8iQXZzj1u1pO+bdbn66j0ptt0zXjoRDglMVjDivKR5UfQZhUH4S6WK8?=
 =?iso-8859-1?Q?pA1UXQL2yzoRfx7JKdCJAEzSz2I0J5sznyovvwk4m3HNnqs+Ge7pPRFNrZ?=
 =?iso-8859-1?Q?MBn7Y+iLLsP24UWieh/uDWeRK+8m6gqXQXOZnziiQClRfQZ9oulv0nkXwB?=
 =?iso-8859-1?Q?qt8RpSXXuGb76EJi4QcnzWAu+l+ulG6Tp6yR3pf+TkExy9D1CIPRqcpZtF?=
 =?iso-8859-1?Q?YZIVZKHvH+kF0O0fc7ilbS/04AxIL1TPaExaflR5lU3ULlO981KRT49PiB?=
 =?iso-8859-1?Q?vc6c2nBtJmXrMaMapS/Q/sMglPaOueG8ITMMtYxNCIfeLChdEt+jy7LKNh?=
 =?iso-8859-1?Q?1Q/nUe20KWGEB3ZdxSW1iVbyubTVA2IONK0wm6sZ1UOJuxllI2TB9fubD5?=
 =?iso-8859-1?Q?tza+HpacceDHLtISC3qH/5IT10jQdNsGhQ/pVm3RzmSAjWOYQz+9x6TJN9?=
 =?iso-8859-1?Q?bKbQlc13U7d76ktFVTvSQjK4AWlP+nEomRO4yoUp/sJrsDWciljR2EU8wF?=
 =?iso-8859-1?Q?ufY0kNZgJiRI/Gb3JfL39eqUvxRgwdHrhBq3gnpC8GZuSTvP+aUcWRwtRH?=
 =?iso-8859-1?Q?sknVOQNtG7Gi/SgKvZAP07GDHZ0w6GsM0a9gYF+SXe3nV5qUqTT7gdRnxk?=
 =?iso-8859-1?Q?2rnkUWb4bQ0aD7pWQoQxCFy/gjUaQK9c7yGTj0F1fPdAXA9kpEp79ua8hq?=
 =?iso-8859-1?Q?rrKxJqXC+EIWjKv0hdW0nC2tHzDLkuSgnKer1GyTxwTvXMi1wQrATl0pKb?=
 =?iso-8859-1?Q?mXjHb4ueTuL2mAkSUrBnOGylwUD4CukWil0Zkop9SamTdeItwpXAQlfzir?=
 =?iso-8859-1?Q?EwAYukU6SAxqBqh1ShmMDS1fb825AxhU1Ei6z0+ojDi/C2y8LnrrDBYYbE?=
 =?iso-8859-1?Q?caDA5dTzqzk+Eu6ed3fkMXCUHscct3LvL8A08DYPtUrGjZqVjzKetQF1fn?=
 =?iso-8859-1?Q?Wd11GmQ5BsT1maPxs3QJII5k5itVK+JpOISPFcxcevOoRBLrUyM0aph0K1?=
 =?iso-8859-1?Q?DcxbqDRlLV/dUes2AEG8aqxQF9CG9ZzO23nPMZRPST1wzG68fgdV3RCj4v?=
 =?iso-8859-1?Q?phhVqO870NhdKkx+is6gsAMHhjtluUvuTfPymEsc1dYB5bArmuX+IlNR70?=
 =?iso-8859-1?Q?oW2Gllm9vEYr++X9BX2iO7u3hvjI1RV+hfGdxqQqJPqn+qo7ElATgCieFb?=
 =?iso-8859-1?Q?TEUa01sShgSabZwH/8RfVgZIZr1pjlQm2aUYQCFJHUtS+DGNXaI5YutipO?=
 =?iso-8859-1?Q?o2WG2UAIgx61OF+MiQXaPXnxTiQ+7vci682YD5xjnEx6Q3MnpVh6pJ7nUe?=
 =?iso-8859-1?Q?aURne34ITj2y8DvxmRMMAp2XJr0AAyHKWi7ZVDBzZARc4LkMUratEdAVzI?=
 =?iso-8859-1?Q?lANmoa066z6D4/81llAyTaBYJ80U1jhYZOzg0Oj5HM1dXxoa5Xu+V7Dqv9?=
 =?iso-8859-1?Q?+64ewtYiFjMmaCu5GQEnx1+w4paOeOtGEHpw+BGvsIPLvumxZ3zfMi+bYi?=
 =?iso-8859-1?Q?Hwoqc/2tj1dyrHZKRaDKas8veqUPV25f6z1R170idL1SmBsM3Dygq2nOiM?=
 =?iso-8859-1?Q?OxheAqdygNs8Wpzjd0NUC+VFHqvhvO+/3OvE5Tiowuscuc7N2dIKzoEyGI?=
 =?iso-8859-1?Q?acDE9EPVPDyf5vfUymnLcUYv4=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <4C3FD928795CF14CB69A0754FD9A31F1@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd325aaf-a32b-405d-d5c5-08d9b385b6b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2021 22:15:12.5402 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3SmTI2LvKjrKspfNmOE9gdcTWcCIjWOUnHFvKHSt74OU+IM+MOHZNX3QHzAnQSzXO9pvuknIXdN5wErco63qlbjrSh+sG8GreMnHP0rNNCI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4417
X-Proofpoint-GUID: Pym3-7Y4LB010756gCf3XuvsTrQHZD51
X-Proofpoint-ORIG-GUID: Pym3-7Y4LB010756gCf3XuvsTrQHZD51
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-29_11,2021-11-28_01,2020-04-07_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> >=20
> > I see. I hadn't looked at the rest of the series yet because I ran out
> > of time, but now that I'm skimming them, I see quite a few places that
> > use non-EPROTO, but I wonder which of them actually should be
> > reconnected. So far all I saw were presumably persistent errors where a
> > retry won't help. Can you give me some examples?
>=20
> E.g. the particular case you mention earlier, -ECONNREFUSED, is not
> unlikely to happen due to the vhost-user server restart for maintenance;
> in this case retying looks like a reasonable thing to do, doesn't it?
>

Seems like a net-positive to me, expecially with the cleanups in the
rest of the series, but I don't feel strongly.

> Thanks,
> Roman.
> =

