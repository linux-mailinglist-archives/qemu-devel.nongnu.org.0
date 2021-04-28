Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9E136E02C
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 22:19:05 +0200 (CEST)
Received: from localhost ([::1]:44048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbqeG-0006Jg-69
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 16:19:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1lbqbx-0005m4-9x; Wed, 28 Apr 2021 16:16:42 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:21362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1lbqbt-0002nV-2T; Wed, 28 Apr 2021 16:16:41 -0400
Received: from pps.filterd (m0127840.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13SKC9aC020946; Wed, 28 Apr 2021 13:16:34 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=eKHnBTiSW5bNNbd504fv0r2bkd32rLZk4byxmgwIxko=;
 b=Vj3lOn0HwcYa2Z1fbj32JA7y1rJ3a0ph8kI3k404ejqMF2rnCBej5GA3RRdnNJkg0UQP
 piJ6tI0hyIQYuQLQv6G3WeGdqokj+j6c5IvIoL75vdV07ZnY/vlrVghCGTNYcu3BHZDH
 rVmDrcpu+EkuVzVVNSlXlwIcElZ5MVXTE+fwa92MvKqzpY7uLHXhYPh0mRr7uS8cpGnj
 Vt5ueVPrm8c4Pq6Obj7R5RptOix7RUB6PaJxRKYHAO+hlKpq2vums/QWmUWjieV/QYAg
 U8YXjvpjYd2GTPbZeWm+WzOfKCbNm+x3odkarQfA8qTgu5NtChrUMgXgnHR6bCUeXrxy /w== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2102.outbound.protection.outlook.com [104.47.58.102])
 by mx0a-002c1b01.pphosted.com with ESMTP id 386gy93s3e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Apr 2021 13:16:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C8RzVwZ7HzMeU7KBkQk+u0TeMx1aLWlnyXEak8+VGLhVByjDyxNmD3vV6WmSw9LGabbbQ3ZbDDug0lZi/x5orcd4QINTiZ9EWCjYJdtt4o79/+4vu7KfbRvBAsnDKUD6+aNkR4usvMOn/RQwOIYXl05NKRVRQ9qBvJY3s5BsH63FtzABWIgQC17cAJYTrJ/qCojsjLSpQvuirtN0WQfA9zf+nkTmN5PbBVp3IMqdpBu1+VKAxmRroWfXt10mUn3g1b+2bDLWoeEvxQBG5mizLGqiwv2YUkYYFi8dDg9keTJ8I3jlb7ewLQNoHgWyuoblo8RlgySi/T6eXl8EQBuvjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eKHnBTiSW5bNNbd504fv0r2bkd32rLZk4byxmgwIxko=;
 b=ay10PWD1XlmAo/SAJtbNqwomO6gM9XIR8ICVfrsiuqNlF0ifjI18UV6GVWNfgxGQixx1NivpRUal+XQDq9IDBfJT3FiYWhgzo+RH1GwLvTvnO0RDU3mxZE2z4Bfh7KqWUtpla/tJdewspeUmaTEH+YrKcDP4qCm6uLAjZN8CbotR0xA0l5HgnOq+WnJMxNve3D+rC/9CXmrTttTSGKEJvzM+EGUYgrIxaTEn7OTmCeHOCjFycgsBhovcklr3foYa5DUu1osNdf4t5dHNKPVDriE1X9D5ndSc6nmZ69sAcu1FG1W+qetWs6kJlPyhjOwKGrh0wNyiQeTIoWrizzU2bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from SN6PR02MB4543.namprd02.prod.outlook.com (2603:10b6:805:b1::24)
 by SA0PR02MB7338.namprd02.prod.outlook.com (2603:10b6:806:ec::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Wed, 28 Apr
 2021 20:16:31 +0000
Received: from SN6PR02MB4543.namprd02.prod.outlook.com
 ([fe80::bdbb:69ac:63f9:fc33]) by SN6PR02MB4543.namprd02.prod.outlook.com
 ([fe80::bdbb:69ac:63f9:fc33%7]) with mapi id 15.20.4065.026; Wed, 28 Apr 2021
 20:16:31 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 5/5] vhost-user-blk: Check that num-queues is supported by
 backend
Thread-Topic: [PATCH 5/5] vhost-user-blk: Check that num-queues is supported
 by backend
Thread-Index: AQHXN5lVOje9JPloD024G/q4BshF86rKZ40A
Date: Wed, 28 Apr 2021 20:16:31 +0000
Message-ID: <20210428201630.GD20605@raphael-debian-dev>
References: <20210422170221.285006-1-kwolf@redhat.com>
 <20210422170221.285006-6-kwolf@redhat.com>
In-Reply-To: <20210422170221.285006-6-kwolf@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nutanix.com;
x-originating-ip: [69.122.45.60]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 18625edf-f304-42d9-6915-08d90a82834f
x-ms-traffictypediagnostic: SA0PR02MB7338:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA0PR02MB73382536A8E082FFD7AAFE2FEA409@SA0PR02MB7338.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:1169;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 83OhGxOqYNhZYup7asV+c7NZPhNSXGsFyCTCVOlFGubmoG9aqJMWubSnJ84LH9AAJXKCjEtaWfnzOtdtZmctL1loCyY+3+vu/l1o68V6oTcphCVE3BaU+1ebT2SgCADyXSpoBOzCvCcsm59W4Zn9hYFwLl8LsylRhNV6EUsg4YkkhTY4ipkV8O3wU4gMGicpxa9o7zdsw4TQq2OmovysgwnlVuFRxjUhf5zb7py+GB516uBnTtVCVFPxKDcFjNSYIOk4QkwUXlgMTfm+TrwG1lmyWPGrtkit6TZ2psQJU1WksbvLXxZyJGpyRlHQAHj63ZU+J4g05KZfDHspmyCZ9rqgHg+0TEJxWGZx3LNGHAGa7Kz4TEFs1qVaZlDpzYxQyF3tlXP/JbzX63fqN64438Tp1NRL9NaA0JKC4SriTYtHWpdDe2XLy3CFVGHHeq8dPJ38VnntDNoMBQpnpAK07K05fkLwUxjz3/lJ38safc0tL1UXjXcx65zOI9ahbQxaZIdMT+GXBf9PKvyWJYgV/AfKotqM3YFeNp5XqeMleo29yznZ0NpAXG94YxNfh+FEO9GlyjIbGGfSkpvilu5/PlgOSFUwr7QfelpvOuQuUDu/f09PwqUHhM4BHaCKXj4IopUMqKU2Co8bvru60EcS/Omos6y2WxL3Dpm7oNwsnqPRl28NhEPu0s67qzN5id+2
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4543.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(346002)(366004)(376002)(136003)(396003)(39860400002)(38100700002)(86362001)(9686003)(6506007)(66556008)(8676002)(6916009)(66476007)(2906002)(4326008)(8936002)(6486002)(1076003)(122000001)(6512007)(54906003)(966005)(186003)(44832011)(478600001)(76116006)(316002)(91956017)(33656002)(71200400001)(5660300002)(64756008)(83380400001)(66946007)(66446008)(26005)(33716001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?I2TS/La1lG/5AKFL1LZ8/HTbcjMpdhUu83FiBNaveL4hbf7+cWRprcig8c3y?=
 =?us-ascii?Q?z4ixdIVJ2J7zTj8CuqoZ/J1NtMv7VzPxWkXNDriMmjcjRM3d7EJcwl7FyqKR?=
 =?us-ascii?Q?0VqMMa80I2+iM0LtIq38S3/ayds93KeZLxIVG66MHkwbeoXgJBSTGWFzFSOD?=
 =?us-ascii?Q?RYQjUJupSMHf3xDJqgKmeTjFFGRbj8w4/QHQSPsZbdPr9JmsqxnGZoA6Q8c9?=
 =?us-ascii?Q?A5qHEclstYDfXDhabtQL5Z14ljTnnldl3ttUs7/smz7MJYHImY+WESuCSgJg?=
 =?us-ascii?Q?P8hZ0Ff4V7lqCtxmTVUqGDT3yZt44jfswqVl5tC4NcGCOgNXe64PvLsyVv83?=
 =?us-ascii?Q?558Tuv1c9hcJzHVrRMJLB0KZy6lofr3DaPmV4n3kSg4AJFZrOnpKLZlj52il?=
 =?us-ascii?Q?ke4FKptfuTIbpHg8r41StE1Cy3H9gjK+5yqB6sB2hZGfZIIN7YNwjhuEJ72U?=
 =?us-ascii?Q?GDe5mQy/coSh5Ls9UuN1Pu2QLj1kvkjbvnsBkkS5hPWmhLfEKwRI3JQi5z0g?=
 =?us-ascii?Q?dPrqctLFAKmmjF6vDGSpyTTpX8T0uNLlTqqk2gUCizuOFvffAdkNLQ0tbc6+?=
 =?us-ascii?Q?3GthiPu6+eM714b9OFcWHcYLxmC8Yn+Mp1jX+3S/Ai2vVY5sfrNNSvdp+Zh7?=
 =?us-ascii?Q?8rvXgl483HdUlKuG4V2Ya8KdRhrJ9BZgu6luBxImds/6CvuueCt1D/ELNDNm?=
 =?us-ascii?Q?SeylQPjhh5j9xMEvRBinifD69HWnBQm9rS2gkIt7W/xktUODHfLVMOs3XBKw?=
 =?us-ascii?Q?rYlBbu5JESV54CYAy5hLuajnL08UBcv92g0ftjy/XXdvaVBNVkX5CK1AOf6B?=
 =?us-ascii?Q?HrKgx9Cy7KvKabctxOhVeo84x/391hGkrRN3cYwGyVirSV6brQNcB49VrJWm?=
 =?us-ascii?Q?y2t8MlTy35n8gCpmN2nVvRCBiKFu5a/wQlHWlwJ9NpNssevYZs8JSB3cOe2W?=
 =?us-ascii?Q?0UFIevfA/hzxSHqi5NdsQ5ICiPseyLnjdpg010lijhdZ07Jj3uxZFYFmoGjL?=
 =?us-ascii?Q?92s+qt0lsHjIqm3PdlzSDWHxAbyCI/eZrcfPQMRcOu9lnEiLAcIuuwfVf8pG?=
 =?us-ascii?Q?U1LKTrItm7PHJXO8eZ7Nh6TjVmLa8Q9LhHMG1a1IqkZoC5KkE1dMMNRmuKIz?=
 =?us-ascii?Q?Ram7lqSGSbL3W4E8Zk5esYqDotiALjtL0qgBIeiwpIaQjm1+nkquRIVTtVgz?=
 =?us-ascii?Q?gZw6lF8G90Z9Eoetek60qxUSOWZ1rwd5bRqGMHZoIy24ZVN8Bb8/EvNFAZrg?=
 =?us-ascii?Q?imiMdzvQht1Ypl0DL97UPWdazj3f4rofAh4sUza3IyhH4bZ4zGSpaoP0oa9c?=
 =?us-ascii?Q?unxShLKpBU5bmejBpCvkkxXU?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F543D7EDE912204289DD2EE2C1D41EBC@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4543.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18625edf-f304-42d9-6915-08d90a82834f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2021 20:16:31.3252 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ltwfYj65RnT8wMc60RWgAbbEXrUhEjWhxwlpRojNBKIWgco9BhCZtf+ZcSzSA9pcphlUaqX8dSj+L4SWgUchyfweqMmXFm8yCMJNRAUZP5U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR02MB7338
X-Proofpoint-ORIG-GUID: QF7tkcT6_fwPVxxvBPffOQQMEH7HLSZj
X-Proofpoint-GUID: QF7tkcT6_fwPVxxvBPffOQQMEH7HLSZj
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-28_13:2021-04-28,
 2021-04-28 signatures=0
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: "den-plotnikov@yandex-team.ru" <den-plotnikov@yandex-team.ru>,
 "mst@redhat.com" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>

On Thu, Apr 22, 2021 at 07:02:21PM +0200, Kevin Wolf wrote:
> Creating a device with a number of queues that isn't supported by the
> backend is pointless, the device won't work properly and the error
> messages are rather confusing.
>=20
> Just fail to create the device if num-queues is higher than what the
> backend supports.
>=20
> Since the relationship between num-queues and the number of virtqueues
> depends on the specific device, this is an additional value that needs
> to be initialised by the device. For convenience, allow leaving it 0 if
> the check should be skipped. This makes sense for vhost-user-net where
> separate vhost devices are used for the queues and custom initialisation
> code is needed to perform the check.
>=20
> Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=3D1935031
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  include/hw/virtio/vhost.h | 2 ++
>  hw/block/vhost-user-blk.c | 1 +
>  hw/virtio/vhost-user.c    | 5 +++++
>  3 files changed, 8 insertions(+)
>=20
> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
> index 4a8bc75415..21a9a52088 100644
> --- a/include/hw/virtio/vhost.h
> +++ b/include/hw/virtio/vhost.h
> @@ -74,6 +74,8 @@ struct vhost_dev {
>      int nvqs;
>      /* the first virtqueue which would be used by this vhost dev */
>      int vq_index;
> +    /* if non-zero, minimum required value for max_queues */
> +    int num_queues;
>      uint64_t features;
>      uint64_t acked_features;
>      uint64_t backend_features;
> diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> index b6f4bb3f6f..ac2193abef 100644
> --- a/hw/block/vhost-user-blk.c
> +++ b/hw/block/vhost-user-blk.c
> @@ -324,6 +324,7 @@ static int vhost_user_blk_connect(DeviceState *dev, E=
rror **errp)
>      }
>      s->connected =3D true;
> =20
> +    s->dev.num_queues =3D s->num_queues;
>      s->dev.nvqs =3D s->num_queues;
>      s->dev.vqs =3D s->vhost_vqs;
>      s->dev.vq_index =3D 0;
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index ded0c10453..ee57abe045 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -1909,6 +1909,11 @@ static int vhost_user_backend_init(struct vhost_de=
v *dev, void *opaque)
>                  return err;
>              }
>          }
> +        if (dev->num_queues && dev->max_queues < dev->num_queues) {
> +            error_report("The maximum number of queues supported by the =
"
> +                         "backend is %" PRIu64, dev->max_queues);
> +            return -EINVAL;
> +        }
> =20
>          if (virtio_has_feature(features, VIRTIO_F_IOMMU_PLATFORM) &&
>                  !(virtio_has_feature(dev->protocol_features,
> --=20
> 2.30.2
> =

