Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1634623DA
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 22:59:26 +0100 (CET)
Received: from localhost ([::1]:50316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrogH-0003aW-Cs
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 16:59:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1mroej-0002kR-Hg; Mon, 29 Nov 2021 16:57:49 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:2106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1mroeh-00007l-28; Mon, 29 Nov 2021 16:57:48 -0500
Received: from pps.filterd (m0127844.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1ATJb3Ag004540;
 Mon, 29 Nov 2021 13:57:42 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=OJkEyKac6VjtPgI6xUI0pQHmtIcKn9OpywBR89YiClo=;
 b=wxyQTAuissxM4tmm8A95wg7GUnXLiL9n5iHO2sLpjUlJxdXn31CUKea2YqsASHvmEZo5
 ooXU+18Ksm/JaMNYMQDOE7rCb/rT6AGnxyXwlez82w5Ex6kdQKpNLrCyZ6QwaQPUtmkR
 z5CVDCY4Ul9vJsRTtja6UqEc3OtIdt0E9QtoNz1XI0578B9MhVK/8bCJ7EZ0BBsauHqC
 ch9HbZOShd646226AEZKR1CjMfxWJq2G5+8vEE04XWuw+T0D6LTuz734Dqm2xPtYqcI0
 375Ex9dozYm4OkjT+FuVmFjNYJiQcs2/643AGmLu5MPzzrRj6RH+wnFF66ZPQEJFa82m BQ== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3cmrbw9ta1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 13:57:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RjbGpb6J5U4nmHqBWVu9lDNX96NDaeliEtIy4DTGYdJz0/CyfRjxZRNKHUTTvnBXA38/zkzpSz3QUk3k6wLLKPl64nEFRe4MZ8Tw3Mq8plYZe2SzrJzi9kyk19NvviyTQNTowuMjmoiR7RyU5a2FhscelRFl4Uux1EyZerWPUnK9gOpNgRrgtifS6qZ2b8NPG9YSlOlq7jpqWGsrHsIB3pSi0KqJ/zKqiz4naDAGDkSFJP20YJV2bV/g8vinr/jO5CJhQ79dvplewB/mhlILNj3BeuAUiaJy/0HmiCBlttMw0IFLHbkt2OKZXlKUMao+lCcW52blMUDOfyJjXw++dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJkEyKac6VjtPgI6xUI0pQHmtIcKn9OpywBR89YiClo=;
 b=Uec1AHi8vZm1Jh0K9vaEf6kSgLIdRoSbWTaF4cYGrXugvDjlNVmojZLYlHYvArGOo2pu4SYgAkZqEuOv+uhNZq5DVBK4IbUCUWk6xM0b5LVxF4b93oMUCkz7/G39qMsUj1pujn9HQ8M0r1YrxZQ1a7lPxq7TA2P6Nr+wVRpvcWb0/6sxYTlfTl+reQhVYJkyImaIf0dOZuKfgaHkKNTdFIyY89cjCd4bvB9ZDPQxkreAqADoR+NxNt8/NpdbL80dXRA0xG1yJHU6wN7IdOLQ1iQKOPn9gYcEuWN/v8dEXyItMvSn/cUMeZr+iXiMu5TArCGS1sAlgISB8Jn9N0Bbbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by BL0PR02MB5380.namprd02.prod.outlook.com (2603:10b6:208:36::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20; Mon, 29 Nov
 2021 21:57:40 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::25f1:c1cf:5f90:35af]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::25f1:c1cf:5f90:35af%7]) with mapi id 15.20.4713.027; Mon, 29 Nov 2021
 21:57:40 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Andy Pei <andy.pei@intel.com>
Subject: Re: [PATCH] hw/vhost-user-blk: turn on VIRTIO_BLK_F_SIZE_MAX feature
 for virtio blk device
Thread-Topic: [PATCH] hw/vhost-user-blk: turn on VIRTIO_BLK_F_SIZE_MAX feature
 for virtio blk device
Thread-Index: AQHX4m9+IYUGhcVMdU2sZbuldi6YsawbE1kA
Date: Mon, 29 Nov 2021 21:57:40 +0000
Message-ID: <20211129215732.GA5722@raphael-debian-dev>
References: <1637892018-89555-1-git-send-email-andy.pei@intel.com>
In-Reply-To: <1637892018-89555-1-git-send-email-andy.pei@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1cfb273c-016c-462c-6897-08d9b38343a7
x-ms-traffictypediagnostic: BL0PR02MB5380:
x-microsoft-antispam-prvs: <BL0PR02MB538019E8B7E71CDA09518B2DEA669@BL0PR02MB5380.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:270;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: B4iXZMAAsMfrK/SI4S0zZGXte9Q3ELbmbw076YSMPfk8EnXvolRAEs7yjuhbJPD7kV+QB5Eo46T5HRTcYMynSzBLBSs76HDmtxjvh059Cugor+1eJLngtje2ruBhPABgphf0YW/oatksglboZPQTdGeXpN0VBEgjh+gvkknJwISZLvecQwg9UoeLpXO0cW5AvB/Nl33OUcuc8RUxcQa5K+5EEZ6jPWVcPDjAoy71emTyZBBBTxLTNI0fv/UX9On3lP7Hs5ntWCMAYKoRc9Zr/PDyNxCt9u+6XBCgVA3kpfhfAyNxSjDDKNndcZg+d8QZq6hS58SVnHvuB1BDOj6QVgtFAI+M9JBPyAdf8thzGh+dT/jvQKrAoV2ThQHs2VGseUhAK64EjGu2Gb3YQuFZoG2JtwvtGvYxtmsXRkMMOHAAPlPgbJeF3UPj5NsttfsnEH87m66u5bm/+jxg5hORRdpkmw1HfTGwpjotWkJ1nKKiQN9U13t2QRRcKs7SKtRoJczCW7KKzSapwXkw0T4GMjieN/asTup3iKUasNOkWia0rAmNmg6B3dVPe2+UpCMTbfNyE//X1uykX7fCW/8+mJm1SFwnSvAtCsvjanpy5dl2y5QC30ldbPurw2MSOWHezWmz2JrWHE6PnkIZ9E5l5tOqZaFBwsbMujpgJS9GLnmKWJ9HMpZdlEhFYeZOg3mDgwRUKokipMonn+MGFa+Vpg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(366004)(8676002)(44832011)(33716001)(5660300002)(2906002)(316002)(91956017)(6916009)(76116006)(54906003)(6486002)(26005)(186003)(8936002)(38070700005)(38100700002)(66446008)(66556008)(508600001)(4326008)(33656002)(71200400001)(66946007)(66476007)(6506007)(83380400001)(6512007)(64756008)(86362001)(9686003)(1076003)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?83sW07en/z9mRwFvmZqxeRGiKRnf+hF3snlW/Wp6My6DINto+zl3+csUNIU7?=
 =?us-ascii?Q?NOrgmtcuxkP4uxtICeB1d5lyyqW5SkGIwop+hLlF5889W/lyj20ik8p3B2DP?=
 =?us-ascii?Q?IHHYp/IQ3yxReKVGn4zehPc3Uga+dmZmGvmaRLvYDOJeM5hpptuQ9uyAmpNs?=
 =?us-ascii?Q?8ElFy9YGD+f34wGglRFQSvMDAUSX5opZMWB7DnYxv+HWKqrsWaq9XLZXG2mG?=
 =?us-ascii?Q?xKJMbuQbPSLM0IyiSSg7vAh9GdPPOc9xdFuc9bAOaDE1Ml8Ob9rJsy9Yp0jP?=
 =?us-ascii?Q?emmQksQP/hANqytRwoRs+GbytoKkZeTfhYDrR41jy7cEMh1QWKOE5b0i/PyX?=
 =?us-ascii?Q?AugylJxXQ93o9ooiCZvAndaiY6cvITr1IINei6P5sPtbQdCDhq4LCro3+RKb?=
 =?us-ascii?Q?MGYGC96lLu7As3VbLSqLwBTdmvfe1l4h0GXrMiE65ZWT6q+i8zJ2c92k9fZ5?=
 =?us-ascii?Q?yhFIMYnlZP1chdw+P8lGzD5QPu5xOK2bUPNBbpWFtFmMUtusAV6c44CDDJSS?=
 =?us-ascii?Q?1GR0+3SoDXzGpF8ayKoMLYEEEiZLp5H8LDt1yE8wiM1219Xe4WDUhbpTI6H5?=
 =?us-ascii?Q?N0EiDuechJrkeBRuYA3Ir7UXgLyg38Ikv6m/WjTg4188piyN95WEEFS7Kr4V?=
 =?us-ascii?Q?f6P4nK98zeaI92SgNjzgZ/lYHjaPuFWhkGtKrv78X55DMBt1wzKx6T7Rhr9B?=
 =?us-ascii?Q?1ahQpFeC1nHpqDiArU0H7eg9TQKhLw5KBBgiGS8FRnr4USvc1gvFjsQzgnYD?=
 =?us-ascii?Q?T822jJH1P1IZpkgghnR3BsJcXP1oyScIJAerF/V4CYvVB3cWxujd8Mwmp1Mm?=
 =?us-ascii?Q?t0AeJiPgwPBEPVaNjU7apTcYSu8lPFePtJByJdCmnGdV2HF9TvQLgopL1Lk2?=
 =?us-ascii?Q?hQjuSYtKA9CkH0e37M1epVaH/LKP0u90UAe/QvzGItGYgJ4IXv+pFOvWWAiY?=
 =?us-ascii?Q?lCPh9x9wxE3fIeYGfvlas44cq4o6Pzo0cNPnoJUat3TNU/6Ylu9DHtScVvxd?=
 =?us-ascii?Q?xN0lptgL62SpZVaCaMSNKf24OGhVGIlvo98JLEIvhlcGi/gsIvC2unw8teVq?=
 =?us-ascii?Q?GRNE+/1LwPqU2dMBO/8nvwwOREuwHbKdMGv6+8WZIf2hOhczMz5yjPEzH2S5?=
 =?us-ascii?Q?tqaLzLwmzdJWLfBE8XHi8QHQOZyLy9KS8gf+uTs0mFe4vCGTClBJhb6JV1dj?=
 =?us-ascii?Q?jIketKHBDE8lBSLwK4SksheYxkfu22wrSeoygFwRAVTCoEEqQMOs6tiIiQUG?=
 =?us-ascii?Q?lXlBdDrFqSRdoA5dToPbx+t9xLGLk7WxBTa/87XcKKXyKNXlSV9BQH7RQvX3?=
 =?us-ascii?Q?IDEw0WdOek052Ra5zTkFsoKQpwGoydO31hPkvw4j0phz7MjC+2JcuzFLIkGu?=
 =?us-ascii?Q?fZ5RbLrMW9aYBcGIBXQoASLQacEI8F2nQM+OB5SH8INW13fGQrv1lmeQSrZb?=
 =?us-ascii?Q?wWQ9c49hL5E4+IA+99SrY9T+ZXFUpdbqTR8M9aa4SC0ggQcN4qqqqGWuXXdA?=
 =?us-ascii?Q?92Btt41VxkZKIVSuBOAoSDypzICGPekAT8NjZuGCKJ14Ox3ahaOqmZU/GqZG?=
 =?us-ascii?Q?8JGKl7153BH/W5r1O5LU+ei6j8GQ11fJ3H5//0MDbfgBvkxxJBge3glORS2b?=
 =?us-ascii?Q?XPAZtxqRTjB7pE7i7k7bMEeXraoSE44zB/2rUwmcJsaqLGsdwlO2rnWOmuC2?=
 =?us-ascii?Q?4qJh5R7umhGJ6C2YykpVsrH0oA8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <770ECE79724B454BADD31BB825C3DFBD@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cfb273c-016c-462c-6897-08d9b38343a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2021 21:57:40.5603 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2iVMYb3ssPJWgcAjlqNALnOe2DLTtcIZlc0SAV+nnKCfSjBtVia3sSX6Z9060viunFpsS/wq/CkdFLMld1VlyY0+6s/N3lXL9LWdhdm/kOY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB5380
X-Proofpoint-GUID: VRDI03sbNmbjeH92s97Z0ldI_AQqAWd7
X-Proofpoint-ORIG-GUID: VRDI03sbNmbjeH92s97Z0ldI_AQqAWd7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-29_11,2021-11-28_01,2020-04-07_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: "kwolf@redhat.com" <kwolf@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "mst@redhat.com" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "mreitz@redhat.com" <mreitz@redhat.com>,
 "changpeng.liu@intel.com" <changpeng.liu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just a commit message nit. Otherwise I'm happy with this. OFC should not
be queued for 6.2.

On Fri, Nov 26, 2021 at 10:00:18AM +0800, Andy Pei wrote:
> Turn on pre-defined feature VIRTIO_BLK_F_SIZE_MAX virtio blk device
> to avoid guest DMA request size is too large to exceed hardware spec.

Grammar here. Should be something like "...DMA request sizes which are
to large for the hardware spec".

>=20
> Signed-off-by: Andy Pei <andy.pei@intel.com>

Acked-by: Raphael Norwitz <raphael.norwitz@nutanix.com>

> ---
>  hw/block/vhost-user-blk.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> index ba13cb8..eb1264a 100644
> --- a/hw/block/vhost-user-blk.c
> +++ b/hw/block/vhost-user-blk.c
> @@ -252,6 +252,7 @@ static uint64_t vhost_user_blk_get_features(VirtIODev=
ice *vdev,
>      VHostUserBlk *s =3D VHOST_USER_BLK(vdev);
> =20
>      /* Turn on pre-defined features */
> +    virtio_add_feature(&features, VIRTIO_BLK_F_SIZE_MAX);
>      virtio_add_feature(&features, VIRTIO_BLK_F_SEG_MAX);
>      virtio_add_feature(&features, VIRTIO_BLK_F_GEOMETRY);
>      virtio_add_feature(&features, VIRTIO_BLK_F_TOPOLOGY);
> --=20
> 1.8.3.1
> =

