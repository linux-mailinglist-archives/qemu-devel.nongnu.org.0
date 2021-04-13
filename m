Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CADC35E652
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 20:26:17 +0200 (CEST)
Received: from localhost ([::1]:53604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWNjr-0006GR-Mw
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 14:26:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1lWNha-0005dF-C0; Tue, 13 Apr 2021 14:23:54 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:2112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1lWNhX-0001jb-LD; Tue, 13 Apr 2021 14:23:53 -0400
Received: from pps.filterd (m0127844.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13DINlqX002327; Tue, 13 Apr 2021 11:23:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=Ja5oYtKv1cJPcPDwmTGdRxvhS2U73KBL46YfGp75wdo=;
 b=U8s5Y63yHhwZNwI66bmyepWaUPekSZSncpsls/nkOGq8scTNg4lqQlMsf23KB6nIp93W
 n/NElTyTK1itswwLgov51G7Pa17TwMQL1iVX3/9pq4tWBHl8ZatArUIcvQil0lkycmQl
 8BqOeFVWyorUQjI8+t4Brz8id9+B21fGnAYqmrsQFn9Qv6qFSWqJKi/S9MZn7rS41V5J
 vpRpUn9k1I3tKVIf6cDDlKl60B4ZoGIUv+57XWSd0EZtJssRfB5cGM3ttfJF8sASxRF+
 A2hKqxbM4Mkf7JAfCyxZBu+UQgez/la8DYRFd/g05oiwiuQI/+Tmdmfwyclsc7x/EJ9v +A== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
 by mx0b-002c1b01.pphosted.com with ESMTP id 37w9atgx42-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 11:23:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L9FOAKdJ7kGuLxfYI+puNsvaZHQFmyIJhyaMKxNJiSRqjyZtaQ+dYgaXpIds1pt6nIXJU7bTqho6VCV5xBTln/D8JTqzohjHa+rMND60V+JgkSPb2PdVbnDETAfw3M3e+MnSz2i8+OCcB2SvpgfNLD0AYt/v7/8blSvuOdFUC/7UG7hNdGPadrkKQMpkFueg080GtusALcLeg1iZh+9CW9IA/vVpP5vKfIMJJcmA6gbkXpKdzL57F3qx9R8TcHVkWKvzaTjrxGOh3pywJAocK5gj54oq8ggFaQnMzA1DLMmaor6pe0pqBGijswgr13YwSvpSgC9B7xrTMFtfxvUxNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ja5oYtKv1cJPcPDwmTGdRxvhS2U73KBL46YfGp75wdo=;
 b=BnvkEnmJhc3aPo7MB65DZ5Yib+qgIj1mJy/tbc0TO6UD3AZG9LcwQg7sDx32zCkCco2pV3MP/aIVo6jdoOtA/c3KKjkQBXuoxXrrgRlGJleFD/dQAXnP1Tt947NbiyPg3M189T8Ca1dD3qO0/RG7PMGeq1oI3UCkdxNt4GJOBdvazHwkHfzWO/Fpyh7J7bVcTmPSCnGG9tiiXl7tQPzednQUNJCu5UfSUlpBIUJFbqVNkYzgzrb+j60lEtaHlaNtj/ChVRd/CnxEiJm49ZTAsLAp3KahbOWwyBtB66eAGbeveK8/sTvUck+PnAoR06JuTnXNK9VEjmTrqKtP8Ick4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from SN6PR02MB4543.namprd02.prod.outlook.com (2603:10b6:805:b1::24)
 by SN6PR02MB4736.namprd02.prod.outlook.com (2603:10b6:805:94::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16; Tue, 13 Apr
 2021 18:23:45 +0000
Received: from SN6PR02MB4543.namprd02.prod.outlook.com
 ([fe80::bdbb:69ac:63f9:fc33]) by SN6PR02MB4543.namprd02.prod.outlook.com
 ([fe80::bdbb:69ac:63f9:fc33%7]) with mapi id 15.20.4020.022; Tue, 13 Apr 2021
 18:23:45 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2] vhost-user-blk: Fail gracefully on too large queue size
Thread-Topic: [PATCH v2] vhost-user-blk: Fail gracefully on too large queue
 size
Thread-Index: AQHXMIYQ3zqqWECgvk60N+jnfDyapaqywquA
Date: Tue, 13 Apr 2021 18:23:45 +0000
Message-ID: <20210413182145.GA19046@raphael-debian-dev>
References: <20210413165654.50810-1-kwolf@redhat.com>
In-Reply-To: <20210413165654.50810-1-kwolf@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nutanix.com;
x-originating-ip: [24.94.68.249]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 23585714-382e-47b5-2462-08d8fea94614
x-ms-traffictypediagnostic: SN6PR02MB4736:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR02MB473645B1A526B9C75A52CF7CEA4F9@SN6PR02MB4736.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:206;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 92wm5i7uGW1kqNbWL1CF0qYd02ltud82dCZkC60CkfHJzMyHa0I3ZC5SCVYy/uqVvcCJHuIJxpg4p+eccHIPnmXTmOqxbSnhkydZ/HThbHsf/unTwcTpY1/m3GIUR/INV4cPYc1OvBcUnn2Fqdbm+7OunSx8xQq2/YG2S9NGPIEHPJP/axiePcfrAcR7Q+8gxDQnZn1FSjgMKG2VVe60JPsggyWnJlzBhUeNuDQ4dejltx0Dkh/nKriCA1LUjQbLnUZos4iNuVqx+QTD3BiRoGdtrnMvX1k2iMDUX1FoIyZmA5upPvBrxOJoMzwhYgQ67M5sG0sOUscdNfCKujxg72qMvQuB2Aq+VkEoBHNOTQCPH39ByQhgbG7m5MXTNncALhHearZKgPtk7r1leVhiMVLMcTmYHht4SA/tjxj1T3E9hF75XUQ/KpmLPu6TrEQfDbOlCNFEn5LiU3CQGcjvTyFgBRl+zR6yJWgntbFPael0DUIsi0N6ibmeM5mDlI9/qFftjIGMOhf0299fmRb3axPic9UKFx0QIU2FtzZlM+G7+1q/GW3KkO23+jRIiH+45eyHNxJ4l5BShU7HCMJEkL3bR4jk+/jjk9GM2j67LhC2jYd/qH8oLPQDwbPEi5guxUifEM8G5VY2pi80jvzm3i2Oef/oacKU73uN+bu8iKpgniLwpk7CiUBsYS2kw4w7
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4543.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(39860400002)(376002)(396003)(346002)(136003)(366004)(186003)(44832011)(6486002)(86362001)(83380400001)(4326008)(91956017)(9686003)(6512007)(1076003)(66446008)(64756008)(2906002)(66946007)(5660300002)(26005)(316002)(76116006)(54906003)(122000001)(6916009)(6506007)(33716001)(8676002)(71200400001)(478600001)(8936002)(966005)(66476007)(38100700002)(33656002)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?0e5Zlkar3LpHyXfTlViOjjfs2HMODIChRniCJ8vWGkiMlKZN90RzETpRKY8l?=
 =?us-ascii?Q?hN+PGSz8ARcNhlq+Gx+zpogPf5RWw13rA44rFKtmijZi3wLJcXC5xnPqVpnc?=
 =?us-ascii?Q?hDeEBp4jmHQThrO+61pUnVtwJzErN+j0EDz2rYdEI3dctj91RlPbtAXu5hzH?=
 =?us-ascii?Q?t1cgD7wRoXnxYKQNBez1zluA2rCJwrugU9YIU07BzEkQx2bD3zsdRZW2C2Sb?=
 =?us-ascii?Q?HOucIniWatEXO2RBOEenvVKSv/6E5guV3covPmaL/Uz0rSzhKvYw4yQ23KWm?=
 =?us-ascii?Q?TVmXkV6jqnDw+qKoKPG4lBmFr75xNCEowkvwMyxZNYammcC9OOXYh8KqkKOz?=
 =?us-ascii?Q?hgdjTgmWvE7AUsA7OgLpvTHyFycBeAcLDr8wqrdtXFRrwCQSzWmhmph2nlC7?=
 =?us-ascii?Q?nIosVMAOsn/RIcCGMr5pvqj04fMOUtJhasauIen71ZiWuPglVaWcu8fvEguC?=
 =?us-ascii?Q?pHhWoF6hFr/cpwIEfIUStck+9hgcA6qgaSc7TxpN3Yn7/O4Erg+T1pEd96pH?=
 =?us-ascii?Q?K3rdXVzjNGyJEczti7TGL5UEMCCc4Y+yUQFF/KncFa+RdZibX+VQpnXo19ND?=
 =?us-ascii?Q?4rv1nHHf8Bjrc+06FXA11YgOW8oGOtwwwRy2ioeyCXr/fp/QsYVXY+dymjOx?=
 =?us-ascii?Q?EFZHsj4GGkbtMRSr+UnKtJrnebtQjh1AtBNWu4ob/KR/N0XWl3hp59e5jQOE?=
 =?us-ascii?Q?8gzze8kfoS2d0QAY1UrYNemk7JHg6U185XZ1+amTwtXpvHnvX7FgrkDqwICI?=
 =?us-ascii?Q?jxsch0Dx1tSFf6nFjg5S0sjhOQKANxFSMWe/Lozj4+XerOc6a+PJFUbdlEUD?=
 =?us-ascii?Q?QzHqmLXlEqje6zTvHxsQX9YWs42w1fj8J0is8gzbQaDioqbkbjav/iRhFlf4?=
 =?us-ascii?Q?wUl7Wi+uNuPgFXZh6KYKrK0xDhV0xj9UnBUXfKZQfepoe+QiWj+JuSyEBKhs?=
 =?us-ascii?Q?uAhkO2wskOays4RRUyVUKJ9/4P6jHVu+BeOVwc2o5/hhpoCADbsanUmC1078?=
 =?us-ascii?Q?rkY0/BisBa1cgqSWXwMQt748S3mJ/hJFkq4zyTMGNs8Zov2S++nnGYGvQbf8?=
 =?us-ascii?Q?3hoyd8y5SMffaV1Ff35ZZmG1rKXQCdCiIYDw8dVabn+o0ZqVXtUZfA5gjiuH?=
 =?us-ascii?Q?l5gdqu4/OsZBkGjyeX/fBsma56q8xMGneLiqsWCJFlu61nqNZnHBtZRALJ9E?=
 =?us-ascii?Q?sT5dilfADiUFyFTRWP0kJlc7rFKw2041w8CCDZO0ZojbTxNPjRft2CxSSUj0?=
 =?us-ascii?Q?vdx2/c1Vxgv+CBTqshJp4kN+9sWIKhyRsFyUfYjwHBjvmfrgxXhJ+SEB5ndY?=
 =?us-ascii?Q?4QVVCFgEpCZ/FFQKgPnPx43O?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9EA1AF06C54707438FF573193CE81EE3@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4543.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23585714-382e-47b5-2462-08d8fea94614
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2021 18:23:45.0559 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5epgTdtNShc4rPpuLopc5dD/5bwkMvRPvoFA0l6dMZySg5SQ7fwJkOmCPvRe09lmydDY4Os6uMHQZxeqh+pyK9xGqOJ9ndVeCrOPTg90FD0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4736
X-Proofpoint-ORIG-GUID: qs1R7hEiNtbcgFnWPYci8hPWtxc4bHBT
X-Proofpoint-GUID: qs1R7hEiNtbcgFnWPYci8hPWtxc4bHBT
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-13_12:2021-04-13,
 2021-04-13 signatures=0
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "mst@redhat.com" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 13, 2021 at 06:56:54PM +0200, Kevin Wolf wrote:
> virtio_add_queue() aborts when queue_size > VIRTQUEUE_MAX_SIZE, so
> vhost_user_blk_device_realize() should check this before calling it.
>=20
> Simple reproducer:
>=20
> qemu-system-x86_64 \
>     -chardev null,id=3Dfoo \
>     -device vhost-user-blk-pci,queue-size=3D4096,chardev=3Dfoo
>
> Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=3D1935014
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  hw/block/vhost-user-blk.c | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>

>=20
> diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> index 0b5b9d44cd..f5e9682703 100644
> --- a/hw/block/vhost-user-blk.c
> +++ b/hw/block/vhost-user-blk.c
> @@ -467,6 +467,11 @@ static void vhost_user_blk_device_realize(DeviceStat=
e *dev, Error **errp)
>          error_setg(errp, "vhost-user-blk: queue size must be non-zero");
>          return;
>      }
> +    if (s->queue_size > VIRTQUEUE_MAX_SIZE) {
> +        error_setg(errp, "vhost-user-blk: queue size must not exceed %d"=
,
> +                   VIRTQUEUE_MAX_SIZE);
> +        return;
> +    }
> =20
>      if (!vhost_user_init(&s->vhost_user, &s->chardev, errp)) {
>          return;
> --=20
> 2.30.2
> =

