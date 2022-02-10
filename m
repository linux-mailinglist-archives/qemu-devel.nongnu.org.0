Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B55314B15B3
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 20:00:34 +0100 (CET)
Received: from localhost ([::1]:50048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIEgD-0004qV-GT
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 14:00:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nIDWw-0002Sa-Gi; Thu, 10 Feb 2022 12:46:55 -0500
Received: from [2a01:111:f400:fe0c::70a] (port=42733
 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nIDUy-0000RL-PY; Thu, 10 Feb 2022 12:44:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iqF7VrZJj50kElsX4CwZJwQAV40/1QyBC6G9gOoXjkd7rmDunkH9ZxNwSo4U4zA+ddR9N2Ug+9qzvb16WOirRJxOv2f6Vk8SV+6O0knINwyByOB8rknE12IL8fuWpLpBDAvUSZVDQyP3Enu0C4D2qE8q+b29uQmJwEg/BWogApaYfA4+zQtUfEJ9rBUK1knoQgACMAo0GFLWG7+gAiG1SC8wAzNaAz+DC/Vt9BihntqHMwXijDBZG5Zatai9vqyGRvrwgvKDmJTIiUNOe9blq9A5Wf8sLnllCsezvzOZgdi5xrKnEsigZn5202voOFq8Hpv74axg+4nWUiWE4lqYEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rFMCiXxtlRQXugBJ0x1YJ/AwqpiNLqwyvZKZZsPtxyg=;
 b=ezGq18WnhG4QRO1JBpkbu5yBnkMSKINr4IhTIgN+DQrivVKKEOZ+MoKK+dCW3an62TURQ2V3QsJ41oEzl8Vj/WqlSwEKYfoe4CnLFvqId8BA7WDzW6+1FwRzYpIjsyJHjEIN54A0cD9YKaRt08jvkhsd5/Dgu6LKcYTtF39GB9lzAifr6M3+AB0yKk4y8R7/2l5CLwo6mwwkeNWeE0rRYXl5Wu2zQKM27ZS/Svn1Au0Yha4B1mf0G10wzGWnhO2su51lUKYJrJJznmvI+McCIzxzqolm2RbVkLdz0x7nnpo9njMpHhW/L1IIqGJIhhvthTnwRy7eYyK+sASrCIvH2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rFMCiXxtlRQXugBJ0x1YJ/AwqpiNLqwyvZKZZsPtxyg=;
 b=mEC+CbYaYj08ACzuktOfsKGm80a4p3E4DeSvfOvBC1bTdf/O1GfZJIpGXROowmzi5dVYmgjBhORtqkcI4wPfbnLykRZCBXjzzn+X2R8cyHagWSa+Z2FBVTL1HCgjZXwwWOFrjUlWeCOB8rCrBRq7tCfLcgxxa1AoUDQVbct6GEA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by HE1PR08MB2697.eurprd08.prod.outlook.com (2603:10a6:7:30::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Thu, 10 Feb
 2022 17:44:41 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4975.011; Thu, 10 Feb 2022
 17:44:41 +0000
Message-ID: <6d73af8a-4620-f702-5367-6bed666b61a8@virtuozzo.com>
Date: Thu, 10 Feb 2022 20:44:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: qemu iotest 161 and make check
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-devel@nongnu.org,
 qemu block <qemu-block@nongnu.org>, qemu-s390x <qemu-s390x@nongnu.org>
References: <36201311-39e2-0b94-1b06-74a2df988553@linux.ibm.com>
 <45589fd7-bf18-8950-34f5-86a90b99c8c1@virtuozzo.com>
 <586f035a-91b7-4743-9285-09996aa32b4f@linux.ibm.com>
 <a4955275-6cdd-f54d-81b1-8380aad0461f@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <a4955275-6cdd-f54d-81b1-8380aad0461f@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P195CA0096.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::37) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4df7356-d04c-42a9-5f82-08d9ecbd0405
X-MS-TrafficTypeDiagnostic: HE1PR08MB2697:EE_
X-Microsoft-Antispam-PRVS: <HE1PR08MB2697852CA7CD490C90A09329C12F9@HE1PR08MB2697.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xu+vhRFQwPtEd6jLwNSCXOtlCVauLcfgJfwor0fQ/rngq0/Si1K6SwFa4Xp9s25dB41XLVCXqTXIklrDXJYloKMUneXxRtusY+doI8bUgU0CUK46HXjRJv4kcMtaHbDvv9H9lfHiV622YEuL1uGvmNmKnkBiaHrkx4qGhTcusgri9HxEBCD84Falwc1CY3xmbzmy8x+SmtFd8F+lUbBZMj43wUDqBYSDGfyj7AeFibnyQWSVi13ElGur8HWKXmj3AqFDXvyN1kro3u5UQa7f51H4lYWBdfJKP7jbJBPFTbw9sdWbI0pekMxD8a0MEzxJNIk/fbNbovHkF3p9l1dyudvmRjfLJm6Oeu2C1jmRiJMgvinIKeoRf7P32tfa+yA08ClQbV8dGELguU+PYaoCZdaK1M8tWT/bmkBye87wY+zze2/6ShLMZxZYhEn/wfjNtNQ8bcOq80lmOtOPTDBGGFK4fRiIuMrh+2ARqZAWqEDOyIg/i9fYkGZC/6v0jatC8eZFInpK0vH+COvchJP+ZbxS1QH4u0QhvpWlC8k1wLj1jkh23Rf+wiMSBGO6sZlag3OftBruhpqQH2av1yuJg5B4BDD2C9Zi4nfXpWjWeGjGf/3UF+Tf51ORKS8GBYO6N7Daxc0jlZNttc8vZM8IxX5w87Lj2RWkmW6HeKys/xqga3HstgxnGo4dgjjtXLtnsUWW8vSHnyVHK/lUG6vwI/gy+p9Fb0YtkrPse9PfZT3AI9Fhxu7mD/8ypgCT8+9oWRPJtXbE/V1Cb3Nrp4aJoZq2lf60p7HNtCxWpwH7ijRnIKyJqFzgXng0Y/D17RDxPSTkgzBESj7rEkTad0JVhw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66946007)(66476007)(186003)(66556008)(31696002)(5660300002)(86362001)(83380400001)(26005)(2906002)(38350700002)(8676002)(38100700002)(52116002)(2616005)(6506007)(36756003)(8936002)(508600001)(966005)(6486002)(31686004)(316002)(6512007)(110136005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFg3MnE0Q0pucUtvZ0Y2a3M2Q2h2cnN2NTQ1Vkl6TUFRVUFOc2p1Q3B6M1Nu?=
 =?utf-8?B?NWFaSTllM2NIS0o3dFlaM0diMHMvNEIvM3VPR2p5YWVzQkkvSkdKZStMM0pM?=
 =?utf-8?B?QmpJMWczUkQyaEpxOU9iL1NpczkyanRlSDlid20yWE9ndG5IbDgyTVlRYUFj?=
 =?utf-8?B?M3c2Tk1YMEhEUzVDRy9FQXRyLy93S1NucFY5aU9LZmF2aWkxa2NtZFA1VHhk?=
 =?utf-8?B?SU9xTGxhUXVSMUlKb0pPTmRHTnRGaENoN2VNMEcvU3RUZExFOVFWSWg4NzR6?=
 =?utf-8?B?NXNIbCtDMVVDS3JwdDEyekxwZHJKU2JvaURIdEN5WUVwMWFheEhNT1VnYWhU?=
 =?utf-8?B?YW9EMEltSFkzN051S1Z6NE0vNDRjVjZrVmRiSXBQaGJyOVhEV0ZRTzBpNG9I?=
 =?utf-8?B?Wm9qZmlWZVE0Wmg0aG1KTVUvN1ZTNnJSWkhmcDEvNG5yK1E4OEVZNjZvWGQz?=
 =?utf-8?B?cGM1dGhGeHI3NmhsQS9ENktQTlBzL2dRY0lwZEhzUk5aS3RZaFpEa0Mybktk?=
 =?utf-8?B?NFJQUUhxSVV6SWJWcGpmdm4rdno2VWpUOTEwU2IwaDhmemY4ajdDcWdwbDJP?=
 =?utf-8?B?WmIyRkNsbVMvMERUbUxQK2ZJclVJQlZFUkg0b01DcmwzUzE1RWdIeVFuQzhs?=
 =?utf-8?B?anFFMXZseExBTS9hMVBXSDBINEhkU1JmMFA2ekpnQkhlTHJneHcrZVQ0MVFH?=
 =?utf-8?B?TjZ4NWk1SUNZQ2xFckZhNVpkUmNpalhSVE9rWHIrbWhQbEMrQ28rTTRjQ3Z5?=
 =?utf-8?B?anZBNUZVZHBBcmtrd0VaRE8wcmZCWm5GMExCcGJZcCtFN2xkL2NZYUFjdzN3?=
 =?utf-8?B?bi9TVXpETzFkOTlybHlqV1RwK09zR052MWVVSzU2VHdaN0NFS25LbHIwd01y?=
 =?utf-8?B?WWFrNFN3ejViblF0Y1d2NWNBbU9Uc1ZRYk5Fb1hpOUsxUjF2b2F4MGNpTUor?=
 =?utf-8?B?OTd3ZmZzZVppTkEwUWhRNXA3QUtUeFg0TzdETHVJN3NkVjVNNWRVYWtiR01o?=
 =?utf-8?B?Qm9zVlh2SWN2MUdnR1VzWDdXQlV1ZXd6cFIrcmdDckpzNi9vT3E5aWxNWFNl?=
 =?utf-8?B?OVEzWTByVWI0bkF0Sk1RWWcwMlE5aS9IR0hobldnRlJwaHNmR3lyOXV1Q1c4?=
 =?utf-8?B?clUvY2l6YkFPNkRzbVhNb3htZkQvOTh2ZlJZSFVwSllkRlRBK0JqK1F3UHZ6?=
 =?utf-8?B?bG05UTRQN1VHaGE5MVNtZzRUQTl3NEFaY3UrYkp2Q0pUT3kydUh1TTlreWNP?=
 =?utf-8?B?M29hMHBjbGV2TjVTTitHMlZIa2FKaXZhaWlWVTNGUGptWE1TRlh1UzdCeFEv?=
 =?utf-8?B?RXloVThya0t1U0w0eGRCZFc3MzQrWDEvaU9rQ0UrVytrNGlJUEE1ckw0UU9R?=
 =?utf-8?B?QUZUemgxdkp6YkVuR09zbW9aWTFmbkRxbHFIZFNoNG4wUEM0ODhORGFEVjF1?=
 =?utf-8?B?aElDOWtHUnpOR0ZvV1lWSUdmanpkVmRId0lwOStuNGUvZGUxVTgxalJlMkpY?=
 =?utf-8?B?TDhDQ21QczQyRmplUUl1eXVzN2JKdVlILzMrMGI0YTJuSnJLOUx3ZU1TeHRy?=
 =?utf-8?B?d2ErQXNRMHFOSHdBdjZJTGJnZXRqa2wrMUdhemNUblhkVThlQVJ3Um9BZkcw?=
 =?utf-8?B?LzRhM0NyblpnQ2lPcGd0cFd3bTVEN0RFamhPTEhNUi80eTF0MGRaUTR1M1R3?=
 =?utf-8?B?a0NyVE00c2pBRU1qdExTd2ZKL1FWZFM1Wi9GVndoY1U4TTJjdjJnYTNvMVJI?=
 =?utf-8?B?Z29RaHgzUytKN2FqeklZTENXL2dxeUgzWnprZTNHZDA1TzVybDlDVHpWc3pi?=
 =?utf-8?B?VW5nZWFqc3d2L3dpRy9FRTUvNnpmL09tZWtwMHBuVXNmcmxFZUVJN2NraHA1?=
 =?utf-8?B?M0E4UkxBU1ltejVVQ2ZTM1pmcmdEVjgxTVVoOGNKMFdVVlVGeGNGOHBqVlNq?=
 =?utf-8?B?WENENWFBTWVBaXduYVMwUllKSUI1dVhER1Nsb0JNYVVVTTMyUTAvejhxaE1w?=
 =?utf-8?B?MWNHQk5oVGlCRTdiYWdmbithQXV5ZFFQVXFWcTZuSkcvYWE0U216ZDBTdHFY?=
 =?utf-8?B?endQbThrTUhJMHc3M09zUE53VGQ2Qkd0alRKV0h2ZjVwN1B5Q3MySEk3OEJB?=
 =?utf-8?B?bmpuNldLUG5RMlhsMk9UaDhOQWo4ZHZ3UytpU1h3QUx3eldhaWQxcTJFVHhz?=
 =?utf-8?B?VVBlYWlHNGl5S0hsQjZHWUFDWkZQajZCdjFsU0hTdm40LzdIZk5Zb1ZZdHpP?=
 =?utf-8?B?RU5KWDAwbXk1MEtEOTl1UUVVSVh3PT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4df7356-d04c-42a9-5f82-08d9ecbd0405
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 17:44:41.2101 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /FHsc/f2/5OhWB8r9G6MrXHCVj0/Ktcv5sS+9e8X4SXI/Dh7a5y9k7T+LRX3+SAbg+dF1i9NdkbYUirfr4APqqaaSbDCcLFroIgF+Hhu5W0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2697
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe0c::70a
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe0c::70a;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

10.02.2022 20:13, Thomas Huth wrote:
> On 10/02/2022 15.51, Christian Borntraeger wrote:
>>
>>
>> Am 10.02.22 um 15:47 schrieb Vladimir Sementsov-Ogievskiy:
>>> 10.02.2022 10:57, Christian Borntraeger wrote:
>>>> Hello,
>>>>
>>>> I do see spurious failures of 161 in our CI, but only when I use
>>>> make check with parallelism (-j).
>>>> I have not yet figured out which other testcase could interfere
>>>>
>>>> @@ -34,6 +34,8 @@
>>>>   *** Commit and then change an option on the backing file
>>>>
>>>>   Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=1048576
>>>> +qemu-img: TEST_DIR/t.IMGFMT.base: Failed to get "write" lock
>>>> +Is another process using the image [TEST_DIR/t.IMGFMT.base]?
>>>>   Formatting 'TEST_DIR/t.IMGFMT.int', fmt=IMGFMT size=1048576 backing_file=TEST_DIR/t.IMGFMT.base backing_fmt=IMGFMT
>>>>   Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1048576 backing_file=TEST_DIR/t.IMGFMT.int backing_fmt=IMGFMT
>>>>   { 'execute': 'qmp_capabilities' }
>>>>
>>>>
>>>> any ideas?
>>>>
>>>
>>> Hmm, interesting.. Is it always 161 and always exactly this diff?
>>
>> Its always 161 and only 161. I would need to check if its always the same error.
>>
>>>
>>> First, this place in 161 is usual: we just create and image, like in many other tests.
>>>
>>> Second, why _make_test_img trigger "Failed to get write lock"? It should just create an image. Hmm. And probably starts QSD if protocol is fuse. So, that start of QSD may probably fail.. Is that the case? What is image format and protocol used in test run?
>>>
>>> But anyway, tests running in parallel should not break each other as each test has own TEST_DIR and SOCK_DIR..
> 
> Unless you run into the issue that Hanna described here:
> 
>   https://lists.gnu.org/archive/html/qemu-devel/2022-02/msg01735.html
> 

Yes, we can't execute same test several times (for different formats) in parallel.. But that's about any test, not only 161.

And I don't think that it's currently possible that we run same test in parallel several times somewhere, do we? In tests/check-block.sh we have a sequential loop through $format_list ..

-- 
Best regards,
Vladimir

