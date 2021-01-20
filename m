Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 330422FCAF1
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 07:11:00 +0100 (CET)
Received: from localhost ([::1]:34912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l26hn-0007dL-92
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 01:10:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l26gN-00078p-4F; Wed, 20 Jan 2021 01:09:31 -0500
Received: from mail-eopbgr70122.outbound.protection.outlook.com
 ([40.107.7.122]:26112 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l26gF-0002eB-S8; Wed, 20 Jan 2021 01:09:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ALBiLeEE5tWIA5Z84mnKLTwLGNLLJraSJ6nMHi/ca2xMZR/8yO8WGxlUjdHc6ezSTDavNv+JoeRo8I5LzK1PLpMM7ekyyPnYqg8OU/DlFSKXBP7IkloqfFFk47NMB0C4rlJ/xM8P/61eYI9cvm1nMtIbzbjU66j9pbekdRjLGtrhrOdO7O9aDmABT30BPRcZE2/BJ+IfPinM2rmEEOVBznaNHpSkohG2LxLinbXLFmWtqlPu0VjbTqiRwVtxjGHGKOlozgTB0WSKNnn8xmdxvJpaug5dKdGMGvG57i0MourMHmtSG/kO7OVJfPPTo3nLOS+IFaCGuQD5P6AQj7fsZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ojYrHFhtrC0XXsWciMhKR/g/s/3xbq1qHzNZKJZcVLg=;
 b=PDShnl+z5V/J329JRhUBoV/9DJ441Oi2s5xt7nYtFH5RPBMtzG3sTY5hGfKakZH+tPq/NjJ5u+JBdovogQMHiMPfjkJTrZ9YzOFckd/cu2FeJ9COcNFBvkNi86ih45ZMOeETGDjwnQ0/0atf4Xp/Q25JqsHm8qdbU95kkT7osKxXDQvLAE17voNheJ0Ota7d5Az6NFkjXWZN8vgcmd9w1L8fcHcRbV4OEQY+ojxjMux7nVyItBJWAyqb/K14k2AZ4eLGNFihZIh7twP5h6JXJW1GyHydqO0djpJV2DOHhqg7Jm09VQZ/VVpBQQDAsA4bkxSAkW8us3Z5F862g0biww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ojYrHFhtrC0XXsWciMhKR/g/s/3xbq1qHzNZKJZcVLg=;
 b=i+49VqX7eVxV9gqzusQ8pXIx8rYN6YQRZjqgpYbflF6iiYeWYDYl/QjKJvJgzn5UuEXgRUh9PH/tw6MEbsotuE5fEsLA3CeiNzGMJUTPJQ8ASbDqxhiDvqqMkYH8FoE1Da92W9ymfuOtZkZ4NU164hb5qKY5ZOGQdDhGJkGTU8A=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6374.eurprd08.prod.outlook.com (2603:10a6:20b:338::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Wed, 20 Jan
 2021 06:09:19 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.014; Wed, 20 Jan 2021
 06:09:19 +0000
Subject: Re: [PATCH v3 02/25] qapi: backup: add perf.use-copy-range parameter
To: Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org
References: <20201026171815.13233-1-vsementsov@virtuozzo.com>
 <20201026171815.13233-3-vsementsov@virtuozzo.com>
 <84902f8a-2c1f-7e71-f59e-c3f485b7295a@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <307871cc-e0ad-5203-3a64-ceb3ef4be6db@virtuozzo.com>
Date: Wed, 20 Jan 2021 09:09:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <84902f8a-2c1f-7e71-f59e-c3f485b7295a@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.70]
X-ClientProxiedBy: AM4PR0302CA0004.eurprd03.prod.outlook.com
 (2603:10a6:205:2::17) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.70) by
 AM4PR0302CA0004.eurprd03.prod.outlook.com (2603:10a6:205:2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11 via Frontend
 Transport; Wed, 20 Jan 2021 06:09:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aaa2c76d-e2ee-44a5-d757-08d8bd09ec4a
X-MS-TrafficTypeDiagnostic: AS8PR08MB6374:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB637479470061F75BD16BB469C1A20@AS8PR08MB6374.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R5S/Zv1T+2P0anv+3HFlMBFkWTxLw9IzJukfFXohAl/+zH0P0mNfUxDlgtUHfLKjkqTf2HKcM5W/A1aXNwS8I12C9NIsw5OZaMZPlAXO7Y3+3z5E3AZqRmu0M1Q/MpedqvzwiBiOOGBQOKIP+yTV/uxXzQrfjChRXxe+wGi/5FiG+hKEv9h0Ihlwc3ozGytGElYP+6AqeUvc36FSd6Ta45+JoJeLqiHSJzRp82x6Zf9bouCmLDzO2FBXGBmBYRI9IFVkZbVHNK9DdPuPRTvY25URJ7kp6Nn9MVl8vvmAHTOgHJRDySHbv7iRveFH81nkF1KBH721wIE/znVqA4wvIPhXndFBHkUOv2SaY4gGSv48IK5RqWonSsW1GRFxVYbARNS+swKbNa79fYTwutv2c8evpqMlFJBEl3rueE8nCXXHRXJGluUMpsEEN3pHiAiu8qSWYQIw1LKhGp35+VXWTOE1QFzMtVPKzQCQrQdAidM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(366004)(376002)(136003)(396003)(346002)(4326008)(107886003)(31686004)(8676002)(83380400001)(31696002)(16576012)(36756003)(316002)(6486002)(5660300002)(26005)(86362001)(52116002)(53546011)(2616005)(16526019)(2906002)(956004)(186003)(66556008)(8936002)(66476007)(478600001)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VmJqeDJwRTR0UnZtYkZTSStTT2hRZVhzUTBldUlrQWhWWVk4UkhJRmRNMnNl?=
 =?utf-8?B?d2tBNThvL1g0NG9iaUl1UlNPY0NiOXFFK3hIQmNjRkNVRHFaL0MyMjhjeWll?=
 =?utf-8?B?WlBRMVIrR1E2bXhGcmUvYzVGZ2prV3Njc3lHZmlMM1c4dkRFVW1vb3BGVldD?=
 =?utf-8?B?bnlldTVPdUtVRjFzMi9GMjk0N2ozVUoyUW9GdG5KTzVmQUFOYTFFZ1B5Nzlr?=
 =?utf-8?B?Sm9xTTNLNXJRN0xLck9zUnh2VTJEdVVLQS9sRUhSUXE1S01iVXFYTlZ2TW9n?=
 =?utf-8?B?WkFDQ2tyY1lUNFk2Z083MitFeFFlRmRMcEpzSERNSjF2aU9GRmxKTGhMNzRJ?=
 =?utf-8?B?bjJldjdQaGI4VlQ5SVBJeEMyNmV6aG5BNWdHM2F0SEN5Z0dHVWhEYW9FN04y?=
 =?utf-8?B?QWNCdFJlazhvU1d4NmlRczV0WUhaWHF6c3JvenVpTjAvUGNjanMxZ2hpSWpt?=
 =?utf-8?B?ajlydEc3YkRreUJBWjVSQ0dLazNuTElmTzc5elNZYTFBSXZuTDlxVHg0aHgv?=
 =?utf-8?B?N1h5RnVCR3dwSmJzbnYvRjdyakZOcTJjVncwRXkwT0RLUnhacndDeHFmam9v?=
 =?utf-8?B?SG4ra01rNWtibzlLSFp6NlhXV29wZS9CVHZ2VEtnaVJZU01Nd0FZWEJtMGxo?=
 =?utf-8?B?b1RoYUpJRGVDZTdiWWZHTmw0ZWtvOGdTZmNXT1JzZXFQVkkwTGdoc2lNOGhv?=
 =?utf-8?B?a0pBQ0tXTWpZYVNyZjV5SnJudTIyR2R0d0cvQUl1VHN0U1laWnpYY1pnWW84?=
 =?utf-8?B?ckNGQ25jUGhyTk9waVFHL210UnhrdFFpcEhwa2ZhMEREeHNNNEpoUXhtbDVQ?=
 =?utf-8?B?WGJIaTdKd3l5d1k1ZS92dTltUzdCQU1KWEVqeXhOWTJWcXlYdHY0QzgvZVgy?=
 =?utf-8?B?cGEvUnFxVlhhZjhiMTJUeDFtcUM3Y01IK2NONGhRV01ZR3VxNGJjNFFaTkx2?=
 =?utf-8?B?OUhLOWUyRUJiekJQeCtucHFSMlhuQlhPOEFnRDc2NVVNblZmQkNWYnorbGo2?=
 =?utf-8?B?eW5tdFdRTWRYME02K1Y0V0NtS3FDNVFSUVBYR21uT2h4VjEvY2NxKzU2MU93?=
 =?utf-8?B?aUluOEJ4THFhWVJvWXJ0N2JLOW1IMXNrRERpQUFYL09ZUUhuOHpiR2VOcG9R?=
 =?utf-8?B?MDJGaXpEeHVZV3pleUd0dmdDemdOK24rZWdHMXJOTExDd0xRajhFbXltRGNU?=
 =?utf-8?B?cW1kSmZJd3FoL2FIOGMvK1FCbHEzUXR3R1VZSDlpK3prNTl0S0oydW8yZGtH?=
 =?utf-8?B?dEhTMFZDNDhOUENiN285a1g5cXlsS0VieE50T2F3akw2SXVtYUpKNTFBZk1o?=
 =?utf-8?Q?hoXt3M692/z2dLlg/2Z9sDvM6EukzV5P1U?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aaa2c76d-e2ee-44a5-d757-08d8bd09ec4a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 06:09:19.2396 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uMRrPdexawP2DJezpQ4o4eMXOQF0yHMh0mrkyVeOkBXHc7co/+ZSd7H9hJ+p4UVjQ7NykTzI1twXO5tOjIxjV/7n7D+DsSUnAWd98Yi99hk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6374
Received-SPF: pass client-ip=40.107.7.122;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: kwolf@redhat.com, wencongyang2@huawei.com, xiechanglong.d@gmail.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, den@openvz.org, jsnow@redhat.com,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

19.01.2021 23:21, Eric Blake wrote:
> On 10/26/20 12:17 PM, Vladimir Sementsov-Ogievskiy wrote:
>> Experiments show, that copy_range is not always making things faster.
>> So, to make experimentation simpler, let's add a parameter. Some more
>> perf parameters will be added soon, so here is a new struct.
>>
>> For now, add new backup qmp parameter with x- prefix for the following
>> reasons:
>>
>>   - We are going to add more performance parameters, some will be
>>     related to the whole block-copy process, some only to background
>>     copying in backup (ignored for copy-before-write operations).
>>   - On the other hand, we are going to use block-copy interface in other
>>     block jobs, which will need performance options as well.. And it
>>     should be the same structure or at least somehow related.
>>
>> So, there are too much unclean things about how the interface and now
>> we need the new options mostly for testing. Let's keep them
>> experimental for a while.
>>
>> In do_backup_common() new x-perf parameter handled in a way to
>> make further options addition simpler.
>>
>> We add use-copy-range with default=true, and we'll change the default
>> in further patch, after moving backup to use block-copy.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
> 
>> +++ b/qapi/block-core.json
>> @@ -1370,6 +1370,19 @@
>>   { 'struct': 'BlockdevSnapshot',
>>     'data': { 'node': 'str', 'overlay': 'str' } }
>>   
>> +##
>> +# @BackupPerf:
>> +#
>> +# Optional parameters for backup. These parameters don't affect
>> +# functionality, but may significantly affect performance.
>> +#
>> +# @use-copy-range: Use copy offloading. Default true.
>> +#
>> +# Since: 5.2
> 
> We've missed 5.2; this will need to be updated to 6.0
> 
>> +##
>> +{ 'struct': 'BackupPerf',
>> +  'data': { '*use-copy-range': 'bool' }}
>> +
>>   ##
>>   # @BackupCommon:
>>   #
>> @@ -1425,6 +1438,8 @@
>>   #                    above node specified by @drive. If this option is not given,
>>   #                    a node name is autogenerated. (Since: 4.2)
>>   #
>> +# @x-perf: Performance options. (Since 5.2)
> 
> and here
> 

I wanted to say that it's fixed in v4 (which is already in Max's tree), but... It's not fixed. Max, could you touch this up?


-- 
Best regards,
Vladimir

