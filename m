Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4433A49A9
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 21:56:25 +0200 (CEST)
Received: from localhost ([::1]:49232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrnGS-0002X1-D9
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 15:56:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1lrnFT-0001iY-Dl; Fri, 11 Jun 2021 15:55:23 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:51272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1lrnFQ-0001Po-W1; Fri, 11 Jun 2021 15:55:23 -0400
Received: from pps.filterd (m0127840.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15BJqx5Q020934; Fri, 11 Jun 2021 12:55:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=egHy8/SPziC4cCf5u8St/5Kwj0ygkgKsVIh2n+TSoH8=;
 b=hy5ujTkzNGkdg+QHEjz2Po/370A8Z1blOMSMGlvqNU0iJCVGpJfwYttEJOF6W1LnsUJs
 XWnR7ygBjEltmiI0lS8wGgrXgAnXrFHeb8KPsH8+PYTJr2mvFAnlEmbCfcl7lAQHLOF8
 bsfHNAg2NkQvZDHHv2SNytLWyDhhPzo8tDP44D/kys5SGoHWKUtV3fKPlmWmTZrh8YZV
 9HvDqHh/EJ7vBNejpG2/P0UpGI0plNu8ptEOO3dAZ8wJwqOupjG2ogLCYeAs4gv/jM1T
 L5MJCqwT92iYbg4tu4Rf8oNrGWrDikxZSgYH89o+VIBFCyut+whrlDLGbQtIGyAPkCCo RQ== 
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2174.outbound.protection.outlook.com [104.47.73.174])
 by mx0a-002c1b01.pphosted.com with ESMTP id 393jd9kfh9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Jun 2021 12:55:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JUPLhrgYuBCH6q2F3tfSMl5JkQaWzRI1ukDWtEogFCgkwMWZgJi/joj+cW3JWsvMcev5kIR+rTBJtjygQ6431QDqN9nCuOjmWjhl5dF/A3SP8wnDq/2mzo/stI4PteI+lubJQW1gV4z5P5sAVgHDZLbJQOMGsfNYvQkmeQTBu15tJaPe19tiSb7fL/mg/HKqL9tvFLxVCaxiYoBs5yXyrncCTVilgZR0JGWaIgOfzpx5APhfgeReZpXbXRhUfMGy2t+IHUIWi80c0D7N5GBzRPglMPDFgzuozL2B0/FcnjmT5m4Ay7AXLQXwRi37HwGRYuqd/SXlWPKHKKwBzfj7Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=egHy8/SPziC4cCf5u8St/5Kwj0ygkgKsVIh2n+TSoH8=;
 b=RPZWEHxxSFV0qhwT7VUe7hFMHsfUn0ngwAp2okcHMbvOfnTGGz94UISmJSUO43nrigqC0DkLgahx41LQyqaIgwV8rpLTTKEHatcJikhDbAN9omIETQtjh4d813hzl7BbdiMQd6d+r0lSVKh5NCghZ4Z9JPRCac9WxNxjboltNmvRbOefpSVqNJgpHutHOGVbb6472+6w6R+OcOr2XLzPqnLCXNAXORE8eIzUyWARZsmo9Wq7YfOo+mNIFmzlNS3ji5oPHKEWK8Q+d0QANqqLSLwfy9b0d/IKAheHmr9sNeyY+1DeyApEE+dGDjkm2q5Xh+PW/jyIcoDbBxBPyuou3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from SN6PR02MB4543.namprd02.prod.outlook.com (2603:10b6:805:b1::24)
 by SN1PR02MB3776.namprd02.prod.outlook.com (2603:10b6:802:2c::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Fri, 11 Jun
 2021 19:55:15 +0000
Received: from SN6PR02MB4543.namprd02.prod.outlook.com
 ([fe80::182b:62b8:51c1:ba59]) by SN6PR02MB4543.namprd02.prod.outlook.com
 ([fe80::182b:62b8:51c1:ba59%5]) with mapi id 15.20.4219.024; Fri, 11 Jun 2021
 19:55:15 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 4/7] vhost-user-blk: Add Error parameter to
 vhost_user_blk_start()
Thread-Topic: [PATCH 4/7] vhost-user-blk: Add Error parameter to
 vhost_user_blk_start()
Thread-Index: AQHXXUa+ySXx2h7Mc0i9fCjn+SXBSasPPNUA
Date: Fri, 11 Jun 2021 19:55:15 +0000
Message-ID: <20210611195514.GC26687@raphael-debian-dev>
References: <20210609154658.350308-1-kwolf@redhat.com>
 <20210609154658.350308-5-kwolf@redhat.com>
In-Reply-To: <20210609154658.350308-5-kwolf@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nutanix.com;
x-originating-ip: [24.193.215.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 11fe83d6-e6bb-44ae-6c9a-08d92d12d529
x-ms-traffictypediagnostic: SN1PR02MB3776:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN1PR02MB37768E3C764539FB28DCA595EA349@SN1PR02MB3776.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:800;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Zyos83bW12bgFletbMdeCu2eV9v/tkelCsCKBQ5Q2pztLqUEbVKxGj2uiJIL01o1GYsyznMUS3FbjHidCZi6E3WZyBtZAWzSA8mN5BGLXi9u47ZcvRF5TRnVUzOv/03UAMw/Rh9Uvjv0E9mUHFGEnceSs8nvEHjmYNKNAKfPXuvNSTWmev4zjNXxsir062krmNSZcWMReYzZt9iviN457vE6ykO8RneiIOpCKaLh6zekCVXbrXI8UHZqOzwny07BYdZfiOyF3YScne+QDELTULI7m0yGbdBDBoZW1N8rGaK2zCBb3ctGEt9l+mGWYJURIOZvNqP6RsgVFjsG0D/b7JXwr+cZTjmzGC5i3WKmcAnakrNZDqsmXFAMhGlW7S2HAKr0SvYGdyywV+lz3c04D+ww4zoUjjdj9SSPCtsKSD55GOSs7aAFdLf7vbYpWfJA+W6oioycaySbkcQNeppYlbDCW1dCAsjblVO6+95OemDRikxohLqXb/euZhoLjSKXCEPRaRutJi1/cEX5Tb0wAaWBfeX/R5BGOnbq8js65pbLvma4532tkPjfGeRzjl4eFt9f1HvfPH+7onb9jNoqilhILoBz2B/gXo0Lmu4fc2I=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4543.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(376002)(396003)(39860400002)(366004)(346002)(136003)(38100700002)(122000001)(66556008)(6512007)(8676002)(76116006)(8936002)(66946007)(2906002)(66476007)(5660300002)(91956017)(64756008)(9686003)(66446008)(6506007)(33656002)(83380400001)(6486002)(26005)(478600001)(316002)(86362001)(71200400001)(186003)(54906003)(44832011)(1076003)(4326008)(33716001)(6916009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?AsCPR1ogeH3w4j6CRz5eOaeanj3KfQ00g8CvgzPUhNu+WJpmsOS+gqadVIs/?=
 =?us-ascii?Q?hkGafFjLvfdP9H1ScCPCPGFqJN1G81UOdDYAokO8lzpCCxCx/qWNkSGzrENG?=
 =?us-ascii?Q?Xy5kREylbs81qQ64DsuvjHNFDsX8k2L+zlq0Ixvw0K+SKR6ICvgNtydWwb0I?=
 =?us-ascii?Q?Ydi11fhfW3/eovWJHr9c5STAK4jeGixiQYSkywmCaFpZkvX9BzaZ35PqfGI0?=
 =?us-ascii?Q?7F+h+af+k7QM9v5L4lG9njuVD5c0ysPFj+YPDE+CG9GZfzKgwEF0+steDoeu?=
 =?us-ascii?Q?2k0Omcfh9PmePDyFr/720NkLjiGfDbV/pVi78E9ivRvZn1bOiaL3LJbNlOTT?=
 =?us-ascii?Q?25MFWUW82Pnb80SISLImiuzxpk0/l3kOQ4QoamMK3QEE2EU+f8K7NJncKS3f?=
 =?us-ascii?Q?iaJ2rIVU2QqW/V0qqZTuMYHLPHhE4ac4zTMHCSHKKztx20UfwOJb75xTGabj?=
 =?us-ascii?Q?KNjExVHSkgXv1zmQ+diqUpaixHD5rhmZRecwOaKQVSs2/UDpkKZv/OjCyeqg?=
 =?us-ascii?Q?M/pXeflEjD2jsfkx08wa5AwHEmKgZXE+ra03J+ZopW3b6antt466vnOwf83v?=
 =?us-ascii?Q?IAL3wKEqfnlxonU6bw3zmPMA8bsYxpmXs1CqOrd1gEMzgNp2NlvH4DEfOFU7?=
 =?us-ascii?Q?M4aQy8XzEWUTDhxnpa9UWOvWxjIOc9LUPuWWcDsZii0xxjHFAKliiCudsgfo?=
 =?us-ascii?Q?y0GeA2V3edwUNNy9V/7Ekn21+NYnLEhXIAoXe/ssd3ivUDHu4IhbibDIHK/h?=
 =?us-ascii?Q?NeEA7lg7ySku3pqmtkRnoVo97cYT7j44pYW0SXslyervTvRQrgMTYOZqanTu?=
 =?us-ascii?Q?NZpQ0nrbuENFHLT8WFx7LiRczpWjSY8CmE36gDrvAVUGZDmP/Ua/3zDgJr6E?=
 =?us-ascii?Q?qb/TRHDZGVhf62tppwz1eYwKhkbe+hm3EWKtRwG3Rd5sK+ZHEv2SAGkwCGHa?=
 =?us-ascii?Q?kupf/q5yUBbZqDhBZuIg0uC4r/OK7f6UkMUPpQ8nvTEHz40X03ruhMX41VIr?=
 =?us-ascii?Q?yZIDiPI4B9d8ZeOhXVVOHKvbxTJo+tvVZ2RhWYELLwqdpXDR9AKIAqlyPHnZ?=
 =?us-ascii?Q?HepuLFf3El8XE2H3xzITq4N+AnCuBZsyeLc6VkH+kj1pgeQfjZbYfS1J/2lJ?=
 =?us-ascii?Q?OEp3bdLMS0f5H/AU+bsBdfsVwJNPoy6xNYsLESH5EB6YfRfPGYXrWyBtj7fe?=
 =?us-ascii?Q?5+aPZLCD4NvwomOoBMfjioWxbKTRZ8zuUpV5bPdLVNT42pgEDXQi5TP07HL6?=
 =?us-ascii?Q?TduSqpBWQXtJH+di0H3EvKbeRn9GqzImKqjARImBmK0zcbQchomjDThDrHxw?=
 =?us-ascii?Q?G/IPsfAx01mBfxEUjcWn4TrvIA/83D6LpDTjUDhtq5rbfw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0ED052CA0EC8F347A2B61F885E60FDA6@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4543.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11fe83d6-e6bb-44ae-6c9a-08d92d12d529
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2021 19:55:15.7439 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aLp9YOHDxgAKEY0RiHjdpM2/SYNdcnw13t2c5OlmTvfTn8/wA8pVVckKIb8Qr93HxqSBKsi9Fqq90IbEoHLd1cpys7ll9yUX3Hvw9yaJRwM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR02MB3776
X-Proofpoint-ORIG-GUID: Yz7fg2_4lXt6kV0bxfk8JqpIzqTY7mKa
X-Proofpoint-GUID: Yz7fg2_4lXt6kV0bxfk8JqpIzqTY7mKa
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-11_06:2021-06-11,
 2021-06-11 signatures=0
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "mst@redhat.com" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 09, 2021 at 05:46:55PM +0200, Kevin Wolf wrote:
> Instead of letting the caller make up a meaningless error message, add
> an Error parameter to allow reporting the real error.
>=20
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>

Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>

> ---
>  hw/block/vhost-user-blk.c | 31 +++++++++++++++----------------
>  1 file changed, 15 insertions(+), 16 deletions(-)
>=20
> diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> index 0cb56baefb..e9382e152a 100644
> --- a/hw/block/vhost-user-blk.c
> +++ b/hw/block/vhost-user-blk.c
> @@ -113,7 +113,7 @@ const VhostDevConfigOps blk_ops =3D {
>      .vhost_dev_config_notifier =3D vhost_user_blk_handle_config_change,
>  };
> =20
> -static int vhost_user_blk_start(VirtIODevice *vdev)
> +static int vhost_user_blk_start(VirtIODevice *vdev, Error **errp)
>  {
>      VHostUserBlk *s =3D VHOST_USER_BLK(vdev);
>      BusState *qbus =3D BUS(qdev_get_parent_bus(DEVICE(vdev)));
> @@ -121,19 +121,19 @@ static int vhost_user_blk_start(VirtIODevice *vdev)
>      int i, ret;
> =20
>      if (!k->set_guest_notifiers) {
> -        error_report("binding does not support guest notifiers");
> +        error_setg(errp, "binding does not support guest notifiers");
>          return -ENOSYS;
>      }
> =20
>      ret =3D vhost_dev_enable_notifiers(&s->dev, vdev);
>      if (ret < 0) {
> -        error_report("Error enabling host notifiers: %d", -ret);
> +        error_setg_errno(errp, -ret, "Error enabling host notifiers");
>          return ret;
>      }
> =20
>      ret =3D k->set_guest_notifiers(qbus->parent, s->dev.nvqs, true);
>      if (ret < 0) {
> -        error_report("Error binding guest notifier: %d", -ret);
> +        error_setg_errno(errp, -ret, "Error binding guest notifier");
>          goto err_host_notifiers;
>      }
> =20
> @@ -141,27 +141,27 @@ static int vhost_user_blk_start(VirtIODevice *vdev)
> =20
>      ret =3D vhost_dev_prepare_inflight(&s->dev, vdev);
>      if (ret < 0) {
> -        error_report("Error set inflight format: %d", -ret);
> +        error_setg_errno(errp, -ret, "Error setting inflight format");
>          goto err_guest_notifiers;
>      }
> =20
>      if (!s->inflight->addr) {
>          ret =3D vhost_dev_get_inflight(&s->dev, s->queue_size, s->inflig=
ht);
>          if (ret < 0) {
> -            error_report("Error get inflight: %d", -ret);
> +            error_setg_errno(errp, -ret, "Error getting inflight");
>              goto err_guest_notifiers;
>          }
>      }
> =20
>      ret =3D vhost_dev_set_inflight(&s->dev, s->inflight);
>      if (ret < 0) {
> -        error_report("Error set inflight: %d", -ret);
> +        error_setg_errno(errp, -ret, "Error setting inflight");
>          goto err_guest_notifiers;
>      }
> =20
>      ret =3D vhost_dev_start(&s->dev, vdev);
>      if (ret < 0) {
> -        error_report("Error starting vhost: %d", -ret);
> +        error_setg_errno(errp, -ret, "Error starting vhost");
>          goto err_guest_notifiers;
>      }
>      s->started_vu =3D true;
> @@ -214,6 +214,7 @@ static void vhost_user_blk_set_status(VirtIODevice *v=
dev, uint8_t status)
>  {
>      VHostUserBlk *s =3D VHOST_USER_BLK(vdev);
>      bool should_start =3D virtio_device_started(vdev, status);
> +    Error *local_err =3D NULL;
>      int ret;
> =20
>      if (!vdev->vm_running) {
> @@ -229,10 +230,9 @@ static void vhost_user_blk_set_status(VirtIODevice *=
vdev, uint8_t status)
>      }
> =20
>      if (should_start) {
> -        ret =3D vhost_user_blk_start(vdev);
> +        ret =3D vhost_user_blk_start(vdev, &local_err);
>          if (ret < 0) {
> -            error_report("vhost-user-blk: vhost start failed: %s",
> -                         strerror(-ret));
> +            error_reportf_err(local_err, "vhost-user-blk: vhost start fa=
iled: ");
>              qemu_chr_fe_disconnect(&s->chardev);
>          }
>      } else {
> @@ -270,6 +270,7 @@ static uint64_t vhost_user_blk_get_features(VirtIODev=
ice *vdev,
>  static void vhost_user_blk_handle_output(VirtIODevice *vdev, VirtQueue *=
vq)
>  {
>      VHostUserBlk *s =3D VHOST_USER_BLK(vdev);
> +    Error *local_err =3D NULL;
>      int i, ret;
> =20
>      if (!vdev->start_on_kick) {
> @@ -287,10 +288,9 @@ static void vhost_user_blk_handle_output(VirtIODevic=
e *vdev, VirtQueue *vq)
>      /* Some guests kick before setting VIRTIO_CONFIG_S_DRIVER_OK so star=
t
>       * vhost here instead of waiting for .set_status().
>       */
> -    ret =3D vhost_user_blk_start(vdev);
> +    ret =3D vhost_user_blk_start(vdev, &local_err);
>      if (ret < 0) {
> -        error_report("vhost-user-blk: vhost start failed: %s",
> -                     strerror(-ret));
> +        error_reportf_err(local_err, "vhost-user-blk: vhost start failed=
: ");
>          qemu_chr_fe_disconnect(&s->chardev);
>          return;
>      }
> @@ -340,9 +340,8 @@ static int vhost_user_blk_connect(DeviceState *dev, E=
rror **errp)
> =20
>      /* restore vhost state */
>      if (virtio_device_started(vdev, vdev->status)) {
> -        ret =3D vhost_user_blk_start(vdev);
> +        ret =3D vhost_user_blk_start(vdev, errp);
>          if (ret < 0) {
> -            error_setg_errno(errp, -ret, "vhost start failed");
>              return ret;
>          }
>      }
> --=20
> 2.30.2
> =

