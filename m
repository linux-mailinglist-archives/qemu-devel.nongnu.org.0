Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 257E55BF3F4
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 04:53:55 +0200 (CEST)
Received: from localhost ([::1]:51216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaps1-0005PF-OS
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 22:53:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1oappb-0003Dr-3h; Tue, 20 Sep 2022 22:51:23 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:55796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1oappW-0003ZD-Ix; Tue, 20 Sep 2022 22:51:20 -0400
Received: from pps.filterd (m0127841.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28KNKLct019771;
 Tue, 20 Sep 2022 19:51:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=proofpoint20171006;
 bh=LaTn+OuWyYdlywjNkh8CXAWGwQ4z32ZsfI/rSVZvXQw=;
 b=zNQu3dJwA1YQncETbEsbqJF4uoowpPOiQ3g64JIEPRi8Ssjdeh7f1auwShSuXdWhP71m
 n470C9W6k5gQCqFF0xCcFdKXhr+8cN5gby6rEE0zRdSz7rr7u684Ti17JEx5MLtBRWu3
 aZbDYS5A4nThU59zFNRUS5mcOq7aoZbYJcb4mM8r9D5AnRFoq3l5ykcvte5nbaDhBf+c
 R6+uTVThmqiv/k+cBL03tzZxWkxEVFWKQDlOXftInsIQMG6Nmkfj7kRzUUXe1QTN72E9
 ZEDYPHKHIKthYT1Lp/CaWX82/jykYaO9nC13FUqUd5QHfG92T6v8VOXBgMHKrkTqw6T8 2A== 
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam04lp2171.outbound.protection.outlook.com [104.47.73.171])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3jnbs91aub-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Sep 2022 19:51:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IsWtDdrwdaBYz1G1DPnDt3PgauTNbd/8ZqYdfiooMDQR26UrTD3mWcJKWUDGarjPc9vZi6wSvmtsjs0deBXZWSK4Xt93uvxt6Wru4QboANtnUtlBB3KQPTh/RKdnPi6I9I9fa52rG/QHP2wxLnD7XgPPVZZ8bl5VvXud+EM7qrONc4mWw753cyaaZg6vn303XX/Q9yhiB2ovbd8RtXV1B+06HbMA7cH8zLoFBKHFSoUK4ttooC7w5F1zUSqp2lejxEcCjoIHW+sE3xNI9R3NkGFHew5czJFJz0qK9RWrwUARh/D94ApTjwZhi+Thf8D2h0jznnBR03ekd/ES9p4tEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LaTn+OuWyYdlywjNkh8CXAWGwQ4z32ZsfI/rSVZvXQw=;
 b=IbU/LNxGxYYkpEl65Zoz1WACq4kvY0r1HmDcNouCVxwGTLmImVw7jAgDQLEhppAf7hUatXDfCuk8wwKT/jgijlV2MxiuC8IUb8Y2AQHFLdKMRAGbIv8rTeMWTZK1sfG5T3XzjnwkwzTqtkUv42LCOO0d2v8sZXxoUd8/aeSMJe7bKM+WMtnB42+woGIcU3AHjPSXr9Cfrm9UgBt2HX1BbB8UpKLVyuJLedOTvUMnivCmRwQi4GUBOWdzrLRriEtPfm6U8VTq63LbJOtbDAXRPiJDKh6q8v6DtJ/XKfYEoyk3VDhHWnYansAFyUgiW7SMvGXVxYEIGfCJ8JfG3hohxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by DS0PR02MB9127.namprd02.prod.outlook.com (2603:10b6:8:11c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.19; Wed, 21 Sep
 2022 02:51:10 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::e8ab:ff5d:aded:71ea]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::e8ab:ff5d:aded:71ea%3]) with mapi id 15.20.5654.016; Wed, 21 Sep 2022
 02:51:10 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Li Feng <fengli@smartx.com>, "Michael S. Tsirkin" <mst@redhat.com>, Kevin
 Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, "open list:Block
 layer core" <qemu-block@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: "lifeng1519@gmail.com" <lifeng1519@gmail.com>, Li Feng <fengli@smartx.com>
Subject: Re: [PATCH] vhost-user-blk: fix the resize crash
Thread-Topic: [PATCH] vhost-user-blk: fix the resize crash
Thread-Index: AQHYzCH1kmwDc7kDPESg4QMWoOc4qa3pHeMg
Date: Wed, 21 Sep 2022 02:51:10 +0000
Message-ID: <BL3PR02MB79381131F8ED2B4326A82D7BEA4F9@BL3PR02MB7938.namprd02.prod.outlook.com>
References: <20220919121816.3252223-1-fengli@smartx.com>
In-Reply-To: <20220919121816.3252223-1-fengli@smartx.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR02MB7938:EE_|DS0PR02MB9127:EE_
x-ms-office365-filtering-correlation-id: 90c435d8-fee6-4a12-805f-08da9b7c23e3
x-proofpoint-crosstenant: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Omg7WXIdITJRB+YEwwZZkcKCFVAedxLP0f2UQkkvVSKEtCrVT6f/N8OXk2YmjyH5fJAlEH9zoMpgS+KrZP8bzgTnJz1QznoFOvbWpfkakpOvPRFW5y3GLQfcfNWWBviE6g/zCGOYimwVq6/bADycs3A4HiELa7AIItAucgBMoDgMnPFpugsXKeNy98I7STcRqnpCGIK3nb1Coa7fJHE9BO89ZY4ycMok1y+1XF2XPC+6Pu58zOzUWrLB70fOso//4BkBYUcwzms9WkDHosemY1RJl3sPUiYQTYJDM58TSDpTqgOeXOJ2mTSFowUIxgVMbB1yELwCbIzyTlVNik07DTVdFtjWf5b4WDx3GqIIewozVcD6HLL77h5+fcfgMDp61cMxDRb+WOSQKk5gwhLjaF8oIOqzQ87WaHRAqaPeSrBt9LEcfMWX4t6gIrGdqI/jBWvE2GJ/JeKqe82GWrhqE/ThDj7IK+97ZIeRlyosRWh05ZpBgIA+mQ2iUUID2NjpDEzrI6ZfByhD4XvUViPkhTThCwxBJQrTKOUAqaY5Gr6+EDjrY0U83qAg76S2ycPBc+RCZuV9iMhZP4Psksg+Q9kqyNEvG7g1JCuWv9FEN6669ohAwZnSyCOF/Iiqq+wf6Sfm3zx+SPwdCM2ifahaE/UL1UOXeeZa/ihRUnM0f66Dr0Y6uAYUe6UDpNSmRCOd3X20rERsu+Be7HHNNwK/dTtedt/QmGWHS4BdpxqyWEzqPEkGJBh65c5CCS6SRoPbkyutxtVVRD602XnMIRqXN2AXfYFh568W8D1Rf5+/8goCU4h33ydkhhQpwUeXDOLR
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(376002)(39860400002)(346002)(366004)(396003)(451199015)(83380400001)(2906002)(8676002)(316002)(54906003)(110136005)(44832011)(4744005)(5660300002)(52536014)(76116006)(478600001)(33656002)(4326008)(64756008)(66446008)(66476007)(66556008)(66946007)(91956017)(71200400001)(86362001)(41300700001)(8936002)(6506007)(7696005)(26005)(9686003)(186003)(38070700005)(122000001)(38100700002)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4P/c/3/jJTbEvLdjT8JoKYoOUbhffRaTfBrZELmzUD3xHpN8Wc1VCph4/jxR?=
 =?us-ascii?Q?wQ0O7p8ldbq8M7YbLTXGd9/zUXnIPxpGWreFWvVa0WREkykblYHaJqLX9uxM?=
 =?us-ascii?Q?NgKZARPC3jJfUTB/wAP87Bn8XoOhxhLMYwo8pYGM4hFD6U7WN7AZRjc30U2T?=
 =?us-ascii?Q?rM/U0IZ9YhAgipeLL2rTrQohODiQID/HnKvxnrLqfCMM+ms1o6f5lWNQ4izn?=
 =?us-ascii?Q?ObXUoarONqW6xI9kZokU4g/BDkfBNkU1EMxZc8R5IEU5qB5fIkulFBFleXP2?=
 =?us-ascii?Q?tNPxBVWvbQh5wA40WCYSrZKSwVzGPOG1Ya6WjKvKt+B4ICIhCbOQBdyJu4Uv?=
 =?us-ascii?Q?TEEGWSPofuKE/bTyteFh/LFRHERw5gUZJXCVXLwXKthxCvyf0142JRKehu+e?=
 =?us-ascii?Q?G64I52S3UxPTQ+/aLoCoZBzr9pm0vM0+vlljWFwBpJUBb98o9EbSs+Uf0zMF?=
 =?us-ascii?Q?XgtgSp3azUHJRsUXTUsonBeURP1fTOErjg0/l/lCgWQxZ06tNMANIYsdU9R1?=
 =?us-ascii?Q?PkrUDER5VtVwPGCnzulKNvmt/rfqMo0HrIJ9OuwGYL3zCB8Vt/grYpoT+6L9?=
 =?us-ascii?Q?jyM9Mq9P74Mky06kj2P8z0EjfWNxjRl/vvj1L2uaqcbbgy/6a7bDgS/r/kev?=
 =?us-ascii?Q?fNEdkPH59XDLWyYUIVufErpLsexO0d4ZfJ5MIC8KnAW2+nuAyUeoaKDrNKK+?=
 =?us-ascii?Q?YwHyreVWUMsV8TbPJWV1D1Qj6zuT7hBsAbI7dNS3Rf8/LaSjLvt0Tma9J2IU?=
 =?us-ascii?Q?rPK/trAQHv/gq2YmsgJ6twGRo8BXlQp6mXasckNvcDy3+6hMFsne/+7yNUlF?=
 =?us-ascii?Q?ABUp7qexDDx1zawwp/y+SZ5w2jyc3D6Do/UuJh7ul38Dg5a6NMqpHmVjgcPA?=
 =?us-ascii?Q?DwXUjc9NGjNknG/NInTj9N9elyCpqgYlsZ9amzN4assXNC+C2Kmjtf7xZfqj?=
 =?us-ascii?Q?TTs5Jcl2dCTZ10GZRrJkFyS7urgtahTdSjoxATdCKLmqKxLK0IAj4tcvIliS?=
 =?us-ascii?Q?F/xCWRRf/8r0T/RDK+cg9mFFq43B7AQCS9+Ihck/ET67EvzZ/dEyzg1lAHxU?=
 =?us-ascii?Q?C+XD4rS5gWTKXL4QwmYdhbl20FjmI85zC+x2JUpkacIQYk4qiUQtE/Yfq+4t?=
 =?us-ascii?Q?jfEEajKG7z/AExCanQfl+77SLwDFkoJFKgs5uhAcPDm/p1Ew4yj2vTnhVNQJ?=
 =?us-ascii?Q?7XdfH4f7i9Ztj95CBfjkZ49lZ3R+9rXTMSkPfmqGPELFTNukIpKyxoiyM9Oz?=
 =?us-ascii?Q?FSBpu0jvhohN3ajUSPXQPnkqdKM9TmvZmrEw/Fw6lIaotLxdxAQZKCj/V6li?=
 =?us-ascii?Q?NDPMH9FPmRRysbkK79DmkZ9GlfTsqSyyY81PrYzUKsM8KeCnJf09pBTyHZ2S?=
 =?us-ascii?Q?nXPLHgVXm+/TwOAhEJUC9nmB/5jX5S1C1tvdB4BZeIWThjQI8lqNVioWae5h?=
 =?us-ascii?Q?xDAitP6SmBS/ucLPOKRBkFyJzngvoeh6ZqGE8P5nixT5ByUJ3gP75ex87eiL?=
 =?us-ascii?Q?dFemozXJHPc0UhFphWeZ7bx4STdLNXnmWgafiJEwlZCQwC36GjcG/CD6OPb3?=
 =?us-ascii?Q?arwDk0hvw0cOvXBZzQp/Jj3S157tyUdEYCM/PK3vV3U84NitDYKKTko6LvMz?=
 =?us-ascii?Q?TFxf7KDjjjBOgOMQ+ixTrWo=3D?=
Content-Type: multipart/alternative;
 boundary="_000_BL3PR02MB79381131F8ED2B4326A82D7BEA4F9BL3PR02MB7938namp_"
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90c435d8-fee6-4a12-805f-08da9b7c23e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2022 02:51:10.6239 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T5zhiT9r/bU8g94gAEuTuqM5rjGVWPs7g1Fd1VNsXB61i7Gi10cf+NCmz0zTfe9+gcCbw1Wi7yTSV195PSuTtqfEzY6VbaP6bKFlelx9BZQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR02MB9127
X-Proofpoint-GUID: l0YitMZxsN5PphqkD_w5LSgipAyTRgFH
X-Proofpoint-ORIG-GUID: l0YitMZxsN5PphqkD_w5LSgipAyTRgFH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-21_01,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, SPF_HELO_NONE=0.001,
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

--_000_BL3PR02MB79381131F8ED2B4326A82D7BEA4F9BL3PR02MB7938namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>If the os is not installed and doesn't have the virtio guest driver,

>the vhost dev isn't started, so the dev->vdev is NULL.

>

>Reproduce: mount a Win 2019 iso, go into the install ui, then resize

>the virtio-blk device, qemu crash.

>

>Signed-off-by: Li Feng fengli@smartx.com<mailto:fengli@smartx.com>



Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>



>---

> hw/block/vhost-user-blk.c | 4 ++++

> 1 file changed, 4 insertions(+)

>

>diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c

>index 9117222456..db30bb754f 100644

>--- a/hw/block/vhost-user-blk.c

>+++ b/hw/block/vhost-user-blk.c

>@@ -95,6 +95,10 @@ static int vhost_user_blk_handle_config_change(struct v=
host_dev *dev)

>     VHostUserBlk *s =3D VHOST_USER_BLK(dev->vdev);

>     Error *local_err =3D NULL;

>

>+    if (!dev->started) {

>+        return 0;

>+    }

>+

>     ret =3D vhost_dev_get_config(dev, (uint8_t *)&blkcfg,

>                                sizeof(struct virtio_blk_config),

>                                &local_err);

>--

>2.37.3

>


--_000_BL3PR02MB79381131F8ED2B4326A82D7BEA4F9BL3PR02MB7938namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Menlo;
	panose-1:2 11 6 9 3 8 4 2 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
p.p1, li.p1, div.p1
	{mso-style-name:p1;
	margin:0in;
	font-size:8.5pt;
	font-family:Menlo;
	color:black;}
span.s1
	{mso-style-name:s1;}
span.apple-converted-space
	{mso-style-name:apple-converted-space;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<div>
<p class=3D"p1"><span class=3D"s1">&gt;If the os is not installed and doesn=
't have the virtio guest driver,</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;the vhost dev isn't started, so the =
dev-&gt;vdev is NULL.</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;</span><o:p>&nbsp;</o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;Reproduce: mount a Win 2019 iso, go =
into the install ui, then resize</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;the virtio-blk device, qemu crash.</=
span></p>
<p class=3D"p1"><span class=3D"s1">&gt;</span><o:p>&nbsp;</o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;Signed-off-by: Li Feng <a href=3D"ma=
ilto:fengli@smartx.com">
fengli@smartx.com</a><o:p></o:p></span></p>
<p class=3D"p1"><span class=3D"s1"><o:p>&nbsp;</o:p></span></p>
<p class=3D"p1"><span class=3D"s1">Reviewed-by: Raphael Norwitz &lt;raphael=
.norwitz@nutanix.com&gt;<o:p></o:p></span></p>
<p class=3D"p1"><o:p>&nbsp;</o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;---</span></p>
<p class=3D"p1"><span class=3D"s1">&gt; hw/block/vhost-user-blk.c | 4 ++++<=
/span></p>
<p class=3D"p1"><span class=3D"s1">&gt; 1 file changed, 4 insertions(+)</sp=
an></p>
<p class=3D"p1"><span class=3D"s1">&gt;</span><o:p>&nbsp;</o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;diff --git a/hw/block/vhost-user-blk=
.c b/hw/block/vhost-user-blk.c</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;index 9117222456..db30bb754f 100644<=
/span></p>
<p class=3D"p1"><span class=3D"s1">&gt;--- a/hw/block/vhost-user-blk.c</spa=
n></p>
<p class=3D"p1"><span class=3D"s1">&gt;+++ b/hw/block/vhost-user-blk.c</spa=
n></p>
<p class=3D"p1"><span class=3D"s1">&gt;@@ -95,6 +95,10 @@ static int vhost_=
user_blk_handle_config_change(struct vhost_dev *dev)</span></p>
<p class=3D"p1"><span class=3D"s1">&gt; </span><span class=3D"apple-convert=
ed-space">&nbsp; &nbsp; </span>
<span class=3D"s1">VHostUserBlk *s =3D VHOST_USER_BLK(dev-&gt;vdev);</span>=
</p>
<p class=3D"p1"><span class=3D"s1">&gt; </span><span class=3D"apple-convert=
ed-space">&nbsp; &nbsp; </span>
<span class=3D"s1">Error *local_err =3D NULL;</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;</span><span class=3D"apple-converte=
d-space">&nbsp;</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;+</span><span class=3D"apple-convert=
ed-space">&nbsp; &nbsp; </span>
<span class=3D"s1">if (!dev-&gt;started) {</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;+</span><span class=3D"apple-convert=
ed-space">&nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">return 0;</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;+</span><span class=3D"apple-convert=
ed-space">&nbsp; &nbsp; </span>
<span class=3D"s1">}</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;+</span></p>
<p class=3D"p1"><span class=3D"s1">&gt; </span><span class=3D"apple-convert=
ed-space">&nbsp; &nbsp; </span>
<span class=3D"s1">ret =3D vhost_dev_get_config(dev, (uint8_t *)&amp;blkcfg=
,</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;</span><span class=3D"apple-converte=
d-space">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">sizeof(struct virtio_blk_config),</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;</span><span class=3D"apple-converte=
d-space">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">&amp;local_err);</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;--</span><span class=3D"apple-conver=
ted-space">&nbsp;</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;2.37.3</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;</span><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span style=3D"font-s=
ize:11.0pt"><o:p>&nbsp;</o:p></span></p>
</div>
</div>
</body>
</html>

--_000_BL3PR02MB79381131F8ED2B4326A82D7BEA4F9BL3PR02MB7938namp_--

