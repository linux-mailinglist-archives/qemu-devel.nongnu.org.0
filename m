Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58EBC66BEDB
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 14:09:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHPDn-0007WH-Ax; Mon, 16 Jan 2023 08:08:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pHPDT-0007S8-L5; Mon, 16 Jan 2023 08:07:59 -0500
Received: from mail-dm3nam02on2054.outbound.protection.outlook.com
 ([40.107.95.54] helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pHPDO-0003ge-Pc; Mon, 16 Jan 2023 08:07:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YZJ+1iLbtQarDweFjcjVqU/ExGBaQXdYmZFXvgnJlFhcsFlGe8FCF7L9ujyWsh3QK/B3f5WP3PViEXlRfUbfc+6sZW69AJlub36eeqWD0WpjUFnUHBXl3a1gFGJ5kFlEzpd5SyE/uGt19XIxO5XsRwctwVeLluTdx7vZNC3CQWmHHsEsGGRgtfkMm55FEufisSwA/fUSlgKLaWvrpWpQTss/RWltclyJyl1ajoUOrQUHvEYjVUpHEmzeLOohqdy/D/9/HlBGmWEYEQl7t4WvqM5n8RVmQdxzgctVP/VwGzHa8K6rq32sq9i9GKkDrDPdoqm7XZB32TA+SkbiOVyMsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WJA5lObTpS0Lr8slsNOrWOER/zSp5AhYjoTg6urNUYY=;
 b=KfXQ8uytLfxDfUjpTBGecBsg9v2AxG99L4bjrEJvG1P+GJ0uCpFvQvug7QZjkcdpMm4uHTlAiTPfwcExYACn5uBnvV7V4fNnrMYLhv821vnLCXjZZABdu5MvIsTsZJOxcnXhc5gZjwikkmMctC6adFb40uuRlNk4OhBQjChHxQPgnqX0rQ00bWB4/a/dcjk0CryYK7l/LnZloPjP0qYk52jXuDDE+E8Q12ZNFumIxmbWB4+KzScBC62x/ELKIywR/Qh3LmhfF+XtG1D2lxwqJrtK01ti3a3/4AAVgau1GhGeGZmYUJOnGG4pIluUb1WGEiz0qGZxZMQgRUZeekzqpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WJA5lObTpS0Lr8slsNOrWOER/zSp5AhYjoTg6urNUYY=;
 b=K/Amcoi3o0xcVWc3/zuP1ClGQf3QEuE7zQTnNtiVLJS3RpdZ1Xw0RV0d4VJET6YcUA6pHrp+P1clBSR06ioUqZe4po2Bd6UAK8K97Ovk3FPxRvMZ10KLTJ5XJqmzMv/0Qf7NDSxrChTIea2AVrTwOuGvIp2f80BmFkm4j42oDQJKvhqS6t9+Akhcj8Ix9IzNRACyLu5UIZiuEkKeLGYI86gpK+SkTqWvL7XoNc3waxEOT3l3ZjUz9TFs7U6f3feK5j8qXaxpAyZm1nlBubUu1pNddC1iQoVFeg3bgxkjnuxnYONZs9UHQQZ0OQ1zdlfMBN56oXZ/JSOixY9mQCHRdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB5544.namprd12.prod.outlook.com (2603:10b6:a03:1d9::22)
 by BY5PR12MB4869.namprd12.prod.outlook.com (2603:10b6:a03:1d9::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Mon, 16 Jan
 2023 13:07:49 +0000
Received: from BY5PR12MB5544.namprd12.prod.outlook.com
 ([fe80::5fc6:c30:d8ae:1261]) by BY5PR12MB5544.namprd12.prod.outlook.com
 ([fe80::5fc6:c30:d8ae:1261%3]) with mapi id 15.20.6002.013; Mon, 16 Jan 2023
 13:07:49 +0000
Message-ID: <78dda8fb-973f-bc07-5617-21768ac05417@nvidia.com>
Date: Mon, 16 Jan 2023 15:07:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v7 09/13] vfio/migration: Implement VFIO migration
 protocol v2
Content-Language: en-US
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
References: <20230115183556.7691-1-avihaih@nvidia.com>
 <20230115183556.7691-10-avihaih@nvidia.com>
 <fe3742a1-d24f-c883-88ba-ae5329ac79f3@redhat.com>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <fe3742a1-d24f-c883-88ba-ae5329ac79f3@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0023.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::10) To BY5PR12MB5544.namprd12.prod.outlook.com
 (2603:10b6:a03:1d9::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB5544:EE_|BY5PR12MB4869:EE_
X-MS-Office365-Filtering-Correlation-Id: 148b0040-45bc-4552-266e-08daf7c2aae9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hHSGb8ljv0AtAHeXfUqenzklP3Y6abQhA4KDK/YClTmxuk+VDnhQHHIw5SBSUc8pZlGwhutwYol0BlgRvWKsyzpLYDde2f8XRRuv18Eaitz7YXynIKm7jXZlVvhPjlufgeAC7sX0R2cDbwfuQAQ4WdAmhf4uZNSBsIccJ7Ar8xSStiQaqKcdSJcvv8xRPb4kbjEipi00v+Ew46s114GPqs8/z/IGKsWiNz1noa/wMhq9uSlun8kI0fsSloNEbbiudHrSWJjClSXbxJiZK5XFdr6lianVcqPsckpbWQ/KFpX9nfKlpGcmuxapO6TB0MFEwlCsPYTrPxy92r+R154Udb9ldYs/vwXehgEguOutCc2yKoIBU707UHJF0gV01ABiH4y0u6R5VqSFlzuOLnfQ3xMh62iB8Arak3iTROvKlzrvcC6AhJMXohZgJidF6sQRK8REkyjY4ggSy8lJ+4L1tcDPPtCHu/km9CpbMDyl1+lBXnS6xvs9AtMA7UPxHicKV0ZxYva7GtGkMcIeqQRYXzORDM7AKf41kR7De51LIbu+nGc1EOz0bRvWWOAoVTIUfZkSEoaLrzZATQNWJc9j/JoaUy3vuQJf5r/8Bnr4VEU1aIx1NRvAnI2rapjhMx02tqQ2WLJBVEVJEK9zYD5CwQgktjaW7vi3SLu3Q/t87n+JH4qT/FRy4KAbo3TwDlBngRQhZVDumzvNxT+2vARY1plrgKeXwTBexhW7I4EzCGTbfcB8m5f0HZ2JGRmlrvFSL7zQ1HPWUOX68WuTjw8NlpgCvYO5FspmY3rOel7LHgg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB5544.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(396003)(366004)(136003)(376002)(39860400002)(451199015)(83380400001)(86362001)(8676002)(38100700002)(30864003)(31696002)(2906002)(5660300002)(7416002)(8936002)(66946007)(66476007)(4326008)(66556008)(41300700001)(6512007)(186003)(6506007)(26005)(53546011)(2616005)(66574015)(6666004)(54906003)(316002)(478600001)(6486002)(966005)(31686004)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkRRMG5jRVZzVEx5RzljVCtCVmhCT0VIOWZXVi9FMUczRytzVE10RkpuSFJo?=
 =?utf-8?B?RWlFUVFTb2dqaGZPUzJnUkVGbTdMVStkMVE3dUJJVGVPdlUreU9JNGYzRks1?=
 =?utf-8?B?ckp1N09iQTdMNUVyUENFZzh4bXU1cGhWbmtjVTg5VE04T01TZzBxWXVZRXV3?=
 =?utf-8?B?TFNqeFlEa3pSV01BY3cxZ090NXR1QzFJa1NrMG40SnVyaGMzWWNUVDMzL2Fh?=
 =?utf-8?B?WXZpcEp6ZUJUTzM2VjhTY0VFakYxc05xT2xhbnNzeWptbU1mWFNjMG15QXAx?=
 =?utf-8?B?eGgzaGdHNDFMNzNSK200eVdCQ1N3MmpLcnhCTHZ3ejI3WjUvQ01xbDRNMUhM?=
 =?utf-8?B?dmc3b1ExbWtTbFgzK1docW55K2lZWGFER2k2RGVxRSsrWGNGWlh3ZmZJcDRK?=
 =?utf-8?B?Uk1aZXlhWWpWOFB5SlpDL0NzVVJjY2w0Z0NBTWgwb1J3SEFxamVJUTNDKzRL?=
 =?utf-8?B?THpJNGkvWGlHSWJtZFR5WGpRQi83dnlXMnNEbEhFUkpUZy85dEYwYlFHajZp?=
 =?utf-8?B?NndLNlEyRmtIcUp6eGJEUE5VeGhBWTVWN1lyQ3pjMTdKR3JUVXZFTzdoR0Nh?=
 =?utf-8?B?KzBwTS94QTQzNGRySmVHeUNRMXR6Mlk0Um8xMEZpYUI5clVoZTNXWFFWMVBj?=
 =?utf-8?B?NHhJNTdiVjBlYXhrUktiWmVKNGNKcnJmdDl1WThWbHllUEIxMk11d1N3Tksw?=
 =?utf-8?B?V3dPMUNzazd5dkNhMEVobDBOZVBBNWw5ODFyT01RTzRxT2VTZXBZN3VYbnhy?=
 =?utf-8?B?cGhDRkJGZ2pObzNaRmVxcjQ2WHNPR3lEYTlnT2lNbjF6YnQ5Ri9ib3hWUnpD?=
 =?utf-8?B?TEEvc1pzTmtCaldrV1JLOVFHMG90WkNVaUk4eFpuS01OdUZYWXduK0ErUnBM?=
 =?utf-8?B?NlpFbWhVK3FNaDkzWWdmeTdBa01wV3piNVArc1pVYU1hczBxSHRWZXhCRGoy?=
 =?utf-8?B?Z0o2ZnZMakdxZ2IyRDhuQmE0YXdKS2M0dytWMXJkTkJHSlJ2T1RFV2dXUktr?=
 =?utf-8?B?WTJad002a0hRYTlSSC8xTGlXSDU4QlA0dk5WMnFjcFR0RmZLSHU1NkZDU0gx?=
 =?utf-8?B?OWRkUWpvQ0JqWCtGQzk5NjZWeDNiTDZoQUJOekhkNWpzWGpseHl1bXhyNktz?=
 =?utf-8?B?a1h5aGh4cnhmTG83TFlldW9HczUvMWlUc0FsZitrVmVIMjdIK3J3SkdtQll2?=
 =?utf-8?B?Wk0yeEFFeURNTHkzK1ZFMlRvSndoSkdreWdBaXZkanRTK3ArMmwvM01OWWF3?=
 =?utf-8?B?SXU1SXdTMjZOemZSL0p4Q3lRUEhzaGVGMUQ0bHRNbGo5N3pHOFZjVkd5aHVv?=
 =?utf-8?B?TVJVSnI4QkVaKytYU3p5VHFEcERoN3pqdjRiME0wSXV3dEJiZTZndTdqVmhm?=
 =?utf-8?B?eC90MWwrd3Q0OTBqdDdrSmtqRHFqNVU5QjlTNGJhK2FKbDRUalJoSjNRR1lt?=
 =?utf-8?B?OGJwTFZRT0prSjBrSkIzSEtVeElmQ1dHQmNFT2VxdkIvWkIvVC9OSEtKUytU?=
 =?utf-8?B?NWw1NDdNbG9vUDAvVmxiQU1JSTNnVC8wcXBDSHllaGtNd3JlSWp3aGVkK28y?=
 =?utf-8?B?KzVsWnQ0WUlRZ0U0bXdTKzVKVzF3aU4wYXcyS2FkOGVOUG9wQUVEWHdYcFRl?=
 =?utf-8?B?TVNsaDRxSFdKb1g1UDhiTFl3RmVnMU1FMFhNN2J2dDhOMGZtaFNPR3dEYTlv?=
 =?utf-8?B?SGtzczczKzZXYWVjYTNuYk1SNTBqM0poMlhUeHNUeC9UNmFBdWN5L2Y4Ui80?=
 =?utf-8?B?TWNrVHdXMkFSR3NyUVRFSEczZThWTllzYmVsek1oUXFtWjZ3ZU54Wmo2enJu?=
 =?utf-8?B?clJQeFNYL04xeE12MWVPZXplOTJxWVloMVhvWEFTZHpaT2x6ajBqNXdwR1Fk?=
 =?utf-8?B?a1dKZ3MzcU9ERlRsU2dMMldFQ3RDb0xYRFN5VC9kc3UyK2dZWjZuYWM2OFFp?=
 =?utf-8?B?ZFhqQzNZUndRTDc2Qkw5UDVyU1l0TzZqSk9Ock50cG9majJzUWh5TmxwVWF2?=
 =?utf-8?B?czN3V0hHamFYUmtGNGdhVWZQeHJ6bG1NUEFSNEMraVFWR0hLTkpRb2prY3Ry?=
 =?utf-8?B?OEk0dXhjYTlqYWZRMys2dXRDdk9uM2pMRUMrUWVPdHF3dkRNSWhpOE00dUJL?=
 =?utf-8?Q?Ics28eVfxyTz8o6aiwWyVw37D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 148b0040-45bc-4552-266e-08daf7c2aae9
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB5544.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 13:07:49.4324 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P5IcCdGDI/BYjP7UhQ6QST7ZbkGlFNBnSOQnsl1ji8tKvDGddkKSg1+4lfJs2w2EUslbMpuvR2GNZnFrF4SCrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4869
Received-SPF: softfail client-ip=40.107.95.54; envelope-from=avihaih@nvidia.com;
 helo=NAM02-DM3-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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


On 16/01/2023 12:55, Cédric Le Goater wrote:
> External email: Use caution opening links or attachments
>
>
> Hello Avihai,
>
> On 1/15/23 19:35, Avihai Horon wrote:
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
>> Reviewed-by: Cédric Le Goater <clg@redhat.com>
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
>
> This is an unknow type for windows and it breaks the build. I would use
> a 'uint32_t' just like device_state_v1.
>
Sure, I will fix that.

> We should be fine for compile after this fix. See  :
>
>   https://gitlab.com/legoater/qemu/-/pipelines/748114331
>
> Next step would be to include some tests in QEMU for CI. Is there any 
> device
> for which we could extend the model and the driver to exercise 
> migration ?

Yes, our NIC supports migration.

> I think this would be very useful for tests and maintainance. It could be
> done in a nested scenario, and virtio devices could be a target. Or we 
> could
> introduce or reuse a dummy one for the purpose  ?

I am not very familiar with QEMU testing. Can you elaborate on that 
please? We can also take it privately.

>
> This is not a request for 8.0, only a good-to-have feature we should 
> think
> about for the future releases.

Sure, I will add it to my list.

Thanks.

>
> Thanks,
>
> C.
>
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
>> index 9df859f4d3..f19ada0f4f 100644
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
>> +    uint64_t mig_flags = 0;
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

