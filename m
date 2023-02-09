Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E443D690194
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 08:50:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ1g2-0002rv-AK; Thu, 09 Feb 2023 02:49:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pQ1fy-0002qx-Rc; Thu, 09 Feb 2023 02:49:02 -0500
Received: from mail-mw2nam10on2062f.outbound.protection.outlook.com
 ([2a01:111:f400:7e89::62f]
 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pQ1fv-00057S-PJ; Thu, 09 Feb 2023 02:49:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ihaaQuBXrOVtB+j0kpm76VPOwfEuBJu5u3XZBvQQW8zM3WxCuKGe+YXyXfVrednGNaSzlYW2NkEaU9kAYbWh7WucDZGW20t1rrQiCoBalpoJ1lLPLBm+2uwqtF/2BxuIoO4ef5H3sEZHsSqP9vDNIgkTiQgtn1yrVsZjzVxIIDenYSqTbWL5oxgMCgd8jAnbAJ27LtY31jTpKWkNaadzjwrW1Bet/ezUiTLkZWGMj2yqHmgIoyikSC5Heq4UoME3ZbXc4jBEM5CMG2h0JjOTg7seTuQNgyp9yb3ri+K8H4aMWAmhfS6iK/7or2UGU9d7+GnLjik/+f2vDlsTgMAOvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2EDOWMwPo0J4ln6OOqTGCPA5HPO8S4H0HBUzXzdI624=;
 b=KX6vHRA6d1SjMIFS6KJRt6M17HvIT7hwiTWlALd++HU6FzOZgYH91HPfSCKRxwidCbnv6KWv0roWTz38mCl06+2gVlz0c134plH2Gwa9UBnSgYpko9SOwzhTbcN1zbaUpO74RZhbcmCa7mIv/uV5DZykFEOpx/3VjLVfWeH4XMCIG27cvh1DHotMWOLDBeyHJsS3jgdIVFhR6lFXSAzp70Hzf69wTAgHRt59aR1N4DRJ3KtQtpuewblD9JB701wMh7PuHqrP31dbXv8Bx2rMGv3kl8nFiA7/Yxjm8o1sg93eAF2j3IWewaCkPB1U3sczvyEADSLvGPpRo9JrSBMDNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2EDOWMwPo0J4ln6OOqTGCPA5HPO8S4H0HBUzXzdI624=;
 b=Lh//oEnt1XuwWO1/2UAtdv+t4GrfxsZq3i92xcZxi2LvEtecpfWkiXdUVcDGxLJCRMEPonYJp14YhzsgaNcU84J0f0CeVHpqhJR58Bn040VPKGdW/RK3LSfvCCcbO+P94dA7EG6LcGSfXT+zSzgckx/a1VUyK7kjioFYWlzv121DzdmESQjZmNfZ8zRgvlCGPPZkMA4iUqn1yZPAneidcLfitPgmZzlpVwzZluGJTcEGuPfidXKNWpnr09xBgAfZXNcKL053/fce3kP+5+tk6hIDNdMsbXXXq8WIzlNyusGjVFzKuOocObU8zFZuAoPd7QXrwVPSZA9KI3+dYwbHzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB5544.namprd12.prod.outlook.com (2603:10b6:a03:1d9::22)
 by IA1PR12MB6603.namprd12.prod.outlook.com (2603:10b6:208:3a1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.36; Thu, 9 Feb
 2023 07:48:50 +0000
Received: from BY5PR12MB5544.namprd12.prod.outlook.com
 ([fe80::3287:efd8:14bb:c5f6]) by BY5PR12MB5544.namprd12.prod.outlook.com
 ([fe80::3287:efd8:14bb:c5f6%6]) with mapi id 15.20.6086.019; Thu, 9 Feb 2023
 07:48:49 +0000
Message-ID: <2c982100-990b-dcdd-bd4a-ff8dce33e59f@nvidia.com>
Date: Thu, 9 Feb 2023 09:48:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PULL 03/30] migration: Split save_live_pending() into
 state_pending_*
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 John Snow <jsnow@redhat.com>, David Hildenbrand <david@redhat.com>,
 Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Coiby Xu
 <Coiby.Xu@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Eduardo Habkost <eduardo@habkost.net>, Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Eric Blake
 <eblake@redhat.com>, Eric Farman <farman@linux.ibm.com>
References: <20230207005650.1810-1-quintela@redhat.com>
 <20230207005650.1810-4-quintela@redhat.com>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <20230207005650.1810-4-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0097.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::12) To BY5PR12MB5544.namprd12.prod.outlook.com
 (2603:10b6:a03:1d9::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB5544:EE_|IA1PR12MB6603:EE_
X-MS-Office365-Filtering-Correlation-Id: a30184ce-4691-4d9e-33fb-08db0a7214a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D5VQWQuCXkZHFncYur37gzB01KhTOaltHj4mG2g/WyufhxIV2T4cTKqx2NJoNSRW98j9M/pQapnjUAgkSe9HTxGucuu8jap7XB/fdRXRTaeXwUKx84ktRQcQ4EucRpOypv955bxubumIMIrEroYjC++6EkJfjO6TTXcIWkqM4iy3GJ1uZg86di+TsGk1Tu+fmH5hsMzLtbEo0LdFcKeBAT8pk/uMWo+hyfUndxXsrHJ2Z/joGe4uc051dXhXlfuFYJ3ZLHB4KevXXN3x7+ZChgLtQ5c+FAq6R35LUql8ULgqBMaTssDoq/svnOvBC6tf9X2OYhE/oU9bTB9jX7BTIiQ6lVDETv+QztB1TyzRdb8vuz9msYb9GXl645FnJ/Vh15+KRRlPi2K8/Oju5s/kbTLK8aRSDr4wvxpOd+8eyi2BmFWYlFLU/6iaIgR4pcbQ94gm4Bc6fOM6AY8iKb46BYygt4iJS96lQ9ridA/hgJr2Jp0D4RiJYPFobbJu8l2Jn3QPgfm6iSZxTm1sfNZb/yiH/HoXHsM8A5yFDXF/5mgJ7f444UEX5SBH/LnIsi6mtSwompp1Kc53EdSXpaEiQfS4SbJ5Rb3K5gU1KXaVtb785jMl9vwxEfbfaMBWMhPoAbx6HKDm1n53I0ZRTmV+nltXWNh3fwBpHW1tAgSNGeis5uTyvy0fAuLN25pbVc4q/zlrlgvATCX+9djHcUO5/22I2t9xhlqN87G0tRxKWRQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB5544.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(376002)(39860400002)(346002)(366004)(396003)(451199018)(4326008)(83380400001)(36756003)(316002)(54906003)(6666004)(53546011)(6486002)(478600001)(6506007)(2616005)(26005)(186003)(6512007)(8936002)(7416002)(7406005)(5660300002)(86362001)(31696002)(2906002)(66946007)(66476007)(8676002)(38100700002)(41300700001)(66556008)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3BCK2V3b1d0RDFVQ0dudG5MR1ZxOHJMd1J0Y1lwNlVZOGVpaG5ZT2UvVHl3?=
 =?utf-8?B?VlY2SFl6QXBOaEF2d0hwazk1WXdXeEQyeFI3eWpZM2V4S0ZVS052VTlSSFhC?=
 =?utf-8?B?dm5zRytKWnFSQkd5U1BLTXpxVU9uRnlIeUdDRDR0QUhINEZZNnVqODY4N3Mv?=
 =?utf-8?B?a28xRERybFFyd1FUOGFSYnVtYStXcmFrWE84Y0hud3hjUzdvY0M5VVBkTTY0?=
 =?utf-8?B?dVJmWjJXTFp2bjFmbUdOUXVFL3A3RGJOQU9nSUFaalJEZjJLQnB2V1p3YjhW?=
 =?utf-8?B?TERpU3VZR1o5MTB0VVBvdlI3eTYyK1hMQXRzTUMzamFTRWFQS09OSWlkakYr?=
 =?utf-8?B?THZBZW9qM3RWcVNrTFpZSDNQQ2s5aXZtVUJFemVYdmNMWjNEN1R3c09sZkhG?=
 =?utf-8?B?VHhoOG1QODlLTUpxZDhQaUhmMVU2WFZxdnVDeDlhN0NOa051Z0FCbWFUd1dv?=
 =?utf-8?B?QlljMHhON1RjeFYvOUVKNWhTTkoyUzdSYktCZ0lub0p0ZEtvNW1UdC9JQmN0?=
 =?utf-8?B?Z2dleGw5T0dQVGpsdmxPc0pYeXIrb0NpQWd3dERUU2J4M3RRMVIwYlJ5YThi?=
 =?utf-8?B?UDNQcVJrMEN3MXJidkVBRXFaRUJXdkF3SDVLNDJpWXhacjJ2WWFDeTArN3gv?=
 =?utf-8?B?Y2w0VENyYjVUTExNak1HNnVDWFBjRHZ5MWU0cXRNaytHUVJBQjNPSjBiblNS?=
 =?utf-8?B?ajF2VGxZVm9sTGJ2TThJSFR2eENWZ1g4TFV4Q3NVVHBOeEhybXIzMFBrK0E0?=
 =?utf-8?B?VU8ya1gwZlh6QU9EaGIwQ3ZyYzZJS1h4OWJDbkhHN2dVL0wzbGxNMDJnVm81?=
 =?utf-8?B?K0hrNDZyYmxrd2VLbWQrekdNSDY0ZnNhSk5XendmaEhnSE9sRXZYWkhhZUhK?=
 =?utf-8?B?M1hCeDJDWHMvdjkyc0pteUVYRGFZNFUrKzBkcWRiUXNrRmdlWGxubUdXajNs?=
 =?utf-8?B?YnlBcHBLZlBjd0F0SEZBdXpUKzdJSktmL3JRMkNtV1FxYzZoR2c2dlUzNUtx?=
 =?utf-8?B?aGl2Sld6VU1wd2RjVUw0YzV0dEJPSml2aUZ4WWo1d0J0ZllHSnlUMFMweXZX?=
 =?utf-8?B?dXZTS3BIRDZEZjllSmZVUm43VUY1VXN6VE5ybjBMOXNkbU12bUxPc1dTSTU3?=
 =?utf-8?B?N3VXZTZwMEQ0KythaDEvU1NKUUxpRTdrQjVEQVBFc2xJeDIrQmJFaThHQTZZ?=
 =?utf-8?B?VFFVZnBmNXFqUHhESG1JYkRzbUZuS3lITG1KakFpTi9NZ2hFOUNiSGQ4L0RS?=
 =?utf-8?B?eFhUZnJMR1p3ajlIVzZ4ZlllMnFleGZkV09TT3VKUDBSdWNDRlJWdEQ3OFFU?=
 =?utf-8?B?RG5NZUNRYzNCVFZweENUN2hVdzFVcXhHdllwSmowR200bnBjZVo0UjFtUHJJ?=
 =?utf-8?B?QkJiL0MwVEUyRlJickxlcGNocFZzZlQ4Vmt0MnR5NGxObVZrZmp4aWhRczNh?=
 =?utf-8?B?UStnOE1vMHJyalJsTWJKQmhIK2VDd0V1MnJTZWJWUTZhWVg4U3dzSjVvM1N2?=
 =?utf-8?B?MHd1bTZmbnR0STZVM04wRFJ5bng0SUlZRWdMVXNoTW5aTnBMdFY3QkYrMDZj?=
 =?utf-8?B?U3JYRENUMmdsZEFrOVlncDA1RnRFaTB6YWttb3RiNTc5T09haDJhSVpiamVH?=
 =?utf-8?B?RndMMG9wUXhhdEc5bElDa2FkSHJGZFM4TGx4MmtPRzhjQ1hYMndMVU1vRFJk?=
 =?utf-8?B?L21BT2dSbjdBNWVRNitHaktqSVA5R0RHdUhBcXNjelJJdlBhUm0zMnZEYllT?=
 =?utf-8?B?a21JNDBTdUFDMTBSblBhWDJFcDNjbzhvWFFlajNScUg3QUJFTkRNcjBBa29L?=
 =?utf-8?B?M3F6ZER2VDZPYUJIVFdUN3lWMWhGY1BGRUJXaG1uQTNyRCtCanFLZ1lTUk03?=
 =?utf-8?B?b0FtNVdXQnE0cy9IWnZTdkJyWDVlSGlOM1YzUDMzUTZ0b3FYSmlRUmtFZHZN?=
 =?utf-8?B?KytXVGZDUXRFdnJiTEFlblBGMzk2MFZyQnFMenNoT2YrZVdJU1N4ajFCNTdt?=
 =?utf-8?B?NCtsaTUzYkpkc3VUY1ViYVVLYkovM1UzL0NGamdSOTFtcjVRR200OUZRUHdJ?=
 =?utf-8?B?UUN0SStMam5JK05ObllJQm53aXpWMDVLemFEZmJ4cDJWWk5FZFQ2QzVxVnI2?=
 =?utf-8?Q?wBHbHHGG9rvUH4c6G1FmVbIk/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a30184ce-4691-4d9e-33fb-08db0a7214a9
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB5544.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 07:48:49.7372 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BvrbkoU2x66QC6Sxp+MBACho9n74Pf4fpZ/aEPit/3T8nk3xfMu/dsNKIpQ2GZXbpWqpbBb593uLx8qyNwu+pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6603
Received-SPF: softfail client-ip=2a01:111:f400:7e89::62f;
 envelope-from=avihaih@nvidia.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.146, SPF_HELO_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 07/02/2023 2:56, Juan Quintela wrote:
> External email: Use caution opening links or attachments
>
>
> We split the function into to:
>
> - state_pending_estimate: We estimate the remaining state size without
>    stopping the machine.
>
> - state pending_exact: We calculate the exact amount of remaining
>    state.
>
> The only "device" that implements different functions for _estimate()
> and _exact() is ram.
>
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>   docs/devel/migration.rst       | 18 ++++++++-------
>   docs/devel/vfio-migration.rst  |  4 ++--
>   include/migration/register.h   | 19 +++++++++------
>   migration/savevm.h             | 12 ++++++----
>   hw/s390x/s390-stattrib.c       | 11 +++++----
>   hw/vfio/migration.c            | 21 +++++++++--------
>   migration/block-dirty-bitmap.c | 15 ++++++------
>   migration/block.c              | 13 ++++++-----
>   migration/migration.c          | 20 +++++++++++-----
>   migration/ram.c                | 35 ++++++++++++++++++++--------
>   migration/savevm.c             | 42 +++++++++++++++++++++++++++-------
>   hw/vfio/trace-events           |  2 +-
>   migration/trace-events         |  7 +++---
>   13 files changed, 143 insertions(+), 76 deletions(-)

[snip]

> diff --git a/migration/savevm.c b/migration/savevm.c
> index 5e4bccb966..7f9f770c1e 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -1472,10 +1472,10 @@ flush:
>    * the result is split into the amount for units that can and
>    * for units that can't do postcopy.
>    */
> -void qemu_savevm_state_pending(uint64_t threshold_size,
> -                               uint64_t *res_precopy_only,
> -                               uint64_t *res_compatible,
> -                               uint64_t *res_postcopy_only)
> +void qemu_savevm_state_pending_estimate(uint64_t threshold_size,
> +                                        uint64_t *res_precopy_only,
> +                                        uint64_t *res_compatible,
> +                                        uint64_t *res_postcopy_only)
>   {
>       SaveStateEntry *se;
>
> @@ -1485,7 +1485,7 @@ void qemu_savevm_state_pending(uint64_t threshold_size,
>
>
>       QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
> -        if (!se->ops || !se->ops->save_live_pending) {
> +        if (!se->ops || !se->ops->state_pending_exact) {
>               continue;
>           }
>           if (se->ops->is_active) {
> @@ -1493,9 +1493,35 @@ void qemu_savevm_state_pending(uint64_t threshold_size,
>                   continue;
>               }
>           }
> -        se->ops->save_live_pending(se->opaque, threshold_size,
> -                                   res_precopy_only, res_compatible,
> -                                   res_postcopy_only);
> +        se->ops->state_pending_exact(se->opaque, threshold_size,
> +                                     res_precopy_only, res_compatible,
> +                                     res_postcopy_only);
> +    }
> +}
> +
> +void qemu_savevm_state_pending_exact(uint64_t threshold_size,
> +                                     uint64_t *res_precopy_only,
> +                                     uint64_t *res_compatible,
> +                                     uint64_t *res_postcopy_only)
> +{
> +    SaveStateEntry *se;
> +
> +    *res_precopy_only = 0;
> +    *res_compatible = 0;
> +    *res_postcopy_only = 0;
> +
> +    QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
> +        if (!se->ops || !se->ops->state_pending_estimate) {
> +            continue;
> +        }
> +        if (se->ops->is_active) {
> +            if (!se->ops->is_active(se->opaque)) {
> +                continue;
> +            }
> +        }
> +        se->ops->state_pending_estimate(se->opaque, threshold_size,
> +                                        res_precopy_only, res_compatible,
> +                                        res_postcopy_only);
>       }
>   }

Hi Juan,

I only noticed it now while rebasing my series on top of yours.

I think the exact and estimate callbacks got mixed up here: we call 
.state_pending_estimate() in qemu_savevm_state_pending_exact() and 
.state_pending_exact() in qemu_savevm_state_pending_estimate().
Also need to switch the !se->ops->state_pending_exact/estimate checks.

Thanks.


