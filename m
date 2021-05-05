Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42434373E73
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 17:24:45 +0200 (CEST)
Received: from localhost ([::1]:45736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leJOG-0002YK-B7
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 11:24:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leJKA-0007fJ-2O; Wed, 05 May 2021 11:20:30 -0400
Received: from mail-vi1eur05on2128.outbound.protection.outlook.com
 ([40.107.21.128]:51264 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leJK6-0007wU-Ff; Wed, 05 May 2021 11:20:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nGjZVkv1DXFS2H1iaA72V7TFzIYIu855JqL7ghQ72EdpGLiUJ48j0seQwFVK44+JfjL0EzAxWFUUE/1T01JR9ds8HKHG8xpYAPVBSkl5LIlmaMjtQOjk/9MHut+iQmllV+JrGy5hu9fxON9GduSh8wMxJ/G8VcLDf52H0821Gf8n0UPXMQWDATkRYNvQsy4R9WjJ2lMRoehDcmKW2EGkc8AzL4bJKeCRhYehX5WsKlsVq35mZfPhAf/L1Gi3KFb6M0a8LQFGGtl27ov3ZSWKd+dXaDGWt1tHLM+8EuSRy0JllpPrL1vkHuqx9M7TomF5yb/zVme0hPGFmD1Z7xEj6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V/q2VzYrhZG7aJVXmokuloCLzBzUgdzWYUyYcAjcHqg=;
 b=f/zdvuG7KmHnW9YSlNGxeYGrdxLq7ZsxD7FqKmXZk5Dj1VFcgotY1Uf3OHd/9XjaE1blXcXATaa97AK72dS9aF1ShmcU8hkeFNMyWpIdDvQ9qi133dT4MW7BA3Fi3hVXIC34WrZU5nNJqdhs7Cyc56XvJrAg0hN+R2GCA2JfKkXQwIMBONI1+MOYlODBaM84iLKu6QwZWzzmu5xhu9++ao4vKuEsArGPZtNmnLfRiAQdw2hN2HZFM4S+dHGhHVNbqDpjXgYJBJU3qAUZTk7P8fBkhfFzv1tEk/QHQvf+5JweEvnCywSDoMCLDdJhuL9LfYTPeg/xmcP3IfXDUKQ8qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V/q2VzYrhZG7aJVXmokuloCLzBzUgdzWYUyYcAjcHqg=;
 b=I4JJ47H3SaSlWoLS5QApS0+3Ky7fMXrBJvf7O+8XK2h1DKfZo9cZg6cM7TrnHx2VvycNT68ZtD8pZa0DjnOr/GDFdVXqMM8TRHpG17r4AMHuBojGomRU3MhUF+bkO8iKWmYwN/VSY71cD+57FvC8rVUoYsGZCxADNNKKAPJabkk=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4914.eurprd08.prod.outlook.com (2603:10a6:20b:cf::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.40; Wed, 5 May
 2021 15:20:22 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.026; Wed, 5 May 2021
 15:20:22 +0000
Subject: Re: [PATCH v2 3/9] test-write-threshold: rewrite
 test_threshold_(not_)trigger tests
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, fam@euphon.net, stefanha@redhat.com,
 kwolf@redhat.com, eesposit@redhat.com, pbonzini@redhat.com
References: <20210504082553.20377-1-vsementsov@virtuozzo.com>
 <20210504082553.20377-4-vsementsov@virtuozzo.com>
 <f082362f-ec9e-9367-eede-9df7d14ef85b@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <880d2a4a-68ae-fdb8-05d6-357ff74b32a1@virtuozzo.com>
Date: Wed, 5 May 2021 18:20:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <f082362f-ec9e-9367-eede-9df7d14ef85b@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.236]
X-ClientProxiedBy: AM0PR03CA0069.eurprd03.prod.outlook.com (2603:10a6:208::46)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.236) by
 AM0PR03CA0069.eurprd03.prod.outlook.com (2603:10a6:208::46) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Wed, 5 May 2021 15:20:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b60ff984-3b7d-4fc0-fbd8-08d90fd94ce5
X-MS-TrafficTypeDiagnostic: AM6PR08MB4914:
X-Microsoft-Antispam-PRVS: <AM6PR08MB491442A8AC77F044ED8172D1C1599@AM6PR08MB4914.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XRYG2owtCVbmlGNvGQdKtw8zpRtYYthquYVTGyGPY5IpppBRytmWywJBpAKA1CUvR6IAD8z1ZhEV4uo2S7iMSfh3OgHFerokM9a2OTCKiF2AdguiYe0TRjG9S2yk2yoKaTj84spaZmogOQzsfwKb/Ex/soh5pbFhKFX0W4wTY6I7AsaTOyv51YanDKkRKN940UiIk2TxDFrxpHXsGo1FN+a36ymZr4e3BnbyHY1AAhD9aGLLCA8UMS55vPqxrWZm7w1TvS/xipKlSECQHJ5u4m2svlb4tfuIn6r461lAipt56Yfj4BnZKxBvpbE5ThW80VqMIXlNYdwDpZqarauEqPvE8KRCAOJ6Ptkee8MP4gir2gJiM4P6EYdB1MJWo4ihkname1RtVlQbBcOqnpGEcChI8XAW8Ng8EeABTERM1X4XQYnbA4Po/kkrLCiX5miMTrV4y/SiR+3DsrlzgmDciHxjtJFqjiqHQivsD/dV5TvKnTpNjxBn/xd0sm857BvSiZxhhgaW/PXZpA3lI1JmpsN5BqsTG90uPLwdEJZ3l5RdYWMueN3EQYdQt2Szwra6kyTkxhQXJ0Vgyz9mMKEYHsTNoxkSmf2sNptbhEYFnN2o/aW0BZLhg3vEMzTRsZHfZCYZEiizolvtA/rL3dxpyoCD0gKcNCZtI+39pn1bpse/RzWT87EFTCdZqeTZRhJOLGMF/jZy4LfESCFpHGlxxPOCQOruFKlE3Z8ziVkVq04=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(376002)(366004)(346002)(136003)(396003)(66556008)(66476007)(31686004)(31696002)(53546011)(66946007)(186003)(38350700002)(316002)(956004)(8936002)(16526019)(4326008)(2616005)(16576012)(52116002)(26005)(86362001)(38100700002)(5660300002)(8676002)(83380400001)(36756003)(2906002)(478600001)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TFRQZThZVTZ0WUloQ0ZIY2dJY2thMXBYK3N3WEZzVWUyMnNHc0YzL3VwL2Ir?=
 =?utf-8?B?TnRsUk5iK2MraUR5djQrdDAzMlRicTZFYmZ5cWJOSDJuSHk2bEdlSDVGUU5I?=
 =?utf-8?B?em02WTRKRndvVlVqYmZPTUZuR2ExbVNSQ3BxVkVXVzZENmNWdHU2WFpieFFx?=
 =?utf-8?B?eXpkYTl5ZkxqTVNCNEd5a3hSMTAvbm5qNFVxS1hOS0lsZWZCZ3BLYVRZdVI2?=
 =?utf-8?B?NWdOKyt0YWZod1dDMzZvVFQyVks3Q1RXQUlTdjRwZ3hsMkl0VkdmL25JaW51?=
 =?utf-8?B?WW5CODJJbHVyKzNheDloTERsNDAxWEJvNncvS0hwZW01emZ2emhGM2JUUEUz?=
 =?utf-8?B?bW9mWmhtakhGMVlVVmhyM3dJQ0FNMEMvNGZMQTBoOGl0OTdCbXVBNzZ6dmc4?=
 =?utf-8?B?SFlCZlUySkE0QUpYMlJETnRiSW8rZ1ZYYjN6OFh0WERCK0RlcUd0NWlQRnpu?=
 =?utf-8?B?VmVLOEZNUi9iVlVWakd3dVJaR0o5WktKV0RadWNzWmFHZE5vTnlFbi9aQkVU?=
 =?utf-8?B?emZRd2RlUnR6VzR3SGw0aFREeEFndDlQbDJUZTlvdGE1czF3UDkrb3MxZVMz?=
 =?utf-8?B?bTQrMG5vZEh2clNtSzY1dUxFMUY1WjJRajhhanB3RFVSTzVCVllGN2Y5TmpC?=
 =?utf-8?B?d00rTnYzRTA5U01ZMVpTcC9PUDhSNFJTMFlLYjRORllHY0xCTVlBOVh3OFZI?=
 =?utf-8?B?M01JZCtZMVRFWFpUOURuUnZIV3owMDIvaUZTTDI5N21oWk94Y0pHUWVPWEdT?=
 =?utf-8?B?Rjlab0xDdStXSzEzVjFCcnhaWEltSFJrbk0rNCtvSlZOakNkTm1NRWkxUGc2?=
 =?utf-8?B?dzF6VHRzaGN5YmlZbjlqQW9vZjZ6ODBhNmFjS0RmSmVxZC9CclZNb29pR1Ew?=
 =?utf-8?B?Y2RqV1d6ekNoSFhpdmZNRWVlMG9IS2kvUWoyVTgwY2d3Zm1SYy9kSm01K3FW?=
 =?utf-8?B?WW9pU2w2MFlZdEhjOE5LcUVtUzZwS3h5N1JTVzhOWFFTdklwNndQcGpvRFhV?=
 =?utf-8?B?NmVaRXd0Q0svMm9vWlZTbXRWSjBTb2l6NW4yaDd6VVlRQ1RZUjA1d05qbzFw?=
 =?utf-8?B?N01yMEVqb2Jtd1E3aDRONnJHNGhGNjd0cDRDN3FHZWt1a2RsTzl0Rkx5empr?=
 =?utf-8?B?LzRVeFR0ZW1rOG9KbURjdFNyL1V4WWRHQzFwZEdkWmVhMGVtbzhoeDdxVnQ4?=
 =?utf-8?B?MDgxeVN4WXBGc2E2R29JejdhV3hKL2tHT2VFV3BwaTRVdDdvQjZaNnFUSmJa?=
 =?utf-8?B?MVNDVGZoSkNrczlQeFlmS25hVUorTzhjZU40WUxZRDhtSlZGZmJrY2IrZUJB?=
 =?utf-8?B?QmNHOVR2N2Z2RWxoejNsVk1CU3JNN2pkUWEzOHN5dytmL3lpQndxelVwdFUx?=
 =?utf-8?B?R01zTnFyR0VyOGRnbThFQTRScEVGVTl6UmptYUF5MjBETlV5ZFVjSlhueFIx?=
 =?utf-8?B?amF4R3hpalpYeGM1M3hLYXRnR3BRU0RWcVZ2MG9XckFMNEI1ZlQ3ZWxXQVFz?=
 =?utf-8?B?MGtrajlzTHBYNndBL1BGa2hqM0RmUEoxRit6dVdYRWVKdGl6cWtxSGRYbzdE?=
 =?utf-8?B?OUZOdFRWR0xWTGMwcmdoNldnWG5YaVNjN0FTQXF3czc0bDRtd09TRXBUdWVT?=
 =?utf-8?B?NzhyTG5sSHh4K1Y4Mngva3RWU0htVUhVb2VIcUNUUTQvQkZHaEFmT2tHNXo2?=
 =?utf-8?B?S0xaRkQ4VVp3UHVzbVZPaW9kVytPbzM4R2J3UUZpQnhzNzlXZHlsbU01V2Jh?=
 =?utf-8?Q?buLKZVIAqmkk9SiqbeQeaSGx1TYqRguRy0IsMiL?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b60ff984-3b7d-4fc0-fbd8-08d90fd94ce5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 15:20:22.2713 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eqiYbRieQaJjyVbq76KGk2d9MqYIqXNlm+uGhbZhoJOH0c4Kt/46YkoTCYnpapBx2JBjypaCkOaDCJjgSSGfZcthnf/SkOdb1LtHEwPfnRc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4914
Received-SPF: pass client-ip=40.107.21.128;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

05.05.2021 17:28, Max Reitz wrote:
> On 04.05.21 10:25, Vladimir Sementsov-Ogievskiy wrote:
>> These tests use bdrv_write_threshold_exceeded() API, which is used only
>> for test.
> 
> Well, now.  That used to be different before patch 1.
> 
>> Better is testing real API, which is used in block.c as well.
>>
>> So, let's call bdrv_write_threshold_check_write(), and check is
>> bs->write_threshold_offset cleared or not (it's cleared iff threshold
>> triggered).
>>
>> Also we get rid of BdrvTrackedRequest use here. Tracked requests are
>> unrelated to write-threshold since we get rid of write notifiers.
> 
> The purpose behind the BdrvTrackedRequest was clearly because this is the object bdrv_write_threshold_exceeded() expected.  This reads like there was some other purpose (i.e. actually tracked requests), but there wasn’t.
> 
> The question that comes to my mind is why we had the bdrv_check_request() calls there, and why this patch removes them.  They seem unrelated to the write threshold, but someone must have thought something when adding them.

I wanted to add a note for it but forget. Something like:

   "Such small requests are obviously good, no reason to check them" :)

> 
> Looking into git blame, that someone is you :) (8b1170012b1)

Oops:) When I read your "but someone must have thought something", I really doubt in it :) But that was me, and I really thought something. Respect for your punctuality!

> Looks like you added those calls because BdrvTrackedRequest is a block layer structure, so getting rid of it means the reason for bdrv_check_request() disappears.  OK.

Yes, I was worried about the fact that BdrvTrackedRequest is a public structure and is a potential backdoor for not-checked offset/bytes things. At some moment we'd better close it (hide structure and add some interfaces).

> 
> Reviewed-by: Max Reitz <mreitz@redhat.com>
> 
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   tests/unit/test-write-threshold.c | 22 ++++------------------
>>   1 file changed, 4 insertions(+), 18 deletions(-)
>>
>> diff --git a/tests/unit/test-write-threshold.c b/tests/unit/test-write-threshold.c
>> index fc1c45a2eb..fd40a815b8 100644
>> --- a/tests/unit/test-write-threshold.c
>> +++ b/tests/unit/test-write-threshold.c
>> @@ -55,41 +55,27 @@ static void test_threshold_multi_set_get(void)
>>   static void test_threshold_not_trigger(void)
>>   {
>> -    uint64_t amount = 0;
>>       uint64_t threshold = 4 * 1024 * 1024;
>>       BlockDriverState bs;
>> -    BdrvTrackedRequest req;
>>       memset(&bs, 0, sizeof(bs));
>> -    memset(&req, 0, sizeof(req));
>> -    req.offset = 1024;
>> -    req.bytes = 1024;
>> -
>> -    bdrv_check_request(req.offset, req.bytes, &error_abort);
>>       bdrv_write_threshold_set(&bs, threshold);
>> -    amount = bdrv_write_threshold_exceeded(&bs, &req);
>> -    g_assert_cmpuint(amount, ==, 0);
>> +    bdrv_write_threshold_check_write(&bs, 1024, 1024);
>> +    g_assert_cmpuint(bdrv_write_threshold_get(&bs), ==, threshold);
>>   }
>>   static void test_threshold_trigger(void)
>>   {
>> -    uint64_t amount = 0;
>>       uint64_t threshold = 4 * 1024 * 1024;
>>       BlockDriverState bs;
>> -    BdrvTrackedRequest req;
>>       memset(&bs, 0, sizeof(bs));
>> -    memset(&req, 0, sizeof(req));
>> -    req.offset = (4 * 1024 * 1024) - 1024;
>> -    req.bytes = 2 * 1024;
>> -
>> -    bdrv_check_request(req.offset, req.bytes, &error_abort);
>>       bdrv_write_threshold_set(&bs, threshold);
>> -    amount = bdrv_write_threshold_exceeded(&bs, &req);
>> -    g_assert_cmpuint(amount, >=, 1024);
>> +    bdrv_write_threshold_check_write(&bs, threshold - 1024, 2 * 1024);
>> +    g_assert_cmpuint(bdrv_write_threshold_get(&bs), ==, 0);
>>   }
>>   typedef struct TestStruct {
>>
> 


-- 
Best regards,
Vladimir

