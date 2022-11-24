Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0CC637925
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 13:43:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyBXw-0006zZ-Tf; Thu, 24 Nov 2022 07:41:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1oyBXf-0006xO-6k; Thu, 24 Nov 2022 07:41:23 -0500
Received: from mail-dm6nam11on20625.outbound.protection.outlook.com
 ([2a01:111:f400:7eaa::625]
 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1oyBXc-0007KW-Ce; Thu, 24 Nov 2022 07:41:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cTDbVXRlygon1/EO//TpB4PU/wqfNoiLTQDlalyJFEYmbPvZrXB0Rq10gP772yKFWQUY0ipZtFTqxxpMpHcrFco7OynmsIxH2CUVzrSvj6KMy3TaLR1kDFpTWHP3Bi4Vb5lSUL6nuo+UxOfKPc1wHq44kHHGVGoHJ7rnn9V3GoJT4Kzn/1+jeVw15AJNy3yaYM2PpX/fhoufI66XL6czFe83h+c84TiTwkj1KW/R2ZMmCkyW42NLHFd5qYUdSvU0x8YA81C5WokQAUJ6NqhounmKRhI7TVX2Q8aCzFgmyERTb81qHsosSILn3AGI/vsUxtfoHvUysChNOL9oMt4DyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SaaTpW69yV5gnbij9o8HMXq7oyPbsjyLrIEGknHEntA=;
 b=W46Fll2OU3lVkCcEXcHY1wl0ouJi9Tozo7KpWo/YPMoakwlwXswxr29fjuaF7ptCZBLeZJ+mPXSpdFWHyU1hLx91VCmpjBswD7MGYe6LfxsiLxIYDMu8+U6J7REshxU29QkJjscsdWXtO7PIo3HV7+q0q718M4Ddim4/mCvV0LQw0wBObcgd2fSzqaFmc8McPsIdhkZvnos817GHWUqLa1fClwBPdAgagN+TEHC+KkJQ3xgiToKwVqCw6nE1K7RQ1kFoiYMKVQn1ZdpZtSyIo33Az1VoPB2mM/dQ4u9sFOSjmInMJs5pUGQ9HQrcyEfg/iqwooPJO9kqZ4tFNO48hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SaaTpW69yV5gnbij9o8HMXq7oyPbsjyLrIEGknHEntA=;
 b=deDNr2SuPs6b6c/HOEZfvdcOz+Q9sB10jur9chzATqdfXUbcBt3SVQ49IKgW5NwmESv2HLX2UOgekcktNtsPNEFao48rLPYSTmMfrtFrlpCxx1c0f5+JWU9S33aAI0nDve6sglk+j2P1A65wS7baa86lCIuWGRxDUtJMmWkQWj4TQDfJ4DyEVFFXGHH3zdwx9lgbfemAM7NUKBnwhYXIkQKZCuCg352xACLDf0Px+Qj8pi6kTo8nOfspEYqsSnkjKA+QX/bQr6eJAPpzgUXhKCZtJy8hOx1O68L4KwSTziSQXmz3iYcwKfrO5UJrQx/cded3swTZwAATXFoN17H7oQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by BL0PR12MB5505.namprd12.prod.outlook.com (2603:10b6:208:1ce::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19; Thu, 24 Nov
 2022 12:41:12 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::820f:1fa0:9353:bece]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::820f:1fa0:9353:bece%9]) with mapi id 15.20.5857.019; Thu, 24 Nov 2022
 12:41:12 +0000
Message-ID: <a867c866-c297-960c-6fe3-51f292f4c6d3@nvidia.com>
Date: Thu, 24 Nov 2022 14:41:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 12/17] vfio/migration: Implement VFIO migration
 protocol v2
Content-Language: en-US
From: Avihai Horon <avihaih@nvidia.com>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
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
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Shay Drory <shayd@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>,
 Joao Martins <joao.m.martins@oracle.com>
References: <20221103161620.13120-1-avihaih@nvidia.com>
 <20221103161620.13120-13-avihaih@nvidia.com>
 <20221116112935.23118a30.alex.williamson@redhat.com>
 <099b99c2-8949-c101-45eb-9a8aaed2adb7@nvidia.com>
 <20221117103829.18feab7a.alex.williamson@redhat.com>
 <feaa77ec-c574-6267-0872-d8769037e4c7@nvidia.com>
In-Reply-To: <feaa77ec-c574-6267-0872-d8769037e4c7@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0074.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::16) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB5549:EE_|BL0PR12MB5505:EE_
X-MS-Office365-Filtering-Correlation-Id: 35c3b1a1-e627-4042-51b4-08dace192b66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8sYQ/wLtBewQzovd2ebZgRGqDQjf5atj9ymC+f81hJCNUEA7us9P63AULqQIe2jnYD5jTDdYTPwd8RDIAZPyoNGZ3QsGlzmmBow+CFLBBYVjpI4uSh3b/BcuIW5MJJ0ma6eLx3kJ4JbZFWAhsirWTJiwpplhvRnauLKomrDj7YaB3bZUoJP4tSLKxlGQUWuvfkpmv33VPKN7BCRDLYcBnrLtfAPloOLXAoBF9+uvjUgACNpcrB5s649p9iO6waNxUkV3RXSTw2aoI6W9T2JoUtuk6WsGOU/nr3q3rJMEeytboRWOYF3xGCdokss5St+QDsHeXUeCuEDRQ/pMcXbXK3zSIhZ1/Da79/drdk5ORBWdW7/YLQ532mUCyOfV3C6dzvIEqlsnfWD0OOK+lns0+azNN1dQJShUlp4OMLXEk+82OIyePrZ2bK/iOLHf+vMnUF+00k6y5p+E7LSRHsPiSqLyh5QGdT1lXeGeGSoroqKMsuu9l0B5RNV3vjQ6TswJAiuXB4rMc9mfRb+er+cWCZGIXFABEnGZnuOTlg2Wg/E/ZBkXaI3mMlt2RyoNkQ4BrVxDp9VCmWdq9zTi3KXeSBNsjotjdcxCbUqUJuhbPQ5C2GTjZtlQALTJpktKlGUlMDluMX18cL06aGNf0TBW3d946CFzTle4bYHu32drsZ3NZwSm+nFOCb59Mx0qdPbYmaivE4wokiWM0clRD6Id63z00BTw2WqJkrnHISDFP9A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(136003)(346002)(366004)(39860400002)(451199015)(316002)(6486002)(36756003)(54906003)(6916009)(83380400001)(478600001)(6506007)(6666004)(53546011)(6512007)(26005)(86362001)(31696002)(38100700002)(186003)(2616005)(7416002)(5660300002)(31686004)(41300700001)(8936002)(2906002)(66946007)(8676002)(66556008)(4326008)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTIzUWY0OEZjbkIvY0NLZnY1Y2xOTXR6cWp2R0c4bWtJdVp6RXRxcTdvQjlC?=
 =?utf-8?B?VEVOWVAvWGZBQWc5UmJjeWIySUFRbGllT0lHU3R1Ui91Smx2OTB2Zm8wZUo4?=
 =?utf-8?B?ditBMGxWajR5eDR2N0JiQkY4REtmMHZnNHNoWnVLSEM2Zy9lUkFaUzJRdERR?=
 =?utf-8?B?aS9yaWI0SUozSFdJSHVQZWRyTGNobjVDbFNVY2tCK0d5Y0VZRFczQmNqQnBB?=
 =?utf-8?B?NEN3eTBHR2hzbVZNN0lNc2JHOVdId0RJRzhUcGw5RkZHOE9RTmtaQjFvMHlZ?=
 =?utf-8?B?R05jZkdxMW83aUx2VzhubWlLcEU0MEVTM0lGU0NOTk9nTHFNU1ZSSlpPeHdx?=
 =?utf-8?B?Wm5YYVlDMmVMU1VTZ01Td3FYbWZvUzdrYTRyWGRaYjhESjB3QlhualBwajZ0?=
 =?utf-8?B?R2RQazQ2UElVYjU1d3Jia1AveTFYRzF5dDVuODh6OXM5Rm1jVjNxVGoxTEJw?=
 =?utf-8?B?alh4NVc4bUZSa0N6Vmx4OTNVOEpjYmlpU2R1ZElacGdiL1NrRTcyL3VhVEtB?=
 =?utf-8?B?WUVmejlYYkh2L1dtZUNoaEt1WVhnd1FPTXJaY3krTzMwMkgzWVpxQnFlTC9r?=
 =?utf-8?B?d0xyTmxHMnhoWThEelRBZmQwN0pGZjZpbDFzaUk5Z3NpWnNZSXAzblV3Qzk1?=
 =?utf-8?B?QXdHdmp5K3hRcWhVWkk5TUhGRGl0Y0hnc0UzOGFrZWJVTFI4RUVWMWh4ZTcw?=
 =?utf-8?B?Tm5oMmJRUHBrV0V3TTBYWExpZnFleTZKRmwyS2lDRERiUXRMdnphb1ZETWYy?=
 =?utf-8?B?azhqSVRoOGpBM3JVa0d2YmRWbkNWTEpsQmQ2SVo5MHFsOEM0VzVJc2R0aXdY?=
 =?utf-8?B?UGViQ2Q3MjhIQnFGbzhhdzc0S1o3cmwvOUtqQk5EWGlaY29vOEJ2czB4eU1R?=
 =?utf-8?B?YiszbmFsS1ZaczBiUGxYQWMybjZkbnZ0VHJ0YTZWcXBnRG52UWZYWHN4NUpZ?=
 =?utf-8?B?VGE3Mzg5UUZaeGVmMkdTWkJFbUlqdnYreXd2SkFGY25wY0EwWWh4cFI4VC9D?=
 =?utf-8?B?UENndDZTT3UwT0NaOHMzN0h3N0dEdm5wSWlxaCt6OGlCUDBlbUs2R3hrQW5D?=
 =?utf-8?B?Q29vNktUYzlibnoyV1dwcGhUSGFhUDVqNXlTRmRkdkFRUW45NlhqTGlqQ0Q4?=
 =?utf-8?B?dytzYnBjanN3Umg5M3ljSWo4TDZyTUsyTzR1NnZwM3RLa0ExQlZHWU5qdUhQ?=
 =?utf-8?B?RUM5STZFNGNGZlFzaGFoeW42T0Y0UkpWN3E4a1hiOCtGZ215bXlLaDJRek81?=
 =?utf-8?B?UXdueGEwd2JIbDJ1NklUSGsvTXY3OWhnUERxVkIvVHJXcWl1bGE3TFNSbWhT?=
 =?utf-8?B?WGhQemZNZVNicU5oV3kydkpZOU1jRmtRUVNCejR3RXQzWEtXYzVGdDhjUGZr?=
 =?utf-8?B?NGlOVjZSekU0dE9ReWtXemNhS1FjUW9adG8xNnpIYXp5VVc1OUdZNkpSbW1W?=
 =?utf-8?B?cFJWTk5iR1dPMkgwbkEyL2pCZEt4V1NGdjh5Qlh2ekE0TDlUcGxBclkyWmZm?=
 =?utf-8?B?UUcvY0VhU0hJaEtaWHZjVm9yMHBtYW9XRFlxY2ViaVJlMHFxYU8wZWN0OG0z?=
 =?utf-8?B?WStVV2owMlpDMldiVDRPZytSVk1FSlp4QUd1QU85Q1dPNXY2bVVzaFJ1TGdO?=
 =?utf-8?B?dlIrelc4MmZwS28vY1lSYmlmOGgxaFVQS3g1L1VobmwvUG1JQnRQeTF5VXhu?=
 =?utf-8?B?aUdSTDlFd2dzTGlqWnFVdmtSblFqcERZLzNOL3FwdVVuRGJPMEh5aWhzM1I0?=
 =?utf-8?B?VXFKVnBQQmdoaG5Nb1FVM25kcG1uSEIwcVdicmh2UHZhcm1rOUxZWEl1U2tU?=
 =?utf-8?B?dFlsOE1YNUFZbHc5eUl1UU5LSnloM2wyM3dGNmd2Q3ZFTERSczFQUEsvRUF0?=
 =?utf-8?B?UzVmMlpLVnJDSCtFdVRrZVhSeGllcDBqRlo3TisvSXR3b2c3NlFxU2JMWVpr?=
 =?utf-8?B?NnN4UHF5YitJVFg5blY0U1BlbFgxOWNiZ2NocVpDWEdMZkQ1N3dINm1aN0Nn?=
 =?utf-8?B?emF4ajZmQXg5RDIwTUJqdWVDNGFHVkZWRjlEVjhvZU8ySTRzK1ZydGJuMU5I?=
 =?utf-8?B?bzdoek4rV1plbklIWWlITHlHRWtrTlZMMGFHYU5yUUY4allSeUVJbFduUlJu?=
 =?utf-8?Q?dl5AFLhwXhXYiukPFkajTnGb7?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35c3b1a1-e627-4042-51b4-08dace192b66
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2022 12:41:12.6647 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: niNL4BIr7582BgvPBxJaVnLDuoO/4cJSRgItO86DmOG8Np5JooWthpw+lV9Wd32yH0efnzNfBd+5q2x9m9bZJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5505
Received-SPF: softfail client-ip=2a01:111:f400:7eaa::625;
 envelope-from=avihaih@nvidia.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
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


On 20/11/2022 11:34, Avihai Horon wrote:
>
> On 17/11/2022 19:38, Alex Williamson wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> On Thu, 17 Nov 2022 19:07:10 +0200
>> Avihai Horon <avihaih@nvidia.com> wrote:
>>> On 16/11/2022 20:29, Alex Williamson wrote:
>>>> On Thu, 3 Nov 2022 18:16:15 +0200
>>>> Avihai Horon <avihaih@nvidia.com> wrote:
>>>>> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
>>>>> index e784374453..62afc23a8c 100644
>>>>> --- a/hw/vfio/migration.c
>>>>> +++ b/hw/vfio/migration.c
>>>>> @@ -44,8 +44,84 @@
>>>>>    #define VFIO_MIG_FLAG_DEV_SETUP_STATE (0xffffffffef100003ULL)
>>>>>    #define VFIO_MIG_FLAG_DEV_DATA_STATE (0xffffffffef100004ULL)
>>>>>
>>>>> +#define VFIO_MIG_DATA_BUFFER_SIZE (1024 * 1024)
>>>> Add comment explaining heuristic of this size.
>>> This is an arbitrary size we picked with mlx5 state size in mind.
>>> Increasing this size to higher values (128M, 1G) didn't improve
>>> performance in our testing.
>>>
>>> How about this comment:
>>> This is an initial value that doesn't consume much memory and provides
>>> good performance.
>>>
>>> Do you have other suggestion?
>> I'd lean more towards your description above, ex:
>>
>> /*
>>   * This is an arbitrary size based on migration of mlx5 devices, where
>>   * the worst case total device migration size is on the order of 100s
>>   * of MB.  Testing with larger values, ex. 128MB and 1GB, did not show
>>   * a performance improvement.
>>   */
>>
>> I think that provides sufficient information for someone who might come
>> later to have an understanding of the basis if they want to try to
>> optimize further.
>
> OK, sounds good, I will add a comment like this.
>
>>>>> @@ -804,34 +1090,51 @@ static int vfio_migration_init(VFIODevice 
>>>>> *vbasedev)
>>>>>            return -EINVAL;
>>>>>        }
>>>>>
>>>>> -    ret = vfio_get_dev_region_info(vbasedev,
>>>>> - VFIO_REGION_TYPE_MIGRATION_DEPRECATED,
>>>>> - VFIO_REGION_SUBTYPE_MIGRATION_DEPRECATED,
>>>>> -                                   &info);
>>>>> -    if (ret) {
>>>>> -        return ret;
>>>>> -    }
>>>>> +    ret = vfio_migration_query_flags(vbasedev, &mig_flags);
>>>>> +    if (!ret) {
>>>>> +        /* Migration v2 */
>>>>> +        /* Basic migration functionality must be supported */
>>>>> +        if (!(mig_flags & VFIO_MIGRATION_STOP_COPY)) {
>>>>> +            return -EOPNOTSUPP;
>>>>> +        }
>>>>> +        vbasedev->migration = g_new0(VFIOMigration, 1);
>>>>> +        vbasedev->migration->device_state = 
>>>>> VFIO_DEVICE_STATE_RUNNING;
>>>>> +        vbasedev->migration->data_buffer_size = 
>>>>> VFIO_MIG_DATA_BUFFER_SIZE;
>>>>> +        vbasedev->migration->data_buffer =
>>>>> + g_malloc0(vbasedev->migration->data_buffer_size);
>>>> So VFIO_MIG_DATA_BUFFER_SIZE is our chunk size, but why doesn't the
>>>> later addition of estimated device data size make any changes here?
>>>> I'd think we'd want to scale the buffer to the minimum of the reported
>>>> data size and some well documented heuristic for an upper bound.
>>> As I wrote above, increasing this size to higher values (128M, 1G)
>>> didn't improve performance in our testing.
>>> We can always change it later on if some other heuristics are proven to
>>> improve performance.
>> Note that I'm asking about a minimum buffer size, for example if
>> hisi_acc reports only 10s of KB for an estimated device size, why would
>> we still allocate VFIO_MIG_DATA_BUFFER_SIZE here?  Thanks,
>
> This buffer is rather small and has little memory footprint.
> Do you think it is worth the extra complexity of resizing the buffer?
>
Alex, WDYT?
Note that the reported estimated size is dynamic and might change from 
query to the other, potentially leaving us with smaller buffer size.

Also, as part of v4 I moved this allocation to vfio_save_setup(), so it 
will be allocated only during migration (when it's actually used) and 
only by src side.

Thanks.


