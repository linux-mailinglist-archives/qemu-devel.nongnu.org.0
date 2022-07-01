Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 192FE562A8D
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 06:33:11 +0200 (CEST)
Received: from localhost ([::1]:59088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o78L7-0006Uz-Ll
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 00:33:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1o78It-00057H-Od; Fri, 01 Jul 2022 00:30:51 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:28488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1o78Iq-0004EP-78; Fri, 01 Jul 2022 00:30:51 -0400
Received: from pps.filterd (m0127840.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25UKaZLO019223;
 Thu, 30 Jun 2022 21:30:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=KhOWPR9Vv+P3xzVEuF7nOgo8RIyCrfc9QZQNzHbFyBo=;
 b=Azfu7Q7YlISB+JVMXiiMrPt4boOlkOLEXOIAn/T2K8GRW2VaS8i0t90IvN9AY+2G3xQs
 YoGX93K1jTf5HaY98sQ0TfAbxSMWOvMCMU2koXaAG0KaMxWXIOtCihtOm3pz12AujMv5
 8FzH0TWIrWRbQbLgRty/RfCvD2q4c8yF8aHcj2o5GCiA85BWhlMJy/Zr5nzXeYIP5KVE
 zIyGlQeWagz4l5/++O0KxCzWHgZE6YU90wukYETj2EW4HAE+AvDiN7yoT1vY8iGVcLcG
 DcoS8TVnkpYm82cOAg5Gd0hLDJqhCH+6ZZuJRAr7RKDN9pKP77H/p+pv6BPruc2rwFaR tw== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3gwxpun17h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jun 2022 21:30:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BPPPKM7GE4aMevjBUf8bj4dTk6nsN9kNQPx5SAJvHK4lmnwehCDnclyRj1sIOTCOeHVEGUfE6gkG2d+vCdg/tlIYb6cWUc4SEv2EHE7BIJUM4Ije3zwAm9tjnIV7s4lAIMvdc6j+7M6i+y7j7X2me9AboJ1TRDCv7jgg+s6zfpOslHlS0oJRZkMhKeuwzxunERCxWJguuuZJpDJlbIIdjPfSdTAmmObE03r9wQLBmN/vy+9mmdIkNummgH1lODIAgBiUrGOtO3IQNr4NJUiXL8ae9B3fgG+VNYGvHFTOX2XuTAhHezPq/z3JieftsZ3fZM/nbZRrpbTegxSsj2K9zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KhOWPR9Vv+P3xzVEuF7nOgo8RIyCrfc9QZQNzHbFyBo=;
 b=S6X2COjFJpzUoAPwL8QqvkBHVHuGwltwKrq94366+hr81i726IxWDyxOqnhvyhni7khMJjr9BHvWcxeekzJgCsFtX1NoARvmerj/vVHSV4Wfcx2nUDabTRC5gu4FPAOYar4KRDa38jGlT5/evG+LP9oCdIu+F/tpGI6dgyoIxs5Dl9ZfiGEGN0Nl1Z0AWktMMA3WrA25rMAbo+V2HI416GYAnoL311epcC/+hpCTk956FQTs+POJibKgHzf5B9rFRqJ6SbKQJ3shdVlYwGSlGuK2KvarmWhizaUUccN7bejqNNNFmhW+ux81SzNreHBqyy2pwlxRvEEreWT4EmXtIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by BYAPR02MB4277.namprd02.prod.outlook.com (2603:10b6:a03:56::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Fri, 1 Jul
 2022 04:30:39 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::241b:39f:95e9:299d]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::241b:39f:95e9:299d%4]) with mapi id 15.20.5395.014; Fri, 1 Jul 2022
 04:30:39 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Markus Armbruster <armbru@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Raphael Norwitz
 <raphael.norwitz@nutanix.com>, "mst@redhat.com" <mst@redhat.com>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
Subject: Re: [PATCH] contrib/vhost-user-blk: Clean up deallocation of
 VuVirtqElement
Thread-Topic: [PATCH] contrib/vhost-user-blk: Clean up deallocation of
 VuVirtqElement
Thread-Index: AQHYjF67NA8c9Xl+IEuiwZXjN6LjG61o7dwA
Date: Fri, 1 Jul 2022 04:30:39 +0000
Message-ID: <20220701043032.GA28338@raphael-debian-dev>
References: <20220630085219.1305519-1-armbru@redhat.com>
In-Reply-To: <20220630085219.1305519-1-armbru@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4ed53af8-b235-4b9c-34b3-08da5b1a73be
x-ms-traffictypediagnostic: BYAPR02MB4277:EE_
x-proofpoint-crosstenant: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gBewJbpPMeKo+w+O3UBGgVhXy3mQoZ/SxyzVbTBWgDF4yV0NnDDUDvtAs4sQVsM/r9tRuMCocncZDnziHh16AhFQmYJczzQK1WzeJNvPRaQHtt2144fJo8rs+bJI3TNxpke543pKU72dzQTJfFjbTwin3vJZVRuGgAbAQzzLHtBD9CAQ27/ZupKQajVupMA7Fr2yWzzTXNPOiyHD67UZaBJju9g7npRiIyqvMOIuvU0yqFmV0EpUteWALUCA7mucDzrU5x5cPL4f//dyepCzUy/lpXHhxh5e+uNj7eVpKpPETpxmlOMnQOGVsbretCl1/hG2yoLQZlaSnTdDSSvoyvLrVCbRYajRBCqrgOzlmGZF5gTzYSCYpG18Lk6pOtFGQweeYVPTaog6HTEUiDTnS7sz8H0/ClNdsO/eDjexxHAQkLDO8AZDUJDdpncwli1KGT9UsSTljx8C0OQfi+nrwKvsjpj6p0r+8Rn8iKuHjr/gxwLoYB+3pizxji0lJHYeZVexhjLF5YaxxbnengPfsiAUYVPBct7qOE4buHVGLDfKEO8hXPihCZVKTa31l1KvdWQX+TUZ5GRCApCk9iqbTJYUzdwHG251u3tu8Ee1a+QnoxVsy0W3aHRdo57XgT7jtLSz/g/knyq0ezbNrXXp8z/w/VV5Z4tZKziDhVD4LfW/BYromUhewTB7jqDw07JUJXDcYoZK4Whs7FpqoWinMx7kyv0596bS8VebM77xtk5hejquaF+uwHibV3UTIp/5gvP1T85XWbXmqSqrXCJRuOOhU1ByuXQOgBkXJ8UGO5G2DjpvajmcMrslzQO7vN0F
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(6029001)(7916004)(376002)(136003)(39860400002)(366004)(346002)(396003)(8936002)(1076003)(33656002)(6506007)(54906003)(38100700002)(316002)(6916009)(186003)(6486002)(26005)(122000001)(66946007)(4326008)(6512007)(9686003)(66556008)(8676002)(66476007)(71200400001)(33716001)(83380400001)(38070700005)(76116006)(2906002)(91956017)(66446008)(41300700001)(478600001)(64756008)(44832011)(86362001)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8FIAxpVRYr45bM8G2C++t6Um1zzylic6FdBSUPLO61qZ+GugpckO6G1AUjFy?=
 =?us-ascii?Q?3K5LGBfXjY3f8PhrDJ/KLMRhjrSkLUrldV4xuEyieD48UstBnA5NtujHKm0R?=
 =?us-ascii?Q?H83jnu8AfI+qkorjJlqGUuoFOtYoJ6xx/BaXEpyovUuYrT/yvORBHHxx/x3E?=
 =?us-ascii?Q?bsSEhL7XNgV63fpY53ASWpzcG6ITRwvJbbMQzBLcB+OAUZ+sXgYaX6CTXJ36?=
 =?us-ascii?Q?piZKz1MRF+HTN0TnoVfsuehl68cJR/Z7/nwBjABPm46aQwnPAGiiTctftAKZ?=
 =?us-ascii?Q?DoahKnGwdq+L3EUxuzQhg3g4KuwYGfd7SMKUPEXTlEN7i1myF6lMqm9w+rLw?=
 =?us-ascii?Q?bPAZp62lYllr50cXbyiJXMlLQx4ZZWWSCml03njSVePmy1ydAcWjrHHh0nQx?=
 =?us-ascii?Q?MDdEm5wi/w94T41gUqc/s/AVSHP/ZRBXYeDK02nFg2LFol8Zw4qnBxkkzPdy?=
 =?us-ascii?Q?EcXA/0qk3Pypk+KaEn19JDBBW1DV9N3iJI/MsechIJIHeZ72mCimkEOaR6NM?=
 =?us-ascii?Q?xcNjGUP8pXkIeb1ArgNr3Gn0qhFY9kuSl1EFDvtDhDJ2s15d2217OmE8bjiJ?=
 =?us-ascii?Q?yQeTlyNMgcsFWHQmM2qvbc+6J8z2hRzgxeXQKFhrQdgAESaxHiPyFg0Rkb51?=
 =?us-ascii?Q?6OybQT4v30tQBrkypn8+PSk36GqqtEi9PTFKx7wu29Ki+oaoKVahbCbsttxg?=
 =?us-ascii?Q?HnK1acBNPeN91yLJvU4M7dDih93KGpXbieXGvq4OpYVOenDSSAhRQVmuJ7KT?=
 =?us-ascii?Q?ZxWe/7e6O+J4wSw9G1/sHZMgiuMGt4fApbMf7BLq4gtldiSXa1X+X46uZkNO?=
 =?us-ascii?Q?jVee0a5XSE0Uw5i+X9G6qKna4eGMbGA3ghv0d4kNRADXMJ6aKYQDUpjCuham?=
 =?us-ascii?Q?PBRA4PWLAJaqDYXs/fhfgJBqjhVrnvZk9SBOUGKmVy+iqT9zWak+w04aVY9A?=
 =?us-ascii?Q?aiihjRSggWwzr4NFlL/TlqE2Tr+cxourKt8+kGdGlTwXu061E9NDHJrKg4f1?=
 =?us-ascii?Q?2BwqEukZPzzDpSVeQmilhj2z6rohxrVb3ddpdHFqy7j8Og6jxspArZp8vzDG?=
 =?us-ascii?Q?fwtxLx62FE0rNZsm31J7/J7YZ7Y0FnuJqLK7Ueyq+Sxl4MTPfcfuv1IdbQeP?=
 =?us-ascii?Q?mqrnIfRMHO2Te4ZqjjJBsfqJLbkxTwY0tn9Mhg8/KvvakiOHZ6UOzGf2s/hL?=
 =?us-ascii?Q?ns0smv9ZHwgJhHqEaz6ic25tsd9ns6k/u3yngru42J4q5ohvZbi9m5j5wogu?=
 =?us-ascii?Q?IJLKuEHfA0apbb7HDfVg7a4sTKrfLHkXW8ljkJdD/FJZxva7Je1R7VQK4wGg?=
 =?us-ascii?Q?u8Qqn3VytOSSppz6qf/srVgmsHynaH5gE6spFsCgFREPvzqoswMkLsFDxvy3?=
 =?us-ascii?Q?99jgSds0GnNR0ldbm/zzDLsMvPiSlK7KDJsvcY6q1dJvRlJfeWjYSVxQDbTH?=
 =?us-ascii?Q?Cqx8fwYW6Habc5pdRCwK+5ZZZIRF9FnovJhqGJmFfuacTNK5woCL1CcnX3jN?=
 =?us-ascii?Q?94bhgtngbNCL8RUhpMogZ3dbHyzecrllbxLHqTltMxRCXyUgDfh+HhL0z3xV?=
 =?us-ascii?Q?cHQ/isP/9MaQeKGoQhBTiQESZSHbelG2p/tWkPDVzAFAr3l4Aomv+Lmg4fLK?=
 =?us-ascii?Q?KT7iFVtKh6z2AHVMs5yBY2Q=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4CBC3722E6D8024CBBD4A6ED9C7C265F@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ed53af8-b235-4b9c-34b3-08da5b1a73be
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2022 04:30:39.5156 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3ffMYBZNcBZbUFjmOPl/N6ASttnmT/667SHiyMuyw2osBny//LaP3lvzmIZ8o45ZH/eGDhNdHjwlHdb8MpQxtTMcQnvPXC0XQ0dAYkkLN/Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4277
X-Proofpoint-ORIG-GUID: MMoxNKGF3gCGNjqrzeOBmguAmM1WO1-i
X-Proofpoint-GUID: MMoxNKGF3gCGNjqrzeOBmguAmM1WO1-i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-01_02,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, Jun 30, 2022 at 10:52:19AM +0200, Markus Armbruster wrote:
> We allocate VuVirtqElement with g_malloc() in
> virtqueue_alloc_element(), but free it with free() in
> vhost-user-blk.c.  Harmless, but use g_free() anyway.
>=20
> One of the calls is guarded by a "not null" condition.  Useless,
> because it cannot be null (it's dereferenced right before), and even

NIT: if it

> it it could be, free() and g_free() do the right thing.  Drop the
> conditional.
>=20

Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>

> Fixes: Coverity CID 1490290
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
> Not even compile-tested, because I can't figure out how this thing is
> supposed to be built.  Its initial commit message says "make
> vhost-user-blk", but that doesn't work anymore.
>=20

make contrib/vhost-user-blk/vhost-user-blk works for me.

>  contrib/vhost-user-blk/vhost-user-blk.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>=20
> diff --git a/contrib/vhost-user-blk/vhost-user-blk.c b/contrib/vhost-user=
-blk/vhost-user-blk.c
> index 9cb78ca1d0..d6932a2645 100644
> --- a/contrib/vhost-user-blk/vhost-user-blk.c
> +++ b/contrib/vhost-user-blk/vhost-user-blk.c
> @@ -106,10 +106,7 @@ static void vub_req_complete(VubReq *req)
>                    req->size + 1);
>      vu_queue_notify(vu_dev, req->vq);
> =20
> -    if (req->elem) {
> -        free(req->elem);
> -    }
> -
> +    g_free(req->elem);
>      g_free(req);
>  }
> =20
> @@ -243,7 +240,7 @@ static int vub_virtio_process_req(VubDev *vdev_blk,
>      /* refer to hw/block/virtio_blk.c */
>      if (elem->out_num < 1 || elem->in_num < 1) {
>          fprintf(stderr, "virtio-blk request missing headers\n");
> -        free(elem);
> +        g_free(elem);
>          return -1;
>      }
> =20
> @@ -325,7 +322,7 @@ static int vub_virtio_process_req(VubDev *vdev_blk,
>      return 0;
> =20
>  err:
> -    free(elem);
> +    g_free(elem);
>      g_free(req);
>      return -1;
>  }
> --=20
> 2.35.3
> =

