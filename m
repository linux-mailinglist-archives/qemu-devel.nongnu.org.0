Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4098847030A
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 15:42:06 +0100 (CET)
Received: from localhost ([::1]:40142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvh65-0004MD-CG
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 09:42:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mvh4H-0002KS-UP; Fri, 10 Dec 2021 09:40:16 -0500
Received: from mail-eopbgr80108.outbound.protection.outlook.com
 ([40.107.8.108]:26174 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mvh4C-0004b7-Iu; Fri, 10 Dec 2021 09:40:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HEOf/o0UrOpoA7R48BUOfybL76hvwX9ogFLqrHGs6Ii+jf2T4aDSfK+1GfgXO3ndV+uIXS/mtqzj4qiMvVqHVSykpThGEAxvvjdjcalc7uplWB9jmHD6+Y159yBfDr5c8/jq3LkylXEO8KRRb6eVZEnezPLeqSfe6CiCXwb3LWC2HrlT0JTrIdnu63QJIlmEliBxbf8oiunAupKFEv3jid+KytBhaLERqi5GTqihG7+aaa+kUYd85MP1mo1YBBilt9Ffdd5hL94cVF3IAKgL0d5fqqr/9kQ7QfSAjwTQXxfPUWZDTkY3jX5up35XCI20yMmFsvppP4w1b8dbz2WhHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JSnG2rcmmPd865s1hYPOQVtJ4ZI6L/RO4jA5iOCfA7c=;
 b=WY+76hl92b1fHceuH6vPZplvn7Z7FNIjxhQ0C2oQ2//KjQ87x6rnm5lhdCUAdgnYG4zwOBWipCnT3xeoi6LXY3LIwxFVOKvj4/UUHheoZyZp2TaRCo5RcENyBNGEW2lWVUa9Lyn4n1WZgPTAJtY4YLZLb5rlgn6nv1Gx1jNWdveIsaZHNUQr7QtQRlZi2V96GgSu0G+Xnqs4RccZPRFV47oOEgphmWEFCkZZjVKduSI2XPDfGMVtc1hSKRsyXWfb4vGxYg+BAlYmoD8UVRp7pLsicyLBTvQqc/HaExOPsdBv5PgIvkR5xcVtkhZK/lOtqWL5NQSqoPTmdMXwl/7zGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JSnG2rcmmPd865s1hYPOQVtJ4ZI6L/RO4jA5iOCfA7c=;
 b=Pa6AaBJZh/qE0irC5IK33pi8wNdpGKR5vGGFG2A+lOyvJgddphMO4fSsDjZA0Smw0M19zAz2aO9ATc0WSCS3UcukF/sO7Ov4r92gFf6EmoilLML5xNHLwzJqwstwnyiL1WU8LroYgPFTeptaYQjSyID/NxmD2S7CFBK+A1pQoIk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB3539.eurprd08.prod.outlook.com (2603:10a6:208:e2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.14; Fri, 10 Dec
 2021 14:40:05 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Fri, 10 Dec 2021
 14:40:05 +0000
Message-ID: <ae6abce1-cfc4-e73a-eb3a-f13d930098a2@virtuozzo.com>
Date: Fri, 10 Dec 2021 17:40:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/3] iotests/testrunner.py: add doc string for run_test()
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, hreitz@redhat.com,
 jsnow@redhat.com, den@openvz.org
References: <20211203122223.2780098-1-vsementsov@virtuozzo.com>
 <20211203122223.2780098-2-vsementsov@virtuozzo.com>
 <YbNgMzD7qGYqoUjH@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <YbNgMzD7qGYqoUjH@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0048.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::20) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.230) by
 FR3P281CA0048.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Fri, 10 Dec 2021 14:40:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1fb1c2cd-ca06-418a-09af-08d9bbeaf47b
X-MS-TrafficTypeDiagnostic: AM0PR08MB3539:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB3539DF72AD15021B0B288ECEC1719@AM0PR08MB3539.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:972;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L4TJ1o9dE7n8b0hJAFCur9Mg4kn+Pvfr2HQBuOfInrOcgTSZq2CFT3TVehrb1Y1bk8bHuCEKR0nbSZRiklc+m/KjM4gM5ZzC1W6XuXBH2LDS3MCfUv2wy6+T7aAeq/2WL8v1QOk9GTN4oVbVMSCJ64ZgAyb62Y+GtNQjQ0Q9YH4Z3DHR0XGCpQaMitoLESo7Cx2YiqBsMCJG2hYscpJKfLRAa1bQceIVQzyRExJ3fVacHI5PtJtpCnwhI8G6ScWHEauQWanuFk1+WeYHOh7VCdsArnmQpJoK62dx5dSENFfPHiF/1JCvlw+Tl9i4MzFqgeauUbx8ZmpFIa3ti2sS7rLfO8TUKhKkpTRp6c9QdGhAaU7Y26RphzvhlMzcWdu8efbaa/oIIeqwCD07AFvrFqQuwoi1rcWKRUuPkvpIuEW8dJ9/zQECcLBAvvPETdndmZmZNsEt0iUgPBbrtbJmmDAJjAU6fPXU8WUT+rsP6nt6qVkBahMgB5DnTjBCEZGfh9Ab9hApZS1884rrkSnnMVaCVvIvwDNljsVB41OqHXX4728Emv9e6HZ9oIcG70cvtcG6mPDwOo1VCAOBxF2EhRiETwIjSlbFoMGcNn1o2N+du2QmP2aeQyvveRHrbPjz9KvVZpm2BNrVadSeJNPxrtYKe5SjIN289Wwu7wgfgrq6QP4OYsqbSSYWEYDJnQ8bUolRSAf+7noo1hsF/70HtlX1jxWrd9JEFnTCrLEJFosrHY7eemVc/6DxSQ9D6If5QQlfnJbZMIRK6D8VhebJ6g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6916009)(38350700002)(38100700002)(5660300002)(2906002)(956004)(2616005)(31686004)(508600001)(16576012)(66556008)(4326008)(8676002)(52116002)(26005)(107886003)(6486002)(186003)(36756003)(316002)(66476007)(31696002)(86362001)(66946007)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVdDc3BoaUVPaFhNUENFUWNwWk83bnFRNFhlb2YvekpMSUEvNkQ3T01hMjhU?=
 =?utf-8?B?U2R4ZlJiM250MkVBTk1KUWJiSUp6ZW9RRGJ4NWN6MzBvOFRsNGFKeHhrc0sz?=
 =?utf-8?B?WVhTOVJLZFBoSTFkZ2RlZ1ZPdW9rMGJHZ3gxR05oOVBUajZ2bWREeDd6Ykho?=
 =?utf-8?B?RkR6VitiOWN0N0V6TUNleWpqbGowV1Y3QVZsSTUyaDhwc2lQNkl1MnNYRmRy?=
 =?utf-8?B?ckUxVVU5bDFjUHg1TmQ0dVRSdVpHeWJCQnI2QzRTL1IxYWFUYmV6WmRPZ2Vz?=
 =?utf-8?B?TUVGa2VCUFA0ZUQvUk1uanQ4N1lnblgyenducW9OVm8xbEIwcEk2TzQ2Tks4?=
 =?utf-8?B?SGUwVmtZbmJoQlRjU05JeXp5QnhYaVNVc1ZCSUh0RHJkZjlGSWQ1dDBXNjhB?=
 =?utf-8?B?SVBpaTZCN25nZlZ3YWt2RjZnWG5HZUk5RjhHMDJ6R3NjUHRlaTBBelh0RDgz?=
 =?utf-8?B?RTJBcXNncHFPeUZ0ajAyOHZPRTVwK1BjdHJOYzNnOS9TVVlQbDJYb2hHeEo4?=
 =?utf-8?B?RWZGSExneWJZWDJjT2dyTGNBQlBFclRXK0xRQkgvVmRUMHpqbWs4VFAzOEJL?=
 =?utf-8?B?emJEcGRnR1ZPbndTRmRXRGNESXhkQjBKK1E5N1ZvRUxweHBjYmRYUU9GNHho?=
 =?utf-8?B?OXNTUCt3VUhVdU4xWWJtNzhUUEZubkFLVUNpRzQ0SStERTFWRW1YUlhjVDF2?=
 =?utf-8?B?azlTK1NqZ0tib0JKYkNaMW02Q1lPTXNJN292T0VmQ2FZSk8zNzRvbXplVy94?=
 =?utf-8?B?T1RDRWNHVlNKOFFTUFc5QUl0K2RyT0xGcnQ1OW1iU25JQjE1cVdMckc3dTZ1?=
 =?utf-8?B?U08rTjdadjl6eUZycmtjd2V2bWE1bkU2aFJTdFUyS2VZMi9MZTJlYXdOMDli?=
 =?utf-8?B?NFM1R1JMbmxsdDkxT3Bxa2tHQ0twOVpOenJha2lqbzBuMHNrM2s1bjRnVGhT?=
 =?utf-8?B?VFZ5ckpna0sxSGlxZmpQdXAxdWx6SWtrRVdPS3dOMjR1MCtpYkF1N2JrNXhk?=
 =?utf-8?B?SXc0bHZpRXBSZlk1ZlVuVDVrS2dDclJIUlJMQVA1ZnYvRXJaaHoxOHk1QUVt?=
 =?utf-8?B?OU15cHdrVzc0L0tYK2Z1WUtJMmYxLzR1TTh4WnVGbnE1bmlrMjFQZ1dpejBZ?=
 =?utf-8?B?Q0VJMUdRMnZRUlArNUgxNzN3enN1dTgxTk42VUpvbGMvZ3FXeFBOdE5PeFd5?=
 =?utf-8?B?ZmkrcHBzbWRxa29EaXpvMHUyaVRpTHJuMGxJSjBtWmppSk1kNS9NVnhQYWg1?=
 =?utf-8?B?aTVCREdCeXV5bEE2S1BzSHNRVTNqMk5TdjgzWmRyM21HdDlrV00xa1UwcjF6?=
 =?utf-8?B?bjlYWFRwc2V3RklnbmJjZ3BnMGdsek8rRHcySjltd3ZDbUlpTVVEMmg4ZjlJ?=
 =?utf-8?B?VnpLVG5aTUI4UGtWTHBoaC9nMVlEM0hFVlZma2lkbEJWcEJmU3ZBN1JzSXBM?=
 =?utf-8?B?Q3E1cnhMRmF2aVYzMkNYbzJmZjUwbyt3RGp2cDlSVlo4eEFwS2lIdUdMU2l3?=
 =?utf-8?B?ZEtOSGR6aHRRRzVsQ3hWczA2c1NPK1ZzdWViVS9aWnZyVTZtTStiQnB0RS9Z?=
 =?utf-8?B?SDJ6NUpLVG1kQUcwZ0p0MG94eS82NFh3SXUxU1hUcVprVlpvM3RvNjNiaERF?=
 =?utf-8?B?U2V4VmlVZnEza2xlTTc2YnBYSE55RWJDZllKT2c4RlFjaFl0WUoxdDhLekVF?=
 =?utf-8?B?MkJkbS8vZXdpbDdjMU13ZGxnU2h6UU9NdytqZWIrVG9mOXFyOWpQRjkwYlVr?=
 =?utf-8?B?T2QwTDhJc0FKZk1PZEFORjFJMTRxNENtWDRUWm9veXNyUGV3cEVXSE5HcTdh?=
 =?utf-8?B?ZXVJekNwVFpZMXVUcXJHMTB0UlQxa3JKcUtnbkVBclM2R0tabUw0cXJUZ1RD?=
 =?utf-8?B?NDkvOW5hWC83T2FjOUdYd2VtT0txQVd2MTQwenFibGlZZTZmU3lQYzJVWUNl?=
 =?utf-8?B?a29nTDJzZEFJcERoMkZKVERrL3lPREtWbHBucDF1cWNsRnJjUDRnOE1IdmdK?=
 =?utf-8?B?NnIwdFlVaG9mOG5VekY2RDR6TzBLSXNPNkdDV0NVTTQxSURHRVJVTktmZ3ZF?=
 =?utf-8?B?aTJ4Y1hkMWl1MDkzMFVmNzJuSUZMSW9zS0N4LzhYZHhLM29XdlF2MEhWQXlE?=
 =?utf-8?B?ZE0rZVVFdDZUS0ZpWEYxVldZYWFCZ0cxWVQ3T29NV1ZIZVY5aklMRi83Unpv?=
 =?utf-8?B?QmFFWU95SFVaV3lwNVBGUXhpVTFhbGtvcFpQYUdsSlkvMW5USU13MHlCVmR5?=
 =?utf-8?B?Z2l3WDNpRGNLemNZVGk3RmU4Vll3PT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fb1c2cd-ca06-418a-09af-08d9bbeaf47b
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 14:40:05.0859 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9a3gI9spUFEJVq3/0UgwCv6eIv2fFJQzODFlq8XYfXrbwOdyWC0tZketSFfdSnvPI9yTCgxwFItHGGuShfbu2Ju2vBMCCasLmhXZzz+kCDw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3539
Received-SPF: pass client-ip=40.107.8.108;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.317, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

10.12.2021 17:12, Kevin Wolf wrote:
> Am 03.12.2021 um 13:22 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> We are going to modify these methods and will add more documentation in
>> further commit. As a preparation add basic documentation.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   tests/qemu-iotests/testrunner.py | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
>> index 0e29c2fddd..fa842252d3 100644
>> --- a/tests/qemu-iotests/testrunner.py
>> +++ b/tests/qemu-iotests/testrunner.py
>> @@ -220,6 +220,12 @@ def find_reference(self, test: str) -> str:
>>           return f'{test}.out'
>>   
>>       def do_run_test(self, test: str) -> TestResult:
>> +        """
>> +        Run one test
>> +
>> +        :param test: test file path
>> +        """
>> +
>>           f_test = Path(test)
>>           f_bad = Path(f_test.name + '.out.bad')
>>           f_notrun = Path(f_test.name + '.notrun')
>> @@ -287,6 +293,13 @@ def do_run_test(self, test: str) -> TestResult:
>>   
>>       def run_test(self, test: str,
>>                    test_field_width: Optional[int] = None) -> TestResult:
>> +        """
>> +        Run one test and print short status
>> +
>> +        :param test: test file path
>> +        :param test_field_width: width for first field of status format
>> +        """
>> +
>>           last_el = self.last_elapsed.get(test)
>>           start = datetime.datetime.now().strftime('%H:%M:%S')
> 
> test_field_width is Optional[int], so the documentation should specify
> what happens when you pass None.
> 
> Seems it doesn't change the behaviour, but just picks a default value of
> 8. 'test_field_width: int = 8' might have been the more obvious solution
> for this in the first place.
> 
> Kevin
> 

Agree, I'll make a follow-up patch for it.

-- 
Best regards,
Vladimir

