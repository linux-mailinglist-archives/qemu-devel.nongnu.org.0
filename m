Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 588F65AB820
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 20:23:35 +0200 (CEST)
Received: from localhost ([::1]:37342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUBKI-0005yJ-Dr
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 14:23:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1oUAvy-0000He-Kp; Fri, 02 Sep 2022 13:58:26 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:17494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1oUAvv-0006Yz-S2; Fri, 02 Sep 2022 13:58:26 -0400
Received: from pps.filterd (m0127841.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 282CD9pO025193;
 Fri, 2 Sep 2022 10:58:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=OZ7Hu1lqsUCQVdbfN1HgXYQO9iew8V6P2rq+89yeLM0=;
 b=kfZ5aLjoMRraM4m1814l9gO0lvqvY0z3QZW3bzszg580IbUcMHoWmQwJMp0M+C1OSE3v
 OoEHRBA3iXMZDJRoynuy+ETk3Xd35iu0OwmpDT60xISUNEmpy+Vf/FID9Umkw2+H9vCW
 JdbtgHgy10dLXkLPyhbKHzcyAVd7XQawvQ4uTKIOs+ZZAZzmY+NeFLfoeG31j54oN8O4
 q3cazeNKGyXKK7SuwVylUOYJKIbd8y56lSGL/K60hykilhgt2rCDPHKKD/qCvtxlaOsY
 cYYzB5aNLEVIgfpipmI9oCHQ7+H5hAi7AWj7pdwtN3GRUhHzmqoczhQJXz4fb74RjdIZ 5g== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3j7gt9evhs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Sep 2022 10:58:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lh3N1GRbrH92ckTXb57RDBhCz+JFDNLoGtxv95e6LGqZ8jJk36dEX4Ya16PFlBR3mZ6rS6z9H7grTsFcdVx16ihHL913Sdmbu7CRldklsmVWjPzA8TEm2GPYgLoa1ne0xUEKcp5F6nCSrnNhFDSvHtKLnRev+wohXyjiDSNL+1KIfWORcvCTOBUYXZ/HGtqgCTqzulxmtppKDqeVQl+vTvHT8Xi6n7UIXcLXNaDdoW4TKUYYVHmDkYx42rtNWMAMyliBLJClKd67lhwO4S53WnDuW8UDWbIMGc3l44YsV5L3bOccJ4reQo42jZlCzPHLQC99+mZ56yTpJ3uppgkPQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OZ7Hu1lqsUCQVdbfN1HgXYQO9iew8V6P2rq+89yeLM0=;
 b=MbIU+RhSzuoBz/rlHLtkyfAaRMA4rL92L9Ah5z31PcHspbkwrFutWLY3oE8n+jEJ070k7O+NumbyJ9S7suRSZFTDnpNu3MvzE5jkmSn81kEGCrucIarPS464DT9AbJ7g/cJuweKdVZi7ViBGpOMBI3ICnXIDnuh7FMU8CgncY3KmHZGhzJqxrpHfP0aoTxoLOQecsDQUmyCuv2I7oCFHZ/K1bKmWGVaCftH7lIS59wuoRrdiKBraVL1KMERusSvTRFEKW+M3e0IHbTltKIa9Huh9g4EBeku4UcFHyoJ2gFSaNLRAAg8cN3voUj4+eU3S0nd+WSYbEkxfyjgc5MZ+QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by BL3PR02MB8866.namprd02.prod.outlook.com (2603:10b6:208:3b1::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21; Fri, 2 Sep
 2022 17:58:18 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::e8ab:ff5d:aded:71ea]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::e8ab:ff5d:aded:71ea%4]) with mapi id 15.20.5588.015; Fri, 2 Sep 2022
 17:58:18 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Daniil Tatianin <d-tatianin@yandex-team.ru>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "yc-core@yandex-team.ru"
 <yc-core@yandex-team.ru>, "mst@redhat.com" <mst@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>, Raphael Norwitz
 <raphael.norwitz@nutanix.com>, "kwolf@redhat.com" <kwolf@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>, "jasowang@redhat.com"
 <jasowang@redhat.com>
Subject: Re: [PATCH v2 7/8] vhost-user-blk: make 'config_wce' part of
 'host_features'
Thread-Topic: [PATCH v2 7/8] vhost-user-blk: make 'config_wce' part of
 'host_features'
Thread-Index: AQHYuVjJXMCCPfozLEyk0wvjx9P4AK3MeHaA
Date: Fri, 2 Sep 2022 17:58:18 +0000
Message-ID: <20220902175817.GG5363@raphael-debian-dev>
References: <20220826143248.580939-1-d-tatianin@yandex-team.ru>
 <20220826143248.580939-8-d-tatianin@yandex-team.ru>
In-Reply-To: <20220826143248.580939-8-d-tatianin@yandex-team.ru>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 83a24541-0614-46f6-5cae-08da8d0cb74c
x-ms-traffictypediagnostic: BL3PR02MB8866:EE_
x-proofpoint-crosstenant: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UO/duqfOe5Ui3fFMgPAn71TlPOSQpsF2+vUFsO1fIVMyyFqs5GuAkRPqtSI1AQW2iGhSACOtcnA+STpp9bBoy37brXXM3t+aXmX28QPHBa/qP0lw/U1/YBXu7bINs8q5KCdWwtcCnhhjgLrOePV5ifDzKdvtIW0eUSgu1bXQ1KywgOkto+DcaiTO8LnUC26y1LNuubcjPpbdHNz5/2elNe/Ey97DikM4VxuhJF+oNUJd3AVn4raf3jdA6w8RGa0azOt+a5vAO4edYfz2J5Jazu4dkVhorFcvTwWppjbxm5m1/ZKcXt7QyOHTCQBjL2ac94OtH0IwUp4bf5nLX/NcM3MDHa3Oak/GQ+s5d5uexK6MD493GKtTYLODE28PgutJLkTyX4P2+NtstXf0cXJPuw91hcLzV3vCB30ZLMcU+ywtgWtbf9q13uIx2cgr4y+cpkhgsFdGi/ch5OtJQs5jaCWmts5PptWoMmS/DEkIuJzfi3VZdwKpbNJ6Xz1AR3cGs5Q8rigcdNhPkRxUs5bKay5OP5T6nfU6DVx96aKfzsj+KjudfpVorU8O2wAa4cqUFJS7XIb4bMrzLa2oNXjZdWgBnvxH/kqyhqRhS2gjt6wCtSAAT3AH7QnMV//ZONrRxETTR89WmDngn2eQl5wVvmVBRmPikPYAxDxGEDJ/f/dkhU3fvgd4qciFSeG2djVZhL82cCqSq8BYJAKm161D/hgIwkfyR3BbZnTDLW+Axg12FkF+Ad+ifjRv2A+1cf0l5OFEvqwIuTueFsY4CgH+HQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(376002)(346002)(39860400002)(396003)(366004)(136003)(5660300002)(6916009)(41300700001)(8936002)(44832011)(1076003)(186003)(6506007)(9686003)(6512007)(2906002)(33656002)(26005)(86362001)(83380400001)(478600001)(71200400001)(122000001)(76116006)(316002)(54906003)(38100700002)(38070700005)(66446008)(4326008)(8676002)(64756008)(66946007)(6486002)(66556008)(66476007)(33716001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bPYmwLZ7+cjE9KxQAJx7ZJELQGks4zRdXvBSfHYb5/Lx5GqWiq1pd0f3IWR4?=
 =?us-ascii?Q?5o4/UKY//+UHsNsycbq/X6FHVe1G25ZZpKIGxnMRpVD/9a1T7t7TWcku1huX?=
 =?us-ascii?Q?22g18Y8AOK3PqP6LO06lz+lbLcvvLR6kkkxj4ZFO5kOkoRzTFCsY2McvqIm5?=
 =?us-ascii?Q?zJ/mAT1r+sdA2mPXJOw0b7TvAvySG6pXALYnhF/PPVCaD1gdwrTx92E152Tw?=
 =?us-ascii?Q?yxMWix5etcpT0//ZhqPrkhdYaoCIkxR7WnE3pGFB8MYkxRVSS8+Ak2qaIlLS?=
 =?us-ascii?Q?MUAVWwXxTcJGs/gZGkh/pOTlp1afToUKIw01DNjBfFakWaDnGk+i54HEoJi6?=
 =?us-ascii?Q?rMy9sJk2GMZeBrIFqFLKCxV8PeT26bCWU0eYEW/O4YW++Y96+ogGMfqVdPQL?=
 =?us-ascii?Q?0TL7hLdKTJxBkpnFtkPT2KwjydSfU663XeVYxl4VdQBBctaLFVbzIpwJOdVB?=
 =?us-ascii?Q?DobAeWeD3j2oRYt8VddFbPNU78ibHOQi6oHnoHcLuSLrPXgdiktBHQkBeZB5?=
 =?us-ascii?Q?AvlEjcz9TpTKcU4fkIRl0+2HsrUFGJLnY/k6xGqYA8/hMUaxXRbTeRqowOma?=
 =?us-ascii?Q?0+xk8HEFUD0UDPHcJMohbDap1OweNfy6jdk6Fu9+NWAtolbnVaSX0DfsF1rc?=
 =?us-ascii?Q?lKXuMhg9lr9GiHNOMV6PY5C5ZSMafChw8VubEpYspzmcFWq/d7R4nwbV3bpm?=
 =?us-ascii?Q?m3vt1PsTV0H98suVCOn/K/0NDh30uXPGhvrnddFn4cql8P6+hNWQNnXcsJPy?=
 =?us-ascii?Q?f5SXuqLkBfFp+SWdnjZhQ0ro10R/yIT7m2+3N9kcvQqsqZNtmG5Wyua4knAZ?=
 =?us-ascii?Q?0k6K6y/MDriW9+Wr2HWQDA4ZV+1cRmyCDxKQqoVmqGtU6JOWVMd+sVObRl1K?=
 =?us-ascii?Q?8Ecz7VodNbaPx60Rjvt8stjFac+EledzbjggOxpvk9I1lCQpHaQMaUblIBQR?=
 =?us-ascii?Q?8zadEfeQa8UDG7LZ44ht8TlE8Z6erlNQVtbXBrgVhbOpItKpaNKbbvRxdV1q?=
 =?us-ascii?Q?uXFywy2fAx7G7NyD7/So+G1Fa0SoWFcdaz13+PtrwCk1t/JFSqy4LwnOWzml?=
 =?us-ascii?Q?2/POIlU9NmYr5knel21+pSm8FNE6jTAs921kOeq7Q7zgCwRqxPfD81Mbczak?=
 =?us-ascii?Q?JlBI+H9ejOCnWYhxaRw6OR3X+TGh80Tp/TM2DrMCAS0Zp5S4UAvNygjVaowz?=
 =?us-ascii?Q?R3CwcSFQU7T6Idg3Z2Kq62qtAx3XB+ym4LcH2ykpy2M9W28koHOYfU2aKT0p?=
 =?us-ascii?Q?HoOEeNp9uZhDLvZXNYQvMP3bU1lMi80l1b7R0mdlfjMMVJwz6kjaDBGKAFDZ?=
 =?us-ascii?Q?PALqy+/78yEDbKEN5WKUCqIknngDJ6dUrKRYTcdvA1dSreChzhTd+hWsAqwb?=
 =?us-ascii?Q?xNOjdtPTggH1OmKBWJgornqeCcLZhJu+xCZhLvx4hZUtTW/sPVjxBAWHdkh+?=
 =?us-ascii?Q?snqFpzhHHrwqirphbdLHo0BzR1Eun7gQpGj73ZK5T6sNRWleuz3W8EsFEvyS?=
 =?us-ascii?Q?NO8qni+WQ2Y/TsF1JJdWdlKQ8Y3Tuhu7HH3J0yNRhHuZ0IvImjgPHaIwb79H?=
 =?us-ascii?Q?N+zDfxYe9F0e3rrrOofDuXuiTzV3qcoXHFP/YJwiyDtk5wsfTiKmv1HwQnJZ?=
 =?us-ascii?Q?JcoX316xn7OAcWuJRI+kLk8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E7146496B826054BBE998FCC0C8B698F@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83a24541-0614-46f6-5cae-08da8d0cb74c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2022 17:58:18.0549 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: azotUsrWFFZ2//+0paWyBzvA+fi++q6dzFNHJ2Z4GsGbmXdIr3ek+4RjO1xX5NzEhVDcNEpTyaRGQ8Za6g7NQmd68W8M8yHLePuoUtVA9Mk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR02MB8866
X-Proofpoint-GUID: Hv_89r09RZ4cmNLFOT4U2De87VHvm3yB
X-Proofpoint-ORIG-GUID: Hv_89r09RZ4cmNLFOT4U2De87VHvm3yB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-02_04,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0b-002c1b01.pphosted.com
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

On Fri, Aug 26, 2022 at 05:32:47PM +0300, Daniil Tatianin wrote:
> No reason to have this be a separate field. This also makes it more akin
> to what the virtio-blk device does.
>=20
> Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>

Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>

> ---
>  hw/block/vhost-user-blk.c          | 6 ++----
>  include/hw/virtio/vhost-user-blk.h | 1 -
>  2 files changed, 2 insertions(+), 5 deletions(-)
>=20
> diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> index 4c9727e08c..0d916edefa 100644
> --- a/hw/block/vhost-user-blk.c
> +++ b/hw/block/vhost-user-blk.c
> @@ -260,9 +260,6 @@ static uint64_t vhost_user_blk_get_features(VirtIODev=
ice *vdev,
>      virtio_add_feature(&features, VIRTIO_BLK_F_FLUSH);
>      virtio_add_feature(&features, VIRTIO_BLK_F_RO);
> =20
> -    if (s->config_wce) {
> -        virtio_add_feature(&features, VIRTIO_BLK_F_CONFIG_WCE);
> -    }
>      if (s->num_queues > 1) {
>          virtio_add_feature(&features, VIRTIO_BLK_F_MQ);
>      }
> @@ -589,7 +586,8 @@ static Property vhost_user_blk_properties[] =3D {
>      DEFINE_PROP_UINT16("num-queues", VHostUserBlk, num_queues,
>                         VHOST_USER_BLK_AUTO_NUM_QUEUES),
>      DEFINE_PROP_UINT32("queue-size", VHostUserBlk, queue_size, 128),
> -    DEFINE_PROP_BIT("config-wce", VHostUserBlk, config_wce, 0, true),
> +    DEFINE_PROP_BIT64("config-wce", VHostUserBlk, parent_obj.host_featur=
es,
> +                      VIRTIO_BLK_F_CONFIG_WCE, true),
>      DEFINE_PROP_BIT64("discard", VHostUserBlk, parent_obj.host_features,
>                        VIRTIO_BLK_F_DISCARD, true),
>      DEFINE_PROP_BIT64("write-zeroes", VHostUserBlk, parent_obj.host_feat=
ures,
> diff --git a/include/hw/virtio/vhost-user-blk.h b/include/hw/virtio/vhost=
-user-blk.h
> index 7c91f15040..ea085ee1ed 100644
> --- a/include/hw/virtio/vhost-user-blk.h
> +++ b/include/hw/virtio/vhost-user-blk.h
> @@ -34,7 +34,6 @@ struct VHostUserBlk {
>      struct virtio_blk_config blkcfg;
>      uint16_t num_queues;
>      uint32_t queue_size;
> -    uint32_t config_wce;
>      struct vhost_dev dev;
>      struct vhost_inflight *inflight;
>      VhostUserState vhost_user;
> --=20
> 2.25.1
> =

