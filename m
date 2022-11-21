Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7DD631A18
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 08:21:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox16i-0005Xu-Ot; Mon, 21 Nov 2022 02:20:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1ox16e-0005V0-OC; Mon, 21 Nov 2022 02:20:40 -0500
Received: from mail-dm6nam04on2061c.outbound.protection.outlook.com
 ([2a01:111:f400:7e8b::61c]
 helo=NAM04-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1ox16c-0007XB-83; Mon, 21 Nov 2022 02:20:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qf95v+Jl/N2tGbyyyW/+LnaVx9NUG8aHBpkPJpRmRc8goQsVVXzCu/woicjOUPYNWQh34VPRDMDVDkDQIJcDBNknyTHUmx1Pikxl+vvjaato7D9HvpjFsQIJBv/f4kifNESmrBtpBQoX5VLoIvlQvqYtyyMhk9fYrOCxiniLRvXUyBn64oiQpe6jR960kj2KGiMYDXFF01YxkvklC8w5NKUMn7LhKBOKTWnhv2fIT9WV/H/f9T/t7MsnGPrMRtXtSTuOyvk+b+pDQx0UWmtAWH9oJSPlgMM/2W9vwNUoqIXUEJ3DY3Q5Rl52b56RbTDtZDaKcLrOOUS+fbigd5v6Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0z2Ck7vd3COLlzOykczayW6/eU17iuk3z7G69aj4+ng=;
 b=g/eDVOdxIyOT/t+BgK2/VWDVlKw2G7e+vS9NPaltCu6g0roRbm5nLTD7w56oE6wLBn+raI7bNWAvAFVfxzCadrfEJQiRkXY52b+YM9/LkTTX5l7kqap2Lbvn7PwEsjn4tUuj8tKDQ66JdnWSx0PFSeF+dfTb5sk9NSI37HWHFgNbUybw1Ilf8AcRJmfU+AAn1idXL6zRvdM5mI3Rl98DtTEpJAtzN/hk38oSUOcNkzFVfBfEjeJ6+yJsCpzL53mlKig+gzwygy4Uhhk/m0QR7fUACdIMA0zJjliG3rzGoHlBif7R/puSV5gnvbXh2OzzS333f9ZZxQZOPlE8XruPNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0z2Ck7vd3COLlzOykczayW6/eU17iuk3z7G69aj4+ng=;
 b=VWwqpOyWIEH6yVB8hmYOv/QHrvS87ljeOeqeylWxmUNbsZeBTqYWdoz7DJYfGWznTO9C+YSNIyA1FP0Yp+PjUJ+9aMUPVTX2MKu4aVPkalUTTaNRZt62R+Ea3i+LjAKBis+1glGAYlSqItBowfNXvUSp93si8xnhnQqNPYsRXjUAvCzn9vx3cFI0dGqIpk+KuaBkp8/cFzPg2PFlpCQk8r25cGri4DHupSUHVM74CBODHXZ9TLHLgtIPnLpC4NqGvRySZ9BW3qkQAqiy6pQMy3MXKF2WjU7TBKmBWvXjrqXoTwN1azc2K3SumaJRzShMyOcFCoLkmJSU11fty2sk6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by SA1PR12MB6726.namprd12.prod.outlook.com (2603:10b6:806:255::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Mon, 21 Nov
 2022 07:20:32 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::820f:1fa0:9353:bece]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::820f:1fa0:9353:bece%8]) with mapi id 15.20.5834.015; Mon, 21 Nov 2022
 07:20:32 +0000
Message-ID: <b7c2ac24-2d29-6946-ec3a-62eec1fbca1f@nvidia.com>
Date: Mon, 21 Nov 2022 09:20:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v3 01/17] migration: Remove res_compatible parameter
Content-Language: en-US
From: Avihai Horon <avihaih@nvidia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eric Blake <eblake@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 Kunkun Jiang <jiangkunkun@huawei.com>, "Zhang, Chen" <chen.zhang@intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Shay Drory <shayd@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>,
 Joao Martins <joao.m.martins@oracle.com>
References: <20221103161620.13120-1-avihaih@nvidia.com>
 <20221103161620.13120-2-avihaih@nvidia.com>
 <fbf06ccb-c339-d323-c01e-455109bed372@yandex-team.ru>
 <a469eb6a-8630-0e2e-e000-4a24bbb9b26d@nvidia.com>
In-Reply-To: <a469eb6a-8630-0e2e-e000-4a24bbb9b26d@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP123CA0005.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::17) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB5549:EE_|SA1PR12MB6726:EE_
X-MS-Office365-Filtering-Correlation-Id: f65eda4f-8dad-4627-a2dc-08dacb90e01d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UkJ+UxqlHbwFc2kqz9opB3kvVDqOlybt3vB0OZQcBTQGUvP7JuLE6/9iUEWrH0tUOxiHSLjjeSujWBoZqQ4SWJb16W80vOyzFPntyhUKg0YCKjspstjU8L5C1RJtpPAjbOy/Za8fXq3f9qlAPzu162wkw3ua2r5xWaRZ6PavOdZnLCTdDZoESUn+wnTAIIk6lDTxS9uq6JTDuXCHBfB5CFyhCINvgRD4OKvykk1Pa4pq8FimeXG0nEubozu/NI2bUWSHI3AlOXZXk8eRLUzmDx1r3Q/lan5FIgxbfkBmhYspn/4eyGzZnzWQQtxptboyaHVL8FsQ2of5NEdEh4DQ90wOu5/aZPbAdPPZFZcYb+9W6lIDX2M5Y5D/lt8t3FArIkA8AffRjWUscCzPSXs7whnmv+IzVv3Zc+DZ39GPB+qsyu3ZYzYfg7Gfl0QjfRtf/LO9Qou1dMkVQWYW5JACRtVWSaOEO0TtxEtv3CiUD6KSqZ6y4a4K4cFkMQwulWIyIOwXSyKNCNzN/3GZc5OVmiEiYFeAFPkRIpNvJUoq2NkyD8eiSQWcF8YfXDyOG3M2y4Q+rlt1ikY72t7CiXKEG2Xuenk6CqcSy64hpDFNwU5oRg4VA3KGzeMFuwt24xIUqY7thwHPewKMzYQjs/tYD1pwMm7+lzKN8y6FKRNAIMg164xdIs/BJmjt0Vqu/X76p+jJ4IpsJYRIN3XhMbxTa7K4MIolI079smNqHFm9krU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(366004)(39860400002)(396003)(376002)(346002)(451199015)(86362001)(5660300002)(31696002)(4326008)(36756003)(8676002)(2616005)(186003)(8936002)(66556008)(41300700001)(26005)(6512007)(6506007)(7416002)(54906003)(6666004)(66946007)(53546011)(6486002)(478600001)(66476007)(316002)(38100700002)(110136005)(83380400001)(2906002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0lLS2lTWGZOcjdyY2NYZHVZcHd6M3EyTWtpdHB2b0VSQVd2L1Y2cExkckxN?=
 =?utf-8?B?ZzRISVBPU045QVNoMlVoV2RNVCsvZnl3VFRUOG9iWk8vUjZNb2JhUXpuRkJ0?=
 =?utf-8?B?WEFENEFrcTFna29iekxZZmd3Vm9ldlNtMm1VaXdTcUhVZjU4QXNYOU5hcVZi?=
 =?utf-8?B?eit2S1lXMFB1Qm5Bemo5ejY3b1pkdTNZVCtUd1hVdDdlV3Fjdkt0ajEzckR1?=
 =?utf-8?B?TEJ2azVCUFVESkxsWEdMMFdKZm9yLy83bTUzdFdxQ3VMVC9CcHY3M3JyMXFV?=
 =?utf-8?B?RGp3alRlU0VpRUdrNUtNckpXTEV0dUhHWFNpMXEzNksra1VSQTVtQnFLUVRC?=
 =?utf-8?B?bVpOa3dxUFpUYXhJZUJvcFI3OGo2M3lyQTdtMXBld1RSU2pNVnFkVjYzc0pB?=
 =?utf-8?B?SU1hcmtWcFZ3N0lhY2RHejN3VDVlSVFJSFI5MU5oQ25ocVZMYVhEamNXakhD?=
 =?utf-8?B?YlU4MzJ1YjZLbHRMMmhRTXUrUEpJSE1KTmVncG0vNVM4Ull6dU1rU1BQd0xv?=
 =?utf-8?B?dFVNRG44NDMvbnkxdkZVWHN0cnpsOHFsaVBaVWhMaHBJYmgrYXJvZXNEeTBq?=
 =?utf-8?B?WG1nVlE1enFxWVQyVlBmQjRaZjFWb052aVZoeVFjYlVyU3JDVlZwdFg0bTBS?=
 =?utf-8?B?VGFaeDA4VjlWcWxLVW9Gdy94UWo4SHJRNTVCVjVMUmJqVFVHd3dlMUkyUVZ4?=
 =?utf-8?B?RE5tTnVDTm9qVjJqQUNMQmdCcHZsTjFLeGZoRENCT05vajBlUW9tdmljT0ZN?=
 =?utf-8?B?cjdtd0hZNmUwczRWOUh4dVFxUC8rK3BXTEpwRERIdXlxVmNUU0c5S3oyOTRV?=
 =?utf-8?B?bzFPelRpRDNWVXlmcVg1M05MUldDK04rMmt5WWthUEpEZW9DK0E4YytPWFlv?=
 =?utf-8?B?Q1pVZW9tOUlsNXptcjdibk9TSUpFK2dNR3Nob3duRGFsT04yeGovNUMzdm1j?=
 =?utf-8?B?OGl5bWlIYnJPdWtTZUg0VU1XK1ZQNGNWY1lUblFTZDVDWUxwQXZGK0krbnp0?=
 =?utf-8?B?eTRIY3pZU21VUk05bDRJVGYwV2RidVRtK0x5Y0lzZmgvaCtOa3dvZEVSRk4z?=
 =?utf-8?B?WC9NWEpoZmZUV0V2L3p2TDkzWm1jTndTUDlLMnNmdHp6MVU4QWpOV3dGUjlv?=
 =?utf-8?B?emlCRFA5MUt1VzNXSHk5a0xaNVhjM1puNkt0UkNWUHhRRkNkUGFZMkFLNmsz?=
 =?utf-8?B?R1l1eW1penpRWGZJMnArWmRXRWZacUFnZFE0WGw5eFQyR3NtcmhOeUlvb3Fq?=
 =?utf-8?B?NDFEWllXTDRwRnVMbGUzemJOYkJEVlgwNnhHVzIxcTQ1K25qOEJzRlRxVzN0?=
 =?utf-8?B?bFpMcHBkd1lpQlIxdzk2NkNkS0xmN1ZtNGxGQXdCdE9xV2xuVTcrUDA2dUNW?=
 =?utf-8?B?cTNrRkNycmk1eGlmdklPSVNUS0JuRnFyWldwLzBQbmJPVG5aRkF6NVpNS1B5?=
 =?utf-8?B?ZG9YR0FiendZUFplanJRSFhMUDVMZ0FPa2NmZDM5ZHhsTHlkMzV6L3dyUm9q?=
 =?utf-8?B?Yyt3TTJlQ2N5NW9PWTY2aVI4L01DYTVqQ2lzTXZMQ0phYTVPTHdlWVRXMFV1?=
 =?utf-8?B?UGZoaDlxNEFRSVhlVS9ZUEtvYW9jR2pnbVlDdEY1bW9nY3N5VkpySHZGbmov?=
 =?utf-8?B?MVlodG9PTHZCTTNKSUlHbHR5aXIzZmluTmgweDVxczY0OUplRU5jVHQ0T0hh?=
 =?utf-8?B?enk5Zlhmck1nVnE3ek1Bcy90VS9IOXBuc3pGcFA4a1FiYmlyS1ZtbnhOOE5F?=
 =?utf-8?B?Q1BhTDdIV2JmbkJ3RzdvK0phYVNFeWMrVlE5Qm5ud1F3UUxvYndNRjJFNGtT?=
 =?utf-8?B?a3BPbFdGTUdtd3FWVjBVQzl1YUNaN2VEb3hLOVZGaFdXRkxvMVFEWHNPbEpN?=
 =?utf-8?B?eEN0R1pydHJSU2Q4Tjd6Nk1jL2g4T294OGdKSTlBYjd5bXNCdVVyR21iUlJI?=
 =?utf-8?B?TEs2MFYwdjlmYVFvazhvTGF1RDc4a2k3Sm04UEU3N2FMUDRiYUlJUFV6ZzVk?=
 =?utf-8?B?Q3g1Q0JwQ0xtR25xVUxWdFc0cHhoL3NYeDd3VWhBZk5rMXVzREkxYm4veTFm?=
 =?utf-8?B?anRGYjBjd0ZRSnNRWjJzZHQ0TS81ZlFWeVpLMS9HTHFKNHIyeFp5dUhxVm5Y?=
 =?utf-8?Q?aEValaLb0ht2RtJks+Bs+sEhF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f65eda4f-8dad-4627-a2dc-08dacb90e01d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2022 07:20:32.5707 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TLDnZlCCAO0IE7NueJCn0dYiKy0R+OWUSi6FnpTpPEAGurdjqzYBAEbzc8HUKuU3sVuyUnJ3EqeNrPNYMZfZxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6726
Received-SPF: softfail client-ip=2a01:111:f400:7e8b::61c;
 envelope-from=avihaih@nvidia.com;
 helo=NAM04-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_PASS=-0.001,
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

Ping.

On 10/11/2022 15:36, Avihai Horon wrote:
>
> On 08/11/2022 19:52, Vladimir Sementsov-Ogievskiy wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> On 11/3/22 19:16, Avihai Horon wrote:
>>> From: Juan Quintela <quintela@redhat.com>
>>>
>>> It was only used for RAM, and in that case, it means that this amount
>>> of data was sent for memory.
>>
>> Not clear for me, what means "this amount of data was sent for 
>> memory"... That amount of data was not yet sent, actually.
>>
> Yes, this should be changed to something like:
>
> "It was only used for RAM, and in that case, it means that this amount
> of data still needs to be sent for memory, and can be sent in any phase
> of migration. The same functionality can be achieved without 
> res_compatible,
> so just delete the field in all callers and change the definition of 
> res_postcopy accordingly.".
>>> Just delete the field in all callers.
>>>
>>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>>> ---
>>>   hw/s390x/s390-stattrib.c       |  6 ++----
>>>   hw/vfio/migration.c            | 10 ++++------
>>>   hw/vfio/trace-events           |  2 +-
>>>   include/migration/register.h   | 20 ++++++++++----------
>>>   migration/block-dirty-bitmap.c |  7 +++----
>>>   migration/block.c              |  7 +++----
>>>   migration/migration.c          |  9 ++++-----
>>>   migration/ram.c                |  8 +++-----
>>>   migration/savevm.c             | 14 +++++---------
>>>   migration/savevm.h             |  4 +---
>>>   migration/trace-events         |  2 +-
>>>   11 files changed, 37 insertions(+), 52 deletions(-)
>>>
>>
>> [..]
>>
>>> diff --git a/include/migration/register.h 
>>> b/include/migration/register.h
>>> index c1dcff0f90..1950fee6a8 100644
>>> --- a/include/migration/register.h
>>> +++ b/include/migration/register.h
>>> @@ -48,18 +48,18 @@ typedef struct SaveVMHandlers {
>>>       int (*save_setup)(QEMUFile *f, void *opaque);
>>>       void (*save_live_pending)(QEMUFile *f, void *opaque,
>>>                                 uint64_t threshold_size,
>>> -                              uint64_t *res_precopy_only,
>>> -                              uint64_t *res_compatible,
>>> -                              uint64_t *res_postcopy_only);
>>> +                              uint64_t *rest_precopy,
>>> +                              uint64_t *rest_postcopy);
>>>       /* Note for save_live_pending:
>>> -     * - res_precopy_only is for data which must be migrated in 
>>> precopy phase
>>> -     *     or in stopped state, in other words - before target vm 
>>> start
>>> -     * - res_compatible is for data which may be migrated in any phase
>>> -     * - res_postcopy_only is for data which must be migrated in 
>>> postcopy phase
>>> -     *     or in stopped state, in other words - after source vm stop
>>> +     * - res_precopy is for data which must be migrated in precopy
>>> +     *     phase or in stopped state, in other words - before target
>>> +     *     vm start
>>> +     * - res_postcopy is for data which must be migrated in postcopy
>>> +     *     phase or in stopped state, in other words - after source vm
>>> +     *     stop
>>>        *
>>> -     * Sum of res_postcopy_only, res_compatible and 
>>> res_postcopy_only is the
>>> -     * whole amount of pending data.
>>> +     * Sum of res_precopy and res_postcopy is the whole amount of
>>> +     * pending data.
>>>        */
>>>
>>>
>>
>> [..]
>>
>>> diff --git a/migration/ram.c b/migration/ram.c
>>> index dc1de9ddbc..20167e1102 100644
>>> --- a/migration/ram.c
>>> +++ b/migration/ram.c
>>> @@ -3435,9 +3435,7 @@ static int ram_save_complete(QEMUFile *f, void 
>>> *opaque)
>>>   }
>>>
>>>   static void ram_save_pending(QEMUFile *f, void *opaque, uint64_t 
>>> max_size,
>>> -                             uint64_t *res_precopy_only,
>>> -                             uint64_t *res_compatible,
>>> -                             uint64_t *res_postcopy_only)
>>> +                             uint64_t *res_precopy, uint64_t 
>>> *res_postcopy)
>>>   {
>>>       RAMState **temp = opaque;
>>>       RAMState *rs = *temp;
>>> @@ -3457,9 +3455,9 @@ static void ram_save_pending(QEMUFile *f, void 
>>> *opaque, uint64_t max_size,
>>>
>>>       if (migrate_postcopy_ram()) {
>>>           /* We can do postcopy, and all the data is postcopiable */
>>> -        *res_compatible += remaining_size;
>>> +        *res_postcopy += remaining_size;
>>
>> That's seems to be not quite correct.
>>
>> res_postcopy is defined as "data which must be migrated in postcopy", 
>> but that's not true here, as RAM can be migrated both in precopy and 
>> postcopy.
>>
>> Still we really can include "compat" into "postcopy" just because in 
>> the logic of migration_iteration_run() we don't actually distinguish 
>> "compat" and "post". The logic only depends on "total" and "pre".
>>
>> So, if we want to combine "compat" into "post", we should redefine 
>> "post" in the comment in include/migration/register.h, something like 
>> this:
>>
>> - res_precopy is for data which MUST be migrated in precopy
>>   phase or in stopped state, in other words - before target
>>   vm start
>>
>> - res_postcopy is for all data except for declared in res_precopy.
>>   res_postcopy data CAN be migrated in postcopy, i.e. after target
>>   vm start.
>>
>>
> You are right, the definition of res_postcopy should be changed.
>
> Yet, I am not sure if this patch really makes things more clear/simple.
> Juan, what do you think?
>
> Thanks!
>>>       } else {
>>> -        *res_precopy_only += remaining_size;
>>> +        *res_precopy += remaining_size;
>>>       }
>>>   }
>>>
>>
>>
>> -- 
>> Best regards,
>> Vladimir
>>

