Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A97F5FC39E
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 12:17:26 +0200 (CEST)
Received: from localhost ([::1]:39910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiYnl-0004Pb-1O
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 06:17:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yajunw@nvidia.com>) id 1oiYlq-0002yF-8t
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 06:15:26 -0400
Received: from mail-co1nam11on2060a.outbound.protection.outlook.com
 ([2a01:111:f400:7eab::60a]:3712
 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yajunw@nvidia.com>) id 1oiYli-0002gf-T6
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 06:15:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kJZnJUFiO8f7T+Eyc2ryo/nDPZ3MqBE5uVuk2Ik/0LaRZVCll5wRUdQ9W/dAzyZLs2YsfF6lSY+hGUHvSkrbxExxUp9wM3j84EZ8sDFquOu4Aupu7Dvvhbz4cUJK3jnomgPC1x6g4RCV9LqHi+4BZAg9wGnaSsj0LU5rrwKSGe4cTSPzFabbDn1KrN3eVzVl3PaI6Cnjs73NqDHtg3xyTaVRCTt/8MSI0E/Eo3lthOtpq9DFsMO+rEcgJBYKprbuIfPl2Lcy1iMpUc4Z7k402J5ku+cqDs5ich97nNJd6qm5Pli3yu2qqQgf9x6tIQq8QrvG67RxFqNF6wolBgxjNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uY6HqkEDu9JCdy2ldbFBpqoN65dZ8zg8gVWYtr0yOXE=;
 b=lj/cqMXMb/NVal+nndy5Hv/jsnKQXI/FZ8ZvJJN7q68r5C2kf+/v5ViCdakKcJ7pENKyBmzEVjhON6ETRosFRUNleBgL2UScoDQcX4eso9qbCUBIub5/Ye5s7dFyZsvQ5msYUc2zq9CZ0un9f+Syc6Y3CqoGD3IlfYueL9h+Fm/26H1pnOd8XOKvhk3YGjXQXHjWxNuw9va/yhatXsRY29lCHNuymtwG+tJBNyT5RifmMN6jBQNL3JLvbey3g5+k3BB1W8nkdmEi6+K0VzX3ro01FwOkkmMBuP9EHWBLMUUlNlV37hRZ9ChCXloUaEgtfMPQJkiSo2t9a7KbDfGJhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uY6HqkEDu9JCdy2ldbFBpqoN65dZ8zg8gVWYtr0yOXE=;
 b=qzrfj+khOf4/QgGsZW0ggjL0HrPAI6cRlbvBlAU8UVazLR/9KnDjKhSfFx+5OWKCWrvt3A6D2MqdqagMEoe2dcsGy8am3vXGLEGS/0jI6CVPznFJGRn33lTlHJbjwrDPKcgNFaZEqflIoPFiu0j4L9Av/FimGg6deyl5yAgtN/3ACRsZnb5tzZ8pNF1sgjPYah8q8nP7de4OuwWmsnOeAYQ5m5oC08iNlOBoiNP355kENhq4/Y95GYdS2MvgSsnfw8N8oW5BCe+oIVb/o6RU5dnXZa4x+0RvPuuvoA4cS8J3RHbPCKuUAXdUGWfM7C40rqRHtfQHQaiA/bUZBRkyTQ==
Received: from DM4PR12MB5168.namprd12.prod.outlook.com (2603:10b6:5:397::8) by
 IA0PR12MB7556.namprd12.prod.outlook.com (2603:10b6:208:43c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.22; Wed, 12 Oct
 2022 10:10:11 +0000
Received: from DM4PR12MB5168.namprd12.prod.outlook.com
 ([fe80::c82a:7ff6:f2cf:e17d]) by DM4PR12MB5168.namprd12.prod.outlook.com
 ([fe80::c82a:7ff6:f2cf:e17d%9]) with mapi id 15.20.5709.021; Wed, 12 Oct 2022
 10:10:11 +0000
From: Yajun Wu <yajunw@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Parav Pandit
 <parav@nvidia.com>
Subject: RE: [PATCH v2 0/2] vhost-user: Support vhost_dev_start
Thread-Topic: [PATCH v2 0/2] vhost-user: Support vhost_dev_start
Thread-Index: AQHYld3jOxrXfnviMUGklpwBOMpEd62Q0+2AgD/IMoCAOn0UsA==
Date: Wed, 12 Oct 2022 10:10:11 +0000
Message-ID: <DM4PR12MB51680C66E878C507A6967A30B6229@DM4PR12MB5168.namprd12.prod.outlook.com>
References: <20220629022517.2600911-1-yajunw@nvidia.com>
 <20220712105501.688628-1-yajunw@nvidia.com>
 <20220726105512-mutt-send-email-mst@kernel.org>
 <DM4PR12MB5168A19342D84848A13E93A6B67F9@DM4PR12MB5168.namprd12.prod.outlook.com>
In-Reply-To: <DM4PR12MB5168A19342D84848A13E93A6B67F9@DM4PR12MB5168.namprd12.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5168:EE_|IA0PR12MB7556:EE_
x-ms-office365-filtering-correlation-id: d679ff04-fe4c-4023-fd8e-08daac39f2fe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AFp0wCG+P3tnsp42iA9mVTtweVye2SUU5RlLE2OA748bCb6P5BRHIXrLbawgiHm1oVi9EVn/ru6DGwg5eCztiJdGSbjavfHIotYmY6GrX+0VxjDQs4wmcZd0uZk2h2ZsC6kOL0fvoo+rEvoW7CiFf2zUy3f2t34wwhiQwX+Y77lbM6cHpu32vwkQgrWjWBhgL+VO2BHqxgXaCxWagMkmG0s6iYO00/izh+oZBxlM0Aw/IjV4L7ME+bLbbH+NdQJtwhntMM/AapXlYOjvi36FMSTt1fqbDLLZ6NAZYjhzuqJnK3rhPbxKi2XqFjir9lGdUMN54cF8Y6urjg5VSzHbjfFTpc2DHgEVTSpuM4EC/G/Wn6p9Yg8D2NP65GuvoyAPgJMGpxiaglyE/Pmo/08uPobP5qTyOXyS/PMtRwH04uzdKpQ2FBUcDJjBi/tU5JRV+x1TjgxBIX0FD1R93LFEcvnfokcV86w2a0JJ3FNq2UNKGPnGZ/4k7udUlzfoMxCA6H10zXXPOyDZZaLNclNvplC/PAeKSnxfCof+nxcY1wZWPgXuGg23OJFomR/zCfRIXz26qLb81wryNVDvK1Bu7oY6XO4ypLB0EoXZjLkjp1o+t/5mkbeDBy3yZYeXToqJJ9zARqNn5fH/cQpZ7h12bYi819a08mj/P25rqF2H4A93rEkxKRq2v0VQNJkgKO+lW4mWjUlTIEy7LVt9AwObDyK9H2t2StCKU7WCxFw7l0bnx8o2Rg3Cbgijemr5sXIJLs2vi3DmxlhEXyPUN7Ma2u9PboIOEFE4Vv59/+d+O7M=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5168.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(376002)(346002)(396003)(366004)(451199015)(316002)(55016003)(6916009)(54906003)(8936002)(186003)(122000001)(9686003)(52536014)(26005)(33656002)(5660300002)(2906002)(107886003)(4326008)(8676002)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(7696005)(6506007)(38100700002)(53546011)(41300700001)(71200400001)(38070700005)(966005)(45080400002)(83380400001)(86362001)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?l02s8xPk4EMJ2hNXsCG1qTYigkMbKSL4Mu+JwK0lIgM4Qt/JX+WlFZagXKkN?=
 =?us-ascii?Q?8IMtozAysh2ThiyMFxKYgB2D+UYMV/96Z9UPr49BfIs9Ji2IuLmjVcIEKs0O?=
 =?us-ascii?Q?3Z178fnpOvmGADpXGNZqxWtAEU0sHCIu51m8z16J+zq4jkeHJBNG4nKcYwVn?=
 =?us-ascii?Q?tQHzC434RykIvf55ueCkx3/94W+CcilfbLr/CJPv12MGiYI/uvF9IBWm55N5?=
 =?us-ascii?Q?deh0CSHOPA8OPoiftUZTGZOSjY7OZfTyMnvYnT1mW//VdmnzAjLvdDqdEZgM?=
 =?us-ascii?Q?fBySuy+z24P8NM+x84SlVj0P2K8iSc+0DK3Z8WeoMyDTUkAywSFk1x2+/1DF?=
 =?us-ascii?Q?BHB2U5TF7d3w53DX2W2jvEQpLAjv9lFKoauxvdOALyQcPtUsnxKNZinpXiVl?=
 =?us-ascii?Q?K3TatSJNHlKe2C7iTbqCsOFJ+N1tJ5VjfGsIWfCCqGw/u2BMEtfpoI9uhN0C?=
 =?us-ascii?Q?WMkkg++QHnt5G675uong7b0EGcYLxywp865/UIe+XnGR4CGitXht3qyC9+uv?=
 =?us-ascii?Q?6e4WmDHSSVynzYQprCtxa72+mQGQKRLTm6C1xfvOuPsjuBthIfMAQx3tosiF?=
 =?us-ascii?Q?vcN2ujDImzYv3BRtnSNOISB9l35wG9EPIYkFDpR0se1moM6LqHjY5iYid3Et?=
 =?us-ascii?Q?eagsEYXg0ENVRLPbMmKHnPg/8ymqxOcbWz4zmdR8fUpxE1sCciJBGB+qpJIC?=
 =?us-ascii?Q?HOCxbHFHvGXSnGqo6yrCdqhXQcUaN2zGSoUEr9gtJ4i+txahOXa/Enjr91Tr?=
 =?us-ascii?Q?9onTB7CS7mw1bxcIz7NOhIdTUFwikpHvDaSldME/Kt+0K2oriJopOqpXAfAH?=
 =?us-ascii?Q?PH9fxgwZsxUm3gCzyjSgP3KCTsoI/nEbt+VXYEHXLu3qyJnZZXuWmkNYBzE6?=
 =?us-ascii?Q?XJPc4x/LItrWbCxj16+hqTEbtx3GIPg+JI5GJxgEc2c1W628Bj+i6k0hG1+P?=
 =?us-ascii?Q?xAtOoFYZbrxANzDEmB6MuBN0CCRG54qgKHAP8ZKrnmf/EFMcltP6Prx0b4mb?=
 =?us-ascii?Q?7EOeKRLdyqVzCt5b6x1nLRHb34PAzAAlE39NLJUVNBFHUpDwLG+9eEIkDJzo?=
 =?us-ascii?Q?1c5x2GI39t3WycMSrz9KlwKoGgktHoh8Lcmwi5xeQA1krLGy8XsjdJGQSwOt?=
 =?us-ascii?Q?rqZcoZFfUN7Oix1/H064OzAW0IgUhBpprB8KzI0bnLLfkGDwwXES8DgiaKSg?=
 =?us-ascii?Q?Oaw8V3xbHEGSoXs0Q0dHp5KebPGVECix3VqetMpAiggIC/UjNxbNK92mYWeo?=
 =?us-ascii?Q?6gYKemxZAUbkXGgeAUynUJxKwJYqbDcd++b1b86vbCtKN9LkuzzYrEmimXnW?=
 =?us-ascii?Q?vCnxVCmvcZm9MPU/7FJZ14efkZMtEHuFaXR/AV9c5vV8Ffvmjr91F7QQD3kj?=
 =?us-ascii?Q?yy+dR1nkshMyA/nEV2CTSV0JVaOPC03w1VkyJKOjvfE50vCAW2UVftL1I+Ad?=
 =?us-ascii?Q?9cpKKbZDZHskjr/e0lqoxg6ERK6wISaPB/PUXGrNGGL0mA/xm+qvML6oUZ7/?=
 =?us-ascii?Q?5x1NHeJG9JzWnzeoh5tiVsMABcmFa40B/lIzJaprLmCnI9uiKyvm/rgMIxhQ?=
 =?us-ascii?Q?UZzfhrxfb6w/gQe+PS/Yj+xFbVpnnTSk+7kibAzf?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5168.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d679ff04-fe4c-4023-fd8e-08daac39f2fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2022 10:10:11.5789 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y6fgjScuelgjmTbpEp78EyRlVzvUdZXYO8NpGUqH6xV8+rwZweP+siEfoFt1F6N5uT32qIJ4YSb1daRzV8uzEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7556
Received-SPF: softfail client-ip=2a01:111:f400:7eab::60a;
 envelope-from=yajunw@nvidia.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Don't forget to merge. Thanks!

-----Original Message-----
From: Yajun Wu=20
Sent: Monday, September 5, 2022 12:58 PM
To: Michael S. Tsirkin <mst@redhat.com>
Cc: qemu-devel@nongnu.org; Parav Pandit <parav@nvidia.com>
Subject: RE: [PATCH v2 0/2] vhost-user: Support vhost_dev_start

Michael,

7.1 released, please merge.

-----Original Message-----
From: Michael S. Tsirkin <mst@redhat.com>
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

> [1]
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


