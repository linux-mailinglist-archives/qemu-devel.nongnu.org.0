Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D4A666B03
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 06:53:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFqV6-0003Bd-Mo; Thu, 12 Jan 2023 00:51:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yajunw@nvidia.com>) id 1pFqV2-0003BM-Q4
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 00:51:40 -0500
Received: from mail-co1nam11on20621.outbound.protection.outlook.com
 ([2a01:111:f400:7eab::621]
 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yajunw@nvidia.com>) id 1pFqUz-0003J0-Q9
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 00:51:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dv6j4TYwZeoft2wGSEjC6xA9DFrVuU3WWUTFaJWocIrVIGY2AlPPFlWkc32TjV5WuvHjs4NSitL4AdXsCTeNUQMIHix1F5qg3JJoqZdLX+hmN0SgqAzvS5B/XjEOU7nu1clcxyfsRn3MdXZfF+zVBLgLi/2SjAiVxbmMobAzkYYTxurzg7xPx+lqvZR3/Vnq5nwnRAI4XrnxhryQWVUq44COHHynFsS5hH6PW3FFfL2DqNfoUbiG+STdC2LK9eTAW4Qtp+uhcERaMp2D2jgMC84r9fp8m7yCNVyFdNW/UOWka3/9VN0yw4moLtZIiDOkNpnSy0b7yJXkp3/74twYHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iagfBV2lhpotmWNSPxIE8af1SrjWQ68Y5WLxcI5aRBU=;
 b=EFBgu4zWzcRkZKJLcXyVi0vWr8q+WtsJiEPaISbG4eS9YJu6HSwunQ8p4ZRtwFlB04AtYh3ek2LIolFzlod74Y2zBzLzJloSlKXYIRZ7Dj64WZW1MmFo0fDER7D7gOCDz3rExVuLouv/PsvtcMBCIY7V6z7Gdp8IGsrJLEj5zjAPjhHYU61Odw/bz1xNu3tXYSe9CfHmtybjFVtZS7vjCdYUSjLOYO5eslEyuCpTYDHlZFoxz4IrJ1GRrI7RsIYg0KBorSOyrAirpIfcvjDb+cuKRBdP20lNRKXAjoW3jOfmwVSH2/4Bz7MNOW8lssYi75JmRA2Z1PENJ10fXLwmdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iagfBV2lhpotmWNSPxIE8af1SrjWQ68Y5WLxcI5aRBU=;
 b=LRiVyUbt5tEwN4fkETOHZ2J4zZbJsvWVb9ZBJimgsWtwRXYzMUFop8nVzmrgVwwBic/dNJLrECWEcbiyKOvcNeZnTLXARoMS4pfDLwjL5r04HB0gzOKkVcfGrl3J1aU4DmTTj+e6uIdgA5AcxBKc3opcoN5h2cZhjlkJfzq7SvKg2B24yvYkvzMAKqPKKvZHwZ5Tbp8Kedv7bA/l76Dx+Ws94igEuGSp8msKib2dKL9mHt7htlpl+s+aOK0CXUhFriXh6ycPBTkfIL/PRsWj0/2TMK/I5bxncgQeYuB4RAUKLf8x6LaJmR5q1brGx1vbHuTCi8U+a0uXh4/KcTbUhA==
Received: from BL1PR12MB5157.namprd12.prod.outlook.com (2603:10b6:208:308::15)
 by MN2PR12MB4376.namprd12.prod.outlook.com (2603:10b6:208:26c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 05:46:30 +0000
Received: from BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::acbe:c761:df83:8432]) by BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::acbe:c761:df83:8432%6]) with mapi id 15.20.6002.012; Thu, 12 Jan 2023
 05:46:30 +0000
From: Yajun Wu <yajunw@nvidia.com>
To: Laurent Vivier <lvivier@redhat.com>, Maxime Coquelin
 <maxime.coquelin@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Peter Maydell
 <peter.maydell@linaro.org>, Parav Pandit <parav@nvidia.com>, "Michael S.
 Tsirkin" <mst@redhat.com>
Subject: RE: [PULL v4 76/83] vhost-user: Support vhost_dev_start
Thread-Topic: [PULL v4 76/83] vhost-user: Support vhost_dev_start
Thread-Index: AQHY8vvVFqfqazis5EWXiYQWWAgmoq6Rzm6AgAR9PQCAAxKgAIABTALQ
Date: Thu, 12 Jan 2023 05:46:30 +0000
Message-ID: <BL1PR12MB5157F4B18EB042126EA8C658B6FD9@BL1PR12MB5157.namprd12.prod.outlook.com>
References: <20221107224600.934080-1-mst@redhat.com>
 <20221107224600.934080-77-mst@redhat.com>
 <43145ede-89dc-280e-b953-6a2b436de395@redhat.com>
 <20230109054633-mutt-send-email-mst@kernel.org>
 <c0acea1d-7bae-120e-9422-82b0a5c432cf@redhat.com>
In-Reply-To: <c0acea1d-7bae-120e-9422-82b0a5c432cf@redhat.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5157:EE_|MN2PR12MB4376:EE_
x-ms-office365-filtering-correlation-id: 20511e8d-3361-4893-4797-08daf4605ac9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bh1P2GCZqpAQYUs91/bp29xqqktBMh9iK2yc1exm073E63BWSLwfm0exDmn2WdX77xRlclIgk/yO6S13/zMlrIHl4e/CZbj7dD1nJDmxWJNTUS6iPAxIV502uhMqnrPr0yBiz0NRPW7whDdWalbgdDIqTA2oBcN95n4Vj05b/ygsoWvKy+NI5eq9+bouUl7vraVHMVZ6Y8Z68E/f3iePTBtnBjf/ioY9J33xDDpnRh8OeUNVqflYMAC85EpoGc3IFhj6IL4HURBr+e5I+hBJLqClBuYyVzeeLe5uYjSg0kDLxIWTorXoggmd4j6feShYxrdgcWDvd1+prRjFV64N0X+31W8gVwtL7bM1V2T09wGB5kWq16wl8HQUf+bX9uzauG6wKExkOe1TCT96vkfc7BGKv9hVuhYdRimXbyNDdjX/27G60lDIqnk2CR80uyvme0MELZ4yL1+u/DO/v8Wh2ErGW/nxVPIvw34HCHAbnvNQoMAXW01o3ZUV2HMjI1YUD/Digse/dNVQyDIsrXqCDC1JMupT3bzSfErNsLo60i02hb/4sRKk2skuFoNKCh7lBnk84sW9OlNuwMes2ZhxoxqGHytibbbvnEstfO2Cmiws4fuQYkHKrVMsWHqlNAtPqH4gh8RFjgsPM6hi/qFwYcsgYTbdTGOcWuS6iF423ayIrZ1oGyU8264BazQlu6cNVVrY7RXAib4Ts6mL45hcUQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5157.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(39860400002)(136003)(366004)(376002)(451199015)(6506007)(38100700002)(122000001)(53546011)(2906002)(478600001)(966005)(33656002)(316002)(26005)(186003)(5660300002)(7696005)(71200400001)(9686003)(86362001)(8936002)(83380400001)(38070700005)(52536014)(55016003)(41300700001)(45080400002)(64756008)(110136005)(8676002)(76116006)(66946007)(66556008)(66476007)(66446008)(54906003)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cNj5lL2fXMy68m6WQbELMgmsPuenPt3hkYBaHi5vnkHMpgIQkwDVacXIu0c3?=
 =?us-ascii?Q?YqBdnsw0E8qi/pi9nuNsFd/H0pop3fszh5urultKZHyuKVKprUshXGUByWdq?=
 =?us-ascii?Q?GEtBVXL3pHTbeuUZuF6TG4bi6cbO6PHwIHC2GdOU3ix8UYx9jL5/Xa48FSdm?=
 =?us-ascii?Q?9G6T5rXehVtqIAbNUSwb0eC3WvCRpEmrvLg6OtrH8wCUL1ulWaaufFmUZEY2?=
 =?us-ascii?Q?/GwEfTpPdcfTxjod74rik8caqMZ48ta0TVOu/PWmj29PytY4YJpKK9RPaQAk?=
 =?us-ascii?Q?hNCetUYKzcykEBKnjZnKXgv5d7TKKgfB1oBp+fkjNcUH2T7APCTg+8IzBH9t?=
 =?us-ascii?Q?vOOBBarPME10wGSb+BLNP1KTHeZak84u/c32Rl5AdKlUN5kKNQnajSa5qJSr?=
 =?us-ascii?Q?TYuahbG/LkX7vkDOagEdIPnCzDYWzgLGXeP0U4iW5sJwJssheWXg0Os6DcO2?=
 =?us-ascii?Q?AWQGsutth/5cUrU+w8/WR/kpSt/oWFf424mMxDAvZDmNlRwisLsAXZUmEX1K?=
 =?us-ascii?Q?fkbdUsDwF0Ay/smn/kBGAM2LRoV1OYD9eIB6PRNOtRlWe1+CW6Sh82mHobti?=
 =?us-ascii?Q?XkysvGPtgGSC5kV+F9FGwTzCFC8FbGL/Mq2lujoI04CrIS6/mjhHk9IjknEJ?=
 =?us-ascii?Q?GR4iXVzJLcTSKfh8OpKt9AMCkuFhK+kOOPaYq4kOsqXw/CQlFXkEBN7JmwFO?=
 =?us-ascii?Q?SQb65k7dx5Hn0YgyDhifVKADqCp8TTUIpGQqOSUp4jAxU0yqfuCfN4uko79D?=
 =?us-ascii?Q?I2j1Z2KTPOWhYpX/DsQOkSWKN38UBGsjGCAx5x/toNVTaIVHFOkJ6RaPrDhH?=
 =?us-ascii?Q?0tME00kvVbht0mXpxU5UIobpLuKyqVtHI4CxB65gb+o6lFjtkxZmerfcc177?=
 =?us-ascii?Q?xWzS9sZz2zr/mmoAt+ZFo3EOBWiKvK2NXFwzfW7ft8KZuFCgT8NhUUQtdH5t?=
 =?us-ascii?Q?0nugbkFOXBZrUtTVHUzsvJUyU6cHNIDcD/y3SlRVEypIlBl0SZLevpLeapLf?=
 =?us-ascii?Q?3WsjRcgj/mPilKDQKw2h4w00P6Ngva4T269h8xmZfFjuBkiWPzACBB9/IsJN?=
 =?us-ascii?Q?55E/m2PW05JdpFqYJyHZ1zzdWjVaq/DSi7FTNG5tybrUZS90iAF8G2kdxZoK?=
 =?us-ascii?Q?wiQl59KFY1SLa80MJjozwFTFWoM6ejiBgonFuZQACQlFrKpnb6Ho8M/IJyZU?=
 =?us-ascii?Q?1M4/f6OcoaIcbrYrRvgBnhT8sxyk+wqNjpcCKzma1IlZdsqT49ukUyw+X/bo?=
 =?us-ascii?Q?wdYuRET5Xuix83NsmEaozx9MSTeuYm5bI+6cbWqlRM+0L/csZSCsN0lOtElX?=
 =?us-ascii?Q?2mnb7meH+Aw3Y4+Dm87nUvbD7yaJaRdPRZPnHFLZwNANnwGYWb+sWa9k7AeW?=
 =?us-ascii?Q?Ytqef8hIrLzOtKv7uSUMvlw/EoEE626c/2M4QFldUME/nRI0RrkAwfY8zJ70?=
 =?us-ascii?Q?y0vqoeobrCbC8iQ0neGn1jWBenMndKSUmAzMoIgAJmxsEG30xWd4EBq59GNa?=
 =?us-ascii?Q?jhaoK1Fbv1qbnBp/x16V5PrWFkw4iNYT0izqN4otkudQzleqqs+Shz2W7gRP?=
 =?us-ascii?Q?Lqx/gdIdLSC8S+nuXZM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5157.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20511e8d-3361-4893-4797-08daf4605ac9
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2023 05:46:30.2900 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: suoW+HBZLMWfitGb3oymyetNlOkpIg69GN8AxSvwSweFX4WDIfgqMW+sAcNJVzLrQ24q63A88HkQt3DXUtpHPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4376
Received-SPF: softfail client-ip=2a01:111:f400:7eab::621;
 envelope-from=yajunw@nvidia.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
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

Hi,

VHOST_USER_PROTOCOL_F_STATUS is enabled by default (dpdk):

lib/vhost/vhost_user.h

17 #define VHOST_USER_PROTOCOL_FEATURES    ((1ULL << VHOST_USER_PROTOCOL_F_=
MQ) | \
 18                      (1ULL << VHOST_USER_PROTOCOL_F_LOG_SHMFD) |\
 19                      (1ULL << VHOST_USER_PROTOCOL_F_RARP) | \
 20                      (1ULL << VHOST_USER_PROTOCOL_F_REPLY_ACK) | \
 21                      (1ULL << VHOST_USER_PROTOCOL_F_NET_MTU) | \
 22                      (1ULL << VHOST_USER_PROTOCOL_F_SLAVE_REQ) | \
 23                      (1ULL << VHOST_USER_PROTOCOL_F_CRYPTO_SESSION) | \
 24                      (1ULL << VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD) | \
 25                      (1ULL << VHOST_USER_PROTOCOL_F_HOST_NOTIFIER) | \
 26                      (1ULL << VHOST_USER_PROTOCOL_F_PAGEFAULT) | \
 27                      (1ULL << VHOST_USER_PROTOCOL_F_STATUS))

Remove VHOST_USER_PROTOCOL_F_STATUS can disable VHOST_USER_SET/GET_STATUS m=
essage.
Should W.A. this issue.

Thanks,
Yajun

-----Original Message-----
From: Laurent Vivier <lvivier@redhat.com>=20
Sent: Wednesday, January 11, 2023 5:50 PM
To: Maxime Coquelin <maxime.coquelin@redhat.com>
Cc: qemu-devel@nongnu.org; Peter Maydell <peter.maydell@linaro.org>; Yajun =
Wu <yajunw@nvidia.com>; Parav Pandit <parav@nvidia.com>; Michael S. Tsirkin=
 <mst@redhat.com>
Subject: Re: [PULL v4 76/83] vhost-user: Support vhost_dev_start

External email: Use caution opening links or attachments


On 1/9/23 11:55, Michael S. Tsirkin wrote:
> On Fri, Jan 06, 2023 at 03:21:43PM +0100, Laurent Vivier wrote:
>> Hi,
>>
>> it seems this patch breaks vhost-user with DPDK.
>>
>> See=20
>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbug
>> zilla.redhat.com%2Fshow_bug.cgi%3Fid%3D2155173&data=3D05%7C01%7Cyajunw%
>> 40nvidia.com%7Cf4c581251ab548d64ae708daf3b94867%7C43083d15727340c1b7d
>> b39efd9ccc17a%7C0%7C0%7C638090274351645141%7CUnknown%7CTWFpbGZsb3d8ey
>> JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C30
>> 00%7C%7C%7C&sdata=3Dm582YO4Sd2jJ0S%2F%2FSv9zx6NSuXQIrRwkqBPgYedO%2Fr8%3
>> D&reserved=3D0
>>
>> it seems QEMU doesn't receive the expected commands sequence:
>>
>> Received unexpected msg type. Expected 22 received 40 Fail to update=20
>> device iotlb Received unexpected msg type. Expected 40 received 22=20
>> Received unexpected msg type. Expected 22 received 11 Fail to update=20
>> device iotlb Received unexpected msg type. Expected 11 received 22=20
>> vhost VQ 1 ring restore failed: -71: Protocol error (71) Received=20
>> unexpected msg type. Expected 22 received 11 Fail to update device=20
>> iotlb Received unexpected msg type. Expected 11 received 22 vhost VQ=20
>> 0 ring restore failed: -71: Protocol error (71) unable to start vhost=20
>> net: 71: falling back on userspace virtio
>>
>> It receives VHOST_USER_GET_STATUS (40) when it expects=20
>> VHOST_USER_IOTLB_MSG (22) and VHOST_USER_IOTLB_MSG when it expects VHOST=
_USER_GET_STATUS.
>> and VHOST_USER_GET_VRING_BASE (11) when it expect VHOST_USER_GET_STATUS =
and so on.
>>
>> Any idea?
>>
>> Thanks,
>> Laurent
>
>
> So I am guessing it's coming from:
>
>      if (msg.hdr.request !=3D request) {
>          error_report("Received unexpected msg type. Expected %d received=
 %d",
>                       request, msg.hdr.request);
>          return -EPROTO;
>      }
>
> in process_message_reply and/or in vhost_user_get_u64.
>
>
>> On 11/7/22 23:53, Michael S. Tsirkin wrote:
>>> From: Yajun Wu <yajunw@nvidia.com>
>>>
>>> The motivation of adding vhost-user vhost_dev_start support is to=20
>>> improve backend configuration speed and reduce live migration VM=20
>>> downtime.
>>>
>>> Today VQ configuration is issued one by one. For virtio net with=20
>>> multi-queue support, backend needs to update RSS (Receive side
>>> scaling) on every rx queue enable. Updating RSS is time-consuming=20
>>> (typical time like 7ms).
>>>
>>> Implement already defined vhost status and message in the vhost=20
>>> specification [1].
>>> (a) VHOST_USER_PROTOCOL_F_STATUS
>>> (b) VHOST_USER_SET_STATUS
>>> (c) VHOST_USER_GET_STATUS
>>>
>>> Send message VHOST_USER_SET_STATUS with VIRTIO_CONFIG_S_DRIVER_OK=20
>>> for device start and reset(0) for device stop.
>>>
>>> On reception of the DRIVER_OK message, backend can apply the needed=20
>>> setting only once (instead of incremental) and also utilize=20
>>> parallelism on enabling queues.
>>>
>>> This improves QEMU's live migration downtime with vhost user backend=20
>>> implementation by great margin, specially for the large number of=20
>>> VQs of 64 from 800 msec to 250 msec.
>>>
>>> [1]=20
>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fqe
>>> mu-project.gitlab.io%2Fqemu%2Finterop%2Fvhost-user.html&data=3D05%7C01
>>> %7Cyajunw%40nvidia.com%7Cf4c581251ab548d64ae708daf3b94867%7C43083d15
>>> 727340c1b7db39efd9ccc17a%7C0%7C0%7C638090274351645141%7CUnknown%7CTW
>>> FpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC
>>> I6Mn0%3D%7C3000%7C%7C%7C&sdata=3DeEmHPgZlmImC5LTDZ2jTJauNW7cRFDhsme8%2
>>> Fjk7ywIE%3D&reserved=3D0
>>>
>>> Signed-off-by: Yajun Wu <yajunw@nvidia.com>
>>> Acked-by: Parav Pandit <parav@nvidia.com>
>>> Message-Id: <20221017064452.1226514-3-yajunw@nvidia.com>
>>> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>>> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>
> Probably easiest to debug from dpdk side.
> Does the problem go away if you disable the feature VHOST_USER_PROTOCOL_F=
_STATUS in dpdk?

Maxime could you help to debug this?

Thanks,
Laurent


