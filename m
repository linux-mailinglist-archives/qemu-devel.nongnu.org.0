Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 460715BF5EC
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 07:33:05 +0200 (CEST)
Received: from localhost ([::1]:36844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oasM3-0002WE-QS
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 01:33:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1oasHa-0000St-ID; Wed, 21 Sep 2022 01:28:28 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:40896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1oasHV-0003RN-4Z; Wed, 21 Sep 2022 01:28:24 -0400
Received: from pps.filterd (m0127838.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28KNxj2B021046;
 Tue, 20 Sep 2022 22:28:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=proofpoint20171006;
 bh=Cj/dQ6Kl9JPlQTykC1L+wsEr40mM6NHWYYl0Vt2UdFg=;
 b=FyjwFU+lpqLpOayj6nJP0shSOFoFKXMrQiUoD92SCiowZ7o3Cc/FK4TjEYcr3E5VP/oQ
 8G6822pNbt+/5z467BQdr6XiJ//bFSdxM3GeWOFg8BfYF1BoV5k1ldu3vrmFIpdtDz+3
 qgb4U9ZLzoFNVXYZNPm7m0MDOuwGvO8e7NBuNTTTrIosmCncBs8rFojKZ96E05MwbdgE
 beWuSt5AZOjbehwzT9ORExdhbc9Bn6RPeR++tIuYMuD5Udi41tkkPToHN5mXnR06rloE
 XoQspBKD3QIhLisgn/zFPMwcTX954HwU6wtqaIiCa906J/+XzK4FZEDrJQNwqdooVJNP PQ== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3jndsysbn7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Sep 2022 22:28:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fzaYxjBcNRJoGnkloGC01L4E8hNOeCNj2lgR6iBxD2EpJj8GNZUwtFiDDH2I5UylpITEP3IqDe8b9At5qYMC8B9DSzCB7Z1l8zZTM3E1kMH9GJt4Jf+Wsbsk1aZ9QwV2i5qOlrVTcHew6tFvwzm/AgNy5+0fbr//G8/gaCsp/G/WqOlkq7q34jMm6IbF1nksoySCfVasCoSSP3zM86XxPP+SRRZBddthr7lA13BhB1dNcstihj0dlCbFT+RPsWx/rlNG7ltYrUhsQU6UgvtsNDayS8oNvyRpth5fNZFBofrUy6osXm07Vxefp3cOj6IV1o+jeYMJHaUmAHVwOZmJyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cj/dQ6Kl9JPlQTykC1L+wsEr40mM6NHWYYl0Vt2UdFg=;
 b=GM0CSl0jI3W154bm1X8ChJT6Qzefyqg75FDYek4dDamULSLoDOwsC46FnIQR9ywkZObLJ7e/zXd2srHZcf+k5phwHsOAhogML/CiN8+gKY8xD7xxnJdSVqTrpxZNb44H4BOhwg+qey3EbLvMH5tC4iG/LQr4mH1YkQHGXhP350CjcEhwz1v7TVxEzv1gVrO0BonQEGbj7qvCFwrOoSY8IRpBzWrTfqRxnzMhaqPuDBezFuEm/zGr9kJFL8eod+hjhjodbuadkoAHGQBITKXiB8aP3rOD7sCxQQcTTDEgiBf0z9l/AyE5GldQ2oyjNZi6RwAvGL7bcaYgH2xI/Cz5vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by SA0PR02MB7372.namprd02.prod.outlook.com (2603:10b6:806:eb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Wed, 21 Sep
 2022 05:28:15 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::e8ab:ff5d:aded:71ea]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::e8ab:ff5d:aded:71ea%3]) with mapi id 15.20.5654.016; Wed, 21 Sep 2022
 05:28:14 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Jason Wang <jasowang@redhat.com>, Hao Chen <chenh@yusur.tech>
CC: mst <mst@redhat.com>, Kevin Wolf <kwolf@redhat.com>, Hanna Reitz
 <hreitz@redhat.com>, "open list:Block layer core" <qemu-block@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 "houyl@yusur.tech" <houyl@yusur.tech>, "zy@yusur.tech" <zy@yusur.tech>,
 Cindy Lu <lulu@redhat.com>
Subject: Re: [PATCH] hw/virtio/vhost-user: support obtain vdpa device's mac
 address automatically
Thread-Topic: [PATCH] hw/virtio/vhost-user: support obtain vdpa device's mac
 address automatically
Thread-Index: AQHYx1B9rFsUh9pJU02a+oIPRzGP9K3noASAgADuock=
Date: Wed, 21 Sep 2022 05:28:14 +0000
Message-ID: <BL3PR02MB7938BAC963766AF90ECC8DDBEA4C9@BL3PR02MB7938.namprd02.prod.outlook.com>
References: <20220913090817.212224-1-chenh@yusur.tech>
 <CACGkMEs4nq_J4xXYUH54JMXETELC_i=WDR9UXByWCw6v1xLF4A@mail.gmail.com>
In-Reply-To: <CACGkMEs4nq_J4xXYUH54JMXETELC_i=WDR9UXByWCw6v1xLF4A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR02MB7938:EE_|SA0PR02MB7372:EE_
x-ms-office365-filtering-correlation-id: 7593c5bf-4d84-49eb-ce50-08da9b9214eb
x-proofpoint-crosstenant: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: na2v6HhbJOHlgdqGHrJBkf2MIMkJ6vLvNys9JegOZbEdOmVKvNueYbtmYcpzJp4WKZrEsAtV3DVuucv+/vUemZs3asstt3d3ClCoKT2coZ2YUIznyb57zfHNRVDx+XjSlk+yDH0JwqvIeOKtUaexWf+srXXNGkAfsPP9yJFaEi+tcuf7ln/OYE8e7vYCvcAlUMA7T/rQUELul01IiwdAyazGANlxo8qjCCKqLoD4dw0tEZ20i/bEPE2ySGB1Z3J6Y72DqRWzx+f3RdBye1ihLMoxV1ihibAYd8h3dV9IINCr8dM0PS6Ahl4fjlgqJg8RrtkI5thvE/qoFvAfrG09oInbqFEMaF8+sI0eQF9W11sG0+t59DbhTqjiJcZ7/Vfl0AcCr7g6R5uvhGePAX3TJhxuW12zA3v+WvJFJ/Y6gIn3QOeXl2kW3OBnhv8Xqksds9w0pXxGW2QC+1Iqv7Ydx3fqBRJjyV582MTXhKdFtxMlENSmCbUumKVL1Vb0WVSGdoeOqu8K67YStR2uIBqXSvAftvXQRJalU0sM6mlt/9gLolIBTXeXPSyHkeYnz5e0UwbZAARU33GuzIS+VQI43kVdgIVPpUSJ1nRdfvycQmCed6/xY/TZNE1u6SFnXEmezm62I+4cO68TN0K3YA7gG3bbWi1WjlRQ0JQUtb6YJgCjgFRqDoRH80147GZjB6k7d/ShJNpQoUeF5EHsrhqI1vRnGW2Upa9Bg5MCDSCdFzlKbH77dVgim+PewM5fwSeQV+BZ218YH47XzBMS0jPu4w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(366004)(376002)(39860400002)(346002)(136003)(451199015)(38100700002)(33656002)(86362001)(83380400001)(122000001)(38070700005)(186003)(2906002)(9686003)(7696005)(6506007)(7416002)(55016003)(71200400001)(478600001)(110136005)(41300700001)(26005)(66446008)(8936002)(91956017)(54906003)(316002)(5660300002)(66556008)(8676002)(4326008)(52536014)(66946007)(66476007)(44832011)(76116006)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3UisOTu28eB0pkbI3Fx+ItyorN+uMZkbuXyfuXTFOxK+DXl8vplSbBa/obvS?=
 =?us-ascii?Q?IXAa+YBR/n0V4hNEXnnJx4rcAgbhjBZ8FHpzOvZ6x53DyoMQmlyOdS3nT2vG?=
 =?us-ascii?Q?jO3v0zbtAqfx1zhzg9XEQk9h2x3A3DXiHVX/848MZDboxjQPp6LcklK205r3?=
 =?us-ascii?Q?g6fb918SvKueE7yZGObyR/Dt+RxNnAuUaRFcR/xLmA3NV2TdqJMhuKBOcRvx?=
 =?us-ascii?Q?LZohFeLA95lyjGKGshHUje0PGAJ1/0T67aZwav8Pm/jkcJyqMnfE7YZEo97l?=
 =?us-ascii?Q?Jt3egZ0/qlWMymFD1R250oqGrsgPp0XoWAyOIwkr3y0eLI9LkyY0T6XcJ95/?=
 =?us-ascii?Q?4bWKIFG58abwlrdtgAId+Er5TfV6NcRElhbfGVAB3SqdYNcwCW6m/HtO4JaO?=
 =?us-ascii?Q?A/6NROoZ1Hnh+01tvjvjBjsKMW1aeHL0dLoCHXokH3eA4W8TZ10WAdRKtAiB?=
 =?us-ascii?Q?q+nd10O9S6R5bdqGPfgLizbeVx/dj9sFQxJcTxqxkycJI1RAj4tS8PiJ4f33?=
 =?us-ascii?Q?k44hO8rXLSz+K1xjW2GxaDfZBLmHuriFxtF1sPPPE72Uytnu+bCv8Fh8tRK6?=
 =?us-ascii?Q?iqR9FP3GVVPrIDycLhd4xW58h5dX3jTYEdsojBbUckKPFC2wVVaD6VReVlvN?=
 =?us-ascii?Q?LuTroeGdQsV5AeWJnydFD0TRSGZ2kjTbQkN3ZeUpEbKh9bk4vBKyVgpX3cwu?=
 =?us-ascii?Q?dXKKMlVsvmnZ9l8c5OAkoKGdqi6iMGScZMiv+F3GSeRbLcY4UVOjEN1DpElT?=
 =?us-ascii?Q?U/1GwWldJZT0gSzJa9TqKd41vQV4VsCHpuR9MaipPlGCNZKVos+j6wmSOK1m?=
 =?us-ascii?Q?ORtrELzFLmPafSCidFzq1hQrCS4j5Xe7GJ/Z541X/BFy52SET5B1llfegFKw?=
 =?us-ascii?Q?fu7ECgj6sbQaZc7U24KIqGE2jfj2HwJxFmxPHDBhoIaHV0AKb8IpmxH17le+?=
 =?us-ascii?Q?Uh8ZmjkrWoO7y/kf/9nPi3EDj66xwBFKdERn54wYRdI6W88GB74YmHps3Pwk?=
 =?us-ascii?Q?AazXcb7/99ErKfZYmLI9LC0wKm6e761UCoYSwPNYr1ViQKhTwJbWsrQEyh0e?=
 =?us-ascii?Q?5vHe65Keeo3pUc8XpPI2XlBP8xLMUKsdXPXF3jlUCrxWQEtVFgx63gDR3LFq?=
 =?us-ascii?Q?Ofak+nbFjm4qPzMTn/F1ztTUBDBN7fBCp1IkDYU3S0z8tUX4f1AlPSZ73j0o?=
 =?us-ascii?Q?eAMWHqZW8Ce4O4VGc0YMMBdJiEEXr8jdrfd730D13HG83/U27p5Bfpz5KCII?=
 =?us-ascii?Q?JF1pIsBeul58VEA3MpllCFD6RFscsxPcp597G0ltQCuqr+5H7VmJVpMvTwE+?=
 =?us-ascii?Q?M//SE4I/pCVbXaixIlogSEG/mTucu56dhn+BoBDBtjVeRG5Y2K8KwWQGGQjJ?=
 =?us-ascii?Q?QnrkQYcPUa6g1FjaNgY2waYKNyy3qmIYltCIOuar03UpHCFnjQIICDf5FUq5?=
 =?us-ascii?Q?F+/2n+OnggnjworkhH37wm0dZZqq3HH2RMTP5bfu8CwTIkQ9YKbO6LWb/NNT?=
 =?us-ascii?Q?O8M7J93WNPzNY5S1ybBEwFErIGISVb/HLmfQIcfB6QeTXAko2Gr+K9cpQuyI?=
 =?us-ascii?Q?vjJk6u3pEJk6ZtZ4nuHwX7feX0Hi8smoUHT7+mEOqtY9aMastHJPTP917iSB?=
 =?us-ascii?Q?yog+St7+1F7YNdoU4iFXXhw=3D?=
Content-Type: multipart/alternative;
 boundary="_000_BL3PR02MB7938BAC963766AF90ECC8DDBEA4C9BL3PR02MB7938namp_"
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7593c5bf-4d84-49eb-ce50-08da9b9214eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2022 05:28:14.4250 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QV7tUvUJn90j/UBe9ny9cIlL7ftXQ1kzm6nqzGSjUpntAg2RnFU5VpH+0d2BB1aitXENLdoY/+CvM3BIurrBgOSUBLtyMGaFc+FySJZaxcY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR02MB7372
X-Proofpoint-GUID: fUK3p3_3pIPhOpSIt0BcD6n95EVDvLrq
X-Proofpoint-ORIG-GUID: fUK3p3_3pIPhOpSIt0BcD6n95EVDvLrq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-21_02,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0a-002c1b01.pphosted.com
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

--_000_BL3PR02MB7938BAC963766AF90ECC8DDBEA4C9BL3PR02MB7938namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I have some concerns from the vhost-user-blk side.



>On Tue, Sep 13, 2022 at 5:13 PM Hao Chen <chenh@yusur.tech> wrote:

>>

>> When use dpdk-vdpa tests vdpa device. You need to specify the mac addres=
s to

>> start the virtual machine through libvirt or qemu, but now, the libvirt =
or

>> qemu can call dpdk vdpa vendor driver's ops .get_config through vhost_ne=
t_get_config

>> to get the mac address of the vdpa hardware without manual configuration=
.

>>

>> Signed-off-by: Hao Chen <chenh@yusur.tech>

>

>Adding Cindy for comments.

>

>Thanks

>

>> ---

>>  hw/block/vhost-user-blk.c |  1 -

>>  hw/net/virtio-net.c       |  3 ++-

>>  hw/virtio/vhost-user.c    | 19 -------------------

>>  3 files changed, 2 insertions(+), 21 deletions(-)

>>

>> diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c

>> index 9117222456..5dca4eab09 100644

>> --- a/hw/block/vhost-user-blk.c

>> +++ b/hw/block/vhost-user-blk.c

>> @@ -337,7 +337,6 @@ static int vhost_user_blk_connect(DeviceState *dev, =
Error **errp)

>>

>>      vhost_dev_set_config_notifier(&s->dev, &blk_ops);

>>

>> -    s->vhost_user.supports_config =3D true;



vhost-user-blk requires the backend to support VHOST_USER_PROTOCOL_F_CONFIG

and vhost_user.supports_config is used to enforce that.



Why are you removing it here?





>>      ret =3D vhost_dev_init(&s->dev, &s->vhost_user, VHOST_BACKEND_TYPE_=
USER, 0,

>>                           errp);

>>      if (ret < 0) {

>> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c

>> index dd0d056fde..274ea84644 100644

>> --- a/hw/net/virtio-net.c

>> +++ b/hw/net/virtio-net.c

>> @@ -149,7 +149,8 @@ static void virtio_net_get_config(VirtIODevice *vdev=
, uint8_t *config)

>>       * Is this VDPA? No peer means not VDPA: there's no way to

>>       * disconnect/reconnect a VDPA peer.

>>       */

>> -    if (nc->peer && nc->peer->info->type =3D=3D NET_CLIENT_DRIVER_VHOST=
_VDPA) {

>> +    if ((nc->peer && nc->peer->info->type =3D=3D NET_CLIENT_DRIVER_VHOS=
T_VDPA) ||

>> +        (nc->peer && nc->peer->info->type =3D=3D NET_CLIENT_DRIVER_VHOS=
T_USER)) {

>>          ret =3D vhost_net_get_config(get_vhost_net(nc->peer), (uint8_t =
*)&netcfg,

>>                                     n->config_size);

>>          if (ret !=3D -1) {

>> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c

>> index bd24741be8..8b01078249 100644

>> --- a/hw/virtio/vhost-user.c

>> +++ b/hw/virtio/vhost-user.c

>> @@ -2013,8 +2013,6 @@ static int vhost_user_backend_init(struct vhost_de=
v *dev, void *opaque,

>>      }

>>



Why are you removing this? Can you expand on how it helps dpdk-vdpa.



>>      if (virtio_has_feature(features, VHOST_USER_F_PROTOCOL_FEATURES)) {

>> -        bool supports_f_config =3D vus->supports_config ||

>> -            (dev->config_ops && dev->config_ops->vhost_dev_config_notif=
ier);

>>          uint64_t protocol_features;

>>

>>          dev->backend_features |=3D 1ULL << VHOST_USER_F_PROTOCOL_FEATUR=
ES;

>> @@ -2033,23 +2031,6 @@ static int vhost_user_backend_init(struct vhost_d=
ev *dev, void *opaque,

>>           */

>>          protocol_features &=3D VHOST_USER_PROTOCOL_FEATURE_MASK;

>>

>> -        if (supports_f_config) {

>> -            if (!virtio_has_feature(protocol_features,

>> -                                    VHOST_USER_PROTOCOL_F_CONFIG)) {

>> -                error_setg(errp, "vhost-user device expecting "

>> -                           "VHOST_USER_PROTOCOL_F_CONFIG but the vhost-=
user backend does "

>> -                           "not support it.");

>> -                return -EPROTO;

>> -            }

>> -        } else {

>> -            if (virtio_has_feature(protocol_features,

>> -                                   VHOST_USER_PROTOCOL_F_CONFIG)) {

>> -                warn_reportf_err(*errp, "vhost-user backend supports "

>> -                                 "VHOST_USER_PROTOCOL_F_CONFIG but QEMU=
 does not.");

>> -                protocol_features &=3D ~(1ULL << VHOST_USER_PROTOCOL_F_=
CONFIG);

>> -            }

>> -        }

>> -

>>          /* final set of protocol features */

>>          dev->protocol_features =3D protocol_features;

>>          err =3D vhost_user_set_protocol_features(dev, dev->protocol_fea=
tures);

>> --

>> 2.27.0

>>

>


--_000_BL3PR02MB7938BAC963766AF90ECC8DDBEA4C9BL3PR02MB7938namp_
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
<p class=3D"p1"><span class=3D"s1">I have some concerns from the vhost-user=
-blk side.<o:p></o:p></span></p>
<p class=3D"p1"><span class=3D"s1"><o:p>&nbsp;</o:p></span></p>
<p class=3D"p1"><span class=3D"s1">&gt;On Tue, Sep 13, 2022 at 5:13 PM Hao =
Chen &lt;chenh@yusur.tech&gt; wrote:</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt;</span><o:p>&nbsp;</o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt; When use dpdk-vdpa tests vdpa d=
evice. You need to specify the mac address to</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt; start the virtual machine throu=
gh libvirt or qemu, but now, the libvirt or</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt; qemu can call dpdk vdpa vendor =
driver's ops .get_config through vhost_net_get_config</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt; to get the mac address of the v=
dpa hardware without manual configuration.</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt;</span><o:p>&nbsp;</o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt; Signed-off-by: Hao Chen &lt;che=
nh@yusur.tech&gt;</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;</span><o:p>&nbsp;</o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;Adding Cindy for comments.</span></p=
>
<p class=3D"p1"><span class=3D"s1">&gt;</span><o:p>&nbsp;</o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;Thanks</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;</span><o:p>&nbsp;</o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt; ---</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt;</span><span class=3D"apple-conv=
erted-space">&nbsp; </span>
<span class=3D"s1">hw/block/vhost-user-blk.c |</span><span class=3D"apple-c=
onverted-space">&nbsp;
</span><span class=3D"s1">1 -</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt;</span><span class=3D"apple-conv=
erted-space">&nbsp; </span>
<span class=3D"s1">hw/net/virtio-net.c </span><span class=3D"apple-converte=
d-space">&nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">|</span><span class=3D"apple-converted-space">&nb=
sp; </span><span class=3D"s1">3 ++-</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt;</span><span class=3D"apple-conv=
erted-space">&nbsp; </span>
<span class=3D"s1">hw/virtio/vhost-user.c</span><span class=3D"apple-conver=
ted-space">&nbsp; &nbsp;
</span><span class=3D"s1">| 19 -------------------</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt;</span><span class=3D"apple-conv=
erted-space">&nbsp; </span>
<span class=3D"s1">3 files changed, 2 insertions(+), 21 deletions(-)</span>=
</p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt;</span><o:p>&nbsp;</o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt; diff --git a/hw/block/vhost-use=
r-blk.c b/hw/block/vhost-user-blk.c</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt; index 9117222456..5dca4eab09 10=
0644</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt; --- a/hw/block/vhost-user-blk.c=
</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt; +++ b/hw/block/vhost-user-blk.c=
</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt; @@ -337,7 +337,6 @@ static int =
vhost_user_blk_connect(DeviceState *dev, Error **errp)</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt;</span><o:p>&nbsp;</o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt;</span><span class=3D"apple-conv=
erted-space">&nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">vhost_dev_set_config_notifier(&amp;s-&gt;dev, &am=
p;blk_ops);</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt;</span><o:p>&nbsp;</o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt; -</span><span class=3D"apple-co=
nverted-space">&nbsp; &nbsp;
</span><span class=3D"s1">s-&gt;vhost_user.supports_config =3D true;<o:p></=
o:p></span></p>
<p class=3D"p1"><span class=3D"s1"><o:p>&nbsp;</o:p></span></p>
<p class=3D"p1"><span class=3D"s1">vhost-user-blk requires the backend to s=
upport VHOST_USER_PROTOCOL_F_CONFIG<o:p></o:p></span></p>
<p class=3D"p1"><span class=3D"s1">and vhost_user.supports_config is used t=
o enforce that.<o:p></o:p></span></p>
<p class=3D"p1"><span class=3D"s1"><o:p>&nbsp;</o:p></span></p>
<p class=3D"p1"><span class=3D"s1">Why are you removing it here?<o:p></o:p>=
</span></p>
<p class=3D"p1"><span class=3D"s1"><o:p>&nbsp;</o:p></span></p>
<p class=3D"p1"><o:p>&nbsp;</o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt;</span><span class=3D"apple-conv=
erted-space">&nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">ret =3D vhost_dev_init(&amp;s-&gt;dev, &amp;s-&gt=
;vhost_user, VHOST_BACKEND_TYPE_USER, 0,</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt; </span><span class=3D"apple-con=
verted-space">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">errp);</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt;</span><span class=3D"apple-conv=
erted-space">&nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">if (ret &lt; 0) {</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt; diff --git a/hw/net/virtio-net.=
c b/hw/net/virtio-net.c</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt; index dd0d056fde..274ea84644 10=
0644</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt; --- a/hw/net/virtio-net.c</span=
></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt; +++ b/hw/net/virtio-net.c</span=
></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt; @@ -149,7 +149,8 @@ static void=
 virtio_net_get_config(VirtIODevice *vdev, uint8_t *config)</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt; </span><span class=3D"apple-con=
verted-space">&nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">* Is this VDPA? No peer means not VDPA: there's n=
o way to</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt; </span><span class=3D"apple-con=
verted-space">&nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">* disconnect/reconnect a VDPA peer.</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt; </span><span class=3D"apple-con=
verted-space">&nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">*/</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt; -</span><span class=3D"apple-co=
nverted-space">&nbsp; &nbsp;
</span><span class=3D"s1">if (nc-&gt;peer &amp;&amp; nc-&gt;peer-&gt;info-&=
gt;type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA) {</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt; +</span><span class=3D"apple-co=
nverted-space">&nbsp; &nbsp;
</span><span class=3D"s1">if ((nc-&gt;peer &amp;&amp; nc-&gt;peer-&gt;info-=
&gt;type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA) ||</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt; +</span><span class=3D"apple-co=
nverted-space">&nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">(nc-&gt;peer &amp;&amp; nc-&gt;peer-&gt;info-&gt;=
type =3D=3D NET_CLIENT_DRIVER_VHOST_USER)) {</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt;</span><span class=3D"apple-conv=
erted-space">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">ret =3D vhost_net_get_config(get_vhost_net(nc-&gt=
;peer), (uint8_t *)&amp;netcfg,</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt; </span><span class=3D"apple-con=
verted-space">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">n-&gt;config_size);</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt;</span><span class=3D"apple-conv=
erted-space">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">if (ret !=3D -1) {</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt; diff --git a/hw/virtio/vhost-us=
er.c b/hw/virtio/vhost-user.c</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt; index bd24741be8..8b01078249 10=
0644</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt; --- a/hw/virtio/vhost-user.c</s=
pan></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt; +++ b/hw/virtio/vhost-user.c</s=
pan></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt; @@ -2013,8 +2013,6 @@ static in=
t vhost_user_backend_init(struct vhost_dev *dev, void *opaque,</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt;</span><span class=3D"apple-conv=
erted-space">&nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">}</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt;<o:p>&nbsp;</o:p></span></p>
<p class=3D"p1"><span class=3D"s1"><o:p>&nbsp;</o:p></span></p>
<p class=3D"p1"><span class=3D"s1">Why are you removing this? Can you expan=
d on how it helps dpdk-vdpa.<o:p></o:p></span></p>
<p class=3D"p1"><o:p>&nbsp;</o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt;</span><span class=3D"apple-conv=
erted-space">&nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">if (virtio_has_feature(features, VHOST_USER_F_PRO=
TOCOL_FEATURES)) {</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt; -</span><span class=3D"apple-co=
nverted-space">&nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">bool supports_f_config =3D vus-&gt;supports_confi=
g ||</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt; -</span><span class=3D"apple-co=
nverted-space">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">(dev-&gt;config_ops &amp;&amp; dev-&gt;config_ops=
-&gt;vhost_dev_config_notifier);</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt;</span><span class=3D"apple-conv=
erted-space">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">uint64_t protocol_features;</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt;</span><o:p>&nbsp;</o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt;</span><span class=3D"apple-conv=
erted-space">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">dev-&gt;backend_features |=3D 1ULL &lt;&lt; VHOST=
_USER_F_PROTOCOL_FEATURES;</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt; @@ -2033,23 +2031,6 @@ static i=
nt vhost_user_backend_init(struct vhost_dev *dev, void *opaque,</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt; </span><span class=3D"apple-con=
verted-space">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">*/</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt;</span><span class=3D"apple-conv=
erted-space">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">protocol_features &amp;=3D VHOST_USER_PROTOCOL_FE=
ATURE_MASK;</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt;</span><o:p>&nbsp;</o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt; -</span><span class=3D"apple-co=
nverted-space">&nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">if (supports_f_config) {</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt; -</span><span class=3D"apple-co=
nverted-space">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">if (!virtio_has_feature(protocol_features,</span>=
</p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt; -</span><span class=3D"apple-co=
nverted-space">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">VHOST_USER_PROTOCOL_F_CONFIG)) {</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt; -</span><span class=3D"apple-co=
nverted-space">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">error_setg(errp, &quot;vhost-user device expectin=
g &quot;</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt; - </span><span class=3D"apple-c=
onverted-space">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">&quot;VHOST_USER_PROTOCOL_F_CONFIG but the vhost-=
user backend does &quot;</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt; - </span><span class=3D"apple-c=
onverted-space">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">&quot;not support it.&quot;);</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt; -</span><span class=3D"apple-co=
nverted-space">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">return -EPROTO;</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt; -</span><span class=3D"apple-co=
nverted-space">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">}</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt; -</span><span class=3D"apple-co=
nverted-space">&nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">} else {</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt; -</span><span class=3D"apple-co=
nverted-space">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">if (virtio_has_feature(protocol_features,</span><=
/p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt; - </span><span class=3D"apple-c=
onverted-space">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">VHOST_USER_PROTOCOL_F_CONFIG)) {</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt; -</span><span class=3D"apple-co=
nverted-space">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">warn_reportf_err(*errp, &quot;vhost-user backend =
supports &quot;</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt; - </span><span class=3D"apple-c=
onverted-space">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">&quot;VHOST_USER_PROTOCOL_F_CONFIG but QEMU does =
not.&quot;);</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt; -</span><span class=3D"apple-co=
nverted-space">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">protocol_features &amp;=3D ~(1ULL &lt;&lt; VHOST_=
USER_PROTOCOL_F_CONFIG);</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt; -</span><span class=3D"apple-co=
nverted-space">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">}</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt; -</span><span class=3D"apple-co=
nverted-space">&nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">}</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt; -</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt;</span><span class=3D"apple-conv=
erted-space">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">/* final set of protocol features */</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt;</span><span class=3D"apple-conv=
erted-space">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">dev-&gt;protocol_features =3D protocol_features;<=
/span></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt;</span><span class=3D"apple-conv=
erted-space">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">err =3D vhost_user_set_protocol_features(dev, dev=
-&gt;protocol_features);</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt; --</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt; 2.27.0</span></p>
<p class=3D"p1"><span class=3D"s1">&gt;&gt;</span><o:p>&nbsp;</o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;</span><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span style=3D"font-s=
ize:11.0pt"><o:p>&nbsp;</o:p></span></p>
</div>
</div>
</body>
</html>

--_000_BL3PR02MB7938BAC963766AF90ECC8DDBEA4C9BL3PR02MB7938namp_--

