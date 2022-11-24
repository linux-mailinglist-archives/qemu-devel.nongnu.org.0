Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B75F36378E1
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 13:27:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyBJK-00032e-08; Thu, 24 Nov 2022 07:26:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1oyBIy-0002ym-Le; Thu, 24 Nov 2022 07:26:13 -0500
Received: from mail-dm6nam11on20600.outbound.protection.outlook.com
 ([2a01:111:f400:7eaa::600]
 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1oyBIk-0007IA-T6; Thu, 24 Nov 2022 07:26:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EdUwBZfukarsEjy5ygwfnxCz1Fgetx7OuzQUFPyxHECTjeFwl4uvcoMHxujKdxm4mozXPjuEsB3d+Dyjlun0N6D04AIzf3NsPsneMoq+QnUf5V/z6If8Sphqo7HKeXRH+ySDzhEUKtSH83E45yvqcnrHavs3syK5wDtkBGF+HOqPDhnjO8Y5nvpILqKOa3ACLO0xbsE4RFishe8aBwUNbAtiN5w0SrEr1p+0UZ3LmJY/JxzO1U5NtOyk61sI377iRe1b75E3cqIIBo0XuCHGGi0362JFpJDY9Q0hwVBm55s8KWL+0IZBjgvkODmgdcBUut9QCvnm3ZfkoEl8+qWMdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p7jLoQKJ9ICy0G2MMT1ns84G22/+T25pfwhywDqzWHM=;
 b=VvX+i74ijfyDn4BvT0HUy30rpq7SdBatiZ8zieLLOoK3+3aDCYFgHkJXV1PDN38ltSQvE5ADeA+d5laj1sLAq411OvJ+a9Kct/jM1fU+UMwnV6nO9KUfxqthPQAszbaWU8EoCbwNh1vdg/g8rjimd8th7eMkePjIfM/ye958piJSyl/qt4bhxenMte6O6Bz7oYqUYM9Fy8bcVj/ghB8cqok0WSEEwYSos0SfWiLqLK+ilsiiIP/rRqoiSM5fBcoJXUFPCGq97/mJaFn0WQa4jrUDC64GpsI4ZtYacMnLGeInuoVrW68szZPkfME+kOixGZa3WegDax04GIJfv5f4zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p7jLoQKJ9ICy0G2MMT1ns84G22/+T25pfwhywDqzWHM=;
 b=N7rZJVL/j7qc7TUFen96oQ5OtWfUmWj0CRyIuBm+bql31SQirURvulwbA0hWCaLUwFNRmtSPJxutbGHOH26o+66vDkk9vh4HmYNuIJTyQa9LHJWs6GYT63axz3Aj1HtA5iejn7zj/XPH+i4Dd3KzmQTRW/t0lsLH7w58rVXEHaPMjuT/AaDcjh3jDMfIl8GO1X0HUm/qZoTkKF1J/ZkwIv5RX8hSV9zlL1J4yoW8pbIocqdUhTia0JJlWLmfOGZWhugGKT4oz0XXxXehSx0TjIXjCszcJlsubQgxuUedIK8djR0u9h1XUsl/EPgpCmOJ73ezDM3Xp9NGU3bad2Dcqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by PH8PR12MB6964.namprd12.prod.outlook.com (2603:10b6:510:1bf::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Thu, 24 Nov
 2022 12:25:53 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::820f:1fa0:9353:bece]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::820f:1fa0:9353:bece%9]) with mapi id 15.20.5857.019; Thu, 24 Nov 2022
 12:25:53 +0000
Message-ID: <9e66d9c0-19aa-bc20-0c80-8ba6da023ae2@nvidia.com>
Date: Thu, 24 Nov 2022 14:25:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 12/17] vfio/migration: Implement VFIO migration
 protocol v2
Content-Language: en-US
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>,
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
 <20221103161620.13120-13-avihaih@nvidia.com> <Y35tp+2Ado3J4NE5@work-vm>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <Y35tp+2Ado3J4NE5@work-vm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0430.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::34) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB5549:EE_|PH8PR12MB6964:EE_
X-MS-Office365-Filtering-Correlation-Id: 81745103-4393-49d0-44e7-08dace170774
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9mp3Cmwk/pEB78SjZagJIT3j/V76NbSfsk8bEIwTuO7o1cB2ySBYDRQX6ZaCwJb5YCgQA7Fl6pQkXofhJoxfctILd44NxWL43oV+rg7amlLbjBLf5v95OEa+ePpjtngGys1o7xvNzlBJ3Fs83VaKElK/ouKCz9aXI6eU2GNYm5NwgHmIfcMAXMqjY5daI0bj6EPkcwqtWXErFWDhbJql5Y5pdSpY0egms9DUikC7XhUUCpYs707kZa33kF5V2S9l9U7IOAJW/Mvq50Tq+UBolp19oqRIMmSzPNXBIbnzsX+ysuvRvTTrv26rmYujXbKF30vFVtMi8RVw0npYHNTRKqysUH61csYPU8VOZMFz6HGzsntXHKPUDBLK+nHljCGAsqZNqeWKVmS7kqcOfCrLAMYP1IyJKZTC7KCuyolBEVWwj9lm7nJhlE8wnDUChjHX7qZJ7nOZVFQUROl7Cj8kvcdtE5jXeJuizNmWOD30RG16dchuSxdnHCP5tUJxFpNO/HpiDbO5lo65XkaWJ2No6J6Dey5ZTDIhHxsz6Ca6s9H6k4XzHe4KEoPe02kR2dcw7KX6VBDuWmtX2z4xGKGxoGYBfgrtrmCMe9QEjXeofqRAcs8PAtxqmKSEunLA4YU1pC/yU2XVv7LsAr41SNQDjz1LKvouEu+pZGjr4nXFN94ckKDVPUGoELCdXLJLLJIBlQBiPBt4m6lX3OIsfU0y2Rveo1ztlRc9DA2omhDZOPc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(396003)(136003)(376002)(366004)(451199015)(66946007)(66556008)(4326008)(2616005)(8676002)(7416002)(66476007)(83380400001)(86362001)(30864003)(31696002)(2906002)(5660300002)(41300700001)(38100700002)(186003)(36756003)(6486002)(8936002)(31686004)(54906003)(478600001)(316002)(6916009)(53546011)(6506007)(6666004)(6512007)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVlRWVBmZlRCS1FUY2pkVDFZZnkvYytyMGFJVXBOZHppUGdNTVgvaExUZFZO?=
 =?utf-8?B?bjdpWER1NVZBT2lFV2tuTm95QUdKdjV1SUpNQ2JBeTVXMDRnMFd4dlBSRzFS?=
 =?utf-8?B?dFE5VUVGeFlWVyt5S0VWRjkvYTVWYkRmbjI1OUplbXVyeERRdDVBbUFCb1NR?=
 =?utf-8?B?ZlQycndvM0ZRbktONWhreVVudXZlcU8wVUVJWG0yVGlnZEpDb1RuYWxTQ2ow?=
 =?utf-8?B?UG8xd1lJRVNJYnpCeG5ic0JMKzZnczBGUWU0VmxmbENuOUppR05aK29WV1Vp?=
 =?utf-8?B?cTJoZm5VdU1jdFo5WUZkSTlaRUFuWm5LZEcwTWRxZHpGNjFhQjdQZWxpNnYx?=
 =?utf-8?B?ajBQekljbGR4V2pkNWJnZ1BNa25zUzZ2R3dBQVV4L0NDOGpvZHlXRlVmTzU3?=
 =?utf-8?B?d0gwSHFNZmJ4UVlsZ1p2NmNBcXlmRmszcXVremVJMjFubkhsaTh2MHBmT2Q5?=
 =?utf-8?B?UnhzWUpBREFocTZwNHpCK3lhRTBxWjk1Uk9URVNUTUQwR2VqdnJGdGVjWjVh?=
 =?utf-8?B?cXhldzdWM0ZFemlyZjIveS9rTUdWUXFTTDVDSHhQSWFpL1MxQ3ZZM09SRHYv?=
 =?utf-8?B?MUczZlJtcHp1SHl1bS9mM2NRUURodEVUYWk3TE1mdHNraDhUY0crUW94Zmd2?=
 =?utf-8?B?eWJVUUJGcVNqakdVcVNxeEJkQm5PLzdtMTNFTkQyRDZybnNJSHBWdCtEaUJP?=
 =?utf-8?B?eUxLTndock9ENUNvbmphRG9LOWtLRWhIMERDNFFzRTd1MjVjejlqNWpLNk9X?=
 =?utf-8?B?NnpTdEtNU1BlMysxL0Y1UmRzVEp3SzRrN1FxVEVBU0ZCTmFicXpEMUVNbXJW?=
 =?utf-8?B?QVA4ZzZyZzFqSklwNXpiTGRMTzZsQm9oTFFxMzVDcnI1czVpaDRGRUwzVmZE?=
 =?utf-8?B?R0g5VHM0WDBoSTBQemVOUWh5ZFdKS0xMdnZraGtZckJyNkt4cjR6aU5oelp4?=
 =?utf-8?B?ODZtZFJud3hOUCt0K05ja3VrTElnUWFLRnBQV05zTnIyYWJEVVRWT3VxU3ZL?=
 =?utf-8?B?ZG1ldHowcnZ1TERPYkJ0QlY2bWt4Q0NxM0JCZ0ZTK2hGaFFYNDVPV28vTzNj?=
 =?utf-8?B?Q3ZIRTE4Mkx6anVCN216Z2E1OUx3VWpBeHFTcFE0WVRUMmF6clB2NC9HdnVQ?=
 =?utf-8?B?UVB2NG1KdFJQRm55SXhXSXEzVzZHNzB2R28ydy94Z29VblRLZmN1TFp3TzNy?=
 =?utf-8?B?Z0dzcDZYT1RrT3hYbSs5aEFGTUZoY01FWnlCRWY3RHZiOUg3RGc2TVp2ZFE1?=
 =?utf-8?B?K0YrbngyaGxjVDdrb1JOWExvRVp5MUtOazdpVmtJT3pxRVV6RVJPVDRVKzNj?=
 =?utf-8?B?QkNQSlJTYmdybXlwRzNRNDd5UHRxMmpJbEYrUmZmSWdWSGdGMENQZGgvUkRP?=
 =?utf-8?B?YlpMZWxOT0VyQXcvN3lVcVpLMGlMKzhITGl2TGVtdklaN2Nram1PWmdzSE9Z?=
 =?utf-8?B?MW1WMUJQOGUvM0VqOHNzdWZ0ajRSOXVNQzc4b043WFoyZUR4aVdVcTlHb1hh?=
 =?utf-8?B?aUs2cVRzMnBrbjhscjhvWlkyM1RzbVh6cHBML0V3TVF0SmxpcEdIQzdmWHlq?=
 =?utf-8?B?a3Q2TXlhTmRFNFFILzhkSy9Qc2ZVTmk0NXFid0ViVTkzSnY4V0RpczNpTVpm?=
 =?utf-8?B?TExoQWx3cHI1eVp6OS9HN3NPdGNYU3V0R3dIMjM2VUhJbEF4eEdEdDZySUdp?=
 =?utf-8?B?TlkxN0krY0Z1UERMaHg5TjBlMko3M2xoZCtmdjZlU2NmbE52NEhCcSt5VU9F?=
 =?utf-8?B?UEx5WUFSVmhRVXJQdDdGT3p6RVlTeldXT0hNYUxuQ3daQlpxQUpVRUNQdzN1?=
 =?utf-8?B?akIvUFlWMk5wczlXdVdGZUUveWZhTGw4OGNRLzR3VFh0Y1o0a05VUHEyT09Z?=
 =?utf-8?B?T1grSTM3THFtdTdaUGdPc3lqUEE5NUFuK3ZiUzE3ODNINFV6Zm1TcmhDMWdH?=
 =?utf-8?B?NkVXZnJONTdzUW1JOWMyYUZqY05NNkY2d1JRRHRoMFdXUkdDcVA5Z3NyMm44?=
 =?utf-8?B?YW5STG44MG9UME01Z1I1TWdOcEtQVWlTTEFXWi8xZVZPNVFTL25jVVE2K3hB?=
 =?utf-8?B?V2FkMWN3MEcxNk01dzQrWHd4T2pxWFVGZ1dMSS9nTjhOTWlxRjhRM3dKdE9B?=
 =?utf-8?Q?MGxQH9BG7bW5ICrAY6JVuCpKL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81745103-4393-49d0-44e7-08dace170774
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2022 12:25:53.3319 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0zDArNAPBuuvpqOecGS4WFzP9znstvOr2KmrIZRiGiUkCHQ+42VBwnQ8NDmrlzfBYWuI47mZlo8EAk/j2r1S6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6964
Received-SPF: softfail client-ip=2a01:111:f400:7eaa::600;
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


On 23/11/2022 20:59, Dr. David Alan Gilbert wrote:
> External email: Use caution opening links or attachments
>
>
> * Avihai Horon (avihaih@nvidia.com) wrote:
>
> <snip>
>
>> +    ret = qemu_file_get_to_fd(f, migration->data_fd, data_size);
>> +    if (!ret) {
>> +        trace_vfio_load_state_device_data(vbasedev->name, data_size);
>> +
>> +    }
> I notice you had a few cases like that; I wouldn't bother making that
> conditional - just add 'ret' to the trace parameters; that way if it
> fails then you can see that in the trace, and it's simpler anyway.

If we add ret to traces such as this, shouldn’t we add ret to the other 
traces as well, to keep consistent trace format?
In that case, is it worth the trouble?

Alternatively, we can print the traces regardless of success or failure 
of the function to better reflect the flow of execution.
WDYT?

Thanks.

> Dave
>
>> +
>> +    return ret;
>> +}
>> +
>>   static int vfio_v1_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
>>                                  uint64_t data_size)
>>   {
>> @@ -394,6 +484,14 @@ static int vfio_load_device_config_state(QEMUFile *f, void *opaque)
>>       return qemu_file_get_error(f);
>>   }
>>
>> +static void vfio_migration_cleanup(VFIODevice *vbasedev)
>> +{
>> +    VFIOMigration *migration = vbasedev->migration;
>> +
>> +    close(migration->data_fd);
>> +    migration->data_fd = -1;
>> +}
>> +
>>   static void vfio_migration_v1_cleanup(VFIODevice *vbasedev)
>>   {
>>       VFIOMigration *migration = vbasedev->migration;
>> @@ -405,6 +503,18 @@ static void vfio_migration_v1_cleanup(VFIODevice *vbasedev)
>>
>>   /* ---------------------------------------------------------------------- */
>>
>> +static int vfio_save_setup(QEMUFile *f, void *opaque)
>> +{
>> +    VFIODevice *vbasedev = opaque;
>> +
>> +    trace_vfio_save_setup(vbasedev->name);
>> +
>> +    qemu_put_be64(f, VFIO_MIG_FLAG_DEV_SETUP_STATE);
>> +    qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
>> +
>> +    return qemu_file_get_error(f);
>> +}
>> +
>>   static int vfio_v1_save_setup(QEMUFile *f, void *opaque)
>>   {
>>       VFIODevice *vbasedev = opaque;
>> @@ -448,6 +558,14 @@ static int vfio_v1_save_setup(QEMUFile *f, void *opaque)
>>       return 0;
>>   }
>>
>> +static void vfio_save_cleanup(void *opaque)
>> +{
>> +    VFIODevice *vbasedev = opaque;
>> +
>> +    vfio_migration_cleanup(vbasedev);
>> +    trace_vfio_save_cleanup(vbasedev->name);
>> +}
>> +
>>   static void vfio_v1_save_cleanup(void *opaque)
>>   {
>>       VFIODevice *vbasedev = opaque;
>> @@ -456,6 +574,23 @@ static void vfio_v1_save_cleanup(void *opaque)
>>       trace_vfio_save_cleanup(vbasedev->name);
>>   }
>>
>> +#define VFIO_MIG_PENDING_SIZE (512 * 1024 * 1024)
>> +static void vfio_save_pending(void *opaque, uint64_t threshold_size,
>> +                              uint64_t *res_precopy, uint64_t *res_postcopy)
>> +{
>> +    VFIODevice *vbasedev = opaque;
>> +
>> +    /*
>> +     * VFIO migration protocol v2 currently doesn't have an API to get pending
>> +     * device state size. Until such API is introduced, report some big
>> +     * arbitrary pending size so the device will be taken into account for
>> +     * downtime limit calculations.
>> +     */
>> +    *res_postcopy += VFIO_MIG_PENDING_SIZE;
>> +
>> +    trace_vfio_save_pending(vbasedev->name, *res_precopy, *res_postcopy);
>> +}
>> +
>>   static void vfio_v1_save_pending(void *opaque, uint64_t threshold_size,
>>                                    uint64_t *res_precopy, uint64_t *res_postcopy)
>>   {
>> @@ -520,6 +655,67 @@ static int vfio_save_iterate(QEMUFile *f, void *opaque)
>>       return 0;
>>   }
>>
>> +/* Returns 1 if end-of-stream is reached, 0 if more data and -1 if error */
>> +static int vfio_save_block(QEMUFile *f, VFIOMigration *migration)
>> +{
>> +    ssize_t data_size;
>> +
>> +    data_size = read(migration->data_fd, migration->data_buffer,
>> +                     migration->data_buffer_size);
>> +    if (data_size < 0) {
>> +        return -1;
>> +    }
>> +    if (data_size == 0) {
>> +        return 1;
>> +    }
>> +
>> +    qemu_put_be64(f, VFIO_MIG_FLAG_DEV_DATA_STATE);
>> +    qemu_put_be64(f, data_size);
>> +    qemu_put_buffer(f, migration->data_buffer, data_size);
>> +    bytes_transferred += data_size;
>> +
>> +    trace_vfio_save_block(migration->vbasedev->name, data_size);
>> +
>> +    return qemu_file_get_error(f);
>> +}
>> +
>> +static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
>> +{
>> +    VFIODevice *vbasedev = opaque;
>> +    enum vfio_device_mig_state recover_state;
>> +    int ret;
>> +
>> +    /* We reach here with device state STOP only */
>> +    recover_state = VFIO_DEVICE_STATE_STOP;
>> +    ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_STOP_COPY,
>> +                                   recover_state);
>> +    if (ret) {
>> +        return ret;
>> +    }
>> +
>> +    do {
>> +        ret = vfio_save_block(f, vbasedev->migration);
>> +        if (ret < 0) {
>> +            return ret;
>> +        }
>> +    } while (!ret);
>> +
>> +    qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
>> +    ret = qemu_file_get_error(f);
>> +    if (ret) {
>> +        return ret;
>> +    }
>> +
>> +    recover_state = VFIO_DEVICE_STATE_ERROR;
>> +    ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_STOP,
>> +                                   recover_state);
>> +    if (!ret) {
>> +        trace_vfio_save_complete_precopy(vbasedev->name);
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>>   static int vfio_v1_save_complete_precopy(QEMUFile *f, void *opaque)
>>   {
>>       VFIODevice *vbasedev = opaque;
>> @@ -589,6 +785,14 @@ static void vfio_save_state(QEMUFile *f, void *opaque)
>>       }
>>   }
>>
>> +static int vfio_load_setup(QEMUFile *f, void *opaque)
>> +{
>> +    VFIODevice *vbasedev = opaque;
>> +
>> +    return vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_RESUMING,
>> +                                   vbasedev->migration->device_state);
>> +}
>> +
>>   static int vfio_v1_load_setup(QEMUFile *f, void *opaque)
>>   {
>>       VFIODevice *vbasedev = opaque;
>> @@ -616,6 +820,16 @@ static int vfio_v1_load_setup(QEMUFile *f, void *opaque)
>>       return ret;
>>   }
>>
>> +static int vfio_load_cleanup(void *opaque)
>> +{
>> +    VFIODevice *vbasedev = opaque;
>> +
>> +    vfio_migration_cleanup(vbasedev);
>> +    trace_vfio_load_cleanup(vbasedev->name);
>> +
>> +    return 0;
>> +}
>> +
>>   static int vfio_v1_load_cleanup(void *opaque)
>>   {
>>       VFIODevice *vbasedev = opaque;
>> @@ -658,7 +872,11 @@ static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
>>               uint64_t data_size = qemu_get_be64(f);
>>
>>               if (data_size) {
>> -                ret = vfio_v1_load_buffer(f, vbasedev, data_size);
>> +                if (vbasedev->migration->v2) {
>> +                    ret = vfio_load_buffer(f, vbasedev, data_size);
>> +                } else {
>> +                    ret = vfio_v1_load_buffer(f, vbasedev, data_size);
>> +                }
>>                   if (ret < 0) {
>>                       return ret;
>>                   }
>> @@ -679,6 +897,17 @@ static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
>>       return ret;
>>   }
>>
>> +static const SaveVMHandlers savevm_vfio_handlers = {
>> +    .save_setup = vfio_save_setup,
>> +    .save_cleanup = vfio_save_cleanup,
>> +    .save_live_pending = vfio_save_pending,
>> +    .save_live_complete_precopy = vfio_save_complete_precopy,
>> +    .save_state = vfio_save_state,
>> +    .load_setup = vfio_load_setup,
>> +    .load_cleanup = vfio_load_cleanup,
>> +    .load_state = vfio_load_state,
>> +};
>> +
>>   static SaveVMHandlers savevm_vfio_v1_handlers = {
>>       .save_setup = vfio_v1_save_setup,
>>       .save_cleanup = vfio_v1_save_cleanup,
>> @@ -693,6 +922,34 @@ static SaveVMHandlers savevm_vfio_v1_handlers = {
>>
>>   /* ---------------------------------------------------------------------- */
>>
>> +static void vfio_vmstate_change(void *opaque, bool running, RunState state)
>> +{
>> +    VFIODevice *vbasedev = opaque;
>> +    enum vfio_device_mig_state new_state;
>> +    int ret;
>> +
>> +    if (running) {
>> +        new_state = VFIO_DEVICE_STATE_RUNNING;
>> +    } else {
>> +        new_state = VFIO_DEVICE_STATE_STOP;
>> +    }
>> +
>> +    ret = vfio_migration_set_state(vbasedev, new_state,
>> +                                   VFIO_DEVICE_STATE_ERROR);
>> +    if (ret) {
>> +        /*
>> +         * Migration should be aborted in this case, but vm_state_notify()
>> +         * currently does not support reporting failures.
>> +         */
>> +        if (migrate_get_current()->to_dst_file) {
>> +            qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
>> +        }
>> +    }
>> +
>> +    trace_vfio_vmstate_change(vbasedev->name, running, RunState_str(state),
>> +                              mig_state_to_str(new_state));
>> +}
>> +
>>   static void vfio_v1_vmstate_change(void *opaque, bool running, RunState state)
>>   {
>>       VFIODevice *vbasedev = opaque;
>> @@ -766,12 +1023,17 @@ static void vfio_migration_state_notifier(Notifier *notifier, void *data)
>>       case MIGRATION_STATUS_CANCELLED:
>>       case MIGRATION_STATUS_FAILED:
>>           bytes_transferred = 0;
>> -        ret = vfio_migration_v1_set_state(vbasedev,
>> -                                          ~(VFIO_DEVICE_STATE_V1_SAVING |
>> -                                            VFIO_DEVICE_STATE_V1_RESUMING),
>> -                                          VFIO_DEVICE_STATE_V1_RUNNING);
>> -        if (ret) {
>> -            error_report("%s: Failed to set state RUNNING", vbasedev->name);
>> +        if (migration->v2) {
>> +            vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_RUNNING,
>> +                                     VFIO_DEVICE_STATE_ERROR);
>> +        } else {
>> +            ret = vfio_migration_v1_set_state(vbasedev,
>> +                                              ~(VFIO_DEVICE_STATE_V1_SAVING |
>> +                                                VFIO_DEVICE_STATE_V1_RESUMING),
>> +                                              VFIO_DEVICE_STATE_V1_RUNNING);
>> +            if (ret) {
>> +                error_report("%s: Failed to set state RUNNING", vbasedev->name);
>> +            }
>>           }
>>       }
>>   }
>> @@ -780,12 +1042,35 @@ static void vfio_migration_exit(VFIODevice *vbasedev)
>>   {
>>       VFIOMigration *migration = vbasedev->migration;
>>
>> -    vfio_region_exit(&migration->region);
>> -    vfio_region_finalize(&migration->region);
>> +    if (migration->v2) {
>> +        g_free(migration->data_buffer);
>> +    } else {
>> +        vfio_region_exit(&migration->region);
>> +        vfio_region_finalize(&migration->region);
>> +    }
>>       g_free(vbasedev->migration);
>>       vbasedev->migration = NULL;
>>   }
>>
>> +static int vfio_migration_query_flags(VFIODevice *vbasedev, uint64_t *mig_flags)
>> +{
>> +    uint64_t buf[DIV_ROUND_UP(sizeof(struct vfio_device_feature) +
>> +                                  sizeof(struct vfio_device_feature_migration),
>> +                              sizeof(uint64_t))] = {};
>> +    struct vfio_device_feature *feature = (void *)buf;
>> +    struct vfio_device_feature_migration *mig = (void *)feature->data;
>> +
>> +    feature->argsz = sizeof(buf);
>> +    feature->flags = VFIO_DEVICE_FEATURE_GET | VFIO_DEVICE_FEATURE_MIGRATION;
>> +    if (ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature)) {
>> +        return -EOPNOTSUPP;
>> +    }
>> +
>> +    *mig_flags = mig->flags;
>> +
>> +    return 0;
>> +}
>> +
>>   static int vfio_migration_init(VFIODevice *vbasedev)
>>   {
>>       int ret;
>> @@ -794,6 +1079,7 @@ static int vfio_migration_init(VFIODevice *vbasedev)
>>       char id[256] = "";
>>       g_autofree char *path = NULL, *oid = NULL;
>>       struct vfio_region_info *info = NULL;
>> +    uint64_t mig_flags;
>>
>>       if (!vbasedev->ops->vfio_get_object) {
>>           return -EINVAL;
>> @@ -804,34 +1090,51 @@ static int vfio_migration_init(VFIODevice *vbasedev)
>>           return -EINVAL;
>>       }
>>
>> -    ret = vfio_get_dev_region_info(vbasedev,
>> -                                   VFIO_REGION_TYPE_MIGRATION_DEPRECATED,
>> -                                   VFIO_REGION_SUBTYPE_MIGRATION_DEPRECATED,
>> -                                   &info);
>> -    if (ret) {
>> -        return ret;
>> -    }
>> +    ret = vfio_migration_query_flags(vbasedev, &mig_flags);
>> +    if (!ret) {
>> +        /* Migration v2 */
>> +        /* Basic migration functionality must be supported */
>> +        if (!(mig_flags & VFIO_MIGRATION_STOP_COPY)) {
>> +            return -EOPNOTSUPP;
>> +        }
>> +        vbasedev->migration = g_new0(VFIOMigration, 1);
>> +        vbasedev->migration->device_state = VFIO_DEVICE_STATE_RUNNING;
>> +        vbasedev->migration->data_buffer_size = VFIO_MIG_DATA_BUFFER_SIZE;
>> +        vbasedev->migration->data_buffer =
>> +            g_malloc0(vbasedev->migration->data_buffer_size);
>> +        vbasedev->migration->data_fd = -1;
>> +        vbasedev->migration->v2 = true;
>> +    } else {
>> +        /* Migration v1 */
>> +        ret = vfio_get_dev_region_info(vbasedev,
>> +                                       VFIO_REGION_TYPE_MIGRATION_DEPRECATED,
>> +                                       VFIO_REGION_SUBTYPE_MIGRATION_DEPRECATED,
>> +                                       &info);
>> +        if (ret) {
>> +            return ret;
>> +        }
>>
>> -    vbasedev->migration = g_new0(VFIOMigration, 1);
>> -    vbasedev->migration->device_state_v1 = VFIO_DEVICE_STATE_V1_RUNNING;
>> -    vbasedev->migration->vm_running = runstate_is_running();
>> +        vbasedev->migration = g_new0(VFIOMigration, 1);
>> +        vbasedev->migration->device_state_v1 = VFIO_DEVICE_STATE_V1_RUNNING;
>> +        vbasedev->migration->vm_running = runstate_is_running();
>>
>> -    ret = vfio_region_setup(obj, vbasedev, &vbasedev->migration->region,
>> -                            info->index, "migration");
>> -    if (ret) {
>> -        error_report("%s: Failed to setup VFIO migration region %d: %s",
>> -                     vbasedev->name, info->index, strerror(-ret));
>> -        goto err;
>> -    }
>> +        ret = vfio_region_setup(obj, vbasedev, &vbasedev->migration->region,
>> +                                info->index, "migration");
>> +        if (ret) {
>> +            error_report("%s: Failed to setup VFIO migration region %d: %s",
>> +                         vbasedev->name, info->index, strerror(-ret));
>> +            goto err;
>> +        }
>>
>> -    if (!vbasedev->migration->region.size) {
>> -        error_report("%s: Invalid zero-sized VFIO migration region %d",
>> -                     vbasedev->name, info->index);
>> -        ret = -EINVAL;
>> -        goto err;
>> -    }
>> +        if (!vbasedev->migration->region.size) {
>> +            error_report("%s: Invalid zero-sized VFIO migration region %d",
>> +                         vbasedev->name, info->index);
>> +            ret = -EINVAL;
>> +            goto err;
>> +        }
>>
>> -    g_free(info);
>> +        g_free(info);
>> +    }
>>
>>       migration = vbasedev->migration;
>>       migration->vbasedev = vbasedev;
>> @@ -844,11 +1147,20 @@ static int vfio_migration_init(VFIODevice *vbasedev)
>>       }
>>       strpadcpy(id, sizeof(id), path, '\0');
>>
>> -    register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1,
>> -                         &savevm_vfio_v1_handlers, vbasedev);
>> +    if (migration->v2) {
>> +        register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1,
>> +                             &savevm_vfio_handlers, vbasedev);
>> +
>> +        migration->vm_state = qdev_add_vm_change_state_handler(
>> +            vbasedev->dev, vfio_vmstate_change, vbasedev);
>> +    } else {
>> +        register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1,
>> +                             &savevm_vfio_v1_handlers, vbasedev);
>> +
>> +        migration->vm_state = qdev_add_vm_change_state_handler(
>> +            vbasedev->dev, vfio_v1_vmstate_change, vbasedev);
>> +    }
>>
>> -    migration->vm_state = qdev_add_vm_change_state_handler(
>> -        vbasedev->dev, vfio_v1_vmstate_change, vbasedev);
>>       migration->migration_state.notify = vfio_migration_state_notifier;
>>       add_migration_state_change_notifier(&migration->migration_state);
>>       return 0;
>> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
>> index d88d2b4053..9ef84e24b2 100644
>> --- a/hw/vfio/trace-events
>> +++ b/hw/vfio/trace-events
>> @@ -149,7 +149,9 @@ vfio_display_edid_write_error(void) ""
>>
>>   # migration.c
>>   vfio_migration_probe(const char *name) " (%s)"
>> +vfio_migration_set_state(const char *name, const char *state) " (%s) state %s"
>>   vfio_migration_v1_set_state(const char *name, uint32_t state) " (%s) state %d"
>> +vfio_vmstate_change(const char *name, int running, const char *reason, const char *dev_state) " (%s) running %d reason %s device state %s"
>>   vfio_v1_vmstate_change(const char *name, int running, const char *reason, uint32_t dev_state) " (%s) running %d reason %s device state %d"
>>   vfio_migration_state_notifier(const char *name, const char *state) " (%s) state %s"
>>   vfio_save_setup(const char *name) " (%s)"
>> @@ -163,6 +165,8 @@ vfio_save_complete_precopy(const char *name) " (%s)"
>>   vfio_load_device_config_state(const char *name) " (%s)"
>>   vfio_load_state(const char *name, uint64_t data) " (%s) data 0x%"PRIx64
>>   vfio_v1_load_state_device_data(const char *name, uint64_t data_offset, uint64_t data_size) " (%s) Offset 0x%"PRIx64" size 0x%"PRIx64
>> +vfio_load_state_device_data(const char *name, uint64_t data_size) " (%s) size 0x%"PRIx64
>>   vfio_load_cleanup(const char *name) " (%s)"
>>   vfio_get_dirty_bitmap(int fd, uint64_t iova, uint64_t size, uint64_t bitmap_size, uint64_t start) "container fd=%d, iova=0x%"PRIx64" size= 0x%"PRIx64" bitmap_size=0x%"PRIx64" start=0x%"PRIx64
>>   vfio_iommu_map_dirty_notify(uint64_t iova_start, uint64_t iova_end) "iommu dirty @ 0x%"PRIx64" - 0x%"PRIx64
>> +vfio_save_block(const char *name, int data_size) " (%s) data_size %d"
>> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
>> index bbaf72ba00..2ec3346fea 100644
>> --- a/include/hw/vfio/vfio-common.h
>> +++ b/include/hw/vfio/vfio-common.h
>> @@ -66,6 +66,11 @@ typedef struct VFIOMigration {
>>       int vm_running;
>>       Notifier migration_state;
>>       uint64_t pending_bytes;
>> +    enum vfio_device_mig_state device_state;
>> +    int data_fd;
>> +    void *data_buffer;
>> +    size_t data_buffer_size;
>> +    bool v2;
>>   } VFIOMigration;
>>
>>   typedef struct VFIOAddressSpace {
>> --
>> 2.21.3
>>
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
>

