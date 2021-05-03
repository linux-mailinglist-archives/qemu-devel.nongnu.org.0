Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8D1371E2C
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 19:13:01 +0200 (CEST)
Received: from localhost ([::1]:42370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldc7w-0008Fu-2y
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 13:13:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1ldbwz-000145-IA; Mon, 03 May 2021 13:01:41 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:37560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1ldbwt-0006iH-8A; Mon, 03 May 2021 13:01:41 -0400
Received: from pps.filterd (m0127838.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 143GpWxs008919; Mon, 3 May 2021 10:01:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=CQzcyU3uz9vk4UJ0rZ3EbAMwBheYk6sRhyEpU31xihY=;
 b=1hTuupPoE9tni1Xaeqan29eVDAda3sfjps+PZEcPpEpWCyTFx221lGu9ycwlpcP+vlYD
 kdY78MK5E2LPmMC/YTrpU0NecKKdv8vzZOh8Qq9LGqfN0R9ZpcKfFVXFRtGsY9Ilr+Bw
 TI+eu7vbwjEaBXI4kWhQqBxfLL5sHgiUYguBr/MlrIEp/Bno7H2DaTAmQUs1DMUkBBgA
 C/txCXr7NtyhmI4l3UenM2ti/kwxZEB3noy1DHDdEGFjWZrNdEiHJVXB/rrEuEO6llKo
 nKOn2IGjV+6eP/7xnsSG9F9YwSFGWK3cis+GkfUBZEBVM7/6J1BZLfMZXZ67YGpM2dZD sw== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
 by mx0a-002c1b01.pphosted.com with ESMTP id 38ac10s435-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 May 2021 10:01:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JiC0rtkBTJJwoqkCSkUwsZ/pJCI1bksiaRGeKmFdp2PU0wN/X3q3z21/HiVklJcLB2+aLbQOD6ivFLz78AANKjqyXRlXhOWnvo+d0b7GQzRkVzUEqTdacaKW5JEGtBZAhBerTYh2k4htNAP3I/O1n3P/86tmj5zTEhqejEPBb8WZbLbjqJig2iqi3YmKQqh1NcNhAXG1wO0FQQitYPjyBTsZtwmUSk4OecQEewEX3MQK2t7V/NNn8v2+z32y73moXKDMHAhAhaYVsyGQcGjuWEMNo6VL4DTnAPtBYgJAF7UcI8Baz4Ec3ZUfB76FBoA2dIE55Pmckr3knLuHDu619A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CQzcyU3uz9vk4UJ0rZ3EbAMwBheYk6sRhyEpU31xihY=;
 b=AUrzeweQ1ato6J2F7Ov6qHinVmEHNc4K0LwOzs4xCgkkdwSpBjkqtYQuY3ivxKxAsNLLAkHHHi4vfg9esSLOwXCt6qcF3zKYegpP3zpBMZOSC4TiX0X7MKfrpxmP5gX3Ji/aSro7DnHXg7mrsS2KbOaZSBkE8Bf2wIUDJkylKcIa2/ZckOKhVA+3BU3DEje24hUOx2OWVEG7ZcjqwnYodOYVUdzNF0KMKzfEGI03/Kr30McGCt9PDNjcolQDSaN9arTVIbHlWYFpL2d6tZuqNvCUE1IGTXwu1lf+Icly1r0+eqRC5VbdqJTVIu6HVtM3iGzJCgaI8jS1lV7oCwfXVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from SN6PR02MB4543.namprd02.prod.outlook.com (2603:10b6:805:b1::24)
 by SN6PR02MB5567.namprd02.prod.outlook.com (2603:10b6:805:e5::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.38; Mon, 3 May
 2021 17:01:15 +0000
Received: from SN6PR02MB4543.namprd02.prod.outlook.com
 ([fe80::bdbb:69ac:63f9:fc33]) by SN6PR02MB4543.namprd02.prod.outlook.com
 ([fe80::bdbb:69ac:63f9:fc33%7]) with mapi id 15.20.4087.043; Mon, 3 May 2021
 17:01:15 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2 2/6] vhost-user-blk: Don't reconnect during
 initialisation
Thread-Topic: [PATCH v2 2/6] vhost-user-blk: Don't reconnect during
 initialisation
Thread-Index: AQHXPRr9kvAN2lTrE0GpZgEpwu8+vqrSAZuA
Date: Mon, 3 May 2021 17:01:15 +0000
Message-ID: <20210503170107.GA21884@raphael-debian-dev>
References: <20210429171316.162022-1-kwolf@redhat.com>
 <20210429171316.162022-3-kwolf@redhat.com>
In-Reply-To: <20210429171316.162022-3-kwolf@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nutanix.com;
x-originating-ip: [24.193.215.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f802daf4-93af-440d-4141-08d90e551054
x-ms-traffictypediagnostic: SN6PR02MB5567:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR02MB5567F6391CCC1C1F86BF428DEA5B9@SN6PR02MB5567.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: E8Pu9+niginJgMwc704OX8UYI9p+XL/Cr9muDpkhNfO6sx06uHIA+UoOfNaeGkIb1NCr25sUDBn5jEwXDjkjcxrdARkq4lYDApfEkmglCY4A4cQyTr6doP+vPysECB0DtRN9VkAEhTrtcKLo0Oj/HkEkdv/18fFZ+gRZe30VmZ8+nb2Er7Qh33bdXo32vJ7rD+H/T/WpWWqMrW2Y10ivaUpArU782E2E4dvjQdO7Djy0k2tjFTmVmu4ru1a8JeKPfmeNUlGwN/GOpHUUlgPONUjS0dDJIzLOLwiMKO/xdC3CGLr5RPahtTcjiTGzOtZ8PwlqPQK+5BaVxK/6g+3HNH4H8Pfel06XhhpfyC1V6/a4BVhrx1hzL2mxLLeoBvF0U4xnayOrq3svTFs6/8W1mwt22f+mPsn8vc9Uaxs2cG9A6qz8HvhYpobz6Zs/75WXfnk4/msJKkVMYOODyJ/c0M0IdFSveYQUckLNZw98ZBpkSLN9Fxu3FNellRZz26Oa2Plmux/RPCZ3HDqPGT5wEU+gMRCt+9p5X3mpRYNWyhj1aoSsTYOlv14+5sA2WGq4gLc04iKeh7gKRmlWz9pEpaAIUumfv8/9I88TFHCa5/U=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4543.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(39860400002)(346002)(136003)(396003)(376002)(366004)(38100700002)(122000001)(64756008)(478600001)(54906003)(316002)(33716001)(71200400001)(1076003)(6916009)(4326008)(83380400001)(9686003)(6512007)(26005)(76116006)(91956017)(66946007)(8676002)(44832011)(86362001)(8936002)(33656002)(2906002)(6486002)(5660300002)(66556008)(6506007)(66476007)(186003)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?AS3gHo2ItlqdqJ5hcui/OoirNkRzqqLrVfRVsDGBCCWz0xAFRhM68ebhIvxP?=
 =?us-ascii?Q?qQOL+eO2Bi3Jl8TfwvCwK+zjEpSgWKXLMCReE+dfEqaul0652sHwilhNLLF7?=
 =?us-ascii?Q?dmypR7yEBhv/Lh2URdw8eqJPF3kgrIsC+JrPVO0FGtLZF/f/rdnK925KbL3G?=
 =?us-ascii?Q?3ApJsKgaNdJiyZoOKXg6gFSr0jBmd8VczKd3YfnBkuKMSguA9bUGOBuMPTO8?=
 =?us-ascii?Q?aDRfvIRjxDSKzWkjeDRmeSIvru4B4/e/QPmoPn+B4PWKvwigLw+H9M0U+UO9?=
 =?us-ascii?Q?XuCbOTCQcT99EoqTVyAHC7+LSgCMuXhHVV1bUqkJe9jcMWXh4DjuSxuZvcgI?=
 =?us-ascii?Q?O77NvjfFTa6qt3aC1pKX97vknWhvmgjUwJpBO4sFo30BWD1O3liRHybco7Nw?=
 =?us-ascii?Q?5EnTIl6WimPhAXMcB1LfLc76HiEYv/PY2AEbkVGaJe/YI9g0tY/R0B29AYjY?=
 =?us-ascii?Q?BLVtTidGxUogK96zhyHF+rKgmhc4bdlKL/NMxOC95koMM3mh8a+4FxNT/wg9?=
 =?us-ascii?Q?fqrwkAlk7txIjvlw7/gjyuVibBKqtNwsVIXNCCaTjaUG6sLX/P8uMMozV+7z?=
 =?us-ascii?Q?yo3nqwJ/ZlcJEiQyVsft6pMWYY9hIIEcmgsvyDqMFYHikJRI9L6qsGvWOF/k?=
 =?us-ascii?Q?SPS67j2/bhEn0KDY6jjCloS8keoKy+LsMAnIBUSy61PcZ+z0ABA/6h7w5ka1?=
 =?us-ascii?Q?LJyG6pDMIFWFjqcdyqQkqypi3qz2/a8OY2c+ovYTNjWkg32z/qOw4sGe4UsV?=
 =?us-ascii?Q?o6kt4RMiLchJEK3rIruSeEEkVkAHMZvpxuJJkto9CwTm84h7iJL7ZCj9H/dG?=
 =?us-ascii?Q?kSTjRVoyQeM9SEhOrmQhFEvq6r0vEUFQTQlDutpWzx/r9p+mV89SWWY/0Pdu?=
 =?us-ascii?Q?i3Wk4dtLYWmIEuYTfC8+kJG+GGe9G+ZkZIKU7qmsowrWyjQWRxrzPgMoVdU0?=
 =?us-ascii?Q?lcoBJef1YiRvQt0Q4wbdeZ06Z6JW+bok/Z6QzkxPjXl5Djj3xdgu42kx/JP6?=
 =?us-ascii?Q?C/gYYTXz6OOVtgVecZAPHTSdiC9IIUuUtB2kg4TjTtLKZY/6WfhYMCuVtOPU?=
 =?us-ascii?Q?0tE5/TbYhac8ydnHrPHN0V0afrQLY9+AtnonorcCFpusPA4JIZTV8m2Fqb3w?=
 =?us-ascii?Q?baadvKCEO67t53wY75IfSpfnlJmwHs3eKp3yXB42Dd106/gYZGrcPf7VOkpo?=
 =?us-ascii?Q?RTO0n52VRD5YZ8H/VII4Dg3NOvYLQ82BvOKW9vZlcmdCoqmv+vH7zO+5iIrm?=
 =?us-ascii?Q?9EQehZX4oorPM4I6EbNXPJkQFqoJCZ1BqYWjWX0UgXJWMVXBXfY0YJlo1Wpf?=
 =?us-ascii?Q?Oh+K2aJjqAWISTacD3s0bzyklo0/ZHHehXz/6oZZ9PefcA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <905BB186DA49AA4797BF4190CECD520D@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4543.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f802daf4-93af-440d-4141-08d90e551054
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2021 17:01:15.7032 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: naE3S1dqGEZfCzfD1k8AM3gJVbiWyncc2D+UfeEXimicm4tp2sjCmeWCATZ82EwJSdt8ccl0wi8o7NFtmf6JNoKsqIX/kFbOWwRaMlXZF1I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5567
X-Proofpoint-ORIG-GUID: E5nczgTPakQbSsm_D4oAlHDHAq-EqxIh
X-Proofpoint-GUID: E5nczgTPakQbSsm_D4oAlHDHAq-EqxIh
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-03_13:2021-05-03,
 2021-05-03 signatures=0
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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

So we're not going with the suggestion to retry once or a fixed number
of times? Any reason why not?

On Thu, Apr 29, 2021 at 07:13:12PM +0200, Kevin Wolf wrote:
> This is a partial revert of commits 77542d43149 and bc79c87bcde.
>=20
> Usually, an error during initialisation means that the configuration was
> wrong. Reconnecting won't make the error go away, but just turn the
> error condition into an endless loop. Avoid this and return errors
> again.
>=20
> Additionally, calling vhost_user_blk_disconnect() from the chardev event
> handler could result in use-after-free because none of the
> initialisation code expects that the device could just go away in the
> middle. So removing the call fixes crashes in several places.
>=20
> For example, using a num-queues setting that is incompatible with the
> backend would result in a crash like this (dereferencing dev->opaque,
> which is already NULL):
>=20
>  #0  0x0000555555d0a4bd in vhost_user_read_cb (source=3D0x5555568f4690, c=
ondition=3D(G_IO_IN | G_IO_HUP), opaque=3D0x7fffffffcbf0) at ../hw/virtio/v=
host-user.c:313
>  #1  0x0000555555d950d3 in qio_channel_fd_source_dispatch (source=3D0x555=
557c3f750, callback=3D0x555555d0a478 <vhost_user_read_cb>, user_data=3D0x7f=
ffffffcbf0) at ../io/channel-watch.c:84
>  #2  0x00007ffff7b32a9f in g_main_context_dispatch () at /lib64/libglib-2=
.0.so.0
>  #3  0x00007ffff7b84a98 in g_main_context_iterate.constprop () at /lib64/=
libglib-2.0.so.0
>  #4  0x00007ffff7b32163 in g_main_loop_run () at /lib64/libglib-2.0.so.0
>  #5  0x0000555555d0a724 in vhost_user_read (dev=3D0x555557bc62f8, msg=3D0=
x7fffffffcc50) at ../hw/virtio/vhost-user.c:402
>  #6  0x0000555555d0ee6b in vhost_user_get_config (dev=3D0x555557bc62f8, c=
onfig=3D0x555557bc62ac "", config_len=3D60) at ../hw/virtio/vhost-user.c:21=
33
>  #7  0x0000555555d56d46 in vhost_dev_get_config (hdev=3D0x555557bc62f8, c=
onfig=3D0x555557bc62ac "", config_len=3D60) at ../hw/virtio/vhost.c:1566
>  #8  0x0000555555cdd150 in vhost_user_blk_device_realize (dev=3D0x555557b=
c60b0, errp=3D0x7fffffffcf90) at ../hw/block/vhost-user-blk.c:510
>  #9  0x0000555555d08f6d in virtio_device_realize (dev=3D0x555557bc60b0, e=
rrp=3D0x7fffffffcff0) at ../hw/virtio/virtio.c:3660
>=20
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  hw/block/vhost-user-blk.c | 59 +++++++++++----------------------------
>  1 file changed, 17 insertions(+), 42 deletions(-)
>=20
> diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> index 7c85248a7b..c0b9958da1 100644
> --- a/hw/block/vhost-user-blk.c
> +++ b/hw/block/vhost-user-blk.c
> @@ -50,6 +50,8 @@ static const int user_feature_bits[] =3D {
>      VHOST_INVALID_FEATURE_BIT
>  };
> =20
> +static void vhost_user_blk_event(void *opaque, QEMUChrEvent event);
> +
>  static void vhost_user_blk_update_config(VirtIODevice *vdev, uint8_t *co=
nfig)
>  {
>      VHostUserBlk *s =3D VHOST_USER_BLK(vdev);
> @@ -362,19 +364,6 @@ static void vhost_user_blk_disconnect(DeviceState *d=
ev)
>      vhost_dev_cleanup(&s->dev);
>  }
> =20
> -static void vhost_user_blk_event(void *opaque, QEMUChrEvent event,
> -                                 bool realized);
> -
> -static void vhost_user_blk_event_realize(void *opaque, QEMUChrEvent even=
t)
> -{
> -    vhost_user_blk_event(opaque, event, false);
> -}
> -
> -static void vhost_user_blk_event_oper(void *opaque, QEMUChrEvent event)
> -{
> -    vhost_user_blk_event(opaque, event, true);
> -}
> -
>  static void vhost_user_blk_chr_closed_bh(void *opaque)
>  {
>      DeviceState *dev =3D opaque;
> @@ -382,12 +371,11 @@ static void vhost_user_blk_chr_closed_bh(void *opaq=
ue)
>      VHostUserBlk *s =3D VHOST_USER_BLK(vdev);
> =20
>      vhost_user_blk_disconnect(dev);
> -    qemu_chr_fe_set_handlers(&s->chardev, NULL, NULL,
> -            vhost_user_blk_event_oper, NULL, opaque, NULL, true);
> +    qemu_chr_fe_set_handlers(&s->chardev, NULL, NULL, vhost_user_blk_eve=
nt,
> +                             NULL, opaque, NULL, true);
>  }
> =20
> -static void vhost_user_blk_event(void *opaque, QEMUChrEvent event,
> -                                 bool realized)
> +static void vhost_user_blk_event(void *opaque, QEMUChrEvent event)
>  {
>      DeviceState *dev =3D opaque;
>      VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
> @@ -401,17 +389,7 @@ static void vhost_user_blk_event(void *opaque, QEMUC=
hrEvent event,
>          }
>          break;
>      case CHR_EVENT_CLOSED:
> -        /*
> -         * Closing the connection should happen differently on device
> -         * initialization and operation stages.
> -         * On initalization, we want to re-start vhost_dev initializatio=
n
> -         * from the very beginning right away when the connection is clo=
sed,
> -         * so we clean up vhost_dev on each connection closing.
> -         * On operation, we want to postpone vhost_dev cleanup to let th=
e
> -         * other code perform its own cleanup sequence using vhost_dev d=
ata
> -         * (e.g. vhost_dev_set_log).
> -         */
> -        if (realized && !runstate_check(RUN_STATE_SHUTDOWN)) {
> +        if (!runstate_check(RUN_STATE_SHUTDOWN)) {
>              /*
>               * A close event may happen during a read/write, but vhost
>               * code assumes the vhost_dev remains setup, so delay the
> @@ -431,8 +409,6 @@ static void vhost_user_blk_event(void *opaque, QEMUCh=
rEvent event,
>               * knowing its type (in this case vhost-user).
>               */
>              s->dev.started =3D false;
> -        } else {
> -            vhost_user_blk_disconnect(dev);
>          }
>          break;
>      case CHR_EVENT_BREAK:
> @@ -489,33 +465,32 @@ static void vhost_user_blk_device_realize(DeviceSta=
te *dev, Error **errp)
>      s->vhost_vqs =3D g_new0(struct vhost_virtqueue, s->num_queues);
>      s->connected =3D false;
> =20
> -    qemu_chr_fe_set_handlers(&s->chardev,  NULL, NULL,
> -                             vhost_user_blk_event_realize, NULL, (void *=
)dev,
> -                             NULL, true);
> -
> -reconnect:
>      if (qemu_chr_fe_wait_connected(&s->chardev, errp) < 0) {
>          goto virtio_err;
>      }
> =20
> -    /* check whether vhost_user_blk_connect() failed or not */
> -    if (!s->connected) {
> -        goto reconnect;
> +    if (vhost_user_blk_connect(dev) < 0) {
> +        error_setg(errp, "vhost-user-blk: could not connect");
> +        qemu_chr_fe_disconnect(&s->chardev);
> +        goto virtio_err;
>      }
> +    assert(s->connected);
> =20
>      ret =3D vhost_dev_get_config(&s->dev, (uint8_t *)&s->blkcfg,
>                                 sizeof(struct virtio_blk_config));
>      if (ret < 0) {
> -        error_report("vhost-user-blk: get block config failed");
> -        goto reconnect;
> +        error_setg(errp, "vhost-user-blk: get block config failed");
> +        goto vhost_err;
>      }
> =20
> -    /* we're fully initialized, now we can operate, so change the handle=
r */
> +    /* we're fully initialized, now we can operate, so add the handler *=
/
>      qemu_chr_fe_set_handlers(&s->chardev,  NULL, NULL,
> -                             vhost_user_blk_event_oper, NULL, (void *)de=
v,
> +                             vhost_user_blk_event, NULL, (void *)dev,
>                               NULL, true);
>      return;
> =20
> +vhost_err:
> +    vhost_dev_cleanup(&s->dev);
>  virtio_err:
>      g_free(s->vhost_vqs);
>      s->vhost_vqs =3D NULL;
> --=20
> 2.30.2
> =

