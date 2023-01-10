Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7092B6644A4
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 16:26:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFFIi-0008Br-QP; Tue, 10 Jan 2023 09:08:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pFFIb-00089P-HV; Tue, 10 Jan 2023 09:08:25 -0500
Received: from mail-bn1nam02on2056.outbound.protection.outlook.com
 ([40.107.212.56] helo=NAM02-BN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pFFIZ-0004fW-CD; Tue, 10 Jan 2023 09:08:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MuZvPEl24gXSRM6enRf3Z1UBIBBcvDAvirpzxyvhwAfy9Uggkw8egnIA0Btl5ko7kHkInoHjL+ChTOBxjN5RXthh0KefoU5ye2m88TwwbHtJribz8kqAcdBcCIfnXeq3Qet9vgPQeLSQgeY2RqYg2L53WSKSeBDCroAA075ZvbFWknBbHE88dcBPkbi9WkaU8s5v2wNvD/hpS2TvN8Bvbx6qgs56NPVyJPsfzBW3wPtjndIIGaifXlZmv0mxSwuW1NvIxvVgQwMx6q3buBuTKtmr1Vsc50blzy+VwjGBOiUJryF4NHsvpvfIvwCwxM42cV3l545EqGtEweMLLLRv+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nsY2y48d5RUkDhPAaN//9bxQjKwHwBcfGSS/Sv0psLo=;
 b=f4ofNb9UhPfnmZEjvyPDj1+g8J8HtUQ7gHk90FLYHIy5TUMAq9KtTL+q0X398pUKvZr3mYazJNI+alv+hGm4Tl8z/sx7FdfEPLUX74vcMk5vEDrrPOhb5ZspBKEV1tGveWMhCYfrpGWDg4SNwpTMMI5AUon/9CcET+5v41pbqCpZnPh408aP5HOGsb4yMDLvwqhv4kvF8BfSNdOg7Y/Bv04GacqWa3JkzZ+tq1JDu+QMXDokj5MpadKBw/k2w4zMZWWC620/JOOiJ3hghpYTpOlC6U8WoGfsSpPSNAcXrLHbfhD85q18joU8jCVfCV8TvkjHKZXwYp4gZv5VXl9qzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nsY2y48d5RUkDhPAaN//9bxQjKwHwBcfGSS/Sv0psLo=;
 b=mF4MN8e33FeF5zwGK0+a3Bk+T+IVOO03QITPq2XEvF9Tgb2/zCwSpefj3ybnx/pyll6tutTcgZ5UOFS4e+rX5Bk1uwPPiJ9n+dn58vg8XTXTonDpNp7dqrF2m7LADtxgy7fzj7U9TloaTRT7arv51CkzKQcrE/Ra+BB4LbWn41E4WYExvlYy7U6HISv6I76f0NEWIFfejloWjwu3JxD0ByH8SK1gRO+tJ3PMoIrW7YCuktOO1dPPT7C4uVL7E6fJGquOEa6MG4Aip4W9p+TH62aJ9P42vCn5kCSwRtNGZ6BKnv5h4RcqAlvTlpkMQeOYmtbYQYKVhIxibm1Ztc4Qew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by MN0PR12MB6317.namprd12.prod.outlook.com (2603:10b6:208:3c2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Tue, 10 Jan
 2023 14:08:12 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::451d:1f37:aa83:f425]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::451d:1f37:aa83:f425%6]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 14:08:12 +0000
Message-ID: <ad2f5ab9-8529-0286-53d6-33e5a63c94b1@nvidia.com>
Date: Tue, 10 Jan 2023 16:08:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5 10/14] vfio/migration: Implement VFIO migration
 protocol v2
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>
Cc: qemu-devel@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
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
 Yishai Hadas <yishaih@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>,
 Joao Martins <joao.m.martins@oracle.com>
References: <20221229110345.12480-1-avihaih@nvidia.com>
 <20221229110345.12480-11-avihaih@nvidia.com>
 <27a868cc-d816-76f1-1ce1-60b6552d791f@kaod.org>
 <5ccd6f67-3ad3-c9dd-634e-d2d0900c429e@nvidia.com>
 <0bb116fa-3609-8b01-0a16-10436ba6cc56@kaod.org> <Y7xex6YisfjZoZvj@nvidia.com>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <Y7xex6YisfjZoZvj@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0575.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::7) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB5549:EE_|MN0PR12MB6317:EE_
X-MS-Office365-Filtering-Correlation-Id: 55e77d93-d019-4043-59e3-08daf3141bdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S2CJM86miLZuE04UiiE3E0nzZVWMwn6SlMRAnFMsaQ4qUfNDgmPiXdIh6xijEVeKz9RTc1inMM+QxJD6N5z17I/2ThGtEDJmH2Q8iKQe9+PCBow5aOVyyu/I6YljuGrlcT+P+4+8+htARv7UFHYhx3npBCOZvgqAZ8Qp08JC9QpVFIyzePHPXr4eD4Z5wPa+1+3eRjb4uBHdb3MkjBmbZhjx913bychJmzRntUVUyYK47NycXCU5iXE2xgV1BK2SBvvXLX57dEb+pSCqtJynuS9PGgWq5L30LClf4hcqrxALWNEESNd8ZX0AuGcfzwTxyZlaEiIdjNkNTV8FxNtdC2gQwJ8eNc6hDDoWSnTCSrO+WRFlW0JSGqDNSH2vdEoD6rv+UVk38J/ebvJkoPKWHFqKMxxWGSKxStwLAWO5BnJlAy9iDDPY+/koNM0VQb59Btgf4Aglo/cBsentvg4CSclP3Pjx/2zO7C8e/CkMID64bfQPp9mj7f0ZLfJV3A3XM+FrzZJtwnpW/wjpa+Y6TvX9neokdFdZ+5XuA6PkJ1Jjpk/2d/Skf4/09B5pc3Y3NAH2h+4liZX7YH4apMEZfWCQcvqVE2Fzg8baIFxNWkBhMWNd7woV8kkNhmZgKZtNFbWjzNal5oEHSBMSoFx9vMk2FzqHl5CUvqurtrZ1Wd9IVh7AhpG/9vIW3gBMj0kkRpDehU63CtTUqvgBk080uepp05dByTdDSQNojsoYVYo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(451199015)(110136005)(6486002)(6512007)(6666004)(7416002)(5660300002)(38100700002)(2616005)(36756003)(8936002)(66476007)(66556008)(8676002)(41300700001)(4326008)(6506007)(66946007)(478600001)(53546011)(66574015)(31686004)(83380400001)(26005)(31696002)(54906003)(186003)(2906002)(86362001)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFRodURMNHVuc0c5blY5VEQvQkNqazRaS2hNVVNINXliRkxEUlZrRUxxckoy?=
 =?utf-8?B?NUdtdHExR2NrK0lJUEk3WldXOUNnUEl3L2wxdVdmRkVWNTBpdlRibk1zR0tk?=
 =?utf-8?B?NTNwZ080Q0tuOEFVb1A3cjQwaklWRXhpTDhCeHhoRUVPU1RUSnkyRnFLajFM?=
 =?utf-8?B?VGwyOENPZmFzd1VreURjMHhJbXZib2ZUZCtyUjIvU2F5ZU9yVUc3RGFVTkI3?=
 =?utf-8?B?WHQ3NDdoUUtOam9Ydzd6QXNLOUM5Ry9pN2F3UzdmV2RUM1pEV3BqVGllc0l4?=
 =?utf-8?B?RDBkdlhsMkNVWU9vc2R0aGtVZWU2NDdGenRFMEVhbzJRaDlVUXpieFFwOHk3?=
 =?utf-8?B?eG9IRVRJRTNiNldETWJJbm85WU0zZFErS2c3ZXlyV2h1R3RUVHpKVVFKM0VN?=
 =?utf-8?B?ZTBWVGpvMHBreDRPcnhNbms4dlpSa25OQ1hpb0wwRk1LdEdsRFAyOWtWUlJ4?=
 =?utf-8?B?WXlZcjkya1pITVZReE1tTjVxbWI4SCsxWHdRY1V0OWg0b1M5OHZ1dTFyTk01?=
 =?utf-8?B?TDNTbk81R3lYdDJMZWpsYmc4UnZTQkFydXJSL0E0MVM4elp3Um1CL3A2aEFk?=
 =?utf-8?B?ZmRnL2V3bWtUbGJCbkZnK01pbGZBOGtMVElmMkRVOVRxWG1XT2pqbkdpNXdK?=
 =?utf-8?B?a25sSHNsTndBb3F1Yk1NYTZYQUxEU0RwUUNXK1hRRmw0OUZZaGdTZ0tPL1lm?=
 =?utf-8?B?VzBkc2I2V1dLSDE2UWF4d2wyK3BER0dwb0pNcnVsTFovaXcvZVgrZ0RBU2NR?=
 =?utf-8?B?cHU2VjJKVG5aOHMyZU5UUFplQ29qQUlodzZ1SzhCL2J4aVpIUTV2VWRiZHg3?=
 =?utf-8?B?L3YvR0tUSnFwNS82OFMrbVVsU1hrd0ZFVGRqYU1CeUpURTlvM2tDSDZuRUNM?=
 =?utf-8?B?TDZUQWRHZlhYWjFOdTNqRnpPZE1MdmtqRng4YjVLRm93djR4VUd1ZDJnbzRV?=
 =?utf-8?B?b04zcGhyRkZLOWo0OHd3T0lzS0dmcklxWjlDa2tMZEJ3eGJZVXR4bEdmaFl2?=
 =?utf-8?B?K09VVElnOGVvcWJOZVh1SVJpRENRUVhJT091Z3pmQk9iQjM3aTRnQTFtUEJ6?=
 =?utf-8?B?VTQ1S2QzM3FQV2xPOElZemVsRER1Nmc3QWZYSCs1MGFueWFybHRYMnRvK1lq?=
 =?utf-8?B?T0JmMlcxUmNidWk1OG1wRHpQOGxDOHBVVGNEUzNYNmVSWU4vck4yZmxNMUlr?=
 =?utf-8?B?MEx5QkJILzJCeGNDQ2FVTlk2RG8wTmw2Umg3RnNGY3BXN1VsbmhHN3drcTV3?=
 =?utf-8?B?SVdrdU9LTFY3Y2Q5VXBtRFVMWmNYYzhjL0F2L1JtUlZBRW1HL0FsSjdrUHBE?=
 =?utf-8?B?K0dQellEZXNmWmY0T2ZGcXc1V0Z1eE44WWNKTU5ndzhqQlN3eG5ST1QyVDJ1?=
 =?utf-8?B?MXpMWjNLZGxpWmtoRXVpdDMwRVZ6L1BmQzBybDQvZjNjemFXV2lESzM3SU9s?=
 =?utf-8?B?d3NCNkUrWlQxY2dYcm9EM2NCZVRDQ0ZLZWo3NDYzUTZQSE9HbW9HQmNUdmlo?=
 =?utf-8?B?WTVBdW0vRHI4Nng3ZVlYSnVlRndYMjZlTHFGd3dOVkhjUG81ZGZvMythcEpm?=
 =?utf-8?B?dEw2UG9CUWJqSWd1MVZXelRuZ1laVWNSOGg3Vlk1TklDR0I2UXNyL2ZJVllJ?=
 =?utf-8?B?dmlCY2gzelBqRFplODZKK2diWVNEeXRDaUg0UmRheVBVeEFPaHpDQUVwbW5L?=
 =?utf-8?B?aHNQVTdXV3dkTEk1NTVBUWpIckc5SXBpdlRIRVVPaDRPQ040MDlIR3ZUT3ZB?=
 =?utf-8?B?T3dhMmZyMk1hMlRNczVyeGFnZjBFcmZMNTRmZ1lnNUl6UlZuQ0JYQUJzcmF3?=
 =?utf-8?B?UW1iYng0MU5hTHFPajc4Rk1EWnV0bVpydGN2a3MvSDdlYW1udGRvRGg0Q0lj?=
 =?utf-8?B?c2k4WTRvN0ZxTkpjZzNyNlNLWUJVVWs0dTRFSEQ4cWVmUkpUcUlTU0JFakx2?=
 =?utf-8?B?aEE0S1RCOHZPM2dyRFY5MEQ2cTg2Q1dJTVIwVkp2QVBvVnZ6N1hVdyt1cEpu?=
 =?utf-8?B?dU0veWtvbWJrUnZ2a1d2cFJHZlFQL2t1djZta3U0T2VWaGppOElNb2hyQXlM?=
 =?utf-8?B?aUs5Y0JsS2hESVc1SFpqWTc0Tk9qT0dydG1HMUVNUU5JSkhzbWVOMDFHQ0xO?=
 =?utf-8?Q?GOzhGVXDCFg2KQdGD1t1shmcw?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55e77d93-d019-4043-59e3-08daf3141bdc
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 14:08:12.1323 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HT2NstqfmTfWlqbQwSYTPK1HY5iTulO9tIlUeuTYERGq9QIRbtvvfOKoAjWt+acerMPxvb24WpF4hFbWGTtP2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6317
Received-SPF: softfail client-ip=40.107.212.56;
 envelope-from=avihaih@nvidia.com;
 helo=NAM02-BN1-obe.outbound.protection.outlook.com
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


On 09/01/2023 20:36, Jason Gunthorpe wrote:
> On Mon, Jan 09, 2023 at 06:27:21PM +0100, Cédric Le Goater wrote:
>> also, in vfio_migration_query_flags() :
>>
>>    +static int vfio_migration_query_flags(VFIODevice *vbasedev, uint64_t *mig_flags)
>>    +{
>>    +    uint64_t buf[DIV_ROUND_UP(sizeof(struct vfio_device_feature) +
>>    +                                  sizeof(struct vfio_device_feature_migration),
>>    +                              sizeof(uint64_t))] = {};
>>    +    struct vfio_device_feature *feature = (struct vfio_device_feature *)buf;
>>    +    struct vfio_device_feature_migration *mig =
>>    +        (struct vfio_device_feature_migration *)feature->data;
>>    +
>>    +    feature->argsz = sizeof(buf);
>>    +    feature->flags = VFIO_DEVICE_FEATURE_GET | VFIO_DEVICE_FEATURE_MIGRATION;
>>    +    if (ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature)) {
>>    +        return -EOPNOTSUPP;
>>    +    }
>>    +
>>    +    *mig_flags = mig->flags;
>>    +
>>    +    return 0;
>>    +}
>>
>>
>> The code is using any possible error returned by the VFIO_DEVICE_FEATURE
>> ioctl to distinguish protocol v1 from v2.
> I'm comfortable with that from a kernel perspective.
>
> There is no such thing as this API failing in the kernel but userspace
> should continue on, no matter what the error code. So always failing
> here is correct.
>
> About the only thing you might want to do is convert anything other
> than ENOTTY into a hard qemu failure similar to failing to open
> /dev/vfio or something - it means something has gone really
> wrong.. But that is pretty obscure stuff

Hi Cedric,

With Jason's input, is it ok by you to leave the code as is?

if not, would this be fine?

+static int vfio_migration_query_flags(VFIODevice *vbasedev, uint64_t 
*mig_flags)
+{
+    uint64_t buf[DIV_ROUND_UP(sizeof(struct vfio_device_feature) +
+                                  sizeof(struct 
vfio_device_feature_migration),
+                              sizeof(uint64_t))] = {};
+    struct vfio_device_feature *feature = (struct vfio_device_feature 
*)buf;
+    struct vfio_device_feature_migration *mig =
+        (struct vfio_device_feature_migration *)feature->data;
+
+    feature->argsz = sizeof(buf);
+    feature->flags = VFIO_DEVICE_FEATURE_GET | 
VFIO_DEVICE_FEATURE_MIGRATION;
+    if (ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature)) {
+        if (errno == ENOTTY) {
+            error_report("%s: VFIO migration is not supported in kernel",
+                         vbasedev->name);
+        } else {
+            error_report("%s: Failed to query VFIO migration support, 
err: %s",
+                         vbasedev->name, strerror(errno));
+        }
+
+        return -errno;
+    }
+
+    *mig_flags = mig->flags;
+
+    return 0;
+}
+

and then in vfio_migration_init() prior v1 removal:

+    ret = vfio_migration_query_flags(vbasedev, &mig_flags);
+    if (!ret) {
+        /* Migration v2 */
+    } else if (ret == -ENOTTY) {
+        /* Migration v1 */
+    } else {
+        return ret;
+    }

and after v1 removal vfio_migration_init() will be:

     ret = vfio_migration_query_flags(vbasedev, &mig_flags);
     if (ret) {
         return ret;

     }

Thanks.


