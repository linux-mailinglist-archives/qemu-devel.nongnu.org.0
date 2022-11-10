Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D2862435C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 14:38:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot7jZ-000543-Dm; Thu, 10 Nov 2022 08:36:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1ot7jW-00053L-Hb; Thu, 10 Nov 2022 08:36:42 -0500
Received: from mail-bn7nam10on2046.outbound.protection.outlook.com
 ([40.107.92.46] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1ot7jU-0006Tg-5v; Thu, 10 Nov 2022 08:36:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NNpLZVjXLF2Kn9ibDTECkaTlRqZbX1/HlyVIm+oLDuUmudOYrroztP+WvYVTbhcxw1eLcBEVeSmPfQs7tlhXR0x68pndQrhdc8jef/DeS5kNHRgHFf115yztIRCWzZAk/AXsBvwV71WBgf6QyH6c/KrnUDZ0j9j0mvaGNtc00S8VwMt0mNQgEC18wBO1fe66al4Pp4vFkGIaYGRDL2lM+ilZSPTw+dLgDByurbTilZoriFoQo2c+HePmgawUp+UDCWId/NQbfUVx8QRlf5yBbXu+Uy7EHYraEyHlAjTI5CMvZxPD8IhnPO4FZC/fEHYuk40MW1V3oYCrUf096TVktQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qz6NEgCfODxv072Zp409coQJ1ZpgzeNR+xbM+NtvKfU=;
 b=gU83pELU/PB1bR5qo8LU9gZWo7fNC+DVWXQFQUrwnYgdQ0LlKVsyZPThvTJfYldYyV9WB8QiD3bf1FAeIBbjbrLd2R2Em/O9QmPGRS7AD1pFHflwKcOA5AGhI3LUm1LLvhhT/6ZzJWZM63MOkP7YbkSVJouFug3HVsFmi/iWqxb8QLWPJ16W/lSwrYUIOumSP7rCJUPns2FUP49JYyW+jlS4ZT5A1+ibYYtrHYkWGtmxnTujqhtg9xC7Qqc+w4ajnJbsH+n5qAgIVwBxSPou2J5HMmIH3yQX1czfoa5/XWQFqNYaWEIwgvkZf+D1IYRX3SLZU/7XcRhra6s3nhT4+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qz6NEgCfODxv072Zp409coQJ1ZpgzeNR+xbM+NtvKfU=;
 b=ChC9G/Eg2Zhw7ih58XNsTCtyWuRCeC/HStOJZtn1xbKOmbQZ1ZrK2Oi646eJ7Kn6W1cLDIg/PQwxGfoyyanzB7MAJK3M7xQNAWrUjgpEYjFx4TCTiP/rZQiqGoKQskv9HygGpAIfXj6iiOGdqZ150zqVNM+HSBldOwgKJtnR0afIVYQqWQhQVb8lH3W/Q/vApoSvQS6Xsb58OOnpRLxCOpyfcS31LhJvv64vEsSFjFtVuM/pw014JU8QOMArhpAbyIIlb65OfcqPNdGUoLLuvON+m9V2ghn/QCkQgwxA24QRDS3G7N01H5Q76WGCW2BYicf7gtWBpkAK4R2xdKtTcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by SA0PR12MB4351.namprd12.prod.outlook.com (2603:10b6:806:71::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Thu, 10 Nov
 2022 13:36:34 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::53a7:afdb:d6d0:f167]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::53a7:afdb:d6d0:f167%9]) with mapi id 15.20.5813.013; Thu, 10 Nov 2022
 13:36:34 +0000
Message-ID: <a469eb6a-8630-0e2e-e000-4a24bbb9b26d@nvidia.com>
Date: Thu, 10 Nov 2022 15:36:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v3 01/17] migration: Remove res_compatible parameter
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
 <20221103161620.13120-2-avihaih@nvidia.com>
 <fbf06ccb-c339-d323-c01e-455109bed372@yandex-team.ru>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <fbf06ccb-c339-d323-c01e-455109bed372@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR07CA0250.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::17) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB5549:EE_|SA0PR12MB4351:EE_
X-MS-Office365-Filtering-Correlation-Id: 842f952d-d578-4386-d6b6-08dac3209549
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WFHff325W13+zCX/R5lGTAnhzF+11V5z1ohCjGKF5pP4MyVZCGzMCCkREz6K1OTSULrdFrTHDzl67+p2E+W0H+WUtWKLiCQ9k36C+B/KgbxTNLM4NrAOwuerzrodTsS6QTl0kIKFlCwV9VtzcCWVzeZc9B7Om5Q31kYSaMU+JOMmfSVMZx1DGoSADURrk7O1pCV+ykS8tcVtmdp+Od0QgnSaCdEDbAGZzBW3Fm9nCgsvKduzxzeLhkx9NaL5tD/7v1khVsHGzUzkebZGRRjbYaL8IB5iPfwpc0vxsS2S1H63V6f7g8M/I9g8K0qru70f5ajCsLaYdlIYoXF9qWDhpBfkepGijTAAVLCSlLdgbbSOs11vis0ap6+mxVcolzEEE0zdlsPoCO8R/0xAG5+eEyyGENVOYY2h1oPJ/o33E1XbkGNLO6d8Mart0sSUS63AyYR4N77ODL9KbawUWprHpNSmnazmi+I43bLcIHxd2gx5z6JPrTQImjGyRu1FNieQzq8UEX8KJf4NKB/p3kBrTcZ8RPjqWFQLQjgakrm5y6L74sO8mnnbZcso4jFZ2/NnWk/0/1QoOr7cNG8KKrrD3OPXM3A4QZvZtPoWWBVuLF9z7+bANr/6ec+6GUabcPAbbvgOaIUJeovXkyqPxGUiqpi66/nefCP3p5Kys9ATL5aKsW6UVkS/9vi1fKEjv/hEaW1DFFQy93s74T9jGF4IKEQWRiTxXyxMNemDmfQ2Cwrj3JRThqN968KvMC8ECVVnTzRBUIEfBeD8YxN6CTyAZYJVsUr78x3kJ3M9QRHIx1A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(366004)(396003)(136003)(376002)(346002)(451199015)(54906003)(316002)(66556008)(66476007)(66946007)(8676002)(4326008)(86362001)(31696002)(478600001)(6486002)(83380400001)(53546011)(6506007)(6512007)(6666004)(26005)(2616005)(186003)(38100700002)(2906002)(31686004)(41300700001)(5660300002)(7416002)(36756003)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHFyalB5RFhHRmlWM3Y0c1FZRVUrMk9UU0Y2K0lHNENEUG0vYi90UEdlVDlq?=
 =?utf-8?B?NE1FR1FNNC82cXJQby9sbytUc3k3R0dKK3ZFVWFVMHdQT0RyNk9LQzdMQjFs?=
 =?utf-8?B?WTJMSzRPK004MkwvK3ZkUm0rZC9LVUV3VTdBWkxxSGRKMTJVL05ja1FPUm1U?=
 =?utf-8?B?U29ZQzJTWUZZNkZjRGswUndnKzlzMkxzZGxHTjJRbjJOOTl2aUlFWkZsS2xx?=
 =?utf-8?B?bXF5QTRRUnU5NzRCVkZ2d2ZRTHVWTG1hQVpoQWhNeGNkaHY0WTdZZmVGRlEy?=
 =?utf-8?B?cTdvbnhiWGhmaFRSbVJGRkdtV2haNlAvSjN6OEp0bXpZb0hMU3hFYkRwSlFy?=
 =?utf-8?B?WXhhNkNsdWNIRFZocXRqSTJtZy9ubFpSOVZzbTNkaDdjSjZxVjRBanJ1VllI?=
 =?utf-8?B?UUMzTmMydDNzWVpEcEpmbkJGWHowM0tCQml1QVQyMjNhUFhoOUx2emlzOGNG?=
 =?utf-8?B?UEZoNnBDTUxjR3BDTHZNa1NTQi92MDFLSjJkUjRQK2YvNERzc0NqTW0xZkVK?=
 =?utf-8?B?WWgrVHc5ajUzelRCb21FVUpScUMxcURNS2h1cGhwRHNRZll2OVJYUDN6c3Zo?=
 =?utf-8?B?MDBuMFkxNEJ0YnJqQmRuTlY2R3hwWEJYS1dKQnMwN0JZRjQ5WEhHeTNua3pD?=
 =?utf-8?B?ejA3cnQzQjNpKzNNS09PSEJ5TmlvOVJEbE9HZFdkQm9KcU5wZm5VQk9DWFZQ?=
 =?utf-8?B?alp5a3ZrajU0Um5wSGJvNFI5cE1FVnJtcEJDRHI4dUtRUVd3MmdDZ1RFUzdJ?=
 =?utf-8?B?Ykp3ZTZGc1FZeDNPOTFvUk0raFcwNTFJZnU5YStCYXp2b3ZqOStDNzJick1I?=
 =?utf-8?B?dGs5SitxditwbFJiQm1wSWJEZ1YyaTYrbDBWZTJKZzd0aXcxUnVSelFNZ1NO?=
 =?utf-8?B?N2xIRlBWVlJpVVM3N0ZMQzQzbG44dWo3MEYxMndkcnhrdXk5YldJUmpjRzZx?=
 =?utf-8?B?MnYwa09DYkRiSE1SVG5ybVVuTnhFalc1VG1mZ2RVSWJJTnJUSC9vdWYyLzI5?=
 =?utf-8?B?YlVMV0svcy84ZUpGWVR5QS9xR0ZveHV3OWxoQ3JqMXFKMERSckZyd0M4L3l3?=
 =?utf-8?B?Vi9CR2lBamd3Wjk5WUNHdWJCN3haSHVJRXdiRXE2RjFsNlRENXZBem9yS1o4?=
 =?utf-8?B?ank5UUVXQ1d4c0p5TGZoVDNodGg0Z1pUcmJsTHVBSFFVOUVxYmU2eVBWTTBu?=
 =?utf-8?B?Z0J3d1UzYTYwZGpiMFZ5UlJzaHgvY3ArNnFkdURlNFdJWG5uT2pPTDRPQ3BT?=
 =?utf-8?B?TUM2VnFOSy9weEFaQUhYZXQ1QUQwU2srWU5sNFI2YnJzZnkvQ3RDRjRUM2dP?=
 =?utf-8?B?enFRbW42eENGUGdpb09qcWlUZlBTRmxBalNVcC9BZHAyR09BWS82N2ZoZGw5?=
 =?utf-8?B?NnFZbDBkYmdJM05GR0lsUEFiZk9iY3NQdSt5SzBFUXZrbmV2WXJEeExSbmpX?=
 =?utf-8?B?dXB0UkJrWWZyUGRiTGdab0V6d1ZJbzZ4YTNXR1hpdFdDaGlpakppN3ZMTkVo?=
 =?utf-8?B?NXJuNlVYN0JsQko1SEhhSldyaUlSN05OUlVCc0NVVWRTcFZveU5rWWV1ZThP?=
 =?utf-8?B?UmVmc0NueTRjNmRPMXZCRkNCeTlhSThNVEJCZVRUVk0rYUhNN0NrWThiTFNY?=
 =?utf-8?B?c0l5Z0RwNVVyY1JnajA2S3UwdDFMdVR3RVQxWmhXS2pGbVNKUWZYSEZpVE5Q?=
 =?utf-8?B?OTZsUUk2U1pVblMwSDJpMWk5ai9XUGY1UWxBcTg5V0g4dlFsSS9tMlIyMC94?=
 =?utf-8?B?aTFGNXRJSnpIUmhYa3BnKy9JN2NvT1ZTbjdvV3FDeHF4a1lEZ2RhcGpjckVh?=
 =?utf-8?B?R0gxUE50dTRPS0UySkp1enBTQTdXSXErazdTMmhtQXV1QXBVVmpxQllPMUlv?=
 =?utf-8?B?Y1dGYVIzTTlxR1puUDNoU0FtZW8xN3RvU0pYQTRSODhjbDdwUDBaQjQ3VWRo?=
 =?utf-8?B?cnJDdHp4SUVIZVo3emRBcEpVVFNjSGFaa3g5Q0NoL2FwRlN3aGNUeTYxMkxT?=
 =?utf-8?B?TDA0MkM0eUl4cUw1NDdSeHNScW5JNUh0bmFRYjVQVkRMdkgydDdyV3ErUnJo?=
 =?utf-8?B?SGQ0YktnaWV3V2RJNHNDZmgycVh6Kys3R0JVN1U2ZWkweXRxS0UyMjh2L0dZ?=
 =?utf-8?Q?GdicJR4RslQIhWooHW9rjUZYH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 842f952d-d578-4386-d6b6-08dac3209549
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2022 13:36:33.9391 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ljIOSxgyr351r5UAAbGufjcva/8K02PJZVD9IgvV45BoDefPUSfgrZtSCGrC7CSspIFj1mK6Pdy7WWGpY3Hp4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4351
Received-SPF: softfail client-ip=40.107.92.46; envelope-from=avihaih@nvidia.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
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


On 08/11/2022 19:52, Vladimir Sementsov-Ogievskiy wrote:
> External email: Use caution opening links or attachments
>
>
> On 11/3/22 19:16, Avihai Horon wrote:
>> From: Juan Quintela <quintela@redhat.com>
>>
>> It was only used for RAM, and in that case, it means that this amount
>> of data was sent for memory.
>
> Not clear for me, what means "this amount of data was sent for 
> memory"... That amount of data was not yet sent, actually.
>
Yes, this should be changed to something like:

"It was only used for RAM, and in that case, it means that this amount
of data still needs to be sent for memory, and can be sent in any phase
of migration. The same functionality can be achieved without res_compatible,
so just delete the field in all callers and change the definition of 
res_postcopy accordingly.".
>> Just delete the field in all callers.
>>
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> ---
>>   hw/s390x/s390-stattrib.c       |  6 ++----
>>   hw/vfio/migration.c            | 10 ++++------
>>   hw/vfio/trace-events           |  2 +-
>>   include/migration/register.h   | 20 ++++++++++----------
>>   migration/block-dirty-bitmap.c |  7 +++----
>>   migration/block.c              |  7 +++----
>>   migration/migration.c          |  9 ++++-----
>>   migration/ram.c                |  8 +++-----
>>   migration/savevm.c             | 14 +++++---------
>>   migration/savevm.h             |  4 +---
>>   migration/trace-events         |  2 +-
>>   11 files changed, 37 insertions(+), 52 deletions(-)
>>
>
> [..]
>
>> diff --git a/include/migration/register.h b/include/migration/register.h
>> index c1dcff0f90..1950fee6a8 100644
>> --- a/include/migration/register.h
>> +++ b/include/migration/register.h
>> @@ -48,18 +48,18 @@ typedef struct SaveVMHandlers {
>>       int (*save_setup)(QEMUFile *f, void *opaque);
>>       void (*save_live_pending)(QEMUFile *f, void *opaque,
>>                                 uint64_t threshold_size,
>> -                              uint64_t *res_precopy_only,
>> -                              uint64_t *res_compatible,
>> -                              uint64_t *res_postcopy_only);
>> +                              uint64_t *rest_precopy,
>> +                              uint64_t *rest_postcopy);
>>       /* Note for save_live_pending:
>> -     * - res_precopy_only is for data which must be migrated in 
>> precopy phase
>> -     *     or in stopped state, in other words - before target vm start
>> -     * - res_compatible is for data which may be migrated in any phase
>> -     * - res_postcopy_only is for data which must be migrated in 
>> postcopy phase
>> -     *     or in stopped state, in other words - after source vm stop
>> +     * - res_precopy is for data which must be migrated in precopy
>> +     *     phase or in stopped state, in other words - before target
>> +     *     vm start
>> +     * - res_postcopy is for data which must be migrated in postcopy
>> +     *     phase or in stopped state, in other words - after source vm
>> +     *     stop
>>        *
>> -     * Sum of res_postcopy_only, res_compatible and 
>> res_postcopy_only is the
>> -     * whole amount of pending data.
>> +     * Sum of res_precopy and res_postcopy is the whole amount of
>> +     * pending data.
>>        */
>>
>>
>
> [..]
>
>> diff --git a/migration/ram.c b/migration/ram.c
>> index dc1de9ddbc..20167e1102 100644
>> --- a/migration/ram.c
>> +++ b/migration/ram.c
>> @@ -3435,9 +3435,7 @@ static int ram_save_complete(QEMUFile *f, void 
>> *opaque)
>>   }
>>
>>   static void ram_save_pending(QEMUFile *f, void *opaque, uint64_t 
>> max_size,
>> -                             uint64_t *res_precopy_only,
>> -                             uint64_t *res_compatible,
>> -                             uint64_t *res_postcopy_only)
>> +                             uint64_t *res_precopy, uint64_t 
>> *res_postcopy)
>>   {
>>       RAMState **temp = opaque;
>>       RAMState *rs = *temp;
>> @@ -3457,9 +3455,9 @@ static void ram_save_pending(QEMUFile *f, void 
>> *opaque, uint64_t max_size,
>>
>>       if (migrate_postcopy_ram()) {
>>           /* We can do postcopy, and all the data is postcopiable */
>> -        *res_compatible += remaining_size;
>> +        *res_postcopy += remaining_size;
>
> That's seems to be not quite correct.
>
> res_postcopy is defined as "data which must be migrated in postcopy", 
> but that's not true here, as RAM can be migrated both in precopy and 
> postcopy.
>
> Still we really can include "compat" into "postcopy" just because in 
> the logic of migration_iteration_run() we don't actually distinguish 
> "compat" and "post". The logic only depends on "total" and "pre".
>
> So, if we want to combine "compat" into "post", we should redefine 
> "post" in the comment in include/migration/register.h, something like 
> this:
>
> - res_precopy is for data which MUST be migrated in precopy
>   phase or in stopped state, in other words - before target
>   vm start
>
> - res_postcopy is for all data except for declared in res_precopy.
>   res_postcopy data CAN be migrated in postcopy, i.e. after target
>   vm start.
>
>
You are right, the definition of res_postcopy should be changed.

Yet, I am not sure if this patch really makes things more clear/simple.
Juan, what do you think?

Thanks!
>>       } else {
>> -        *res_precopy_only += remaining_size;
>> +        *res_precopy += remaining_size;
>>       }
>>   }
>>
>
>
> -- 
> Best regards,
> Vladimir
>

