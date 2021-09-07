Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76006402A58
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 16:03:04 +0200 (CEST)
Received: from localhost ([::1]:40186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNbgl-0002tu-Gd
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 10:03:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mNbP4-0001EG-Ar; Tue, 07 Sep 2021 09:44:46 -0400
Received: from mail-eopbgr40103.outbound.protection.outlook.com
 ([40.107.4.103]:10126 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mNbOx-0004GZ-Ty; Tue, 07 Sep 2021 09:44:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W223wCGxlnFW5CSAQjpwis9GfCaoWzPyM3C3wIjkYebhtqA2TXdiwDoMQlYaVKTgZM5ID6qc6So/mvoNRfcIJ/6GdUBXCrH6IJQjGiB2ES/SUEM8we4RHXJ412JeeG0EWlx2hiRbgBDy8L7rgMLLcc4GqyeqTVUSA8X+u+Dd2ehLG8YfhxSa7OoeZ59AdnfWZRhy98WtsVr2jn946aozjzEuIW8UabSxMI6E0k1chrGDqUCzBxxoYylHrkhLMgsYC0emkOcgUUDC6wL7CbaPWsrnXhom8hZjdQUjxIb8QHJ2p7GizhNFbveVupRAAniAtbCeHI38MKX9EA629DXujQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=onQ7ZzJOxJTHj7S070Tyeu+vM5PQ+3vK1KSPVSh7Idg=;
 b=djexx3+SVIDiN36IwJdPaC1urSXSqV8DDd9M1sjoKmHUDuGszN5rUPAkQMTu6rVX+PppeQj/JIqgTVh48WdvQ5YsGMIAu+kphJFRNG+pnFOC0DYvVShkNH83cucd2baE7Mr71s4Z2gO6FUNZ7MhxjnfOX/QsSKQbGt9U5Iq1IKREriYFesDTMCVgzqSD/P1gsP4fWLEIW5SCvIjAmU4K3C218Ptg4XSJ1+X7+OOv4Y9rqcqBPZhSkqza44kYD5+AT14dRMvKMRKMMtJSV7Z/NiUKs5lwWyl28gAqd3D6Bw+AkvjDEBCJxO/rpYbxRNwgIcCSajYtu0R5n1DTBTZX0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=onQ7ZzJOxJTHj7S070Tyeu+vM5PQ+3vK1KSPVSh7Idg=;
 b=mN93LGTcxW0aiiTOg24qR2eYef9/FiTj2YiPNZgsfpI+dtxsUd4IWqKcdJOQeiFzf24FerMN8OUj9qAFYV5e5ZECiBdXXEdl7q2lF4iP6eT72V+5BNZMVgc3Bec66EjIa5tlKu6NZQBhg+fUYkdeHwT0m/1IKDr7X2eCUrBCOTA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1908.eurprd08.prod.outlook.com (2603:10a6:203:4b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Tue, 7 Sep
 2021 13:44:36 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4500.014; Tue, 7 Sep 2021
 13:44:36 +0000
Subject: Re: [PATCH] qemu-img: Allow target be aligned to sector size
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20210819101200.64235-1-hreitz@redhat.com>
 <9cf39acf-38fd-3d2d-1750-439c630f0df5@virtuozzo.com>
 <a577496c-8143-4f78-8537-7633c3018016@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <fdca4c29-434d-e589-fd00-2388962666ed@virtuozzo.com>
Date: Tue, 7 Sep 2021 16:44:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <a577496c-8143-4f78-8537-7633c3018016@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR05CA0073.eurprd05.prod.outlook.com
 (2603:10a6:208:136::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.196) by
 AM0PR05CA0073.eurprd05.prod.outlook.com (2603:10a6:208:136::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend
 Transport; Tue, 7 Sep 2021 13:44:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5476af3b-4689-4c49-de80-08d97205a1c0
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1908:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB19088C0AA8CB5116C814FA9CC1D39@AM5PR0801MB1908.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pTqexZmGQslvkvcj/V7cV0n4Dg/oXB7kMk+3HiCbtwRTiHxH/A5q8jHIEuM/uqaQq++1gWU7n3OGo7tYJ0eDcx5a9FHRfArRItbVi3KhrJFeYgWu5kJmaEXIlw/tjEd2alEkRM2EpCz5x8ykSf8qHcaVU4zbE1A3BDjI/4S2LEskiB90MXxZFfm7isfRt6ReWuaFDDMWAjbi4joC999dBbQBIVUMOSd+D4nTXPmyYQiLilzZtcsP/JUuNQt9xw6gnSdNlx5VOhn/qdxsSaHbFo1GpUhihoEyBwb2oKJDF1s+ifDB6nE+pXvQEvwRGeOvCu3Ltg5lWgg0lhkVCKf7m76Xl/g/YhUIY1jhrVcD+DQM94WRUE27aIPjOsf1xlfnZhKJHU//PZFkUZ23sEv6HrYahDCRA0//eHVszR51Nsf2T4Jd4CB0M9T27Y8B6937iDVVqaKi4+q45xds2+uY7V3JApVZXdGaNsqgniVYyRMe+1k75NWJALuDNeaMlm/5Gr3kd7J6q5Sr7Tr+yITVkj77jp4f0wJ3CwMN04VLh7i35/uVf2ycLQwv27qxdd2PwhNtsmK2b6N6NnuueavuUxF09tG8DpKwK7dF8FMN9e8KJfQDZR7ZWDNSGTrER4rHY9mwxQ7tjnLAP9ZNVBB1qJWjh11TKB+JoRSUHgSlQVSqHBy1733NiaVXXgkdR9ZE+17ZQ6VdjG/ZePbCfpaT1D5ojtb5HqiMkz1kPgUMVqcaWloE/2j6yZvau3/tdc1ZaDu4UQGSALRUc1cpnGIcV7X3ReBB57ADOwF/5V5xQSJQxWfbuBhJfn7eZxrpAjrEsHe09IbUfwn/V5bllKf1VW34g4C1oVSO01K22O2QUYQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(366004)(376002)(136003)(39840400004)(36756003)(316002)(16576012)(86362001)(38100700002)(38350700002)(966005)(66556008)(66476007)(66946007)(478600001)(5660300002)(6486002)(2906002)(31686004)(4326008)(31696002)(52116002)(53546011)(186003)(8936002)(8676002)(26005)(83380400001)(956004)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmZ0TE5SdEVDU1MrTFp6RzV4dTBoTFlXa3RyMWl3Mm40K1g3RmRjNGhOWVJN?=
 =?utf-8?B?UDJwZzlpc2E3dzBCUlpjc1U1emZXRjdybTlzTEhiWngxczFVUlI3KytINkFV?=
 =?utf-8?B?eHhhUTlaREVwYkxFcmZKcXpNV2hEcWV2T1ZENy8rSGc0OWUzODRpNmFZQUMr?=
 =?utf-8?B?UlIxajlPMCtGUGduTGtvcm51N1pTNVVaY1Y0KzVNTG1hQXljeWxVUk5kQWFx?=
 =?utf-8?B?aXl5RndYTDIyKzJaaDBEaXBTck4ra3VVTWJ3aWkraUZaWnNJRU1pQ2M3OFhj?=
 =?utf-8?B?TDZlRGRqMTQxQk5yOUI4eDh2UzBQb0JYSWkvYlQwL1h6YWxLZ1puVHk0S1FN?=
 =?utf-8?B?SWN4YnVCMXl0VXpmNkZ6Z2lqR0JwU2h5VDFBUDkrVXdoMnhWSTNzWHlDUlBF?=
 =?utf-8?B?TFN2Q0Zia3kzS1NnTDJaK09ndFgybmYzdERiQTVyVXd4alBITUthcG5Ya2J4?=
 =?utf-8?B?RkVSVUpzYzhaOU1IbklVd3R5QzY3YmpZRlp5aE96eXdhVGVZT05HaDE2SnJa?=
 =?utf-8?B?aDZVbEFYNEp1TnoxMURuK0xrTmFQQyt3K1k0OFRManJCbkd2NHdHTElRcnlT?=
 =?utf-8?B?Wml6dHpuWVFHaUN4cy9xSXBCak1JeWI5RWQ2dGY2OUZnWC9HVzhsWkdydXp0?=
 =?utf-8?B?b1RwV1cxVTNWVVZ5OUVTUFBPREdBZCtWVTlBMUQ5RW1aZkZZSHluNE53SkRH?=
 =?utf-8?B?b0FTWm45ekxodFFQcGdyNFdLT2ZmdEV1c1U3UkE5ZDZoYVE1aXR4ejA0NFkv?=
 =?utf-8?B?d0dQM1BiL1A0a0MxZjRpUU9ZMnFtQ1pNOGVkZFVveDFrd1M1QXhuU21vMnRj?=
 =?utf-8?B?Mjd1K2dBZWl6dFdwUFo1U2ZSeCtUMlhWdUQ5TXI5RmVsMXBWWXBDZGwrdUY0?=
 =?utf-8?B?aW55OG9jd25md2diR0RtRUkwVjNrS3QrdCtIZjRtM2YwYnhzK3lldUk4a2ZP?=
 =?utf-8?B?Rmp2eERRT0hmaXZ4UG9vS2RKTnBJMXNxU09XMkwwMkdTc0M1SnU1cVQ3b0JQ?=
 =?utf-8?B?TnRGamZWTGNGTWxaWmdrNE0yMXduUWdFVlpJSW4rTzNBV0Z5MGFmckhPSXJR?=
 =?utf-8?B?V3RlUjc1U0RCREhZNHRGT01qYldLdU01SjJvLy9mbVl1YkhZb3pPTUNNc3BS?=
 =?utf-8?B?SGpaWmxrN01qaFpCUEZ4VUtOS003L3R4b1VWSzZhdzdxNUVZeTI5VlVNSkNy?=
 =?utf-8?B?NTY4R2FPaTlVT2JvSjlwMktURDREVkwwd0tacjFOSkxjUGlPMnE2MDJWVFZB?=
 =?utf-8?B?TkRaMGljdGNScHNONTJ3eFRzb0dRNzVha0F0bTQ2R0d2d2xsbWhXM0Eralla?=
 =?utf-8?B?cEo0SEVrMEpjTkNRbldpOUQrVUJoazRMdVlqaEJ0NDg2SFhvTXNqdjB1UENq?=
 =?utf-8?B?dDV2YlQ1SHVMQ1VDODN1K1lzY3AzWWJwYUxNWk9qT0k0dVkrdnZtaFgxc3I4?=
 =?utf-8?B?NGpTbW5hOVhFaE82SHp2VHJIZTZZbHdDYTVpeFlJMEIrYTFYZFI5UzBBTzhy?=
 =?utf-8?B?MlpWMnBLQ1ZXeFRyWFVvQTJPMy93RWY4L2preTM1cmNrcGt2RlBtTitDN3U3?=
 =?utf-8?B?T1J5S3FGVlpBVm5rZGhDdTBBYmk1UFo4aWxJUUZkY0VFb2VuWmF0bFp1NW5v?=
 =?utf-8?B?RnJhVFVDa3ZJV2o2Zk53WGw4K3dtZnRyd3E1d2lMbmIvZVR2dytVNU5ldjll?=
 =?utf-8?B?SUV6d3dpRFViUnBnWDQyQU4wbkNRcEZ4TTM5MEFtT2xES1Z3RlV2SEFnVlRu?=
 =?utf-8?Q?SNl/80wkMnk2p6peK0FLGSqn4qZfnx0QFo94AEo?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5476af3b-4689-4c49-de80-08d97205a1c0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 13:44:36.4557 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S8ZplIoUMKv92PQcvCErgc8knjW8xzx2755Ut/DGwLP6wknlmSHU2CaCf+XXV2Djtm8j6Os1z4T7KZUfz+rVi+b5ctV1hX/sMPysnJxlbAo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1908
Received-SPF: pass client-ip=40.107.4.103;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

07.09.2021 15:48, Hanna Reitz wrote:
> On 07.09.21 13:29, Vladimir Sementsov-Ogievskiy wrote:
>> 19.08.2021 13:12, Hanna Reitz wrote:
>>> We cannot write to images opened with O_DIRECT unless we allow them to
>>> be resized so they are aligned to the sector size: Since 9c60a5d1978,
>>> bdrv_node_refresh_perm() ensures that for nodes whose length is not
>>> aligned to the request alignment and where someone has taken a WRITE
>>> permission, the RESIZE permission is taken, too).
>>>
>>> Let qemu-img convert pass the BDRV_O_RESIZE flag (which causes
>>> blk_new_open() to take the RESIZE permission) when using cache=none for
>>> the target, so that when writing to it, it can be aligned to the target
>>> sector size.
>>>
>>> Without this patch, an error is returned:
>>>
>>> $ qemu-img convert -f raw -O raw -t none foo.img /mnt/tmp/foo.img
>>> qemu-img: Could not open '/mnt/tmp/foo.img': Cannot get 'write'
>>> permission without 'resize': Image size is not a multiple of request
>>> alignment
>>>
>>> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1994266
>>> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
>>> ---
>>> As I have written in the BZ linked above, I am not sure what behavior we
>>> want.  It can be argued that the current behavior is perfectly OK
>>> because we want the target to have the same size as the source, so if
>>> this cannot be done, we should just print the above error (which I think
>>> explains the problem well enough that users can figure out they need to
>>> resize the source image).
>>>
>>> OTOH, it is difficult for me to imagine a case where the user would
>>> prefer the above error to just having qemu-img align the target image's
>>> length.
>>> ---
>>>   qemu-img.c | 8 ++++++++
>>>   1 file changed, 8 insertions(+)
>>>
>>> diff --git a/qemu-img.c b/qemu-img.c
>>> index 908fd0cce5..d4b29bf73e 100644
>>> --- a/qemu-img.c
>>> +++ b/qemu-img.c
>>> @@ -2628,6 +2628,14 @@ static int img_convert(int argc, char **argv)
>>>           goto out;
>>>       }
>>>   +    if (flags & BDRV_O_NOCACHE) {
>>> +        /*
>>> +         * If we open the target with O_DIRECT, it may be necessary to
>>> +         * extend its size to align to the physical sector size.
>>> +         */
>>> +        flags |= BDRV_O_RESIZE;
>>> +    }
>>> +
>>>       if (skip_create) {
>>>           s.target = img_open(tgt_image_opts, out_filename, out_fmt,
>>>                               flags, writethrough, s.quiet, false);
>>>
>>
>> Hmm. Strange. I am experimenting now with master branch without that patch and can't reproduce:
>>
>> [root@kvm master]# dd if=/dev/zero of=a bs=1M count=2
>> 2+0 records in
>> 2+0 records out
>> 2097152 bytes (2.1 MB, 2.0 MiB) copied, 0.00153639 s, 1.4 GB/s
>> [root@kvm master]# dd if=/dev/zero of=b bs=1M count=1
>> 1+0 records in
>> 1+0 records out
>> 1048576 bytes (1.0 MB, 1.0 MiB) copied, 0.000939314 s, 1.1 GB/s
>> [root@kvm master]# ls -lthr a b
>> -rw-r--r--. 1 root root 2.0M Sep  7 14:28 a
>> -rw-r--r--. 1 root root 1.0M Sep  7 14:28 b
>> [root@kvm master]# ./build/qemu-img convert -f raw -O raw -t none a b
>> [root@kvm master]# ls -lthr a b
>> -rw-r--r--. 1 root root 2.0M Sep  7 14:28 a
>> -rw-r--r--. 1 root root 2.0M Sep  7 14:28 b
>> [root@kvm master]# dd if=/dev/zero of=b bs=1 count=2097147
>> 2097147+0 records in
>> 2097147+0 records out
>> 2097147 bytes (2.1 MB, 2.0 MiB) copied, 2.76548 s, 758 kB/s
>> [root@kvm master]# ls -ltr a b
>> -rw-r--r--. 1 root root 2097152 Sep  7 14:28 a
>> -rw-r--r--. 1 root root 2097147 Sep  7 14:29 b
>> [root@kvm master]# ./build/qemu-img convert -f raw -O raw -t none a b
>> [root@kvm master]# ls -ltr a b
>> -rw-r--r--. 1 root root 2097152 Sep  7 14:28 a
>> -rw-r--r--. 1 root root 2097152 Sep  7 14:29 b
>>
>> It just works, and do resize target without any additional BDRV_O_RESIZE...
> 
> bdrv_getlength() invokes bdrv_nb_sectors(), so we always align sizes to 512 anyway.  On volumes with a logical sector size of 512, this error cannot be reproduced.
> 
> You can use loop devices to get volumes with other sector sizes, like so:
> 
> $ cd /tmp
> $ truncate fs.img -s 128M
> $ sudo losetup -f --show --sector-size 4096 fs.img
> /dev/loop0
> $ sudo mkfs.ext4 /dev/loop0
> mke2fs 1.46.4 (18-Aug-2021)
> Discarding device blocks: done
> Creating filesystem with 32768 4k blocks and 32768 inodes
> 
> Allocating group tables: done
> Writing inode tables: done
> Creating journal (4096 blocks): done
> Writing superblocks and filesystem accounting information: done
> 
> $ sudo mount /dev/loop0 /mnt/tmp
> $ qemu-img create -f raw source.img $((2 * 1048576 + 512))
> Formatting 'source.img', fmt=raw size=2097664
> $ sudo qemu-img convert -f raw -O raw -t none source.img /mnt/tmp/target.img
> qemu-img: Could not open '/mnt/tmp/target.img': Cannot get 'write' permission without 'resize': Image size is not a multiple of request alignment
> 


Does it mean, that when logical sector size is 512, qemu-img do resize target without any 'resize' permission?

It looks very strange: in both cases we need to resize target. With 512-bytes sectors it just works (look it resizes 1M->2M which is a lot larger than 512b). And with 4096-bytes sectors it needs additional BDRV_O_RESIZE..

-- 
Best regards,
Vladimir

