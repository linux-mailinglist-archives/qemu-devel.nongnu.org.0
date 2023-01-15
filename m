Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA6D66B384
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Jan 2023 19:43:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pH7y7-0000kM-PM; Sun, 15 Jan 2023 13:42:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pH7y0-0000hW-7e; Sun, 15 Jan 2023 13:42:55 -0500
Received: from mail-dm6nam10on2044.outbound.protection.outlook.com
 ([40.107.93.44] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pH7xv-0000Ff-QA; Sun, 15 Jan 2023 13:42:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FOqgE6sqTHMsBGNsCNcyQh0GDpkLxeZXt2IJswKRZX2TdwuKyHlvDxPDBobLZB0s5cTZD5Y7bDQgNbKWPKAd29itvdptDnHjrBqDayAu59v/PtCfJq5EN4owow19iSgUPOjjdUYZknfSve4ppP41oaz9Ed+Nr6o1KIl1xMSz0c6gd5BXzZhVt/GwDk5a+7EYFxRzmAxh1a1UbMuceFQ/6gwfWb4NHno+hq/2NC3gDP69mKFcYA2k/10CDNUUuUlmoMUNlBAgCTY/li0AWFIof34JZnejxMo57Z+tLgZK8BNVkpeYbVXIzhYE1ZnbbXbFWR96AeXewWusuRmNfuTEWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gpQf2pAH4Ll0h7Lx1CGvxAHTVRl5N+q+IIChTH9j+HY=;
 b=azDrbEv3Sfv8nKMV/pEiVq+8kEGqsrKx8nQo7eAYDfdHuuYUSSqyzUdkijKNiMg7anMw5ebD89qkGdg5E+vfbmV9Vu/hF3IP+BtZGjaeXo1J5f4vZ4O5EWnQpXGwuek4HcKk40nZWKdbkjQLkCO35EkQ4SHsRXvZRjXfCzHFYexj0vI6baAEWtme+KWVLRDCYH1PfSQAVWWxPW3C/624dU1wi5OLoUZkZteS1OQMkukAJaKOo4oqFT6gtSDrzoVyOrqlTctC2l3TY8njmfwSRPm3lBujEdCX6g/SZJrXU3GjKWzc3pgJW0xW0+Y3FeKdWi153UKg8aAI3dAXfmuI4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gpQf2pAH4Ll0h7Lx1CGvxAHTVRl5N+q+IIChTH9j+HY=;
 b=l0bFTTM5wF3qt+I/y8TKdXlFMv1TTB3jnwUlH9JH5OFq6cpWnMndzYLxcnYT/QbMYtxvj0rOLsWm6mxrjlcgl/ueLNoaftVSbCIMsh4Qzo1MunSABXaD8DdQT/bopLvIoFslvbpXYR2G1h6/VNEPXdyr7hwlOd8YNcSPU1ldaiYYJ98Fhq0uQsylGYb2s/Po7yCNmZxrqVP809xVlVEQNaaPqINCBig1zQfpl8y3EmwQMLq72t2gTXL7pQ9ms7GchqZwLh3dqO7x2ba/vO+2NmAEo/BHO+yZGTQDEc7KUcTrK/CpZnVEb1GnagCvdfsG6hkMuOh2ooZMGZk718yyZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by SJ0PR12MB8115.namprd12.prod.outlook.com (2603:10b6:a03:4e3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Sun, 15 Jan
 2023 18:42:40 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::451d:1f37:aa83:f425]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::451d:1f37:aa83:f425%6]) with mapi id 15.20.5986.019; Sun, 15 Jan 2023
 18:42:40 +0000
Message-ID: <fa79594c-2606-d247-3428-4be77730c656@nvidia.com>
Date: Sun, 15 Jan 2023 20:42:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v6 09/13] vfio/migration: Implement VFIO migration
 protocol v2
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>, qemu-devel@nongnu.org
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
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 John Snow <jsnow@redhat.com>, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
References: <20230112085020.15866-1-avihaih@nvidia.com>
 <20230112085020.15866-10-avihaih@nvidia.com>
 <de4cb446-c3e4-4141-0bbd-04d5be46f2ec@redhat.com>
Content-Language: en-US
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <de4cb446-c3e4-4141-0bbd-04d5be46f2ec@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0069.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::22) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB5549:EE_|SJ0PR12MB8115:EE_
X-MS-Office365-Filtering-Correlation-Id: f58578af-aa61-4150-e7fc-08daf728478c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AOTZ4nfW3aoxPS+jyi/g96r0UtVbK/JDk46RZhgrTK9WEjhQi7W3fFpKKtCWoTw6XTQpf8Koo71xP/b9r6y0cMc0woqAPMelDZ0ZbCofvHeBa0N2do2tSHb5Kqkklbht+6Bl5nDLQo2PRUQyF9YNBkvYE+8FVQf1k64/xjB23gXNQPCsw7lIQrj4PixOGM+/XWmUEHv/wJxUakdtUP5Gj+FTFOevdTCN8hMKk1JgW/VqTppi2b9JQ5Pcim+MoB5mwDJSwI2p5sj600c//XOI7V1/l/H5sNjBFq4w8FeXlT1s2N0F7WEOJCAXjtIT07MctdBLpNDiz2s2rav269c95csefvs1Tp9Wo0f4BY4TTyHzRFY/PFtJh3U228A9SFB7SFgn84fum3rU2jwsZyypPH3Fl9sun1b9SY5RM8AyMpl585f9iORA1D7ASugRI5i56a0akGJJ7Z3oDwHm92adGKhU5M84RL84JJMZqk0hSF/ZXKAz6I9Z3vxrJzGRQ11JAv7t7AYiiVFM9p90GY13eEAIScLpjC95HrNtrLOm+7BtkYj1M7ybDtT/bk0cfv8OclE73KHYeLQAA3dcjI/oUdrEAVRJPi1POCx6XJ47WYqXuM96ZIv06LIDwyS0Ic/7tMN3MjxxxPlg8nWQ9AtukDN0MoDIfb0cmPoM961hvl/xk7wKawrIAETc/1PYnFt62p0ZAwpx0PL+/T35JD0Up/DXu6SsuXinSHgSurttn0pTh2BP32mhgP55to8rw8q1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(366004)(396003)(376002)(39860400002)(451199015)(31686004)(36756003)(41300700001)(5660300002)(8936002)(86362001)(2906002)(30864003)(7416002)(31696002)(8676002)(38100700002)(478600001)(66476007)(2616005)(316002)(66946007)(4326008)(54906003)(6486002)(966005)(83380400001)(66574015)(6512007)(26005)(66556008)(53546011)(6506007)(6666004)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3ZQTE4rYVR5NWJNbFVDR05jeGxMdlRXTGdQWVp2N25jRzZ1c3VLcnJSZitl?=
 =?utf-8?B?Z3ZXNjZSUGlQUHhINEgvUW42cHQ4TFZqZjBQU2ZzZWYvem5HWHRYb1RHRzFj?=
 =?utf-8?B?Y25tMklMSUpraWZHc0hlOW5JYnY3NGZMQ3NBUWdOM3JwalVWZ1dQTVJBQm5G?=
 =?utf-8?B?Z3pmbU1mUlpRcVB0ZzlLdTNsdUxHemhzYnE1Yy9oOGZnNVdHZTNDOEJIVFl6?=
 =?utf-8?B?MjRjSE9RWnV2ZHZZREcrQVN1cnVDQjAzVWlmNWk2eWRVM1pwN0hSak5zYWtX?=
 =?utf-8?B?c2V6bjYwKyticGhhdUFId2huQ01PSnpRKytzSlp2YTNGazdCTzNUUitHQ1d2?=
 =?utf-8?B?MkJWQlZVUEdodWloR1BhM01XYzFWcFNNT1E4dGlZbGtiK09GTDh2dlEyay9p?=
 =?utf-8?B?ais5c3FtUGpJejlPYkR2Ly9FUVNiVDJLZXBMeUZnb1greWFjZXZ6SmU1bTho?=
 =?utf-8?B?ODZ0Sk1aT0pXblBoMDF2dlFZVlVtOHRCZGVYU0ZaUjB1UFJRL0Qxd0tqY3hj?=
 =?utf-8?B?SVBjT2NFcTNlV2JrbTJIaFFmLzc4di9XS2NxU0tFUkR1NXd3WDhoMmpIb3U5?=
 =?utf-8?B?NTI5UytGRzZubHZTQ3ZIK1pST1kvVlpvNktJTm5kSG55eTRUcFV5Vk9yNTc1?=
 =?utf-8?B?U0pjSmV5azU2Yk9sWjl4V0kxdzZrdGt2Lyt5MUVJSng4U3NtUkliM0kwU3U0?=
 =?utf-8?B?a281MnovOGs5dnNJT0FkaDBkdU9SV2VsY3BwQXVBNUxKb2gvWG16RkNvNXJR?=
 =?utf-8?B?b1dVNGVZV0toUitGNHNiUXhDbVFLRHZlY0QzN2FJa0VncTVPa0JjOUF6MHFv?=
 =?utf-8?B?aGIrMVZzRW1ncW1mMjBoKzdjTUlzclN2OWxaU3NXRDlqR1VKRktzdXdYWHpr?=
 =?utf-8?B?WWlpZXBEWGh5ZGUxNXNDSjZ4NjBnTDU2T2xWbmI2clNRRVlkSHRXTHFXNlVx?=
 =?utf-8?B?VWxyL2hUY2U4RVUzSDdtVzlBNVgrYUtITUdXaHJKZm4yTENzTDZhV0NtU1BL?=
 =?utf-8?B?RlEyQ1o1VE1jdWtWN3JxdTVmVFBtbWdGUmd0cjh4dm5BVFl5dlhmWExNVWh6?=
 =?utf-8?B?MCtOUVdnRDdoamN0dU9CTjBNUGRueVhaV1g1ZnpmRnFUa2padnhZRVZ2MHlQ?=
 =?utf-8?B?Zm5Nclg2Qm9CWDlHSFNEWGJwYlJyNU5GQytlVHk5cHhHcXlTcm1jd3IvcEIw?=
 =?utf-8?B?NzY0dVFNQUFWTDhIeEErVlVTaTFBSjZEUExBN0lPcW9QNnRLdjQxT05XdjNi?=
 =?utf-8?B?QkF3K0VHaHNpZXJhcW8vSEREdEdjMmxDREtzMlZGUlJGS1FTTjkwZ2tnclI2?=
 =?utf-8?B?NDZvbmlsYWNFemdQYjRxQ1ZLcTUrSmt5VWtjRE9zdW5zVjg0Uml0QWZhYS9n?=
 =?utf-8?B?MWZQOHd4YXV2a2J1SnphUlNkVUpMRHUyVnJyQzdURjhQb0M5ZjQvTnFhd1dI?=
 =?utf-8?B?MkZxSGFXd0Y2TllXeUxpYlJWZE4wTDJmM0Y2ajVTNWxVdUs5dFF4YnEvcms3?=
 =?utf-8?B?djJSYlhWZU9Xb1ZPZHNqSG9UNm50bkxPNDRMMUUzRkkxNysyZTNnV0JQZlpZ?=
 =?utf-8?B?MnRmVi9HNFRteW9Nd0h6dHNhMzNPb3Q2M29Rek9kMS9XZDRCZ0J5d21yYjI1?=
 =?utf-8?B?OUZ4MTBOcEJDWlcvL0JKUnRxMzlWTHd6bG5ZUVovcUpLZ1VaZ243Z2g0TDhL?=
 =?utf-8?B?L1VYR0haRmxvUzVOZm84dzZlQ2loZEJYSFJVaXZ0a0lvOGswbTNnNzJEc3BD?=
 =?utf-8?B?RDNZVE5vN3JCMnQzcFhtWjBiMFVSVU1adUgzMG1QTFBaaWsxSTNYWDVGVlVS?=
 =?utf-8?B?RlB5cDF4QXduVkRIRVNjRFdmWnZjZTBSazR6a2dMS3g3eVR2RC9UT3hYamNU?=
 =?utf-8?B?U0F3SVY2ckFpaUNadnovVlVoUkNLSzhYL2RiNEtyZGtZZndrVCtpYkdQUUs1?=
 =?utf-8?B?Z0dTM2JxL1NZcThjYzdtMEVDc2FUZjhDOVcwN011WklBcFZmZmNBMW11aEE1?=
 =?utf-8?B?WThQWWtjZ1dvbFRGZit0dytSOVcraVFqc2wzVWNncks4cU9MZExibHp6R2l4?=
 =?utf-8?B?RXlxS0ZDWnUyMHdVTWxuUWtwWmVCQmdhTUhWK3FZMFhxU1VmMmZFeFBvRytW?=
 =?utf-8?Q?ES7eefGDkwHE600cNo02rNRs+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f58578af-aa61-4150-e7fc-08daf728478c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2023 18:42:40.1264 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +OxAfMjKADuKPwyEzXzSITouml2LaZ1YSAuPj3zc/QdcGDX7I9TJdy9BGXXiF4kcYBOGYbcyPvphminBRtnftw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8115
Received-SPF: softfail client-ip=40.107.93.44; envelope-from=avihaih@nvidia.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
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


On 13/01/2023 18:13, Cédric Le Goater wrote:
> External email: Use caution opening links or attachments
>
>
> On 1/12/23 09:50, Avihai Horon wrote:
>> Implement the basic mandatory part of VFIO migration protocol v2.
>> This includes all functionality that is necessary to support
>> VFIO_MIGRATION_STOP_COPY part of the v2 protocol.
>>
>> The two protocols, v1 and v2, will co-exist and in the following patches
>> v1 protocol code will be removed.
>>
>> There are several main differences between v1 and v2 protocols:
>> - VFIO device state is now represented as a finite state machine instead
>>    of a bitmap.
>>
>> - Migration interface with kernel is now done using VFIO_DEVICE_FEATURE
>>    ioctl and normal read() and write() instead of the migration region.
>>
>> - Pre-copy is made optional in v2 protocol. Support for pre-copy will be
>>    added later on.
>>
>> Detailed information about VFIO migration protocol v2 and its difference
>> compared to v1 protocol can be found here [1].
>>
>> [1]
>> https://lore.kernel.org/all/20220224142024.147653-10-yishaih@nvidia.com/
>>
>> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
>
>
> LGTM,
>
> Reviewed-by: Cédric Le Goater <clg@redhat.com>
>
> Still a small issue below,
>
I have sent v7 with a fix for this.

Thanks for reviewing!

>> ---
>>   include/hw/vfio/vfio-common.h |   5 +
>>   hw/vfio/common.c              |  19 +-
>>   hw/vfio/migration.c           | 455 +++++++++++++++++++++++++++++++---
>>   hw/vfio/trace-events          |   7 +
>>   4 files changed, 447 insertions(+), 39 deletions(-)
>>
>> diff --git a/include/hw/vfio/vfio-common.h 
>> b/include/hw/vfio/vfio-common.h
>> index bbaf72ba00..2ec3346fea 100644
>> --- a/include/hw/vfio/vfio-common.h
>> +++ b/include/hw/vfio/vfio-common.h
>> @@ -66,6 +66,11 @@ typedef struct VFIOMigration {
>>       int vm_running;
>>       Notifier migration_state;
>>       uint64_t pending_bytes;
>> +    enum vfio_device_mig_state device_state;
>> +    int data_fd;
>> +    void *data_buffer;
>> +    size_t data_buffer_size;
>> +    bool v2;
>>   } VFIOMigration;
>>
>>   typedef struct VFIOAddressSpace {
>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>> index 550b2d7ded..dcaa77d2a8 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -355,10 +355,18 @@ static bool 
>> vfio_devices_all_dirty_tracking(VFIOContainer *container)
>>                   return false;
>>               }
>>
>> -            if ((vbasedev->pre_copy_dirty_page_tracking == 
>> ON_OFF_AUTO_OFF) &&
>> +            if (!migration->v2 &&
>> +                (vbasedev->pre_copy_dirty_page_tracking == 
>> ON_OFF_AUTO_OFF) &&
>>                   (migration->device_state_v1 & 
>> VFIO_DEVICE_STATE_V1_RUNNING)) {
>>                   return false;
>>               }
>> +
>> +            if (migration->v2 &&
>> +                (vbasedev->pre_copy_dirty_page_tracking == 
>> ON_OFF_AUTO_OFF) &&
>> +                (migration->device_state == 
>> VFIO_DEVICE_STATE_RUNNING ||
>> +                 migration->device_state == 
>> VFIO_DEVICE_STATE_RUNNING_P2P)) {
>> +                return false;
>> +            }
>>           }
>>       }
>>       return true;
>> @@ -385,7 +393,14 @@ static bool 
>> vfio_devices_all_running_and_mig_active(VFIOContainer *container)
>>                   return false;
>>               }
>>
>> -            if (migration->device_state_v1 & 
>> VFIO_DEVICE_STATE_V1_RUNNING) {
>> +            if (!migration->v2 &&
>> +                migration->device_state_v1 & 
>> VFIO_DEVICE_STATE_V1_RUNNING) {
>> +                continue;
>> +            }
>> +
>> +            if (migration->v2 &&
>> +                (migration->device_state == 
>> VFIO_DEVICE_STATE_RUNNING ||
>> +                 migration->device_state == 
>> VFIO_DEVICE_STATE_RUNNING_P2P)) {
>>                   continue;
>>               } else {
>>                   return false;
>> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
>> index 9df859f4d3..08f53189fa 100644
>> --- a/hw/vfio/migration.c
>> +++ b/hw/vfio/migration.c
>> @@ -10,6 +10,7 @@
>>   #include "qemu/osdep.h"
>>   #include "qemu/main-loop.h"
>>   #include "qemu/cutils.h"
>> +#include "qemu/units.h"
>>   #include <linux/vfio.h>
>>   #include <sys/ioctl.h>
>>
>> @@ -44,8 +45,103 @@
>>   #define VFIO_MIG_FLAG_DEV_SETUP_STATE (0xffffffffef100003ULL)
>>   #define VFIO_MIG_FLAG_DEV_DATA_STATE (0xffffffffef100004ULL)
>>
>> +/*
>> + * This is an arbitrary size based on migration of mlx5 devices, 
>> where typically
>> + * total device migration size is on the order of 100s of MB. 
>> Testing with
>> + * larger values, e.g. 128MB and 1GB, did not show a performance 
>> improvement.
>> + */
>> +#define VFIO_MIG_DEFAULT_DATA_BUFFER_SIZE (1 * MiB)
>> +
>>   static int64_t bytes_transferred;
>>
>> +static const char *mig_state_to_str(enum vfio_device_mig_state state)
>> +{
>> +    switch (state) {
>> +    case VFIO_DEVICE_STATE_ERROR:
>> +        return "ERROR";
>> +    case VFIO_DEVICE_STATE_STOP:
>> +        return "STOP";
>> +    case VFIO_DEVICE_STATE_RUNNING:
>> +        return "RUNNING";
>> +    case VFIO_DEVICE_STATE_STOP_COPY:
>> +        return "STOP_COPY";
>> +    case VFIO_DEVICE_STATE_RESUMING:
>> +        return "RESUMING";
>> +    case VFIO_DEVICE_STATE_RUNNING_P2P:
>> +        return "RUNNING_P2P";
>> +    default:
>> +        return "UNKNOWN STATE";
>> +    }
>> +}
>> +
>> +static int vfio_migration_set_state(VFIODevice *vbasedev,
>> +                                    enum vfio_device_mig_state 
>> new_state,
>> +                                    enum vfio_device_mig_state 
>> recover_state)
>> +{
>> +    VFIOMigration *migration = vbasedev->migration;
>> +    uint64_t buf[DIV_ROUND_UP(sizeof(struct vfio_device_feature) +
>> +                              sizeof(struct 
>> vfio_device_feature_mig_state),
>> +                              sizeof(uint64_t))] = {};
>> +    struct vfio_device_feature *feature = (struct 
>> vfio_device_feature *)buf;
>> +    struct vfio_device_feature_mig_state *mig_state =
>> +        (struct vfio_device_feature_mig_state *)feature->data;
>> +
>> +    feature->argsz = sizeof(buf);
>> +    feature->flags =
>> +        VFIO_DEVICE_FEATURE_SET | VFIO_DEVICE_FEATURE_MIG_DEVICE_STATE;
>> +    mig_state->device_state = new_state;
>> +    if (ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature)) {
>> +        /* Try to set the device in some good state */
>> +        int err = -errno;
>> +
>> +        error_report(
>> +            "%s: Failed setting device state to %s, err: %s. Setting 
>> device in recover state %s",
>> +                     vbasedev->name, mig_state_to_str(new_state),
>> +                     strerror(errno), mig_state_to_str(recover_state));
>> +
>> +        mig_state->device_state = recover_state;
>> +        if (ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature)) {
>> +            err = -errno;
>> +            error_report(
>> +                "%s: Failed setting device in recover state, err: 
>> %s. Resetting device",
>> +                         vbasedev->name, strerror(errno));
>> +
>> +            if (ioctl(vbasedev->fd, VFIO_DEVICE_RESET)) {
>> +                hw_error("%s: Failed resetting device, err: %s", 
>> vbasedev->name,
>> +                         strerror(errno));
>> +            }
>> +
>> +            migration->device_state = VFIO_DEVICE_STATE_RUNNING;
>> +
>> +            return err;
>> +        }
>> +
>> +        migration->device_state = recover_state;
>> +
>> +        return err;
>> +    }
>> +
>> +    migration->device_state = new_state;
>> +    if (mig_state->data_fd != -1) {
>> +        if (migration->data_fd != -1) {
>> +            /*
>> +             * This can happen if the device is asynchronously reset 
>> and
>> +             * terminates a data transfer.
>> +             */
>> +            error_report("%s: data_fd out of sync", vbasedev->name);
>> +            close(mig_state->data_fd);
>> +
>> +            return -EBADF;
>> +        }
>> +
>> +        migration->data_fd = mig_state->data_fd;
>> +    }
>> +
>> +    trace_vfio_migration_set_state(vbasedev->name, 
>> mig_state_to_str(new_state));
>> +
>> +    return 0;
>> +}
>> +
>>   static inline int vfio_mig_access(VFIODevice *vbasedev, void *val, 
>> int count,
>>                                     off_t off, bool iswrite)
>>   {
>> @@ -260,6 +356,18 @@ static int vfio_save_buffer(QEMUFile *f, 
>> VFIODevice *vbasedev, uint64_t *size)
>>       return ret;
>>   }
>>
>> +static int vfio_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
>> +                            uint64_t data_size)
>> +{
>> +    VFIOMigration *migration = vbasedev->migration;
>> +    int ret;
>> +
>> +    ret = qemu_file_get_to_fd(f, migration->data_fd, data_size);
>> +    trace_vfio_load_state_device_data(vbasedev->name, data_size, ret);
>> +
>> +    return ret;
>> +}
>> +
>>   static int vfio_v1_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
>>                                  uint64_t data_size)
>>   {
>> @@ -394,6 +502,14 @@ static int 
>> vfio_load_device_config_state(QEMUFile *f, void *opaque)
>>       return qemu_file_get_error(f);
>>   }
>>
>> +static void vfio_migration_cleanup(VFIODevice *vbasedev)
>> +{
>> +    VFIOMigration *migration = vbasedev->migration;
>> +
>> +    close(migration->data_fd);
>> +    migration->data_fd = -1;
>> +}
>> +
>>   static void vfio_migration_v1_cleanup(VFIODevice *vbasedev)
>>   {
>>       VFIOMigration *migration = vbasedev->migration;
>> @@ -403,8 +519,80 @@ static void vfio_migration_v1_cleanup(VFIODevice 
>> *vbasedev)
>>       }
>>   }
>>
>> +static int vfio_query_stop_copy_size(VFIODevice *vbasedev,
>> +                                     uint64_t *stop_copy_size)
>> +{
>> +    uint64_t buf[DIV_ROUND_UP(sizeof(struct vfio_device_feature) +
>> +                              sizeof(struct 
>> vfio_device_feature_mig_data_size),
>> +                              sizeof(uint64_t))] = {};
>> +    struct vfio_device_feature *feature = (struct 
>> vfio_device_feature *)buf;
>> +    struct vfio_device_feature_mig_data_size *mig_data_size =
>> +        (struct vfio_device_feature_mig_data_size *)feature->data;
>> +
>> +    feature->argsz = sizeof(buf);
>> +    feature->flags =
>> +        VFIO_DEVICE_FEATURE_GET | VFIO_DEVICE_FEATURE_MIG_DATA_SIZE;
>> +
>> +    if (ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature)) {
>> +        return -errno;
>> +    }
>> +
>> +    *stop_copy_size = mig_data_size->stop_copy_length;
>> +
>> +    return 0;
>> +}
>> +
>> +/* Returns 1 if end-of-stream is reached, 0 if more data and -1 if 
>> error */
>> +static int vfio_save_block(QEMUFile *f, VFIOMigration *migration)
>> +{
>> +    ssize_t data_size;
>> +
>> +    data_size = read(migration->data_fd, migration->data_buffer,
>> +                     migration->data_buffer_size);
>> +    if (data_size < 0) {
>> +        return -errno;
>> +    }
>> +    if (data_size == 0) {
>> +        return 1;
>> +    }
>> +
>> +    qemu_put_be64(f, VFIO_MIG_FLAG_DEV_DATA_STATE);
>> +    qemu_put_be64(f, data_size);
>> +    qemu_put_buffer(f, migration->data_buffer, data_size);
>> +    bytes_transferred += data_size;
>> +
>> +    trace_vfio_save_block(migration->vbasedev->name, data_size);
>> +
>> +    return qemu_file_get_error(f);
>> +}
>> +
>>   /* 
>> ---------------------------------------------------------------------- 
>> */
>>
>> +static int vfio_save_setup(QEMUFile *f, void *opaque)
>> +{
>> +    VFIODevice *vbasedev = opaque;
>> +    VFIOMigration *migration = vbasedev->migration;
>> +    uint64_t stop_copy_size = VFIO_MIG_DEFAULT_DATA_BUFFER_SIZE;
>> +
>> +    qemu_put_be64(f, VFIO_MIG_FLAG_DEV_SETUP_STATE);
>> +
>> +    vfio_query_stop_copy_size(vbasedev, &stop_copy_size);
>> +    migration->data_buffer_size = 
>> MIN(VFIO_MIG_DEFAULT_DATA_BUFFER_SIZE,
>> +                                      stop_copy_size);
>> +    migration->data_buffer = 
>> g_try_malloc0(migration->data_buffer_size);
>> +    if (!migration->data_buffer) {
>> +        error_report("%s: Failed to allocate migration data buffer",
>> +                     vbasedev->name);
>> +        return -ENOMEM;
>> +    }
>> +
>> +    trace_vfio_save_setup(vbasedev->name, migration->data_buffer_size);
>> +
>> +    qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
>> +
>> +    return qemu_file_get_error(f);
>> +}
>> +
>>   static int vfio_v1_save_setup(QEMUFile *f, void *opaque)
>>   {
>>       VFIODevice *vbasedev = opaque;
>> @@ -448,6 +636,17 @@ static int vfio_v1_save_setup(QEMUFile *f, void 
>> *opaque)
>>       return 0;
>>   }
>>
>> +static void vfio_save_cleanup(void *opaque)
>> +{
>> +    VFIODevice *vbasedev = opaque;
>> +    VFIOMigration *migration = vbasedev->migration;
>> +
>> +    g_free(migration->data_buffer);
>> +    migration->data_buffer = NULL;
>> +    vfio_migration_cleanup(vbasedev);
>> +    trace_vfio_save_cleanup(vbasedev->name);
>> +}
>> +
>>   static void vfio_v1_save_cleanup(void *opaque)
>>   {
>>       VFIODevice *vbasedev = opaque;
>> @@ -456,6 +655,31 @@ static void vfio_v1_save_cleanup(void *opaque)
>>       trace_vfio_save_cleanup(vbasedev->name);
>>   }
>>
>> +/*
>> + * Migration size of VFIO devices can be as little as a few KBs or 
>> as big as
>> + * many GBs. This value should be big enough to cover the worst case.
>> + */
>> +#define VFIO_MIG_STOP_COPY_SIZE (100 * GiB)
>> +static void vfio_save_pending(void *opaque, uint64_t threshold_size,
>> +                              uint64_t *res_precopy_only,
>> +                              uint64_t *res_compatible,
>> +                              uint64_t *res_postcopy_only)
>> +{
>> +    VFIODevice *vbasedev = opaque;
>> +    uint64_t stop_copy_size = VFIO_MIG_STOP_COPY_SIZE;
>> +
>> +    /*
>> +     * If getting pending migration size fails, 
>> VFIO_MIG_STOP_COPY_SIZE is
>> +     * reported so downtime limit won't be violated.
>> +     */
>> +    vfio_query_stop_copy_size(vbasedev, &stop_copy_size);
>> +    *res_precopy_only += stop_copy_size;
>> +
>> +    trace_vfio_save_pending(vbasedev->name, *res_precopy_only,
>> +                            *res_postcopy_only, *res_compatible,
>> +                            stop_copy_size);
>> +}
>> +
>>   static void vfio_v1_save_pending(void *opaque, uint64_t 
>> threshold_size,
>>                                    uint64_t *res_precopy_only,
>>                                    uint64_t *res_compatible,
>> @@ -523,6 +747,41 @@ static int vfio_save_iterate(QEMUFile *f, void 
>> *opaque)
>>       return 0;
>>   }
>>
>> +static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
>> +{
>> +    VFIODevice *vbasedev = opaque;
>> +    enum vfio_device_mig_state recover_state;
>> +    int ret;
>> +
>> +    /* We reach here with device state STOP only */
>> +    recover_state = VFIO_DEVICE_STATE_STOP;
>> +    ret = vfio_migration_set_state(vbasedev, 
>> VFIO_DEVICE_STATE_STOP_COPY,
>> +                                   recover_state);
>> +    if (ret) {
>> +        return ret;
>> +    }
>> +
>> +    do {
>> +        ret = vfio_save_block(f, vbasedev->migration);
>> +        if (ret < 0) {
>> +            return ret;
>> +        }
>> +    } while (!ret);
>> +
>> +    qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
>> +    ret = qemu_file_get_error(f);
>> +    if (ret) {
>> +        return ret;
>> +    }
>> +
>> +    recover_state = VFIO_DEVICE_STATE_ERROR;
>> +    ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_STOP,
>> +                                   recover_state);
>> +    trace_vfio_save_complete_precopy(vbasedev->name, ret);
>> +
>> +    return ret;
>> +}
>> +
>>   static int vfio_v1_save_complete_precopy(QEMUFile *f, void *opaque)
>>   {
>>       VFIODevice *vbasedev = opaque;
>> @@ -592,6 +851,14 @@ static void vfio_save_state(QEMUFile *f, void 
>> *opaque)
>>       }
>>   }
>>
>> +static int vfio_load_setup(QEMUFile *f, void *opaque)
>> +{
>> +    VFIODevice *vbasedev = opaque;
>> +
>> +    return vfio_migration_set_state(vbasedev, 
>> VFIO_DEVICE_STATE_RESUMING,
>> + vbasedev->migration->device_state);
>> +}
>> +
>>   static int vfio_v1_load_setup(QEMUFile *f, void *opaque)
>>   {
>>       VFIODevice *vbasedev = opaque;
>> @@ -619,6 +886,16 @@ static int vfio_v1_load_setup(QEMUFile *f, void 
>> *opaque)
>>       return ret;
>>   }
>>
>> +static int vfio_load_cleanup(void *opaque)
>> +{
>> +    VFIODevice *vbasedev = opaque;
>> +
>> +    vfio_migration_cleanup(vbasedev);
>> +    trace_vfio_load_cleanup(vbasedev->name);
>> +
>> +    return 0;
>> +}
>> +
>>   static int vfio_v1_load_cleanup(void *opaque)
>>   {
>>       VFIODevice *vbasedev = opaque;
>> @@ -661,7 +938,11 @@ static int vfio_load_state(QEMUFile *f, void 
>> *opaque, int version_id)
>>               uint64_t data_size = qemu_get_be64(f);
>>
>>               if (data_size) {
>> -                ret = vfio_v1_load_buffer(f, vbasedev, data_size);
>> +                if (vbasedev->migration->v2) {
>> +                    ret = vfio_load_buffer(f, vbasedev, data_size);
>> +                } else {
>> +                    ret = vfio_v1_load_buffer(f, vbasedev, data_size);
>> +                }
>>                   if (ret < 0) {
>>                       return ret;
>>                   }
>> @@ -682,6 +963,17 @@ static int vfio_load_state(QEMUFile *f, void 
>> *opaque, int version_id)
>>       return ret;
>>   }
>>
>> +static const SaveVMHandlers savevm_vfio_handlers = {
>> +    .save_setup = vfio_save_setup,
>> +    .save_cleanup = vfio_save_cleanup,
>> +    .save_live_pending = vfio_save_pending,
>> +    .save_live_complete_precopy = vfio_save_complete_precopy,
>> +    .save_state = vfio_save_state,
>> +    .load_setup = vfio_load_setup,
>> +    .load_cleanup = vfio_load_cleanup,
>> +    .load_state = vfio_load_state,
>> +};
>> +
>>   static SaveVMHandlers savevm_vfio_v1_handlers = {
>>       .save_setup = vfio_v1_save_setup,
>>       .save_cleanup = vfio_v1_save_cleanup,
>> @@ -696,6 +988,34 @@ static SaveVMHandlers savevm_vfio_v1_handlers = {
>>
>>   /* 
>> ---------------------------------------------------------------------- 
>> */
>>
>> +static void vfio_vmstate_change(void *opaque, bool running, RunState 
>> state)
>> +{
>> +    VFIODevice *vbasedev = opaque;
>> +    enum vfio_device_mig_state new_state;
>> +    int ret;
>> +
>> +    if (running) {
>> +        new_state = VFIO_DEVICE_STATE_RUNNING;
>> +    } else {
>> +        new_state = VFIO_DEVICE_STATE_STOP;
>> +    }
>> +
>> +    ret = vfio_migration_set_state(vbasedev, new_state,
>> +                                   VFIO_DEVICE_STATE_ERROR);
>> +    if (ret) {
>> +        /*
>> +         * Migration should be aborted in this case, but 
>> vm_state_notify()
>> +         * currently does not support reporting failures.
>> +         */
>> +        if (migrate_get_current()->to_dst_file) {
>> + qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
>> +        }
>> +    }
>> +
>> +    trace_vfio_vmstate_change(vbasedev->name, running, 
>> RunState_str(state),
>> +                              mig_state_to_str(new_state));
>> +}
>> +
>>   static void vfio_v1_vmstate_change(void *opaque, bool running, 
>> RunState state)
>>   {
>>       VFIODevice *vbasedev = opaque;
>> @@ -769,12 +1089,17 @@ static void 
>> vfio_migration_state_notifier(Notifier *notifier, void *data)
>>       case MIGRATION_STATUS_CANCELLED:
>>       case MIGRATION_STATUS_FAILED:
>>           bytes_transferred = 0;
>> -        ret = vfio_migration_v1_set_state(vbasedev,
>> - ~(VFIO_DEVICE_STATE_V1_SAVING |
>> - VFIO_DEVICE_STATE_V1_RESUMING),
>> - VFIO_DEVICE_STATE_V1_RUNNING);
>> -        if (ret) {
>> -            error_report("%s: Failed to set state RUNNING", 
>> vbasedev->name);
>> +        if (migration->v2) {
>> +            vfio_migration_set_state(vbasedev, 
>> VFIO_DEVICE_STATE_RUNNING,
>> +                                     VFIO_DEVICE_STATE_ERROR);
>> +        } else {
>> +            ret = vfio_migration_v1_set_state(vbasedev,
>> + ~(VFIO_DEVICE_STATE_V1_SAVING |
>> + VFIO_DEVICE_STATE_V1_RESUMING),
>> + VFIO_DEVICE_STATE_V1_RUNNING);
>> +            if (ret) {
>> +                error_report("%s: Failed to set state RUNNING", 
>> vbasedev->name);
>> +            }
>>           }
>>       }
>>   }
>> @@ -783,12 +1108,42 @@ static void vfio_migration_exit(VFIODevice 
>> *vbasedev)
>>   {
>>       VFIOMigration *migration = vbasedev->migration;
>>
>> -    vfio_region_exit(&migration->region);
>> -    vfio_region_finalize(&migration->region);
>> +    if (!migration->v2) {
>> +        vfio_region_exit(&migration->region);
>> +        vfio_region_finalize(&migration->region);
>> +    }
>>       g_free(vbasedev->migration);
>>       vbasedev->migration = NULL;
>>   }
>>
>> +static int vfio_migration_query_flags(VFIODevice *vbasedev, uint64_t 
>> *mig_flags)
>> +{
>> +    uint64_t buf[DIV_ROUND_UP(sizeof(struct vfio_device_feature) +
>> +                                  sizeof(struct 
>> vfio_device_feature_migration),
>> +                              sizeof(uint64_t))] = {};
>> +    struct vfio_device_feature *feature = (struct 
>> vfio_device_feature *)buf;
>> +    struct vfio_device_feature_migration *mig =
>> +        (struct vfio_device_feature_migration *)feature->data;
>> +
>> +    feature->argsz = sizeof(buf);
>> +    feature->flags = VFIO_DEVICE_FEATURE_GET | 
>> VFIO_DEVICE_FEATURE_MIGRATION;
>> +    if (ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature)) {
>> +        if (errno == ENOTTY) {
>> +            error_report("%s: VFIO migration is not supported in 
>> kernel",
>> +                         vbasedev->name);
>> +        } else {
>> +            error_report("%s: Failed to query VFIO migration 
>> support, err: %s",
>> +                         vbasedev->name, strerror(errno));
>> +        }
>> +
>> +        return -errno;
>> +    }
>> +
>> +    *mig_flags = mig->flags;
>> +
>> +    return 0;
>> +}
>> +
>>   static int vfio_migration_init(VFIODevice *vbasedev)
>>   {
>>       int ret;
>> @@ -797,6 +1152,7 @@ static int vfio_migration_init(VFIODevice 
>> *vbasedev)
>>       char id[256] = "";
>>       g_autofree char *path = NULL, *oid = NULL;
>>       struct vfio_region_info *info;
>> +    uint64_t mig_flags;
>
> GCC 12 reports :
>
>   ../hw/vfio/migration.c: In function ‘vfio_migration_init’:
>   ../hw/vfio/migration.c:1170:25: error: ‘mig_flags’ may be used 
> uninitialized [-Werror=maybe-uninitialized]
>    1170 |         if (!(mig_flags & VFIO_MIGRATION_STOP_COPY)) {
>         |              ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
>   ../hw/vfio/migration.c:1155:14: note: ‘mig_flags’ was declared here
>    1155 |     uint64_t mig_flags;
>         |              ^~~~~~~~~
>   cc1: all warnings being treated as errors
>
> You will need a little fix for that. May be it can be done at merge 
> time :
>
> -    uint64_t mig_flags;
> +    uint64_t mig_flags = 0;
>
> Thanks,
>
> C.
>
>>
>>       if (!vbasedev->ops->vfio_get_object) {
>>           return -EINVAL;
>> @@ -807,34 +1163,50 @@ static int vfio_migration_init(VFIODevice 
>> *vbasedev)
>>           return -EINVAL;
>>       }
>>
>> -    ret = vfio_get_dev_region_info(vbasedev,
>> - VFIO_REGION_TYPE_MIGRATION_DEPRECATED,
>> - VFIO_REGION_SUBTYPE_MIGRATION_DEPRECATED,
>> -                                   &info);
>> -    if (ret) {
>> -        return ret;
>> -    }
>> +    ret = vfio_migration_query_flags(vbasedev, &mig_flags);
>> +    if (!ret) {
>> +        /* Migration v2 */
>> +        /* Basic migration functionality must be supported */
>> +        if (!(mig_flags & VFIO_MIGRATION_STOP_COPY)) {
>> +            return -EOPNOTSUPP;
>> +        }
>> +        vbasedev->migration = g_new0(VFIOMigration, 1);
>> +        vbasedev->migration->device_state = VFIO_DEVICE_STATE_RUNNING;
>> +        vbasedev->migration->data_fd = -1;
>> +        vbasedev->migration->v2 = true;
>> +    } else if (ret == -ENOTTY) {
>> +        /* Migration v1 */
>> +        ret = vfio_get_dev_region_info(vbasedev,
>> + VFIO_REGION_TYPE_MIGRATION_DEPRECATED,
>> + VFIO_REGION_SUBTYPE_MIGRATION_DEPRECATED,
>> +                                       &info);
>> +        if (ret) {
>> +            return ret;
>> +        }
>>
>> -    vbasedev->migration = g_new0(VFIOMigration, 1);
>> -    vbasedev->migration->device_state_v1 = 
>> VFIO_DEVICE_STATE_V1_RUNNING;
>> -    vbasedev->migration->vm_running = runstate_is_running();
>> +        vbasedev->migration = g_new0(VFIOMigration, 1);
>> +        vbasedev->migration->device_state_v1 = 
>> VFIO_DEVICE_STATE_V1_RUNNING;
>> +        vbasedev->migration->vm_running = runstate_is_running();
>>
>> -    ret = vfio_region_setup(obj, vbasedev, 
>> &vbasedev->migration->region,
>> -                            info->index, "migration");
>> -    if (ret) {
>> -        error_report("%s: Failed to setup VFIO migration region %d: 
>> %s",
>> -                     vbasedev->name, info->index, strerror(-ret));
>> -        goto err;
>> -    }
>> +        ret = vfio_region_setup(obj, vbasedev, 
>> &vbasedev->migration->region,
>> +                                info->index, "migration");
>> +        if (ret) {
>> +            error_report("%s: Failed to setup VFIO migration region 
>> %d: %s",
>> +                         vbasedev->name, info->index, strerror(-ret));
>> +            goto err;
>> +        }
>>
>> -    if (!vbasedev->migration->region.size) {
>> -        error_report("%s: Invalid zero-sized VFIO migration region %d",
>> -                     vbasedev->name, info->index);
>> -        ret = -EINVAL;
>> -        goto err;
>> -    }
>> +        if (!vbasedev->migration->region.size) {
>> +            error_report("%s: Invalid zero-sized VFIO migration 
>> region %d",
>> +                         vbasedev->name, info->index);
>> +            ret = -EINVAL;
>> +            goto err;
>> +        }
>>
>> -    g_free(info);
>> +        g_free(info);
>> +    } else {
>> +        return ret;
>> +    }
>>
>>       migration = vbasedev->migration;
>>       migration->vbasedev = vbasedev;
>> @@ -847,11 +1219,20 @@ static int vfio_migration_init(VFIODevice 
>> *vbasedev)
>>       }
>>       strpadcpy(id, sizeof(id), path, '\0');
>>
>> -    register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1,
>> -                         &savevm_vfio_v1_handlers, vbasedev);
>> +    if (migration->v2) {
>> +        register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1,
>> +                             &savevm_vfio_handlers, vbasedev);
>> +
>> +        migration->vm_state = qdev_add_vm_change_state_handler(
>> +            vbasedev->dev, vfio_vmstate_change, vbasedev);
>> +    } else {
>> +        register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1,
>> +                             &savevm_vfio_v1_handlers, vbasedev);
>> +
>> +        migration->vm_state = qdev_add_vm_change_state_handler(
>> +            vbasedev->dev, vfio_v1_vmstate_change, vbasedev);
>> +    }
>>
>> -    migration->vm_state = qdev_add_vm_change_state_handler(
>> -        vbasedev->dev, vfio_v1_vmstate_change, vbasedev);
>>       migration->migration_state.notify = vfio_migration_state_notifier;
>> add_migration_state_change_notifier(&migration->migration_state);
>>       return 0;
>> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
>> index 9eb9aff295..e7b3b4658c 100644
>> --- a/hw/vfio/trace-events
>> +++ b/hw/vfio/trace-events
>> @@ -149,20 +149,27 @@ vfio_display_edid_write_error(void) ""
>>
>>   # migration.c
>>   vfio_migration_probe(const char *name) " (%s)"
>> +vfio_migration_set_state(const char *name, const char *state) " (%s) 
>> state %s"
>>   vfio_migration_v1_set_state(const char *name, uint32_t state) " 
>> (%s) state %d"
>> +vfio_vmstate_change(const char *name, int running, const char 
>> *reason, const char *dev_state) " (%s) running %d reason %s device 
>> state %s"
>>   vfio_v1_vmstate_change(const char *name, int running, const char 
>> *reason, uint32_t dev_state) " (%s) running %d reason %s device state 
>> %d"
>>   vfio_migration_state_notifier(const char *name, const char *state) 
>> " (%s) state %s"
>> +vfio_save_setup(const char *name, uint64_t data_buffer_size) " (%s) 
>> data buffer size 0x%"PRIx64
>>   vfio_v1_save_setup(const char *name) " (%s)"
>>   vfio_save_cleanup(const char *name) " (%s)"
>>   vfio_save_buffer(const char *name, uint64_t data_offset, uint64_t 
>> data_size, uint64_t pending) " (%s) Offset 0x%"PRIx64" size 
>> 0x%"PRIx64" pending 0x%"PRIx64
>>   vfio_update_pending(const char *name, uint64_t pending) " (%s) 
>> pending 0x%"PRIx64
>>   vfio_save_device_config_state(const char *name) " (%s)"
>> +vfio_save_pending(const char *name, uint64_t precopy, uint64_t 
>> postcopy, uint64_t compatible, uint64_t stopcopy_size) " (%s) precopy 
>> 0x%"PRIx64" postcopy 0x%"PRIx64" compatible 0x%"PRIx64" stopcopy size 
>> 0x%"PRIx64
>>   vfio_v1_save_pending(const char *name, uint64_t precopy, uint64_t 
>> postcopy, uint64_t compatible) " (%s) precopy 0x%"PRIx64" postcopy 
>> 0x%"PRIx64" compatible 0x%"PRIx64
>>   vfio_save_iterate(const char *name, int data_size) " (%s) data_size 
>> %d"
>> +vfio_save_complete_precopy(const char *name, int ret) " (%s) ret %d"
>>   vfio_v1_save_complete_precopy(const char *name) " (%s)"
>>   vfio_load_device_config_state(const char *name) " (%s)"
>>   vfio_load_state(const char *name, uint64_t data) " (%s) data 
>> 0x%"PRIx64
>>   vfio_v1_load_state_device_data(const char *name, uint64_t 
>> data_offset, uint64_t data_size) " (%s) Offset 0x%"PRIx64" size 
>> 0x%"PRIx64
>> +vfio_load_state_device_data(const char *name, uint64_t data_size, 
>> int ret) " (%s) size 0x%"PRIx64" ret %d"
>>   vfio_load_cleanup(const char *name) " (%s)"
>>   vfio_get_dirty_bitmap(int fd, uint64_t iova, uint64_t size, 
>> uint64_t bitmap_size, uint64_t start) "container fd=%d, 
>> iova=0x%"PRIx64" size= 0x%"PRIx64" bitmap_size=0x%"PRIx64" 
>> start=0x%"PRIx64
>>   vfio_iommu_map_dirty_notify(uint64_t iova_start, uint64_t iova_end) 
>> "iommu dirty @ 0x%"PRIx64" - 0x%"PRIx64
>> +vfio_save_block(const char *name, int data_size) " (%s) data_size %d"
>

