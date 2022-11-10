Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EB0624363
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 14:40:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot7ls-0006CZ-CF; Thu, 10 Nov 2022 08:39:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1ot7ln-0006BD-P4; Thu, 10 Nov 2022 08:39:04 -0500
Received: from mail-dm6nam11on2054.outbound.protection.outlook.com
 ([40.107.223.54] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1ot7lk-0000T5-Gu; Thu, 10 Nov 2022 08:39:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EdtPcJfC8xupor5lFKn+FkYXMj4lhnHcgFZndEXkMIgaHfUoXFGauYgTb88zZosViyVa1F6KxqPkpkk9o9G2kA+FPGpuzVLNR8omTpHaHckL1pSdjCv4GoD65CV8yUjZQNy1C9S/EolFsXtR0hW+pN4yCwwATmF7PgKJA1QyfTe+PkcoAq8vAYeKZzuQGKloNcA1kv71E0Hqho3WLcRDl9ck5cfYwKE3jOI7IYDXoUIut7yMgt6NbkX9MYjT08O4WKhbP+0NkOT2KirAjxYUtNCD8SaNP5E7aV0CHem5O0E6M6TXNYrJa/DrM4IZSvkyQB9dvK03OFK5ro0d7WIItA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YntcQUFKB74WN//BMM0zHn8lmhYL7UQAiKP6ivczz+4=;
 b=oEQ4BTjtagOqzcjaJjUJNySLd3P+YPExI9tADIdo5Gwv7SGYIAkLkXjmhGVTVH47hMqt23Wo3mGAkP5Itu26dHrn7XWKvLVr+OwBbHle/VZt/8wnQXFNzncOjdwG9zHe/H57G7erOaU2dQPv9xNBkIf7vm/B9ScT4zf0wQq+gyfD28kVYbVKP9X/UQgcvdqnGzwuWT8fleayaElS+PpHc2AAGffrKZSULMbLcfGOz/52sWUQlS+RgGljtRbt5clDa5hunDWRUIt6m3VdUjw6O5Py3wOMAlwimboZS6+mQYrkr/BYwbNDzGnfYvvhCRPD20Y7tQDjUnFc5bV6Tz1G+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YntcQUFKB74WN//BMM0zHn8lmhYL7UQAiKP6ivczz+4=;
 b=da4dVV9Hin7jFwPMn4sLFjyfAcDiCTVcQ8XjJESLff22twXaRGyv/BaPhbSCQplkTNJxWrt7wUywtyQLogIMixT1bzo/Wfvn7ggjz3+eF17qPC4yiD47Zs2A/nBghQsp410wos5aMHxbVEE6PcF1x0yu7BMXdm7amUFSNtm13TygUMd+5Qlx0wNg3kfxzj9oPNuFERPWROfoJXS5DOzcry1cDFBF/xlwMT7SYm5d/PfF1ogTbaSy5hnu9nFbRg4rHNHREiVN3Qafc2bG0T8uoNhlPrTfzVybc6bICjTxZ43TDdo6M29uA2JHv1RMDppsKjpbP1w5oXzFZrg/LgJPOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by MN2PR12MB4047.namprd12.prod.outlook.com (2603:10b6:208:1de::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Thu, 10 Nov
 2022 13:38:56 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::53a7:afdb:d6d0:f167]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::53a7:afdb:d6d0:f167%9]) with mapi id 15.20.5813.013; Thu, 10 Nov 2022
 13:38:55 +0000
Message-ID: <88bcb40d-0ec0-e991-dd89-deb241a3063c@nvidia.com>
Date: Thu, 10 Nov 2022 15:38:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v3 03/17] migration: Block migration comment or code is
 wrong
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 Kunkun Jiang <jiangkunkun@huawei.com>, "Zhang, Chen" <chen.zhang@intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Shay Drory <shayd@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>,
 Joao Martins <joao.m.martins@oracle.com>
References: <20221103161620.13120-1-avihaih@nvidia.com>
 <20221103161620.13120-4-avihaih@nvidia.com>
 <0950214f-167a-9176-0ae3-15518d4e9d5a@yandex-team.ru>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <0950214f-167a-9176-0ae3-15518d4e9d5a@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0112.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::9) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB5549:EE_|MN2PR12MB4047:EE_
X-MS-Office365-Filtering-Correlation-Id: 29e9a004-b136-4051-fea7-08dac320e9e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lTbBhUajnTntdJTYjKgECNL0enDqejTt4frlL6FkPbhPXMLGcBpIJ+c1hadHOqqXc9PYY/U3mVvpu6QZiHECsvsQ6g4ImXlvzZHIeL0RDjTiQxlszGV4wigQTs7G51paRy15UeTCMvspnKvlVJq7mWhlfeUT7opdgkBdq4aZNRocxzdd67m2A8qE+MPGf+3TGmoUZHZLEw+ExJgJNTYtSvXkBkzjnMdrDUon8du91bSkle8gIqUV8x3ULnAG4jcDSO3ka5db5QjsZCVmALF8bIuUBJiIYLpI4GcMh3iVLWwm0Z18WKX4wC2O0vvE3LIFL2YTOOcW9OFPvz133H7RcInrAZx4G2X0+viDbBmqakvLyBKoCWx2juEt3yf4Q/Wjw33P32scIa+FWv/j/PXDE8lvqd7dD2arUQgd1x/UBDrCcY7nxAFyRY9LYDm3D73CFB2ZDJHc4dgRajlzb+zVmj4KPxREDFU+572cWB1Da0eKVTXVwi7PvfUIgZHKrwMofQUIysfWMR7i+Xp4Y3zI21eumPIpjQcObqRUDsw86h+1liGfk3SnlONqbe3ly1xFl75H/HZXZs/fQBzFKLcz74HI3HCBhPayJGuErKZAFeExIkBtjo08OqsmjuEKhCaIxeANc8uGeG8WejEWdiFQXsZdtp/jGRG83dWzsJC/v8MR9Y+uBqwnDffepTDkSUGLhh6t0WyuIptgSvv7G3ysfc+Z73de8jIC5qY+pcLyj8IJIx+BfHoiIYFMNlBqyQS646239ZipvQ4UukQU6QU66yoXRUNcDLZL8y0QDOj+SkM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(366004)(396003)(39860400002)(136003)(451199015)(38100700002)(31696002)(66946007)(66556008)(8676002)(6666004)(4326008)(66476007)(41300700001)(2616005)(5660300002)(7416002)(86362001)(316002)(6486002)(478600001)(54906003)(186003)(83380400001)(8936002)(2906002)(6506007)(53546011)(6512007)(26005)(36756003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0JXeDhLeXhRTHFDWGlHaGlBZUxicVNydTJ3RW45eXJXcnJzQUJwc1AyVFhO?=
 =?utf-8?B?WVd4S0xxNU5ZNzNWcGpEcHA1aG1abTF3aWVrcVBlNVlPNi9VNHYxOWcwQk5v?=
 =?utf-8?B?dENjbWFlRytpUG5kbm9zWWNrVHBpVXdnc0FmT2ZyU2g5OVZXN2ZtV0pjMGFx?=
 =?utf-8?B?ektmbTNzaHpRdTZ5WkhsNGxSdjg1Z1NQVFpUcFhXcGhVbDdCN2VncjNSSGVa?=
 =?utf-8?B?OUJ1YVdmZEkxd3ZsTUdPNTlpenlrWUY5YlNGSllmZlJiR3J5NzhBWFovd3FK?=
 =?utf-8?B?L1M3L2lLRW5iUkxDeWVpdmY2akJVOFEwSml0Y2U4SURhWXhNeDdVTkhRM1dS?=
 =?utf-8?B?VEFzNmFicmt5OEQ0VU1rVnlpWjBkR3lmRVB5K1l3c3V4VnhxR0FpSitGQ1RD?=
 =?utf-8?B?eDdmeUljbXJmUmhkd3hnTnRPb2ZVT3c3WVM4VlE4bG5QVmpHQzJrc2NldzVr?=
 =?utf-8?B?dHdOU0RTTU1ONkNOZkdJa0o1SmwzUS94SE02UHN6QlcyRUYvWk5NVFFwT0Z0?=
 =?utf-8?B?R2NlbkRiWkM5bGFUZzh5UDdXdnRtUFQ4QnpDUlR5MVlIa240S1VoeDdsRVlE?=
 =?utf-8?B?bWVjbGhwdE96bGpMZXF0S21GMEg3dDV6ZWQwOUJnUmVndDNjZm1UR0NpUHNX?=
 =?utf-8?B?RUJWVExkUVpYV0lSUW1PSm1vb29hU1JkRUlhdkN5Z0JhTEZlVE5TZTgwM0dr?=
 =?utf-8?B?bzhSVGJPZVBZL01PUXJScEM3T2lvNHNGMnUwQzlBSDdDa0h4RUlNT2hKVUJj?=
 =?utf-8?B?bkdNcC9nZ1JTZGF5RlQwdGJEU01UN3pZNVd2bCtHakduU1VHV3lRRWNrYnVT?=
 =?utf-8?B?dW9hdUxaUm9ZNER4bFJvbmFhdE5ZdDRTMkhEb0IxMkdpbFFCNkZabWJZODdC?=
 =?utf-8?B?UFlvSGMyTVRaN0ZDR204dzIwYUV4TlRIVk92OFUzaDlVYTljVzhTbi80c3Bx?=
 =?utf-8?B?WFlrOFc3eW9yN000YTZkcUFHaCtDeEJnVDNwbUpZcWMzWFhQVy82ckpxM2RN?=
 =?utf-8?B?TXNsU3c5TzVYdHhlWUhwVEp3QnJmS3V1d3hCUWZpRlcreXVHSFBrYW85bXlU?=
 =?utf-8?B?YXlrSHVJejVNNGJaaFdaa1JWc0ZyYm85clMyN20wUDJMRVNvaUEvUkFjRURj?=
 =?utf-8?B?ZytmNmVST2tQeEVOcURRbDdqS3FIZ2grYUdTbE1abzcydnl0Q3ViRXA5YkUz?=
 =?utf-8?B?dVFrOTdkeHVqMk9RVE5BMllzZExTTjFkVlFxODNQWFV0WEtzRmlvd0RjVi9S?=
 =?utf-8?B?T3hkZnQ1L1JyaGowQkVNY1gxQyt2bEQrTE5LbVNseU5qN3JaWW9icDZtNGxW?=
 =?utf-8?B?cS8ybk9XRXpPRkZaZ2M3VEprZUZzS2tyN2RtSFJuaVRFVEZZQ2JuNnZIWHFz?=
 =?utf-8?B?SWVzVnFDcUwxQkRPekY1SFRqbWRCYVRwczkvRTU2c3F2SGxOY2VvNnhaU1Fx?=
 =?utf-8?B?RmR2bFhPdE5mVzdsTnFjQkQyaHRNY2ZZdk9OTGU3R2l0V2V6bkZFS2JhN25K?=
 =?utf-8?B?d2lhZzdZc3FFVzJGdk1DblcxVGZVSjNnTmc3NFVBOVcwUHBTMVhQZXlhc0Zu?=
 =?utf-8?B?ZzFGcE44UFRuWGpCVnZZdUwvbGJOUkhMcmRsOGJKa3o1QkJUeUU2eDlCOGw2?=
 =?utf-8?B?SHdlYllNK2d4ZGhuZ2crYXM5QTEyM1l1SzI1bjlIK2llc0dlWGhpZCtLa09B?=
 =?utf-8?B?WnBRQ3VVc3p2TlY3bVA1RDd3Y3hxS2EvUm0wUUJKdFNjd0pVMUpJUGcyYUZl?=
 =?utf-8?B?bkxKRW8yTUhscDZ1M2pGSGNmd1VGVGdybzkrWTI5N3QxV3FCTEp4azlqanR1?=
 =?utf-8?B?UWQyQXVkeDVzY1UwS21mb0tXT2JLSldwWFlNVi9pYzNocEpBS2k2V1lsNlBo?=
 =?utf-8?B?Z3JndExuVkJCYzkrcW4rRVJOYVd0UFVHc0xseUxHUzk0Nnk0Vm1idG5UNCs5?=
 =?utf-8?B?YUFoTUw3SjYrTjZGUzNHbys2UmZXdkFndSs5YzVaMkQzK0xMVkNpZ3AxZ3NO?=
 =?utf-8?B?a29XVTFwTWlxYnliZjY0aS9ndXR4WHNtcXFaNTNWVFQyRW9iMXVDNjNMdmRl?=
 =?utf-8?B?M3JtbTdqWURmdEJ4VWhtY0IvN2ZHOHIxSFJHcVBSdnRuQTQ2RDhZQk9qMG12?=
 =?utf-8?Q?CgSfWneDQsY4R6jraX3pig1Fk?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29e9a004-b136-4051-fea7-08dac320e9e5
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2022 13:38:55.8754 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4wfUz4A+9A6KZRokvf1xq6GYZnIngnLFlQB98FGgDh+OvU8ljzsYEzKcNZZ3wjjzz4TkoI4QrxkqvVyEK0UeIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4047
Received-SPF: softfail client-ip=40.107.223.54;
 envelope-from=avihaih@nvidia.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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


On 08/11/2022 20:36, Vladimir Sementsov-Ogievskiy wrote:
> External email: Use caution opening links or attachments
>
>
> On 11/3/22 19:16, Avihai Horon wrote:
>> From: Juan Quintela <quintela@redhat.com>
>>
>> And it appears that what is wrong is the code. During bulk stage we
>> need to make sure that some block is dirty, but no games with
>> max_size at all.
>
> :) That made me interested in, why we need this one block, so I 
> decided to search through the history.
>
> And what I see? Haha, that was my commit 04636dc410b163c 
> "migration/block: fix pending() return value" [1], which you actually 
> revert with this patch.
>
> So, at least we should note, that it's a revert of [1].
>
> Still that this will reintroduce the bug fixed by [1].
>
> As I understand the problem is (was) that in block_save_complete() we 
> finalize only dirty blocks, but don't finalize the bulk phase if it's 
> not finalized yet. So, we can fix block_save_complete() to finalize 
> the bulk phase, instead of hacking with pending in [1].
>
> Interesting, why we need this one block, described in the comment you 
> refer to? Was it an incomplete workaround for the same problem, 
> described in [1]? If so, we can fix block_save_complete() and remove 
> this if() together with the comment from block_save_pending().
>
I am not familiar with block migration.
I can drop this patch in next version.

Juan/Stefan, could you help here?

>>
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>> ---
>>   migration/block.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/migration/block.c b/migration/block.c
>> index b3d680af75..39ce4003c6 100644
>> --- a/migration/block.c
>> +++ b/migration/block.c
>> @@ -879,8 +879,8 @@ static void block_save_pending(void *opaque, 
>> uint64_t max_size,
>>       blk_mig_unlock();
>>
>>       /* Report at least one block pending during bulk phase */
>> -    if (pending <= max_size && !block_mig_state.bulk_completed) {
>> -        pending = max_size + BLK_MIG_BLOCK_SIZE;
>> +    if (!pending && !block_mig_state.bulk_completed) {
>> +        pending = BLK_MIG_BLOCK_SIZE;
>>       }
>>
>>       trace_migration_block_save_pending(pending);
>
> -- 
> Best regards,
> Vladimir
>

