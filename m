Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2E0403886
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 13:06:39 +0200 (CEST)
Received: from localhost ([::1]:34756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNvPa-0004ph-55
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 07:06:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.levon@nutanix.com>)
 id 1mNvMM-0002g8-Ee
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 07:03:18 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:20264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.levon@nutanix.com>)
 id 1mNvMK-0000W5-0r
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 07:03:18 -0400
Received: from pps.filterd (m0127844.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 1885XI6Q030158;
 Wed, 8 Sep 2021 04:03:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=F5sqoL3iSqedxvwJ2a3VQ4oMbcC57/TA/ieFCnxALFk=;
 b=NnfKxLHQAf5iT2Bd+O6r+F6eIVsG1wauy5HWLZUfcdv+APjHZ0V4INCn6NFW9eKB6FGn
 Sne1K0JjLIGwvsYG4VpdwThBQDJQaP1Mbxs0l+ahrMAgPpHG8UjqH3n7YwZS/kheat0i
 ftET4A//BGlSnduMkJvwx8Hx3woM0Lg0nsl+1gvIQIZBGVN96QzhY9+Sv73ug7EG7t3W
 COAYCK2+jV5k/wzWBUuRmJ74x/LE9vyWVn/TiQY+D0WmtnLIa7tLmK3qAlGp3eQocNXk
 GvSGvBJSsYz3XZ1ZxpgT4Asg/NaA4HiemaiXekZIS3SBvIyKJzm5n3iRBFvUcjzc5jvD ng== 
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2041.outbound.protection.outlook.com [104.47.57.41])
 by mx0b-002c1b01.pphosted.com with ESMTP id 3axcuh9nue-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Sep 2021 04:03:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eeNA4+My1GPYDHLbeZwBRfzQfEIaacPeP6cEDC4r8yAkBxlztaqKPH1OiySVv+nsL6VgdQiSeIDBSy/0L1Pl662Ag4kL8rO6TolcMQUSk1y+gdfEn2+FFHaEwfa2LxGF3zOusz34tFDJWEfklMKYFxnW8wFJ7S2Snhvyo8ahBzJ/ZC6MJmYPy/787VjTxnGfGMk6TGu2nht5+Tckzg7LjNNVRmQueW6j6oTuHB0LqLx+xWi6oHn40QcuiFcP8LTKft63V1fNV/2Ppk+R4Rv1BCINF9wUlUHn6VW42FwWT0jSnhvcHSM/2a4ne5wt0HyUAIf1alAmUe/MlH0Wrc2wEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=F5sqoL3iSqedxvwJ2a3VQ4oMbcC57/TA/ieFCnxALFk=;
 b=a/99jnEccN6r7x4VwS5k0fbzLWi3DrNqVpRrTSvTdFiDDzhwgY+5p2NcPIVPSDyaoGwA2nj6zIbFVlwuA732PGNJ0zwvyYEcHRYdjJkLs+rZTlVLX/n+Auza7GySlDxOe9qCv0RJztzHgK6XHoLcreOQPdeDLkWRydJ29bfDZOX7Wi8zxkMgEe+N0xIjsuWBrn11GqyZZacKuZ6m9eRSbFFd22g/u3YFpMduBfAIWY26kNUmO0hz678JoeQ4iLPadBcVdPm6oeFDimm14iT7kV5vfnartV4OzcpjaPJ64gTf2F4XOKRt0r9PaWdk2Pe2BLjJFoEX7i3z09E5QrQR7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL0PR02MB4580.namprd02.prod.outlook.com (2603:10b6:208:40::27)
 by BL0PR02MB4659.namprd02.prod.outlook.com (2603:10b6:208:57::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Wed, 8 Sep
 2021 11:03:11 +0000
Received: from BL0PR02MB4580.namprd02.prod.outlook.com
 ([fe80::b9d9:2c4b:c85e:dbd0]) by BL0PR02MB4580.namprd02.prod.outlook.com
 ([fe80::b9d9:2c4b:c85e:dbd0%7]) with mapi id 15.20.4478.026; Wed, 8 Sep 2021
 11:03:11 +0000
From: John Levon <john.levon@nutanix.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH RFC v2 14/16] vfio-user: dma read/write operations
Thread-Topic: [PATCH RFC v2 14/16] vfio-user: dma read/write operations
Thread-Index: AQHXkr3TW//RUZqZlEGW/aMjBzdXw6uaCKCAgAAUHAA=
Date: Wed, 8 Sep 2021 11:03:10 +0000
Message-ID: <YTiYbsQqxQNsAdB7@movementarian.org>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <7b21118256af2cb3d0dfe45b1e4ef9683fabccb5.1629131628.git.elena.ufimtseva@oracle.com>
 <YTiHj6TGg8tYJ7zE@stefanha-x1.localdomain>
In-Reply-To: <YTiHj6TGg8tYJ7zE@stefanha-x1.localdomain>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nutanix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0333a77f-0780-4614-49a1-08d972b83f40
x-ms-traffictypediagnostic: BL0PR02MB4659:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR02MB46594D8D6629EAEE6DA7CD9597D49@BL0PR02MB4659.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vxJz/niHHjhbVbOEaFC2jDHowDhBzoNzP0XUE1KIGD+vNh/N5DYzLTQTPK39K0Oe/OzJ3f5CzIz4D5n591Pcc+KkD0nhiLOdaBP2AQ8gyJ3Bpe+461OzD+aEtrWo2A6zAMZ3U2rw+X4MN/Y1VO2/HzU7CsTWBQ1XsvDxrcE07tN1jqjulKAXyZ6nB+5s21OpIErEw+bZ/1bsWo6KzhwKy7VT97YU0QTZZE9Qf+fvrxTJ2tWkhy/Nxgz+S6MsbhNcBo5ancO4DBC+hXEc5+16dNrEtRBAcAmpgPIGpie9nZKj6znH4wnKQPinL0lx1gRU7VmQl8P+mkJdU4l0v55LgFoakg/1lO4+v3JHKw94tJ1dZPfgeCSxfjpQLbOIZyTdCGPolrZvCw3IR70jln/EejH14Mz91l71es8Q0oU+tzpNM8Uhfny0DAdSUDzZeMYrSJo9HLerWFIjof2KTH0YTIiwCUeSzgrlLpBH/+uzCpyAlIdyrFgg4IVtiGFpOukUaPnL2O2qx4afV5VHl5IOCSKQOjDn4zH/8Fppn0EfyMesMx+GFK1oIWeOeFNQ7yTPn60w5n02iSL4VrxKQYVIikk8Ih2LRIbjVzcKPwHtpnGHDPk7bQCWnWDXep0VVbH7tCNw1hZ6NbFVkFkyvdnPFm1KYuljQiCzjjDY4Sawa1Cu1efJbqnc19sbkXHc9+4XhBu57H7CnH/wja8LIuvhbg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR02MB4580.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(366004)(346002)(376002)(39860400002)(136003)(186003)(66446008)(9686003)(6506007)(38070700005)(4326008)(86362001)(8936002)(38100700002)(91956017)(76116006)(36756003)(478600001)(6916009)(66476007)(64756008)(66556008)(6512007)(66946007)(71200400001)(6486002)(122000001)(5660300002)(54906003)(2906002)(8676002)(316002)(4744005)(107886003)(44832011)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wF9pLsF3+vqNLuC0J7jFq2Af2AQUzbiK1+7JqKevzkDowYPV0fCEpd4W4Kfd?=
 =?us-ascii?Q?7aN+Yt8KTr3ZENssXEUxB7iRr7kdIYvZABMHeVFTvQO073Ti7un57sY5c9kV?=
 =?us-ascii?Q?EN4q52xwYwiSfyWFdM/Od1zYdUtwSgPzOQK9Od5FWAwxOw/yVZYdqslaP67q?=
 =?us-ascii?Q?s8DWeiX5U0JdiG/GGMfLHEpnCjUCl3E8UJN1D8IapZv2uguBxP2e7b6om+hO?=
 =?us-ascii?Q?BZrgXYCZOBNuEO4tJRIYdjiMG+zzR0hZ1MNRMqh9FTBI7po557xjs3n8xThp?=
 =?us-ascii?Q?j729FZQixVMHISVPFWrdX/P2yMu+wvLuMSWcUyks0qw06LKWccqBfx0tDRhU?=
 =?us-ascii?Q?dbotNZzX8GV/NQADiw1J2CnDu5IjwtdE/wqBYALvNmlApGcB9U766ERVhwTr?=
 =?us-ascii?Q?kyZpQBlKDUwBurO+PF//xM6LMADkxbPb37p+oiHKhHbzObNf9MUnAswbRq6R?=
 =?us-ascii?Q?pd5LC713xvYtNmAH+siB4zFBNvGRcr7Y54T2VpIhqn/xSDhBljL1QaY8P6PV?=
 =?us-ascii?Q?ZbmwPOXhPYwh60N/7RR/I6d63A0pTRqV9GgpDpMZ+K9YyzKC320wjCW4zBrp?=
 =?us-ascii?Q?9Yh2dOE4DoXFBTbN4YcOjcBbzQ1x70OyObejpQXWB0ZjpYOxgmSWkpzSCq+A?=
 =?us-ascii?Q?OtvGMC0I/c2/XuL8ItySdWhu0IvImuH7Ap3ajz1sVAr8cg5XmymnSYx1zNA9?=
 =?us-ascii?Q?EZI/qh4/Eh3TBGiXSHOEYNBLyVjKGHt7IgZNrX98wl3GQQJI0XxYbjKaQ4xG?=
 =?us-ascii?Q?CxzBMhFRf/411q/xN6HrYPD+rBwpbBtl0+oZAfYq3ZqPJZW4ZkxNL7jtmgSF?=
 =?us-ascii?Q?cJ0XZhh5KRbKkEq6eimbHReXAgNHERzQbXve06k3gvVF5rYIr2C8pcVSY7Bv?=
 =?us-ascii?Q?jgycUPFS+OBx7Md5tEVb+ndhXD6fdJK6a3CmhdZsWF2QkF+qDMvs2AhfTiAL?=
 =?us-ascii?Q?Rcwm2GDrrKIpRrMogYJoZ0gPcrhF5eUkbv0fpR4aDcjP5aDNwuRzxI17rBXN?=
 =?us-ascii?Q?Ome2pYMHQqyERyykV7oXNJ3rg5tHRl6u8cQZJNwvNub7JNmoiVFHGGOE0TCN?=
 =?us-ascii?Q?zJdnE7BaHLNHD8Gl2CBmU7kAu+v9gZ/cGPzXyJrUnDDKuBmnF5Q9x1FFJCQx?=
 =?us-ascii?Q?fyfEx9jGB0d1Pnyvj3Voiddatf+KSmUIemCdmlgefH//dCiqA/YID2Ngyv07?=
 =?us-ascii?Q?aquV41qvoqWIx1IO99KXvVhqCtIcuuk57I0Z1qn2cX0+qLv7wyrXm1ZZaqM3?=
 =?us-ascii?Q?l/vfbC6ZpvQPcaRRZovBtB3/M/Yy9J5Y5qxv1jCX3zSXocPsDtxZtG5ZnzO+?=
 =?us-ascii?Q?wLJzO+AKrp7Q4CC8xsXKRZQs?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <52F3B9A82CBF8F41896A928687524A05@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR02MB4580.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0333a77f-0780-4614-49a1-08d972b83f40
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2021 11:03:10.8583 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FtpxDvJRKta1AI7oXix8RnC4FkZuzJ0f10agSYsVzHtpFJ2K6JFbjEJvwt9SkpCuCzLijb3262pVp5lIQV6Raw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4659
X-Proofpoint-GUID: phKCBm5KOxVH6f8ziNsI1nhYxS8B3irW
X-Proofpoint-ORIG-GUID: phKCBm5KOxVH6f8ziNsI1nhYxS8B3irW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-08_05,2021-09-07_02,2020-04-07_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=john.levon@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 "john.g.johnson@oracle.com" <john.g.johnson@oracle.com>,
 "jag.raman@oracle.com" <jag.raman@oracle.com>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 08, 2021 at 10:51:11AM +0100, Stefan Hajnoczi wrote:

> > +
> > +    buf =3D g_malloc0(size);
> > +    memcpy(buf, msg, sizeof(*msg));
> > +
> > +    pci_dma_read(pdev, msg->offset, buf + sizeof(*msg), msg->count);
>=20
> The vfio-user spec doesn't go into errors but pci_dma_read() can return
> errors. Hmm...

It's certainly under-specified in the spec, but in terms of the library, we=
 do
return EINVAL if we decide something invalid happened...

regards
john=

