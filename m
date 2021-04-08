Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F4E359048
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 01:22:46 +0200 (CEST)
Received: from localhost ([::1]:54762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUdz3-0000u9-8a
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 19:22:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1lUdxw-00007a-6U
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 19:21:36 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:49552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1lUdxr-0005U8-F4
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 19:21:35 -0400
Received: from pps.filterd (m0127838.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 138NJ64c019552; Thu, 8 Apr 2021 16:21:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=RhpoZpU/aaOeRMcyP/cYCjf5SyCsUcqhWkBod0bQ2HU=;
 b=iZUCiw8FJZkGoeXYh9BMj0rJeZClK5vyTjq8H/R86D8SXiUz6ftHXgwJH9XO6u/OWL89
 ib8c3P6ejJcFEA6LGC0JuV5ZYhXE8TU05gQIhQ5jZgBUTYgrwQ5sgFUjqwPqHcdrAZoG
 dz3k7kBQmUymYJaFjax2RU/g8OX/A+XqgIu/rf9/+imOKpiR47GfE3r5euPgIM2/SdyQ
 4dlCAW8OUboVjgByw02pXEA1d+hpUeTlIHA4RAs1zWN/IhrXebnH0aB/pI5YWHmXxZcf
 qlj8uf2lUyUHBx4O7AxYYchxh+lwipvPcg+HsyMmZPoojIMOzqa8u1sA3SuDQkGCtlgu rA== 
Received: from nam02-bl2-obe.outbound.protection.outlook.com
 (mail-bl2nam02lp2050.outbound.protection.outlook.com [104.47.38.50])
 by mx0a-002c1b01.pphosted.com with ESMTP id 37sygdsrg1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Apr 2021 16:21:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iDwjHPolPG6rhfC74fRAVt1jxxOZu3M2ae7D5fz6RzvKyRxbqnHCHjMWQ5CsmNOKMXXc4lQjTsHu5DMAmZNZ8lWlV8/3mBn6G6NxmOS07jTfgYzVdvq/cq7O2tegaCO8133WOyTcY3zFxze4DShnuibB02/HInlxQ+f7r3Y9wXpim7C3tvK/rpmMRuNF5lQBRqg9c7pjpwemcfUTfbbfJ9tgapw7KEL0ANGtreAOVTEoSBzNOoJWernh40gCYB4HpT+nVEyW0iPoJbg2NpGC9A5a+9zoQgdJHGQknFBllSg7iq6p6mOQB6ckATenSEtC9GBNaDyC6KmTpk7yvzWCTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RhpoZpU/aaOeRMcyP/cYCjf5SyCsUcqhWkBod0bQ2HU=;
 b=TxcC+7fYg5Y/aqvdxUNqSdx7GrZ3xgxz3IIVdDcEsket9wqaLUTTM6mp4xsRPX7RKM3O3Vzmt9PU+IWXbNBSfoJHnPxOalvi4SWPPk2Wq9txl7loRlBMb+ppYvtwS/N42W4o4M3C5hwxlFyonvxWCqyVdBbTNPRP+vuKPZ8Hd8r3m26JiVEKKCMRUY2lbLXs4WZsL7pgwjYm/wpwFknRtUUMqHP6zrYTl7prryoHCb5QF9/zY3MjB+NXwj3H6tZcACGrOdSpp/JM3llXVhJxJzqJaafI3iBBd6mBW7IESjbsnSJpEwcHOUn55oq1u3hkiO1pDjOorkmmnOE1SKIWJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from SN6PR02MB4543.namprd02.prod.outlook.com (2603:10b6:805:b1::24)
 by SA2PR02MB7706.namprd02.prod.outlook.com (2603:10b6:806:14c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Thu, 8 Apr
 2021 23:21:21 +0000
Received: from SN6PR02MB4543.namprd02.prod.outlook.com
 ([fe80::7139:d6a4:cf94:c4b1]) by SN6PR02MB4543.namprd02.prod.outlook.com
 ([fe80::7139:d6a4:cf94:c4b1%4]) with mapi id 15.20.3999.034; Thu, 8 Apr 2021
 23:21:21 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Xie Yongji <xieyongji@bytedance.com>
Subject: Re: [PATCH 2/3] vhost-blk: Add vhost-blk-common abstraction
Thread-Topic: [PATCH 2/3] vhost-blk: Add vhost-blk-common abstraction
Thread-Index: AQHXLF/VXL1HNTU4Lkik6XdHeuI++6qrQv6A
Date: Thu, 8 Apr 2021 23:21:21 +0000
Message-ID: <20210408232115.GA17518@raphael-debian-dev>
References: <20210408101252.552-1-xieyongji@bytedance.com>
 <20210408101252.552-3-xieyongji@bytedance.com>
In-Reply-To: <20210408101252.552-3-xieyongji@bytedance.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
authentication-results: bytedance.com; dkim=none (message not signed)
 header.d=none;bytedance.com; dmarc=none action=none header.from=nutanix.com;
x-originating-ip: [24.94.68.249]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 707bc753-d078-45de-e8d7-08d8fae5055c
x-ms-traffictypediagnostic: SA2PR02MB7706:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA2PR02MB7706386E51B89F2A7F2F8CC2EA749@SA2PR02MB7706.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OsYp9wO8WDO4KazcsuZzpmvuMjMC+WNpl8sBpjCB0z9d1PYE8WUox8ckmdPUo30/Yd7hdr2dwAZhyQUHqBl024umcKAsiwwfSNRgmv05HC8FJcz8yviRCquEeXKhG4mCzdNVfGNDSrYSNJgSFAtd8C5p+23LUYVHq4EHvNYx+5U9kCBLXoDTignJ3svN/51RqnTjJcWffko0LZenl0NrQ5RulYOCa5+hE+JzMIGZ8Ie9EtM8DrxRisaGpu+duN8tgMiDjQ+2HeotVsG4y3Ufd6843SEsaWqgG+vGGW8eHB+w1BIc47KIIAscL5kZMzVkAYJXQyBwO8zSjj/QVE8W/J3oKgrMTp+KX/xBTut0b4zTEIDNLo7XGZHJ9Ax1xKoL6dCh1Nn8MEp5HUtC8qBqh3LIZuiDeeaeTeR3XCpVw7gYIRQi3rzIBHmJWoQ9F0m7skMaDbEX8/kd08N3nBIzvCHgtpErgvYf+vvS1rBrO0zreryrgbV+Yx8VZ6f7iYMzIi9P9kpKklWT4mw/aj0r9nkmIw1PZuBsPypLppX79W3lfC2TUCLwQHjR5HHFNpP6WhfK7Z/hHwZvE81HYflG9m+L3SgM5VDbScieJ9owE9iMa8mYIcdQjujKpUmLFb625I8SZjMDDHBYlptElxTqHGnoSiL482AV3cpxoksIuPQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4543.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(396003)(39860400002)(376002)(346002)(136003)(366004)(86362001)(38100700001)(8936002)(316002)(7416002)(4326008)(6512007)(9686003)(54906003)(30864003)(8676002)(1076003)(2906002)(6916009)(478600001)(91956017)(66946007)(5660300002)(44832011)(33716001)(33656002)(26005)(6486002)(83380400001)(71200400001)(186003)(6506007)(76116006)(66476007)(66446008)(66556008)(64756008)(579004)(559001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?szC1V2+mQM9nLoYfSjmMsPjJ0yyd6jDfDJaBM1pyd4l2lzYccwiPkA1YZUEI?=
 =?us-ascii?Q?dH+ufes8YVU2/nXmkV7KONNhLFvlwk8u5BMJg98pSRTExuHB/7T3+YlDZbH8?=
 =?us-ascii?Q?5DxbYHqYeTgUp+ke0m/ALSUE4k/HzB0Vxz5TtCI75t99EaOUJxVJZhRFWtdh?=
 =?us-ascii?Q?1SmpWrs8aWPfxmXglhNbjWejs/XfORQTpDpVd7WVl11p74fiZuA8EI5DjdEx?=
 =?us-ascii?Q?cK0KAvzR1+CQ1bazeGK14OqanWT8OPgW/aqPRg1NUFHxM81TRUO+cOXYWdD1?=
 =?us-ascii?Q?hBZi1PRgyg6SgURzSisTwhk/M1jsXd7afJvNE+7MiHLdDMnhkaKrmoZnsTS0?=
 =?us-ascii?Q?4VTX3qhTwsnUB1/j7VLUoOt3Z1sTYL8BAnL0AGGvuI3u6ZNYY7Y9pjSEmfyO?=
 =?us-ascii?Q?GWZMDIfCluDYk5ihRV5gMx+1TatSBKueDvy2yilekjsctNEpNdVbtjn+VWS+?=
 =?us-ascii?Q?NQuCPBConEh7U+jjJLCsdNgxIn3gIxyVtjQE0/1YuVySNfyd0xwLkFwQJzZo?=
 =?us-ascii?Q?yIAtAX3puN03U8Mrm/lb/DF5VNKR/DqKRmOLz6JIImX/DXRMGRC0TXOx3Dta?=
 =?us-ascii?Q?yqJDd5ZMKDRaB9lHN3NxVTnKn5KWtYIuRvXRRGg90lTk2lNoUXjMhwM/JQ+i?=
 =?us-ascii?Q?rgEkQeUeBXrKVqBkY64EGjxZ2hTXqxCwKUpX2GxcdTyAwBJwto7rNcB1EHEY?=
 =?us-ascii?Q?ck2CTpi9BptyiT9NdyJ331drQTfi2fB9cVx1gEic5NYBLNSWpGpvWEi99rkg?=
 =?us-ascii?Q?NjEGRWBEpQgFt/x+YtugGn8aiD6RVouhfh5kr5650zFnlwjq7FOZ2PZzzimr?=
 =?us-ascii?Q?02PIUt3l3rxAGUw06omb0+TD71diU1+yOyUeHfTMfiavGsE51hBTyuBxLqxS?=
 =?us-ascii?Q?+CcUvQxoFdWK5AYxBO2OkRoZ4iz/DSQ+yz95dMUjVql27qW1lM+Xd/iso0LE?=
 =?us-ascii?Q?nkcjMzL7nPjweuDwsy0bsxmAivkEKll/aw0myRpamoac+qAXkIunJ+dwIksD?=
 =?us-ascii?Q?xnGx1c8C12orbW383qU/0DcFPJeyr+YPiSW6SB4BHHjZTSFAMFsd6RebYhN0?=
 =?us-ascii?Q?xHSFFo91PUDh5/3ZG7SBA+J0pl9m+EM2HjLJvPaaNYmsXh2KlLHuCiK6/xhU?=
 =?us-ascii?Q?q1Lk3KBRt09XBUCpIYewTlflwb+4ycYleO57N54SP4BNu+x8VGmvkFdxOrcQ?=
 =?us-ascii?Q?rOt0oDXoZFjr229bu0b3U5XZ/AwQkhYcsh+Xuv8kvRnVWYeHsGmDQxCaV3hW?=
 =?us-ascii?Q?rUga0uc9gIXhUbPolJ7Ir1t/XCVjKmMOYBCfn9hMvddg0hm2MN7JLh5o2fIx?=
 =?us-ascii?Q?ZAXKSmkgOtLiZcVae00HyCl8?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <965807C73970C74E8371D9FAA2656714@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4543.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 707bc753-d078-45de-e8d7-08d8fae5055c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2021 23:21:21.6015 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /26QbLnJ61tJNeyjW9UbYDW5uKx7MPkNrMmWT5m5I3AKTICCrkJJjKsTuIxFe1EKxihJre6arW9y1oThVYnvT7Shn7UzKNQBPCUs45J3Bsc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR02MB7706
X-Proofpoint-GUID: I-vQhy7C7PTf7db_IVlxaVDa5Re1JtzS
X-Proofpoint-ORIG-GUID: I-vQhy7C7PTf7db_IVlxaVDa5Re1JtzS
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-08_10:2021-04-08,
 2021-04-08 signatures=0
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: "kwolf@redhat.com" <kwolf@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "lingshan.zhu@intel.com" <lingshan.zhu@intel.com>,
 "mreitz@redhat.com" <mreitz@redhat.com>,
 "changpeng.liu@intel.com" <changpeng.liu@intel.com>,
 "sgarzare@redhat.com" <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I'm mostly happy with this. Just some asks on variable renaming and
comments which need to be fixed because of how you've moved things
around.

Also let's add a MAINTAINERS entry vhost-blk-common.h/c either under
vhost-user-blk or create a new vhost-blk entry. I'm not sure what the
best practices are for this.=20

On Thu, Apr 08, 2021 at 06:12:51PM +0800, Xie Yongji wrote:
> This commit abstracts part of vhost-user-blk into a common
> parent class which is useful for the introducation of vhost-vdpa-blk.
>=20
> Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
> ---
>  hw/block/meson.build                 |   2 +-
>  hw/block/vhost-blk-common.c          | 291 +++++++++++++++++++++++++
>  hw/block/vhost-user-blk.c            | 306 +++++----------------------
>  hw/virtio/vhost-user-blk-pci.c       |   7 +-
>  include/hw/virtio/vhost-blk-common.h |  50 +++++
>  include/hw/virtio/vhost-user-blk.h   |  20 +-
>  6 files changed, 396 insertions(+), 280 deletions(-)
>  create mode 100644 hw/block/vhost-blk-common.c
>  create mode 100644 include/hw/virtio/vhost-blk-common.h
>=20
> diff --git a/hw/block/meson.build b/hw/block/meson.build
> index 5b4a7699f9..5862bda4cb 100644
> --- a/hw/block/meson.build
> +++ b/hw/block/meson.build
> @@ -16,6 +16,6 @@ softmmu_ss.add(when: 'CONFIG_TC58128', if_true: files('=
tc58128.c'))
>  softmmu_ss.add(when: 'CONFIG_NVME_PCI', if_true: files('nvme.c', 'nvme-n=
s.c', 'nvme-subsys.c', 'nvme-dif.c'))
> =20
>  specific_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-blk.c'=
))
> -specific_ss.add(when: 'CONFIG_VHOST_USER_BLK', if_true: files('vhost-use=
r-blk.c'))
> +specific_ss.add(when: 'CONFIG_VHOST_USER_BLK', if_true: files('vhost-blk=
-common.c', 'vhost-user-blk.c'))
> =20
>  subdir('dataplane')
> diff --git a/hw/block/vhost-blk-common.c b/hw/block/vhost-blk-common.c
> new file mode 100644
> index 0000000000..96500f6c89
> --- /dev/null
> +++ b/hw/block/vhost-blk-common.c
> @@ -0,0 +1,291 @@
> +/*
> + * Parent class for vhost based block devices
> + *
> + * Copyright (C) 2021 Bytedance Inc. and/or its affiliates. All rights r=
eserved.
> + *
> + * Author:
> + *   Xie Yongji <xieyongji@bytedance.com>
> + *
> + * Heavily based on the vhost-user-blk.c by:
> + *   Changpeng Liu <changpeng.liu@intel.com>

You should probably also give credit to Felipe, Setfan and Nicholas, as
a lot of vhost-user-blk orignally came from their work.

> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + *
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "qemu/error-report.h"
> +#include "qemu/cutils.h"
> +#include "hw/qdev-core.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/qdev-properties-system.h"
> +#include "hw/virtio/vhost.h"
> +#include "hw/virtio/virtio.h"
> +#include "hw/virtio/virtio-bus.h"
> +#include "hw/virtio/virtio-access.h"
> +#include "hw/virtio/vhost-blk-common.h"
> +#include "sysemu/sysemu.h"
> +#include "sysemu/runstate.h"
> +
> +static void vhost_blk_common_update_config(VirtIODevice *vdev, uint8_t *=
config)
> +{
> +    VHostBlkCommon *vbc =3D VHOST_BLK_COMMON(vdev);
> +
> +    /* Our num_queues overrides the device backend */
> +    virtio_stw_p(vdev, &vbc->blkcfg.num_queues, vbc->num_queues);
> +
> +    memcpy(config, &vbc->blkcfg, sizeof(struct virtio_blk_config));
> +}
> +
> +static void vhost_blk_common_set_config(VirtIODevice *vdev,
> +                                        const uint8_t *config)
> +{
> +    VHostBlkCommon *vbc =3D VHOST_BLK_COMMON(vdev);
> +    struct virtio_blk_config *blkcfg =3D (struct virtio_blk_config *)con=
fig;
> +    int ret;
> +
> +    if (blkcfg->wce =3D=3D vbc->blkcfg.wce) {
> +        return;
> +    }
> +
> +    ret =3D vhost_dev_set_config(&vbc->dev, &blkcfg->wce,
> +                               offsetof(struct virtio_blk_config, wce),
> +                               sizeof(blkcfg->wce),
> +                               VHOST_SET_CONFIG_TYPE_MASTER);
> +    if (ret) {
> +        error_report("set device config space failed");
> +        return;
> +    }
> +
> +    vbc->blkcfg.wce =3D blkcfg->wce;
> +}
> +
> +static int vhost_blk_common_handle_config_change(struct vhost_dev *dev)
> +{
> +    VHostBlkCommon *vbc =3D VHOST_BLK_COMMON(dev->vdev);
> +    struct virtio_blk_config blkcfg;
> +    int ret;
> +
> +    ret =3D vhost_dev_get_config(dev, (uint8_t *)&blkcfg,
> +                               sizeof(struct virtio_blk_config));
> +    if (ret < 0) {
> +        error_report("get config space failed");
> +        return ret;
> +    }
> +
> +    /* valid for resize only */
> +    if (blkcfg.capacity !=3D vbc->blkcfg.capacity) {
> +        vbc->blkcfg.capacity =3D blkcfg.capacity;
> +        memcpy(dev->vdev->config, &vbc->blkcfg,
> +               sizeof(struct virtio_blk_config));
> +        virtio_notify_config(dev->vdev);
> +    }
> +
> +    return 0;
> +}
> +
> +const VhostDevConfigOps blk_ops =3D {
> +    .vhost_dev_config_notifier =3D vhost_blk_common_handle_config_change=
,
> +};
> +
> +static uint64_t vhost_blk_common_get_features(VirtIODevice *vdev,
> +                                              uint64_t features,
> +                                              Error **errp)
> +{
> +    VHostBlkCommon *vbc =3D VHOST_BLK_COMMON(vdev);
> +
> +    /* Turn on pre-defined features */
> +    virtio_add_feature(&features, VIRTIO_BLK_F_SEG_MAX);
> +    virtio_add_feature(&features, VIRTIO_BLK_F_GEOMETRY);
> +    virtio_add_feature(&features, VIRTIO_BLK_F_TOPOLOGY);
> +    virtio_add_feature(&features, VIRTIO_BLK_F_BLK_SIZE);
> +    virtio_add_feature(&features, VIRTIO_BLK_F_FLUSH);
> +    virtio_add_feature(&features, VIRTIO_BLK_F_RO);
> +    virtio_add_feature(&features, VIRTIO_BLK_F_DISCARD);
> +    virtio_add_feature(&features, VIRTIO_BLK_F_WRITE_ZEROES);
> +
> +    if (vbc->config_wce) {
> +        virtio_add_feature(&features, VIRTIO_BLK_F_CONFIG_WCE);
> +    }
> +    if (vbc->num_queues > 1) {
> +        virtio_add_feature(&features, VIRTIO_BLK_F_MQ);
> +    }
> +
> +    return vhost_get_features(&vbc->dev, vbc->feature_bits, features);
> +}
> +
> +int vhost_blk_common_start(VHostBlkCommon *vbc)
> +{
> +    VirtIODevice *vdev =3D VIRTIO_DEVICE(vbc);
> +    BusState *qbus =3D BUS(qdev_get_parent_bus(DEVICE(vdev)));
> +    VirtioBusClass *k =3D VIRTIO_BUS_GET_CLASS(qbus);
> +    int i, ret;
> +
> +    if (!k->set_guest_notifiers) {
> +        error_report("binding does not support guest notifiers");
> +        return -ENOSYS;
> +    }
> +
> +    ret =3D vhost_dev_enable_notifiers(&vbc->dev, vdev);
> +    if (ret < 0) {
> +        error_report("Error enabling host notifiers: %d", -ret);
> +        return ret;
> +    }
> +
> +    ret =3D k->set_guest_notifiers(qbus->parent, vbc->dev.nvqs, true);
> +    if (ret < 0) {
> +        error_report("Error binding guest notifier: %d", -ret);
> +        goto err_host_notifiers;
> +    }
> +
> +    vbc->dev.acked_features =3D vdev->guest_features;
> +
> +    ret =3D vhost_dev_prepare_inflight(&vbc->dev, vdev);
> +    if (ret < 0) {
> +        error_report("Error set inflight format: %d", -ret);
> +        goto err_guest_notifiers;
> +    }
> +
> +    if (!vbc->inflight->addr) {
> +        ret =3D vhost_dev_get_inflight(&vbc->dev, vbc->queue_size, vbc->=
inflight);
> +        if (ret < 0) {
> +            error_report("Error get inflight: %d", -ret);
> +            goto err_guest_notifiers;
> +        }
> +    }
> +
> +    ret =3D vhost_dev_set_inflight(&vbc->dev, vbc->inflight);
> +    if (ret < 0) {
> +        error_report("Error set inflight: %d", -ret);
> +        goto err_guest_notifiers;
> +    }
> +
> +    ret =3D vhost_dev_start(&vbc->dev, vdev);
> +    if (ret < 0) {
> +        error_report("Error starting vhost: %d", -ret);
> +        goto err_guest_notifiers;
> +    }

I think this will create confusion with vhost_dev->started, which is why
I wanted it named started_vu. Can we change this to started_vbc or
something like that?

> +    vbc->started =3D true;
> +
> +    /* guest_notifier_mask/pending not used yet, so just unmask
> +     * everything here. virtio-pci will do the right thing by
> +     * enabling/disabling irqfd.
> +     */
> +    for (i =3D 0; i < vbc->dev.nvqs; i++) {
> +        vhost_virtqueue_mask(&vbc->dev, vdev, i, false);
> +    }
> +
> +    return ret;
> +
> +err_guest_notifiers:
> +    k->set_guest_notifiers(qbus->parent, vbc->dev.nvqs, false);
> +err_host_notifiers:
> +    vhost_dev_disable_notifiers(&vbc->dev, vdev);
> +    return ret;
> +}
> +
> +void vhost_blk_common_stop(VHostBlkCommon *vbc)
> +{
> +    VirtIODevice *vdev =3D VIRTIO_DEVICE(vbc);
> +    BusState *qbus =3D BUS(qdev_get_parent_bus(DEVICE(vdev)));
> +    VirtioBusClass *k =3D VIRTIO_BUS_GET_CLASS(qbus);
> +    int ret;
> +
> +    if (!vbc->started) {
> +        return;
> +    }
> +    vbc->started =3D false;
> +
> +    if (!k->set_guest_notifiers) {
> +        return;
> +    }
> +
> +    vhost_dev_stop(&vbc->dev, vdev);
> +
> +    ret =3D k->set_guest_notifiers(qbus->parent, vbc->dev.nvqs, false);
> +    if (ret < 0) {
> +        error_report("vhost guest notifier cleanup failed: %d", ret);
> +        return;
> +    }
> +
> +    vhost_dev_disable_notifiers(&vbc->dev, vdev);
> +}
> +
> +void vhost_blk_common_realize(VHostBlkCommon *vbc,
> +                              VirtIOHandleOutput handle_output,
> +                              Error **errp)
> +{
> +    VirtIODevice *vdev =3D VIRTIO_DEVICE(vbc);
> +    int i;
> +
> +    if (vbc->num_queues =3D=3D VHOST_BLK_AUTO_NUM_QUEUES) {
> +        vbc->num_queues =3D 1;
> +    }
> +
> +    if (!vbc->num_queues || vbc->num_queues > VIRTIO_QUEUE_MAX) {
> +        error_setg(errp, "vhost-blk-common: invalid number of IO queues"=
);
> +        return;
> +    }
> +
> +    if (!vbc->queue_size) {
> +        error_setg(errp, "vhost-blk-common: queue size must be non-zero"=
);
> +        return;
> +    }
> +
> +    virtio_init(vdev, "virtio-blk", VIRTIO_ID_BLOCK,
> +                sizeof(struct virtio_blk_config));
> +
> +    vbc->virtqs =3D g_new(VirtQueue *, vbc->num_queues);
> +    for (i =3D 0; i < vbc->num_queues; i++) {
> +        vbc->virtqs[i] =3D virtio_add_queue(vdev, vbc->queue_size,
> +                                          handle_output);
> +    }
> +
> +    vbc->inflight =3D g_new0(struct vhost_inflight, 1);
> +    vbc->vhost_vqs =3D g_new0(struct vhost_virtqueue, vbc->num_queues);
> +}
> +
> +void vhost_blk_common_unrealize(VHostBlkCommon *vbc)
> +{
> +    VirtIODevice *vdev =3D VIRTIO_DEVICE(vbc);
> +    int i;
> +
> +    g_free(vbc->vhost_vqs);
> +    vbc->vhost_vqs =3D NULL;
> +    g_free(vbc->inflight);
> +    vbc->inflight =3D NULL;
> +
> +    for (i =3D 0; i < vbc->num_queues; i++) {
> +        virtio_delete_queue(vbc->virtqs[i]);
> +    }
> +    g_free(vbc->virtqs);
> +    virtio_cleanup(vdev);
> +}
> +
> +static void vhost_blk_common_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> +    VirtioDeviceClass *vdc =3D VIRTIO_DEVICE_CLASS(klass);
> +
> +    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
> +    vdc->get_config =3D vhost_blk_common_update_config;
> +    vdc->set_config =3D vhost_blk_common_set_config;
> +    vdc->get_features =3D vhost_blk_common_get_features;
> +}
> +
> +static const TypeInfo vhost_blk_common_info =3D {
> +    .name =3D TYPE_VHOST_BLK_COMMON,
> +    .parent =3D TYPE_VIRTIO_DEVICE,
> +    .instance_size =3D sizeof(VHostBlkCommon),
> +    .class_init =3D vhost_blk_common_class_init,
> +    .abstract =3D true,
> +};
> +
> +static void virtio_register_types(void)
> +{
> +    type_register_static(&vhost_blk_common_info);
> +}
> +
> +type_init(virtio_register_types)
> diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> index 0b5b9d44cd..0ad2cc030a 100644
> --- a/hw/block/vhost-user-blk.c
> +++ b/hw/block/vhost-user-blk.c
> @@ -50,165 +50,10 @@ static const int user_feature_bits[] =3D {
>      VHOST_INVALID_FEATURE_BIT
>  };
> =20
> -static void vhost_user_blk_update_config(VirtIODevice *vdev, uint8_t *co=
nfig)
> -{
> -    VHostUserBlk *s =3D VHOST_USER_BLK(vdev);
> -
> -    /* Our num_queues overrides the device backend */
> -    virtio_stw_p(vdev, &s->blkcfg.num_queues, s->num_queues);
> -
> -    memcpy(config, &s->blkcfg, sizeof(struct virtio_blk_config));
> -}
> -
> -static void vhost_user_blk_set_config(VirtIODevice *vdev, const uint8_t =
*config)
> -{
> -    VHostUserBlk *s =3D VHOST_USER_BLK(vdev);
> -    struct virtio_blk_config *blkcfg =3D (struct virtio_blk_config *)con=
fig;
> -    int ret;
> -
> -    if (blkcfg->wce =3D=3D s->blkcfg.wce) {
> -        return;
> -    }
> -
> -    ret =3D vhost_dev_set_config(&s->dev, &blkcfg->wce,
> -                               offsetof(struct virtio_blk_config, wce),
> -                               sizeof(blkcfg->wce),
> -                               VHOST_SET_CONFIG_TYPE_MASTER);
> -    if (ret) {
> -        error_report("set device config space failed");
> -        return;
> -    }
> -
> -    s->blkcfg.wce =3D blkcfg->wce;
> -}
> -
> -static int vhost_user_blk_handle_config_change(struct vhost_dev *dev)
> -{
> -    int ret;
> -    struct virtio_blk_config blkcfg;
> -    VHostUserBlk *s =3D VHOST_USER_BLK(dev->vdev);
> -
> -    ret =3D vhost_dev_get_config(dev, (uint8_t *)&blkcfg,
> -                               sizeof(struct virtio_blk_config));
> -    if (ret < 0) {
> -        error_report("get config space failed");
> -        return -1;
> -    }
> -
> -    /* valid for resize only */
> -    if (blkcfg.capacity !=3D s->blkcfg.capacity) {
> -        s->blkcfg.capacity =3D blkcfg.capacity;
> -        memcpy(dev->vdev->config, &s->blkcfg, sizeof(struct virtio_blk_c=
onfig));
> -        virtio_notify_config(dev->vdev);
> -    }
> -
> -    return 0;
> -}
> -
> -const VhostDevConfigOps blk_ops =3D {
> -    .vhost_dev_config_notifier =3D vhost_user_blk_handle_config_change,
> -};
> -
> -static int vhost_user_blk_start(VirtIODevice *vdev)
> -{
> -    VHostUserBlk *s =3D VHOST_USER_BLK(vdev);
> -    BusState *qbus =3D BUS(qdev_get_parent_bus(DEVICE(vdev)));
> -    VirtioBusClass *k =3D VIRTIO_BUS_GET_CLASS(qbus);
> -    int i, ret;
> -
> -    if (!k->set_guest_notifiers) {
> -        error_report("binding does not support guest notifiers");
> -        return -ENOSYS;
> -    }
> -
> -    ret =3D vhost_dev_enable_notifiers(&s->dev, vdev);
> -    if (ret < 0) {
> -        error_report("Error enabling host notifiers: %d", -ret);
> -        return ret;
> -    }
> -
> -    ret =3D k->set_guest_notifiers(qbus->parent, s->dev.nvqs, true);
> -    if (ret < 0) {
> -        error_report("Error binding guest notifier: %d", -ret);
> -        goto err_host_notifiers;
> -    }
> -
> -    s->dev.acked_features =3D vdev->guest_features;
> -
> -    ret =3D vhost_dev_prepare_inflight(&s->dev, vdev);
> -    if (ret < 0) {
> -        error_report("Error set inflight format: %d", -ret);
> -        goto err_guest_notifiers;
> -    }
> -
> -    if (!s->inflight->addr) {
> -        ret =3D vhost_dev_get_inflight(&s->dev, s->queue_size, s->inflig=
ht);
> -        if (ret < 0) {
> -            error_report("Error get inflight: %d", -ret);
> -            goto err_guest_notifiers;
> -        }
> -    }
> -
> -    ret =3D vhost_dev_set_inflight(&s->dev, s->inflight);
> -    if (ret < 0) {
> -        error_report("Error set inflight: %d", -ret);
> -        goto err_guest_notifiers;
> -    }
> -
> -    ret =3D vhost_dev_start(&s->dev, vdev);
> -    if (ret < 0) {
> -        error_report("Error starting vhost: %d", -ret);
> -        goto err_guest_notifiers;
> -    }
> -    s->started_vu =3D true;
> -
> -    /* guest_notifier_mask/pending not used yet, so just unmask
> -     * everything here. virtio-pci will do the right thing by
> -     * enabling/disabling irqfd.
> -     */
> -    for (i =3D 0; i < s->dev.nvqs; i++) {
> -        vhost_virtqueue_mask(&s->dev, vdev, i, false);
> -    }
> -
> -    return ret;
> -
> -err_guest_notifiers:
> -    k->set_guest_notifiers(qbus->parent, s->dev.nvqs, false);
> -err_host_notifiers:
> -    vhost_dev_disable_notifiers(&s->dev, vdev);
> -    return ret;
> -}
> -
> -static void vhost_user_blk_stop(VirtIODevice *vdev)
> -{
> -    VHostUserBlk *s =3D VHOST_USER_BLK(vdev);
> -    BusState *qbus =3D BUS(qdev_get_parent_bus(DEVICE(vdev)));
> -    VirtioBusClass *k =3D VIRTIO_BUS_GET_CLASS(qbus);
> -    int ret;
> -
> -    if (!s->started_vu) {
> -        return;
> -    }
> -    s->started_vu =3D false;
> -
> -    if (!k->set_guest_notifiers) {
> -        return;
> -    }
> -
> -    vhost_dev_stop(&s->dev, vdev);
> -
> -    ret =3D k->set_guest_notifiers(qbus->parent, s->dev.nvqs, false);
> -    if (ret < 0) {
> -        error_report("vhost guest notifier cleanup failed: %d", ret);
> -        return;
> -    }
> -
> -    vhost_dev_disable_notifiers(&s->dev, vdev);
> -}
> -
>  static void vhost_user_blk_set_status(VirtIODevice *vdev, uint8_t status=
)
>  {
>      VHostUserBlk *s =3D VHOST_USER_BLK(vdev);
> +    VHostBlkCommon *vbc =3D VHOST_BLK_COMMON(s);
>      bool should_start =3D virtio_device_started(vdev, status);
>      int ret;
> =20
> @@ -220,52 +65,27 @@ static void vhost_user_blk_set_status(VirtIODevice *=
vdev, uint8_t status)
>          return;
>      }
> =20
> -    if (s->dev.started =3D=3D should_start) {
> +    if (vbc->dev.started =3D=3D should_start) {
>          return;
>      }
> =20
>      if (should_start) {
> -        ret =3D vhost_user_blk_start(vdev);
> +        ret =3D vhost_blk_common_start(vbc);
>          if (ret < 0) {
>              error_report("vhost-user-blk: vhost start failed: %s",
>                           strerror(-ret));
>              qemu_chr_fe_disconnect(&s->chardev);
>          }
>      } else {
> -        vhost_user_blk_stop(vdev);
> +        vhost_blk_common_stop(vbc);
>      }
> =20
>  }
> =20
> -static uint64_t vhost_user_blk_get_features(VirtIODevice *vdev,
> -                                            uint64_t features,
> -                                            Error **errp)
> -{
> -    VHostUserBlk *s =3D VHOST_USER_BLK(vdev);
> -
> -    /* Turn on pre-defined features */
> -    virtio_add_feature(&features, VIRTIO_BLK_F_SEG_MAX);
> -    virtio_add_feature(&features, VIRTIO_BLK_F_GEOMETRY);
> -    virtio_add_feature(&features, VIRTIO_BLK_F_TOPOLOGY);
> -    virtio_add_feature(&features, VIRTIO_BLK_F_BLK_SIZE);
> -    virtio_add_feature(&features, VIRTIO_BLK_F_FLUSH);
> -    virtio_add_feature(&features, VIRTIO_BLK_F_RO);
> -    virtio_add_feature(&features, VIRTIO_BLK_F_DISCARD);
> -    virtio_add_feature(&features, VIRTIO_BLK_F_WRITE_ZEROES);
> -
> -    if (s->config_wce) {
> -        virtio_add_feature(&features, VIRTIO_BLK_F_CONFIG_WCE);
> -    }
> -    if (s->num_queues > 1) {
> -        virtio_add_feature(&features, VIRTIO_BLK_F_MQ);
> -    }
> -
> -    return vhost_get_features(&s->dev, user_feature_bits, features);
> -}
> -
>  static void vhost_user_blk_handle_output(VirtIODevice *vdev, VirtQueue *=
vq)
>  {
>      VHostUserBlk *s =3D VHOST_USER_BLK(vdev);
> +    VHostBlkCommon *vbc =3D VHOST_BLK_COMMON(s);
>      int i, ret;
> =20
>      if (!vdev->start_on_kick) {
> @@ -276,14 +96,14 @@ static void vhost_user_blk_handle_output(VirtIODevic=
e *vdev, VirtQueue *vq)
>          return;
>      }
> =20
> -    if (s->dev.started) {
> +    if (vbc->dev.started) {
>          return;
>      }
> =20
>      /* Some guests kick before setting VIRTIO_CONFIG_S_DRIVER_OK so star=
t
>       * vhost here instead of waiting for .set_status().
>       */
> -    ret =3D vhost_user_blk_start(vdev);
> +    ret =3D vhost_blk_common_start(vbc);
>      if (ret < 0) {
>          error_report("vhost-user-blk: vhost start failed: %s",
>                       strerror(-ret));
> @@ -292,7 +112,7 @@ static void vhost_user_blk_handle_output(VirtIODevice=
 *vdev, VirtQueue *vq)
>      }
> =20
>      /* Kick right away to begin processing requests already in vring */
> -    for (i =3D 0; i < s->dev.nvqs; i++) {
> +    for (i =3D 0; i < vbc->dev.nvqs; i++) {
>          VirtQueue *kick_vq =3D virtio_get_queue(vdev, i);
> =20
>          if (!virtio_queue_get_desc_addr(vdev, i)) {
> @@ -305,14 +125,16 @@ static void vhost_user_blk_handle_output(VirtIODevi=
ce *vdev, VirtQueue *vq)
>  static void vhost_user_blk_reset(VirtIODevice *vdev)
>  {
>      VHostUserBlk *s =3D VHOST_USER_BLK(vdev);
> +    VHostBlkCommon *vbc =3D VHOST_BLK_COMMON(s);
> =20
> -    vhost_dev_free_inflight(s->inflight);
> +    vhost_dev_free_inflight(vbc->inflight);
>  }
> =20
>  static int vhost_user_blk_connect(DeviceState *dev)
>  {
>      VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
>      VHostUserBlk *s =3D VHOST_USER_BLK(vdev);
> +    VHostBlkCommon *vbc =3D VHOST_BLK_COMMON(s);
>      int ret =3D 0;
> =20
>      if (s->connected) {
> @@ -320,14 +142,15 @@ static int vhost_user_blk_connect(DeviceState *dev)
>      }
>      s->connected =3D true;
> =20
> -    s->dev.nvqs =3D s->num_queues;
> -    s->dev.vqs =3D s->vhost_vqs;
> -    s->dev.vq_index =3D 0;
> -    s->dev.backend_features =3D 0;
> +    vbc->dev.nvqs =3D vbc->num_queues;
> +    vbc->dev.vqs =3D vbc->vhost_vqs;
> +    vbc->dev.vq_index =3D 0;
> +    vbc->dev.backend_features =3D 0;
> =20
> -    vhost_dev_set_config_notifier(&s->dev, &blk_ops);
> +    vhost_dev_set_config_notifier(&vbc->dev, &blk_ops);
> =20
> -    ret =3D vhost_dev_init(&s->dev, &s->vhost_user, VHOST_BACKEND_TYPE_U=
SER, 0);
> +    ret =3D vhost_dev_init(&vbc->dev, &s->vhost_user,
> +                         VHOST_BACKEND_TYPE_USER, 0);
>      if (ret < 0) {
>          error_report("vhost-user-blk: vhost initialization failed: %s",
>                       strerror(-ret));
> @@ -336,7 +159,7 @@ static int vhost_user_blk_connect(DeviceState *dev)
> =20
>      /* restore vhost state */
>      if (virtio_device_started(vdev, vdev->status)) {
> -        ret =3D vhost_user_blk_start(vdev);
> +        ret =3D vhost_blk_common_start(vbc);
>          if (ret < 0) {
>              error_report("vhost-user-blk: vhost start failed: %s",
>                           strerror(-ret));
> @@ -351,15 +174,16 @@ static void vhost_user_blk_disconnect(DeviceState *=
dev)
>  {
>      VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
>      VHostUserBlk *s =3D VHOST_USER_BLK(vdev);
> +    VHostBlkCommon *vbc =3D VHOST_BLK_COMMON(s);
> =20
>      if (!s->connected) {
>          return;
>      }
>      s->connected =3D false;
> =20
> -    vhost_user_blk_stop(vdev);
> +    vhost_blk_common_stop(vbc);
> =20
> -    vhost_dev_cleanup(&s->dev);
> +    vhost_dev_cleanup(&vbc->dev);
>  }
> =20
>  static void vhost_user_blk_event(void *opaque, QEMUChrEvent event,
> @@ -392,6 +216,7 @@ static void vhost_user_blk_event(void *opaque, QEMUCh=
rEvent event,
>      DeviceState *dev =3D opaque;
>      VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
>      VHostUserBlk *s =3D VHOST_USER_BLK(vdev);
> +    VHostBlkCommon *vbc =3D VHOST_BLK_COMMON(s);
> =20
>      switch (event) {
>      case CHR_EVENT_OPENED:
> @@ -430,7 +255,7 @@ static void vhost_user_blk_event(void *opaque, QEMUCh=
rEvent event,
>               * option for the general vhost code to get the dev state wi=
thout
>               * knowing its type (in this case vhost-user).
>               */
> -            s->dev.started =3D false;
> +            vbc->dev.started =3D false;
>          } else {
>              vhost_user_blk_disconnect(dev);
>          }
> @@ -447,42 +272,24 @@ static void vhost_user_blk_device_realize(DeviceSta=
te *dev, Error **errp)
>  {
>      VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
>      VHostUserBlk *s =3D VHOST_USER_BLK(vdev);
> +    VHostBlkCommon *vbc =3D VHOST_BLK_COMMON(s);
>      Error *err =3D NULL;
> -    int i, ret;
> +    int ret;
> =20
>      if (!s->chardev.chr) {
>          error_setg(errp, "vhost-user-blk: chardev is mandatory");
>          return;
>      }
> =20
> -    if (s->num_queues =3D=3D VHOST_USER_BLK_AUTO_NUM_QUEUES) {
> -        s->num_queues =3D 1;
> -    }
> -    if (!s->num_queues || s->num_queues > VIRTIO_QUEUE_MAX) {
> -        error_setg(errp, "vhost-user-blk: invalid number of IO queues");
> -        return;
> -    }
> -
> -    if (!s->queue_size) {
> -        error_setg(errp, "vhost-user-blk: queue size must be non-zero");
> -        return;
> -    }
> -
>      if (!vhost_user_init(&s->vhost_user, &s->chardev, errp)) {
>          return;
>      }
> =20
> -    virtio_init(vdev, "virtio-blk", VIRTIO_ID_BLOCK,
> -                sizeof(struct virtio_blk_config));
> -
> -    s->virtqs =3D g_new(VirtQueue *, s->num_queues);
> -    for (i =3D 0; i < s->num_queues; i++) {
> -        s->virtqs[i] =3D virtio_add_queue(vdev, s->queue_size,
> -                                        vhost_user_blk_handle_output);
> +    vhost_blk_common_realize(vbc, vhost_user_blk_handle_output, &err);
> +    if (err !=3D NULL) {
> +        error_propagate(errp, err);
> +        goto blk_err;
>      }
> -
> -    s->inflight =3D g_new0(struct vhost_inflight, 1);
> -    s->vhost_vqs =3D g_new0(struct vhost_virtqueue, s->num_queues);
>      s->connected =3D false;
> =20
>      qemu_chr_fe_set_handlers(&s->chardev,  NULL, NULL,
> @@ -492,7 +299,7 @@ static void vhost_user_blk_device_realize(DeviceState=
 *dev, Error **errp)
>  reconnect:
>      if (qemu_chr_fe_wait_connected(&s->chardev, &err) < 0) {
>          error_report_err(err);
> -        goto virtio_err;
> +        goto connect_err;
>      }
> =20
>      /* check whether vhost_user_blk_connect() failed or not */
> @@ -500,7 +307,7 @@ reconnect:
>          goto reconnect;
>      }
> =20
> -    ret =3D vhost_dev_get_config(&s->dev, (uint8_t *)&s->blkcfg,
> +    ret =3D vhost_dev_get_config(&vbc->dev, (uint8_t *)&vbc->blkcfg,
>                                 sizeof(struct virtio_blk_config));
>      if (ret < 0) {
>          error_report("vhost-user-blk: get block config failed");
> @@ -513,16 +320,9 @@ reconnect:
>                               NULL, true);
>      return;
> =20
> -virtio_err:
> -    g_free(s->vhost_vqs);
> -    s->vhost_vqs =3D NULL;
> -    g_free(s->inflight);
> -    s->inflight =3D NULL;
> -    for (i =3D 0; i < s->num_queues; i++) {
> -        virtio_delete_queue(s->virtqs[i]);
> -    }
> -    g_free(s->virtqs);
> -    virtio_cleanup(vdev);
> +connect_err:
> +    vhost_blk_common_unrealize(vbc);
> +blk_err:
>      vhost_user_cleanup(&s->vhost_user);
>  }
> =20
> @@ -530,31 +330,24 @@ static void vhost_user_blk_device_unrealize(DeviceS=
tate *dev)
>  {
>      VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
>      VHostUserBlk *s =3D VHOST_USER_BLK(dev);
> -    int i;
> +    VHostBlkCommon *vbc =3D VHOST_BLK_COMMON(s);
> =20
>      virtio_set_status(vdev, 0);
>      qemu_chr_fe_set_handlers(&s->chardev,  NULL, NULL, NULL,
>                               NULL, NULL, NULL, false);
> -    vhost_dev_cleanup(&s->dev);
> -    vhost_dev_free_inflight(s->inflight);
> -    g_free(s->vhost_vqs);
> -    s->vhost_vqs =3D NULL;
> -    g_free(s->inflight);
> -    s->inflight =3D NULL;
> -
> -    for (i =3D 0; i < s->num_queues; i++) {
> -        virtio_delete_queue(s->virtqs[i]);
> -    }
> -    g_free(s->virtqs);
> -    virtio_cleanup(vdev);
> +    vhost_dev_cleanup(&vbc->dev);
> +    vhost_dev_free_inflight(vbc->inflight);
> +    vhost_blk_common_unrealize(vbc);
>      vhost_user_cleanup(&s->vhost_user);
>  }
> =20
>  static void vhost_user_blk_instance_init(Object *obj)
>  {
> -    VHostUserBlk *s =3D VHOST_USER_BLK(obj);
> +    VHostBlkCommon *vbc =3D VHOST_BLK_COMMON(obj);
> +
> +    vbc->feature_bits =3D user_feature_bits;
> =20
> -    device_add_bootindex_property(obj, &s->bootindex, "bootindex",
> +    device_add_bootindex_property(obj, &vbc->bootindex, "bootindex",
>                                    "/disk@0,0", DEVICE(obj));
>  }
> =20
> @@ -570,10 +363,10 @@ static const VMStateDescription vmstate_vhost_user_=
blk =3D {
> =20
>  static Property vhost_user_blk_properties[] =3D {
>      DEFINE_PROP_CHR("chardev", VHostUserBlk, chardev),
> -    DEFINE_PROP_UINT16("num-queues", VHostUserBlk, num_queues,
> -                       VHOST_USER_BLK_AUTO_NUM_QUEUES),
> -    DEFINE_PROP_UINT32("queue-size", VHostUserBlk, queue_size, 128),
> -    DEFINE_PROP_BIT("config-wce", VHostUserBlk, config_wce, 0, true),
> +    DEFINE_PROP_UINT16("num-queues", VHostBlkCommon, num_queues,
> +                       VHOST_BLK_AUTO_NUM_QUEUES),
> +    DEFINE_PROP_UINT32("queue-size", VHostBlkCommon, queue_size, 128),
> +    DEFINE_PROP_BIT("config-wce", VHostBlkCommon, config_wce, 0, true),
>      DEFINE_PROP_END_OF_LIST(),
>  };
> =20
> @@ -587,16 +380,13 @@ static void vhost_user_blk_class_init(ObjectClass *=
klass, void *data)
>      set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>      vdc->realize =3D vhost_user_blk_device_realize;
>      vdc->unrealize =3D vhost_user_blk_device_unrealize;
> -    vdc->get_config =3D vhost_user_blk_update_config;
> -    vdc->set_config =3D vhost_user_blk_set_config;
> -    vdc->get_features =3D vhost_user_blk_get_features;
>      vdc->set_status =3D vhost_user_blk_set_status;
>      vdc->reset =3D vhost_user_blk_reset;
>  }
> =20
>  static const TypeInfo vhost_user_blk_info =3D {
>      .name =3D TYPE_VHOST_USER_BLK,
> -    .parent =3D TYPE_VIRTIO_DEVICE,
> +    .parent =3D TYPE_VHOST_BLK_COMMON,
>      .instance_size =3D sizeof(VHostUserBlk),
>      .instance_init =3D vhost_user_blk_instance_init,
>      .class_init =3D vhost_user_blk_class_init,
> diff --git a/hw/virtio/vhost-user-blk-pci.c b/hw/virtio/vhost-user-blk-pc=
i.c
> index 33b404d8a2..8fb01552f5 100644
> --- a/hw/virtio/vhost-user-blk-pci.c
> +++ b/hw/virtio/vhost-user-blk-pci.c
> @@ -54,13 +54,14 @@ static void vhost_user_blk_pci_realize(VirtIOPCIProxy=
 *vpci_dev, Error **errp)
>  {
>      VHostUserBlkPCI *dev =3D VHOST_USER_BLK_PCI(vpci_dev);
>      DeviceState *vdev =3D DEVICE(&dev->vdev);
> +    VHostBlkCommon *vbc =3D VHOST_BLK_COMMON(&dev->vdev);
> =20
> -    if (dev->vdev.num_queues =3D=3D VHOST_USER_BLK_AUTO_NUM_QUEUES) {
> -        dev->vdev.num_queues =3D virtio_pci_optimal_num_queues(0);
> +    if (vbc->num_queues =3D=3D VHOST_BLK_AUTO_NUM_QUEUES) {
> +        vbc->num_queues =3D virtio_pci_optimal_num_queues(0);
>      }
> =20
>      if (vpci_dev->nvectors =3D=3D DEV_NVECTORS_UNSPECIFIED) {
> -        vpci_dev->nvectors =3D dev->vdev.num_queues + 1;
> +        vpci_dev->nvectors =3D vbc->num_queues + 1;
>      }
> =20
>      qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
> diff --git a/include/hw/virtio/vhost-blk-common.h b/include/hw/virtio/vho=
st-blk-common.h
> new file mode 100644
> index 0000000000..1a12a58b60
> --- /dev/null
> +++ b/include/hw/virtio/vhost-blk-common.h
> @@ -0,0 +1,50 @@
> +/*
> + * Parent class for vhost based block devices
> + *
> + * Copyright (C) 2021 Bytedance Inc. and/or its affiliates. All rights r=
eserved.
> + *
> + * Author:
> + *   Xie Yongji <xieyongji@bytedance.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + *
> + */
> +
> +#ifndef VHOST_BLK_COMMON_H
> +#define VHOST_BLK_COMMON_H
> +
> +#include "standard-headers/linux/virtio_blk.h"
> +#include "hw/virtio/vhost.h"
> +#include "qom/object.h"
> +
> +#define TYPE_VHOST_BLK_COMMON "vhost-blk-common"
> +OBJECT_DECLARE_SIMPLE_TYPE(VHostBlkCommon, VHOST_BLK_COMMON)
> +
> +#define VHOST_BLK_AUTO_NUM_QUEUES UINT16_MAX
> +
> +struct VHostBlkCommon {
> +    VirtIODevice parent_obj;
> +    int32_t bootindex;
> +    struct virtio_blk_config blkcfg;
> +    uint16_t num_queues;
> +    uint32_t queue_size;
> +    const int *feature_bits;
> +    uint32_t config_wce;
> +    struct vhost_dev dev;
> +    struct vhost_inflight *inflight;
> +    struct vhost_virtqueue *vhost_vqs;
> +    VirtQueue **virtqs;

As discussed above please rename this, and add a comment explaining that
it prevents stopping an already stopped device.

> +    bool started;
> +};
> +
> +extern const VhostDevConfigOps blk_ops;
> +
> +int vhost_blk_common_start(VHostBlkCommon *vbc);
> +void vhost_blk_common_stop(VHostBlkCommon *vbc);
> +void vhost_blk_common_realize(VHostBlkCommon *vbc,
> +                              VirtIOHandleOutput handle_output,
> +                              Error **errp);
> +void vhost_blk_common_unrealize(VHostBlkCommon *vbc);
> +
> +#endif
> diff --git a/include/hw/virtio/vhost-user-blk.h b/include/hw/virtio/vhost=
-user-blk.h
> index 7c91f15040..100275602f 100644
> --- a/include/hw/virtio/vhost-user-blk.h
> +++ b/include/hw/virtio/vhost-user-blk.h
> @@ -15,32 +15,18 @@
>  #ifndef VHOST_USER_BLK_H
>  #define VHOST_USER_BLK_H
> =20
> -#include "standard-headers/linux/virtio_blk.h"
> -#include "hw/block/block.h"
>  #include "chardev/char-fe.h"
> -#include "hw/virtio/vhost.h"
>  #include "hw/virtio/vhost-user.h"
> +#include "hw/virtio/vhost-blk-common.h"
>  #include "qom/object.h"
> =20
>  #define TYPE_VHOST_USER_BLK "vhost-user-blk"
>  OBJECT_DECLARE_SIMPLE_TYPE(VHostUserBlk, VHOST_USER_BLK)
> =20
> -#define VHOST_USER_BLK_AUTO_NUM_QUEUES UINT16_MAX
> -
>  struct VHostUserBlk {
> -    VirtIODevice parent_obj;
> +    VHostBlkCommon parent_obj;
>      CharBackend chardev;
> -    int32_t bootindex;
> -    struct virtio_blk_config blkcfg;
> -    uint16_t num_queues;
> -    uint32_t queue_size;
> -    uint32_t config_wce;
> -    struct vhost_dev dev;
> -    struct vhost_inflight *inflight;
>      VhostUserState vhost_user;
> -    struct vhost_virtqueue *vhost_vqs;
> -    VirtQueue **virtqs;
> -

Please fix this comment to explain that the started_vu now lives in
vhost-blk-common.

>      /*
>       * There are at least two steps of initialization of the
>       * vhost-user device. The first is a "connect" step and
> @@ -49,8 +35,6 @@ struct VHostUserBlk {
>       */
>      /* vhost_user_blk_connect/vhost_user_blk_disconnect */
>      bool connected;
> -    /* vhost_user_blk_start/vhost_user_blk_stop */
> -    bool started_vu;
>  };
> =20
>  #endif
> --=20
> 2.25.1
> =

