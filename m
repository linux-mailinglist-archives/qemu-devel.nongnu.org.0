Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1385668EFA8
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 14:18:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPkJC-0004aj-EO; Wed, 08 Feb 2023 08:16:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pPkIu-0004Re-0i; Wed, 08 Feb 2023 08:16:04 -0500
Received: from mail-sn1nam02on20615.outbound.protection.outlook.com
 ([2a01:111:f400:7ea9::615]
 helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pPkIr-0002Jm-Bo; Wed, 08 Feb 2023 08:16:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mRyYDwjduX5ifwKoAf4S8hdNJqHV5wazRXv+8xi7eHRwjxsjYP/nfyQ+mzRsPtE8jNIsDv6oIJVy7cagqgqVNRlKaWcPHuR2em16KrImbOHOcFTaqsEPFPknlvhx8KWOV5LSaAaZRVOKxwjdw2G/J12DP1ZWAdB+ytiRZK9VvZhiYbfB29ScjC0xR9M1I+iXUGX740VfNqzYlqSLz/jMeNfd4gH5NQN3NzvLYCcPH27I5JkOKSpS23SviEPNIeWe3T0L8Z4cP8F004x6eioEUSz6QLxEmQiOncfP2QXCEeugXq4HmI83U+3V8gaCdgA0vWfVSRhpw/fvN67e4DCs7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ixVAT3bijyDb+soPUp4y5oqwpt8QICjBIjnO1E6wNZ8=;
 b=bM7Dc+ykGkLZzLDvDfBhPRrRYXSA1G7x7rw8hcyY9oyHAVZJLyDkKNCggVD/WHL++XTQfsui+iBYplmptcWN6h2yxSDrPe+5kPCJi3n03LngZwlyg89jnenMjxLbTXRDKopbWdsDlDuKgptubNHgkQV4sVxE20FnoYgGI0DVbQaMEPuXUKssjvj3hPMsvkPyvmgoqJU0q3QqsunjMQc+3jD9Lyos4mt8Af2bqiRafhS5o9xQJPMsBq7nvdVAd+SvnH9lGj7y1GqzQtkG2Wq2nbizZMvifn2YigedrBkA7Kkd0cccoSsy4y4X9bZ5dV5d5PTEtGC7JFrUVLpuC77ijw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ixVAT3bijyDb+soPUp4y5oqwpt8QICjBIjnO1E6wNZ8=;
 b=EFawK+CgyD2+aoH3sL81kjiizPXyMRL5GGCHko5+VelOQrmww2uBGn9O6wCibXbmfxnrPRTTDSyOGDgRuGclqVi26jEHNYoC1yKUPVx8i5e0zHFQAFqNysJci/njnceLTV5olNjD0HSkDmQ7Chnx7vVtNOPqjUNDUJuXEShOGz/8LVAM3GrXU6+jT2hagKJfp6A3089bwxLHLb1fqZ7HFH1rdQMRl2KIDpKS8GKFau3SHodJhP1SLTpMWXZJq1qk1+zVqcE5NXTqWlPmxxZZKMUIh6VeXrGYXd8TLHLwSJVm/1EpE1ia3WOXSA0fXrDexTuQwqRZdP6q5DERADv0lw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by CH0PR12MB5041.namprd12.prod.outlook.com (2603:10b6:610:e0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Wed, 8 Feb
 2023 13:15:56 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::451d:1f37:aa83:f425]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::451d:1f37:aa83:f425%5]) with mapi id 15.20.6086.017; Wed, 8 Feb 2023
 13:15:56 +0000
Message-ID: <b16e381b-58c6-9dee-ac8b-185ebec2874f@nvidia.com>
Date: Wed, 8 Feb 2023 15:15:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v9 10/14] vfio/migration: Implement VFIO migration
 protocol v2
Content-Language: en-US
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
 John Snow <jsnow@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@redhat.com>, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
References: <20230206123137.31149-1-avihaih@nvidia.com>
 <20230206123137.31149-11-avihaih@nvidia.com>
 <20230207164209.03951381.alex.williamson@redhat.com>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <20230207164209.03951381.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0071.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::10) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB5549:EE_|CH0PR12MB5041:EE_
X-MS-Office365-Filtering-Correlation-Id: 10889166-042d-4bca-1357-08db09d69c83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YBDegWnSxE/U+UPR4HY5e7kRHYB3Vjgbey8oNct6TsY32VCNgJu2ehVjIFsq0z9kb+wak44X+M4dnPfNp+H6i9iGxFurbIwUrOyT+53MVBepLtmm4LKRVzNn6tiGDc7MFfERmrp+5Enb4eWtI/vA6wJfYKDbGp85x2qecu6C4VvF7/MjtecGAZTZzpKYpvy5UEvw4CTUFUvxqtKFmsmK+MQxVX4oxybyQyYgmSG8+xdBBHCuxc6xrZkE391pQo9piTlsYrgY4Y0a/AlVcpaiCkUlfPODR/PoKROIwPjurRedKcp/LAWz1nhID3s8jWXIcFVTpvMetYqvVcLZv03v5kfrOLJhUGeTlKcCcYDShi+oBM7Nfjq7d6Gu+x49s62tdw3tgvSfQkirFLcBpdxCZBEJ4kbqa7WKqTMPufgl9uqx8RFx/oBtgxhoDBeT7Pijw96U2qUXh7ufWkl1OuKmhKShHvyKJr/8SdCYaf+7G+kmUKNGwJ/KnQQjfve030IL6Cj1uyN8zNgwSFXohTAhAdliP3LUXNsyVlZsTzEGRmHhhdqENZzxRUsuzhc36hS8vCH+2GJzsztFksiwyv4mSHA1czPzDFEdZ5R8GHM14WU3ARFHPBklR3/sY1i8Tej3ugURbw+Ri/DzdO9deJcXKVWFUIN9b6BkepLEOf0RAWwbqWHGZajh44MQCXIgIX7xBhzgAuVEwRE1FpVMQmI1pL4djnhRqNh7zE34ANSU5b4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(136003)(39860400002)(346002)(376002)(366004)(451199018)(316002)(54906003)(186003)(83380400001)(31696002)(86362001)(38100700002)(6512007)(26005)(53546011)(6506007)(2616005)(36756003)(6666004)(6486002)(7416002)(478600001)(5660300002)(41300700001)(31686004)(2906002)(8936002)(6916009)(8676002)(66476007)(66556008)(66946007)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0FMd0pXd2xjemRpWXZ3Rzkzc0lyS1NTOTNVajU3L0pYSzlZaXFsUTRPNzN5?=
 =?utf-8?B?WVBTdEVtRFdSQ2luMjA1SHdsZ1hRUEVvd2xVSmlxWXhndjduVTVsQ0tiWWFB?=
 =?utf-8?B?U2hEQ3kyRHFLNnFYNDY3NWVaNEN6ZUpyMmljTUxCbFpwOENvUUxlRksxNitB?=
 =?utf-8?B?NG1IMHphYWIycm53UTJRdTVBLzZlMTBTb2k2K2FueitEVE1LV1hNTWdqd0ZT?=
 =?utf-8?B?L3NIQnRpN1l3eWNaUUp6WnY4WU8rWE5TZ2U4RkxKa3hBRjgvb3RhMmNpNUZS?=
 =?utf-8?B?M1orazNxVEZSY3Rqc2JCL25wS1FSVm5SaVdKNnlpMXZSRk9PQXB5QWMyNm1a?=
 =?utf-8?B?T2Q0VWk2dWpoZU4wckR5OHpadzNJWlhGYnQ4cmhKelhmTi9kUjQ1ZGIvL0ZK?=
 =?utf-8?B?d0RkbnhnL0h5a01FaEp0TFQ0ekNGa3AyaTFXWVNxS1loeHA4YURKZ2lFZFpV?=
 =?utf-8?B?eHROMkVpWmw0a3NtdldVR0VFeWg0Y2toeGpXYVpXSGxrdGdIa1JDY1JqN0l3?=
 =?utf-8?B?dUV2Wm1Oai8zaU4vdThteFhGS2RtVSs5S3NLV0VEK2YvMzlNNzRsQ1V0aFI1?=
 =?utf-8?B?aFBtS053ZjkyZnJkMHNLNktBSFg4cW5vdWFKaGpST3ZxbFB2RWlXYko4anFT?=
 =?utf-8?B?TzYwcjJVMFIzTXFpNjRoZUxSb1pSNEdKcnNiVURkZ2JvUjhBZE9POW5ZeWxH?=
 =?utf-8?B?NGVzc3ZQZ1lxYnpNRk5QVEpGZHFCLzV6ejFqVTdQaU02QXF0cldBZEY0OThD?=
 =?utf-8?B?MGx2QlVZYXhRdjdSTTExRjFuNUE0WTEzSmlpVFJSRzNCdzJ2SXFyYWUvMEVT?=
 =?utf-8?B?d205cktjd0dZWjNGa1RJcG9ETWdCOHg5S3diOGJGRjUrUGkxZUlWbkJDVy9n?=
 =?utf-8?B?cmtnS1padnNyS0M5WVRZVVpuSHYrV0E2Z0ZyWjhQdURhUkN0Wk05a0pwU29z?=
 =?utf-8?B?SVNEYVIvejVoN3pqeVA0ZmMxR0VTRVlxNU5aQU1xYnhKTzFlQytDTEZnQ2d1?=
 =?utf-8?B?U3llY2NQejNLWUhWSE9xeTRkUmVFQW9vZDBXcGI3MFE0eUJRNzUvbDBTdU9U?=
 =?utf-8?B?SWtaSnVYOXNJZEE3bTBhODdhMEM4NDJiVkhMMllpTjZUNkwyc0FqK1VoNnlj?=
 =?utf-8?B?cFIyUmdTMkxaeW1mQVBsV1N2U3pPK2hYd3IxbHkvbWlMa3NRems4THI0SFU1?=
 =?utf-8?B?QkFka0VDVVdoTThINGlySlU1bU5zU3RxL0FIa1F1QldSMXl6b3RkYkhBWWdw?=
 =?utf-8?B?WUhxYU9BWjhtVEdBUGhPcXo2R0ZFR21udzFGMXNLQVpHdjBySzhub0UrQ1Ns?=
 =?utf-8?B?SjdMSm1kOS9TSGcrSlFvODNFcWVLbkFMc2FIb1RwZXpLSXE5TjJ1bnNsVnBt?=
 =?utf-8?B?aFU2YUpDL2ZwY1VsdE52eVR4S0pMa0J4bTZNaXdTV05zNnRQd2txbUZpa1Fo?=
 =?utf-8?B?bHlVK2t3b2VkcEZ1ZjJpc2cvT2VKZjNBQk9wbnNKUDYyTVA1SHdwOWpLY0tt?=
 =?utf-8?B?eDJxS1IwYkliazlVNU1oSU1rMVpJOGdFSDF6dkNabnh2bXdUZ0gwZjJqMXpw?=
 =?utf-8?B?TGljYWpodWtzQmpQSFBJR1NiNG0rbWZJWUtxZ3R2NE1tbkRYZzJlckhsOUFn?=
 =?utf-8?B?K1k2a3krWlI4TDBjY3FlTE1YUWVYYmtFQXd5SmVJeUY2d2o3Sks1WkhpS2FL?=
 =?utf-8?B?UnhLRzRFd211OEg3aUJ5djA4cUl0L0NIeFJCYnRscGwxdEJEMjNNWWpQMDdI?=
 =?utf-8?B?dGJxMVh4MHhZRXNTTS9nVWE3SVVkTXFSdHlUcWIweE9pVmRIYkJITkNkQnB1?=
 =?utf-8?B?WTRuY2N3bWNaQlIxZ2g3aHVvdm1LYU5Mc2pTUnZuQllsUFg3S09UQ1RPMDhi?=
 =?utf-8?B?djdqdnhxdlRPRVI5TC9TSkcrbjhGU0FJUTBrM0h3SFd2anRKMEdsQWV2OWFx?=
 =?utf-8?B?V0VYdTFmUEkyY25ocmcxNzdXdWsrUEFENDlwS2dFWnU4NUgwenphUk9BcEF3?=
 =?utf-8?B?SURlUUI4VzFpamhsV0NaSVBHMDFsRUZXQk5saWZQeVlHbElqbkFYNTN5cjhM?=
 =?utf-8?B?R3M5bFp4TmFic0dLS2YzTnZDeVVxUU1HUXIvb2NRTEtEYlB4SWliSW9KbTla?=
 =?utf-8?Q?6afe9qe7k4/jQrO20ZNRokarq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10889166-042d-4bca-1357-08db09d69c83
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 13:15:56.0137 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cKz6T3OOoSpuYMX4EbRSuUZr1tjU+ahvmuYmcJBIg+akSMMSfMwjXOsGz5aatncbvhbMb4C/A5Zlxp1W7zdV/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5041
Received-SPF: softfail client-ip=2a01:111:f400:7ea9::615;
 envelope-from=avihaih@nvidia.com;
 helo=NAM02-SN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.146, SPF_HELO_PASS=-0.001,
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


On 08/02/2023 1:42, Alex Williamson wrote:
> External email: Use caution opening links or attachments
>
>
> On Mon, 6 Feb 2023 14:31:33 +0200
> Avihai Horon <avihaih@nvidia.com> wrote:
>> @@ -523,6 +745,41 @@ static int vfio_save_iterate(QEMUFile *f, void *opaque)
>>       return 0;
>>   }
>>
>> +static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
>> +{
>> +    VFIODevice *vbasedev = opaque;
>> +    enum vfio_device_mig_state recover_state;
>> +    int ret;
>> +
>> +    /* We reach here with device state STOP only */
>> +    recover_state = VFIO_DEVICE_STATE_STOP;
> Why do we need to put this in a local variable?

No need. I will remove the local variable.

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
> IIRC, the ERROR state is not reachable as a user directed state.  I
> suppose passing it as the recovery state guarantees a device reset when
> it fails, but if that's the intention it should be documented with a
> comment to explain so (and vfio_migration_set_state() should not bother
> trying to use it as a recovery state).

Right, that's the intention.

I will add a comment and adjust vfio_migration_set_state().

>> +    ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_STOP,
>> +                                   recover_state);
>> +    trace_vfio_save_complete_precopy(vbasedev->name, ret);
>> +
>> +    return ret;
>> +}
>> +
>>   static int vfio_v1_save_complete_precopy(QEMUFile *f, void *opaque)
>>   {
>>       VFIODevice *vbasedev = opaque;
> ...
>> @@ -769,12 +1087,17 @@ static void vfio_migration_state_notifier(Notifier *notifier, void *data)
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
> Same here.

Will change.

Thanks.


