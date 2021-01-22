Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4101300496
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 14:54:44 +0100 (CET)
Received: from localhost ([::1]:37940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2wtf-0007pt-Cx
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 08:54:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l2wrX-0007Hs-US; Fri, 22 Jan 2021 08:52:31 -0500
Received: from mail-eopbgr10133.outbound.protection.outlook.com
 ([40.107.1.133]:43907 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l2wrU-0006YP-QB; Fri, 22 Jan 2021 08:52:31 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hs3cO7GvmesV9YzYLTieEvoS/KS4mKg+m0aRksSBOVgp4PegoLqIksW0OIkdmJx3f9fMvQ6AydtUhkoaV8tPRZp5lAFTZf+9lr8DKkEMDigP8zFkMs0vN2HNt7kFMfbGEwVTlywNPOib/wF4whdqJSCtJWvCTN/gtwSfagrbp+SjCkGO2/ajVMlS4VC/X+tgKgGiWi2i1kntOwfXzURnHACaWTr5VmcvMjm5z2jXz0gOSxZ8Kl6g2wXn7Ew8ASnkuGDcnSSOsBKxhATEHYuWG0PLwE/UtxJ3rtfHlHRBzH4O9zwfHqKtIsvCpDyM++4sEzT+DOLf3yDnK1lUrJP3JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UNjP+d+l2dP2CxqPd/qQxpZNoAdA1PQSl2q9rgpaW38=;
 b=HBMC7aPXLaZaPmjmI+/WJStm3n369yB8pB11ZXh9jPUBk8bjDrtvbhjA+uKlnHaVFaZ9oKKsRcvGtU3YF3f9rcXhP351lZDPA9MSFKVQ8RQWVx5M/0gO5IRCFGdqbQ4tXRxiOa8TZu64RHURBRdewkm7m9VmMn2jy69u6KB1yrvxPExOzM5bh59ITCE2cv7bwA2cbe/yJFnPFD7r1n59x6MvDT0s4CbbOnKX0B+XQ/m1FG3o5Hoy5cV24GTtKxuzpWKaHhDTkF3JDiegYH3NyeyeicYKaOOSY/RWP1jEgTdn+0QJeBk26j0moiptmONksVjYJPE9pOZMnRNHndtkyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UNjP+d+l2dP2CxqPd/qQxpZNoAdA1PQSl2q9rgpaW38=;
 b=r2NNfWd0VJRDYMqGA1Cnr5CDwp/wRefyP/HQxqe6xuNkCUqKySZ2Jv+miD2wSbUm4JmBVi9noz+HkQAg3DueQKVgoY7SHkslW4PplNRaA23FsmFxJni4ApJZh3k7lIzfPY4vU6EFkFZ8MH+MiaBAwj89VKyZTqjnlw3pSAVBn7s=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19)
 by VI1PR0801MB2015.eurprd08.prod.outlook.com (2603:10a6:800:8b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Fri, 22 Jan
 2021 13:52:22 +0000
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::44c9:5ac7:5302:7179]) by VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::44c9:5ac7:5302:7179%5]) with mapi id 15.20.3784.013; Fri, 22 Jan 2021
 13:52:22 +0000
Subject: Re: [PATCH v7 07/11] iotests: add findtests.py
To: Kevin Wolf <kwolf@redhat.com>
References: <20210116134424.82867-1-vsementsov@virtuozzo.com>
 <20210116134424.82867-8-vsementsov@virtuozzo.com>
 <20210122114815.GC15866@merkur.fritz.box>
 <bc7e60f2-11b2-255d-2d69-cbd1563a0e19@virtuozzo.com>
 <20210122124541.GE15866@merkur.fritz.box>
 <f2db3922-6832-25a5-7bb9-ac24dbb32286@virtuozzo.com>
 <20210122133450.GF15866@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <fc2cc120-7b0e-fb6b-e26b-697c6f9e2d9b@virtuozzo.com>
Date: Fri, 22 Jan 2021 16:52:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210122133450.GF15866@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.101]
X-ClientProxiedBy: AM0PR10CA0018.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::28) To VI1PR08MB5503.eurprd08.prod.outlook.com
 (2603:10a6:803:137::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.101) by
 AM0PR10CA0018.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12 via Frontend
 Transport; Fri, 22 Jan 2021 13:52:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a727beb-4ae3-4394-18b4-08d8bedcf15f
X-MS-TrafficTypeDiagnostic: VI1PR0801MB2015:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0801MB201548A153ED14631A3A7FC6C1A00@VI1PR0801MB2015.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ggchXlIm93RQ+ViEQf+oPQ7QrGQM2QFI5GJJ3uu7olDNvcLvzzle/MFuTGf7uR6+WLhIAXyHNzuNkYhx0T2fiIJ+UCI2CItCi5INjLjHFOqXvNT+YhSgV+1CLXy4t625XXmrfpnj/dU+nhNgPsyqNmO9oE7dfLFLWaPlYoQoqMBInTgmIyOprBXER1CsRrVyVwBqZ941Q/jEr4UbY2PLDOIZXgKsplrOmUZ14Pcp5MWioFYwGVmL9N/IxXkDUhPFWfG987+Ahg2/v4uZjsrSkykibc+98EvdpjlusrQyL1C8M15q7/roDR7WvofrhSYaiyVMIGLnkSVoEkFuE6xWdDp9fqg5TYdq46GiinUmFuAPCItFkFCFce7lgyV0b9tkcP8hXa3K0dpjpmki9npw3NtLzQIMxkflIEdzbhT0SV0RvA+ShiBSexnCl5yx0N4paKs6dyqjzc0rEzAiTs+KKf770DRnA0LhXo3oSzLIioo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB5503.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(39850400004)(136003)(376002)(396003)(956004)(2616005)(26005)(16526019)(4326008)(31696002)(8676002)(478600001)(8936002)(6486002)(6916009)(66946007)(52116002)(5660300002)(2906002)(66476007)(16576012)(66556008)(316002)(31686004)(186003)(36756003)(86362001)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?T2k2dkJ2UkNNamJLeUpDVVJRVEdFM3hwbERHWGVEWjJZTkZvVnRXdnJNOGlG?=
 =?utf-8?B?MVZKeVVoU1FHVzZqUlF5WTQ0ZHY5UTEzY3N3d0dNUnJLQTNzaDlLVHJ5OU8v?=
 =?utf-8?B?NzZWV3FtRWhqazluZnpTMGhXa2Uzem51UGFDVTBJb2l4SXJ3TlE3NSs1SHht?=
 =?utf-8?B?SkFvRk5GT0VSMmZVK2s1WXB6dXFMMWlCNFk2ZXlkdzJNZTMzVFhqbEhldWtz?=
 =?utf-8?B?bmRFUEJ3MVJsTGIvWStwU1kwK1RjK2ZoODFJNWtWMFlZWjhtNjIxaDlnZm41?=
 =?utf-8?B?aE5pMm92WDhmUGFkQ1dQODFrL25mY09RTXpmbHVDT2dqT0o4T1ovaW1Fbkkr?=
 =?utf-8?B?VmpqT3Y4aXpNQWpvaXd4a21yQmd3V0xrYTBzMGpiK0JiUm04aGhqVFFHemN6?=
 =?utf-8?B?MmZ2YzQ2N0pMNzhaVTJQSmIrV0tOUGhzdDZvNGE0YVMrMnZWbEtJRzd6RGI0?=
 =?utf-8?B?MDc1S0tKMGtpemFRSm5UUEFKOW9SS2M4Zkc2dFpMWnJxSGErQXZTdExDdkFM?=
 =?utf-8?B?NDJydWN1VTNVWWFHVDdDaFFIY2lWUjY3MnBvZ0pkVXd4MFJwUU1aKzlkY3I5?=
 =?utf-8?B?SWZtVFV1ZWNVSUlEaHNsZFZBTGNVSUh0NjZKNzhNdHp2SEY4WklGRGJBWWJ2?=
 =?utf-8?B?YzdjaElhOFZFaTJrdU1BSnRyS3lZbDFGbWJqbnQ2NHZ4bzUrUWsxdHkyWW9X?=
 =?utf-8?B?WEJ5aUIwTW1tbnpTcWlNeXYvbEFUQW40bVZDWk5kMnpkYlFid25QUUNJUXJw?=
 =?utf-8?B?KzZZR1JFOEttcGpicG5DVUtZellRNk9BemVCNUl6NytMTXlJcFpXVjZORG5L?=
 =?utf-8?B?b0dSbjZYYXFyYUFydVZaWEw3R3NuRFVmem9EZC9CRlczeU9lMUQ4dy9WUmx2?=
 =?utf-8?B?aUswejhNTHZKSXdaczVVU2FnNjVmT25aK004V0FJUnVHUTZFZ2NoVEhLN1ds?=
 =?utf-8?B?eGczYW1XNlVIMjYwZ3FUcGZ3V0dUMmtRZDhVRDVYWVYyMXhTalprSjFnekhx?=
 =?utf-8?B?QmN3OFdjNU85d3BMWStaVDNxVktxbjlmZGFpbDJpSW5yNXhXUU5JMkFiT3Zk?=
 =?utf-8?B?MldncU5iYUlVb1plQVoreXRLc2YyRW9UZjg4eFdIb2p3L0FZQ2xuczg0ZXUv?=
 =?utf-8?B?di9tcWdzQkxONE1odnd6cnRmSitrVGtjY0Q1T0JxOFZwNVRMU0lCN3ZybGJE?=
 =?utf-8?B?clVVTGhYNXdkR250emYrRmYwNjhJQkhIYWR6QXJzOVI3VkFnRE5JZ0I4dGtO?=
 =?utf-8?B?MlR5TVJDbitaaSsrankydHlXRWpCenZmdkFUWnZHV2dPWFRCWVNvZ01pOWdo?=
 =?utf-8?B?b0c2VGtVMzRIdXQwOWFYejh0RUx6NXV4cWV2V3VIUWkvRk4xS0xydVF6MjRV?=
 =?utf-8?B?TG95VERZZGExSDlZNE5HWlZ5ekRQNmF6TVJpalA1UDU1c2hHQTJiK3kxQW0v?=
 =?utf-8?B?cHM2M2tpa3RDdmRndUh3TVY5NzAwb2JtOW16U1lRPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a727beb-4ae3-4394-18b4-08d8bedcf15f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB5503.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2021 13:52:22.5853 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ISCBOWrUriiFD3EEgWMz5pXSLTxD4aFSE869FMEUWRJqUPEI8SICT2jn7xO4fcGKIxLJJs3gWegqo7vhwRt/gw5aj3GPwi3H2xLSoY2xsDw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB2015
Received-SPF: pass client-ip=40.107.1.133;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.221, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

22.01.2021 16:34, Kevin Wolf wrote:
> Am 22.01.2021 um 14:16 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> 22.01.2021 15:45, Kevin Wolf wrote:
>>> Am 22.01.2021 um 12:57 hat Vladimir Sementsov-Ogievskiy geschrieben:
>>>> 22.01.2021 14:48, Kevin Wolf wrote:
>>>>> Am 16.01.2021 um 14:44 hat Vladimir Sementsov-Ogievskiy geschrieben:
>>>>>> +    def add_group_file(self, fname: str) -> None:
>>>>>> +        with open(fname) as f:
>>>>>> +            for line in f:
>>>>>> +                line = line.strip()
>>>>>> +
>>>>>> +                if (not line) or line[0] == '#':
>>>>>> +                    continue
>>>>>> +
>>>>>> +                words = line.split()
>>>>>> +                test_file = self.parse_test_name(words[0])
>>>>>> +                groups = words[1:]
>>>>>
>>>>> The previous version still had this:
>>>>>
>>>>> +                if test_file not in self.all_tests:
>>>>> +                    print(f'Warning: {fname}: "{test_file}" test is not found.'
>>>>> +                          ' Skip.')
>>>>> +                    continue
>>>>>
>>>>> Why did you remove it? I found this useful when I had a wrong test name
>>>>> in my group.local. Now it's silently ignored.
>>>>
>>>>
>>>> Because now we use parse_test_name which will raise ValueError, so we
>>>> will not go to this if anyway.
>>>>
>>>> So, wrong name will not be silently ignored, check will fail, and
>>>> you'll have to fix group file.. It is suitable?
>>>
>>> It doesn't, though.
>>>
>>> Oh, wait... Is it possible that you lost support for group.local
>>> altogether? grep for "group.local" comes up empty, and add_group_file()
>>> is only defined, but never called.
>>>
>>> So the reason for the behaviour seems to be that it doesn't even try to
>>> parse the group file.
>>
>> Ooops, you are right :( I've dropped an extra layer of indirection to
>> make things simpler and group.local was lost. It's the reason to send
>> v8, I'll do it now.
> 
> You can wait with sending v8 until I've completed review in case
> something else comes up. So far I'm done with the changes to the part
> that I reviewed last time and apart from this bug they look good to me.
> Now it's the remaining patches.

OK. This thing is to be fixed in [10], not here, I'll send a squash-in

> 
>> In a mean time, reverting 06 for now is OK for me.
> 
> Not a big deal if we get it fixed soon, it only becomes a problem if the
> rest of this series gets shelved for a longer time. Maybe we can
> complete it today, maybe on Monday, and then I'll send a pull request
> right away.
> 
> Kevin
> 


-- 
Best regards,
Vladimir

