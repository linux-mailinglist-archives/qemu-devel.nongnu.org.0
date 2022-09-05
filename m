Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF6F5AC9B3
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 07:06:43 +0200 (CEST)
Received: from localhost ([::1]:57510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oV4Jl-0006mQ-UQ
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 01:06:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yajunw@nvidia.com>) id 1oV4Gq-000531-Hd
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 01:03:40 -0400
Received: from mail-dm6nam10on20625.outbound.protection.outlook.com
 ([2a01:111:f400:7e88::625]:32097
 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yajunw@nvidia.com>) id 1oV4Gg-0000am-D9
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 01:03:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cct/F9ABQ0DZoHh2Jbk+NphH8U/jOyvWzoOKNZh/GMs9nTIAzg31aMY3l3MA40rOyZvk6qvoiA1aZEK0M8hOm1BuVfq7A48WOgL1g4x9p/sgcWB5VblLoi6gH9XMDD3royVk61Fp37vlMp2yN+PCOYLstKQ3AA8J3gfxk/Rebrgbg7ZS+cldWuMp9r2LH2BReqrKfLx3DFHGZH5T2Rs1l9lJeE7uAKKziU6GA3cMGO/LcWaKdVkAahsPBuj/Suh8g1RReSw/2+o97dsOHIGjwtUpfT2IL8MOjKPYNzpza42IszaTDB5rPjsqEsM458j8biaiXrvRSibDly3oBLZFRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EL6DPN686hq/xNLp8sGMMxN2N3BU1SM17rJVPsHPM3w=;
 b=KW/ZXH6CuGmkLcX7hMGnPhWOGUvbcGSJ9+2qJtRnX8z4AU7ZRlumESffmfjGo0eBtyFyiJDfb7FF4JWxMTUK0ZVFoi4hS8A1fJdE+VudsTru7p17eLyWyCzjNx3Kj77dDERhB1mMKST0OTEnP1h1Izzj1fh6GvKzvUzduhMme5xkjVB2pCqIGUkQJu5RAWD54AechSRWKcUOTYZAF4URIeo5TZGcZxc/SqRVdI8vinrOKqZIDLanMKkwHRrpkfOQAIinCA1MkZgYvbrLxEU2o5A/VYwZP1HlF0ZFMfbKJy4bia8tZm14l2gVrVkLPlwZySocPXr42091Fe2FzNbheg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EL6DPN686hq/xNLp8sGMMxN2N3BU1SM17rJVPsHPM3w=;
 b=LjYxiIgwEdJPV0AkkQJmFQ/3n6KIriaFThGR8aUgp5YlzJ1nIMFccnfKJvAv1uF6f+ki5fpOsrBBl/9+qWQ17qPi7dG8+vsnbVzAx1mF710SOW6meaO7ve/fBfBOMchl3/rTfLHQEmDHLhEJ9MCnoNaCjL1KWA6eD6gSO3HpD+4QassfvCS6YteEr79ArjrABROVyjw8GKokQZmBaauvtcIp5IxBHpt5pDWo2zzpfjCxU1KBRGlGFQfMB3dLYo9vk3MaTpRhjolngGLdQTOQrD45tlJFehry7iIEObK7llRGD6ioVojMSlZiOSoyVb013AbqOpDYCKAH3Hv7EY8jxw==
Received: from DM4PR12MB5168.namprd12.prod.outlook.com (2603:10b6:5:397::8) by
 CH3PR12MB7665.namprd12.prod.outlook.com (2603:10b6:610:14a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 5 Sep
 2022 04:58:25 +0000
Received: from DM4PR12MB5168.namprd12.prod.outlook.com
 ([fe80::104b:956d:8d57:3aa1]) by DM4PR12MB5168.namprd12.prod.outlook.com
 ([fe80::104b:956d:8d57:3aa1%8]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 04:58:24 +0000
From: Yajun Wu <yajunw@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Parav Pandit
 <parav@nvidia.com>
Subject: RE: [PATCH v2 0/2] vhost-user: Support vhost_dev_start
Thread-Topic: [PATCH v2 0/2] vhost-user: Support vhost_dev_start
Thread-Index: AQHYld3jOxrXfnviMUGklpwBOMpEd62Q0+2AgD/IMoA=
Date: Mon, 5 Sep 2022 04:58:24 +0000
Message-ID: <DM4PR12MB5168A19342D84848A13E93A6B67F9@DM4PR12MB5168.namprd12.prod.outlook.com>
References: <20220629022517.2600911-1-yajunw@nvidia.com>
 <20220712105501.688628-1-yajunw@nvidia.com>
 <20220726105512-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220726105512-mutt-send-email-mst@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f8490255-031b-4a40-7e93-08da8efb439d
x-ms-traffictypediagnostic: CH3PR12MB7665:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ah8E4e2ITKrxXJDYRnUcJIFAqxa8Kal2Df0LV8Qh0DOPEdZj3CqaLaw+v8GCK+1k1CWwcp4lgDxKCvs65R+tIrIgfDTbJ8Yp+K8d9kiTkgcQi7VUVAKl1e50N6PVlmNDc9+MxHjIPlHtIS8p36OGpqK4D3IIod62dmcVYj+wPEtL9q7Ud7v/VMu7xkMzD/s2cVuRA9iVAD/Zkdfmft6ccAYwzvEdom7R1drxrnAu3dNdaoKhxs3nYlNC4oDqcJZaT6sRYbQMuHTlvMe16uSAxOS9jx3dVQBTP3veaqrghgOh7nkw5S57Bdu74OmNclVlrogPuzQhodoehvyi/W9l2bn39A8Fdjpg6qlFXT1NqYhrL4grBhVfmMQQdJUoUTd64yVet+qZtznNZmlZsL8OjWv+m9ab90GQMCVKfOCnEU1mvFp+ACOOwYaLjQni/+HOEWuzcvYB78On3t4Con1V8TIq4aS4HRy+Z9QVDM8xfKowdcJjPCSzJtWtGYtfixT8spUs08cuybWnSiTiD46lR3bFsN2jRWXuKmMvIqbya7E7XmxLErKQVX41DW4HlVsWUkUTl/jaVw2aASRhl/SMe2GRbxlV9/MZiDUDaG5l52sY8tojWlpBz+heRFm64gQPQGaF4KjvE3Q8t93QyDnPJkfyF66KBWXlLKKxtf3o/xPzk+iR1VIwju8CfO58iuquwygR7h/Kj+W0zaC8PYKwQa4UTVQAk6XAiy2CQ+HEWlPh7hu2fm6Z3K4eb5WJe/WcBdc/5vydi55Jx+5q9D0NXqyf2srtfQMqwTlNoOth2a0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5168.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(366004)(136003)(376002)(396003)(346002)(54906003)(76116006)(66476007)(66446008)(8676002)(66556008)(4326008)(66946007)(45080400002)(316002)(64756008)(107886003)(83380400001)(6916009)(86362001)(26005)(33656002)(9686003)(186003)(53546011)(52536014)(2906002)(38070700005)(55016003)(8936002)(5660300002)(38100700002)(478600001)(71200400001)(6506007)(41300700001)(966005)(7696005)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Y0y3MjzmCo94FYHFN3qJLHVO+K06WJG1yzBcGYwdEZWeCd43tCokoGukN4KR?=
 =?us-ascii?Q?ddjEgPzEIbcbFCQNdqluCXTe7XMugSR9id3VGeGzEkCnqFoSVFk6DCMCdEGV?=
 =?us-ascii?Q?ZJ2HcDnprHwfR0Pc9laEWNwz5iu4mnHMFz7dxGH7yTZLXT+Gbc3f/HGnCFkI?=
 =?us-ascii?Q?0GJ7WleL9lu9sCWpxWkf9QXeoQrDZC2qynTkh7JPO29ECNehglhhaI+i2sav?=
 =?us-ascii?Q?Nqqu9DPU5kmFmpBmV+OibowayZEc9+7/8yfP1hESYFsfaSxLrAD2+EM7U5Cw?=
 =?us-ascii?Q?C4DO+d6HMdfpe23Wnvr2PR9P4dLtcJKC73aUhJWyQIrcRkO9ciLc66YQ2eBK?=
 =?us-ascii?Q?RdvURqgdOm4ADUrm8a95LOUCwUHi7JbSOWViy6Omv4+zvNRn2QNtl8th8/ea?=
 =?us-ascii?Q?E68axflwRCAyTd8tjruSb+k8GSUnqMUYdUEsY6u8nGp/8CZ90gKxEAN6VNpH?=
 =?us-ascii?Q?obULFpFRyzwGdfSajtjQX6PGZjtrIDQlBqxpyqSm39Fw1kM6ApfTDX69v9L8?=
 =?us-ascii?Q?OTIXfPxDe7n7VL8jp4tyaqNQE/13ycirEJQx1YFatFr2J3TvBwyT1RgR70KW?=
 =?us-ascii?Q?2HwEQFSzJ8mKxro4TFdGjPn5ljoQQPL2WFxaAtamPkydzvkX8B+f7Zx39He3?=
 =?us-ascii?Q?2rIMSuoXs1iTdpzvOQ4Hxr+A1B6i+QABMBKyKDPLrxpj3ixnht+vLo2/rVig?=
 =?us-ascii?Q?Baj4KlB+iJfa6JirJH5DwLJ2mRLNLsZWjLFwd6IGXEO1b2O+TH0VTOZMBluN?=
 =?us-ascii?Q?KKfx0tsnE0ndOP8A9ZBHq1olTQxjqMCOSY+Qhf1qqYaBd6+ZPZ6mkXsqiny/?=
 =?us-ascii?Q?G7ATKG+LiJD700udOjEcI6ePFMgqFBV3vqDVefF3zUZkEZu4O+Beblcsj+t1?=
 =?us-ascii?Q?pEMG4Ee5HW+YOKEUGSgf8olLM3Qs03/1Ln+wIdlfB2RFSuaEMPbxyi1HlM7Y?=
 =?us-ascii?Q?uAHaQ4CHn05wnESqOQcJeFmSUhYN+iv+MJwrReCngFSTHJpUvSFpurtuz7o3?=
 =?us-ascii?Q?vkaWRm3etmO9xrU5pAjVSDzfSDddnhE6SJJBpitKCYnlT4fpKX9AGAisvug6?=
 =?us-ascii?Q?HpDyj1WbASAOR5gjfrfprYgdNZpDfgmoKoHvonzlpXhbu6U0B3yznHQaG/qZ?=
 =?us-ascii?Q?UDyVi5Zk/cO64gyj+EJAWy/MRiwAl8yMvjfcjLnQTccZHPPNOdrFPs4K2ttg?=
 =?us-ascii?Q?aeFuao1N9ah8xORm4BBkxcVqWyT3MM0x9fCk4rAM45uXQ4jRCzBLKx7VM+UT?=
 =?us-ascii?Q?lCYGO4mRvH/oItGkHk4kTAOE3c+zwPOgNJ8nqxsv7/SKKxD7x7RMS8UJIon8?=
 =?us-ascii?Q?YRRbO3EHlbHXoqfpZCV1V7NYQKUeYoOMLDsZ0Yx75s1Pzj5bWTQTOD5VzGG9?=
 =?us-ascii?Q?v0N/fW0Nl3md+ckj+uOVO9ZwL8dlOuEybNX121GX1YB6cryvdiTXsFH5sY36?=
 =?us-ascii?Q?ur27Yco61uK1TxZ6XbPAIm2zDF/BR49FT3iPzHLLCk09KV5KXPz9QGsU66Mh?=
 =?us-ascii?Q?v7ESLhqYH/TQOGVcN+JxmhW9IkkUOCWrx2YK2d1nShxwU9R+mmltouVreHJK?=
 =?us-ascii?Q?p/j1ntN2rRK38tdZS7Y=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5168.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8490255-031b-4a40-7e93-08da8efb439d
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2022 04:58:24.8208 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n8XUVhgPo6WUQB7LprECyHxidBEu0HqdpnyVif/YQxQAPZq2jLtNkqo5xProHKLpvCt4D4l9eJpU5C6BWLIEvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7665
Received-SPF: softfail client-ip=2a01:111:f400:7e88::625;
 envelope-from=yajunw@nvidia.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

Michael,

7.1 released, please merge.

-----Original Message-----
From: Michael S. Tsirkin <mst@redhat.com>=20
Sent: Tuesday, July 26, 2022 10:56 PM
To: Yajun Wu <yajunw@nvidia.com>
Cc: qemu-devel@nongnu.org; Parav Pandit <parav@nvidia.com>
Subject: Re: [PATCH v2 0/2] vhost-user: Support vhost_dev_start

External email: Use caution opening links or attachments


On Tue, Jul 12, 2022 at 01:54:59PM +0300, Yajun Wu wrote:
> The motivation of adding vhost-user vhost_dev_start support is to=20
> improve backend configuration speed and reduce live migration VM=20
> downtime.
>
> Today VQ configuration is issued one by one. For virtio net with=20
> multi-queue support, backend needs to update RSS (Receive side
> scaling) on every rx queue enable. Updating RSS is time-consuming=20
> (typical time like 7ms).
>
> Implement already defined vhost status and message in the vhost=20
> specification [1].
> (a) VHOST_USER_PROTOCOL_F_STATUS
> (b) VHOST_USER_SET_STATUS
> (c) VHOST_USER_GET_STATUS
>
> Send message VHOST_USER_SET_STATUS with VIRTIO_CONFIG_S_DRIVER_OK for=20
> device start and reset(0) for device stop.
>
> On reception of the DRIVER_OK message, backend can apply the needed=20
> setting only once (instead of incremental) and also utilize=20
> parallelism on enabling queues.
>
> This improves QEMU's live migration downtime with vhost user backend=20
> implementation by great margin, specially for the large number of VQs=20
> of 64 from 800 msec to 250 msec.
>
> Another change is to move the device start routines after finishing=20
> all the necessary device and VQ configuration, further aligning to the=20
> virtio specification for "device initialization sequence".

I think it's best to merge this after the 7.1 release.
I've tagged this but pls ping me after the release just to make sure it's n=
ot lost. Thanks!

> [1]=20
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fqemu
> -project.gitlab.io%2Fqemu%2Finterop%2Fvhost-user.html%23introduction&a
> mp;data=3D05%7C01%7Cyajunw%40nvidia.com%7Cb526f8237f7a4531d6eb08da6f16fc
> e9%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C637944441784266470%7CU
> nknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1ha
> WwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DzQ5%2F6pYP0riRzArdOWyaARNn
> 6s9NC8vIeIgj%2BB03EAM%3D&amp;reserved=3D0
>
> v2:
> - add setting status bit VIRTIO_CONFIG_S_FEATURES_OK
> - avoid adding status bits already set
>
> Yajun Wu (2):
>   vhost: Change the sequence of device start
>   vhost-user: Support vhost_dev_start
>
>  hw/block/vhost-user-blk.c | 18 ++++++----
>  hw/net/vhost_net.c        | 12 +++----
>  hw/virtio/vhost-user.c    | 74 ++++++++++++++++++++++++++++++++++++++-
>  3 files changed, 90 insertions(+), 14 deletions(-)
>
> --
> 2.27.0


