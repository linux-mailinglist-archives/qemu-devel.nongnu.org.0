Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4106E48601A
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 06:15:11 +0100 (CET)
Received: from localhost ([::1]:45534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5L7F-0000uW-QV
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 00:15:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1n5L5p-0000Ed-3J
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 00:13:41 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:56402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1n5L5l-0006Fs-Pd
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 00:13:39 -0500
Received: from pps.filterd (m0127844.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 205N5Xrh025243;
 Wed, 5 Jan 2022 21:13:34 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=s1AMYtsaWHwLKDSJzVtuiqUvvHUVz6eMYb2slYjj8IA=;
 b=gTssOqC8EHBQTKxsTbut+WMzA2QzIkiUTI+33eoP+aDFq2t9wN9/wLI0+MRAIYYmdmMk
 0sW8fo1IRp5sFGEseP/DFHryhOAsp4Ovj5Uk9K1g1H6jc5B4kJFChYVGQnR7Y/kuh/9S
 p19C15Q5UWZi9TJRsPD9q8A9QsYdgX9B5QAs7AOs8tEWtgD5wXs9jvWvSU0W5WwngH9A
 +nZSl6k358tmxOfMICcmh8OkGE20L3eNoJBCJffJoJv0v51+VFo+LhylKy2SgDTUnNA7
 6E4QfyvXHjKhpkHNXuBmulD8WwbaXsRkmNvOa210/QSXDtknUcpWarJG8On83PG0fF75 Hg== 
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2044.outbound.protection.outlook.com [104.47.74.44])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3ddmpugebf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jan 2022 21:13:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aYhIRxXOzb8H10pegCtZCaN5bexYKX8q+XpdreVVYyz1XCIUZNLIO9NbNLbFbXOVsnWhfX/R5iOuRkExSLWSUh7uP4Xxh8ckI4qUQF5l5U61YJAqEBZJy35Olhl3R6mWqn6Ynmsa6v6EOCorLF7cd6sc635PEdkJtQbhA852ky/SqswHQ70fNlp30XcWIq7oSn1j/EVdO6AMtAdScstXZS/gccwtJpj0y+2tgUriC61FBaDydyGN3/+c/cdl9WqWI/DaAcsZ+H+NxMcTa7c8XswmGk5KkiaisAlqP+2ZDGcWKX/K346HLLtbRv17PVISpfgxv8hP6FBcEDw59uVvNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s1AMYtsaWHwLKDSJzVtuiqUvvHUVz6eMYb2slYjj8IA=;
 b=ggymHMgBG4bquwn+4FyeoE5DIKHX5eI5hE4jgZ8PY9YCzO6M9WNVtA6aolWQjLVsOOZpnqAFHC9HRnp8UR6sWRNxfsoV+/X7y+ZIn3BKcXVTwjFTQtZbHYTkzPBN+1sLk+ZQU1zq0kq7KcVCzZBXiYGc98QWxdvkJXb8zEBtx6TQA3SC5ySYRIHBot2rwOtRnNkFIOJseoQiLlgEs02F966f9GacnWhdXteiJCZhmjpcKwGBzkyyAeWZJomIa+JtmSSiyQxV/RCPgq0zLGvh8eOm78th3k8764T1lXI01tgUHb4WKlMQ2+W/9Aw4gjjuysMK/8Hi6xYbU/q1W/DK6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by BL0PR02MB5633.namprd02.prod.outlook.com (2603:10b6:208:84::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Thu, 6 Jan
 2022 05:13:33 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::3c2f:b2dd:a0b5:74da]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::3c2f:b2dd:a0b5:74da%6]) with mapi id 15.20.4867.009; Thu, 6 Jan 2022
 05:13:33 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC 1/5] libvhost-user: Add vu_rem_mem_reg input validation
Thread-Topic: [RFC 1/5] libvhost-user: Add vu_rem_mem_reg input validation
Thread-Index: AQHX8gNFcX5r9V9SQEi2GWHMy1c9eqxUYueAgAExVwA=
Date: Thu, 6 Jan 2022 05:13:33 +0000
Message-ID: <20220106051326.GA31292@raphael-debian-dev>
References: <20211215222939.24738-1-raphael.norwitz@nutanix.com>
 <20211215222939.24738-2-raphael.norwitz@nutanix.com>
 <YdV6U/7Lna/rRvVo@stefanha-x1.localdomain>
In-Reply-To: <YdV6U/7Lna/rRvVo@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 05ce6db1-189c-472a-ee43-08d9d0d3490b
x-ms-traffictypediagnostic: BL0PR02MB5633:EE_
x-microsoft-antispam-prvs: <BL0PR02MB5633976487302D288AB82060EA4C9@BL0PR02MB5633.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GSUM22j7LnRgM0bdNlbYnKerphy8D3nW4Uw9A7xGPowjirHs/zM79W7bZbHy6WqizwYS5DBsVUlqdJ0ESTY2n7DqAh4k84XXTF0vZzF50ikCalYSpRNJT6yOSyjVvtiVGN8yr7F7SAFxDdx/9LPs/nMMiVG65MEz53d2OwY5B5uZMgD32ra8Dy5hFLhh9NxF6EG+iTNpriPYiNkmEy/QHtDttwzHKFerLkRag0dY8QsQ49q2kF9mwwsMftHZK9kQjtLEI9M9yvmzVuMj58iOQY9QcWzJ97keY12Kgu3Z6tFApJIVIKVdQ5zxqOgRfMUjHg83bXssDFLbjkZMsORqdYmE5TF1oM70lA54lXUB5skNMdZuKSYfB4M5L7bludPLo3thrAbsnxuQAzBEJ1udPS4qP0ltr+2cWd++Uc3r+92khpWXcy4tbhCLWgpKr/gwmPJLpsBFTeg+XCpJDd6/pM1+OjPrhVjTSSl5cWkCpC7r17laYW5Go2/0QNC/wqiESoeWAerlS7qceMJbo2JUAA9EgyrNVU/6QvixbNsoZn2iAq/87Nsz1Wjy2I/5bSFMby7B9VrJk2//cTUfvX+eWMWzoJ66tbWAy4BK70zY27r4Ust4A7g3AitkzR4feB3RcqIEEIPUDUAh0ypr7gCnniwQIcu8p6vZBd31akdDCjvMEsVVQhEGSnNedgcwR0NgYuHhVNbqRWJ3bStWoRXDuA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(366004)(54906003)(26005)(8936002)(76116006)(8676002)(91956017)(186003)(6916009)(508600001)(6486002)(71200400001)(1076003)(4326008)(66476007)(66556008)(66946007)(64756008)(66446008)(9686003)(6512007)(6506007)(2906002)(83380400001)(33656002)(33716001)(316002)(86362001)(38070700005)(122000001)(38100700002)(5660300002)(44832011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mFKSlWRecWM9zZqmBim8Ts5+YlDA8+XZGysthJDYMLRlYxSVh1fgUfKYyuUe?=
 =?us-ascii?Q?ru2iKT7WeuLJYqsoIJee0EqIyAu6ZT/wyqYtkZ4GrY9Qnvo2wG7tl9aIeg5a?=
 =?us-ascii?Q?J6W/pj37Na+JIsazlcpR6eJATgdidFozN/NfTEGtMJc+lY9V14QMkliPuVjN?=
 =?us-ascii?Q?TbIh943kYrIo9Sy6ZDNrFRAnh/2N92A2C6FKLdI3YwEt6wLFNWMHgCNpIYRZ?=
 =?us-ascii?Q?lcDaFJcUVAiuQjak8baQMHP+csTOJVd8i+2bE1CcIAd3kjFxRqJ9vgxYQdFJ?=
 =?us-ascii?Q?wXl/HwRxeyO7LOnvjm4pPFOSK5mfsPBN4oFr2dTQ2bn1cqtTRS8knBtm81Cc?=
 =?us-ascii?Q?XX4ucSCrO11Bb01kscDPRpm9v0qIWENlsCGpYvlxaOPoREI8m4YqqHCcKmc1?=
 =?us-ascii?Q?m4PCMxQDaA89TCSlf2BKJqNSn3dUG/00s0DYhcNZuMZjJh4KIbHd6//NamwD?=
 =?us-ascii?Q?+eq8e55IbBHxjfBChTwe2t5krK34RSjg/2tNGLXAWD8W4BtX0iaadXqpW3gZ?=
 =?us-ascii?Q?F81G5Ua1hQjDDn0SdSkpWfNLcMBfXnZLy3gVTVEeGtzFYOXX8oQaBCKlKVzP?=
 =?us-ascii?Q?kefHFEJge9HDWBy8sl6wDLojj1ivbs7fynhVznWKU6fzOdfXqFRl7D48JqpV?=
 =?us-ascii?Q?haM82K8WpFvRWREw4x08tU55RXUuqnFSH4JjtLgw1Yk8IcXc0SG6Kf45c22W?=
 =?us-ascii?Q?d19aR+h6/3w1g3u6N31syOhNTJGe8ftym6KynnTA6uvYkAjkz+qisFdEiQIm?=
 =?us-ascii?Q?OLU7usaYjFg0H7aQ46C33n8E2xcl4CFVfJANertXdhBun+80oKxhEBoiKWqT?=
 =?us-ascii?Q?o1lUYrUFQbJAAy0e027yW8HqXTtYzGcg1CbL56lNAj7k7vbBNywAB9h3G+AE?=
 =?us-ascii?Q?Iin8gVJsYMiTqHfKsTGx+PtH/nhkpgFjck16CjLXUArXoR/gkG2fxlVsdtdn?=
 =?us-ascii?Q?wgfUVpE3d2f2v2IZ6fMQ8Nxp0wP1cycVViLBSYAnAoroSDkkTOEwUACcnIrg?=
 =?us-ascii?Q?GvVzsXJFTEH2dxG2FrMaRy5cXKeI21870Si1Bzio8+zrlpZpjWyYZVqhFTzG?=
 =?us-ascii?Q?qShPgIwxaIaY8iN57a29R0KmkCyamPuGhr56lnbSJP7gKa4liOBXILxpfJiR?=
 =?us-ascii?Q?skvvxTtMZNdYLDus0Z66NMkbjgUgpsa6nYZ+e8xYc3mS50oXgPI/EOyW9SnO?=
 =?us-ascii?Q?HRqAdCg8QrZ1dAPGmxhtDrwIvDKkfureRj/ErGiTCnzQdinz0VSDOhRg+XeW?=
 =?us-ascii?Q?Chn0qPnOgfoJFcp/HnSR0bMG/MstH5dggi5to8kv3JbwfL0eLutZG+YAC+75?=
 =?us-ascii?Q?nufdYypLst7L7vtUbUp6OjlHe6LFUAPmbjh6bUGEeNJauezbyh+HLps0Okla?=
 =?us-ascii?Q?yDyzB4gBVngz7TD0yODrRmfF2ZuEUY8k7dDFT6dF37oxItstr3tncPaugUBI?=
 =?us-ascii?Q?XX7mHGPfwrD2wqUEuNPxbwK3svXxHUrJ7zU+bO5uZEPNNdJ5XKeUI5gUm7rK?=
 =?us-ascii?Q?1rSHTS5IohpWPBVtZ/FrziizBkTunSYBtYqbhBwh/qzYh9RP8vOa5/JVhlte?=
 =?us-ascii?Q?813UaRt204mgeoaSKQ3tiHUaHSC3lGRYN/rK2SgyRxk3nwp8u+EZwNWJdAi4?=
 =?us-ascii?Q?m3GPQc/EJRxg7mIlxV6/ro4q6BQQNWZQCWO/jlevCH+kIjvPpH+VF9vyfWKd?=
 =?us-ascii?Q?OaKcLgJSvVHG/TFKgry6G3w7V4A=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DAB676AF89DB384BAF333A8999264CAB@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05ce6db1-189c-472a-ee43-08d9d0d3490b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2022 05:13:33.1049 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hNPV0Ez2a2ZKt0V/RM/f4Mivy8dNzjbMFMaYPTB2z2RulRm4zdZiJPt/gOSJYTN+cZyy2m4U27n6n3JH62TCS10Ei+HvbA+XnxJHT7Eu6BM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB5633
X-Proofpoint-GUID: UE3mcc5ySAy53m_9ZoyiFwwEBFMEFg1k
X-Proofpoint-ORIG-GUID: UE3mcc5ySAy53m_9ZoyiFwwEBFMEFg1k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-06_01,2022-01-04_01,2021-12-02_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "raphael.s.norwitz@gmail.com" <raphael.s.norwitz@gmail.com>,
 "mst@redhat.com" <mst@redhat.com>, "david@redhat.com" <david@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 05, 2022 at 11:00:35AM +0000, Stefan Hajnoczi wrote:
> On Wed, Dec 15, 2021 at 10:29:48PM +0000, Raphael Norwitz wrote:
> > Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
> > ---
> >  subprojects/libvhost-user/libvhost-user.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >=20
> > diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/li=
bvhost-user/libvhost-user.c
> > index 787f4d2d4f..573212a83b 100644
> > --- a/subprojects/libvhost-user/libvhost-user.c
> > +++ b/subprojects/libvhost-user/libvhost-user.c
> > @@ -801,6 +801,12 @@ vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
> >      VuDevRegion shadow_regions[VHOST_USER_MAX_RAM_SLOTS] =3D {};
> >      VhostUserMemoryRegion m =3D vmsg->payload.memreg.region, *msg_regi=
on =3D &m;
> > =20
> > +    if (vmsg->fd_num !=3D 1 ||
> > +        vmsg->size !=3D sizeof(vmsg->payload.memreg)) {
> > +        vu_panic(dev, "VHOST_USER_REM_MEM_REG received multiple region=
s");
> > +        return true;
>=20
> Most vu_panic() callers return false to indicate that a reply does not
> need to be sent. When the return value is true vu_dispatch() sends a
> response, which we don't want.
>=20
> Note that vu_dispatch() returns true (success) when the message handler
> function returns false. The success/failure behavior should probably be
> separated from the reply_requested behavior :(.
>=20
> Anyway, returning false is probably appropriate here.
>

Ack - I'll fix it in all the patches.

> Stefan


