Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8131865C35C
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 16:55:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCjcb-0000Qs-9A; Tue, 03 Jan 2023 10:54:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pCjcY-0000Po-Na; Tue, 03 Jan 2023 10:54:34 -0500
Received: from mail-bn1nam02on2052.outbound.protection.outlook.com
 ([40.107.212.52] helo=NAM02-BN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pCjcW-0005gj-KI; Tue, 03 Jan 2023 10:54:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EfObYCLcGAGc39V/wSR6V4kSmiEUXKwxq7YDu96CpYsU5fQYfSW1t7iszGUj4Fh5mhk1t6ERFG7romxF5wS7dqwemoId2193/gtBT8OZLurQOWK/lCxzuSv9s6jTQEDtk4RifHN18Ni7kx0Ho9BuRArMCJy3i4PFitVesPhBmgchYKjDKpafLZ+52eOYzdtfjzFWgb9c8LNY6/Q2yc6C3yQMdvGUEUzU5e3MECDAtMEosXcugrZplR1fT5d8uHKw5yo5S91/+FkTiO5L6qdQQMH0Hff5wTT8v1f3QOo5kRSr3q8Be7eaMegKjCNP/6cSSS2WOv4O5p7DaznHSzT1gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=quKHM0ozdaL6lKLZ4Zlz5lGd4vHnqAmqjeZhNIpz6nw=;
 b=aNDObOBcCoqz7INHFJNlThzAVVNyYR1JEanXyReD3y1ITpcOhfn9DFTJkm6+fvCoaALCOnMsyFcGGFAoo78c9H4qLWRAxTZCp6tabTIIMqpkhWHbe4dxs+Azr+SlSaOs0kxkVVed4xtzIlqrdODy/QBXSahwpdDRhIo/eJvUfIAtzg0/f2bgT3JWS+2pvYH+G5mz8qRE5KAQqrKmuB2nyscRdjM+UKjcOCb4pJupj0VmOd2VGLzptz++FDgAKLckxXb2rJb1YralWRk7JkQeb5qy8rUgYfplT0DjYUnMuCcsOG+b4qV53lGPgdARvaEnSDs+3QNgfP56o3Fu3Gw2/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=quKHM0ozdaL6lKLZ4Zlz5lGd4vHnqAmqjeZhNIpz6nw=;
 b=hLCyZFaaokIBfY9mY6eJX22LraCgPangSN+jbkwXQ4hzvcpCczW8Qqa3psJz/CYPKZ+Zevt9Mqc/GARSY5lepqKbQjFOzrF3dOr5kGg4tgyomQHOl8xyGZ5/BbhIqqHxllALhDPlOuIYg9gw2vchas9VPZNChWtmKX6VjcKcUwmfzXUTla7LmebJxp5mnBGL7Wt0RjbB1O2SKqqx+Dg4/l5ZbA4KwY7z1GgAjIIZcM80m+hdG9A2oQus7S2SaBWE7ktjHtC39/CUvRnMWvNZJbYs04COVyju7zTmRN1J+adSqubKNWgZ/J+Y+dNbWr+CZ1Xfrm4Kr9P0wQzMOprWEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by SN7PR12MB6912.namprd12.prod.outlook.com (2603:10b6:806:26d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Tue, 3 Jan
 2023 15:54:28 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::451d:1f37:aa83:f425]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::451d:1f37:aa83:f425%6]) with mapi id 15.20.5944.019; Tue, 3 Jan 2023
 15:54:28 +0000
Message-ID: <5cd2a6a8-ac23-b463-04d1-4213bbcad25c@nvidia.com>
Date: Tue, 3 Jan 2023 17:54:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5 04/14] vfio/migration: Fix NULL pointer dereference bug
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
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
References: <20221229110345.12480-1-avihaih@nvidia.com>
 <20221229110345.12480-5-avihaih@nvidia.com> <Y7QN0fT6vI9AMU+3@work-vm>
Content-Language: en-US
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <Y7QN0fT6vI9AMU+3@work-vm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0157.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::18) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB5549:EE_|SN7PR12MB6912:EE_
X-MS-Office365-Filtering-Correlation-Id: ce01c424-2102-46af-b6cc-08daeda2cb91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aNOum45P2oCLiojRaQLoDZIXmkAFm35d753rJU4+K/JUOF7VS+xdQohWfLYXLUjgbBJWbzWEbDkqglpWvys9P3faowqvaS5zayYu0gxVWEy5nzkTQ9rXHy7NJ2jCULIJqUZarA5zRim9fjSo/oT08eehl0/W4ECoNOM43xBzsTXJOqRIMCbiXS12xwJ4Z82Z9INbm28kL71FW6oJ1ttum12ZmGcRCY4gyPGRm1hZdNxdYV5R6lcBlWDWBeeBr4tEiWbmlST6c5bgH84Zsjx/ZotJ+sMre+RgMsiv7dxuDOyrFe2c5jkk/8RujXmjFviC10Eiu2Nl1tXNpF8xoxlYiEt+92eQsGpoZ2bquPJqhOdip/xLO2C4W3zCUQM1/owvf7kEpsakvKznIeRQDDTiLglHvHSYAtjR9E/srvGFqYJbT8PyCsV/PgdReE9JzsGAOwMHHgEPSwYRhnBmyU3w5H2x4FNXfapLDCRTbcfhHCnDjLeVnvT7GAg+8c4IRi6lRJ3sejuHPnAI4TZz7mK5Nb33I8/leTlMEz69F7SIINl8iq6FNtN5Eqz3YDZ8Je+4pYdBjI6tGOlokSJPZzJG9YH68IAb7HrXXmo+bBJ9zSxdvh9V8Lw4prKLKIy7qMtcI7ttfBLFcZGPJ9KIxkk42E5WK0nFMEzZqqM9LSH8kPCu2/I0ARfrxAJdfr8mc1hUu6t0DtICzGdoKjebiI+5C8yvvl3mFKYD/h056VkU2CuCRuOq+WeL7acnDju8LVuZGm34+yAnsfYJhhKlQLpH3g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(396003)(136003)(39860400002)(366004)(451199015)(2616005)(83380400001)(86362001)(31696002)(36756003)(38100700002)(54906003)(6916009)(2906002)(66476007)(316002)(7416002)(41300700001)(8936002)(66946007)(5660300002)(66556008)(8676002)(4326008)(186003)(26005)(53546011)(6486002)(478600001)(6512007)(6666004)(31686004)(6506007)(22166006)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzA2TytMV29ZbDRsb0JPTjFFYUFENG9keFM5TmtmUTJMWG44NDlzRUN3djFL?=
 =?utf-8?B?MGdsSURSN0lJbWNJNzFMeVBDQXJDZXFCSFNyU3B2UHhENmhMb0Jmc1A0d1d5?=
 =?utf-8?B?OGpNNnBzemEwS1I4eC8xNGZ0SE4rMm1iTUc1Qyt6a29hK091cmMvbTlEaXJ2?=
 =?utf-8?B?UUpWTnZrdWUyRzJoREFuTFJaZVdqUnE4dEU5Y3d1R0NSWmFNVmJ0N3pBQ3pK?=
 =?utf-8?B?SlEwNU5wQ1hQVTNpK1BNR3RJSzNCTHpNTXRjSzNaWGRtMlpxbSt4U0puSDdE?=
 =?utf-8?B?WUdNOHhXenBpRW9XRTNhZ0s5ejJTamZCb3hpeGZSQmQwREdSNGJLTDNyTEZl?=
 =?utf-8?B?QjNoVW9MRnZ0VXlGUDZBREo4VHhaOEYwWFVZRmlTekhBWVhxNjBBTEVoVXl3?=
 =?utf-8?B?VkJtbndTanErR0t5NDNCVkdVSjVqU3lQNGEvaWhoQUordU53UU9HbE02Nk90?=
 =?utf-8?B?OS9ZSndGY3RqZTMrTVFrdUxET3l5b254SDNDd1d6a2tWVGtFVVUwckk4UjFO?=
 =?utf-8?B?eEMwdWN6K1V4QXBFdkUyOWt6dW1aZjg5S0Uvd2QrU0J5WXViTnhyamppVysw?=
 =?utf-8?B?emorMG9KamRpWjhoZmFnUlpYTXV5OG5zOHR3R1pZaStqZ0h1SVJVZGppU2J1?=
 =?utf-8?B?b2dNdStEVWJUL3NFYjhNa1JhMnFMc2szdUtXSlJNeWZvSnZhTXVkZ20vU1c0?=
 =?utf-8?B?Q09Qa29CTXhKSGFFc2pHZzM2cFdCaDQ5UGx5VXZLSkpGNC8xbHVpcmRVd2lJ?=
 =?utf-8?B?dnRqcm5yZkh2dVFUZ2lIQ3V0b05MV1N6UUQwM2diWk9tcXBMVFM0RS9SVHl2?=
 =?utf-8?B?dkM2a3R6OG81cXdLN3pLSEl2aXRyQnRScEFjTzZtUFZUbGRpZ1l0ZThBbVEz?=
 =?utf-8?B?bjgyNk9JZXcwbXAyUUxFSEZocUE4VEhnWHlXSnVtZ1hBanpaa2FGL29oMFdY?=
 =?utf-8?B?VS9rTFMyYXY2WUVBK2pPbDZ6QzBYN0swNEhOK2lSN3VLY3FBYmtNcnhYMFNB?=
 =?utf-8?B?aTUreSszSk1ncWMwUUR0TlBtZVZIbzVlWlFRUEpkRGRiRXV6ZkRkK3J3RTIw?=
 =?utf-8?B?YytqTEJIM09qUURvNTZOTzRpamI3VzVjeDJsN1hoYkJxbnBQRUFhZFA2UTNr?=
 =?utf-8?B?SGZNcVB3NGtmeXp4dndZalVQQThEQWY2ZUwwV0szUHBoMFh1YXUzNXowN1ZN?=
 =?utf-8?B?bUhpNXFkaXArMVArem1qM3dueHdXcmZMWWJnWkIrS2tEWE5kdWN6Y1I0Z1VU?=
 =?utf-8?B?VDdseGJpZ0c2VldNSVhFdmk4bXczQzVhN1hLY2tqZExQdzZEOE9raGdGcG93?=
 =?utf-8?B?VkIydkRSdWswMk16UTdkMGtXTzYwWmFRWld5b21QOVRMMFRvQkkrLzEvbGZG?=
 =?utf-8?B?VVFjb2tWL3dFc3I3MXdiQjdlenJUSml5NjI3cnpsMzY4Z0RXSkE3eTJTSlZM?=
 =?utf-8?B?TTN2cmpaQ2daVmVzOUNJc0ZNOEY3LzF1N0JSZERWRkhDdUNTWkN5TXZvd2xO?=
 =?utf-8?B?MjUvTjRoNDdRbHpqYmFaN1I4bnNTWlAvZU15L3k4NUpwUkYybVIrZVJvS09n?=
 =?utf-8?B?d3RhdjdKMzNqeE90K0xOZlZzRHp3dGc4MDNzVkNhS2UwUkNUSnV5Vm5KQUJ3?=
 =?utf-8?B?WUVib0taVUw4Snkxb0dhcVN5d3ZzVytSK3dGWmgxcFlZVEZPWHcwWG8yV25p?=
 =?utf-8?B?a1FRL29vK1dvbURuYjJyZ1R6N2diVnU5TjN5dkFrVUdFK1BEWkdyN2dJZ1Aw?=
 =?utf-8?B?eHhBL1huQjFXYTRhRXFuNnRVUmE5dFhMLzRBZFJ5U3FQTkZRMUtWWW03QjhD?=
 =?utf-8?B?RGEvczdHQzZDZ3VXWTdIZ2NsNlRRVzRBNUw0cjJxNVNsMVpkMFEwQ1k4SEti?=
 =?utf-8?B?S2xFZkM0dDRQWDM2QzNmWjVzL3JRdG5ranFVTzBlNldyMEJSVmVqd0p2aHkx?=
 =?utf-8?B?TSt5QWxDczRrNEJpVmVPKzg0cVhxSzh4UVZQSkVqZ3hXVUtKejR2V29CRU5o?=
 =?utf-8?B?SG1tZnF1UWN4MnIvNlBDNDgxaVZYN2Z6VzhWSVY3S3NnVlU4L0VwaWdmZjhv?=
 =?utf-8?B?MlZ2MG1sZHN1NVJxUVV0am8yS0JxL213L3oxOE9nSnpuTjIxRGFqUXlBMUJv?=
 =?utf-8?Q?YzbSoNPxApsDz5pTWM45FvXYo?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce01c424-2102-46af-b6cc-08daeda2cb91
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 15:54:28.6061 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4pVyFIvOxOmIFyfQ4VeXinDnjdg40eo0Hl+7p7+Y26OYJ34ERdjSxVPpGNG4G0QyJobEvf7+KdPkay1gs5e+Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6912
Received-SPF: permerror client-ip=40.107.212.52;
 envelope-from=avihaih@nvidia.com;
 helo=NAM02-BN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.103, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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


On 03/01/2023 13:13, Dr. David Alan Gilbert wrote:
> External email: Use caution opening links or attachments
>
>
> * Avihai Horon (avihaih@nvidia.com) wrote:
>> As part of its error flow, vfio_vmstate_change() accesses
>> MigrationState->to_dst_file without any checks. This can cause a NULL
>> pointer dereference if the error flow is taken and
>> MigrationState->to_dst_file is not set.
>>
>> For example, this can happen if VM is started or stopped not during
>> migration and vfio_vmstate_change() error flow is taken, as
>> MigrationState->to_dst_file is not set at that time.
>>
>> Fix it by checking that MigrationState->to_dst_file is set before using
>> it.
>>
>> Fixes: 02a7e71b1e5b ("vfio: Add VM state change handler to know state of VM")
>> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
>> Reviewed-by: Juan Quintela <quintela@redhat.com>
>> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> It might be worth posting this patch separately since it's a simple fix
> and should go in sooner.

Sure, I will wait for Alex's feedback on the series and consider sending 
it separately.

Thanks.

> Dave
>
>> ---
>>   hw/vfio/migration.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
>> index e1413ac90c..09fe7c1de2 100644
>> --- a/hw/vfio/migration.c
>> +++ b/hw/vfio/migration.c
>> @@ -743,7 +743,9 @@ static void vfio_vmstate_change(void *opaque, bool running, RunState state)
>>            */
>>           error_report("%s: Failed to set device state 0x%x", vbasedev->name,
>>                        (migration->device_state & mask) | value);
>> -        qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
>> +        if (migrate_get_current()->to_dst_file) {
>> +            qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
>> +        }
>>       }
>>       vbasedev->migration->vm_running = running;
>>       trace_vfio_vmstate_change(vbasedev->name, running, RunState_str(state),
>> --
>> 2.26.3
>>
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
>

