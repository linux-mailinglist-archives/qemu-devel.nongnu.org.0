Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E4C631326
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Nov 2022 09:48:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1owfyM-000291-VD; Sun, 20 Nov 2022 03:46:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1owfy9-000286-49; Sun, 20 Nov 2022 03:46:30 -0500
Received: from mail-dm6nam10on2062c.outbound.protection.outlook.com
 ([2a01:111:f400:7e88::62c]
 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1owfy6-0001Og-LT; Sun, 20 Nov 2022 03:46:28 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HEf3g2sWLMyhtAR3+HxnKuKlE2bYQtu6GYDMgbY3Vh5hEvQeyKDHP0a4qPRnTuXCJnEBVexgFdOHaf+Cm8q1vW+6PmKl//ghCaSOOZrdsmziQiYO/Ztl9VhQKMaVbF1MSYMJnKPjr02MSzOcY2d7RpPlVSElwcmn8GP4xYOcQWkTWsHLM5QXehZFsx8/N1sKPmPQSQDdz1CnzQ4GxD5ZCyE7bzihGhUzQqS9mW0L2A/j9XITVgKOqndtiNcLH+SG3x3ycyj/XPo2Ph/NxX4uuFLxrMZD/tdh9smoH9Hw73hpB+a90LoGxh2vxtYssLXwSle2mL95TR6mS3uDYITxDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JzIHMLw2ZaZfN+WjCsJbKg/iFUMvJerr/dUv5J8xYbg=;
 b=O+RBsDbEe/QfRXBGdoyWOP+gN4mPYIirpmNQ3IYNbRnPkDO6ejtH7YCj6T5qlnTtdFDVLRDP9/BNodwK7ZwbFt9kkpoW2tGD1Z+Iuo38UPlfL0aeTr4QzFAZnYIS4nJQHsCPIFElzsZZ7SPWQ+Y7QKFimowkS1hn7UjpSu1F/yYTizRUbcjVrtnNmixXKu0ErEDDGB9bYxrjFFVTqGyxHYBrNQtZF4r4FioR++Hth9oCW7fgnAeswLvegvktWYJSeJXhUsSxrHonktu4MvAll422NSYr5JmL1fv0z9q0wO5Z9Tyo5SPPNS2IcXJrav/EOmzods1OlZ5qTjQZdNwuLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JzIHMLw2ZaZfN+WjCsJbKg/iFUMvJerr/dUv5J8xYbg=;
 b=PkDX7EDDsszi+v7FyQFoNX7itZed+BBIV4UYSiHUA7Asg0Kv8WKRKpj2GfnjmAQqWa2XPGIVNgk8O9w0pTwfGSLjJQ1C5pot3CeFi8hEji7d420NdcCQ0EsUGeOeeRSSv1Ul7nQOEau+1Eng3hK9VAdlx0qDZSpbTSXMVj6ZICQkdlaxuYBe1+c0q2LyZ7AYJBvGXA/cEhNSA2owFn3KeoBe523gt3aCeNNs2HSIQA0PtD/Bcx7s9FBEUg0H+iGnbYtvYVuf7q4UZIzNPDanRxaDTCDhWeR5moj8e98ZO7MfCeG2gkZVnOBdyeArehWwjY/DZV/Y4H+XWpOYgMv7fA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by DM6PR12MB4154.namprd12.prod.outlook.com (2603:10b6:5:21d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Sun, 20 Nov
 2022 08:46:20 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::820f:1fa0:9353:bece]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::820f:1fa0:9353:bece%9]) with mapi id 15.20.5834.011; Sun, 20 Nov 2022
 08:46:20 +0000
Message-ID: <749d8c49-13f7-bf24-adb3-cf946845903d@nvidia.com>
Date: Sun, 20 Nov 2022 10:46:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v3 12/17] vfio/migration: Implement VFIO migration
 protocol v2
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alex Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org,
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
 Kunkun Jiang <jiangkunkun@huawei.com>, "Zhang, Chen" <chen.zhang@intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Shay Drory <shayd@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
References: <20221103161620.13120-1-avihaih@nvidia.com>
 <20221103161620.13120-13-avihaih@nvidia.com>
 <20221116112935.23118a30.alex.williamson@redhat.com>
 <099b99c2-8949-c101-45eb-9a8aaed2adb7@nvidia.com>
 <Y3ZuXSM9/dft+sDd@nvidia.com>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <Y3ZuXSM9/dft+sDd@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0126.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::23) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB5549:EE_|DM6PR12MB4154:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e7216de-60c0-4035-7ac6-08dacad3b1f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ByubJawyE1cayb39vV8ujX8c3gumQ8AfQYMT9nW6MujOZ4PK7oQKVdEPRVqBifyKWovjGv9cBNZuZbqMbEpd4D8TDrOqkrcGLIW3lgf/J1YobRKKXxDhEWwrF5qdhjQ9ryxYTeRSH5h1YnluqsxNIX7WTZuDPbQWvfHPWrZlzxkQ+gSX8phhwFvrXPvR4THxpl/EZchTfRAc8DbxURleFH5S92afRelUc/Q8ep4SxXQ6DOKeHg5vyobpbuLw3851v8yTRELarkhKS3h9xw8gOFKIwq0pN+lGgekmKkFL2nnCtZkdtEkrNr4dBhMcXQqYKaImSWBVtZUI7a/xwfGwBVBLP1bo0p32rzwl4Jtz1rXvmpKDb5xt5KwxAN+B1Vk/l+v3PZRDWlx6NPPK3FKDI1j/p15i2tT3lqPke0phIjwNY9sV5b4Lxec83N44K8kbrmVtbDjPmDWajFzkFR2rsLdGByTvRfWaGaRxMykgY8RRgk91kbVrzZNDtku36ziM+2KQ48I/x0HMMZlogxuFF+KM7mp+zVAZWi8jQHd1WBjbRY1s2PLlua7mKS3aZaxsAKK55pBknBzRnFuOPIAsD5uNlSter7tNPVLYt0iQkLdfDNOVg16gE2VtsiukoAL2YnDxaztIIsgzbizc8/yr+tiwwopcR/Q1ghhxiUkeW9A5K0pw/sRbxH5md+SzYpZ9TAj+Ji7EKFj5sKuBQhKSwPx/EstWCXpo77PfgOHSZf0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(376002)(366004)(136003)(346002)(451199015)(86362001)(6666004)(316002)(41300700001)(36756003)(5660300002)(186003)(7416002)(2906002)(6862004)(8936002)(83380400001)(2616005)(31696002)(66476007)(26005)(53546011)(37006003)(6506007)(6636002)(66946007)(66556008)(6512007)(38100700002)(54906003)(478600001)(6486002)(4326008)(8676002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDVkU1c1UzVYd2M2TnRCZUkyRUU5RlVaVHVsdWM2emdQcXVDNG5EYkN4T1pG?=
 =?utf-8?B?U2VaOTA4Q3RSVVRNd1lHZEltMTFvSW1vVEp2dUhCQWR5S3pMSzVOR1ltRzF5?=
 =?utf-8?B?SlJFUTRPUklENWYzZGFMblRLbk9GSFJPTk9XVmJjdTdTbk1aVXBrUUlPY1Yv?=
 =?utf-8?B?NWJmZFo5Z2RIVnR4U1NINGptcTNIR0ZXTHM0SlBlZkZQcnA3WnBHWExyc2lZ?=
 =?utf-8?B?b1lwdzNLYit2YW00WThJN3BENS93bXdBeUdxRENGeUtnUXBKZDRPK0YvL2x1?=
 =?utf-8?B?UzlBYVZuRjQ3Ky9MTHlsT3pndC9IQ1VZcnBwZFdxcVRiMTMrVmNuZjI5dmp1?=
 =?utf-8?B?M3RKdHEzQmxRSU90T0pPMGdlUmZsa2hyK0tRWC9jRFRIWHAvRjM4bGVTL0Jj?=
 =?utf-8?B?K05zMXJmM0Vlam9sZitoeXJkYXgyRkhraWREYXh2NVFNa0JMcVN0UTR4QlFj?=
 =?utf-8?B?YzZsL0N4WHFRWE5jWFlrM2hpc1gxa3RBWTVxcUh6cGxpTUNzT1J4SkNUSjFx?=
 =?utf-8?B?d2Q4VWZLaFozaVgxMEUxZDAvbkZmTlR0bTBjRW9JOHhaTUwyUTBOWXRleGFo?=
 =?utf-8?B?dW81T3plZFJqU0ZQbEh5ZnQyM2U2TTVEYW9lN1p5MDg0MlNwa2VOdFR3aEJz?=
 =?utf-8?B?QXdxUS92WDhNcGtIUWdnbXBKamNpdUhORnBycytsNnRCOTk2bmhRdVRDemtn?=
 =?utf-8?B?TUU1VmRSRjZLM1lFamxmZUtWamxOV3ZPZFNkRmFjNUxyRVNod3ROeHBNU2lV?=
 =?utf-8?B?VUdVL1ZVbWJ3eDhmQzQ2dGlNTktMaHJ0K0xqdnpQZmFhelo4ZlFYTmI0K3pa?=
 =?utf-8?B?K2RZaXJCOXMwVFlQM2Y1Ylp4bU9SQUpXczFmQjBjU1FSMGUyUEFCL21hT1pm?=
 =?utf-8?B?TWt1bnRuY0Q0cnFuVGpaWTFTWVBDMXBLc2YrWVFzeWFIczhlb2psdG95TndU?=
 =?utf-8?B?TEpFR0ZTMktsRC9zOXQ5ZTZwdlRPUVdUVVNqMlBPU2Q1UVNnK2duWlAzWHVw?=
 =?utf-8?B?a0E2Q0FBT3R6U0pMcitrZ0RRUHQyNm5ZM0VLOGdmaHNUN1MrR29VUys2SEtu?=
 =?utf-8?B?QkJDUEI2Z3lPd2l3Q21RdmcrTGdnVUZVdllzMWJ4dHBucUo3MkNFSm01c0ls?=
 =?utf-8?B?b2o4aG0rOEJ1VWxXSGpXbXl3cWtnNGFoREMvUVFTSWRGeU9PUmE4N2dQaDBH?=
 =?utf-8?B?NkFrWHNFYTE4T3ArVEtwR1hZckhneFQzYXZJSWhoeHRabE40dlBSSjkyejQv?=
 =?utf-8?B?eENHelFiWlVIRUtjcVFoT0VEOTB6ejgxV0ZaVzJiVE9YY2xkMXZJVWhYTzF1?=
 =?utf-8?B?ckFGR0FFcTg0U3NPaUpNRGtGWVNvTjd1cGhnNFFVbzBnb3RaZ1g1Wi9ZL3ZQ?=
 =?utf-8?B?dWFWT0xBVm0xMWJ5d0wrM1ZPQzBVQzNXV3R4VXRnWFFGenZnUjI3SGRtd0xE?=
 =?utf-8?B?ZkN3TWZMUkRnS1kzRjRDTlkwNGkyNVNXbjcxZEtDYXNZdU5tbS8yVEVVdXZ2?=
 =?utf-8?B?UDhqSkQ1bWVVNUk1d2ZBVk91VGRnZUhwSDgzNWgrUHJNZ2hmL2hzOHVZS1J0?=
 =?utf-8?B?YkxXZ1I2d2cvb0ZOeGJkTk1QVzdFZVF3L1BKTkx6RXAxcXROMndQZkhoeVJI?=
 =?utf-8?B?cktMR2FyNC92Vmg1Mmt2aGJIWnNMakdZaE1TN0lCVlYxeTVjQlRzWjk2K2dw?=
 =?utf-8?B?VTYycU9mc3JYZG9Sc1QwWStkRWpmQlhzbHkwYWZvRVM2THptOTIzTFpyTTkr?=
 =?utf-8?B?SkRhMVZHVFg1SnFzVW1GdUF0Z2ZZZ21nSDRZZm04SHp2ZzFUdWEyMlZkUlBY?=
 =?utf-8?B?TDVvYVdEeUZJZmM5OGppakc0a2pXNndiM1hmemJ1UzJORHQzUjNOa1MvbGEr?=
 =?utf-8?B?bGVVY2ZuNU54cTdMTUUvei9KdHdRckNTRkJBUkRDbGowamp2akdCNjlmUXhD?=
 =?utf-8?B?UGRiZDVXbHBKNkdCUlJydEZxcHdITmNOMmY2RGhCQ1lKa2xUSTRkWXJ6Sm9k?=
 =?utf-8?B?NVZwYkVJbHBqR1ArbDI5NjIwcTVRckFZNGVRNzlSMEM0TFdyMEs2WGp5MlQ2?=
 =?utf-8?B?WVhSV2xxcW42ZlpBWWl0dFZwaVFhSTVVQkxnU2NoemlMQjV4V011UjBsbFB4?=
 =?utf-8?Q?3LYWC4USPADe9CjbRAThJCP/A?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e7216de-60c0-4035-7ac6-08dacad3b1f7
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2022 08:46:20.2311 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Q9AnOPoLHquwENlaDQ5z4d538yReoqJCypPu+lkaEY2URRGMvsbgnky71HyCPSjnmwRT+gCESw19nfW2WO+Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4154
Received-SPF: softfail client-ip=2a01:111:f400:7e88::62c;
 envelope-from=avihaih@nvidia.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
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


On 17/11/2022 19:24, Jason Gunthorpe wrote:
> On Thu, Nov 17, 2022 at 07:07:10PM +0200, Avihai Horon wrote:
>>>> +    }
>>>> +
>>>> +    if (mig_state->data_fd != -1) {
>>>> +        if (migration->data_fd != -1) {
>>>> +            /*
>>>> +             * This can happen if the device is asynchronously reset and
>>>> +             * terminates a data transfer.
>>>> +             */
>>>> +            error_report("%s: data_fd out of sync", vbasedev->name);
>>>> +            close(mig_state->data_fd);
>>>> +
>>>> +            return -1;
>>> Should we go to recover_state here?  Is migration->device_state
>>> invalid?  -EBADF?
>> Yes, we should.
>> Although VFIO_DEVICE_FEATURE_MIG_DEVICE_STATE ioctl above succeeded, setting
>> the device state didn't *really* succeed, as the data_fd went out of sync.
>> So we should go to recover_state and return -EBADF.
> The state did succeed and it is now "new_state". Getting an
> unexpected data_fd means it did something like RUNNING->PRE_COPY_P2P
> when the code was expecting PRE_COPY->PRE_COPY_P2P.
>
> It is actually in PRE_COPY_P2P but the in-progress migration must be
> stopped and the kernel would have made the migration->data_fd
> permanently return some error when it went async to RUNNING.
>
> The recovery is to resart the migration (of this device?) from the
> start.

Yes, and restart is what's happening here - the -EBADF that we return 
here will cause the migration to be aborted.
I didn't mean that we should go to recover_state *instead* of returning 
an error.

But rethinking about it, I think you are right - recover_state should be 
used only if we can't set the device in new_state (i.e., there is some 
error in device functionality).
In the "data_fd out of sync" case, we did set the device in new_state 
(no error in device functionality), but data_fd got mixed up, so we 
should just abort migration and restart it again.

So bottom line, I think we should just return -EBADF here to abort 
migration.


