Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E23A6629BF
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 16:20:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEtvo-0003zn-3f; Mon, 09 Jan 2023 10:19:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pEtvj-0003yh-7A; Mon, 09 Jan 2023 10:19:19 -0500
Received: from mail-bn8nam04on2040.outbound.protection.outlook.com
 ([40.107.100.40] helo=NAM04-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pEtvg-0001Up-Sx; Mon, 09 Jan 2023 10:19:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J7oDJNKZLtFKP3lPKruZvlozM5US9C+Ko3ZUvw+6IsCk2ytHxnGj+kkiZFToVil1DXQlystF8IuwuZEHEjYIHuOKs0oRDsaEbTS0J6aGtd+u5PzXykt/kwkCzRzhzcTqw6n32SYi7/4EFnbzedzBp8vqfxb7O5S2CqO4gs6X++358eTFA7eKrzifm8H18Gb+tojzpml/A/6ex3ctxCdqG2qd2xrz0oc40EdYzFN/n6OVdThYGQeDBBN1ZOr2Q+9WC3w/eZsAQqMh4ukG2ySH2kKLQsvBg743bT6mDgrOCd20pTrC4RFPVZvSyzRaSUaJIa2m2jRQNp7wT2ObQrGUjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=64t7WtZHd9Qg7pKWlDGIKEhFQiXspUqDnCfgUwC7vD0=;
 b=lwJnBUwdfQJjydAUzjXT1goAMxcQc5/6KMiO32ptAIYjqqYvsRUgA7h3JWp2i9u9qn10eRKFSBPG0ReiqAuxq7AYZuJhit18Tp6Uk28OM/UT8dcA9OkOqUnohlGORZl6RoncB6qdXQa3Q9Uylb1rRaJHeNsu91g9bzBennv2dwKxwFdfTfzRKC6qaF/vyKuj4oFgVxFL6Ak1CUsFAdsI3D4sjO2EQ59aIWDKMbqDXV0fcHgwnYrYg2YQd2nqZMuNMJFzGI8q/YrtXeeB2y2LVcoj7/ebhorUYTOKOliDS0Hu29A+h444anhtIctzKzi0PcB76vlmxNeWEfzK8vQ6Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=64t7WtZHd9Qg7pKWlDGIKEhFQiXspUqDnCfgUwC7vD0=;
 b=KDBPhrtiwUiJj86GX3FM9zrpzGB2ujREPuFqg/96IJXcSAKvqpbuFK3UWCvVQXJMMzMm0OOflXdQK+YgwOuEvPuqcwB0YfYn1+oE/2tb/iBnHnsbp7K/sNbUE+v9kcuJVJ2EkRMAcbuZUv+RJfL5K7GAiqAhLGZylEeSraDvbUzM/FfBdW5LuRZRlNkAIGS0gzF+7yJSMwHqsAztNtFs/hxJ1lcqj3d/19xLia+SxBUWod4/cBq2rR08xw//epVZbdR5uaQd230UnI36SZnz8TqTHOHAeEBiwHkp9BuCVxT4VCcoR0JCOveh/oRXkRhl95Lc0CDmcNe4zd4gd4LE9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by MW4PR12MB6754.namprd12.prod.outlook.com (2603:10b6:303:1eb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Mon, 9 Jan
 2023 15:19:09 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::451d:1f37:aa83:f425]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::451d:1f37:aa83:f425%6]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 15:19:09 +0000
Message-ID: <cd6cde24-4e13-14e9-0911-abcecd102fac@nvidia.com>
Date: Mon, 9 Jan 2023 17:18:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5 06/14] migration/qemu-file: Add qemu_file_get_to_fd()
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
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
References: <20221229110345.12480-1-avihaih@nvidia.com>
 <20221229110345.12480-7-avihaih@nvidia.com>
 <f9d8f641-90cd-9cca-e882-0bb5dcdafa76@kaod.org>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <f9d8f641-90cd-9cca-e882-0bb5dcdafa76@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0042.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::13) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB5549:EE_|MW4PR12MB6754:EE_
X-MS-Office365-Filtering-Correlation-Id: f545ea73-a29b-47f7-25e9-08daf254daeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9mERaE5J+VZ90uHcpzaX0hom0APlXPgxKHtwHiTZHxmvP5krVORvasKASlXueVtb7SI3hZQIuNT15iMGZVW2ZEAtZBXVNlZwKXRP9EdCLuk/jahc48VgD6UZ5Zp7aEDIvJ5M1+2Z1KBxEX2vi/NeKiWhvXm3PR1iM9K3koOJHsiALa4byJkjcshmsMHuGiyDpL9CuFZvSIO4Qwxny5eKSh3TmREnVu9AsI2pk2XGPjcCOoVTUJBE22T7rfX6X21o/MgtAbEagLtNNOt8p5fqaNidaagRq9UqlHLi0s/QRcbgV2MTEcGm/fJmZmQo4G3pJ6Pyaddewz9UOyzpBLZO0HXmw04L/8ZG7M0I5qHSR4NZsGiyi3M3HaiGVk/qa1emeUA5qIk8lH1JKikJPBM/Eb0g902VvSqTaRteTiFbO1Z63FxbBcRJ0dbeqlcN+2TAkjkJ8DEjhnk6lIlaKucDLavmAgxujjg6wabe8wVRZozObxLweblYafYgs2E1s9iWIgu1R6gLMLlWN0LOq1euvk+TWH/3Rzsw3SPDdO+1yoQtuIZJBo61zKNJDJifYW7Lq+9sYKph4RyZyuivCkc5011Te2sWb7qOm2gNSbGKAyztACyu1fWgTkJK68rnNDtVC/2P04RcF4xYwuAgCJXr2+kns/pWgdzil2KPqWruycnN/fSftLOflIlJT5M7/hv5fTsKYa8/t1nrH1FF39q4qc4rJ1/0zowF9IcclFyFoKA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(396003)(39860400002)(376002)(366004)(136003)(451199015)(2616005)(66574015)(36756003)(31696002)(86362001)(83380400001)(38100700002)(2906002)(54906003)(316002)(31686004)(41300700001)(8936002)(5660300002)(7416002)(8676002)(66946007)(66556008)(66476007)(4326008)(26005)(53546011)(186003)(6666004)(6486002)(6512007)(478600001)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXU2MU5qQ05oaVVlTlE1VDBtOFBDQ2oxbXFuMVA1Vmdvc2Erci84SVFSaWNv?=
 =?utf-8?B?Q0pha0ZWdTJ5cmx6dUFTZ1Z6akdXMFAxUnBDNlRUcFhnejNDdDh1bkh4bEJM?=
 =?utf-8?B?YXpFOTJZaStMdjJoYTA2M3ExVDhsSDFEZmJQZ1lHN2RvWFdMY2R2ZHFLcGtL?=
 =?utf-8?B?UmJWL1BCNkc4NCtHUVlkUXM3amxCTVdnaUdzcCthcG1PWnREQmU1OWtOcXc3?=
 =?utf-8?B?YjY2NGxWa1BSeGg0YUZ0TUMrNDVwTVZyWVk4QzBBK2ZPOC9NNkJnNFlmb2M5?=
 =?utf-8?B?cWtjaWJ2VHFIRllGQUxqQ1FZdmtkM0JDSmFLRGtweTNaQU5adEkyNVlKUktF?=
 =?utf-8?B?bC9CQUdtcDU5MTAzWTVIT242YytLTzVvUittMEFaa3JXcCs1WG9nT1dlMGtl?=
 =?utf-8?B?cHllK0JuaFpxNENsS2xic0xnbEx2cGdGUFFTSmJYM1MvRzhkUk5EeGkyUFZN?=
 =?utf-8?B?LzRrODdSVG5rdzg3U3V0MHRnVkpTZkxLT1JoTmk2WTdlMFZpYXdLNGlUM1F0?=
 =?utf-8?B?bG9XYWhmeFZzZ0dCdjR5OWY3RS95Z1Q3a3Q1bE0xR2o0VDU4dWNlQVd3OFh5?=
 =?utf-8?B?R1RJY1BsRVNDRnAvLzBKUW8xaVNIYk5yODVGZ3JkWFpwZGk0WitMRzd6Y1ly?=
 =?utf-8?B?ZXY1aW9uRVpId2tKc1lVc1JIVlJtVE54aHhESlNFS3lIWFgrZFlKVk5Eei9q?=
 =?utf-8?B?MmtBMnNpK0dMSlFyRXc3c3RMK0g3R1BqZnJxS3c2NHZFczJlbGFYK295UU1m?=
 =?utf-8?B?MkQ0aW01dXc3aUhpYVlEMVF1MFRlK2J0SU1ORE5yZnljUytkMUcvTm5LSUVa?=
 =?utf-8?B?SFVLdGEzZ0U1TTBTaEpwU3NHNzJheGdIOEpsWXovWXFrK2VyZ3JVdXVtQ0NW?=
 =?utf-8?B?VGxOTlBZbDd2djN0Szg3QytRSnd2QVd5djQzVkQwUnAwY3dCRlZtV2RXVUVt?=
 =?utf-8?B?M2pxZy9Cdnp4VEZydjRYRHVUMG9RUWdhT3N1ZHVYMHVmZTh1TDQ2Z05vOTR5?=
 =?utf-8?B?cmRCckRJZ25sZXN3YUFGL1V6TzFKRTlQWXQvU2JLeHVRcU83d1BucmVNVFl4?=
 =?utf-8?B?K3ZJNW5FL2tXNW45QkZhMjk0b2tmY2NING9RczNnRmlFZlNhNVdsQ1doZENM?=
 =?utf-8?B?c1pTVnNSSmhLdWhFMXhodXRwUWZZUlp2OGE3WGJQUGxJc3IwbVBpZ3B0Y2po?=
 =?utf-8?B?dnhkY3c1VW1GbC9NRE01cHdnc3ZNNUtINmNVWDB2Y3ZWUURocTRwWXowRm4w?=
 =?utf-8?B?Q3RFWGJFY1V6aHNCOWJQdlY0MnFIZExYS1lvU3ZoNHJlekZZcExIR1F3c29C?=
 =?utf-8?B?Q2gzVUFWUjNVOUNRcUIwcWxSSldndTBEem9HdDk4RUp5UmtFSnRYOEZJTHBJ?=
 =?utf-8?B?N2VjR3drRjU5eHNuTU54ODRLYmhHQWRIUGVSRnFlV0VLOHJrQ2VJakxHV015?=
 =?utf-8?B?OFV5ZWZhd3FvajRhc093YXhndkZEZks2cm4vaGgyL1FKakpBQWF4Qm1ZRXdz?=
 =?utf-8?B?UWk5K2FRVVFPYkQwSG0rRXgwbjNpbHdCMStoMFpIV2Q5N0dBOHRHc3AzQy9M?=
 =?utf-8?B?TXJqYXVnYnVocVE2V0dhVWx4OUhUWWt1eDVJOTZTZTA0WHl1c1RJck1Nb0hL?=
 =?utf-8?B?VFZ3SVhTYTNSU1FraDFYOUhWUzRxUGUxVmpQTVMvTDFZMGN4RklaZXFjcHVK?=
 =?utf-8?B?NWI3NkNtYjNnd0xJdDFtK2VydlVtNDBqbHkzYXFuVFE0RjdXdkZJSmFjdzJW?=
 =?utf-8?B?dGFoVXkwVHRsazRoRFNTQlRmVlJSRkk2ZnNXRFB1aThCbjl2cmV0Tkk2cXE5?=
 =?utf-8?B?RkhYVVNDMGF3VVBPUmdUd3A1WDI5UUl1QU54OEplM2R1SC9sMGlvOEl3Sm1T?=
 =?utf-8?B?dW1ZV1dTYzE2S25SUGViVFl2WXEzQk9NM05Wckdrb3Z4MmxmenRNcEZ2ZjhO?=
 =?utf-8?B?dk4wT3pCL1Q0bnN6MUFEZmZEakt0VE9leEx0QU02ZGxYelZKUkZpRjA3RHNT?=
 =?utf-8?B?V2FaZzBBYlByVWdHQXNabTVEU2xhU3FKSTdyLy9tbm9SN1BzcUY0Y1BJd1Nr?=
 =?utf-8?B?RU12a3lyOWRuNk5UdHZ4Z1M2ZzNCdVh6SzhxbWI2RXlhQXduK01nUkUzWGNk?=
 =?utf-8?Q?jxq3XitI/c8o0AeWWlULKbcgU?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f545ea73-a29b-47f7-25e9-08daf254daeb
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2023 15:19:09.3489 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rvRV5jbCmr+13N9Bar9BeSjY9cIDB4ODO4IQB+ZtfrX8qezvLUj5N+stNyhbzdNsBmFV9k7VoLYFVY0bVyW6yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6754
Received-SPF: permerror client-ip=40.107.100.40;
 envelope-from=avihaih@nvidia.com;
 helo=NAM04-BN8-obe.outbound.protection.outlook.com
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


On 09/01/2023 13:20, Cédric Le Goater wrote:
> External email: Use caution opening links or attachments
>
>
> On 12/29/22 12:03, Avihai Horon wrote:
>> Add new function qemu_file_get_to_fd() that allows reading data from
>> QEMUFile and writing it straight into a given fd.
>>
>> This will be used later in VFIO migration code.
>>
>> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
>> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>> ---
>>   migration/qemu-file.h |  1 +
>>   migration/qemu-file.c | 34 ++++++++++++++++++++++++++++++++++
>>   2 files changed, 35 insertions(+)
>>
>> diff --git a/migration/qemu-file.h b/migration/qemu-file.h
>> index fa13d04d78..9d0155a2a1 100644
>> --- a/migration/qemu-file.h
>> +++ b/migration/qemu-file.h
>> @@ -148,6 +148,7 @@ int qemu_file_shutdown(QEMUFile *f);
>>   QEMUFile *qemu_file_get_return_path(QEMUFile *f);
>>   void qemu_fflush(QEMUFile *f);
>>   void qemu_file_set_blocking(QEMUFile *f, bool block);
>> +int qemu_file_get_to_fd(QEMUFile *f, int fd, size_t size);
>>
>>   void ram_control_before_iterate(QEMUFile *f, uint64_t flags);
>>   void ram_control_after_iterate(QEMUFile *f, uint64_t flags);
>> diff --git a/migration/qemu-file.c b/migration/qemu-file.c
>> index 2d5f74ffc2..79303c9d34 100644
>> --- a/migration/qemu-file.c
>> +++ b/migration/qemu-file.c
>> @@ -940,3 +940,37 @@ QIOChannel *qemu_file_get_ioc(QEMUFile *file)
>>   {
>>       return file->ioc;
>>   }
>> +
>> +/*
>> + * Read size bytes from QEMUFile f and write them to fd.
>> + */
>> +int qemu_file_get_to_fd(QEMUFile *f, int fd, size_t size)
>> +{
>> +    while (size) {
>> +        size_t pending = f->buf_size - f->buf_index;
>> +        ssize_t rc;
>> +
>> +        if (!pending) {
>> +            rc = qemu_fill_buffer(f);
>> +            if (rc < 0) {
>> +                return rc;
>> +            }
>> +            if (rc == 0) {
>> +                return -1;
>
> Given the call stack, -1 would be interpreted  as EPERM. May be EIO 
> instead ?
>
Sure.

I will also change write (down below) to return -errno instead of rc on 
error.

> C.
>
>> +            }
>> +            continue;
>> +        }
>> +
>> +        rc = write(fd, f->buf + f->buf_index, MIN(pending, size));
>> +        if (rc < 0) {
>> +            return rc;
>> +        }
>> +        if (rc == 0) {
>> +            return -1;
>> +        }
>> +        f->buf_index += rc;
>> +        size -= rc;
>> +    }
>> +
>> +    return 0;
>> +}
>

