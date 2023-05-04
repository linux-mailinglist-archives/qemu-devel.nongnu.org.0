Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D26FB6F63AA
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 05:47:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puPv6-0002Gh-M9; Wed, 03 May 2023 23:46:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yajunw@nvidia.com>) id 1puPv4-0002GM-EY
 for qemu-devel@nongnu.org; Wed, 03 May 2023 23:46:14 -0400
Received: from mail-bn8nam11on2041.outbound.protection.outlook.com
 ([40.107.236.41] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yajunw@nvidia.com>) id 1puPv2-0005qm-F4
 for qemu-devel@nongnu.org; Wed, 03 May 2023 23:46:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kRQ+9NMLqYB2NbwqEHlIEZkmC8gRk1zICeLc7TZO8ucllcWBHupt6dG6F6fIPZ4dHO7lXPEh1SbmmFcBGWkBLRFhEN0b7z9a8W0xJHokAwzLsGir5vVqDQzCQ3j17rHSyLl5e13HZwJYJkvr1SZXBkEsRuIOdsVF/2nY9rkEmFlPOnNnf4aTtnF2LdKe8hhwnNK+vAPCkyMwaC9WCju6rz6sNil4c/3CRets0ylO6Vfr2jytZkaygMTXkytR1Apf7gYT61jCbcaSPKs7ehaBXX1fyhA/FloGSeoILLUsXmKYpCQbqAg7JEQOcr3APBE5Fr3NOUvXvsQ2Fc9IB3fRlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F0mjtjugJmSvhCdgEWAsWM9JHNgCaCK+eDbn5DfwnlI=;
 b=VNYbFCq2Wqw9gxyEiLsggnOiCSQGLyodaZFCw8Zpz57zZFiS9HeQ8Pi/ykHNX/3sIc7ewnk0fNHXJfAyVIAWN/6XPPeGr7+bmAfHfqLqkUVfHAMf0qH6mf6ukY2i3D7BPGyqUF5V3nU6QjsfUer+4Jgl8IncuO45uj2iI2D16nyfo3aZziwpNEPbT1ZbD1HvHO0B2FjAJ9m5DNJ6Ax1qHVip3xOIqB0c1OA7VctuOz7btePwIEcdPvwzb0ui/2KwVBT+3DngE6IRdhsWjmlczMZsEkzzVjHmbBa0Gwbu2Who8SIC11nvk/dCkUlUwfRMy1VSYzrw0QxB4wV+BM96gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F0mjtjugJmSvhCdgEWAsWM9JHNgCaCK+eDbn5DfwnlI=;
 b=LBLzh8GU8SUolTBgtqcI8VsfS8M7uPF3sUrjjpx5MqYY9YglpvLHoX2UlZhglebxKyj13vn8rph6uPqh4v70dBbcxiMiFV/krv2Tm+NZaRnGCjOu4gUKN9wMKx4kWWZG1k2GaI4Tn68VEedu0uXSXt4Roz0qOBRpmtvcMzqUq2ChpdB6qwx6QewWynXle0OIOQB7muxtXh3JuyNcDd9cg0PuueB29aQoR3nmk7c/ZKr58c/C0U5uySGgqkmcEUlQC/R7ACMS0BjHk6ggdJJU67/04eyHQF+OnMprzQuh9hJpUXbRJ0OoEe2VXbZy/24leMsHh889fnv6yKdNUzZVlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5168.namprd12.prod.outlook.com (2603:10b6:5:397::8) by
 DM4PR12MB5166.namprd12.prod.outlook.com (2603:10b6:5:395::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.26; Thu, 4 May 2023 03:41:08 +0000
Received: from DM4PR12MB5168.namprd12.prod.outlook.com
 ([fe80::5104:21af:93c:9c30]) by DM4PR12MB5168.namprd12.prod.outlook.com
 ([fe80::5104:21af:93c:9c30%7]) with mapi id 15.20.6363.022; Thu, 4 May 2023
 03:41:08 +0000
Message-ID: <7f10872d-5a16-fdcb-472b-87150cda9db6@nvidia.com>
Date: Thu, 4 May 2023 11:40:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2] vhost-user: send SET_STATUS 0 after GET_VRING_BASE
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>
References: <20230501230409.274178-1-stefanha@redhat.com>
Content-Language: en-US
From: Yajun Wu <yajunw@nvidia.com>
In-Reply-To: <20230501230409.274178-1-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KU1PR03CA0047.apcprd03.prod.outlook.com
 (2603:1096:802:19::35) To DM4PR12MB5168.namprd12.prod.outlook.com
 (2603:10b6:5:397::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5168:EE_|DM4PR12MB5166:EE_
X-MS-Office365-Filtering-Correlation-Id: fa9caaa5-ebc2-4b55-3e43-08db4c516543
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dx5QX0XSfDr4Qh4NUNb3B4/L8mFcU1YujfFNcNBOmuz5bBMAMWScGDXMlJMhpgKvlmbPDyqO7lY2ynYP8Lpw8xKn0++3m/mCIeiq4+1iazZnamIgBUN3rxcEjqbapbRWhMlgcDzN/0S4GvBHYswOL27rE6vGAccg8sD1EgNV6mLxYdRzY0+vdaoJPqOrjtopJaYMFT3sLIPweQ59We2LuDr5uFn7DEXmQA2fr6xxP14dBxLyeCYNDFI1Dw+bZjxSBZjuqMbJ7TEmugBzNv7RB/1QYdEHbvNl2/fs1ipqbhNs8rMFgZvfNq7+ZRnyObh6K+f5EkAHK1rlYKB1jbRKLNdGusbFG59Ryu0++II0nw5D7w19K19lGytOwpxa9l2fh7kZ9XRCjrViQ+a7cF/gVmTZhxOrPi5PMh2WkCjZ270wVRDwrIOkOc88qBbNQAKRhqlhYSqpOli7pQgiTr4NpJwByFP6fvHzOSeUicyO32QC90dAquRykKBmocmPkGHMz9QYMjq6+fBWO6lCAEpw26TOy9lEAfIUse2U8sYEesj1N/n5Plf7YenJxImuk2OYalpFaJ3pp4b4uTZsgTHXSSUGtTau3314gWiJ03v5HzSBzJCSfPenX3fJmIzrtWujsuMRwSDX5iaqVYgL67Tlaw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5168.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(136003)(376002)(346002)(366004)(451199021)(6666004)(38100700002)(31696002)(86362001)(54906003)(478600001)(83380400001)(186003)(6506007)(6512007)(26005)(2616005)(36756003)(53546011)(6486002)(66574015)(5660300002)(8676002)(8936002)(41300700001)(2906002)(31686004)(316002)(66476007)(66556008)(4326008)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjB3ZUh6WVhMYlFaSGU2TVB5REZ2QVpMdFE3YjluQXRxWVZGOU5Fem5ERnpR?=
 =?utf-8?B?dUptSnBMcnBrSzN3ZnJxNytFbWlHTFlqQUNvcDdhYkw3dG1VU25LaGJtT3By?=
 =?utf-8?B?N0d0T0FBdU11cHppNUhENHV0RnZOV3NCZE82a3d0ZkhLZG1DakhKT2lGZDNr?=
 =?utf-8?B?MEt1TDMvY2g3TldqaHZFQ1hsSk5TbFRMeUs2a3VTSDExaGlVeVdRSWZWMkFK?=
 =?utf-8?B?NloyTVRKVHZzenp4VnY4UGZQSUwzUnFpVUF4d2dubUFEWUgyTHYwNWhsbGEz?=
 =?utf-8?B?L25zUnBFWHEwdHJRcmdpMjdManlveE13N2RVa1hQZ0dJQ0xzazRmbmpGQWk1?=
 =?utf-8?B?SjRDKzdjdVNBVE9odXFaRXBxZWRCZUV0QnlubFk3YkJKbkZDbWlhc3NsUm92?=
 =?utf-8?B?NTlhY0FSeTdWakFIL00vTVRKWTd6bnRvWmNCYWlyOE55ZXNlYldYZlk1QWN4?=
 =?utf-8?B?VjNzZnY1cWtCOTlSelh4Y3YyM2FoZkdQMk5vUGFMWjN2aHRrbVJkWml2VVFs?=
 =?utf-8?B?VnJkT25oTmhlaWtnTmhDZUFiTlpNQUpUWlpIaEdKcDVncnRhd3RRMTR6VXZI?=
 =?utf-8?B?OWhEbWhQeHNzQ2JiS1JsY3htdTVXVmxRQytTc0lnY3JyOSszdmJLQ1pXa0ti?=
 =?utf-8?B?THJ2Sm16TFlkL096UUM3TW1OQmFmK3QwWVlSazJHMHJSVGV1d0ZMSXRMN044?=
 =?utf-8?B?S3M1MFplTDRXNUtWVmZzSUtLaU5VaW9MczJYNjJHbG52alRWeG1wb29la0dp?=
 =?utf-8?B?aU9oNU13ZlFFRHVCMmx5MnUzMnZpenVNa01Odm5WcW1US3VYVElYcTFteHZF?=
 =?utf-8?B?VWIvczc3MjlCaFVucDdhKzFGVzhTQ3pENjg3ZzUrekd6dXZncmp1OENGeXhy?=
 =?utf-8?B?YU16NEFaWllLY21Gdk1WV3hGUHV5RHVsQlZ4VFFBNXRjK3FKR2pMMWF1YkZY?=
 =?utf-8?B?T256UHcxTHlzbEF5MnR1K3BFekpNVEoyUGVOS1dWWm5SNDVMUWUveCtmYzc0?=
 =?utf-8?B?a2NHTzUvU1VvcFY3YkdxSDFoU2x1MzhFWnZzOEg4QnlCR1p3VHFBMTkyKzdt?=
 =?utf-8?B?MG5kZ0YxVFpOMG1uRkliVFppQkNsSUQydHVYK2dNRDJ2RnUxRGl0QWRDeEdN?=
 =?utf-8?B?WEJNUkwrTXplSlBoMkp5NnVvUXRma0RmSnE0Ym1qM054M0NJVWVzeUpOMDMy?=
 =?utf-8?B?MXVCY2k3UWgzNFVPZ1VzTXBRTjlaYnJHcDEwOVhzbzMxMmJQUjEyL05PVktJ?=
 =?utf-8?B?RVRaMitBdkJ2UDdCcjJWejFPRm5OQ2t2NWl1Z0VLa0pMaGFrNHN0M0ROdFcv?=
 =?utf-8?B?enp3Y1VxcHZUSklQbERkeTVKSHdKT09Hb0pGWTZuV2taWUNqTkxhanBDbVpN?=
 =?utf-8?B?T3FzYUJNQUQvcGNxZk1ZYlhHSWRzSTBidHR5Z2N2a1BGTGcwSW0rQVNxQmNu?=
 =?utf-8?B?d2lEWC9RZzBBeEJhWC9tSC9hanBORmZqV2JYQnErcjkrNUJoVXplMDdGSzhi?=
 =?utf-8?B?MVM4cW0zVUdLWGN4K05lclg4WTdvRFVHenJROTFmTFZjYmkxU3l4cThYUDMr?=
 =?utf-8?B?bVZVUld6aXFRTkRIWHAzdW1qRktYb3FEcDJOS1VIMTZRQmRpVitFSVBVYW9h?=
 =?utf-8?B?TWlqZURxV2RlS1ptZ1g1QW80Y0ZsNmh0ekh3UTEra0xJUGt1bERocFFQYzc3?=
 =?utf-8?B?MVBSNHg1RVBoM1FrMGN0R2pHNEZOV3JFS1R1ZjlJdzEwSlNmM3RmQWQwU3lL?=
 =?utf-8?B?ZU50eGhOWnJtVFFRc0FOdGl0S3FwVGliSllpL1lZRHpsRkNubGJOVDd6ZGlj?=
 =?utf-8?B?aDY1Z0dJSEpTMFh3c2I1ZGZ5OE94a0V4SGU1Z3hjdU14N2doQy9QOVJFWVJG?=
 =?utf-8?B?WGk2UUxhSHJyUVdsNnJUNFRLOENGajhzMEpsM0x0VEZld0pLdW1aMmVjcFAy?=
 =?utf-8?B?L2xva21UK3FQQXpuOGtwVUlmZDlGWTIvZC9Rbnk4WDc0QmkvY0xMVjRYSVV2?=
 =?utf-8?B?WC9VMlArYWduMlJ1RzFjSlVPb1Q1SVBKdjNJZDlyTG1JRXlSMzI1TFM0bTBr?=
 =?utf-8?B?WXZJT0FLWU5VQTduVExzZFRBOU5aYTk4eXdqekRwS1dPWkNLQ1ZhK3JaTmYx?=
 =?utf-8?Q?ivJhka7HhsGHui0I++MN6O7vW?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa9caaa5-ebc2-4b55-3e43-08db4c516543
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5168.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 03:41:08.1358 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pfFiilm/r0eirRt0sidLUZa+Hs1uHs4DyHp47QVXiaeBcv5sAfME2lsQfA/ozouxPs9U8z1islgrUF0CMgNXAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5166
Received-SPF: softfail client-ip=40.107.236.41; envelope-from=yajunw@nvidia.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.28, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 5/2/2023 7:04 AM, Stefan Hajnoczi wrote:
> Setting the VIRTIO Device Status Field to 0 resets the device. The
> device's state is lost, including the vring configuration.
>
> vhost-user.c currently sends SET_STATUS 0 before GET_VRING_BASE. This
> risks confusion about the lifetime of the vhost-user state (e.g. vring
> last_avail_idx) across VIRTIO device reset.
>
> Eugenio Pérez <eperezma@redhat.com> adjusted the order for vhost-vdpa.c
> in commit c3716f260bff ("vdpa: move vhost reset after get vring base")
> and in that commit description suggested doing the same for vhost-user
> in the future.
>
> Go ahead and adjust vhost-user.c now. I ran various online code searches
> to identify vhost-user backends implementing SET_STATUS. It seems only
> DPDK implements SET_STATUS and Yajun Wu <yajunw@nvidia.com> has
> confirmed that it is safe to make this change.
>
> Fixes: commit 923b8921d210763359e96246a58658ac0db6c645 ("vhost-user: Support vhost_dev_start")
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Cindy Lu <lulu@redhat.com>
> Cc: Yajun Wu <yajunw@nvidia.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
> v2:
> - Added VHOST_USER_PROTOCOL_F_STATUS check [Yajun Wu]
> - Added "Fixes:" tag [Michael]
> ---
>   hw/virtio/vhost-user.c | 16 +++++++++++++++-
>   1 file changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index e5285df4ba..40974afd06 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -2677,7 +2677,20 @@ static int vhost_user_dev_start(struct vhost_dev *dev, bool started)
>                                             VIRTIO_CONFIG_S_DRIVER |
>                                             VIRTIO_CONFIG_S_DRIVER_OK);
>       } else {
> -        return vhost_user_set_status(dev, 0);
> +        return 0;
> +    }
> +}
> +
> +static void vhost_user_reset_status(struct vhost_dev *dev)
> +{
> +    /* Set device status only for last queue pair */
> +    if (dev->vq_index + dev->nvqs != dev->vq_index_end) {
> +        return;
> +    }
> +
> +    if (virtio_has_feature(dev->protocol_features,
> +                           VHOST_USER_PROTOCOL_F_STATUS)) {
> +        vhost_user_set_status(dev, 0);
>       }
>   }
>
> @@ -2716,4 +2729,5 @@ const VhostOps user_ops = {
>           .vhost_get_inflight_fd = vhost_user_get_inflight_fd,
>           .vhost_set_inflight_fd = vhost_user_set_inflight_fd,
>           .vhost_dev_start = vhost_user_dev_start,
> +        .vhost_reset_status = vhost_user_reset_status,
>   };
> --
> 2.40.1

Reviewed-by: Yajun Wu <yajunw@nvidia.com>

