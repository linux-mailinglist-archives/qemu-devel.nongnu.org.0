Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E115AB81F
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 20:22:17 +0200 (CEST)
Received: from localhost ([::1]:51708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUBJ1-0003dK-2l
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 14:22:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1oUAsj-0005go-Dd; Fri, 02 Sep 2022 13:55:07 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:53186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1oUAsh-0005u7-OD; Fri, 02 Sep 2022 13:55:05 -0400
Received: from pps.filterd (m0127839.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28295e1I025867;
 Fri, 2 Sep 2022 10:55:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=ZoQE1rlbCwzLo9OC6AUiyv8b5/ELL1oAZaRGuyKPGpI=;
 b=BtZ0kL5mjLi6NoVAOg1qDuZQsKz50o9vpiu77I+b3O5BapciVxjtFwZtm1bJqh2j3fgi
 PG3QczsQp3CIfxdle1VDCHoG2Bg91vAmcTTGMumiQUtp2omm4OCtkvuikmqSZZtZUMCC
 h284fsb5YVEFZcA6D8qjlnXLHOLFc+Q47A4zmGmwAOww/1aDZvtWOKNxnsps5MwsNUq5
 4hY3ORy4J6xB+60RmaRtfo7bA2qQTTJGtHypJ5Xru6v4Lw5upOLQ6IwMrHwXb8h1c6dm
 wgnGNrWM1w/w13EcXvhYAy29S010npxyqHsWSoOzpGShAYHeRkzFMAhdvV7bV9PaLuBT 8Q== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3j7jbgxgpp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Sep 2022 10:55:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fbwdoaebxzX/phYiy2UmvTJPqX9ZWtrwek2AZS3eFO2HylZ5GPcrQ88pSYHB+2C/fjqmLWZt+b501asjmjHAhV1NowAdZ47FAJeEfVqZlnfwNSb97DAjaccRvnPq/RRQ5Ey/C48+zvdARbWEehcH21WsrK+Irgc+jrmC4ZOcv3UHtTXrv4npagh+GV1L/PvBwP3CgVCg9/GG5P0cyRCVghcKQFOOKJqi05zEtR5XvVCK03bWRzsDZ8vkWvryi1Y0mMGdQMJyxSQVdFVrBDpC01zkjYOQbsg0gCEENrRE56d5t66M7Li9/ESAt5jzmCFqfoRdZKvQ86Bi5tkXB7xdIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZoQE1rlbCwzLo9OC6AUiyv8b5/ELL1oAZaRGuyKPGpI=;
 b=GI+FIMag75cWaw5cM9Yvpqwtka3pyn0IikuGc9QNOlcF9g02pcR8tyfzZg/tPSlL0R0o7P7OgbYOG2VL8yYTYm34kw0xtOphjw1ljjHczX0Mqfw1lBcbRxtqnRio26zJzZCBb+9x1Wp67YflS56mpWOyzZWDtZYeBYD/Gv/ZS+qM9MPLLDJO9zoxsHs1E17TvjVCUbqmiu8c+a9M6S5mNdeD1RtKQQqZwPTu8et6BND5tWJmIkJ60q5uG/8tl7tDWfNOz2nrFLa8cmU2mNbrsZNazoUw8lWt10rJqKSUaXeaWQChKAaryvLWfdAmFZXX4qyqMbc4VuN1lINqXpkWxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by MW4PR02MB7188.namprd02.prod.outlook.com (2603:10b6:303:7a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Fri, 2 Sep
 2022 17:55:00 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::e8ab:ff5d:aded:71ea]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::e8ab:ff5d:aded:71ea%4]) with mapi id 15.20.5588.015; Fri, 2 Sep 2022
 17:55:00 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Daniil Tatianin <d-tatianin@yandex-team.ru>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "yc-core@yandex-team.ru"
 <yc-core@yandex-team.ru>, "mst@redhat.com" <mst@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>, Raphael Norwitz
 <raphael.norwitz@nutanix.com>, "kwolf@redhat.com" <kwolf@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>, "jasowang@redhat.com"
 <jasowang@redhat.com>
Subject: Re: [PATCH v2 4/8] virtio: remove the virtio_feature_get_config_size
 helper
Thread-Topic: [PATCH v2 4/8] virtio: remove the virtio_feature_get_config_size
 helper
Thread-Index: AQHYuVjHHKCW0ZihYUasc0VqUsfntK3Md4qA
Date: Fri, 2 Sep 2022 17:55:00 +0000
Message-ID: <20220902175459.GD5363@raphael-debian-dev>
References: <20220826143248.580939-1-d-tatianin@yandex-team.ru>
 <20220826143248.580939-5-d-tatianin@yandex-team.ru>
In-Reply-To: <20220826143248.580939-5-d-tatianin@yandex-team.ru>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5f8aaa31-704a-4490-2fed-08da8d0c414b
x-ms-traffictypediagnostic: MW4PR02MB7188:EE_
x-proofpoint-crosstenant: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: C/xYiAdiQN6VxFULyduJaFM0P2rtsS6ycwEAlucSPmLDocIDlRxBhPWqK1omRBMPb2djsrROjCJs5TiMXS2lezM/IFpz6tlJaOic3SPbUJ6bnA0Nz2/3vmF9PFvVem9VEkWYrMeGT6KZaeJ0dmWjMzAX8Kjfz74KWDghfEeiCwkXZeozZQ5gV63gbo9+3CxVNsWW1JpXMbAMoR+EaDU2QD0d8VKbf54da7ZHeMGGuwZAt01S6a67b9hduN7SwxsXgebYMIcmspv4FkHd6ItwnMiIlfbRHv8C2m+v9DU7SjFY7PriT7AJtEASKfPKzrDptFS3F2z2QKst/fQSU+kt6k3jRPd+C+8oCXRjdyfxpSFL0LSkMcS28f3BSZjSQrUmkl7gipmH7GMDuelcMuuz4wnnjnYHpRufLTLNiwHZOcHY5Rvl8yFMzp0W84uEvcrZqudRUe5aC/TxEK/6rp9dVU1GD6UgwgcaduapNMAua17WmUqDxDxrc1fnZxXfope58xaJJsUleRAC6gmX3l1xFNsuXCFG09sjwN3CXSc0y4tyJnnXqmLyJZxbA2vRFvR0e3ke3SytfyGDQKnEU5ESLMOAy5kujPLvyBYHprzkG0DY9fmFE0lCk6X/UEWfYeb//mX8AxanNP08ArsOZOMM0Hx+7WvYnFqk5U4uLMkNCS8dOnTMp39DC5BlIrTmeyL1KRbOo2zzLpnfb4krO6EmVoC+fHqVza6E8dGny4sf8yerScWbAkIYoE0LABRezenbJSGPk0klQCKhpgrC4+9JSw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(136003)(376002)(39860400002)(366004)(346002)(396003)(6506007)(26005)(6512007)(9686003)(71200400001)(1076003)(186003)(44832011)(5660300002)(8936002)(33656002)(6486002)(41300700001)(86362001)(478600001)(122000001)(38070700005)(83380400001)(54906003)(6916009)(2906002)(316002)(38100700002)(33716001)(4326008)(8676002)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YvQv7coOKRTJOJtEfef+xE9541WR5MD47Pj1sI64eWSIYRPzW1rCHxm9j5CS?=
 =?us-ascii?Q?Gr1mVVGzb2wwAVb1g6FzL+wK5VvdqkiGz5wLT6qiwklqQWV9WOzD7GCN313T?=
 =?us-ascii?Q?cgeETpWoJ466gl1jRpz+B6BCsUbyY+T0fmRWoImzsf8CUM9mVIZEA7kGEjsY?=
 =?us-ascii?Q?LBr2UsxGapCT7HRpPy1gNMCTu8WKFtRyIAnpamqGFSCH5hQ2ONTcFMeb6Y5h?=
 =?us-ascii?Q?kKk2YHjPaVNh62xfsBLEVjHfy2jrVJd7Hi9Bg+fujP/dVxsbcN5zGwrlWSad?=
 =?us-ascii?Q?a2AGSA578yCZL6nwbzsmhjWdE2cIL/D1FzUspEwztHhvm2vqukOIWuDia5/O?=
 =?us-ascii?Q?VJjnvUybofj/z9pb+GPEoO0Yrku+mJrZIlqKTW42+V885G2gislkmOOCfB7Q?=
 =?us-ascii?Q?efgvZ0qvx3EnnZEKs56nmIlut425wl/MfPAT+3LFFXLWGHWlAsG3mAw/EY93?=
 =?us-ascii?Q?yKQdR7ZYAqP+jxGoAh/IfgICm8QyjiAJGDTAII2dk1ZzQfKv4/CnKqXR7f2u?=
 =?us-ascii?Q?6oQDn2qDrPNdT1BCCE7P+sBKruxvbL/mTAMYyKSDSzUuqYr4kknfVwCM70hj?=
 =?us-ascii?Q?cZPSIqF+KwqWTztiPXZSRhmW9HUHqmeFx5npEEGCNFSp5yDU++H6qq2WmP5c?=
 =?us-ascii?Q?gPUZhgxHfYN90J/vodBm0eHdOwpqH2wJ3wCfBp1ushxXxaYsK6V/PsAotcWx?=
 =?us-ascii?Q?wbXPAKxfGlYY4Y7av+96YOzjHRO1MoHeow/Kz2xIC2ANilPGl5OZyPS/8Tee?=
 =?us-ascii?Q?UVD0jeS3U2LVaJvZF+yAjEMBzwHm9PWebr3kvnbHEshb+rkqess5mEXKkLU/?=
 =?us-ascii?Q?eHNQ/C42CR5JDxhHvuDL9EDrLJy5YLNC9GrW3bFu/L7kXk2iGv0WIUfHHexm?=
 =?us-ascii?Q?EkB0ghNbzs7M+m/Bi46UbOrE3i377WxgFwnGc7BplHS0UJ8ZhusK1zBgPIIx?=
 =?us-ascii?Q?9KVr2g7BpIDEwzRik39lQiCgwuavahAWtPHKxsmmAip3XFNJtCbuXsEy0km0?=
 =?us-ascii?Q?yuUxtNweRxo3Ad/q0OsvNSEyy/dd9IRmdGg2Dsf1VjblqfYkTDInxQL5vVDg?=
 =?us-ascii?Q?YX7J4XW+KSJAwUG4COTGWFVRRLYZ+fmj/oeBR5/wloM1PrjM0y+FWwNovxdm?=
 =?us-ascii?Q?nxaNoaTBbWm1qkOA8jLgaylZPBsnWhLCKz92NjPP1FwKdKjrqHfKnlwB3Z8S?=
 =?us-ascii?Q?KZDWUeex4S6tJyYD+D2hSpGgzquL4IvIPk+ntN0PXEMArNa5jf6pulhwJGSE?=
 =?us-ascii?Q?+B57SqSw4urisCjekAM9AqDFneSoVwja5gAlQUCYV9A/96uJlteHr9gNaXVn?=
 =?us-ascii?Q?5pQbDaknLy37SgYoq+I5HJzit/QC0KXFIBNtY8HFTxxZ8P1XZk15HJA5ea2S?=
 =?us-ascii?Q?mJRkF4NLURQBCCn1BG9rDBn40g/InpwDAnzVOU84CW7yuTA7Vlj1sKj6JL1J?=
 =?us-ascii?Q?5ckAoaZaxLwhWAScNLpscNhxgJLKrKAr1H+8UUP7pGK1VC01Fh61v3WCVd4R?=
 =?us-ascii?Q?+q3KxqesevYcqfe8gIyLl/XVkj7cpajBSsiA0h1/CgPuIVUxEsYSsSm+AJ6x?=
 =?us-ascii?Q?3rz0X6FaCL+pJs7doG88YP1HzSlxT0HDyCM5zFzKAANMlNVevKr28LiNjWIL?=
 =?us-ascii?Q?v0suQEz74pll61b54kOQACA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F89C0535E591D04D80AAC17D42C8719A@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f8aaa31-704a-4490-2fed-08da8d0c414b
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2022 17:55:00.0760 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UiYor0kLo6BJ6coAJwl1Z9giIH1VN0kIey2yvusqw5UZ+vb3AuZDqMwFf4UxPbO897YPwgcksb/0IMnKCsIkzuqd0V37aklUhPyoeVt+wn8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR02MB7188
X-Proofpoint-ORIG-GUID: Ok0_b5yVBudvUOYkVWoQjF_GvP8jNvZQ
X-Proofpoint-GUID: Ok0_b5yVBudvUOYkVWoQjF_GvP8jNvZQ
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

On Fri, Aug 26, 2022 at 05:32:44PM +0300, Daniil Tatianin wrote:
> This has no more users and is superseded by virtio_get_config_size.
>=20
> Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>

Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>

> ---
>  hw/virtio/virtio.c         | 15 ---------------
>  include/hw/virtio/virtio.h |  3 ---
>  2 files changed, 18 deletions(-)
>=20
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index 8518382025..c0bf8dd6fd 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -2999,21 +2999,6 @@ int virtio_set_features(VirtIODevice *vdev, uint64=
_t val)
>      return ret;
>  }
> =20
> -size_t virtio_feature_get_config_size(const VirtIOFeature *feature_sizes=
,
> -                                      uint64_t host_features)
> -{
> -    size_t config_size =3D 0;
> -    int i;
> -
> -    for (i =3D 0; feature_sizes[i].flags !=3D 0; i++) {
> -        if (host_features & feature_sizes[i].flags) {
> -            config_size =3D MAX(feature_sizes[i].end, config_size);
> -        }
> -    }
> -
> -    return config_size;
> -}
> -
>  size_t virtio_get_config_size(const VirtIOConfigSizeParams *params,
>                                uint64_t host_features)
>  {
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index 1991c58d9b..f3ff6710d5 100644
> --- a/include/hw/virtio/virtio.h
> +++ b/include/hw/virtio/virtio.h
> @@ -53,9 +53,6 @@ typedef struct VirtIOConfigSizeParams {
>  size_t virtio_get_config_size(const VirtIOConfigSizeParams *params,
>                                uint64_t host_features);
> =20
> -size_t virtio_feature_get_config_size(const VirtIOFeature *features,
> -                                      uint64_t host_features);
> -
>  typedef struct VirtQueue VirtQueue;
> =20
>  #define VIRTQUEUE_MAX_SIZE 1024
> --=20
> 2.25.1
> =

