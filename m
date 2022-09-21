Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2B55D0223
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 20:00:28 +0200 (CEST)
Received: from localhost ([::1]:44328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob40p-0005bI-1m
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 13:59:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1ob3y8-0003mE-BE; Wed, 21 Sep 2022 13:57:12 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:17308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1ob3y4-0001Fx-Bz; Wed, 21 Sep 2022 13:57:07 -0400
Received: from pps.filterd (m0127838.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28LFFE2L021046;
 Wed, 21 Sep 2022 10:57:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=proofpoint20171006;
 bh=hE+f4zrh6gLDkZZMrUVmZP+JyLP5dkUiupwCkeRU2dM=;
 b=FHIsU6lyzgl1euBpAJS2BWG4H/zuy+ihG1VYAPheL46ZE8YfZJGo2wYNeTf0CCHOrBSY
 MKisB1gfK4pdnbGImQJYQ/dD/Ua3QQbUYpxeKj2xGdXJ26XQvJKJRgG90rBm1NdIGaje
 zzSAJAifqi3z3ZOjHz01rqw9WCSLz/xXDM/GPggHVZY80TvLrpaaflJ0+pYCFaBJOfNA
 cqeKOOGnnjXPZ2QE6ySOljF2z+aT1Z6dpyq/HV4+3Yo3lyGs3J00WmkeDkJYOEgkcbwo
 WT3zVSpfxtV2zYuZKyK6xVPNzVK3z59zSFn1uvBJJIvvTELsZ043USoiROxliklj5Yzx tA== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3jndsyty43-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Sep 2022 10:57:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oV/5RUiWtgIBmEl6Im9u+jbO8TXXm3+s49Aj3rE2h02TbKCT2GWYH4y1RjwTQUgLUqL4HjFMMag0oGrc2AlG1dK//gid/mb0mvOg1Ih/9pKvJmk3xL5IuP1/s5bjSDHFYn3doY42ne32t8QLo4tlKleMXjHNGp3LfRoI0zbTuiFQSPF0XUHpWdhzduu1jCbtgxTXoTXJAgeKjDYpQREvq/SvFLA+9SOzt+UtCQtzsrdKDihosXUftWRM4smE3c88xRQAIVojqtdScZma/hIOFKA9I1AWr0NjZWmmoOisVgXOgkT9kwDVtkFR4htd58ZW+7xIxoqwUjyBsDdx3+KaYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hE+f4zrh6gLDkZZMrUVmZP+JyLP5dkUiupwCkeRU2dM=;
 b=AjDE4kr7M3/C+73ctW0aPHenLbaBBGu4FlGWfL2pIndpIRxM8Iw7FDv6UKcqTzFDqoLs9dVZRdD4A2WnzfcepqpE7kR0cKYVEmddiIDWnmKxA7TzVnijqBR09+6HkgCphynBpPxQs2lNoVd9a3/LJu5J84LypJs2e57U0S1WIfIuqlMNZTjNYTyPITgntipvqNe3A90qwyukqQiOlYf/vzx66EjoHLf9rTytUVqD751Etb66WoaDtY5iE87oXzqChyh3qB0fb2puDa5eaNju6RvFeHSvh4zbBtA8GDm9WPzhvULKFgoA7LHySQb9JwE+ctudQncLr7Av8zRSpaMoxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by BL0PR02MB6468.namprd02.prod.outlook.com (2603:10b6:208:1ce::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.16; Wed, 21 Sep
 2022 17:56:57 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::e8ab:ff5d:aded:71ea]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::e8ab:ff5d:aded:71ea%3]) with mapi id 15.20.5654.017; Wed, 21 Sep 2022
 17:56:57 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: chenh <chenh@yusur.tech>, "mst@redhat.com" <mst@redhat.com>
CC: "jasowang@redhat.com" <jasowang@redhat.com>, "kwolf@redhat.com"
 <kwolf@redhat.com>, "hreitz@redhat.com" <hreitz@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>,
 "houyl@yusur.tech" <houyl@yusur.tech>, "zy@yusur.tech" <zy@yusur.tech>,
 "lulu@redhat.com" <lulu@redhat.com>, Hao Chen <chenh@yusur.tech>
Subject: Re: [PATCH v2] hw/virtio/vhost-user: support obtain vdpa device's mac
 address automatically
Thread-Topic: [PATCH v2] hw/virtio/vhost-user: support obtain vdpa device's
 mac address automatically
Thread-Index: AQHYzX9xm4I9qy0EZU2cg8lpFtdlkK3qK/Mz
Date: Wed, 21 Sep 2022 17:56:57 +0000
Message-ID: <BL3PR02MB79380882D0B877C2D5A754FFEA4F9@BL3PR02MB7938.namprd02.prod.outlook.com>
References: <20220921060026.392164-1-chenh@yusur.tech>
In-Reply-To: <20220921060026.392164-1-chenh@yusur.tech>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR02MB7938:EE_|BL0PR02MB6468:EE_
x-ms-office365-filtering-correlation-id: e596958f-f327-4656-8084-08da9bfaacda
x-proofpoint-crosstenant: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XTLGmDZfUPJrCxFtsqK0dZ3P0iIpG4ju1jhBD33LQL6cAVsWrLqJRYk3gtxeZ4IcNqa9VBohUiphoYYrGukeaOA5lyYrr3rGPtgurUoRsbDnrcoR5hYVVzJZmtWVVAoY1p6N+O6k7fF2IIIqtcXSU+giZT4Zr/53fj/Bdm1XAKcaHnvLoMv3e63Obf1MT3t9oDnlIevmRsF4oMnZmPAZ9pBvYuUnDs7eqTbhxKtG0aAn5uIc6MrAltjEbpkcYlnQ78Uhdxn7FRkcmhPBLVZC/FxyvXmVYdqvJWmwi1fyht92342BGA8N2hmrAN/n0jZ41UzMYxgGQ5t7VXT5QvNBgEWOJ3oyfEVd1I4RAjWXcI3kNci1qHyJcs/H7tUOSW7DwQR+lDd0LBmPd9sraVRPbF9m/bIcaqFlzqL6AXE+m9EFaQ67gWT4uhA5MNl9LYP11w4Nf+PGPWeraO6YMKfXhUeUo8arT7/B1sgyFOzVDdgIvz9H24VFDd2009XC1yHLhRhw1UMjS9GjZhSyyQsB0nJNzUCeELc+XbkC/CTRAwOqUEchl7sfXD+AKPqYZTLY1lgaKDzCiNx2KH31tf2LJsNGH6wZDdilBN4RfwnC4IGf2wyvra7aUWNXfvqrb1Nuzs6aUA6JKnol1j9sjz8WmhF7OFSgz/gV8sbbZWV3o/wR4DHmDyUn3cyrcblr3c9w8RYWsYRW+twhorutT0o5kC03q7yVWd46Mw4XIr8oSf/2sKvDDmT43GgEnSSDbiW7xnxlr8DSQ7PZgdOIi6c+gw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(346002)(376002)(136003)(396003)(39850400004)(451199015)(86362001)(55016003)(33656002)(110136005)(38100700002)(38070700005)(316002)(91956017)(76116006)(71200400001)(8936002)(478600001)(122000001)(7416002)(2906002)(66946007)(52536014)(44832011)(4326008)(66446008)(66556008)(8676002)(66476007)(64756008)(5660300002)(41300700001)(186003)(83380400001)(54906003)(9686003)(7696005)(6506007)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?8bbPPf1tdnLtMwIVNws+/FOLGlv/MJIf+CYdSHNKlXJMGI0Aw56wquND?=
 =?Windows-1252?Q?thi9s8x79plkRZoTsC0nj0DBnIRvccpdLcnueM54tz9u9dT35QCJ45ip?=
 =?Windows-1252?Q?zYWEnbi2/GRudVQ+0LB4va7tUhRVzitlsoEi0ORezwRpAfBRzlOhOVfD?=
 =?Windows-1252?Q?btY5MKKnTdl8bGmz0N6hCvm+KcC5f7IfDwR6A85k3OQ5Y9oSSJO31iqP?=
 =?Windows-1252?Q?DmeJ/srdhYHt8Z4Oy2eBfD+F82K6e1MYRI3lGuWCB1MXlQhuJ8AJPEef?=
 =?Windows-1252?Q?ctI0z+efT2CE2sNwP31jq46Gd3dF1mb2uprd972kjCDp+50r5bu4SRPc?=
 =?Windows-1252?Q?u/QJ1nVbAmxJAtchsAz+Gg+IKYGIsH8jqsZbdIC+Q8sSJmF2FTMa84+8?=
 =?Windows-1252?Q?Cc9iKwPlozGi4GfBp0pdH7mNXEz1N/h1nTe50gWptW66z1wAl+ivUXjB?=
 =?Windows-1252?Q?jle6zp4nvekJNeVujSiLvkcs/aGHg5osic9Rt1KigrzC7yUetx4Tvco4?=
 =?Windows-1252?Q?3Y1RoyawLZbMTu5rqOjmMAOagZEKD4KMgjqa12bUYC61lGdmDEQ6L34x?=
 =?Windows-1252?Q?nLmpg/0dLaX1sjUMbBRksNk0Gp+sD18Ifz2P5E9mpkmUKGkMgNxv///b?=
 =?Windows-1252?Q?GBccYfEr7fIPvzIS7m2BAAuVIAGvvDWyPNbAHU4zh+w9QlQaHJzvNM+M?=
 =?Windows-1252?Q?FbwtotP3fXGA0/3yaewzEhefO66bB0aYs+T/VHnOERbtXaaRklNve9MT?=
 =?Windows-1252?Q?Z21yo/ac3FgKYsqolae2lgnXtaYbZoJ1bPr7Nza2EXijGI5ETrY4J6Uy?=
 =?Windows-1252?Q?L7/DGZSgorQ/gMHgkMJCjkEfrbPaILVxN1Ws87+zZBaQ2HB0JRy46foe?=
 =?Windows-1252?Q?FavzutS167ZzpjdRJ/K4Pt4s/dK+Ciaz7Omb+Up+Oiapa1tTQpnP0h8g?=
 =?Windows-1252?Q?Nlhdl8DENofIS73Hdv0eDHmK5PVKJJGuDvikcT7qSDavFBrKeWPXhMtX?=
 =?Windows-1252?Q?fII1FWns9k0MhUD05Ci0fJZp5UCZ5H7wGsuBN2hraT7rIYjHW3Qez634?=
 =?Windows-1252?Q?GgUyrmuY1+8biMzFkLLRJg0Kz1TleF4tMlwGnglsrAvIGf4oGc67jFRx?=
 =?Windows-1252?Q?rGoneauSdiT0g+QiPobu/Gt4S1XITJtA0jzYVcnCg63YRk+UfDWNcjdb?=
 =?Windows-1252?Q?Eu603+quc/jw4jwngRb4qzcZDckNcK8NqMzoZl3LVyIWc1PaiYkpQ58R?=
 =?Windows-1252?Q?L9q+gKh5PjKOQ3gScJ6uByX1kSZq/fmqjcOBrWT2NgTnUbNRlH1aX82X?=
 =?Windows-1252?Q?Mqp2q020lNbd2SJRHKUIoYGOCsbyn7hkWbtvNE7UQ6QKDzb0tKsv3NM0?=
 =?Windows-1252?Q?IDXC9pR9ZGMbZ5xEj1wFh0cfOTNURVnL5shPZHG0qAhEAuJAv+bh4MWg?=
 =?Windows-1252?Q?XUY+g1TsERz5v4d5Ma/VMkyb1UgqvHsZU+vryzgsOAqCGKqfF1fje97t?=
 =?Windows-1252?Q?8j4ArHor6hFEymsv7VhHlVBJ/CGTwr5RrT4KmBGGHPT6RPbPyX9sZdbH?=
 =?Windows-1252?Q?/j976C5Z2IKjmv5u4S7LYQvRG4lmiz9pvmSPg4x0guv/RvXmWSgxy2Hl?=
 =?Windows-1252?Q?YQhdAt3IJyxA67IlRu2gJkczKOIF4RDeNuPk0k4S4jGUdtyeQC3kWO8K?=
 =?Windows-1252?Q?cnKHDk/THga3h0SVI0MBXqTG7CJbvQg/xqwKyG3r7SsEjX5ISn7hbK7t?=
 =?Windows-1252?Q?5P8qv9VtMRF6a7MRzzk=3D?=
Content-Type: multipart/alternative;
 boundary="_000_BL3PR02MB79380882D0B877C2D5A754FFEA4F9BL3PR02MB7938namp_"
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e596958f-f327-4656-8084-08da9bfaacda
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2022 17:56:57.0008 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vNUYKbcTAWTVt3QlZTOdrQKbmq0EvhLIew+vsmUGn1T529+XpkkcRlfhYl9DJ2fujh9h7fvMm1O9V7n9Xz9PtPKEpYED9ci8L42unqa7ufk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB6468
X-Proofpoint-GUID: b88x7q71NNTebsorxrCuwxvap_RP-LxZ
X-Proofpoint-ORIG-GUID: b88x7q71NNTebsorxrCuwxvap_RP-LxZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-21_09,2022-09-20_02,2022-06-22_01
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

--_000_BL3PR02MB79380882D0B877C2D5A754FFEA4F9BL3PR02MB7938namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

If I read your response on the other thread correctly, this change is inten=
ded

to prioritize the MAC address exposed by DPDK over the one provided by the

QEMU command line? Sounds reasonable in principle, but I would get confirma=
tion

from vDPA/vhost-net maintainers.



That said the way you=92re hacking the vhost-user code breaks a valuable ch=
eck for

bad vhost-user-blk backends. I would suggest finding another implementation=
 which

does not regress functionality for other device types.





>From: Hao Chen <chenh@yusur.tech>

>

>When use dpdk-vdpa tests vdpa device. You need to specify the mac address =
to

>start the virtual machine through libvirt or qemu, but now, the libvirt or

>qemu can call dpdk vdpa vendor driver's ops .get_config through vhost_net_=
get_config

>to get the mac address of the vdpa hardware without manual configuration.

>

>v1->v2:

>Only copy ETH_ALEN data of netcfg for some vdpa device such as

>NVIDIA BLUEFIELD DPU(BF2)'s netcfg->status is not right.

>We only need the mac address and don't care about the status field.

>

>Signed-off-by: Hao Chen <chenh@yusur.tech>

>---

> hw/block/vhost-user-blk.c |  1 -

> hw/net/virtio-net.c       |  7 +++++++

> hw/virtio/vhost-user.c    | 19 -------------------

> 3 files changed, 7 insertions(+), 20 deletions(-)

>

>diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c

>index 9117222456..5dca4eab09 100644

>--- a/hw/block/vhost-user-blk.c

>+++ b/hw/block/vhost-user-blk.c

>@@ -337,7 +337,6 @@ static int vhost_user_blk_connect(DeviceState *dev, Er=
ror **errp)

>

>     vhost_dev_set_config_notifier(&s->dev, &blk_ops);

>

>-    s->vhost_user.supports_config =3D true;

>     ret =3D vhost_dev_init(&s->dev, &s->vhost_user, VHOST_BACKEND_TYPE_US=
ER, 0,

>                          errp);

>     if (ret < 0) {

>diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c

>index dd0d056fde..90405083b1 100644

>--- a/hw/net/virtio-net.c

>+++ b/hw/net/virtio-net.c

>@@ -166,6 +166,13 @@ static void virtio_net_get_config(VirtIODevice *vdev,=
 uint8_t *config)

>             }

>             memcpy(config, &netcfg, n->config_size);

>         }

>+    } else if (nc->peer && nc->peer->info->type =3D=3D NET_CLIENT_DRIVER_=
VHOST_USER) {

>+        ret =3D vhost_net_get_config(get_vhost_net(nc->peer), (uint8_t *)=
&netcfg,

>+                                   n->config_size);

>+        if (ret !=3D -1) {

>+               /* Automatically obtain the mac address of the vdpa device

>+                * when using the dpdk vdpa */

>+                memcpy(config, &netcfg, ETH_ALEN);

>     }

> }

>

>diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c

>index bd24741be8..8b01078249 100644

>--- a/hw/virtio/vhost-user.c

>+++ b/hw/virtio/vhost-user.c

>@@ -2013,8 +2013,6 @@ static int vhost_user_backend_init(struct vhost_dev =
*dev, void *opaque,

>     }

>

>     if (virtio_has_feature(features, VHOST_USER_F_PROTOCOL_FEATURES)) {

>-        bool supports_f_config =3D vus->supports_config ||

>-            (dev->config_ops && dev->config_ops->vhost_dev_config_notifie=
r);

>         uint64_t protocol_features;

>

>         dev->backend_features |=3D 1ULL << VHOST_USER_F_PROTOCOL_FEATURES=
;

>@@ -2033,23 +2031,6 @@ static int vhost_user_backend_init(struct vhost_dev=
 *dev, void *opaque,

>          */

>         protocol_features &=3D VHOST_USER_PROTOCOL_FEATURE_MASK;

>

>-        if (supports_f_config) {

>-            if (!virtio_has_feature(protocol_features,

>-                                    VHOST_USER_PROTOCOL_F_CONFIG)) {

>-                error_setg(errp, "vhost-user device expecting "

>-                           "VHOST_USER_PROTOCOL_F_CONFIG but the vhost-us=
er backend does "

>-                           "not support it.");

>-                return -EPROTO;

>-            }

>-        } else {

>-            if (virtio_has_feature(protocol_features,

>-                                   VHOST_USER_PROTOCOL_F_CONFIG)) {

>-                warn_reportf_err(*errp, "vhost-user backend supports "

>-                                 "VHOST_USER_PROTOCOL_F_CONFIG but QEMU d=
oes not.");

>-                protocol_features &=3D ~(1ULL << VHOST_USER_PROTOCOL_F_CO=
NFIG);

>-            }

>-        }

>-

>         /* final set of protocol features */

>         dev->protocol_features =3D protocol_features;

>         err =3D vhost_user_set_protocol_features(dev, dev->protocol_featu=
res);

>--

>2.27.0

>


--_000_BL3PR02MB79380882D0B877C2D5A754FFEA4F9BL3PR02MB7938namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
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
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
p.p1, li.p1, div.p1
	{mso-style-name:p1;
	margin:0in;
	font-size:8.5pt;
	font-family:Menlo;
	color:black;}
p.p2, li.p2, div.p2
	{mso-style-name:p2;
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
<p class=3D"p1"><span class=3D"s1">If I read your response on the other thr=
ead correctly, this change is intended</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">to prioritize the MAC address exposed by=
 DPDK over the one provided by the</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">QEMU command line? Sounds reasonable in =
principle, but I would get confirmation</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">from vDPA/vhost-net maintainers.</span><=
o:p></o:p></p>
<p class=3D"p2"><o:p>&nbsp;</o:p></p>
<p class=3D"p1"><span class=3D"s1">That said the way you=92re hacking the v=
host-user code breaks a valuable check for</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">bad vhost-user-blk backends. I would sug=
gest finding another implementation which</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">does not regress functionality for other=
 device types.</span><o:p></o:p></p>
<p class=3D"p2"><o:p>&nbsp;</o:p></p>
<p class=3D"p2"><o:p>&nbsp;</o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;From: Hao Chen &lt;chenh@yusur.tech&=
gt;</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;</span><o:p>&nbsp;</o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;When use dpdk-vdpa tests vdpa device=
. You need to specify the mac address to</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;start the virtual machine through li=
bvirt or qemu, but now, the libvirt or</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;qemu can call dpdk vdpa vendor drive=
r's ops .get_config through vhost_net_get_config</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;to get the mac address of the vdpa h=
ardware without manual configuration.</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;</span><o:p>&nbsp;</o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;v1-&gt;v2:</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;Only copy ETH_ALEN data of netcfg fo=
r some vdpa device such as</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;NVIDIA BLUEFIELD DPU(BF2)'s netcfg-&=
gt;status is not right.</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;We only need the mac address and don=
't care about the status field.</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;</span><o:p>&nbsp;</o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;Signed-off-by: Hao Chen &lt;chenh@yu=
sur.tech&gt;</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;---</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt; hw/block/vhost-user-blk.c |</span><=
span class=3D"apple-converted-space">&nbsp;
</span><span class=3D"s1">1 -</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt; hw/net/virtio-net.c </span><span cl=
ass=3D"apple-converted-space">&nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">|</span><span class=3D"apple-converted-space">&nb=
sp; </span><span class=3D"s1">7 +++++++</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt; hw/virtio/vhost-user.c</span><span =
class=3D"apple-converted-space">&nbsp; &nbsp;
</span><span class=3D"s1">| 19 -------------------</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt; 3 files changed, 7 insertions(+), 2=
0 deletions(-)</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;</span><o:p>&nbsp;</o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;diff --git a/hw/block/vhost-user-blk=
.c b/hw/block/vhost-user-blk.c</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;index 9117222456..5dca4eab09 100644<=
/span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;--- a/hw/block/vhost-user-blk.c</spa=
n><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;+++ b/hw/block/vhost-user-blk.c</spa=
n><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;@@ -337,7 +337,6 @@ static int vhost=
_user_blk_connect(DeviceState *dev, Error **errp)</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;</span><span class=3D"apple-converte=
d-space">&nbsp;</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt; </span><span class=3D"apple-convert=
ed-space">&nbsp; &nbsp; </span>
<span class=3D"s1">vhost_dev_set_config_notifier(&amp;s-&gt;dev, &amp;blk_o=
ps);</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;</span><span class=3D"apple-converte=
d-space">&nbsp;</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;-</span><span class=3D"apple-convert=
ed-space">&nbsp; &nbsp; </span>
<span class=3D"s1">s-&gt;vhost_user.supports_config =3D true;</span><o:p></=
o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt; </span><span class=3D"apple-convert=
ed-space">&nbsp; &nbsp; </span>
<span class=3D"s1">ret =3D vhost_dev_init(&amp;s-&gt;dev, &amp;s-&gt;vhost_=
user, VHOST_BACKEND_TYPE_USER, 0,</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;</span><span class=3D"apple-converte=
d-space">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">errp);</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt; </span><span class=3D"apple-convert=
ed-space">&nbsp; &nbsp; </span>
<span class=3D"s1">if (ret &lt; 0) {</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;diff --git a/hw/net/virtio-net.c b/h=
w/net/virtio-net.c</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;index dd0d056fde..90405083b1 100644<=
/span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;--- a/hw/net/virtio-net.c</span><o:p=
></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;+++ b/hw/net/virtio-net.c</span><o:p=
></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;@@ -166,6 +166,13 @@ static void vir=
tio_net_get_config(VirtIODevice *vdev, uint8_t *config)</span><o:p></o:p></=
p>
<p class=3D"p1"><span class=3D"s1">&gt; </span><span class=3D"apple-convert=
ed-space">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">}</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt; </span><span class=3D"apple-convert=
ed-space">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">memcpy(config, &amp;netcfg, n-&gt;config_size);</=
span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt; </span><span class=3D"apple-convert=
ed-space">&nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">}</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;+</span><span class=3D"apple-convert=
ed-space">&nbsp; &nbsp; </span>
<span class=3D"s1">} else if (nc-&gt;peer &amp;&amp; nc-&gt;peer-&gt;info-&=
gt;type =3D=3D NET_CLIENT_DRIVER_VHOST_USER) {</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;+</span><span class=3D"apple-convert=
ed-space">&nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">ret =3D vhost_net_get_config(get_vhost_net(nc-&gt=
;peer), (uint8_t *)&amp;netcfg,</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;+ </span><span class=3D"apple-conver=
ted-space">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">n-&gt;config_size);</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;+</span><span class=3D"apple-convert=
ed-space">&nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">if (ret !=3D -1) {</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;+ </span><span class=3D"apple-conver=
ted-space">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">/* Automatically obtain the mac address of the vd=
pa device</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;+</span><span class=3D"apple-convert=
ed-space">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">* when using the dpdk vdpa */</span><o:p></o:p></=
p>
<p class=3D"p1"><span class=3D"s1">&gt;+</span><span class=3D"apple-convert=
ed-space">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">memcpy(config, &amp;netcfg, ETH_ALEN);</span><o:p=
></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt; </span><span class=3D"apple-convert=
ed-space">&nbsp; &nbsp; </span>
<span class=3D"s1">}</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt; }</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;</span><span class=3D"apple-converte=
d-space">&nbsp;</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;diff --git a/hw/virtio/vhost-user.c =
b/hw/virtio/vhost-user.c</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;index bd24741be8..8b01078249 100644<=
/span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;--- a/hw/virtio/vhost-user.c</span><=
o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;+++ b/hw/virtio/vhost-user.c</span><=
o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;@@ -2013,8 +2013,6 @@ static int vho=
st_user_backend_init(struct vhost_dev *dev, void *opaque,</span><o:p></o:p>=
</p>
<p class=3D"p1"><span class=3D"s1">&gt; </span><span class=3D"apple-convert=
ed-space">&nbsp; &nbsp; </span>
<span class=3D"s1">}</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;</span><span class=3D"apple-converte=
d-space">&nbsp;</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt; </span><span class=3D"apple-convert=
ed-space">&nbsp; &nbsp; </span>
<span class=3D"s1">if (virtio_has_feature(features, VHOST_USER_F_PROTOCOL_F=
EATURES)) {</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;-</span><span class=3D"apple-convert=
ed-space">&nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">bool supports_f_config =3D vus-&gt;supports_confi=
g ||</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;-</span><span class=3D"apple-convert=
ed-space">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">(dev-&gt;config_ops &amp;&amp; dev-&gt;config_ops=
-&gt;vhost_dev_config_notifier);</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt; </span><span class=3D"apple-convert=
ed-space">&nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">uint64_t protocol_features;</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;</span><span class=3D"apple-converte=
d-space">&nbsp;</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt; </span><span class=3D"apple-convert=
ed-space">&nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">dev-&gt;backend_features |=3D 1ULL &lt;&lt; VHOST=
_USER_F_PROTOCOL_FEATURES;</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;@@ -2033,23 +2031,6 @@ static int vh=
ost_user_backend_init(struct vhost_dev *dev, void *opaque,</span><o:p></o:p=
></p>
<p class=3D"p1"><span class=3D"s1">&gt;</span><span class=3D"apple-converte=
d-space">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">*/</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt; </span><span class=3D"apple-convert=
ed-space">&nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">protocol_features &amp;=3D VHOST_USER_PROTOCOL_FE=
ATURE_MASK;</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;</span><span class=3D"apple-converte=
d-space">&nbsp;</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;-</span><span class=3D"apple-convert=
ed-space">&nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">if (supports_f_config) {</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;-</span><span class=3D"apple-convert=
ed-space">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">if (!virtio_has_feature(protocol_features,</span>=
<o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;-</span><span class=3D"apple-convert=
ed-space">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">VHOST_USER_PROTOCOL_F_CONFIG)) {</span><o:p></o:p=
></p>
<p class=3D"p1"><span class=3D"s1">&gt;-</span><span class=3D"apple-convert=
ed-space">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">error_setg(errp, &quot;vhost-user device expectin=
g &quot;</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;- </span><span class=3D"apple-conver=
ted-space">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">&quot;VHOST_USER_PROTOCOL_F_CONFIG but the vhost-=
user backend does &quot;</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;- </span><span class=3D"apple-conver=
ted-space">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">&quot;not support it.&quot;);</span><o:p></o:p></=
p>
<p class=3D"p1"><span class=3D"s1">&gt;-</span><span class=3D"apple-convert=
ed-space">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">return -EPROTO;</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;-</span><span class=3D"apple-convert=
ed-space">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">}</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;-</span><span class=3D"apple-convert=
ed-space">&nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">} else {</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;-</span><span class=3D"apple-convert=
ed-space">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">if (virtio_has_feature(protocol_features,</span><=
o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;- </span><span class=3D"apple-conver=
ted-space">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">VHOST_USER_PROTOCOL_F_CONFIG)) {</span><o:p></o:p=
></p>
<p class=3D"p1"><span class=3D"s1">&gt;-</span><span class=3D"apple-convert=
ed-space">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">warn_reportf_err(*errp, &quot;vhost-user backend =
supports &quot;</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;- </span><span class=3D"apple-conver=
ted-space">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">&quot;VHOST_USER_PROTOCOL_F_CONFIG but QEMU does =
not.&quot;);</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;-</span><span class=3D"apple-convert=
ed-space">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">protocol_features &amp;=3D ~(1ULL &lt;&lt; VHOST_=
USER_PROTOCOL_F_CONFIG);</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;-</span><span class=3D"apple-convert=
ed-space">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">}</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;-</span><span class=3D"apple-convert=
ed-space">&nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">}</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;-</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt; </span><span class=3D"apple-convert=
ed-space">&nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">/* final set of protocol features */</span><o:p><=
/o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt; </span><span class=3D"apple-convert=
ed-space">&nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">dev-&gt;protocol_features =3D protocol_features;<=
/span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt; </span><span class=3D"apple-convert=
ed-space">&nbsp; &nbsp; &nbsp; &nbsp;
</span><span class=3D"s1">err =3D vhost_user_set_protocol_features(dev, dev=
-&gt;protocol_features);</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;--</span><span class=3D"apple-conver=
ted-space">&nbsp;</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;2.27.0</span><o:p></o:p></p>
<p class=3D"p1"><span class=3D"s1">&gt;</span><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span style=3D"font-s=
ize:11.0pt"><o:p>&nbsp;</o:p></span></p>
</div>
</div>
</body>
</html>

--_000_BL3PR02MB79380882D0B877C2D5A754FFEA4F9BL3PR02MB7938namp_--

