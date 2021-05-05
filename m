Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDC4373593
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 09:28:12 +0200 (CEST)
Received: from localhost ([::1]:54056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leBx5-0004ta-Dc
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 03:28:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leBu1-0001RX-Cb; Wed, 05 May 2021 03:25:01 -0400
Received: from mail-eopbgr80121.outbound.protection.outlook.com
 ([40.107.8.121]:61159 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leBty-0003S7-83; Wed, 05 May 2021 03:25:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ANeLESJP1TADHnwL3Q8I2zJd1azBv2tvLrupgjUM6Q/CO2CQ8wxYAQqXIXSoMX2NPpnbmsO025rVBARtPLNAlk46GtVmR++4Hgy4I6EcjD25z/yFVKnlxmiU3EaJVb9WmC9Yb71MLyqeHdk35S2WVfDEjtV7MdIgKkxGPIkMoauNu5fQagpcYdJCI3KgA5f7yq9p7UpTBa+yWUZwhu4a8F3ib8I+U8+QunO3O7DqWKwFOp7rssWG408slIwguTlb10IY1phsLQAR0u0waVROsnehXwR2qY8rUpGDaTV5560yqHNG/iuD6XE/jOzCsf1+RReyvGteyMCk1Q95z1Xjlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K8+rUv5hYeoUrOcEfEdHsfVfcPlj51pXzYgpeuDMmXo=;
 b=JLx2KL5wn8P85dj+d9dEeczXN5v0gm+DZ0Gol2rBu7TTD5/Hc095KUDVmSgbnPqVzNw7cajnfsDM34qPRhxfT7H1UN69jXFJqF13Wjpc/mNdLYStdzjyrtkNfLBWONs1NG89T0POs9Kj6LeM7sG5ZQKNLAIiqmzwvkM6bDHHZ7IFFokm4R5Sty+d4u0fWYMDDZlW6f8qyDq4XT5jbA5+8PNaPxIsBbUY5fA9B+sG8nBrodr5pyrfutBVeuUEei+kRzQqrxTnInLopDsXV0JDo8b+KqNnEzBwsUL6kiqpOIgXLof2WfhYS5JE60uvrH4txb6Jb6MpZ+JGahaWSw1iUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K8+rUv5hYeoUrOcEfEdHsfVfcPlj51pXzYgpeuDMmXo=;
 b=FvjgnxdfVyCA36+i+C8+E0/R0tGCyIdKqQ7Cym5QfQoeNICu/Jg7H4nZZfUznFcjE1LnjoBamKqf1pwGjQyMTma5KDcFP1CLliWtoFlATkbF9tgPgTPtCgi8QJ8KKgjYqMIvh55gkoiBfgJPmSYNMu3C/R8oCjMcRXXVk1XYzoM=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6533.eurprd08.prod.outlook.com (2603:10a6:20b:33e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Wed, 5 May
 2021 07:24:54 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.026; Wed, 5 May 2021
 07:24:54 +0000
Subject: Re: [PATCH v4 00/36] block: update graph permissions update
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, armbru@redhat.com,
 fam@euphon.net, stefanha@redhat.com, jsnow@redhat.com, mreitz@redhat.com
References: <20210428151804.439460-1-vsementsov@virtuozzo.com>
 <YImVYUQbIZC9T3Pz@merkur.fritz.box>
 <5dcd13aa-71cb-dccd-bdf2-20a024685aca@virtuozzo.com>
Message-ID: <04a53b33-3a7f-2a7b-09ba-aa83e8f9bf18@virtuozzo.com>
Date: Wed, 5 May 2021 10:24:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <5dcd13aa-71cb-dccd-bdf2-20a024685aca@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.236]
X-ClientProxiedBy: AM0PR04CA0064.eurprd04.prod.outlook.com
 (2603:10a6:208:1::41) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.236) by
 AM0PR04CA0064.eurprd04.prod.outlook.com (2603:10a6:208:1::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Wed, 5 May 2021 07:24:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82f66055-81e1-440f-7e95-08d90f96e114
X-MS-TrafficTypeDiagnostic: AS8PR08MB6533:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6533D9626F2AB5AFB4BEAC03C1599@AS8PR08MB6533.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iMwvxfap2ndDTcgXt7ItEZrHSSiobegOrCW7KtEHehfc+IgNPJbecpQe006kSIiiG9TPOAJWBrdG465+pAEcp5KqH+0A31jSoZdU9LiP50mN03/HX2bFngjJIEyjbfALsjhUTpClYBSHvKVxhNq0tN98LSzmzHR+nJw3vQ9gwh1mB4RuklarkF6LTYzaPPxO91qmPeH6GhePr1uWWc7rTyLUiJfrEpnBTAl5e+AvNS5SveY84J178UEFGDS2bsoUTLYj34Bi0NtXwmavCJBgr1RUm+8QMM/1qTfJbtORD5aCDA5k4qBIx4C2xdh6kvQ6iZOHn2UeWOnozx962V3okGn8NQdKS64SvLjEAAXt0KnERHhIOWNuV/c3Srk8BSqH+nP3W+lLGYwJ7BQU6X/2N4MinrXLXruCouTY1zB4jnAcFlbhREVOiwC0MR1KbDep8CBS9g7BghDXOPgUNs+F/vU4RLKweVUFkCmY6yci3kqtt9ENxtTdakZ5nPMUs2Et2FQdO/8dBCFABSurJ7Z4WUB18EwyXCEjaJ4/X8BUvO/aDv1CS9L7iGb+ZmVYnwF9hmM/OfW5meJNx8+jGRc2qmnlo9BUjpiin6Pv0lo+zMUJ0pYXJ72TGXT+2Fn+ofXHgr3VR13SPMhFN9TsaFSdgXuyP3A3ZnslWsRwkCZknNi8tb1+az4LMlwFThkXWI1XqcqKg+MT9snScpbA51eEQ/DLo8cbl0mN+2pTsQ4D5lBhVA+HFEArdWRr/4roB8VzperyRtM0vFkjb6Z8UR7Jv8gRq67/Wax3k/BdoS99y9Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(396003)(346002)(136003)(376002)(86362001)(956004)(36756003)(316002)(2616005)(16576012)(31696002)(8676002)(16526019)(6916009)(186003)(31686004)(4326008)(66946007)(66556008)(66476007)(5660300002)(6486002)(2906002)(966005)(478600001)(38100700002)(38350700002)(52116002)(15650500001)(26005)(8936002)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?V05nWHN5c3E0bUxDT2RRa1Izd1BMMWh5Q0dZRktSRVFYeUhnTVFZREsycXk5?=
 =?utf-8?B?OEwwcFdpbm15K2pxSVR2RDNGak4wMGpDTldtSGxTZzZ6WWQwd0VxYVN6REw5?=
 =?utf-8?B?WjZCK0FkcTZPL2gzNFpvSmR1VWYxVjM3MXJaRDhuVVJFVnJGVTA1Z1UzNVFD?=
 =?utf-8?B?RFpPdnhrR2doVXlZVGlGTjRkNlM4d2hqZGhTMHkzRDFDYmRFTHVNVEU2S3dL?=
 =?utf-8?B?R1pmbHFJYUZBMXdLb0dRVll4ZFlBNDFCd240b1R2VXJiTlBWOGNoTnBrb2pz?=
 =?utf-8?B?TGFhRyttWFFTVjBwYXlrZEt4NUNDczQrdy80ME40bWRwb3M5eVRkQmRwa2Jh?=
 =?utf-8?B?Vk4vMUdlMU9wSm9HUmQzMmJIbXBHc1RqUHlEWjVmUkFvT0t5N3UxKzRBZUYx?=
 =?utf-8?B?QXFJWWV0bzBZd3JzaGJtaHZkc0RVUGptOUU2MnZuNGJpZkFLTFdLWkp6MW13?=
 =?utf-8?B?NktLNXFoeDB2ckNUbzdMQUYxbWtEN0NQT2VPVUIwOG8vaGE0OFc0OVZjVkxq?=
 =?utf-8?B?MjBYYm4wS2gwSkVFWTJidFd4Uk5CTTlKeDBxdTY1bmUxQjdPN0JJcjZaYlA5?=
 =?utf-8?B?VG1RV2FNbVYvYlY3SjJRdkVzWUFFc3N6dkppR0h0dU5uWUk5R2lPVnJpeFNH?=
 =?utf-8?B?UitZTGt3ZDRlck9xMFdyWFhOVTRxOGhpK0MvWnlYSmVNREc4cERDR0RLcVFn?=
 =?utf-8?B?cjZjaVlVMndQNUs2NkZ6MVgyTzcrb1VKK0VuVmQxVXQwR1RFQUU4cTR6RytU?=
 =?utf-8?B?amdYWGhjS09sM0VYM1p6UzRaa0ZPR2c5NWVreEZGb3dFVWlYaW1ETnJqZE1N?=
 =?utf-8?B?bmFZaGJKL0R5T2R3RnBOZnh3bGQ4YkVXNVpiT2lrSnI3Smp6Y1R1RC9aVFJZ?=
 =?utf-8?B?d25DOUEwZ21waTZqamZmOGtNbTFhRFl4VXRGc1d1Z1ZrQXpVZFhnRmpCYmsz?=
 =?utf-8?B?KzBxN1Y4ZUUvMXhZZjZIMFp3NnVuM2EzOFlabkNtbDRLQzQ0cW0xMHgvWjAz?=
 =?utf-8?B?RVk0NGRHb1JXZnEwS01Pd2JJWm11Y09yOTRGUEZNQmxQMEJLTFd1QXoweUVV?=
 =?utf-8?B?Z2kzcG0rQnNJWG9rdllIV0Z5YlpGMkhpblNtNkU4UWhNdXYvcTlic2FoQVZY?=
 =?utf-8?B?Vk43OXhKK2d2THRtbCt0Vi9RQitkMlJEN1N5Q0JDekhkVkxKVENTNUVnUkpS?=
 =?utf-8?B?cEl1NU1sSnA4ZXpBZnN4UHorYzFkQXZjQ0cwWitONDVidUZHalpzZUlnS1VU?=
 =?utf-8?B?TnZiU2pEa1FqWktxNjlXTlF5L0thdEF4R0lialRlVUYwTkVBUVhRODlEVDNB?=
 =?utf-8?B?dDhwdVhyRXpMdGVxUCsrN1hxMGRPMnY2UTNmVFRaK1hBcGFFT0gyVVBubW9Y?=
 =?utf-8?B?Y0dHQ1VYRGV0TTZsaU5ZRTJIa25IcUZHT2kyUDh0SEhrNitsTlVSeXFKZURK?=
 =?utf-8?B?My9xR3FoQzBlR1V5L0k0aVozRzJ4cmk1RGFsU0hxNjJkZENkb0hQTWZEb2Ni?=
 =?utf-8?B?cUtYTDFDcVo5MnFjS2tYc2FORjVUMkx2aHRyRFRWbGdWZmlUT3RDOHJRVnc4?=
 =?utf-8?B?TTI0Tzh6Nk5TQ2RJbUJ0S0FNSnNUQStLYXpQS1MyTGhoM1E3UktEazdDY015?=
 =?utf-8?B?SzcvSFVKY01uOXJmWjFRQzBYYXcyUjRKTHc0b01hWmQxbzRxTWRtQi9EZ1VG?=
 =?utf-8?B?MXhxek5ER21jTzhmb1pGU2g3MitabUszLzB4VU9hdUt5b2Z3RUpSZHhyY2Vl?=
 =?utf-8?Q?6kC0prxziZlC0GDAMyxAPgObbXsU+xSuoGjdUoP?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82f66055-81e1-440f-7e95-08d90f96e114
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 07:24:54.6010 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3JNVbKlImhPcNdoSqG7qeHBIYumIRi9bApTvk2354WZ4HYldthlT2m7IlwSd0mYy+OfcQNoqjCC/Woum4sJ5pFiHoV/b2W0UFIoCWaL35UU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6533
Received-SPF: pass client-ip=40.107.8.121;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

28.04.2021 22:50, Vladimir Sementsov-Ogievskiy wrote:
> 28.04.2021 20:03, Kevin Wolf wrote:
>> Am 28.04.2021 um 17:17 hat Vladimir Sementsov-Ogievskiy geschrieben:
>>> Hi all!
>>>
>>> And here is v4.
>>
>> Thanks, applied to the block branch.
> 
> Thanks! And thanks a lot for reviewing!
> 
>>
>> Though the error message shown by the test in patch 18 does need some
>> improvement on top. We should probably name both conflicting users and
>> who blocks whom in a way that is neutral as to which user is the new
>> one.
> 
> I'll look at it next week.
> 
>>
>> Also, curious that again patch 7 (and only patch 7) got From: mangled by
>> the mailing list. Seems there is something in it that Mailman doesn't
>> like?
>>
> 
> Very interesting.. Curly braces in subject maybe? But I think, that not a first time I use them..
> 
> 

And now I think that is the reason.

Look, in my 64bit block-layer series, first email is mangled, and it has curly braces in subject too:

  https://patchew.org/QEMU/20210324205132.464899-1-vsementsov@virtuozzo.com/


I'll resend 64bit series soon with s/{}/()/ and we'll see if it help.

-- 
Best regards,
Vladimir

