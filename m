Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0443C5AB821
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 20:24:31 +0200 (CEST)
Received: from localhost ([::1]:59696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUBLB-0006eH-T6
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 14:24:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1oUAqi-0002qc-CS; Fri, 02 Sep 2022 13:53:00 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:1710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1oUAqg-0005is-HH; Fri, 02 Sep 2022 13:53:00 -0400
Received: from pps.filterd (m0127838.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2829GXRd016200;
 Fri, 2 Sep 2022 10:52:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=daH33TDjvLDjz8+PYJTPxTXRAiUoHvxI22W1GSobLF4=;
 b=gfr52bc8ZCU6oTjsFr9IW2YOIyp8jnVE+5k70Uj/qvfplz3FgiwWTaCfCzQMbZo0WFGF
 G6aqNDKCo3AXTd6ZlJYft3VneU/rTq5r+5TUB2/U8MDQgKBFfQABAyxGdE8RCsErkl9U
 neaclTNGeRriVnyC0G1tgtX2aUnyqTMMroq9AYp+fhG2sUovAZl3BnEm1tSTkdt6Tnxz
 ksRLeFkKhKHIhLSXXNidSPna8bYlAN5MIfUR6tnNF3tAF/Z5sg27iS8epj4iZN2MGxut
 GGoR1uaY/4/tebflZPijkIannr7oAAvN/XcQ3eEOAasTrPACySVVmw687hSqdC+hWeJW +w== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3jb51wstaq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Sep 2022 10:52:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N2SAdkazQXi79H23e1ceoMhdye2dQ17r0Zv1MviK7b9TBRoEpN8AtfywjDpXHHOsWOrbFbpz98RC6WEtqsQtSOFB4ZnAneXRF/brz3h5hm21TEC78QsnaX5BQLzNhA+7IgWIBqRutyH2Mtm51rkFYM/vneUtyfkS29uJXlO/MNlhNWaDgKByXqTZ6PzPV4niZw0QD8yJYFHsyhnc2gzKfWwY6VBKYMeVgAW7inibha8prDt+pkgXp3c9U9MVpDjKHxOKi271TEavvNJxCk9sD6OgbibLkrBvDg7V+H/XZTu7w/e3YteVuSavLDx4bAcz+wQC9oqoF+cir+agKnkvUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=daH33TDjvLDjz8+PYJTPxTXRAiUoHvxI22W1GSobLF4=;
 b=k4Opq4vm7ea1l0GCOdewo5fexa3HAh/hj7dSQu9MmzDsZRG2ynmYuwKBE+nLQLb2gRtNnQAQLT0Ent/QYCiJjMkQr9FN2hx78PKuaq4ywVBdCWm6Ctco/piH3YF94aqTJFJqnANIpbs/LzhBdfhyZXrFHsy58pkdKayYicpM2b8MZ06s4KjXqfnGm8PlZfUZ7jqQCjXjC75fJLcDphYfa4492x5MWV9UUnKb3NPM+NiGiS8lkuRdYSS3GmWaBxjmdvqTpEpAh58B5cZf789VG3DCOs5N21wsCzlpOj7DteP9oeTeBGn/9jux9e/HwRwfiDRSf9DmjVDOGXmZgAgsEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by MN2PR02MB6061.namprd02.prod.outlook.com (2603:10b6:208:1b5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.15; Fri, 2 Sep
 2022 17:52:53 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::e8ab:ff5d:aded:71ea]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::e8ab:ff5d:aded:71ea%4]) with mapi id 15.20.5588.015; Fri, 2 Sep 2022
 17:52:53 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Daniil Tatianin <d-tatianin@yandex-team.ru>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "yc-core@yandex-team.ru"
 <yc-core@yandex-team.ru>, "mst@redhat.com" <mst@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>, Raphael Norwitz
 <raphael.norwitz@nutanix.com>, "kwolf@redhat.com" <kwolf@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>, "jasowang@redhat.com"
 <jasowang@redhat.com>
Subject: Re: [PATCH v2 2/8] virtio-blk: utilize VirtIOConfigSizeParams &
 virtio_get_config_size
Thread-Topic: [PATCH v2 2/8] virtio-blk: utilize VirtIOConfigSizeParams &
 virtio_get_config_size
Thread-Index: AQHYuVjG9kENn35VTUyDwPJ83VENAK3MdvMA
Date: Fri, 2 Sep 2022 17:52:53 +0000
Message-ID: <20220902175252.GB5363@raphael-debian-dev>
References: <20220826143248.580939-1-d-tatianin@yandex-team.ru>
 <20220826143248.580939-3-d-tatianin@yandex-team.ru>
In-Reply-To: <20220826143248.580939-3-d-tatianin@yandex-team.ru>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b85df79d-afb0-40d6-9656-08da8d0bf5aa
x-ms-traffictypediagnostic: MN2PR02MB6061:EE_
x-proofpoint-crosstenant: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7r/D1CkGY9xsOg6Qu9KTfknh/txIF3wegEXjDC1eS5jGVdUUE7v4xLEqWM1AhNAexfWbIQtIg2A46rJkO0R3G9aphHS0j2BT55g99Ge18RkKHSiBrvGNMmjdIiD8tj2OLChgf5Ooxq/hjRoW+8u+xqteXwoAqF5XD0uv+zehyvL4JpSaNFCHwX04TBUfcaNZd+vDPSo58DqvB8JzeIL3MW4kaMzactQUcHwCwOjFEqIZXo4dS/JtkapnEhXu3zMT0j3LzeiJRul094h5Z3VuEhetQaNCLi0GAcyOTYgN2rv5xxJBC6tIWoOdML4cBi99Cnu85uPrqvt8gSHfZxryq6c7YT3YQmPlTp43y63ya8qB+DYjfj5xIQoTLYZw5BhBNT6AltZs8Ab1ES7+6uDVdDYCkw0ncvY5iIAz3VgibX3dhSSzOeOM322H3IacYTB2v6GO+EXTYuABhOILPl0tUkCzb56FGaK2Ad4WEBq+ss9VPsgciQXPxi4bIaY8cN3iHwLbDCCvO4+UTNvjXSexePyyX1T4TeHeNIFOYq/GWuRy7IKadSqJVmLdiEK8aX9cOIugXOkizibemHV6gB/XSyhGqE7NfXQbpexefta/PF5MacA1gBIvI+sPYTo3F4nfVDIthaonXrx7rfVuLLyPunw9/ibsWFbsWBpsE+rG+HDILIRvxc6wU7pyvWPGH/WbLj9EX1HYDc04Kiktpfnincr4NAHbLX4apjGflvhKCnsHXr/JQPPfal+SAzc/UVuFRR9spyxDhV+EmWO5WiW8cg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(376002)(39860400002)(396003)(366004)(346002)(136003)(9686003)(6512007)(26005)(1076003)(83380400001)(2906002)(5660300002)(8936002)(41300700001)(478600001)(33656002)(86362001)(6486002)(71200400001)(186003)(6506007)(38070700005)(8676002)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(44832011)(6916009)(316002)(54906003)(38100700002)(33716001)(4326008)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ezVnvPlrA8coor0Uc3Ha7ny2xQG2+yBnSLHIoAqShXjx6e0Ik6UlHJjXf2e4?=
 =?us-ascii?Q?gBJfqDKAHNseQo4IWufPaHH/MdJiwveiTeiNQ1KKZ/3bcm1bPz5s8mlLPek6?=
 =?us-ascii?Q?oNX0K/MVZQpOPIJSPUppm2dPDL2mnou7+Vx+JAsb1stu5R98TEd/gpYRxsqo?=
 =?us-ascii?Q?LNwkEJbt9Ttjo4sXgZPLSeCTRqGQr6NM7BHw8nCsoXzBbzFDqucFMaRGnlwe?=
 =?us-ascii?Q?wkQJWCLzquQv8vcbu2daUae5/jEGhZ9ZmAlU+hFBQktLVZrGnyI1h2dNh3lJ?=
 =?us-ascii?Q?iHMs+4g9ZOShT0fWPdqG0nPWlAlkMgNtbZTXEzPkMppXJxeEJLl0QZvsH1Z4?=
 =?us-ascii?Q?f7NkzBdgBGgR48m+Xnw1Xz0iC2ckIoDXHLjbAZARbjCIeSvpmb9Fq1jNvQ6O?=
 =?us-ascii?Q?/StlNDCw9CwsNjEwpUSNAEonJh2bOmPaWdcwL6TgxR8XEXIuVyYCRphLT09k?=
 =?us-ascii?Q?EGENeuwQP6fPptapgxszCN/5NbgewoMqRsPx4Bnc9cRQS27T+0BlVsWUQ7Ho?=
 =?us-ascii?Q?bFMHbw8yeKUDP0TaMgUzjciJDbmoxJZbCVi7BiqrVVPX0gwbIHoWjMZNzstb?=
 =?us-ascii?Q?hO//nL7nLcZCPNzotxE72i9/Y+e6IToMtecmEVvml0hWKnsmcLMxdP+AjhDf?=
 =?us-ascii?Q?X97V+myqxFXlpToGNbPgHFUuTFcRYy7jYOBmMxwD21hm9PJoeUvh8dFS1Ahu?=
 =?us-ascii?Q?LqR8t+sdZxFsAot4ozdamGkQNyn52hubzuVhq6z+RalE/z2to/ijDs0s+Frb?=
 =?us-ascii?Q?XUVR0ajPIGQI+7+JWwjc2BAiWbv2ioWE2/w/3yuLE4rmFhawibxp7rqd0noB?=
 =?us-ascii?Q?I4xMr5aWqrhWuUofiMzJNu4RVj9iFP0B79DTrdnan9vSuaVnejA/WFoVZ087?=
 =?us-ascii?Q?En14xhrw20gFRm1mzNk2forzpuavg865uUwFnkm5oCceMFk8Yqz1g348rQ9y?=
 =?us-ascii?Q?rZ0g9y6cUjCXCYZiLWfXuydWnw91jgaG4gv0euCcB0eZ2WVN0KxtVZbP9L1d?=
 =?us-ascii?Q?GlmctAVDXKEiX9eW4X0SojyfOsUr4PD5cTG+kd2IcdbEA5WDFrvDBZBMQWMd?=
 =?us-ascii?Q?rqD/YeMR++JBjJDA7vNvEdXefxpaBfdY32PYzSKZOugFzVh4o1+J/UHsYMTD?=
 =?us-ascii?Q?7w2HDvVL6m1lSH9q10pF3oW4CG2glbNuA3tn3j7mywyRjdd3tlmdZs2KpF67?=
 =?us-ascii?Q?wWjRb6DtHWZMjxSBZ1Y0Rqeu0kx+CIRU3wbb2JNLouCj45fkJR91FZVcjl/M?=
 =?us-ascii?Q?j9FRcKyFHqxLAssa3BLojdc343Qd8NYOcFPsHH5Gh4/ucxCsZ0F7cBudoMZ3?=
 =?us-ascii?Q?eAsH6rmCobofn1fR6YO3e18bYwHBdR2vagJO5JTlXq8T6xMat6u8gb1N72Qd?=
 =?us-ascii?Q?5FRkAGeEvdaTcPhpm/eX4q6G5bPuZFnOobvsQvJzf2xFEGjTh+/Qob70Nwe0?=
 =?us-ascii?Q?XaOcrYq9IXUZBTPSOwLFM+YEqt/walOqgLjqPtq/S+g8FZHk7SGWDiHrI+IZ?=
 =?us-ascii?Q?xPVAif8noPXqBF1zrpTsom08jKLzZZVifJRLCalWxVbZfq6FBFirtcL4I50u?=
 =?us-ascii?Q?9t6IVtx0zDUPxdUXfO/l8wI3PhweNUf3K8tvEmr2/dhxYsygi7HLehLj9VYE?=
 =?us-ascii?Q?N6advXWBJYeaVkyruHVZO9I=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6E0076EFEEE62242A41D45C7C94521AF@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b85df79d-afb0-40d6-9656-08da8d0bf5aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2022 17:52:53.1475 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7V7xDH7bmWCXmwrF/5VpmBbXVTLYvJFcdLPiIDVuGfI3cjdBJ8OpLXeyHuQcnbhZqTjV8Z0ksZTOnDFH9eUQnBHziDpFimfThdxHhXboOGs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6061
X-Proofpoint-ORIG-GUID: _rwxD5egQveuKCJCBnPeF9xDoRnnorH5
X-Proofpoint-GUID: _rwxD5egQveuKCJCBnPeF9xDoRnnorH5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-02_04,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On Fri, Aug 26, 2022 at 05:32:42PM +0300, Daniil Tatianin wrote:
> Use the common helper instead of duplicating the same logic.
>=20
> Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>

Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>

> ---
>  hw/block/virtio-blk.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
>=20
> diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
> index e9ba752f6b..10c47c2934 100644
> --- a/hw/block/virtio-blk.c
> +++ b/hw/block/virtio-blk.c
> @@ -49,13 +49,11 @@ static const VirtIOFeature feature_sizes[] =3D {
>      {}
>  };
> =20
> -static void virtio_blk_set_config_size(VirtIOBlock *s, uint64_t host_fea=
tures)
> -{
> -    s->config_size =3D MAX(VIRTIO_BLK_CFG_SIZE,
> -        virtio_feature_get_config_size(feature_sizes, host_features));
> -
> -    assert(s->config_size <=3D sizeof(struct virtio_blk_config));
> -}
> +static const VirtIOConfigSizeParams cfg_size_params =3D {
> +    .min_size =3D VIRTIO_BLK_CFG_SIZE,
> +    .max_size =3D sizeof(struct virtio_blk_config),
> +    .feature_sizes =3D feature_sizes
> +};
> =20
>  static void virtio_blk_init_request(VirtIOBlock *s, VirtQueue *vq,
>                                      VirtIOBlockReq *req)
> @@ -1204,8 +1202,8 @@ static void virtio_blk_device_realize(DeviceState *=
dev, Error **errp)
>          return;
>      }
> =20
> -    virtio_blk_set_config_size(s, s->host_features);
> -
> +    s->config_size =3D virtio_get_config_size(&cfg_size_params,
> +                                            s->host_features);
>      virtio_init(vdev, VIRTIO_ID_BLOCK, s->config_size);
> =20
>      s->blk =3D conf->conf.blk;
> --=20
> 2.25.1
> =

