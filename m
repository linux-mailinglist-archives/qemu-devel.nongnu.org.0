Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A655852A399
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 15:38:22 +0200 (CEST)
Received: from localhost ([::1]:60886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqxP3-0004Us-GC
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 09:38:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1nqwRm-0008Q3-1Y
 for qemu-devel@nongnu.org; Tue, 17 May 2022 08:37:06 -0400
Received: from mail-mw2nam12on20618.outbound.protection.outlook.com
 ([2a01:111:f400:fe5a::618]:61361
 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1nqwRj-0003kN-NQ
 for qemu-devel@nongnu.org; Tue, 17 May 2022 08:37:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=an5OMh2wLO8aXta38U/yF/9OVageSpqTFyVmyKrNbfjcmPed+mzZjJCgxHH47n9x7H9EowF5wrK/utcKpaB9oCHZ2IGS9lUrXDv9fesp9Kpy76D+1quoOAHqeBmuYhHeE+4a6KS9b1ux0zyUBvYMmHxnFOhzrczTiIJPc71Cy0slVsVlRkmU84i8Xbxwnn+UQo8+aKzOBKqGnxS27j63IJS3pj03cZ/apK1oGY0o+/mQF1Q++OCrk0KDz3+PPw/YFXon0hqxwCuBmnZYxZfyQdk/4dwaa5mH646b1tbXKYTtPGM2CVs7BxKSyN+4O9eK41VboGpYUkbyDwoFJs4I2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=biw6yWo51o0B8dd9otsJosZyhf/2rE8IKA62JvaR+4k=;
 b=fr6Z9ZwNpoN4o1HRQl6C4NPyd3mJN9ZykF3z6ILWvlF7oEf8WSImQ51/aFw0ibvb/2VFJYinGukZwXOxV2/MpksTfqhHsbvevCJJf8BviYSQQPNng4LeYFFllF/yxPLzHRN5L5H46YUvuGJLdUle3GdF/8VJ35pFXcfH+eE/N3yELIESlp6CFny2ff41wV//TjfZhw1vniT0Mnf+U6d2nR9qZXxSuvfOYAzgWuY7c7h+2mHJQVjzVgFHzxotGdi1rqagBt0jBQA7jQKWzlOmnzpVzE7xBNzUKn3BlE51yCNq3X6D1EjRSVZnJ0Rf6xnGhlTFyfq7GQ97Wutw3/ezEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=biw6yWo51o0B8dd9otsJosZyhf/2rE8IKA62JvaR+4k=;
 b=QSnx50PMuCTuIkloF2tkThNf1RkAk3uZTxMouiyphul/YU8oxHAgabe5En2Isy3YTZ7nhHF2whtS8CapTU1GFInnijVzqlaWqQem4s+KsXB+0m/JtIPFRx+gfPDOPKgydlefAexpHLDx/RPw5YUgSeGbeIl4LpLdS9b0XgbGfymSobelAQmF6bmgNtrFi/J55bb9irPfw9+FqIzL129cLgzxvuJtdjk1z0/0XkmwUaWRvWQ1uMo2294lkN95DYukx8DWHBdv/B8+zY1iDkfy89xyYviVVcJE1krh7BZGg8uhgH05kUIZGM2WIQoR6Il4pkQhRPArutp+43sY9v9f/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB5544.namprd12.prod.outlook.com (2603:10b6:a03:1d9::22)
 by DM6PR12MB4436.namprd12.prod.outlook.com (2603:10b6:5:2a3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Tue, 17 May
 2022 12:36:59 +0000
Received: from BY5PR12MB5544.namprd12.prod.outlook.com
 ([fe80::a1ca:addf:80ba:e6c3]) by BY5PR12MB5544.namprd12.prod.outlook.com
 ([fe80::a1ca:addf:80ba:e6c3%6]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 12:36:59 +0000
Message-ID: <970f0e4c-19bc-6528-2c4c-9cf7fbd5a789@nvidia.com>
Date: Tue, 17 May 2022 15:36:51 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 5/9] migration/qemu-file: Add qemu_file_get_to_fd()
Content-Language: en-US
To: quintela@redhat.com
Cc: qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Mark Bloch <mbloch@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>
References: <20220512154320.19697-1-avihaih@nvidia.com>
 <20220512154320.19697-6-avihaih@nvidia.com> <87czgdsohs.fsf@secure.mitica>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <87czgdsohs.fsf@secure.mitica>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0001.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::13) To BY5PR12MB5544.namprd12.prod.outlook.com
 (2603:10b6:a03:1d9::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fba5a175-73a5-4afb-9ea2-08da3801efa6
X-MS-TrafficTypeDiagnostic: DM6PR12MB4436:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB4436230063193B0614ADAA6ADECE9@DM6PR12MB4436.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QfxE5iWIt9Z8IsGFgj3QcgKcZH0lm+cRoIw5kMt8MnhYs0WqkXKWWgCWysp4EQTj9kd5OclLLWCh963DEJZPMUc4k7ox2LuBnt3CLnFLJP3TgnKA90AqtdHRvuPIGa4LZi37klC0p0/ucFczShVpm8ecyozltcOkHFYtD7dl6WNam1nsm5KASIWhaA5bnDCAd9MwI97TpgTb3QGdnfwPjRIWRQQx+YEz8wwp9fgo2r+9rfOqV8W0JBen4mAJowWam0y/Aapp0P2mYD9HU3X6pu94RlQUUmxJJ/lg//tMpzZy3azEF/A69GSk555FHdi5vB7DU1ysLnf01Vg2YWjUJ/oT0hE/R6f7X4a+PkHPmCC8b9ZVPl+AOPyzZbdvnOr7uaR9C+ZuLfiLzu6eJp8zWzF1gteKpg51kBq8dewf2Yx3y3FM7pxED3RVRJs0ois6vGbkXXFxPKxJIyZK5ox06heRdpMLQNTKYfleDnNNTisI3YkJxtJk6GGK37q7dkLZU2Yi0C+i5j1IxfG9iRCu/OHiNH5IqJaY7q9Crw5iyym4r8OfEws2zXhFM2DaKOb5gygTsFdikxahiy/56QyA39e2HnnWhHEwssalp91Pjo4kki+zi7vFCTL7nnuvXuh/HyxBSCKTzJzzauxVXb3jIWI5l/jJYr9Ps1cSGO0/CBjcb+eZJ6Fw4U1MGtQQE7Nmbl1vd+oX+ldJEmeGEeWUc3xbdBSOjSbEYXqj8VTQcO+u8o58/zqz6usaqKqf9rhQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB5544.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(107886003)(6486002)(2906002)(186003)(2616005)(36756003)(508600001)(5660300002)(31686004)(8936002)(8676002)(83380400001)(6916009)(6666004)(316002)(54906003)(26005)(86362001)(6506007)(31696002)(6512007)(4326008)(66946007)(38100700002)(53546011)(66556008)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WE5zRGNXbThRemVrK1FCR0syb1YyRmFGbk1ZOWtxaG5sdW9tdE55NGJrZmJ1?=
 =?utf-8?B?eVlqOWYwcEFQYlBDdzdXaGV3ZGFwZWhaNjZIdkYraHNwSHFLeERCVjRDZU9s?=
 =?utf-8?B?U0tOMUZCOXdjYVVjUUVSUUNLZTJ6OWxYWUdEQWpyZi96bEE3NmE3SWZNaU5u?=
 =?utf-8?B?ak4wb3pEV1VPbHgxeDRxdWZIaGNrTHJyZHNab1NLcWgrSCtsWkNJeVFFbHkw?=
 =?utf-8?B?VVQ4L0V6RkZSZUJLTFEwamN2OEdiRldXZ1k1ZzMzR1d1S3k5TmJnL0g0ZlJW?=
 =?utf-8?B?aGg5SUM3QUkvckZKL1Q0M1J2TUpwSkU1cXJlZDJBblE0czJKRTZ3Mm5pMGhl?=
 =?utf-8?B?VVpTRCtDWXQ0djk3R2VNTkNOSkw5cVZvbTJjQkJEZWMwN1BJbXRTWHhOYUJ4?=
 =?utf-8?B?RWQvR2pOZjlGRGpHbUV1dVhweFJjZ0pENTBxYXVvTi9aQ0JVY3ZlbkQ4M25z?=
 =?utf-8?B?VHhlb2crUkJ6MTdDN3dLYms1d0Jlam1qaXBaTFBaazRoRndJV1JDZW9HU1Jx?=
 =?utf-8?B?bWlORzBLQzhhQ1BDb2pMUG1jODE5SkcyOXptcnVEeUdJblB5RktpNXZ1d3lT?=
 =?utf-8?B?c3o0cXk2d3FvaDd4VnFqcjhobSs3MThibW4zV21CbWhMbmxDN01DSUVaajQ0?=
 =?utf-8?B?c0c5RGN5VUV1MkNUQkxxVXhDMk9SYnZHNjNUQ0JqdXU2azZDTUdLOEZYcFBi?=
 =?utf-8?B?Sm9OK1IyU0dwZjh1VUFKNmtlVExMbDhHaS9iRE5HYlBaS3ZjZDNIeFN1UVFz?=
 =?utf-8?B?ajVKSERZZlA5enRDSUxzVnRkNFRuZEdLd2ZoZzFwdHpPamlZdFZXNVJFYXpa?=
 =?utf-8?B?TXFDQXIxcVRXNFdQN3FPKytpanhXRnF0OFVjSnk0aHUraE5UNzd5Z1YydUNy?=
 =?utf-8?B?blFYMklNNEdDWTVRZkM4ajJOQXlHbEJEVEZJWE1UR2U3L0RxYy95YTVBbXdM?=
 =?utf-8?B?bXhBcU9oUUU1NHQ0LzJ4ZjZoNldHc0VBRFRiRXI3TWx4UEFNNGtmRzRHYXVU?=
 =?utf-8?B?bnkwbXBzMy9sTG80L2ptU0VJUEdUdzZCR3VVRE1mR042RHNCVStOZlh2dmRL?=
 =?utf-8?B?YnBIZTJxRW5BNXJrZTJOUEhDN29NR1RRQ2t6cnVzZ2IzeFlreG5uK2NRS3lK?=
 =?utf-8?B?Vmp1NjBSU3crSmlYQmVjWUJ0VUN2L1BFbUZCclM4MjBkRHdmblowU3VNN1lE?=
 =?utf-8?B?RmpGY0dqNDhUa05uRS9NTzEwNy9nTmkvbld5ZmZlbHJUdHBUa0dqeko4ZERY?=
 =?utf-8?B?elNnYWJTQkJZWnBPakRqN1Q2NVJGVmFDWTZ6cGxzdk1oOXI3c0xReWkyWlNH?=
 =?utf-8?B?bURHQ3pBVFRRMzBVNWQwNGFES1lBQ0ZaOW1MSHJ4MFhHQm5jR2o4dFJTcXpv?=
 =?utf-8?B?c2YvRUdzL1RqMDgzNVFwMnpOWnkxdEI0UDRaaWY2L2RhU2FTeVF5RTFuRTBU?=
 =?utf-8?B?SndJT2RhRjVOeXB1bWFMVUorZFhjYUpmTldQR1VVaVMwMHBsL2krT0NkMUhB?=
 =?utf-8?B?Q0RyWnZRclVEaGZlRi9XNEQ1YlZRN1hsa0w3MGVFRTdHQmQ2NHNmdTIranQ2?=
 =?utf-8?B?ait0MStPLzV5N2xiajFVOGl6WWpGallYbTNoM0dnSlB3MU1reFNBWUc0NWhO?=
 =?utf-8?B?NWY1VkVXd2tNaWxJVm1lSmNLcmw5RWZsb2ZXVVVYa1ZXWnVDMjladWliMU1w?=
 =?utf-8?B?MFowUzN3N3ZHQ1FyWkpFMmVXVi85b2ZkRTgwN2xHTVlyQkNaZk9LUlJvZVJW?=
 =?utf-8?B?eFBNbUI5UERoZ3N5Z2FWSGNIOGRVUFl1bVBkMnA1OEtoTmJEQ3BOTEw4VWpU?=
 =?utf-8?B?T1FvUFpOUWRyTGt3Zk02NjVYUWpETkQvdmUvMVRXQm5RRGRDWGVIdVBrWW92?=
 =?utf-8?B?bHZtMXBWS3NBcU44ZU9yM1cwR01FRldGZXJEekhRQmg2ekJUNWZDUU10eFhw?=
 =?utf-8?B?TktGYXVtWnE5S1M4ZjlWd2FsZTlSSmkyS28zcVh4bks2QWlxTUpzMFJTYllM?=
 =?utf-8?B?ZjR6a3pwVFpZdWMxcmxpWU9GQUNYai9INlNiWDNjZ3V0QTVPcXBSVHVoSGJv?=
 =?utf-8?B?SnhTbVhDeUUvY3ZwbnhlZGpSYzhVd3BRT3RRenFnbHVISnUxUVVNTEQwVmpp?=
 =?utf-8?B?SFpKZFVORGhUUzF0V0RJVXBVaU13ZXJoVTQyOTFpajBubjFTN3pBeFAwTFEx?=
 =?utf-8?B?UVFSZm1DWW5FeTJVSmhPSi9SeDRUNzE2QVFTQ0NuUGdBWEVFRGNYa3EyYkRW?=
 =?utf-8?B?NmxyQjlkVERsaTlhVkNObVgzb3JJeFRkbnUxUTdpSTRpNG9aS3VjajNQRDZO?=
 =?utf-8?B?MjdOZWM1b0xVSE92QnZza2RtblAybEs5UWxyTDN3dFE5U1lrMFNHQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fba5a175-73a5-4afb-9ea2-08da3801efa6
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB5544.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 12:36:59.6424 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8q9xxx0TAFA6YkmK9zO6HF7rDPAnqsXSr/38n/Ifs3XbuQt3pZJosocdM0iGfZVjzTiwWPUlRKoGto74BAK6Ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4436
Received-SPF: softfail client-ip=2a01:111:f400:fe5a::618;
 envelope-from=avihaih@nvidia.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 5/16/2022 2:31 PM, Juan Quintela wrote:
> External email: Use caution opening links or attachments
>
>
> Avihai Horon <avihaih@nvidia.com> wrote:
>> Add new function qemu_file_get_to_fd() that allows reading data from
>> QEMUFile and writing it straight into a given fd.
>>
>> This will be used later in VFIO migration code.
>>
>> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
>> ---
>>   migration/qemu-file.c | 34 ++++++++++++++++++++++++++++++++++
>>   migration/qemu-file.h |  1 +
>>   2 files changed, 35 insertions(+)
>>
>> diff --git a/migration/qemu-file.c b/migration/qemu-file.c
>> index 1479cddad9..cad3d32eb3 100644
>> --- a/migration/qemu-file.c
>> +++ b/migration/qemu-file.c
>> @@ -867,3 +867,37 @@ QIOChannel *qemu_file_get_ioc(QEMUFile *file)
>>   {
>>       return file->has_ioc ? QIO_CHANNEL(file->opaque) : NULL;
>>   }
>> +
>> +/*
>> + * Read size bytes from QEMUFile f and write them to fd.
>> + */
>> +int qemu_file_get_to_fd(QEMUFile *f, int fd, size_t size)
>> +{
>> +    while (size) {
>> +        size_t pending = f->buf_size - f->buf_index;
>> +        ssize_t rc;
>> +
>> +        if (!pending) {
>> +            rc = qemu_fill_buffer(f);
>> +            if (rc < 0) {
>> +                return rc;
>> +            }
>> +            if (rc == 0) {
>> +                return -1;
>> +            }
>> +            continue;
>> +        }
>> +
>> +        rc = write(fd, f->buf + f->buf_index, MIN(pending, size));
>> +        if (rc < 0) {
>> +            return rc;
>> +        }
>> +        if (rc == 0) {
>> +            return -1;
>> +        }
>> +        f->buf_index += rc;
>> +        size -= rc;
>> +    }
>> +
>> +    return 0;
>> +}
> Is there a really performance difference to just use:
>
> uint8_t buffer[size];
>
> qemu_get_buffer(f, buffer, size);
> write(fd, buffer, size);
>
> Or telling it otherwise, what sizes are we talking here?

It depends on the device, but It can range from a few MBs to several GBs 
AFAIK.

Thanks.

>
> Thanks, Juan.
>
>
>> diff --git a/migration/qemu-file.h b/migration/qemu-file.h
>> index 3f36d4dc8c..dd26037450 100644
>> --- a/migration/qemu-file.h
>> +++ b/migration/qemu-file.h
>> @@ -162,6 +162,7 @@ int qemu_file_shutdown(QEMUFile *f);
>>   QEMUFile *qemu_file_get_return_path(QEMUFile *f);
>>   void qemu_fflush(QEMUFile *f);
>>   void qemu_file_set_blocking(QEMUFile *f, bool block);
>> +int qemu_file_get_to_fd(QEMUFile *f, int fd, size_t size);
>>
>>   void ram_control_before_iterate(QEMUFile *f, uint64_t flags);
>>   void ram_control_after_iterate(QEMUFile *f, uint64_t flags);

