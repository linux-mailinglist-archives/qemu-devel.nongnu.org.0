Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C99D262BFAD
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 14:40:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovIdw-0003Ne-0M; Wed, 16 Nov 2022 08:39:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1ovIdt-0003Jq-IF; Wed, 16 Nov 2022 08:39:53 -0500
Received: from mail-bn8nam12on20624.outbound.protection.outlook.com
 ([2a01:111:f400:fe5b::624]
 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1ovIdr-0005dE-BA; Wed, 16 Nov 2022 08:39:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dE5ATRnXcx0Kph+EoBAi+ZMMiVhzrjoJCPc6bdSCNPtn+k0nHuA/uO8LATE6BNRz5b4CZsMnXn7AkbaB7mqayCyMVLo+jf+zwZb8Le7D8ksDNVLkhiVZjsRNOopwkYfiaZDW0Oh4ZFvm64sUFPFJB0QHsB4BL89/zzXyoeJr7q+V7HKg7CbcjpJ1CDsO/kuVb2jmF8r1UzQ2gZNol2DDho+qxjsxkeyBIzW3WZBPQrcRfS/+5q3ddxDTcuoEpfyz0flKUP/Ubb4+RXNMs0/NEhF/uMVWbUhHbof1V2B9geOFKvHTtIe+1C/LKJlCyclN421Z6CMRKWWCwsNPsD0G4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jas1/TY7CD/ZawIvEFIMAQNXfGBZyl1FQfJ9J6ueoFU=;
 b=TP7IofX1/C1Yll9ZHU2hBDKT9R2ksyhhj/2i0wmL1sQoUAz0fbPS3UuTlAWG9b1vLInGRw01chWV8pRn/AExI7Hpt78CvF9wI0NUdSoEgD+Zcyi2yt+y8lilMPaCx3Vv/SMw/BLLm5/1pVhDg/LQgbprGOVUSHPVnS5H8QM1Ppf4EQqnqjgrEnbP39H8K1eKR/wpDOqPc75eD+geIc2SXQyLyGqZy8w0pTNkXBo3PsJUl//3VQmHUw9BgcR3yWsSND6y8Iry2GiYLxYonkDT7pzDh0I5y3CTCLYHJ3LzwAkMRfGljHKIisl6M6DVhGtYHuruoeQzvoe/CbsRBiiFBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jas1/TY7CD/ZawIvEFIMAQNXfGBZyl1FQfJ9J6ueoFU=;
 b=VtaVjY5jZu6JaeBDJnAKwk7WuIOnvod66jcM7q1ngDl4w2qz4363fG0fS+sznskUtSyW/LdPVHAGSNa0ZJZysGFWCVMabH2IWusqzyyjHRB9G7++I+t/Bqdtub0A2OCEoC8UJo1tMHqi0DMPK3gZ6Oum+VZmnCeA+gO1bayJ6cM4OckeKRRyaMajEjzgC4T7eGcsQ2sFrBS9gHb83+y0B8tKkOnCf6qTV3uqjVVIRhUIzQFFLxUjCvQmTe7s8kjc9h5TmE792rnth0lEHWNLsyXOvziL0taQ796UP9LW/8dLDRpDsqVwJgQ8lcp07QUB8oxpzCliaD9tduYI0GuqHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by MN2PR12MB4175.namprd12.prod.outlook.com (2603:10b6:208:1d3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.19; Wed, 16 Nov
 2022 13:39:44 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::53a7:afdb:d6d0:f167]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::53a7:afdb:d6d0:f167%8]) with mapi id 15.20.5813.019; Wed, 16 Nov 2022
 13:39:44 +0000
Message-ID: <8d05c132-9605-2e4b-235a-ad0f1e2ec3b2@nvidia.com>
Date: Wed, 16 Nov 2022 15:39:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v3 10/17] vfio/migration: Move migration v1 logic to
 vfio_migration_init()
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
 John Snow <jsnow@redhat.com>, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 Kunkun Jiang <jiangkunkun@huawei.com>, "Zhang, Chen" <chen.zhang@intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Shay Drory <shayd@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>,
 Joao Martins <joao.m.martins@oracle.com>
References: <20221103161620.13120-1-avihaih@nvidia.com>
 <20221103161620.13120-11-avihaih@nvidia.com>
 <20221115165617.631240ed.alex.williamson@redhat.com>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <20221115165617.631240ed.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0153.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::16) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB5549:EE_|MN2PR12MB4175:EE_
X-MS-Office365-Filtering-Correlation-Id: b018e4da-1323-4cab-e507-08dac7d804f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GdsScvD+CP3CfvTgt3ZwGA29TlR35Kj5qQwX7wSjpw3P3+JSpuv5W8RNx3IOiBKEdQKMPBptoERF4ctJtqXwNCGzqAt6iJplrZuORbIX5UtVcFYVvl0PJWcFxgKVALLh+f7/qjJwogtr02Eq7MnMYmRi3Iq7xLsYUEuCHRUmtQLWXatIPtubto7Av+3ZTxaZQ1jFCoT4iNUIvsbxI5TLpTc5h8/XO566Mxq97rJ1L9Sb2IW3SKyakKk5i6wsjIvliZsAGE/kADayiiOQuFhftrhtg9yFu1ssfzJc6h3+OPfmoP/OOPEF2uHhZJW+Xk5O3HpYZK0zRquj/CAF9WWlc8fVXVX/PqAKX1qCNHjq9LHt8piM4gZ1bQjbRyMbvpC+k4p0PeAOiXf3JCL4ceTft3nN4gwOrGM64l9Qxo1ssfKMsZtdX+mS84rv2HHDxlI7tjkPWNWHRRmCFTO2ag4aCjb95VX7SIOhZhnr6baYWKqMFXbcppS1iIdAvgcrsZ+n43Nn1eK78ceRr/M6BXT86agzMGZfB4onPBt6f45R85invsAyLbLXyiZoJq6TlXe/tKsAEy4Op/wdDSLoi4Nu8c+3C7lR3SJGmcUi3K7KmRHqhnsBNHis0qhdQiLUEBQaAm6N6vCpwCERhK6izQieLYsPwGuWXovXca5N2J2I4Xui4Q++giqy9jESR9koj+LR+Kj+N/uGoAUI0zQr/ouEowJNeDN3WSzI2NzcLzTFwIm5CVM5g1fqM9eX0JbeqbNxm78kOrWRBERARSGBCZIdbKNEZhUMS6zHv1f/3d70YJk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(346002)(39860400002)(396003)(366004)(451199015)(86362001)(31696002)(66556008)(83380400001)(38100700002)(5660300002)(7416002)(8936002)(2906002)(8676002)(66946007)(4326008)(41300700001)(53546011)(36756003)(6512007)(26005)(6506007)(6666004)(186003)(6916009)(2616005)(54906003)(66476007)(478600001)(316002)(6486002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDZsSzgyMnUzL2h2eGVNMnY3Z2ZqUHBDVWI3a3RsQnlidStmbHZYb29vVENQ?=
 =?utf-8?B?YzFndU1ieVhncG5Oc1pCSUdSMEF6WGxybEdqcThUcHdJUWlQU3RFMXlhcWdZ?=
 =?utf-8?B?Um00YXFncmI4UmM3ZkNjSHhaTXpsYVJSaEZDaFdZZ3JQekZrRjk3ZzFLRURa?=
 =?utf-8?B?Z2FlZGdJU0d1UTVXdEZjck9LMlRURWVETWFLMldkbG5nSmpOOFB5OUR5YU5R?=
 =?utf-8?B?TitwZ05LSUxPQVl2YWF4UHdydXQwbmtmZkhNT3l2MDdXdENRQVVWQ3ZqRGxl?=
 =?utf-8?B?aVprQTZDRlVwdDEvamJQR0ZlWitLZW11a1c0N0NQMnRxQ1h4Z1NmWC94bTJL?=
 =?utf-8?B?cGxmVU42U2cvWHNieGtoeXdtNHAyczdyYzYzd1dxdkt1dktlNi9SRmo0VG5j?=
 =?utf-8?B?MVNWTnlMSEpqR3hINURpSlpkb0xXTTFyNVdsdzRRa0FUbTI2Z0NRdmFPZXZl?=
 =?utf-8?B?YWNaMWlJVmlRZFdtQiswVzZWYWxQMXdJb0JHMTdwSE9VQXVJcCtsZ2p2WG10?=
 =?utf-8?B?WEs3d0NDMGpNZzhXUklWNXBRUGNaRHM5TVdEVkNoZThqZVZqTk9VY1FKRjhX?=
 =?utf-8?B?WHlNOCtsWGMrWjJmeUFqeUpVU0thU3RPNmEyTTJDVEVjU0hwN09PODJLVk85?=
 =?utf-8?B?a3BxOFVmdGdDV0hCRmVYMUd3MFAxakJpY0xOeEkvWldoNVdNQmp6eVBtQXpy?=
 =?utf-8?B?YkRiU2lXSjNTV0dycjY0ejBDcVR5b2ZjTVk4WEx6S1d6ZDVxTXBKSFpvd0Vi?=
 =?utf-8?B?NTU2NjRDTVp2QmFheWU1MkhudklpY2d5NG9vWHBxRy9WQ3k0eFRsR0JvN0N3?=
 =?utf-8?B?aTdrMngrWjkyT3Z6anR1U25tcHFhWWRYY1dDNEdpMVpZNk44Y0FES0JrV0l5?=
 =?utf-8?B?MzJLZmRoUFdzT3FWTWRCV1RJbFFGd1FRVllrOVVCZkxDMERqek5TdFVvMkRM?=
 =?utf-8?B?bTNBbVVHQTJEcTZkYWJmam1qVDhVd2MvNkpUT2ViS3FSU2VKOFpCelpHQXJM?=
 =?utf-8?B?ZjJERE9zc053d3QyL2Q3TFFlTkpmUkJ6bUc5RFVtYS9Zd2pDWUF1eXI4Mk9P?=
 =?utf-8?B?WXJNczdsbFZwaXdMMWhPbW5xak9UWUxZUTgxUVZERURNN0JYRnp6S3h4UmV4?=
 =?utf-8?B?dzFodzY2RU5lTDVQNVBQSzVQVzdzKzFTUEFWUlFHQ3ZmM0RUbFoyTEtIZEdz?=
 =?utf-8?B?OXZJL2h2RDd5cGpvQWNGaXlVQnFBall2b0s2bnRMOEtna3RMdXdwS3V5MGJS?=
 =?utf-8?B?aHVpWHFVTGdDZ0hmUzI3ZUNEdDdYQytpanRneFo1U3VXc1hiRGFYR1V0aysy?=
 =?utf-8?B?eENXdHU1VTlwRVNLQVVYd2V1SDVWVUl1ZkpROW0zY2hnVWVsKzkwbW9Kc2Vh?=
 =?utf-8?B?NzhpMUJaalUzd3hLcVQwajNjb21PMWkvWnIrVEsrTmh1Mk83dkVlY2VQczdy?=
 =?utf-8?B?MnFqTnNwa09wNjZUQmloN0h5VkVpL2lSVktoVVZnRDdwZ0IxRDIrSzk3djV4?=
 =?utf-8?B?M0ZhVkRXaXk5THFITEV1ejhKeWlkeWtaM0h3WWFDdEordk1NRWxNeU96Rjdy?=
 =?utf-8?B?THR5MHdkc3o3K3BlUmRSOTRMNzU2bkpJQ1pwZDZIQXJpaGNvQyt0TVVhbTFC?=
 =?utf-8?B?b2UyazhnUERBMXdQS21FTDBlZVAvUW9QQmVuclVDVGkrUW5YbXVSVFJDZ3pF?=
 =?utf-8?B?MWcrRlRIdExqVVRkaTAxamxDelVkQ3dtRHRBUUtGVFdEVHlSeVZPQTN1YUVJ?=
 =?utf-8?B?S3l1cTdlUjMweTEvbjZGd3BLU0w1RDE2K2owTmhuUDBlU2J6QzI0Y2hKQXVB?=
 =?utf-8?B?cDA2MXljTCtlYXh0bGVsVThuei9HSXhBTlRQeFJmLytvTHQ3M2QveHBELyti?=
 =?utf-8?B?TVllWmJPdm1CL2h5U0FIYzZZdWc4ZXc2bkwxempwN0VTc3JFMkNKSmxHd0pZ?=
 =?utf-8?B?Zitub0VmcW85UlhJcjBDNU5FZnBkNmphTXpjNEl1ckZOWCswWTRteGNmOUlp?=
 =?utf-8?B?VlNFT0czVGlDMzZLREs3M2VYUmZrLzRYeStpNTdjU1I0Z3kxNEorSTBiYTBE?=
 =?utf-8?B?MkRUcTFtWGRIOEsvdEhiQzA3cTZZYzZoVVpabjJzcUgzWmtNS3dqTHlaeDEz?=
 =?utf-8?Q?MjMuPgnroQPtj+VztWyUfHQVz?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b018e4da-1323-4cab-e507-08dac7d804f5
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 13:39:43.9245 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0LzgwhyNIcmBYXarsENaevsyC4N6WAYmH8SbAuygvHqu49JAsoa8UYXcH5vGhC3nHUX0ybjr6mCab9/g2KtwUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4175
Received-SPF: softfail client-ip=2a01:111:f400:fe5b::624;
 envelope-from=avihaih@nvidia.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
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


On 16/11/2022 1:56, Alex Williamson wrote:
> External email: Use caution opening links or attachments
>
>
> On Thu, 3 Nov 2022 18:16:13 +0200
> Avihai Horon <avihaih@nvidia.com> wrote:
>
>> Move vfio_dev_get_region_info() logic from vfio_migration_probe() to
>> vfio_migration_init(). This logic is specific to v1 protocol and moving
>> it will make it easier to add the v2 protocol implementation later.
>> No functional changes intended.
>>
>> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
>> ---
>>   hw/vfio/migration.c  | 30 +++++++++++++++---------------
>>   hw/vfio/trace-events |  2 +-
>>   2 files changed, 16 insertions(+), 16 deletions(-)
>>
>> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
>> index 99ffb75782..0e3a950746 100644
>> --- a/hw/vfio/migration.c
>> +++ b/hw/vfio/migration.c
>> @@ -785,14 +785,14 @@ static void vfio_migration_exit(VFIODevice *vbasedev)
>>       vbasedev->migration = NULL;
>>   }
>>
>> -static int vfio_migration_init(VFIODevice *vbasedev,
>> -                               struct vfio_region_info *info)
>> +static int vfio_migration_init(VFIODevice *vbasedev)
>>   {
>>       int ret;
>>       Object *obj;
>>       VFIOMigration *migration;
>>       char id[256] = "";
>>       g_autofree char *path = NULL, *oid = NULL;
>> +    struct vfio_region_info *info = NULL;
> Nit, I'm not spotting any cases where we need this initialization.  The
> same is not true in the code the info handling was extracted from.
> Thanks,

You are right. I will drop the initialization in v4.
Thanks!

> Alex
>
>>       if (!vbasedev->ops->vfio_get_object) {
>>           return -EINVAL;
>> @@ -803,6 +803,14 @@ static int vfio_migration_init(VFIODevice *vbasedev,
>>           return -EINVAL;
>>       }
>>
>> +    ret = vfio_get_dev_region_info(vbasedev,
>> +                                   VFIO_REGION_TYPE_MIGRATION_DEPRECATED,
>> +                                   VFIO_REGION_SUBTYPE_MIGRATION_DEPRECATED,
>> +                                   &info);
>> +    if (ret) {
>> +        return ret;
>> +    }
>> +
>>       vbasedev->migration = g_new0(VFIOMigration, 1);
>>       vbasedev->migration->device_state = VFIO_DEVICE_STATE_V1_RUNNING;
>>       vbasedev->migration->vm_running = runstate_is_running();
>> @@ -822,6 +830,8 @@ static int vfio_migration_init(VFIODevice *vbasedev,
>>           goto err;
>>       }
>>
>> +    g_free(info);
>> +
>>       migration = vbasedev->migration;
>>       migration->vbasedev = vbasedev;
>>
>> @@ -844,6 +854,7 @@ static int vfio_migration_init(VFIODevice *vbasedev,
>>       return 0;
>>
>>   err:
>> +    g_free(info);
>>       vfio_migration_exit(vbasedev);
>>       return ret;
>>   }
>> @@ -857,34 +868,23 @@ int64_t vfio_mig_bytes_transferred(void)
>>
>>   int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
>>   {
>> -    struct vfio_region_info *info = NULL;
>>       int ret = -ENOTSUP;
>>
>>       if (!vbasedev->enable_migration) {
>>           goto add_blocker;
>>       }
>>
>> -    ret = vfio_get_dev_region_info(vbasedev,
>> -                                   VFIO_REGION_TYPE_MIGRATION_DEPRECATED,
>> -                                   VFIO_REGION_SUBTYPE_MIGRATION_DEPRECATED,
>> -                                   &info);
>> +    ret = vfio_migration_init(vbasedev);
>>       if (ret) {
>>           goto add_blocker;
>>       }
>>
>> -    ret = vfio_migration_init(vbasedev, info);
>> -    if (ret) {
>> -        goto add_blocker;
>> -    }
>> -
>> -    trace_vfio_migration_probe(vbasedev->name, info->index);
>> -    g_free(info);
>> +    trace_vfio_migration_probe(vbasedev->name);
>>       return 0;
>>
>>   add_blocker:
>>       error_setg(&vbasedev->migration_blocker,
>>                  "VFIO device doesn't support migration");
>> -    g_free(info);
>>
>>       ret = migrate_add_blocker(vbasedev->migration_blocker, errp);
>>       if (ret < 0) {
>> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
>> index a21cbd2a56..27c059f96e 100644
>> --- a/hw/vfio/trace-events
>> +++ b/hw/vfio/trace-events
>> @@ -148,7 +148,7 @@ vfio_display_edid_update(uint32_t prefx, uint32_t prefy) "%ux%u"
>>   vfio_display_edid_write_error(void) ""
>>
>>   # migration.c
>> -vfio_migration_probe(const char *name, uint32_t index) " (%s) Region %d"
>> +vfio_migration_probe(const char *name) " (%s)"
>>   vfio_migration_set_state(const char *name, uint32_t state) " (%s) state %d"
>>   vfio_vmstate_change(const char *name, int running, const char *reason, uint32_t dev_state) " (%s) running %d reason %s device state %d"
>>   vfio_migration_state_notifier(const char *name, const char *state) " (%s) state %s"

