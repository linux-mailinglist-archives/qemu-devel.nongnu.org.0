Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1618E66B80D
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 08:20:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHJml-0004Y4-IL; Mon, 16 Jan 2023 02:20:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yajunw@nvidia.com>) id 1pHJmU-0004XT-65
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 02:19:46 -0500
Received: from mail-bn8nam12on20609.outbound.protection.outlook.com
 ([2a01:111:f400:fe5b::609]
 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yajunw@nvidia.com>) id 1pHJmP-00046I-Di
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 02:19:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pb2WPVwHEXgK/DhNkRV0YL72dzJGI5zOBoKEddONmfqu34na3GomSmYi9Fejp3cY/TqHvRlbAsRlbF5PcRtAUlp2zy0CjxNG401j5uOtH14WRYKNzIRl5LzcmXZpRfKM++PVHEqXsMFKcqEDcxGAzvs7Y0bnldB5pNCsI/oR78BnJekWiuulJ0KOsGgBm7zLowZDzUCNlQN/TLnwC9fngG3ZyfpAHLIQwpgUa0qTSmRkimG1jEwWgsenG4nb6BzyL8Q1u0cE15KZ0vcLtbpHi3Mks5JqJjt+BWwxBkfekBMLJnIxQHYUyiG9adz3FOkD+Aqug+KrVjyRnzfL2qNHAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o5VnDlcOmwWO4fSIKkUATnhsJMNqnZeA0kdZquPNBms=;
 b=dqpJ4xmkRje+/LyX0r64rjA6JNQYpk1SVj/Y6Oih7SS2YFbfBzsFNJM7CXphptoj67z2QV2jzWnTQAulYA0R+t0c/tmohasgpsRU/SnTUey7N+gaJpuBtzTHX/GXcYTqz/wVQ8rIXrv9vnkcFqTlUp69d9y7yUVhLxML5wNc8feWxUBkvCZ3Vja8jhcJSu6oNIVpcz9Jlg3e+xuc5kgrUW4sBGmdbase3bHzvSBOGNml0fhcz0ZGhv7SwPp92vM798XhUDEYxKYu7ovVA1sCRHj+pnn5ztwDMUFhvuZS+T6S7w99+IQ9/pIn/S6zXp86gmd98ny8NCYmtiJeAhwR9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o5VnDlcOmwWO4fSIKkUATnhsJMNqnZeA0kdZquPNBms=;
 b=JCnatZINrMU90ZwmUuG5oxUs2H4cqeKBMofvSFRFzAH/Xv9GvdSTnED6jjbKEz8hYP5K468zZvChJV3imua2do8pdkbgS+ZU02DjQCyKcTr7t6iPWLy3FcNtiWYOyXD9OC4HI9DM467XIgb4MUaUlusfpxeiPeQ84vAhiA8wg1wmyFDOBpKMHjt5qly6MLrmiI6gwO83gYtGjtyRgB422XUJ5l2OSVkytZH7oOlRMJdwR9tWTCf4aEgQ7vA3ZiUUir7Yel+hyVLEAwc0AIwexN4dOe51O0lCULft8MQLGyqEJM+cnj/CI4e2DDGB4fvfL8XbXqfzZFqcPVFklTLDGA==
Received: from DM4PR12MB5168.namprd12.prod.outlook.com (2603:10b6:5:397::8) by
 IA1PR12MB6556.namprd12.prod.outlook.com (2603:10b6:208:3a0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.22; Mon, 16 Jan
 2023 07:14:37 +0000
Received: from DM4PR12MB5168.namprd12.prod.outlook.com
 ([fe80::71a0:a25e:9b1f:e55a]) by DM4PR12MB5168.namprd12.prod.outlook.com
 ([fe80::71a0:a25e:9b1f:e55a%4]) with mapi id 15.20.5986.023; Mon, 16 Jan 2023
 07:14:36 +0000
From: Yajun Wu <yajunw@nvidia.com>
To: Maxime Coquelin <maxime.coquelin@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Peter Maydell
 <peter.maydell@linaro.org>, Parav Pandit <parav@nvidia.com>, "Michael S.
 Tsirkin" <mst@redhat.com>
Subject: RE: [PULL v4 76/83] vhost-user: Support vhost_dev_start
Thread-Topic: [PULL v4 76/83] vhost-user: Support vhost_dev_start
Thread-Index: AQHY8vvVFqfqazis5EWXiYQWWAgmoq6Rzm6AgAR9PQCAAxKgAIABi3SAgAYeshA=
Date: Mon, 16 Jan 2023 07:14:36 +0000
Message-ID: <DM4PR12MB51687AF2EAEC37929A7D3C4AB6C19@DM4PR12MB5168.namprd12.prod.outlook.com>
References: <20221107224600.934080-1-mst@redhat.com>
 <20221107224600.934080-77-mst@redhat.com>
 <43145ede-89dc-280e-b953-6a2b436de395@redhat.com>
 <20230109054633-mutt-send-email-mst@kernel.org>
 <c0acea1d-7bae-120e-9422-82b0a5c432cf@redhat.com>
 <31f87c1d-9cce-6507-8e90-4d7942d7dc54@redhat.com>
In-Reply-To: <31f87c1d-9cce-6507-8e90-4d7942d7dc54@redhat.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5168:EE_|IA1PR12MB6556:EE_
x-ms-office365-filtering-correlation-id: 27914580-5d60-494b-8fbb-08daf791536a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Fs+20drJfViYyx7g7+EesZajPHrHUoYlJGWm9gZs6tcCJ6QhceUvQGScMgibkLknPPH8/nkd4gB0VNWnTROc3YQnUk2pHPvus1OlKUgzY7MZyc9qpg73xFeY0+qkXo9YPrIr0aTVMnbOJwUwIigslGe5Oypv0Q6mZhIvp+iwhwxQwNBYK5e0N+uArj2N2y31YEi5WoaN5kpXcrWhtmjwOn7eT8eLHLwlLqMfBoKke0nxDXlsK3Riyta76765lQkHzRtTRQ7KrBKlZbBzHCmSuL6NgRsNlE9R57HZW97dsL7GhXh5cxhX5WoSZ2zKEu3XApnhc+z+AsWS7zA1mPLFzC0dq+Piqi/mgiNcRPCPHQ+8BjudsHZB/RnIKmoEmccGqikYT21dIXfO7MBIWwrI+9AOGflFZPH2esKT7T2jeU+hOXqIx/khOSBEPTLqNIHdywDeGS6M4v5XUxnKGs2z22IElyGz/yzdHcaR359HLQdtGE1Rtjdtzl/2biqpJtWAuh7aIDq2jFNeUkXDA/yuQam+BLUEWXlpr+Bb1Nbn6tdM/RhqPsa61NVst9m9Mcs5gZZ5xpQAaHJybc+C0/iHtF8xd+QY6UTrRhsihVXSU62UjK4dwtY1rXYkMUBMO1BHpTFQ4sE0JAyEWzjH/neUw2Z6czZKFsWHYtp7tjmFjn5ML4x1VP3Kw70hScHGMPagQtf40/XM43Z6hQUmZ0llBw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5168.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(376002)(136003)(366004)(396003)(346002)(451199015)(2906002)(30864003)(52536014)(5660300002)(8936002)(45080400002)(86362001)(76116006)(66476007)(66946007)(66556008)(83380400001)(66446008)(8676002)(64756008)(33656002)(71200400001)(110136005)(316002)(54906003)(41300700001)(4326008)(7696005)(966005)(186003)(26005)(53546011)(9686003)(6506007)(38100700002)(38070700005)(478600001)(55016003)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Iy3oOWqi1q7nqFB1dd63friQczLjuVR/XjIbD97Jz/Fnx7TFh+8hqTJgJLMY?=
 =?us-ascii?Q?v2y3FiAVFrTP1FlfFkUhW0qfcZHtM6IVaKgDlFZkPL+B/RKzqz1/srWF/zD2?=
 =?us-ascii?Q?yYiFww+XWXBIOY2QvLJv4XnLhfEx4vqppns0BPqX5Vo4fS7RHaWNdnCDJLfN?=
 =?us-ascii?Q?qs+BLIi4vB5/z+5dKtBS+LSgK0Vc2pNNbDsLP5Qf0UGWHisXh4+6Oetn6kzN?=
 =?us-ascii?Q?14Tp200BKiqZFzk08T4d9B8x6Rz92tg39MS5nY1mrI9WSKPFDTGZngKb5W0T?=
 =?us-ascii?Q?740B0CWYnqwibzVtKV8xeX8ayO+GwVyxJocsZ2EIHBP/DxU0oLc/SmX3jRQJ?=
 =?us-ascii?Q?GfD6Z3aR23BonIgBn+Xgz8YZGFTGbE86q6UTD9YGDSyiKehYJ68JjIs4sX9W?=
 =?us-ascii?Q?wD01Uzgc/rLO/4WRJLE3gJfzjKDrwqELxV4+UaJAefXYzOcRcxTcbwrm/OQc?=
 =?us-ascii?Q?J9TtpuzTVRxtGy31gssq86M6OAkvbmfnYR6L6dbdp9Ttfh4/GFa5/mOii+2s?=
 =?us-ascii?Q?gr1Uvdg3AclBqWzlL8TzVgfdacz3XYQuP5BRO3K8KoOgkNlnYOgl/GaSiytv?=
 =?us-ascii?Q?hjdxr3gbkRBbayyzQJmQXFUdDwzplH7/9QuU5m5TfjL9LruDkpxrbf5ykQnW?=
 =?us-ascii?Q?7StzCYM5H51N3xJvlBP2zpKvuH3hM8XBu8M7AxnNiwmGQj7F24ENxIFpVtPG?=
 =?us-ascii?Q?dpjUT+QyJlXXy/XF7KMalRvRRf+EdJR4UzIMtRRlVZoaxLmpBTvM27K9wLVl?=
 =?us-ascii?Q?E9lpwnM3y18ugJ+eMLYjakg39JpMrj7F6bRHbw4rWdtWBdHZbMdh91ke/uz0?=
 =?us-ascii?Q?iXxaa5F68d+IfzIwEzc4FkLZM6LQpL70E9yV6dhIjqwbt1wFtNHsDR1zVQZI?=
 =?us-ascii?Q?0XznjiP+l509/YecxDTfFyjCoTi33wFpeGdGYBXKRp/4/k+aE8CzhX6hV74X?=
 =?us-ascii?Q?RsbLOzgpjFYnFWBn0D8MSyVj3m+xZoaR1/mLZPArIBJdC2teQGxaWwyvglEm?=
 =?us-ascii?Q?l5TT8bNU1hhTUwQ8DbtHpKd1QFLXaLBAA88qA7DJCU8zU+Fd9HP0OFMCdJD3?=
 =?us-ascii?Q?eC2DmNy+HRo4iQ/WJRHjPw85F9w225PNwtB3FAidfaww60oAged/FeQ79Bhc?=
 =?us-ascii?Q?laAuYH1Ya3GK26Y33x1ltjVbEAJNpPDd6xWLEToSYlvaEUkaDQgB9f4v2YDr?=
 =?us-ascii?Q?XHeoU0otALtlagpZHLORcJ5zwauz3V4gmWl/1Rk8YoqawB4E/v3yoxtIfnuq?=
 =?us-ascii?Q?xeJjwaMOAGM31lo+nQZRHZyhaybEzwNaehwjjvH4fIC5hZKJwYxzNz9TgRXy?=
 =?us-ascii?Q?iRF9HBn8x83+GuU/U1QLVzF7xyfV+joUUKd9HJC8sAlw05xYd0KvY86wJozS?=
 =?us-ascii?Q?dEGvVZfIDKIMvOUknpEBeaz8mFMdJ5clXtbkLrIE8uTVBBsULeWYS1O03ou4?=
 =?us-ascii?Q?GTuXTs8IB7DM0ctDsjwGm5Cl6iHsSkCsrEwZNjdlw5KQt+4qXWC2LiKD794c?=
 =?us-ascii?Q?fFEtR06x5ptYFaFKc7mfvy2pRXwO8OhWeXDYDjfheIbNzKiGEIfuS2YKzzpR?=
 =?us-ascii?Q?J6FQb7d+Nya+s9wJmUlxsH2Tvy4EqBmKthrAALqk?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5168.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27914580-5d60-494b-8fbb-08daf791536a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2023 07:14:36.7688 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6Hag+q6pkNIOp23uMdwEVkDidWDA5K5Mr8hNAQNKe5OUKjWDt7sV0hQyNBxnVnJa6LVOWwvdpkWf1dPzsNCiDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6556
Received-SPF: softfail client-ip=2a01:111:f400:fe5b::609;
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

Not quite sure about the whole picture.

Seems while qemu waiting response of vhost_user_get_status, dpdk send out V=
HOST_USER_SLAVE_IOTLB_MSG and trigger qemu function vhost_backend_update_de=
vice_iotlb.
Qemu wait on reply of VHOST_USER_IOTLB_MSG but get VHOST_USER_GET_STATUS re=
ply.

Break on first error message("Received unexpected msg type. Expected 22 rec=
eived 40")

#0  0x0000555555b72ed4 in process_message_reply (dev=3D0x5555584dd600, msg=
=3D0x7fffffffa330) at ../hw/virtio/vhost-user.c:445
#1  0x0000555555b77c26 in vhost_user_send_device_iotlb_msg (dev=3D0x5555584=
dd600, imsg=3D0x7fffffffa600) at ../hw/virtio/vhost-user.c:2341
#2  0x0000555555b7179e in vhost_backend_update_device_iotlb (dev=3D0x555558=
4dd600, iova=3D10442706944, uaddr=3D140736119902208, len=3D4096, perm=3DIOM=
MU_RW) at ../hw/virtio/vhost-backend.c:361
#3  0x0000555555b6e34c in vhost_device_iotlb_miss (dev=3D0x5555584dd600, io=
va=3D10442706944, write=3D1) at ../hw/virtio/vhost.c:1113
#4  0x0000555555b718d9 in vhost_backend_handle_iotlb_msg (dev=3D0x5555584dd=
600, imsg=3D0x7fffffffa7b0) at ../hw/virtio/vhost-backend.c:393
#5  0x0000555555b76144 in slave_read (ioc=3D0x555557a38680, condition=3DG_I=
O_IN, opaque=3D0x5555584dd600) at ../hw/virtio/vhost-user.c:1726
#6  0x0000555555c797a5 in qio_channel_fd_source_dispatch (source=3D0x555556=
a06fb0, callback=3D0x555555b75f86 <slave_read>, user_data=3D0x5555584dd600)=
 at ../io/channel-watch.c:84
#7  0x00007ffff554895d in g_main_context_dispatch () at /lib64/libglib-2.0.=
so.0
#8  0x00007ffff5548d18 in g_main_context_iterate.isra () at /lib64/libglib-=
2.0.so.0
#9  0x00007ffff5549042 in g_main_loop_run () at /lib64/libglib-2.0.so.0
#10 0x0000555555b72de7 in vhost_user_read (dev=3D0x5555584dd600, msg=3D0x7f=
ffffffac50) at ../hw/virtio/vhost-user.c:413
#11 0x0000555555b72e9b in process_message_reply (dev=3D0x5555584dd600, msg=
=3D0x7fffffffaf10) at ../hw/virtio/vhost-user.c:439
#12 0x0000555555b77c26 in vhost_user_send_device_iotlb_msg (dev=3D0x5555584=
dd600, imsg=3D0x7fffffffb1e0) at ../hw/virtio/vhost-user.c:2341
#13 0x0000555555b7179e in vhost_backend_update_device_iotlb (dev=3D0x555558=
4dd600, iova=3D10468392960, uaddr=3D140736145588224, len=3D4096, perm=3DIOM=
MU_RW) at ../hw/virtio/vhost-backend.c:361
#14 0x0000555555b6e34c in vhost_device_iotlb_miss (dev=3D0x5555584dd600, io=
va=3D10468392960, write=3D1) at ../hw/virtio/vhost.c:1113
#15 0x0000555555b718d9 in vhost_backend_handle_iotlb_msg (dev=3D0x5555584dd=
600, imsg=3D0x7fffffffb390) at ../hw/virtio/vhost-backend.c:393
#16 0x0000555555b76144 in slave_read (ioc=3D0x555557a38680, condition=3DG_I=
O_IN, opaque=3D0x5555584dd600) at ../hw/virtio/vhost-user.c:1726
#17 0x0000555555c797a5 in qio_channel_fd_source_dispatch (source=3D0x555556=
c70250, callback=3D0x555555b75f86 <slave_read>, user_data=3D0x5555584dd600)=
 at ../io/channel-watch.c:84
#18 0x00007ffff554895d in g_main_context_dispatch () at /lib64/libglib-2.0.=
so.0
#19 0x00007ffff5548d18 in g_main_context_iterate.isra () at /lib64/libglib-=
2.0.so.0
#20 0x00007ffff5549042 in g_main_loop_run () at /lib64/libglib-2.0.so.0
#21 0x0000555555b72de7 in vhost_user_read (dev=3D0x5555584dd600, msg=3D0x7f=
ffffffb830) at ../hw/virtio/vhost-user.c:413
#22 0x0000555555b72e9b in process_message_reply (dev=3D0x5555584dd600, msg=
=3D0x7fffffffbaf0) at ../hw/virtio/vhost-user.c:439
#23 0x0000555555b77c26 in vhost_user_send_device_iotlb_msg (dev=3D0x5555584=
dd600, imsg=3D0x7fffffffbdc0) at ../hw/virtio/vhost-user.c:2341
#24 0x0000555555b7179e in vhost_backend_update_device_iotlb (dev=3D0x555558=
4dd600, iova=3D10442702848, uaddr=3D140736119898112, len=3D4096, perm=3DIOM=
MU_RW) at ../hw/virtio/vhost-backend.c:361
#25 0x0000555555b6e34c in vhost_device_iotlb_miss (dev=3D0x5555584dd600, io=
va=3D10442702848, write=3D1) at ../hw/virtio/vhost.c:1113
#26 0x0000555555b718d9 in vhost_backend_handle_iotlb_msg (dev=3D0x5555584dd=
600, imsg=3D0x7fffffffbf70) at ../hw/virtio/vhost-backend.c:393
#27 0x0000555555b76144 in slave_read (ioc=3D0x555557a38680, condition=3DG_I=
O_IN, opaque=3D0x5555584dd600) at ../hw/virtio/vhost-user.c:1726
#28 0x0000555555c797a5 in qio_channel_fd_source_dispatch (source=3D0x555556=
f1a530, callback=3D0x555555b75f86 <slave_read>, user_data=3D0x5555584dd600)=
 at ../io/channel-watch.c:84
#29 0x00007ffff554895d in g_main_context_dispatch () at /lib64/libglib-2.0.=
so.0
#30 0x00007ffff5548d18 in g_main_context_iterate.isra () at /lib64/libglib-=
2.0.so.0
#31 0x00007ffff5549042 in g_main_loop_run () at /lib64/libglib-2.0.so.0
#32 0x0000555555b72de7 in vhost_user_read (dev=3D0x5555584dd600, msg=3D0x7f=
ffffffc420) at ../hw/virtio/vhost-user.c:413
#33 0x0000555555b754b1 in vhost_user_get_u64 (dev=3D0x5555584dd600, request=
=3D40, u64=3D0x7fffffffc6e0) at ../hw/virtio/vhost-user.c:1349
#34 0x0000555555b758ff in vhost_user_get_status (dev=3D0x5555584dd600, stat=
us=3D0x7fffffffc713 "W\020") at ../hw/virtio/vhost-user.c:1474
#35 0x0000555555b75967 in vhost_user_add_status (dev=3D0x5555584dd600, stat=
us=3D7 '\a') at ../hw/virtio/vhost-user.c:1488
#36 0x0000555555b78bf6 in vhost_user_dev_start (dev=3D0x5555584dd600, start=
ed=3Dtrue) at ../hw/virtio/vhost-user.c:2758
#37 0x0000555555b709ad in vhost_dev_start (hdev=3D0x5555584dd600, vdev=3D0x=
555557b965d0, vrings=3Dfalse) at ../hw/virtio/vhost.c:1988
#38 0x000055555584291c in vhost_net_start_one (net=3D0x5555584dd600, dev=3D=
0x555557b965d0) at ../hw/net/vhost_net.c:271
#39 0x0000555555842f1e in vhost_net_start (dev=3D0x555557b965d0, ncs=3D0x55=
5557bc09e0, data_queue_pairs=3D1, cvq=3D0) at ../hw/net/vhost_net.c:412
#40 0x0000555555b1bf61 in virtio_net_vhost_status (n=3D0x555557b965d0, stat=
us=3D15 '\017') at ../hw/net/virtio-net.c:311
#41 0x0000555555b1c20c in virtio_net_set_status (vdev=3D0x555557b965d0, sta=
tus=3D15 '\017') at ../hw/net/virtio-net.c:392
#42 0x0000555555b1ed04 in virtio_net_handle_mq (n=3D0x555557b965d0, cmd=3D0=
 '\000', iov=3D0x555556c7ef50, iov_cnt=3D1) at ../hw/net/virtio-net.c:1497
#43 0x0000555555b1eef0 in virtio_net_handle_ctrl_iov (vdev=3D0x555557b965d0=
, in_sg=3D0x555556a09880, in_num=3D1, out_sg=3D0x555556a09890, out_num=3D1)=
 at ../hw/net/virtio-net.c:1534
#44 0x0000555555b1efe9 in virtio_net_handle_ctrl (vdev=3D0x555557b965d0, vq=
=3D0x7fffc04ac140) at ../hw/net/virtio-net.c:1557
#45 0x0000555555b63776 in virtio_queue_notify_vq (vq=3D0x7fffc04ac140) at .=
./hw/virtio/virtio.c:2249
#46 0x0000555555b669dc in virtio_queue_host_notifier_read (n=3D0x7fffc04ac1=
b4) at ../hw/virtio/virtio.c:3529
#47 0x0000555555e3f458 in aio_dispatch_handler (ctx=3D0x555556a016c0, node=
=3D0x7ffd8800e430) at ../util/aio-posix.c:369
#48 0x0000555555e3f613 in aio_dispatch_handlers (ctx=3D0x555556a016c0) at .=
./util/aio-posix.c:412
#49 0x0000555555e3f669 in aio_dispatch (ctx=3D0x555556a016c0) at ../util/ai=
o-posix.c:422
#50 0x0000555555e585de in aio_ctx_dispatch (source=3D0x555556a016c0, callba=
ck=3D0x0, user_data=3D0x0) at ../util/async.c:321
#51 0x00007ffff554895d in g_main_context_dispatch () at /lib64/libglib-2.0.=
so.0
#52 0x0000555555e5abea in glib_pollfds_poll () at ../util/main-loop.c:295
#53 0x0000555555e5ac64 in os_host_main_loop_wait (timeout=3D0) at ../util/m=
ain-loop.c:318
#54 0x0000555555e5ad69 in main_loop_wait (nonblocking=3D0) at ../util/main-=
loop.c:604
#55 0x00005555559693de in qemu_main_loop () at ../softmmu/runstate.c:731
#56 0x00005555556e7c06 in qemu_default_main () at ../softmmu/main.c:37
#57 0x00005555556e7c3c in main (argc=3D71, argv=3D0x7fffffffcda8) at ../sof=
tmmu/main.c:48



-----Original Message-----
From: Maxime Coquelin <maxime.coquelin@redhat.com>=20
Sent: Thursday, January 12, 2023 5:26 PM
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org; Peter Maydell <peter.maydell@linaro.org>; Yajun =
Wu <yajunw@nvidia.com>; Parav Pandit <parav@nvidia.com>; Michael S. Tsirkin=
 <mst@redhat.com>
Subject: Re: [PULL v4 76/83] vhost-user: Support vhost_dev_start

External email: Use caution opening links or attachments


Hi Laurent,

On 1/11/23 10:50, Laurent Vivier wrote:
> On 1/9/23 11:55, Michael S. Tsirkin wrote:
>> On Fri, Jan 06, 2023 at 03:21:43PM +0100, Laurent Vivier wrote:
>>> Hi,
>>>
>>> it seems this patch breaks vhost-user with DPDK.
>>>
>>> See=20
>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbu
>>> gzilla.redhat.com%2Fshow_bug.cgi%3Fid%3D2155173&data=3D05%7C01%7Cyajun
>>> w%40nvidia.com%7C47e6e0fabd044383fd3308daf47f0253%7C43083d15727340c1
>>> b7db39efd9ccc17a%7C0%7C0%7C638091123577559319%7CUnknown%7CTWFpbGZsb3
>>> d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D
>>> %7C3000%7C%7C%7C&sdata=3D1pjChYTKHVmBoempNitiZHBdrlPIMFjKoD6FeOVSay0%3
>>> D&reserved=3D0
>>>
>>> it seems QEMU doesn't receive the expected commands sequence:
>>>
>>> Received unexpected msg type. Expected 22 received 40 Fail to update=20
>>> device iotlb Received unexpected msg type. Expected 40 received 22=20
>>> Received unexpected msg type. Expected 22 received 11 Fail to update=20
>>> device iotlb Received unexpected msg type. Expected 11 received 22=20
>>> vhost VQ 1 ring restore failed: -71: Protocol error (71) Received=20
>>> unexpected msg type. Expected 22 received 11 Fail to update device=20
>>> iotlb Received unexpected msg type. Expected 11 received 22 vhost VQ=20
>>> 0 ring restore failed: -71: Protocol error (71) unable to start=20
>>> vhost net: 71: falling back on userspace virtio
>>>
>>> It receives VHOST_USER_GET_STATUS (40) when it expects=20
>>> VHOST_USER_IOTLB_MSG (22) and VHOST_USER_IOTLB_MSG when it expects=20
>>> VHOST_USER_GET_STATUS.
>>> and VHOST_USER_GET_VRING_BASE (11) when it expect=20
>>> VHOST_USER_GET_STATUS and so on.
>>>
>>> Any idea?

We only have a single thread on DPDK side to handle Vhost-user requests, it=
 will read a request, handle it and reply to it. Then it reads the next one=
, etc... So I don't think it is possible to mix request replies order on DP=
DK side.

Maybe there are two threads concurrently sending requests on QEMU side?

Regards,
Maxime

>>> Thanks,
>>> Laurent
>>
>>
>> So I am guessing it's coming from:
>>
>>      if (msg.hdr.request !=3D request) {
>>          error_report("Received unexpected msg type. Expected %d=20
>> received %d",
>>                       request, msg.hdr.request);
>>          return -EPROTO;
>>      }
>>
>> in process_message_reply and/or in vhost_user_get_u64.
>>
>>
>>> On 11/7/22 23:53, Michael S. Tsirkin wrote:
>>>> From: Yajun Wu <yajunw@nvidia.com>
>>>>
>>>> The motivation of adding vhost-user vhost_dev_start support is to=20
>>>> improve backend configuration speed and reduce live migration VM=20
>>>> downtime.
>>>>
>>>> Today VQ configuration is issued one by one. For virtio net with=20
>>>> multi-queue support, backend needs to update RSS (Receive side
>>>> scaling) on every rx queue enable. Updating RSS is time-consuming=20
>>>> (typical time like 7ms).
>>>>
>>>> Implement already defined vhost status and message in the vhost=20
>>>> specification [1].
>>>> (a) VHOST_USER_PROTOCOL_F_STATUS
>>>> (b) VHOST_USER_SET_STATUS
>>>> (c) VHOST_USER_GET_STATUS
>>>>
>>>> Send message VHOST_USER_SET_STATUS with VIRTIO_CONFIG_S_DRIVER_OK=20
>>>> for device start and reset(0) for device stop.
>>>>
>>>> On reception of the DRIVER_OK message, backend can apply the needed=20
>>>> setting only once (instead of incremental) and also utilize=20
>>>> parallelism on enabling queues.
>>>>
>>>> This improves QEMU's live migration downtime with vhost user=20
>>>> backend implementation by great margin, specially for the large=20
>>>> number of VQs of 64 from 800 msec to 250 msec.
>>>>
>>>> [1]=20
>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fq
>>>> emu-project.gitlab.io%2Fqemu%2Finterop%2Fvhost-user.html&data=3D05%7C
>>>> 01%7Cyajunw%40nvidia.com%7C47e6e0fabd044383fd3308daf47f0253%7C43083
>>>> d15727340c1b7db39efd9ccc17a%7C0%7C0%7C638091123577559319%7CUnknown%
>>>> 7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiL
>>>> CJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DYPbrFRJA92KLLwADMUDvwBt%2Fme2Ef
>>>> GZuVANOmXH5pic%3D&reserved=3D0
>>>>
>>>> Signed-off-by: Yajun Wu <yajunw@nvidia.com>
>>>> Acked-by: Parav Pandit <parav@nvidia.com>
>>>> Message-Id: <20221017064452.1226514-3-yajunw@nvidia.com>
>>>> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>>>> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>>
>> Probably easiest to debug from dpdk side.
>> Does the problem go away if you disable the feature=20
>> VHOST_USER_PROTOCOL_F_STATUS in dpdk?
>
> Maxime could you help to debug this?
>
> Thanks,
> Laurent
>


