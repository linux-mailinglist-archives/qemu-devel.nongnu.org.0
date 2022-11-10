Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E06624371
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 14:42:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot7pG-0007ZT-3f; Thu, 10 Nov 2022 08:42:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1ot7pA-0007TL-4I; Thu, 10 Nov 2022 08:42:35 -0500
Received: from mail-dm6nam11on2083.outbound.protection.outlook.com
 ([40.107.223.83] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1ot7p8-0003Gp-9l; Thu, 10 Nov 2022 08:42:31 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aezSvtGG5JjOnfveEcE4fkNMjKgFD7BGsQtpaODHn3wYpDy/AohjsM2u8TpWH5N74Cs2o+j7M5HVUaUEmz1yRwqMBmI8ACh9lUm21sbW0MRSG3e5A2Dzc3D5zc+plXgJTmFGIkbe38JGKEROvBJTmsy4yT6WSvZBUi1AYASVFs9J4fim+JduSbs17NgRgoLZuomkDQRXWGsad32idQkR8DqNrR+TTVcR4ANMf1DMHaQuytabYsJeFWgyjrVq4vcgehv+boSXalhXi+ioPrI+Ne/sE0XyIcWe8B+Z3qB8jIW+yng8JPboycyLAIGUDAAZSDR9p/MVurZwjw5x/iEF4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cQHruaJW5GWJj8WYmDH6v/iutDAwTEcThmKUs/MgLhw=;
 b=OvMil6JGw6QqrJ2jmjBoii0FwPeHfTOngQHfd44BdbUac88TyGXw0VDBCUMSWkE3uqzhQl87tY2YrLK54Aw/yrBuesGXO2ySozS1pmgSHq3SHi28kOQrZ+cKQQW1+n9pJQNPEf7oQGcGxmNpl0Xb5H2gk42yOI54BNe8qbVT7pao9gBnN3M0p2NL/lMJIamXgSncW8hed4pkQUzVCLqQDi2s4QCYuBs/85hlW2tamyNvs6GGGe4dcrd8Qp7E1q1et9hspyRIiFTtWkBf911vOZZgcWUKuP1v7XOxaElsLEBSjUBOi5VPauemCsaxt/WOQ/PdK9o/wP2tqpdmnr2qmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQHruaJW5GWJj8WYmDH6v/iutDAwTEcThmKUs/MgLhw=;
 b=W6w4dWeIUONpm04gNeUeN+7kPokYMLErDJyabdkDTcIyM3Wq9YoZKVa9uUI6MlPCdyVeCp3zTxNxMsvwvyuGdlDoNkDuwhM1dmVcT6WK/2gGZYLncbW+8S4uCquuOOkifEI2aCU1BnURpXXWkat4EDipBgu5eQSG7Xt/7XQ1bZgYEmD0JgYEusHh9N2kbqetiHdF55tfJYHQCjN7jNayqMbGKe3YeoIhNo60lYhL49bA72TUB51f4rNfy6NmE8d7Br5uDhOSBXYgXRXSkttid83imZixAexyX5MTmKrpE7voaIvBnQ8kAOsgxGNuOF4NRi+0a7bJmZxe4g6QNoUTEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by MN2PR12MB4047.namprd12.prod.outlook.com (2603:10b6:208:1de::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Thu, 10 Nov
 2022 13:42:24 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::53a7:afdb:d6d0:f167]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::53a7:afdb:d6d0:f167%9]) with mapi id 15.20.5813.013; Thu, 10 Nov 2022
 13:42:24 +0000
Message-ID: <4904b868-f9ee-7f7d-d31a-467f97054ef3@nvidia.com>
Date: Thu, 10 Nov 2022 15:42:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v3 04/17] migration: Simplify migration_iteration_run()
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
 <20221103161620.13120-5-avihaih@nvidia.com>
 <119d6719-2d7b-31f3-835e-69014d2be151@yandex-team.ru>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <119d6719-2d7b-31f3-835e-69014d2be151@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0113.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::13) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB5549:EE_|MN2PR12MB4047:EE_
X-MS-Office365-Filtering-Correlation-Id: eae42c29-7d47-4b01-db5d-08dac3216624
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KF2G9qAk/w11gkcHLqISO7mtWpeUYIwEEZXF9ENKK57C7S5evyC3sVt07vHpxMpuMIXdnOM6t0hk3xgm3ZfWXyw1xbAzt6yooQnps3KMnxHJknWdpCQwvj6fnBAm3zoXHSAWzKbR8MDPcCnYntFriWH71NhvUHKXPwK9caFu8HOxCYVUwn6GhUU/raM/ytv/OyUi38I92CtPcLMOj+w9steUXKoUr1qarqXK98YyaG9HwouPt8Xp+yojktiJB/R/5PZmb+ReR4khXYG9ZYjsvAh5IK+crnWAz1dLJR2VgZ9x7e1/XEOm/jmS8L58uIQY5HJypZta+U7HAoPfe7TenYhpDevBI5yHG5lv05IAUZYS398MXfJtqA2iEMveh8KNNL1AGCpKtlAg4Pgb1GztPwuJjk4cuPzWk2grsO8GOErPAhz8IbIjCVSEfjCHF98FjcyXbhZmjqkQjiyPEe9dLQ3AH3nN7Ju0e7zmnqu9rY3QMknUabhzPDq396ztYAGZAY+DySM3v2JgvseARl08Q50XhsCMtHzJ4jCSZnC1gqcXvxoVBOQTzL+d3N18ci5VFPg0NWCNBGOehRt3ywVOsO+998IHQVg5b0eGHz49rMixvQdJzoVuy9fJwUH43TVvKvOb0Pg42TZpQhpl66pK4wuIkf3iaImoakDO8QIHTXs52/bcduc5Ve8K8lf000psvMq8E86aha9MIQXngoB97vljUHCixCHGYubm1eyQhNIeA8p4xh2cz6XgihF7Guq5e6D5QjyodAbK7Cm01txiI2LsL9eRiJZExJONW4AntTA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(366004)(396003)(39860400002)(136003)(451199015)(38100700002)(31696002)(66946007)(66556008)(8676002)(6666004)(4326008)(66476007)(41300700001)(2616005)(5660300002)(7416002)(86362001)(316002)(6486002)(478600001)(54906003)(186003)(83380400001)(8936002)(2906002)(6506007)(53546011)(6512007)(26005)(36756003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3M2QVQ2RWhidXhHTWlydS9pY1FXWGIza1ZsM1EwQUl4RUtranAxS1VpNlZV?=
 =?utf-8?B?Z2E1UkJhWHM0TnQ4K0JXMnF1ZVk1enBSS1N4bTJpRitKK1QwZTBFNUhBYU0r?=
 =?utf-8?B?amZaeWExalFOTlEwaHExaGYvSVFGdXc5NWpVZko0NDZHUDNVZzlBVVBET2FU?=
 =?utf-8?B?L2I2N0dwMzZyRGRFM0FuakNSWGc3cllkbmpEY3Vuc2RSUFA0d2p4WjNReEk5?=
 =?utf-8?B?UkhmNFltMmZyNkozSzJPeDhKVlVIZWlUZGVORW5YWUpJWExZaDc3WVQ3RGdk?=
 =?utf-8?B?ODdhMmFKQngzQTJLQkNMQUQzOHFwUzhNUVpYTWtacTA4WFJMWUZhdVB6QTB5?=
 =?utf-8?B?OGdMQWtVcEJnb3FjWXNLc1ByT2VsdWZOZXNrYlFHT2VNbEdOSkcwTERjNmFN?=
 =?utf-8?B?STk3Mm9oM2REcC9CV29xZTRaOURxTTRmSngzaDZEa1VKRVRiZFVUcDVwdjNp?=
 =?utf-8?B?K3ZMMG9nUExGdTByRml4dGMxaHRxM2daa2o4MTB5Q1IvcVl6SHgyemlLTFV1?=
 =?utf-8?B?Q0FMd0NmcXhjd2lzaEl6TitJck5aTWFWQVF5dzV2ZVJhanhDNUN3N3ZoL0dJ?=
 =?utf-8?B?cFRyYVBlYjUrUXFEeFRjSUY0aVBNV3ZPZytZUkR3TWZYT2NBTUJneFF3NXNu?=
 =?utf-8?B?VEFGOVA1VERLdVNNbE1BdlNxYlFNN1BCT0pYN01CZWl6UXR1M1ViN3dTK2h2?=
 =?utf-8?B?SDY1VmZUYmhSSUVEbUdGdXZaZ1MyN0QxT3RlRzllK1h2d1hOMlJzQ3BKTlo1?=
 =?utf-8?B?c1h4UWJNTzkvLzc4N005c3F1WkpEU2FQTGYzNVh1TEFnYWhOVjNoWjhETnVz?=
 =?utf-8?B?Rk80YlQrNUM2UUtRb2ZxQzljVEtuOWE5aU8vYmcrSFM3S2JWdUtRTlUwMjVR?=
 =?utf-8?B?TUFOWDJvcDFpNFB6Y3hBbTBoK0RTamNIMnZNWjBhc1ZVWE1ST0F5TGpJSXhi?=
 =?utf-8?B?S3lDYlV3UVBlMUVndUNGYzVGTjVXbmV6ZWNGcThWWW9zZXdCSWVUbVJaMzBz?=
 =?utf-8?B?KzNXZzFkMnFzdmRHN3RDS1lVMktpcjJ4ZVhYd1YyYS82TW5ucFgrdENUenZt?=
 =?utf-8?B?Q1RnaVlVNGFGT2tISStBQWxha1ErVWF1WXNqcTU4L20zUytpakdtL0RkUkJD?=
 =?utf-8?B?VFFpR05LVkFUWWkvb1FiLzB6U0dydzJpSC9zcGdTaUJ5S1ZROUtEZ2ZGRkc2?=
 =?utf-8?B?Q1RQYVg1NVRXOERnY1EwbnQ5cDd0L3B4MDNJM25tTndQSjU2WkR6TEZSSFht?=
 =?utf-8?B?SmNTMXVLTks0Uk10aGk5d3ZrMDVlRUJGck1aRW43VSs0RmlKUHVoQUNWbGY1?=
 =?utf-8?B?OHlkZ2FBSTlCTndjd1RBVFRZSXZHY1VGN0RkQVVFeWJYa0xRaVV1WEZHVkZY?=
 =?utf-8?B?WE1Na2dsNWtrQ3NxWlhjYit0VURSbVUvcHFpdXBiMGZuNFhLSVBCTndGeEZE?=
 =?utf-8?B?Wmo0WjF5enpWcjFONnJoa0U5M1pwMitNWHN6d2ExVGFvUTYwMmlXVWxlOVV4?=
 =?utf-8?B?K21JNm0wMlgzc0RVSWF5dWQ3YUxRVGVyelJkREU5VklsRTY5VHZEdENrTkNz?=
 =?utf-8?B?Wit3Rll6bVp6SnNhSW43Z0NSWmlPbit6am9kaFlzcS9VNzN1L3lGemUvdjBT?=
 =?utf-8?B?Ym5pT1VnMDZPbkUrZGFmdGR6QU5KWVU0R1Q5bm9KUWJoRThoRWNNS3kvSHVM?=
 =?utf-8?B?dEhpWkYzYkVnNE1Jb3lXY1RqRmpQY0I5a2czNU9pOWQya3hZSDFuajZueGJv?=
 =?utf-8?B?TGNiUlJTYlBiL3JnR3RXZUJ2TElvQ2t0TXFuREduUWd0anNvd3hVcHhEd0gz?=
 =?utf-8?B?UEtDVDhGVXMxd1BJdGNSa1ZnOWp3WTE5cEFGTWJEM3luV0RIRzhxWTdFVEU0?=
 =?utf-8?B?bk85c1hqNzBtTjFQaWk3MVg0Q0o2SExRaXJqb0ZpZUFUWCtHNkZSdFpROGo4?=
 =?utf-8?B?MTJyVHlKWno1TkFqOEZGbmRoWUNURE0ybjZYWDFXODQ2a253YUNpNTYwK2Uv?=
 =?utf-8?B?dUVIVnNkNE5VeEU5YzdsTmlOVGdYSEI4SWxpUGhIeG81c0hqU1VZaEcxeTRH?=
 =?utf-8?B?dERPQ0xNRElhbGVzZ01oZVFUQjJyR0pLaWdxdXBWMUM4TThCZ2pZTmZmblVC?=
 =?utf-8?Q?AXI+On5ytD1FLUsDmE9vGPfi9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eae42c29-7d47-4b01-db5d-08dac3216624
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2022 13:42:24.6530 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jSuyMl08H+KkL4eSpFAKxtfRUR4uDfR/jujzGZeEr5HNt58nWKmWm47zLufgahZLdgkJB2GrBgmkJdSnzCpBkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4047
Received-SPF: softfail client-ip=40.107.223.83;
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


On 08/11/2022 20:56, Vladimir Sementsov-Ogievskiy wrote:
> External email: Use caution opening links or attachments
>
>
> On 11/3/22 19:16, Avihai Horon wrote:
>> From: Juan Quintela <quintela@redhat.com>
>>
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
>> ---
>>   migration/migration.c | 25 +++++++++++++------------
>>   1 file changed, 13 insertions(+), 12 deletions(-)
>>
>> diff --git a/migration/migration.c b/migration/migration.c
>> index ffe868b86f..59cc3c309b 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -3743,23 +3743,24 @@ static MigIterateState 
>> migration_iteration_run(MigrationState *s)
>>
>>       trace_migrate_pending(pending_size, s->threshold_size, 
>> pend_pre, pend_post);
>>
>> -    if (pending_size && pending_size >= s->threshold_size) {
>> -        /* Still a significant amount to transfer */
>> -        if (!in_postcopy && pend_pre <= s->threshold_size &&
>> -            qatomic_read(&s->start_postcopy)) {
>> -            if (postcopy_start(s)) {
>> -                error_report("%s: postcopy failed to start", __func__);
>> -            }
>> -            return MIG_ITERATE_SKIP;
>> -        }
>> -        /* Just another iteration step */
>> -        qemu_savevm_state_iterate(s->to_dst_file, in_postcopy);
>> -    } else {
>> +
>> +    if (pending_size < s->threshold_size) {
>
> Is corner case "pending_size == s->threshold_size == 0" theoretically 
> possible here? In this case prepatch we go to completion. Afterpatch 
> we go to next iteration..
>
I guess it's theoretically possible.
Let's address this corner case and keep the functional behavior exactly 
the same.

Thanks!

>> trace_migration_thread_low_pending(pending_size);
>>           migration_completion(s);
>>           return MIG_ITERATE_BREAK;
>>       }
>>
>> +    /* Still a significant amount to transfer */
>> +    if (!in_postcopy && pend_pre <= s->threshold_size &&
>> +        qatomic_read(&s->start_postcopy)) {
>> +        if (postcopy_start(s)) {
>> +            error_report("%s: postcopy failed to start", __func__);
>> +        }
>> +        return MIG_ITERATE_SKIP;
>> +    }
>> +
>> +    /* Just another iteration step */
>> +    qemu_savevm_state_iterate(s->to_dst_file, in_postcopy);
>>       return MIG_ITERATE_RESUME;
>>   }
>>
>
> -- 
> Best regards,
> Vladimir
>

