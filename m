Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B52434529C
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 23:54:08 +0100 (CET)
Received: from localhost ([::1]:46634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOTR0-0002OT-Le
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 18:54:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1lOTPA-0001X1-KM; Mon, 22 Mar 2021 18:52:12 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:58852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1lOTP8-0005nK-5B; Mon, 22 Mar 2021 18:52:12 -0400
Received: from pps.filterd (m0127843.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12MMkfNK003523; Mon, 22 Mar 2021 15:52:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=olmu41jLGcViTBXdevy3Tdaz+iFY8BisLHnng0GxLNw=;
 b=1MK9NsaG7NDAR4ZRJMhZ74WHIbDgmGnrK1dugAoNTn+LDRcOK+DB3RPAGXQDlNa5EePL
 sXaqSfFNmH5LH9fhlze3smra5D5eud/xbo3ZoM2gcoztndL9Y50cblossb67AoawbxCT
 BphnxZ3baYlxljeq6TjEbhlXo7v1LmE8iFIoUzsFVXC9Nyt9t44mNj3Ou8lNVjPOUhIX
 4AYeQn9u9MXLs4jwdWAc6It5+uz0DlLb2kcvcGuSvVUz47dxsr2jUeywepLwifpr0n9o
 vaJ5BEzj/268L7IsTfNClsC5W0LGGC5iqjeLBhxuN+Dp+CjXvnI0U/CjObyIFRmL4iuj 2w== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
 by mx0b-002c1b01.pphosted.com with ESMTP id 37df5jwgf9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Mar 2021 15:52:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UU16c8xg103WK9ZHQNHx7Ubx0esZPnxh4h7Biq9GcJ0ugUwZOW0kv+QjlcpcMOjnuZXDLbHq8kpxQUvkmVgEyBXSdDcPBtoOnhSvb3QIVtnPL5sXmNwlqnrVyd4r+2CQXZd3Go4mD3StqBf9MRz3OzN0rcXH4BAUOfZwzfEmoabl5K2jCLEJHjgdYIJj+lOS+3b9YaGOh8A/1W8bArdABU/78fWUvR2Urg3+aF3NO1eGBdDwJT7jSNXlKksd7PZ/ijjugZ4gcIn8vEZZeVZTnwDY6kauUp0C2g4q0eF23yRnAV5GuoNiMN8+KenYgjGcB4qesv6hS2kCHaLp7nEOlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=olmu41jLGcViTBXdevy3Tdaz+iFY8BisLHnng0GxLNw=;
 b=G2ES5kLPJpv2LjydKGEiz2JRYF8elaz7bQYZpyAyYzQi4D7l3GyU3VY3YvyCDWh8z0BaxfAoYdVwUsKZo30cWdxcH1Upqsb/W8WBKpyJMuvM/Z78OHqnD5LAM+zAgdKcG0zw+03Kj/OsErpLk+1x3cGleJZK7ODN/NCfISY5srzE95Sx3ezKg4UwR6BuKm7iXE5e6z19BBANXvr8Q8+toFX4Gk+QjA3QkV23MlZYsY/mHnnYbrSOm6WhqKo/m3UMJg0y+bPrQpSB7n1Bl9Wu7heSWc80QM32ha695BnnF1k9AlXrsLvorVkx1Znjhmq7EZ1SHbT7BI5bGfgWJMAqNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from SN6PR02MB4543.namprd02.prod.outlook.com (2603:10b6:805:b1::24)
 by SA2PR02MB7545.namprd02.prod.outlook.com (2603:10b6:806:140::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 22:51:59 +0000
Received: from SN6PR02MB4543.namprd02.prod.outlook.com
 ([fe80::7139:d6a4:cf94:c4b1]) by SN6PR02MB4543.namprd02.prod.outlook.com
 ([fe80::7139:d6a4:cf94:c4b1%4]) with mapi id 15.20.3955.027; Mon, 22 Mar 2021
 22:51:59 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Denis Plotnikov <den-plotnikov@yandex-team.ru>
Subject: Re: [PATCH v1] vhost-user-blk: use different event handlers on init
 and operation
Thread-Topic: [PATCH v1] vhost-user-blk: use different event handlers on init
 and operation
Thread-Index: AQHXFk4V/jFHIbrbqk6MfjlovS0CjKqQr04A
Date: Mon, 22 Mar 2021 22:51:58 +0000
Message-ID: <20210322225156.GC14801@raphael-debian-dev>
References: <20210311081045.271217-1-den-plotnikov@yandex-team.ru>
In-Reply-To: <20210311081045.271217-1-den-plotnikov@yandex-team.ru>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
authentication-results: yandex-team.ru; dkim=none (message not signed)
 header.d=none; yandex-team.ru; dmarc=none action=none header.from=nutanix.com; 
x-originating-ip: [98.151.208.226]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2f8324bb-4c71-4d16-89f5-08d8ed8519c3
x-ms-traffictypediagnostic: SA2PR02MB7545:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA2PR02MB7545ECD342BDA8B2C34E10CEEA659@SA2PR02MB7545.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QFqu0PK5x8YEPqbZQaLcrmrYrPhG000Zpdk22d1DAGGFSy/pS4A7MsGoJ6f2PMC6CIf5CgJTs/L1P129Cxp+LQhEJoCxlAdH+mG0azG8hl/U7D0RwtjzROhQY1FFCH415DSmEMlJzgEhNsRlKqIVLu+GU6ykiQWXaw8G7wtPth70WVkuTLCcJmTdjm/iXi330gh2vYaGdsqqW/Q/FKY756SZORzV2pMW+fd2ZX2by6S6nHN89hThkpbI3zclEwXrtkC/VFQrsT6hlFJkJ0nboMRhi/vDl9FXIm5UvzpRTSBBvu4WWyDoC7mADlJrXpmYFLmpaKxeERGBTIle1sORi/lPTh5zpZw3QLqKvKhYfNNGcwPFI34z41ar3lPO4hTy1lH3bJIaP9EA7FL1zZfVpI4mp7gzLTzrYw6njzxAMk9GgowiyiHl8ikMzwQDPKoJCiJ8mCb0KNsRUf1dIgd8BAQPBbwyXmJ75144PZdCDRLxjHdeT9vh8DcFR05DH4goNe0Eg8HoYXCQTJ+2kHTlvWLqRLlJQ46UsaLWVtAOKFuneju+KEsKdHPB+rbJL4nMrH2NkvpEi6KL3U4Xf0zrihxLka3FSmUNFuv8odYiAb6duB/KkJ5SIZPYv8F1AAlMivktaBlmPkDOw3v70QzG9ueGkev+hrxrsV2xN5FTYGg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4543.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(136003)(366004)(396003)(346002)(376002)(39860400002)(83380400001)(33716001)(186003)(26005)(2906002)(1076003)(478600001)(8676002)(5660300002)(6916009)(6506007)(86362001)(71200400001)(316002)(54906003)(6512007)(33656002)(6486002)(64756008)(66476007)(91956017)(66556008)(76116006)(66446008)(8936002)(66946007)(4326008)(44832011)(9686003)(38100700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?EbpXoeqV2fq5omAgpNdYam1JLDXJO/DeQRV8nnYMM/WxoV8S71JuVBzn86i8?=
 =?us-ascii?Q?B7jn8c5eU9gqpatdwEUH0JIjrtfyCR6JRb0kShu3p9a16bUWyh+DurtOYstK?=
 =?us-ascii?Q?76I42gMJ7Zb9sLx/XgzQyhxkwd4QjJGYnzWkDahHouDURELyZzM9aAsTlpuG?=
 =?us-ascii?Q?LEj1UbF4dQF3eD28SnWaQCWkVbp2EmqyL5gMcuXut3mZ+5tPV0OLBOYCkqhG?=
 =?us-ascii?Q?fm+zuPp6QtiXWdXDY0ECqGy6d3OGMFX2TASVDE95oj3ECqTPyvYPCJAVJ1cw?=
 =?us-ascii?Q?jOoVECXnbyoEA9cNg69T/1Dgx/dbi1TFncCUkbrCvgKguprPij8+kzJ7Qpj+?=
 =?us-ascii?Q?LeVso9cIL3sZ8F8ln4IYrUJCM/9WJEEdyMPjSiyl4XEtKvESKroY9dqwuvnV?=
 =?us-ascii?Q?b1G5DMI6mYLNJGBhd1QhdKpew+EnRyscs6wovVqF/n6S9/3HLwMEozutY1Az?=
 =?us-ascii?Q?ADe6mCKzIBo8Yb1gbF9M2ILVOVzH9WdM9okyg4kkxAN6FddHp2/rguaRdJwG?=
 =?us-ascii?Q?B1gM0HHRTWUuEdmQCLxE7DbXPeUW9UuBHQMLn9Ec1j+qYM+ZJFrvyBzrS5sd?=
 =?us-ascii?Q?YgT0F+51pxYsWSlMQOLAdzpqltWSoAG7QxJ4JUcFXnPd/5NrOACa3lyViBEy?=
 =?us-ascii?Q?AfhCCCzpmY66iDMwcFyj0rSzK+vPkbGoqtQA3SJEGo2ROmOYjyajIx2xAgXP?=
 =?us-ascii?Q?CRgT2QzJmCXKxys2pI6EesBXu2nocx1MQgfi5ovrGXHU+GQ8QzUiX8d2R72V?=
 =?us-ascii?Q?UsnlwOTVGZD0tbUtSb03z0S61C766GnEPR3IatrhT+gSzK83CRdQF9oDmzhh?=
 =?us-ascii?Q?TQ7VaIKNNFBgT0JC3BoWQ+54a5U64/WTPv0JixHLw2lvyIdlQ3VCfDv85DNU?=
 =?us-ascii?Q?we8j8zzkapmGfgWv3BCWfZZt2NVrx/F+NVW4pZBK55XcEpNq+suxOW50HxGu?=
 =?us-ascii?Q?son0Cwm1++fp4WsUaMzESCuNLdjelst66tpFcWuaVjDdAe73O9nlhxnFD5W2?=
 =?us-ascii?Q?kqWQoUTIPkFXbQafycNG7ks1xvArIjSWwsvVCaUtLzuJ7vhUt82XK9Osn966?=
 =?us-ascii?Q?qDSBToQbM0TCkJwaaCDP5e+XlPBXrLB0g8QDE2nxGdvWqKHL/D8YH1QXlZq1?=
 =?us-ascii?Q?6u5dQvnArPVjLO6gfAuO9Avawe3ppiipSsDOG57aHSuE+ln6nLsvribUJ3Nl?=
 =?us-ascii?Q?0MgOK8u15Vi9r6CE08AUhb0iYHXDF/hXQVLoT7Jux1mADfwFCFzsJ+kIuN/R?=
 =?us-ascii?Q?LG+uewhUa5cxkTk0c/HorUR+2VKgxrIoX25GcHFZ+v3cFEeZsyuOWZN42yUX?=
 =?us-ascii?Q?EYa9tLENAq34yUzicJ0O3EN4jNIn06qD8Acqir/qF8PqBA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BFA14FC0685BB84E87B5DF433E5E7788@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4543.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f8324bb-4c71-4d16-89f5-08d8ed8519c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2021 22:51:58.9634 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PcDnvhkAy1zIIL46U28nKP3mIIAEHi4MOSpodcHYTKuHZ1cTIbkSZ1flABZrUHRDdpKUFOiXrNquui1H/t8iHPhAbMdJqxU8fk4ARU8EC84=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR02MB7545
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-22_11:2021-03-22,
 2021-03-22 signatures=0
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0b-002c1b01.pphosted.com
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
Cc: "kwolf@redhat.com" <kwolf@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "mst@redhat.com" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "yc-core@yandex-team.ru" <yc-core@yandex-team.ru>,
 "mreitz@redhat.com" <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I'm mostly happy with this. My biggest overall comment is that I think
this should be split into two, as your refactor using different event
handlers for init is a standalone improvement over and above the bugfix.

I would have the first commit split out vhost_user_blk_event_init() and
vhost_user_blk_event_oper(), replace the runstate_is_running() check=20
...etc and the second commit immidiately call
vhost_user_blk_disconnect() during device realization.

A couple other comments mixed in bellow:

On Thu, Mar 11, 2021 at 11:10:45AM +0300, Denis Plotnikov wrote:
> Commit a1a20d06b73e "vhost-user-blk: delay vhost_user_blk_disconnect"

For the hash above can we rather use the first digits of the commit hash
instead of the last?

> introduced postponing vhost_dev cleanup aiming to eliminate qemu aborts
> because of connection problems with vhost-blk daemon.
>=20
> However, it introdues a new problem. Now, any communication errors
> during execution of vhost_dev_init() called by vhost_user_blk_device_real=
ize()
> lead to qemu abort on assert in vhost_dev_get_config().
>=20
> This happens because vhost_user_blk_disconnect() is postponed but
> it should have dropped s->connected flag by the time
> vhost_user_blk_device_realize() performs a new connection opening.
> On the connection opening, vhost_dev initialization in
> vhost_user_blk_connect() relies on s->connection flag and
> if it's not dropped, it skips vhost_dev initialization and returns
> with success. Then, vhost_user_blk_device_realize()'s execution flow
> goes to vhost_dev_get_config() where it's aborted on the assert.
>=20
> It seems connection/disconnection processing should happen
> differently on initialization and operation of vhost-user-blk.
> On initialization (in vhost_user_blk_device_realize()) we fully
> control the initialization process. At that point, nobody can use the
> device since it isn't initialized and we don't need to postpone any
> cleanups, so we can do cleanup right away when there is communication
> problems with the vhost-blk daemon.
> On operation the disconnect may happen when the device is in use, so
> the device users may want to use vhost_dev's data to do rollback before
> vhost_dev is re-initialized (e.g. in vhost_dev_set_log()), so we
> postpone the cleanup.
>=20
> The patch splits those two cases, and performs the cleanup immediately on
> initialization, and postpones cleanup when the device is initialized and
> in use.
>=20
> Signed-off-by: Denis Plotnikov <den-plotnikov@yandex-team.ru>
> ---
>  hw/block/vhost-user-blk.c | 88 ++++++++++++++++++++++++---------------
>  1 file changed, 54 insertions(+), 34 deletions(-)
>=20
> diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> index b870a50e6b20..84940122b8ca 100644
> --- a/hw/block/vhost-user-blk.c
> +++ b/hw/block/vhost-user-blk.c
> @@ -362,7 +362,17 @@ static void vhost_user_blk_disconnect(DeviceState *d=
ev)
>      vhost_dev_cleanup(&s->dev);
>  }
> =20
> -static void vhost_user_blk_event(void *opaque, QEMUChrEvent event);
> +static void vhost_user_blk_event(void *opaque, QEMUChrEvent event, bool =
init);

The parameter name "init" feels a little unclear. Maybe "realized"
would be better? I would also change the vhost_user_blk_event_init
function name accordingly.

> +
> +static void vhost_user_blk_event_init(void *opaque, QEMUChrEvent event)
> +{
> +    vhost_user_blk_event(opaque, event, true);
> +}
> +
> +static void vhost_user_blk_event_oper(void *opaque, QEMUChrEvent event)
> +{
> +    vhost_user_blk_event(opaque, event, false);
> +}
> =20
>  static void vhost_user_blk_chr_closed_bh(void *opaque)
>  {
> @@ -371,11 +381,11 @@ static void vhost_user_blk_chr_closed_bh(void *opaq=
ue)
>      VHostUserBlk *s =3D VHOST_USER_BLK(vdev);
> =20
>      vhost_user_blk_disconnect(dev);
> -    qemu_chr_fe_set_handlers(&s->chardev, NULL, NULL, vhost_user_blk_eve=
nt,
> -            NULL, opaque, NULL, true);
> +    qemu_chr_fe_set_handlers(&s->chardev, NULL, NULL,
> +            vhost_user_blk_event_oper, NULL, opaque, NULL, true);
>  }
> =20
> -static void vhost_user_blk_event(void *opaque, QEMUChrEvent event)
> +static void vhost_user_blk_event(void *opaque, QEMUChrEvent event, bool =
init)
>  {
>      DeviceState *dev =3D opaque;
>      VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
> @@ -390,38 +400,42 @@ static void vhost_user_blk_event(void *opaque, QEMU=
ChrEvent event)
>          break;
>      case CHR_EVENT_CLOSED:
>          /*
> -         * A close event may happen during a read/write, but vhost
> -         * code assumes the vhost_dev remains setup, so delay the
> -         * stop & clear. There are two possible paths to hit this
> -         * disconnect event:
> -         * 1. When VM is in the RUN_STATE_PRELAUNCH state. The
> -         * vhost_user_blk_device_realize() is a caller.
> -         * 2. In tha main loop phase after VM start.
> -         *
> -         * For p2 the disconnect event will be delayed. We can't
> -         * do the same for p1, because we are not running the loop
> -         * at this moment. So just skip this step and perform
> -         * disconnect in the caller function.
> -         *
> -         * TODO: maybe it is a good idea to make the same fix
> -         * for other vhost-user devices.
> +         * Closing the connection should happen differently on device
> +         * initialization and operation stages.
> +         * On initalization, we want to re-start vhost_dev initializatio=
n
> +         * from the very beginning right away when the connection is clo=
sed,
> +         * so we clean up vhost_dev on each connection closing.
> +         * On operation, we want to postpone vhost_dev cleanup to let th=
e
> +         * other code perform its own cleanup sequence using vhost_dev d=
ata
> +         * (e.g. vhost_dev_set_log).
>           */
> -        if (runstate_is_running()) {
> +        if (init) {
> +            vhost_user_blk_disconnect(dev);
> +        } else {
> +            /*
> +             * A close event may happen during a read/write, but vhost
> +             * code assumes the vhost_dev remains setup, so delay the
> +             * stop & clear.
> +             */
>              AioContext *ctx =3D qemu_get_current_aio_context();
> =20
> -            qemu_chr_fe_set_handlers(&s->chardev, NULL, NULL, NULL, NULL=
,
> -                    NULL, NULL, false);
> -            aio_bh_schedule_oneshot(ctx, vhost_user_blk_chr_closed_bh, o=
paque);

This comment itself is a standalone improvement - maybe add it as another s=
eparate
commit?

> +            /*
> +             * Prevent any re-connection until cleanup is done in
> +             * vhost_user_blk_chr_closed_bh
> +             */
> +             qemu_chr_fe_set_handlers(&s->chardev, NULL, NULL, NULL, NUL=
L,
> +                     NULL, NULL, false);
> +             aio_bh_schedule_oneshot(ctx, vhost_user_blk_chr_closed_bh, =
opaque);
> +
> +            /*
> +             * Move vhost device to the stopped state. The vhost-user de=
vice
> +             * will be clean up and disconnected in BH. This can be usef=
ul in
> +             * the vhost migration code. If disconnect was caught there =
is an
> +             * option for the general vhost code to get the dev state wi=
thout
> +             * knowing its type (in this case vhost-user).
> +             */
> +            s->dev.started =3D false;
>          }
> -
> -        /*
> -         * Move vhost device to the stopped state. The vhost-user device
> -         * will be clean up and disconnected in BH. This can be useful i=
n
> -         * the vhost migration code. If disconnect was caught there is a=
n
> -         * option for the general vhost code to get the dev state withou=
t
> -         * knowing its type (in this case vhost-user).
> -         */
> -        s->dev.started =3D false;
>          break;
>      case CHR_EVENT_BREAK:
>      case CHR_EVENT_MUX_IN:
> @@ -473,8 +487,10 @@ static void vhost_user_blk_device_realize(DeviceStat=
e *dev, Error **errp)
>      s->vhost_vqs =3D g_new0(struct vhost_virtqueue, s->num_queues);
>      s->connected =3D false;
> =20
> -    qemu_chr_fe_set_handlers(&s->chardev,  NULL, NULL, vhost_user_blk_ev=
ent,
> -                             NULL, (void *)dev, NULL, true);
> +    /* set the handler performing immediate cleanup on each disconnect *=
/
> +    qemu_chr_fe_set_handlers(&s->chardev,  NULL, NULL,
> +                             vhost_user_blk_event_init, NULL, (void *)de=
v,
> +                             NULL, true);
> =20
>  reconnect:
>      if (qemu_chr_fe_wait_connected(&s->chardev, &err) < 0) {
> @@ -494,6 +510,10 @@ reconnect:
>          goto reconnect;
>      }
> =20
> +    /* we're fully initialized, now we can operate, so change the handle=
r */
> +    qemu_chr_fe_set_handlers(&s->chardev,  NULL, NULL,
> +                             vhost_user_blk_event_oper, NULL, (void *)de=
v,
> +                             NULL, true);
>      return;
> =20
>  virtio_err:
> --=20
> 2.25.1
> =

