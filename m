Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B27C4431B2
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 16:27:53 +0100 (CET)
Received: from localhost ([::1]:44786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhvhX-0003xi-EU
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 11:27:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mhvEv-0001yB-CY; Tue, 02 Nov 2021 10:58:18 -0400
Received: from mail-db8eur05on2139.outbound.protection.outlook.com
 ([40.107.20.139]:22688 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mhvEs-0003Nj-7P; Tue, 02 Nov 2021 10:58:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eX5zH6BN8Me3Q+fUNTfG8tzehmNlxG1VT7JoIxeJWwcn+kpnlg1a7/+yx3JIqw6QDu9BQhegB2h6aQAG6BfGy2MUWixBw/BLU762ELDQRFdvi79u3K8pqCeZ+Wyl/Dbhwfa8Og4j/EIn0OrMSQyQVrN5IP2m/MEcE2S4cyyvJNFLKjTuoeSMtJlOiF5QKJIrlQRfX6aQukuDNDxBs98mkcs6YCy6h2P8AvInk5OUqJ9spW03xEQPGK+aNwskDk461EL2QFqqmU0NYRy1jJkFBOg34PxkvlDYOcdxqreBy5SgKr+O3QR8Zh0JtxhBZ9T8X52rF/3Zio2ND39lQmp5rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=whFCQJjnzpMX4jvXoSXTvBGkDRuWLD+OsYh31dW1CB8=;
 b=KPqTRmrU0ABLWUNOF8fPtw1ZGJuzUy2sRO30k5mabPOX6Db5q6vVzbXdRX7Wl61WImeni/Q6xSLlyhLId1jRw5hW+3vw1UR1fkXhE/QnLDNdHtmCm3hC7zacPOxHqu6e93MOK4ySGnvKdSB5I4jYMeH+DqNx88+qlCC/rZCHK7MsgDZCIwSRkbTHr7BEVPJX0XrNXp1n0GiokCapuJdlCxGlet3pPejNnDLVEC04wL/4tF1jBFH2+L+SHy7tXERQJO9DlCOy+w8k3u4XkKhCFdrqmmd6pjaNk52VEO2JXN/b98rfIaboGXOW8BpuNiPy2Avp51lp+JK2zYySUbrz2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=whFCQJjnzpMX4jvXoSXTvBGkDRuWLD+OsYh31dW1CB8=;
 b=FB9wb2hiVTn5yTaxw3vDqrGCTHWgeBxCXPyzI2v9knWdNowQ8FhqH974TbBKA8Q1sUV61prUDF/S0I1BFSQZWh3F/T6Xch4oszhxioqIBLUexaARaojY6Sd7CbIM7yrXvXDshypXzHIBfoKUEoSg3R9poj0eJYlFerSTaqydVrk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5253.eurprd08.prod.outlook.com (2603:10a6:20b:ec::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Tue, 2 Nov
 2021 14:58:09 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%5]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 14:58:09 +0000
Message-ID: <e36b9943-917f-ec30-1f88-93f98d28cf69@virtuozzo.com>
Date: Tue, 2 Nov 2021 17:58:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC PATCH 00/15] job: replace AioContext lock with job_mutex
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
References: <20211029163914.4044794-1-eesposit@redhat.com>
 <dd430e7e-d45c-038f-d571-9be2a0823ee2@virtuozzo.com>
 <4d2184cf-7e4f-97de-484d-ddc11ae5c6d8@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <4d2184cf-7e4f-97de-484d-ddc11ae5c6d8@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0049.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:7f::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.243) by
 AM6P191CA0049.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.15 via Frontend Transport; Tue, 2 Nov 2021 14:58:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e77d76a-5984-477a-8812-08d99e112f1b
X-MS-TrafficTypeDiagnostic: AM6PR08MB5253:
X-Microsoft-Antispam-PRVS: <AM6PR08MB525369C3223C082B04FD43FEC18B9@AM6PR08MB5253.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HRF9HpGgleiCImTmnlZCj7rvUUEzD6y4RFH/vg5wLpO8hG4cFqpC9lOoU882LlalOFI82BfdxnvXmMwGpD4JnQfdsuCias2H9efStL49ovt/WtxYxlsRQ1HlZLqXpvJa3+L0fOF7Lyesv004ZNE63MMrw9JzbvrsYYmiFvcsEk5GqywS8A10eXSQfzW3ACcsFkZiefNQdtNPSzbcftMzLYPP/jO8qT9yqRzxBQutb0sI8C8KL/UOlZ6xJA0F88rBUfJu2ZNu92gDO4Atgwyk/X4X5ePFIcs+Nvfn+o4I4j0YxxKmMXvyaHbYwiW6TBNachbDdK7S/hp2Re1RAAnDVSN8Le/DXkA15dDSl7gZwUrxwMsuHo0lPPZ1oe2d08ONhSu+p8KiW3P7A2GKrZyhCvTFOx2PdsfzbkqOtJVaPgHQlXpdPquPWKwc8Y/fV7rIcXIwJHIP+utjbSSZhUGZ5l1o48hSTtKi2yfthnQ5BAKIDTh2+Sox1fVoYMLPW2IyJ5G8x2qeYcpyw7Njx1uTPROlqUWSLIi55yueDZN5YKrq8AfvTV2Hg03LHD8yIKk6ps2PKptMpOn7kcc3PuetGsv3XhWaKlxtoAxagnHa7xSpRLXQ44HEx33BlaJpj6S9NDt0kryzPLXVGvtb6FYVwArQlqMHZwTOar0PNbSI/N3HQepXWPgEbAi7RKJHH0NUgKqtiuAmIwyfTwLZl6GFpThw2MvCFk8JxIG3Qx2vVX/CMNqmgLFaKOx1CZ9fxvwhh8GjdeO0nkklYVclbNDgyA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(6486002)(83380400001)(5660300002)(8936002)(66946007)(54906003)(66556008)(66476007)(53546011)(4326008)(508600001)(52116002)(36756003)(31686004)(2616005)(956004)(2906002)(7416002)(8676002)(16576012)(26005)(316002)(38100700002)(38350700002)(86362001)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFIxYTVhZmRCdFNoYkxGcjJxcWM5VUFVdC9CWFNKTWk3OFhrQ1FVMUxzL2l0?=
 =?utf-8?B?S2J1YlorZzgzV2FoY1lkSE5keFZDVjZRdFJyTGFyUzBPdUtyRk8zT1htM3VQ?=
 =?utf-8?B?N1pleUplOTVweWVGQ2w0cXQ3d05KZkw4TzRPR2F5YVFWZ0FoMEpPTnRCdFV6?=
 =?utf-8?B?Y1NMQllKU2NZVU52dzFPMjJLT3YyWEhsZXlFNkhyNFpEMmFkNWlybDk4SGxH?=
 =?utf-8?B?cHNoNHNiVG53MURBSkNpa3ZubmphUklhZlVXQWhKbnBZaEQvdHNlQ2xwSi9Y?=
 =?utf-8?B?TG9FVGNoV2ZENG1WemJ6UnNKMjhkYVBidTFTRFJzdS8vZERNTkRuOEVoNU9M?=
 =?utf-8?B?VDZUdHIyMEx5VVdtU2pSMzNjeVMvVVFxYzZZR0lCT3RNUnhpRlNnKzlHeHlU?=
 =?utf-8?B?QnNZUkNpWWU1bmlub0ZiS1grUDNoR0U5QXhpRkxYM3p3UTMvTlFzVmt5akFE?=
 =?utf-8?B?b2NjQ0x3dXdIbWFNMFQ3YTIzWGpJNlNXcUpnd3B5ZWNRTUJnVk1HYVRKb2NK?=
 =?utf-8?B?QVc2ODhzK3R2ZEdhcjM3NnZuSGZOSGFMOGFBYTkyQi80a3dJVWNyTEtCaytx?=
 =?utf-8?B?Q3BEZzdaM3VuYm00SGxsMWNJZGVCWitTU1huTWphN2hBbEhjRUtzeXk2aWpp?=
 =?utf-8?B?eVZkY1NmL0dINmNnUm5mdXV3aTF5L0xyWUZpTzVJVVg3MkcrWERKdGtLbEFk?=
 =?utf-8?B?NDZVNzN6T05tOFRhNmVTTG1sRlV6K1VMdkFYbHplOTB6cm51N3BMQTNrUTJ0?=
 =?utf-8?B?bDcvTEE3TGxHNWJjd0dxdVdVTXRvOE4rQjcwSitISVcydGFwVk1mSUpqcDhM?=
 =?utf-8?B?NGt2R1VEZW1FVkFNWkRFRytRVERrZmJtYUpJQVEvcS96ZmFKVzc5YWFZWWhY?=
 =?utf-8?B?cm5UZjhtVXBjSHpGNEJsR25mSEd0SHB0Z0RkRmZwbFptYytrSzBUQVFhOWRq?=
 =?utf-8?B?cUVvK3NpY2wwdnVIbUoxQkRxbVF4d2lBcUpvQ2lvL0JVZ1FhWDRHdVZJS241?=
 =?utf-8?B?T2d1b1dqM2JCYmtWbTZxcG13RXg2TG53YkRMVzViZFF4R05QNUoyS3Y5UUVt?=
 =?utf-8?B?aXFZenBRbW42d0RzUHMyaVZlWmVxemR5cVg3VmRZUmZKMk9VNjBCQzBHbDl2?=
 =?utf-8?B?MGFKSzR5cDRabURhd3hVTEFOeDliV25kdTBsc2Z4S2pSenk2bXF2ODZHcENP?=
 =?utf-8?B?bTBZOUZRN2c5eHJQU01obzZGSTBDdWw1eXJPZEdEWWprNkRtVDN3ZmdBZ3Iy?=
 =?utf-8?B?b0lwWXhQRnY0MStDT2QybTlvQWFZaEk3M1F1RGRUT05kTzZ0ZEVmQjRQdWRU?=
 =?utf-8?B?MVRsalJnZTJOV1lLMVdFS1UvL25FMkJDVEVRbERMMXkxWVVFYVQ1Y3ltOHBr?=
 =?utf-8?B?MTFpS0lWdG5pQmxha011WU9rZVMrYmorRDBPSHNKZldLSVFVTTFjU2RUMkVr?=
 =?utf-8?B?VEptVnJMRy9kalRQbXBkSHpFd2psSlh6RHJXTm9VUFZNRGw5dHRDZ2I3VWZP?=
 =?utf-8?B?aTFHL3NPNndDdnJSRDhXb0pjTkVSM3RVQ1R6WlBKMFFMNXdqaC9sWjUrWWVh?=
 =?utf-8?B?N2tSejNNTDFFM1Njay9CUGJ2K295dUZOK3ZISTV1dmQwSTJidWdERkQ2ZmFr?=
 =?utf-8?B?LzgyMFM4dnBUWTlGMzVubnlqNkdTNVp5RVhpZ3J4bU50U3VPNUl6N2VGelor?=
 =?utf-8?B?VkxoNFo1ZEZrYVdlNnpTQ3dqQmlxMVRrVzY4dkJkcUI5NndoQSt2bEZsWGtP?=
 =?utf-8?B?L2Jxb2QrRHp1cmpJZnppb1p0aUhaN29zbjFmZkNPOUxLUVJLR1JUTE9VZ24x?=
 =?utf-8?B?TVFCQTN2ZzEzQlVUZlVQRmE2TGJkaXVYY1FIT0J2WG1pM1hob1Erb3dQYklB?=
 =?utf-8?B?NFg1ZGVzR0ViekJUeUtoMUkxQjFmN0JYcm5Od3MxMFBucW5UUGdwQit6U0xY?=
 =?utf-8?B?SlJNOXo0Y2tNeGdxeDlFM0F3VGloUm55a2xjNzd6elIvTkpRU2JNbVNvMVhm?=
 =?utf-8?B?ZGt6L1BFQ1NBNnJoUUlUNWhtZEVsU21nK3prQjZzS21Pc0lxOENxRGxxTnEx?=
 =?utf-8?B?cHJDQS8zNHZ4eExsMEF4ODFQVkcxOUxVbjhMQ3dqdk1xOGMwNENxZGJTUXIr?=
 =?utf-8?B?ZlhLN2RYUktKbGFyMWQwYzc1VjRLenI3VGxneHcwYWE4eVNQWW1mMmxpb2tJ?=
 =?utf-8?B?UkJHcXYyUnRsQlo0dTcwSFU0S3pYUzhDQ0tQT0xxVG1teXczd3hhL2pacFNG?=
 =?utf-8?B?UkoycWxNN1NjT2FrcXRMcS9nQnd3PT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e77d76a-5984-477a-8812-08d99e112f1b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 14:58:09.2537 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cEHyuM4j45xBSel9cr18LWh+Ud4Zxz8LwsM/PXcARCp6sRQGWzuo3r956JUlMJ6wUfbPpSgiFXZKbPkowK/oQ6M9nonWFQtVgA4Ij4s0aXs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5253
Received-SPF: pass client-ip=40.107.20.139;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.549, RCVD_IN_DNSWL_NONE=-0.0001,
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

02.11.2021 17:13, Emanuele Giuseppe Esposito wrote:
> 
> 
> On 02/11/2021 14:08, Vladimir Sementsov-Ogievskiy wrote:
>> 29.10.2021 19:38, Emanuele Giuseppe Esposito wrote:
>>> In this series, we want to remove the AioContext lock and instead
>>> use the already existent job_mutex to protect the job structures
>>> and list. This is part of the work to get rid of AioContext lock
>>> usage in favour of smaller granularity locks.
>>>
>>> In patches 1-3-5-6-7, we split the job API in two headers:
>>> job-driver.h and job-monitor.h.
>>> As explained in job.c, job-monitor are the functions mainly used
>>> by the monitor, and require consistency between the search of
>>> a specific job (job_get) and the actual operation/action on it
>>> (e.g. job_user_cancel). Therefore job-monitor API assume that
>>> the job mutex lock is always held by the caller.
>>>
>>> job-driver, on the other side, is the collection of functions
>>> that are used by the job drivers or core block layer. These
>>> functions are not aware of the job mutex, and delegate the
>>> locking to the callee instead.
>>>
>>> We also have job-common.h contains the job struct definition
>>> and common functions that are not part of monitor or driver APIs.
>>> job.h is left for legacy and to avoid changing all files that
>>> include it.
>>
>>
>> Honestly, I don't really like the idea of splitting:
>>
>> 1. It's not a functional split: for some functions we have a locked version in one header and unlocked in the other. But actually they are the same function. I'd prefer such wrappers to live together. All the declarations in the headers are about one thing: Job.
> 
> This is something I thought made sense, but I understand that it can be confusing. We can also have both versions in the same API. In the end, remember that we are talking about only 2 functions: job_is_ready_locked and job_early_fail_locked
> 
>>
>> I think, splitting make sense when we really split things, split objects into some separate entities. But here you just use different header to group functions by some criteria not related to their action. I don't like it.
>>
>> I think, it's enough to specify in a comment above the function, does it need locking or not ("foo_locked" naming helps too), and different headers doesn't help to understand code but make it more difficult.
>>
> 
> I think that having a single comment above a group of functions does not help, because one might forget about it (or the function is far below the comment) and insert a new function in the wrong category. Adding the same comment to each function makes it redundant IMO. And btw each of job-monitor functions has the following (redundant) comment:
> 
> Called between job_lock and job_unlock.
> 
> Splitting an API in two files might force people to notice that there is a physical separation and reason between the two APIs, other than the fact that it will be easier for the reviewer to notice if a function is added to the wrong API.

But how this splitting help someone, I don't see?

With splitting:
- reviewer should check how locking works with new function, does it need locking.
- check the function comment
- check that function is in correct file

Without splitting:
- reviewer should check how locking works with new function, does it need locking.
- check the function comment

And where is benefit?

When I want to understand, does some function needs locking or not, I first see at the comment above function definition or declaration. If it has comment about locking - great. If not, I have to look at function body.

You say comment is redundant. I don't think so. It's the most helpful thing. And such comment in Qemu is a common thing. Splitting locked/unlocked functions into different headers - I didn't see such practices.

So if we chose this way - we'll split all other headers related to objects with mutex to locked/unlocked API header. I don't think we should do it.

> 
>>
>> 2. I don't like file names:
>>
>> "job-driver" for me sounds like something about JobDriver struct. 
> 
> Well it is actually related to the JobDriver struct. It is used by the files/function that implement a JobDriver, like mirror, commit, stream ...
> 
>> "job-monitor" - unclear. You define job-monitor as functions mainly used by the monitor. But actually they are used by other code paths as well.. Also, jobs don't directly relate to monitor, they are abstract, so no reason to establish such a relation in file names.
>>
> 
> I think you got the reasoning behind those but just in case:
> 
> - job-driver.h : used by the "drivers", ie those who implement JobDriver/BlockJobDriver callbacks. Drivers have no knowledge of the job lock, so all functions acquire and release the lock internally.
> 
> Yes, in *two* cases I kind of broke this rule when I implemented custom job-driver functions like job_enter_not_paused and job_not_paused_nor_cancelled to avoid TOC/TOU, but I am not even sure whether they are necessary or not.
> 
> - job-monitor.h : used by the monitor API, but not only there. The main idea of this category is that the functions assume that the lock is held. Therefore they can used together in the same critical section and avoid TOC/TOU conditions.
> 
> Maybe job-driver and job-unlocked?
> Feel free to suggest new names :)
> 

I prefer the name to represent the essence, i.e. "what it is" instead of "who is intended to use it". As "what it is" is more stable and independent of context.

job-unlocked - is unclear. Does it mean functions which DON"T NEED locking or which DON"T DO locking? But yes, we usually call functions that NEED locking foo_locked()..

So, if split, I'd call them job-locked.h (and only functions with _locked() suffix here to make it clear, so, we'll have to rename a lot of functions), and job-self-locking.h (and here functions that take job mutex internally).

But again, I don't see a benefit of splitting into several headers and only see that it would be harder to maintain.

Also, I don't think that you need this splitting for your series.

You can simply do "job: replace AioContext lock with job_mutex" without splitting - it will make the series two times shorter, moving the focus to the main thing you want to do.  Splitting may simply be done in separate.

-- 
Best regards,
Vladimir

