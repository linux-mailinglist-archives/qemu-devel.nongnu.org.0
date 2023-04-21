Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4B06EA33D
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 07:37:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppjRN-0006IZ-OR; Fri, 21 Apr 2023 01:36:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yajunw@nvidia.com>) id 1ppjRK-0006Gf-KV
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 01:36:10 -0400
Received: from mail-dm6nam10on2041.outbound.protection.outlook.com
 ([40.107.93.41] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yajunw@nvidia.com>) id 1ppjRE-0003yo-D2
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 01:36:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EuMkqAynkXtrLnwCSdNZXtkY8HG+wCDJjCol6DqxDUvWNACpVJfdDDmCXT44Goy1X36/qbwojG4CdcnvLPuUg2ZzgvTZ2I03P2pDPsaDTVC8Cy9FgjXeLup/CumAUv/vUDdnx53KNBb4FnCFeVB/699DxF3fvRaC0lzwHCj2s0f+kOTCJq9tHjV1FHBLm95V2bA4qnFhUxJ2OQZuN5SgP7jHtbo4BWQHc0dt6s0uUQy6uL4yenTxRLpQI8kNmYhnSbsmYaljwqeoDWizXZ4Ui0APjer7DpQU4WUR/qlElt1hSsl06ECw6zTvkM532Tuio1UPiOAppC3t62N6rqJC2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ab6TzdClg7LGWS9UPOszrccOFLLyWOw5sETR7NWarvw=;
 b=n3wND7Hk/BcNbL7fI+PkqKaDW0DwT1kaBN2iI9abSbmVpGwnGZBLUPPkyjYMBRPa7FwoSHUh5C++FzZ0SYWTHnjG0iWnPEXXwIFd91t477jM7xD+hiOz5DnrwdFxtCQrQxN3sD71immLaBwJ89A/2QIPj91K9zuhRT0vwWsA68fs0YSZRnUrKaoUVty3c0eMXumgwYoJcv3aZvSkYOD5p3vF87Aa+wgWbSH8I4Y3F5AcGe60acP2HJo0SHvogFzIHamEpyWK5hOVBGjpGtxabqNszlNCz/HRuGz7lmZnmZO45NOvrme+M0JIzbQofDRdjQi7UYF7bHkZEerCb22N2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ab6TzdClg7LGWS9UPOszrccOFLLyWOw5sETR7NWarvw=;
 b=LF4dY92NtY1hRAQwsk0RVKEOeAkiDJzQTSgBYffMsEeS6zRiM+IHCRbQ48fZqCJtfYVXBA4tyU7LQy9lyElRlbuY94twrMphwfXI44gtvgqfJazznyn1FignL/3QmmPKiTZakQV6JWWkiQHwLfKJDIZ3IYbIji101iuCvSbkFaWRCWuaP/JeU8QDKUYef+uVghfLyoyMlu5gdQ89WEL40mMKbBokAdgF7V3fbU5CLk1epQNKy7tUROjviQY/g7JbnduaG+icgbWxGnBacD3oq3Cy1NLB4zeE1D/owbrYWA8irwRgUqzip/sRK9RhqUnwCh9cV0ogAVPLUGwPjA7fbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5168.namprd12.prod.outlook.com (2603:10b6:5:397::8) by
 DM6PR12MB4912.namprd12.prod.outlook.com (2603:10b6:5:20b::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.22; Fri, 21 Apr 2023 05:30:59 +0000
Received: from DM4PR12MB5168.namprd12.prod.outlook.com
 ([fe80::5104:21af:93c:9c30]) by DM4PR12MB5168.namprd12.prod.outlook.com
 ([fe80::5104:21af:93c:9c30%7]) with mapi id 15.20.6319.022; Fri, 21 Apr 2023
 05:30:59 +0000
Message-ID: <7417a79f-bc46-8df3-c21a-2148c5ea513e@nvidia.com>
Date: Fri, 21 Apr 2023 13:30:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] vhost-user: send SET_STATUS 0 after GET_VRING_BASE
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>
References: <20230420130706.541219-1-stefanha@redhat.com>
Content-Language: en-US
From: Yajun Wu <yajunw@nvidia.com>
In-Reply-To: <20230420130706.541219-1-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KL1PR01CA0066.apcprd01.prod.exchangelabs.com
 (2603:1096:820:5::30) To DM4PR12MB5168.namprd12.prod.outlook.com
 (2603:10b6:5:397::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5168:EE_|DM6PR12MB4912:EE_
X-MS-Office365-Filtering-Correlation-Id: 97855d5a-9b23-48c0-e120-08db422996a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GdHSW40FNTPj/INL8Vr9JLn1sTs0vcLRfb1daSJMiAWxWYnU+hf5gXg8i7rfVcG5kfBKxfjxUS/iW1FL9vju3yk+33cKIEolnojW2mP33lNFqSu6gtrBm2//2NNv6Hqtqb+OCck3yTAHeXs3TyZ6e0bpN8HPirYTpmv4if2/g1g15++ni/arxMFksdaODe/CU2WSw9Ip6seWTwUIVXj63UGueWsYyBIHwmWOApjWNfih4gXocGJ64OqNiI96zZuYYp4ntYoMAwlaM7MiaoC5bBaXi1VYhRn60dWk/+Kp2VbScXcfogpwbi3cxITN0dYk7LgvoJQdPZUFZOfClnoagptqxi1KPv9YKOblVGlwyTQTuc8RlyL28Ad6WDRP4ui7Er859ew5+nPKvJwtmutSyeQXMmcAIQLkbjuyw0bUTusOXaa1vBIjfPXWUa3fKtJ5GOZI+5hMwoPMixeEsm7Wg4lrIS6VzIIHn4wptq71B6Ex/Park94DCqnbZbnkVU3eCD7/rNswHRHjNauV6I7NzL8GIN+2LaQBgztX47tfzjdqUocx4ZCJ6qFCj84BylKghIgCxMGSi/BD+p/33J2qWFHSdL0ObgavkgB4h36e9yORvekOCYHOn9RuNpI4LHQUNoaolaGVbe22g+elsd7sUw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5168.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(136003)(396003)(366004)(346002)(39860400002)(451199021)(31686004)(316002)(54906003)(66476007)(4326008)(66946007)(66556008)(6512007)(6506007)(53546011)(26005)(38100700002)(2616005)(186003)(83380400001)(66574015)(8676002)(5660300002)(41300700001)(8936002)(478600001)(6666004)(6486002)(86362001)(36756003)(31696002)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFQ2dmRhNGEvSHNTenVmeXpBMWM5THRiTW91VEZhendDa2V5b1B4YlBIbUZ3?=
 =?utf-8?B?TlMwK29hSzFJK1BNZ0xLSHIwdU1CdHA3ZUE1WEtPRmNqOThZeEQ3Undhbllt?=
 =?utf-8?B?TFM3ajd1M0FvYTB0SXpmVVVKNHFWWDcvd3lOaDJIUGhiamVSbExrK0lWQ29y?=
 =?utf-8?B?d3IvU0JKbFI1Wm9nWm5FNitsd21lTGgwcmx2UG9GQ0MxdmhjYzlVcC9qUGdy?=
 =?utf-8?B?VzZTYVhqYkNzVXd0V0lGWHFTcVp2ODQ4VDNoT01rOEh4UzZydFNLT0Irb0VN?=
 =?utf-8?B?UStPMU1SVm9SbU1XQzFjRUQrZEgxNnN1MGdTQU15ZUp5YjFBN3kvYi9sVTlu?=
 =?utf-8?B?QmZOd0Nmejh5RVQzcU1ZRkxRaEdiQXlFM2dXU3poMHRRekszajg2b3V1UFpS?=
 =?utf-8?B?c3J3Y0xrNTVKRU5RRVdoYjhxLzQwWmo2OFBKbldnemxkUXVhQkJjUi95cCtx?=
 =?utf-8?B?R3lEQVBVa2tiRThra0NaUkg0RUs5cnFtc0lTTEJiVElFakV1S1ZNMWVXUlZB?=
 =?utf-8?B?N2xNR1BSeTRQeU1vMnN0T2loMGVTNEVKTGdGamFJVkdmS3lzdzZteEE3UnNh?=
 =?utf-8?B?VytMRDJrSUdCWHFMRTVRRWtDZEppSitOaC9lenZydnpMQXJMZ29xaUVtZ3RQ?=
 =?utf-8?B?Sm5SM1R2OVlLVGt3TkJtTk1sWXQvQyt0dTZVVXBlRlZIamRzOUJlRFMzNGVO?=
 =?utf-8?B?MFlxR1o5VWZLNC9OVi9WNU5yYUZaZjdVLzhjbzFPR2FIcTJrRGFNckxjZjlC?=
 =?utf-8?B?Slg2dEtiTXQ1SHNNaUl3aEE0U2pWMEVONC9YN3c1Y2xyalUySHNLWEZ0WnBP?=
 =?utf-8?B?SmxObDlncTBPZ0xlQ0h6R2ZmUHhiK0ZYYWd2emFYeWYyMjFyWk1JdXVwdlJq?=
 =?utf-8?B?NlYwOW1ONmQyWjFzaG0rU3JGY1JLQ2FWRThMMEFZNWRoM2FHVk0zcmxST0Vw?=
 =?utf-8?B?WmhXMGlVbTdEaFhZc0huaGQ1cjBHNU1UTXdRK3VteGFBYWVpeUhlNFNERWcr?=
 =?utf-8?B?Y3ArZnNjM0ZvWlEvMEJDeWN2RTJab3pydEVva3JYVkJvOU1nNVVTMDI0aEoy?=
 =?utf-8?B?WWY4T0kzdWpJZ2UzelhQRk9JR0RocElJdC9McW1vb2JicmtybDNwUmxJMGlq?=
 =?utf-8?B?WmQrWDV5VGN4djdaOVJuSUZ0ODIyUlRITGFXaEk2VU9FN3BYcUhLZFpPME8y?=
 =?utf-8?B?OEtzZGc0REZSRWtsOVZiRFNXVXZacHkxUGxqT3pmV1hOdXVHM0JzL1MyYUla?=
 =?utf-8?B?d1ZUZmxpR2RxS3FWd2tZWkI2c3NoZ0pTT1llRFgwcS9ZeGoyRTdRbU0rN1Nv?=
 =?utf-8?B?eDltRGc2U2RUNWZpc1M4ek1UeWdBVXVhZ3YxMlk0R1FrYnZWSU1hMXptRWZR?=
 =?utf-8?B?K2RQTE9ReWZlK2ZpNzZDL3Y0U0x6OVRBY3o4YW5iNDhzL3ZKNnk0UkJ4NkU3?=
 =?utf-8?B?VE5aaG9uTURqNUtVRUw3V2VFZ0E2aW94VDhydzFubWRpSjJiU2J6WXVWeUpS?=
 =?utf-8?B?QzJ1cU5CMDhCVzBQdUcvVTlRREF2YXV3RHp4WmlYdy9NZzM1bDVrMEVhWk9T?=
 =?utf-8?B?cmJGSWtaTUJJVDE3MXdXTk9qNlViQW80NEhvNVdwaElKSXdoOFZZdHJzREM1?=
 =?utf-8?B?enFwdEsxWGp3SEEvcTd2VjgrMXdkK2FMNmlTUkp2dUd0c0JTcXNNdkt0VjB3?=
 =?utf-8?B?cy9lR0NmdnVpcVRhYnF4VUtsNDdiY3gzQ0JtNjFNNm44NGczb25ZR2N4MlFz?=
 =?utf-8?B?azZIMzFKdU52WWtSUWVabGYxNXRydnR4RXZza3ZIMVBwVEUzQUtJQlljdFh1?=
 =?utf-8?B?ZzBsN3BkNVY1RmljYndGb2FOY0habVBoWEFOd2FwKzErb1ZQbGpZb2xWbTFJ?=
 =?utf-8?B?cmVGSnpTZUVEY2Q5ZmVjV1FWOWRBYU4wd1VRWE1MV085SEtyUjBCRVc2WHJE?=
 =?utf-8?B?OS85UFFMem82eHVRWDVaeTlURk8rbWJUTjNnYTdWdjl1L2tNdGJNTm1IYnBO?=
 =?utf-8?B?L1hJRHE3NThFbDYyWG5mWVpJTFVQUStmVGVScld5STFwZEdkMko3Zkx2TVpj?=
 =?utf-8?B?RE9lT2NBUjNscFJBMWN2aVEvT0NGZ09ZRmh2S0NkRlVKTHhmZXZMRE9rcjho?=
 =?utf-8?Q?vtD6I8a1SSxwO900YtzuNW1fW?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97855d5a-9b23-48c0-e120-08db422996a4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5168.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2023 05:30:59.4511 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1X9OVbNKWX5YykerLYqqFVImYEZqm0jBlsraXbqS+uqjdyW2MfeqZN6h7MsDKCeuawB/IkbRITh+aquiADirZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4912
Received-SPF: softfail client-ip=40.107.93.41; envelope-from=yajunw@nvidia.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.669, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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


On 4/20/2023 9:07 PM, Stefan Hajnoczi wrote:
>
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
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Cindy Lu <lulu@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   hw/virtio/vhost-user.c | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index e5285df4ba..2d40b1b3e7 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -2677,10 +2677,20 @@ static int vhost_user_dev_start(struct vhost_dev *dev, bool started)
>                                             VIRTIO_CONFIG_S_DRIVER |
>                                             VIRTIO_CONFIG_S_DRIVER_OK);
>       } else {
> -        return vhost_user_set_status(dev, 0);
> +        return 0;
>       }
>   }
>
> +static void vhost_user_reset_status(struct vhost_dev *dev)
> +{
> +    /* Set device status only for last queue pair */
> +    if (dev->vq_index + dev->nvqs != dev->vq_index_end) {
> +        return;
> +    }
> +
> +    vhost_user_set_status(dev, 0);
> +}
> +
>   const VhostOps user_ops = {
>           .backend_type = VHOST_BACKEND_TYPE_USER,
>           .vhost_backend_init = vhost_user_backend_init,
> @@ -2716,4 +2726,5 @@ const VhostOps user_ops = {
>           .vhost_get_inflight_fd = vhost_user_get_inflight_fd,
>           .vhost_set_inflight_fd = vhost_user_set_inflight_fd,
>           .vhost_dev_start = vhost_user_dev_start,
> +        .vhost_reset_status = vhost_user_reset_status,
>   };
> --
> 2.39.2
>
Thank you for this fix.

Can you add protocol feature bit check, just like we do in 
vhost_user_dev_start?

     if (!virtio_has_feature(dev->protocol_features,
                             VHOST_USER_PROTOCOL_F_STATUS)) {
         return 0;
     }



