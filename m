Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5C3624391
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 14:48:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot7uN-0000z6-N8; Thu, 10 Nov 2022 08:47:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1ot7uK-0000xv-Rl; Thu, 10 Nov 2022 08:47:53 -0500
Received: from mail-co1nam11on2057.outbound.protection.outlook.com
 ([40.107.220.57] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1ot7uJ-0006MX-2h; Thu, 10 Nov 2022 08:47:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PC7hGHOINm7Z54aZ5JLRqiF4c8zXzdvP5yxo8v1r4oeGJ3u1J4XHkYdtGP1Y67sHBNTT3Sa7v7WDm7bu37w+zFoKgYQ0WAZQgmyB4RJup7wHlX3/GAZzeaWozyQT+6plW9mCiyVl8ZJpe5Zpad87gOhHV0JCBw0vhXL4Csgbd28pKXj0Ry39LJTw95zV/T8NlLD56tAhCvgxSIyfVKb2J5cATHewj1oq4KBngHWDvg3HAINgkS38s45psPWQB63nEcbbuz4HpdM5guFpOKFzN7AOUWEyF+amCUxbPFtxMHB7Z1diIsWiks0RRmjvQ3sJk2e0b8D7GTi4SFOq/DmDLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kh75Wf0s20mvr9JsptsiagBDr+YJHKFl6NGVIUDfSVg=;
 b=IEaBJTIziEMzGVB+wnwIM/v1ev0EdrobSe3mgSqW5T2a+rbpQfFfZZeLjGdPT8iClvfXo7E9JqEDGg3LW6b2GXjCYlnkMQW+goFpRU1CRs3yhK7+JfBQZNkz0A27Ik+e8W52o31KICIFh2VFJrnfiwcdBYQh0SM31oBbP5ZxnFNLMvj/DiN4mUCRaWZUuLX2go/4bc9pUBezh1no9XEJHrbsLyobpn6Eyzb0ge0cYlrW4fnH7o0rGObiVlJ39mb9WWL7RaA82h8e/a/YVDdeYLzPjZbT0tDmhOnCJovimmqUC18cbdqwGEoHMrskMCrawi9hth0/zVqZXhYBxdhtww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kh75Wf0s20mvr9JsptsiagBDr+YJHKFl6NGVIUDfSVg=;
 b=UcWKcMPTOTPhD9+4sseTW63PRiKEZ1qzjvOU/DBOxQUvy4u8IT1MVQp5qyX7Nj6WFQ8QhxkxmFMZUaMMTeb3pU3bpd7b5wx2WszHBZOWYU6e0yQv0OjNCydyYySgt0NcoZ1r0uaGYls4xcZqtqJxqK1+VlqLekt3uIM/7Uak2bpnZA5rYnsFm5EDL64F6/MRuAazuujZkX32zFw5Q1PVKWt4T18+9oWMuPokr0wbwANs1Ce6CH95sEZdV5icMdc7cXe0eu4qsmXz8q2sA0++yqvPb4HIkqUKvrNvGmjwFH3ZakKRw/bnu+by8wQoyrw3zQXfXNb3lnDV+M8vY66wuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by SN7PR12MB8130.namprd12.prod.outlook.com (2603:10b6:806:32e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.12; Thu, 10 Nov
 2022 13:47:46 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::53a7:afdb:d6d0:f167]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::53a7:afdb:d6d0:f167%9]) with mapi id 15.20.5813.013; Thu, 10 Nov 2022
 13:47:46 +0000
Message-ID: <4922e3a3-87d1-0d98-1bcc-cf6719311612@nvidia.com>
Date: Thu, 10 Nov 2022 15:47:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v3 05/17] vfio/migration: Fix wrong enum usage
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
 <20221103161620.13120-6-avihaih@nvidia.com>
 <36c8d807-24f0-cd60-9366-4f7d64d96ddd@yandex-team.ru>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <36c8d807-24f0-cd60-9366-4f7d64d96ddd@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0104.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::19) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB5549:EE_|SN7PR12MB8130:EE_
X-MS-Office365-Filtering-Correlation-Id: 524c876c-4afe-4434-1b65-08dac3222612
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kS4AvwnQNjm4SLpHJ4cowDVJTAovBeZdWdstJ7sCO9B+ojndE6jiSYH5qZcCdfwtHcbjJ3lqqp26GhEJNCjCxIshxJzy3uaXRaXc3muSc2IqgVnkQrEVwmFdf+aF/AEHpnV/qoE01HTYn3u0Rkvux6I2wAgOJvcJRJHHDjIYJ+seYFFb3m3yNSdV5/rpyZ/qMSfsjvPIbHz/UHn5A4UE3Ck8pN7seMdYxYisYyqHX8ZOaQKEgQrP81V1ZWIzB+t9oia3erVaXJ9xI3kBXPT4tGfq2je3v/gkW4z5ynZaZRC+vtVO/V5G/oIhZj0FVjmMUuqHScGxtWoipMu2aUlX0/xkUJEs/rOJDDoBstWc2qpvKOOl/7gEP71H6cgRHIE/cwRWfaUumbVjpipGWynDgJ1EfAYixzHSCZg44etKS327f77Rpk5Sfip3ZKBgSXz57beSOGvP6dMLOKxEetculfG0mZ6ZBxq/PGorRTCxoem0Z6ljlUwUnSDOdice4coa8GWbI9pxoRv8uZQE9UY8nKXMzvmMwrtshJS+AOw8O/dGxXkIqFgNzrqBq1MFhs7rCQzfIkphmAbbARgCr17PkBhMVgW5U/IJcjORmqneM8nuEw/MHJRxesIdZ1t9gGeNCbLbsUzWGBLAdNeLb3+O3YtTbEAfgQToqcR3G8+zXDX96HBPZ6MjiZOmnFd0EaxKlYx4dcqXtNYrljzguLxImFC+atdy2EP9zhEADGSbBop+jgWsfHOAjytEbx2Ez7VEDe5VeOMlUDgdbJy+ldgcJUeE1q6SgVlzaD2MIDpGBHY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(346002)(39860400002)(376002)(366004)(451199015)(41300700001)(316002)(86362001)(6666004)(31696002)(54906003)(66946007)(66476007)(6512007)(66556008)(26005)(53546011)(8676002)(4326008)(6506007)(36756003)(38100700002)(6486002)(2906002)(8936002)(186003)(4744005)(478600001)(5660300002)(2616005)(7416002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3VKdThWVFlCdEFVUXBFOGNmWUdkS0ZPQ3N5Zk43TDRFUW8wSTVNSlhlekxZ?=
 =?utf-8?B?V0lldERKcWdUY3BWZ2FFMXJGY1BFOHlyMTAzcCtiQ1pvRlFZWVhVSlRyS2xr?=
 =?utf-8?B?S20vSmNkNjZoNlQvRldBQWZLN1gyek5VVmVzanBLbEhsTDU1eG83NVBwODlB?=
 =?utf-8?B?czlYaGRVWlZHaEdkNU5hTjZZUGRyNFZQQmVjNUw5SDZlSGdHejNhZjdwQWN4?=
 =?utf-8?B?Y0hGMkpyVnNYMldxbHNhZjJnYytvVjNKRjFJYWdManI4ekZsRngrVjJwT0g2?=
 =?utf-8?B?dkNHVHAxNXNLdC9jYU8xODd3ZnBLdi9YRjQ2dzQ0cm8xdXh6dE1wbjNrRExj?=
 =?utf-8?B?WkJ3Y0cyc0V3b1YyemU3dXlEQjNJVlZLN0tveEd3UFZyUW1yeUxIdW1UVmpQ?=
 =?utf-8?B?L2RZM3BYcW5OS3RHQ3NVVVV5MlM5a1kzeFFRUkcxVkhHdFJLNHJFVnNjUEsx?=
 =?utf-8?B?dkZacVdUSURkM2ZkMkN6MTBiOFZvUW5LL0svSjlkQ0V3UGhQSGtSb2Z1WDVt?=
 =?utf-8?B?SG9uYmxBWEgvdksvUmZML1V3eFl2dmpOZ1Rwc05uNkk4M2txK0o4ZkxFZTZU?=
 =?utf-8?B?YzAwRTRFaGc3bGlDQ0RneEZUMWtKVmdXNWExWC9rdU9DQXFDdXFSV2tiMk1W?=
 =?utf-8?B?TkZyb1pKbEIwNFo0bDUzenE2WENDVmpYeHFHMmlIWWt1a3BRVUtYNDFlU2lO?=
 =?utf-8?B?ZXJmZjF2WkZwSXNXZThFK3NrcEM4bUpac1ZhUEZiL1JmSkRnMGRVWFVNb2hv?=
 =?utf-8?B?bGtQUG5CcGh1YkFxSVBUc3k1YmUweVNYdFZvZHF4VUZ5aG5qalhNdC9MaWt4?=
 =?utf-8?B?Z1pUR2JKVDJUcVlpZFJnbzVxU2VWRnYzN3ZzWm0rRUN2SUlzd1UvWFY0Vysw?=
 =?utf-8?B?MHU0N1RaWG9JcWJQdkR0TkVsZTBlL2hyc1lrTkd6S21UU3lyVTdvVkNNbzdV?=
 =?utf-8?B?QU94QkFFQWlwWEUxaUcxenZ5bDBtU1VRTHExZkwzaU1HbDI0Q1NlNVZieXFF?=
 =?utf-8?B?dHM1dnJHVjlLZkFXVjVoTnRod1Yxbm9JY1NEN2lMaC9qaU1QUUdza05hNVAr?=
 =?utf-8?B?T1hOamw1cUlubHFVYVVsUU9SVGl2bFdCUlZPem5aWkxETlphcjlOSVJ1NXBh?=
 =?utf-8?B?UWI1RkExdGNrZVJweEtaSFNqdE5SWXVhRzBnc0tjaVBpdk0rQytTLzRPQ0pi?=
 =?utf-8?B?bUpPM2I4QW1yV2xuLzhrbHl0WElDdVdaOGM2cWVzQUZVV3J2VzBZbVJoazhN?=
 =?utf-8?B?bFNxL3FVUmJ5NE1SYXM0OUdTbEVtLzBSKy9sVkU3QWU0MXIxVTZtUGpKTzFO?=
 =?utf-8?B?UUFNZVIvc21IUmYyYWMyUVpLY0JtYmNOcFVUQ0lqMmRyYmRMM3cxMWl5MWlO?=
 =?utf-8?B?TjFCUXRxZm1QWVVFTisyMmJwbDF6WkdRbW55UVpzeHZPaU52UDVGcDBqMkRB?=
 =?utf-8?B?OWlrQld3UWdrbjNuanVudUJCNHZXd2VncS9QR3RjTmY1aFZRVXdJK2FUZ0dD?=
 =?utf-8?B?REZrdmhiendKU01qcndUN1Jpa2tOWi9pcjRFa3BiQVB4Ync1bHl3ME0yTFl5?=
 =?utf-8?B?T0dkZHVFSkpjWCtRR0tuUEZ3MzJ0M1BVZXgwYzQ5ek9lVmQyTnpHU1RQTDlh?=
 =?utf-8?B?Slh4MUtveDJUM1YvaTI2czI5SHArcWJnN1RRK3ZWRGRsTlVSZmJ5aFY0UGIr?=
 =?utf-8?B?Um85a1R3OXZGcm5IajdKM3FUSHE4QWorZ2t6bDVQam83bnE1ZjZUdFcwRExv?=
 =?utf-8?B?T3lZemdkZGhJOVYzOGNTbzdZNE1LbllqRE9vOVpUWVkwa0FTTmF6dDJ2djZ4?=
 =?utf-8?B?blpiNm9iSkY4bUNIaW4yem5RWEFQWjZDV3QyQXhRTWhCRFo3VkRDTXRWNUZX?=
 =?utf-8?B?a0VyeitRcG9GM2NpRmlZcHN0WVM1SEhHMHAwbGZuZEQzT2NzTlU2ZEdTL21K?=
 =?utf-8?B?a3l5Y1kvc3p4K3RnOE9TYWh5OWYwS3lxZEtPaFg2ZFZ1ZGE2S0lmQjVSeTBE?=
 =?utf-8?B?aEhVWGJBRlZZRUN3SFM3bDl4ckp0N0FrY1Y5L01vNXpLaXNSSVcvQm4vV2hX?=
 =?utf-8?B?OUtoaFVpdTBJWHMwVlhES09jMGVGQjdFWTZVamM2dHNoWjBkeWxxWmtWUkpj?=
 =?utf-8?Q?Y6KEKlCfsbNJkjFQgEDaSyi2f?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 524c876c-4afe-4434-1b65-08dac3222612
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2022 13:47:46.4340 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rY7UChEENT4joFx1Qf5QRj1Dxh9hVxPqbdN8M607MA1ZA3vHUYUnFBwqrOmuAyv3B+bUDm+ZxeKTp6EZlJxHWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8130
Received-SPF: softfail client-ip=40.107.220.57;
 envelope-from=avihaih@nvidia.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
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


On 08/11/2022 21:05, Vladimir Sementsov-Ogievskiy wrote:
> External email: Use caution opening links or attachments
>
>
> On 11/3/22 19:16, Avihai Horon wrote:
>> vfio_migration_init() initializes VFIOMigration->device_state using enum
>> of VFIO migration protocol v2. Current implemented protocol is v1 so v1
>> enum should be used. Fix it.
>>
>> Fixes: 429c72800654 ("vfio/migration: Fix incorrect initialization 
>> value for parameters in VFIOMigration")
>> Signed-off-by: Avihai Horon<avihaih@nvidia.com>
>> Reviewed-by: Zhang Chen<chen.zhang@intel.com>
>
> the commit is already in master branch
>
Yes, I will drop it in next version.

Thanks!

> -- 
> Best regards,
> Vladimir
>

