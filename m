Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC61C624028
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 11:42:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot4zW-00073X-Ok; Thu, 10 Nov 2022 05:41:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yajunw@nvidia.com>) id 1ot4zU-00073A-1L
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 05:41:00 -0500
Received: from mail-bn8nam12on2060a.outbound.protection.outlook.com
 ([2a01:111:f400:fe5b::60a]
 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yajunw@nvidia.com>) id 1ot4zR-0007DW-I4
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 05:40:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R4vNwSfR2Hsb2Jzt3OLETqZBgE29RrN6m7jnJida31AEoH6dOAsV188wWrrnCuehmlY+T1y4/6cTSIeIUODHoREoknNnw3C3INplL//TCEEnVLaOO06DyEFLpu3m4+sP6ij77YDzKBX80IVDbg5dWQ3GvDGFgphfRxotpI73ZYZqEH1TVDbrbGLlfGoWq0omJodDKtOTe/PZk4ovCNE9X7/drnKiz9yH2n/j4Yje2kXzHPuc7tHs6DKm+y3mdlpawyba80vU8AOuaR3YRc6VHVd/REXs7EmwLaB0dFKbqPHSOQbE9+Vcm3TY2AgflWgbzKeM/WvP7Y2u3fzArmaj4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ilB8gFu8Vbs1TAWt+V/hYeXFnzpfp8n++6BpnC1GJPg=;
 b=ZwER9RGHb4+lBURWrvz1cmRClH26QtAW7lYVXOb49s9hlwbOiHJuVq0wqVzwMyow0gn4wMUlYGQZ6uVCshsVqvcFvW6HJSDsTyDeVKDJY2F9fTJSvdmIJmL4PASbHxymla16mNdEixOU2/k0qMiopDJtX3GWy3U0MhXya2jSIzK/BoDfJzwQ62Fd4nggSH1uVe7viSVR6mleapYHkTCXkN5ZOFe6CVXB95bZApKwYD17jzzAJ1pKuHrtxtr43+n/iubTYbm1YCbYfg18qqZY5LasZYdfj8OBYPsH3Fo1AFKWffCft57WhSdkbLMmq8W75lzERl+XtSZW9Hr/AxoP8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ilB8gFu8Vbs1TAWt+V/hYeXFnzpfp8n++6BpnC1GJPg=;
 b=hiX3wbXqOkULFBoXHrYsJLh4fuMClTz0QH3K8mDlsq7qTTrmBOxeDteZwUTw7BLvZHDmK/y82SjxlzDGs67VodP/rudCj52lgRgos9q5Ew0E61yPAaG01jJ1cDYVdFf2IiRfYqa97lPhLUweeLrJN+FmSkR5GQjk2uxLZahJaLPJEpcvuaGGZgM5Pp3y9HnNKUZiZvwWeix0jLcQ+JBwgBdZ7hD+mLeSwux+lc3tUIpwIGJPWhp0tC1jpToOY+chXiXzjztOfVLcB5MvA84s92AYd4NEemMYLbo1+8TByexuo/510kYWMIBjGi/HMO/Kfeel4swnHFUM+gWFNzf4lA==
Received: from DM4PR12MB5168.namprd12.prod.outlook.com (2603:10b6:5:397::8) by
 CY8PR12MB7434.namprd12.prod.outlook.com (2603:10b6:930:52::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.12; Thu, 10 Nov 2022 10:35:50 +0000
Received: from DM4PR12MB5168.namprd12.prod.outlook.com
 ([fe80::2bec:c2ce:ead9:c610]) by DM4PR12MB5168.namprd12.prod.outlook.com
 ([fe80::2bec:c2ce:ead9:c610%9]) with mapi id 15.20.5813.013; Thu, 10 Nov 2022
 10:35:50 +0000
From: Yajun Wu <yajunw@nvidia.com>
To: =?iso-8859-1?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "mst@redhat.com"
 <mst@redhat.com>, Parav Pandit <parav@nvidia.com>
Subject: RE: [PATCH  v2 1/4] hw/virtio: incorporate backend features in
 features
Thread-Topic: [PATCH  v2 1/4] hw/virtio: incorporate backend features in
 features
Thread-Index: AQHYoo420afh1hRyOUGAOazdHACteK4guCnwgAAfj4CAF7yUgA==
Date: Thu, 10 Nov 2022 10:35:49 +0000
Message-ID: <DM4PR12MB5168D79B6312F25544556B13B6019@DM4PR12MB5168.namprd12.prod.outlook.com>
References: <20220728135503.1060062-1-alex.bennee@linaro.org>
 <20220728135503.1060062-2-alex.bennee@linaro.org>
 <DM4PR12MB5168A6071D5A3A961E0CCB69B6309@DM4PR12MB5168.namprd12.prod.outlook.com>
 <877d0n58t6.fsf@linaro.org>
In-Reply-To: <877d0n58t6.fsf@linaro.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5168:EE_|CY8PR12MB7434:EE_
x-ms-office365-filtering-correlation-id: 51bd884e-a3fe-4fe4-91c5-08dac30755f4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oG8mmwNd2esAi7Ker8/gHcHxAqbOqwIj1gF82h/JRWq431J+a7MrBjISkXN2Y+MjTR2vV1QZMCotMUMzuGrePk8QkOJ5MPNACy1IBtJdDmyaga4ZwXRuMSj2qFyVWUJN5f+gJ3s6Qh3mNnyMd/H1B2ACAm9Eh1aDYrtWNxZMuvqeqR42ijtPB1f/kk2ZXX6BgtjOopWfOejMSoZ2IGkKh7jfMJNT3cFAVNsKfNrVZ8Z9BPfBGRILDk8PBGG5WVUaf/He9sArlCcfopMnqpqehd3ZHUb9iAScSXDzDzjfJq20C6oSDFdP9V5dEiTnaU+fJb6xveMCZblgLzXs+RAx+/YnR2JZpG9T3qsqH3TBpU8JnAJfwa8oEXpvBCDnJcilyee3WMA6WgU4HX1HTbwBSaI0aBs2gS4o72mCRZAwkyuXnm/14giXVQddShwEY6t9VWNlw1iQ6NsdciC7oGM2y42rpQZcny/BMesEaUpOpnReoy8HhktmOSrUfkOSUNkTuFnfKIQKSf2lN9L5c6yJfmmBsr6DLmKkgjSGhyVCKVdgeHGar0MoIfu01UjHBZuZN1dBhxCpA9+EZBv032Qto18TR9jmecG+bblGvpYYwECJlvHsTyyLREh2DOW2HkKkyRj7hTJZZ2DLdhClpSqmSWCF1jB6Kvo57wn81hJ4cY98RdAR/8gsnslOeaei/4VRRkoa1XZa81LPEG7EBi5Y/7Zyt6WOTTUX5x4+FeAq7OAeEFHfvEdggaMUsKMSU0W7tHK9Ysst/OtS1ridWud20u5hCtUO6Ras2WdQu1Wf7dc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5168.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(136003)(376002)(366004)(39860400002)(451199015)(6506007)(7696005)(33656002)(86362001)(38070700005)(122000001)(38100700002)(186003)(2906002)(54906003)(9686003)(26005)(83380400001)(53546011)(66574015)(6916009)(5660300002)(107886003)(52536014)(966005)(478600001)(8936002)(71200400001)(55016003)(66556008)(45080400002)(66476007)(8676002)(41300700001)(64756008)(66446008)(4326008)(316002)(66946007)(76116006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?rMMAjlteBr+Sn6KBCGv0XxSyaPlYMVma7JwksJ+73MNdO4oP49Oi1XIFvY?=
 =?iso-8859-1?Q?a6YJTjIKymBkz4FIPFjqZdgpWmPhtDbzMTOLoGlg7DF4R8IgzWx1UpZwl5?=
 =?iso-8859-1?Q?70/hxoMfOMwKfuBtC8T1IGofUE0K0gw1uNVzp9RY9Oo5L7TP+alN7Vzn5e?=
 =?iso-8859-1?Q?wzAw4sHJr8EWXwmbcRpcQkxesuLvCBLkDkrHiCxfoLqOqpsvAyvyVjfpYN?=
 =?iso-8859-1?Q?JjpApG/bK32coOpKeFoo21EO4dLDeOu5uZxwC5VkxBfDvFXdnIapsRrn05?=
 =?iso-8859-1?Q?fEb9psNgbll8RCmW4uEj2amOq7V//0PXFjHxvgr3vrAGTjxhqVe0TNIfef?=
 =?iso-8859-1?Q?vazVRwcGc5CFS/a1lYDywSdqClqzKGoujYbjwEhghQhtz5wPx1HuXXn8l5?=
 =?iso-8859-1?Q?WKEXaUprsDXXdMn3gJxOm1POcZHIldLj+WaPQiMHL3/4kKl2GtXQB3pNoU?=
 =?iso-8859-1?Q?ZJnzjQ8Vo/d++OTeU1qAMvoVPhu/wIid7nx27SV/ySfFtvFE2fAm9P4MBK?=
 =?iso-8859-1?Q?yVuwucCmQUAASzLkWnct8Wl5TnshCrgfjQ0wyDtkL5OH0siWM2PcStHZdC?=
 =?iso-8859-1?Q?sZ48kKEtjjtn2bq/OeBFmjE9bGGg/Xf0DxhjOr4gSxuSYXoXw+UbyH810U?=
 =?iso-8859-1?Q?VuNSBCdNUD7nf9yQchm/g6QDuJUfBxV3vlg6spdtkNTBpEaRNE1ox0g8Ts?=
 =?iso-8859-1?Q?EB1QLcc4zbCzk0QSVhyZoQhojoXruQCO5Lz+NJ14X8rnyAKrVdkjN33jKI?=
 =?iso-8859-1?Q?EqrPIULg/4kQwBsd+Nix/ihSNhy2XyPlD3UcF8ibLSke5rlgvBEq3uHOYz?=
 =?iso-8859-1?Q?Lf6Wd5sVRoy3C84epF6YGR+rx7JlFHPqBIJWr6h4wAXiGd0dZMDL66RhmP?=
 =?iso-8859-1?Q?g7PF1tsrifZ59FpAuhDRvoYLd7G+J1nfdIRDulGYbFmti9QvNevpX0rTXk?=
 =?iso-8859-1?Q?GHO1FIkSe2zR8pw98oJBSxc1Gf8LY6/fhzi8BjFwL6gO35gCjYsRbFNH2W?=
 =?iso-8859-1?Q?ofYm3lxaMSRDwSVwq+MwB8GbsNjLZxyvOfZadD14EIDuAydi1gAoB7Vdco?=
 =?iso-8859-1?Q?7lZ50IK0NEN8mAgpHLf+uQ8R4XzmTdjmuOW2NnBFaltw/IK5V47VkW1Tko?=
 =?iso-8859-1?Q?Fa07l/TSPH6MoIowgJj/r38f6KMxmqbpTX0vumlSWaAy3azi4sq6HZ0nBx?=
 =?iso-8859-1?Q?o9Kc7ANYfe7YLY4tcinbXrTIgsbSPkGDZ4qTSgXQBd+M6FRktq/pun+9fl?=
 =?iso-8859-1?Q?6yiMMXMc3biZQa8UZlqxUF94cEqVNeyxCj7S6FJnvQMv/RiJYgL6RKUFcJ?=
 =?iso-8859-1?Q?PU4nrQCAB8Ciw62d3F2krw+NsKFMQQ2hjRKoIZAwFS6/OAQgagOQwhbwBm?=
 =?iso-8859-1?Q?IA/YuxscJcxfC6VVn5mDthjmC4RCXWwbc3wggHC4Z5zEvhE5mdNAVdsan7?=
 =?iso-8859-1?Q?MBYuubQfBVvxbfXCHvR0Rnm5FlPdXthrM4mK11iwtzEeq0Tvcc5mcG9Jks?=
 =?iso-8859-1?Q?5U00D99avs5xTIKwuM0z5zuYFNb/ufWJmTu/Tw/dVsHAsyFPpBRgsYITCD?=
 =?iso-8859-1?Q?VBguOI1F7NBi/BPoSFqtD/K/vcMUB62IlCKreZNYM6chW+hp5UI6Sm6gjf?=
 =?iso-8859-1?Q?F+7RN6XBc1xN1nMGKDPgOr78FSBQom/kpn?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5168.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51bd884e-a3fe-4fe4-91c5-08dac30755f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2022 10:35:50.0001 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EVRbw66M2FD/+Oy1b4woq9zo75gjHW2/SX6l9dyai8z9YS1Rg3F/9bDH/IB2KFIVvWZFJr2F1Y8HaQqlz98eNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7434
Received-SPF: softfail client-ip=2a01:111:f400:fe5b::60a;
 envelope-from=yajunw@nvidia.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Alex,

Sorry for the late response, I missed your mail.
You can test together with dpdk and have reproduce.

Steps:
1. DPDK=20
git clone https://github.com/DPDK/dpdk.git
git checkout v22.07
meson build -Dexamples=3Dvhost_blk
ninja -C build
cd /tmp/
sudo dpdk/build/examples/dpdk-vhost_blk # it's a daemon=20

2. Add blk device to qemu, then bootup VM.
  <qemu:commandline>
    <qemu:arg value=3D'-chardev'/>
    <qemu:arg value=3D'socket,id=3Dchar0,path=3D/tmp/vhost.socket'/>
    <qemu:arg value=3D'-device'/>
    <qemu:arg value=3D'vhost-user-blk-pci,chardev=3Dchar0,num-queues=3D1'/>
  </qemu:commandline>

Without this commit, you can get device ready log from dpdk-vhost_blk:

VHOST_CONFIG: (/tmp/vhost.socket) negotiated Vhost-user protocol features: =
0x11ebf
VHOST_CONFIG: (/tmp/vhost.socket) negotiated Virtio features: 0x100000000
VHOST_CONFIG: (/tmp/vhost.socket) virtio is now ready for processing.
New Device /tmp/vhost.socket, Device ID 0
Ctrlr Worker Thread start

With this commit, device won't be ready and VM will hang.=20
You can see VHOST_USER_F_PROTOCOL_FEATURES bit is added.

VHOST_CONFIG: (/tmp/vhost.socket) negotiated Virtio features: 0x140000000

Dpdk code related:
./lib/vhost/vhost_user.c

2044     /*                                                                =
         =20
2045      * When VHOST_USER_F_PROTOCOL_FEATURES is not negotiated,         =
         =20
2046      * the ring starts already enabled. Otherwise, it is enabled via  =
         =20
2047      * the SET_VRING_ENABLE message.                                  =
         =20
2048      */                                                               =
         =20
2049     if (!(dev->features & (1ULL << VHOST_USER_F_PROTOCOL_FEATURES))) {=
         =20
2050         vq->enabled =3D true;                                         =
           =20
2051     }


Thanks,
Yajun=20




-----Original Message-----
From: Alex Benn=E9e <alex.bennee@linaro.org>=20
Sent: Wednesday, October 26, 2022 3:42 PM
To: Yajun Wu <yajunw@nvidia.com>
Cc: qemu-devel@nongnu.org; mst@redhat.com; Parav Pandit <parav@nvidia.com>
Subject: Re: [PATCH v2 1/4] hw/virtio: incorporate backend features in feat=
ures

External email: Use caution opening links or attachments


Yajun Wu <yajunw@nvidia.com> writes:

> Hi Alex,
>
> With this change, VHOST_USER_F_PROTOCOL_FEATURES bit will be set to=20
> backend for virtio block device (previously not).
>
> From https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
www.qemu.org%2Fdocs%2Fmaster%2Finterop%2Fvhost-user.html&amp;data=3D05%7C01=
%7Cyajunw%40nvidia.com%7C2e8901540bf441248ec608dab725ca87%7C43083d15727340c=
1b7db39efd9ccc17a%7C0%7C0%7C638023670196631779%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C=
%7C&amp;sdata=3Dy5g9wwTfh%2BxrkESRypoo4pg3eKYInyDerDmI844PBSE%3D&amp;reserv=
ed=3D0 spec:
> If VHOST_USER_F_PROTOCOL_FEATURES has not been negotiated, the ring start=
s directly in the enabled state.
> If VHOST_USER_F_PROTOCOL_FEATURES has been negotiated, the ring is=20
> initialized in a disabled state and is enabled by=20
> VHOST_USER_SET_VRING_ENABLE with parameter 1.
>
> Vhost-user-blk won't send out VHOST_USER_SET_VRING_ENABLE today.
> Backend gets VHOST_USER_F_PROTOCOL_FEATURES negotiated and can't get VHOS=
T_USER_SET_VRING_ENABLE.
> VQs keep in disabled state.

If the backend advertises protocol features but the stub doesn't support it=
 how does it get enabled?

The testing I did was mostly by hand with the gpio backend and using the qt=
ests. I Think we need to add some acceptance testing into avocado with some=
 real daemons because I don't think we have enough coverage with the curren=
t qtest approach.

>
> Can you check on this scenario?
>
> Thanks
>
> -----Original Message-----
> From: Qemu-devel <qemu-devel-bounces+yajunw=3Dnvidia.com@nongnu.org> On=20
> Behalf Of Alex Benn=E9e
> Sent: Thursday, July 28, 2022 9:55 PM
> To: qemu-devel@nongnu.org
> Cc: mst@redhat.com; Alex Benn=E9e <alex.bennee@linaro.org>
> Subject: [PATCH v2 1/4] hw/virtio: incorporate backend features in=20
> features
>
> External email: Use caution opening links or attachments
>
>
> There are some extra bits used over a vhost-user connection which are hid=
den from the device itself. We need to set them here to ensure we enable th=
ings like the protocol extensions.
>
> Currently net/vhost-user.c has it's own inscrutable way of persisting thi=
s data but it really should live in the core vhost_user code.
>
> Signed-off-by: Alex Benn=E9e <alex.bennee@linaro.org>
> Message-Id: <20220726192150.2435175-7-alex.bennee@linaro.org>
> ---
>  hw/virtio/vhost-user.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c index=20
> 75b8df21a4..1936a44e82 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -1460,7 +1460,14 @@ static int vhost_user_set_features(struct vhost_de=
v *dev,
>       */
>      bool log_enabled =3D features & (0x1ULL << VHOST_F_LOG_ALL);
>
> -    return vhost_user_set_u64(dev, VHOST_USER_SET_FEATURES, features,
> +    /*
> +     * We need to include any extra backend only feature bits that
> +     * might be needed by our device. Currently this includes the
> +     * VHOST_USER_F_PROTOCOL_FEATURES bit for enabling protocol
> +     * features.
> +     */
> +    return vhost_user_set_u64(dev, VHOST_USER_SET_FEATURES,
> +                              features | dev->backend_features,
>                                log_enabled);  }


--
Alex Benn=E9e

